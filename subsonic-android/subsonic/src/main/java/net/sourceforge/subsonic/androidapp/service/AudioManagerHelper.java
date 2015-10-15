package net.sourceforge.subsonic.androidapp.service;

import java.io.File;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.media.AudioManager;
import android.media.MediaMetadataRetriever;
import android.media.RemoteControlClient;
import net.sourceforge.subsonic.androidapp.domain.MusicDirectory;
import net.sourceforge.subsonic.androidapp.domain.PlayerState;
import net.sourceforge.subsonic.androidapp.receiver.MediaButtonIntentReceiver;
import net.sourceforge.subsonic.androidapp.util.FileUtil;
import net.sourceforge.subsonic.androidapp.util.Logger;
import net.sourceforge.subsonic.androidapp.util.Util;

/**
 * @author Sindre Mehus
 * @version $Id$
 */
public class AudioManagerHelper {

    private static final Logger LOG = new Logger(AudioManagerHelper.class);
    private static final String EVENT_META_CHANGED = "net.sourceforge.subsonic.androidapp.EVENT_META_CHANGED";
    private static final String EVENT_PLAYSTATE_CHANGED = "net.sourceforge.subsonic.androidapp.EVENT_PLAYSTATE_CHANGED";

    private final DownloadServiceImpl downloadService;
    private final AudioManager audioManager;
    private final RemoteControlClient remoteControlClient;
    private final AudioManager.OnAudioFocusChangeListener audioFocusListener = new AudioFocusListener();

    public AudioManagerHelper(DownloadServiceImpl downloadService) {
        this.downloadService = downloadService;

        audioManager = (AudioManager) downloadService.getSystemService(Context.AUDIO_SERVICE);

        ComponentName mediaButtonIntentReceiver = new ComponentName(downloadService.getPackageName(), MediaButtonIntentReceiver.class.getName());
        Intent mediaButtonIntent = new Intent(Intent.ACTION_MEDIA_BUTTON);
        mediaButtonIntent.setComponent(mediaButtonIntentReceiver);
        PendingIntent mediaPendingIntent = PendingIntent.getBroadcast(downloadService.getApplicationContext(), 0, mediaButtonIntent, 0);
        remoteControlClient = new RemoteControlClient(mediaPendingIntent);

        remoteControlClient.setTransportControlFlags(RemoteControlClient.FLAG_KEY_MEDIA_PREVIOUS
                | RemoteControlClient.FLAG_KEY_MEDIA_NEXT
                | RemoteControlClient.FLAG_KEY_MEDIA_PLAY
                | RemoteControlClient.FLAG_KEY_MEDIA_PAUSE
                | RemoteControlClient.FLAG_KEY_MEDIA_PLAY_PAUSE
                | RemoteControlClient.FLAG_KEY_MEDIA_STOP);

        Util.registerMediaButtonEventReceiver(downloadService);
    }

    /**
     * Broadcasts the given song info as the new song being played.
     */
    public void onNewTrack(MusicDirectory.Entry song) {
        Intent intent = new Intent(EVENT_META_CHANGED);

        if (song != null) {
            intent.putExtra("title", song.getTitle());
            intent.putExtra("artist", song.getArtist());
            intent.putExtra("album", song.getAlbum());
            File albumArtFile = FileUtil.getAlbumArtFile(downloadService, song);
            intent.putExtra("coverart", albumArtFile.getAbsolutePath());

            RemoteControlClient.MetadataEditor edit = remoteControlClient.editMetadata(true);
            edit.putString(MediaMetadataRetriever.METADATA_KEY_TITLE, song.getTitle());
            edit.putString(MediaMetadataRetriever.METADATA_KEY_ARTIST, song.getArtist());
            edit.putString(MediaMetadataRetriever.METADATA_KEY_ALBUMARTIST, song.getArtist());
            edit.putString(MediaMetadataRetriever.METADATA_KEY_ALBUM, song.getAlbum());

            if (song.getTrack() != null) {
                edit.putLong(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER, song.getTrack());
            }
            if (song.getDuration() != null) {
                edit.putLong(MediaMetadataRetriever.METADATA_KEY_DURATION, song.getDuration());
            }
            Bitmap bitmap = FileUtil.getUnscaledAlbumArtBitmap(downloadService, song);
            if (bitmap != null) {
                edit.putBitmap(RemoteControlClient.MetadataEditor.BITMAP_KEY_ARTWORK, bitmap);
            }

            edit.apply();

        } else {
            intent.putExtra("title", "");
            intent.putExtra("artist", "");
            intent.putExtra("album", "");
            intent.putExtra("coverart", "");
        }

        downloadService.sendBroadcast(intent);
    }

    private void requestAudioFocus() {
        LOG.info("requestAudioFocus");
        audioManager.requestAudioFocus(audioFocusListener,
                AudioManager.STREAM_MUSIC, AudioManager.AUDIOFOCUS_GAIN);
    }

    private void abandonAudioFocus() {
        LOG.info("abandonAudioFocus");
        audioManager.abandonAudioFocus(audioFocusListener);
    }

    /**
     * Broadcasts the given player state as the one being set.
     */
    public void onPlaybackStatusChange(PlayerState state) {
        Intent intent = new Intent(EVENT_PLAYSTATE_CHANGED);
        Util.registerMediaButtonEventReceiver(downloadService);

        switch (state) {
            case STARTED:
                audioManager.registerRemoteControlClient(remoteControlClient);
                remoteControlClient.setPlaybackState(RemoteControlClient.PLAYSTATE_PLAYING);
                requestAudioFocus();
                intent.putExtra("state", "play");
                break;
            case STOPPED:
                remoteControlClient.setPlaybackState(RemoteControlClient.PLAYSTATE_STOPPED);
                abandonAudioFocus();
                intent.putExtra("state", "stop");
                break;
            case PAUSED:
                remoteControlClient.setPlaybackState(RemoteControlClient.PLAYSTATE_PAUSED);
                intent.putExtra("state", "pause");
                break;
            case COMPLETED:
                remoteControlClient.setPlaybackState(RemoteControlClient.PLAYSTATE_STOPPED);
                intent.putExtra("state", "complete");
                break;
            default:
                return; // No need to broadcast.
        }
        downloadService.sendBroadcast(intent);
    }

    private enum AudioFocusState {
        GAINED, LOST_TRANSIENT, LOST_DUCKED
    }

    private class AudioFocusListener implements AudioManager.OnAudioFocusChangeListener {

        private int volume;
        private AudioFocusState audioFocusState = AudioFocusState.GAINED;

        @Override
        public void onAudioFocusChange(int i) {
            switch (i) {
                case AudioManager.AUDIOFOCUS_GAIN:
                    LOG.info("onAudioFocusChange AUDIOFOCUS_GAIN");
                    if (audioFocusState == AudioFocusState.LOST_DUCKED) {
                        audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, volume, 0);
                    } else if (audioFocusState == AudioFocusState.LOST_TRANSIENT
                            && downloadService.getPlayerState() == PlayerState.PAUSED) {
                        downloadService.start();
                    }
                    audioFocusState = AudioFocusState.GAINED;
                    break;
                case AudioManager.AUDIOFOCUS_GAIN_TRANSIENT:
                    LOG.info("onAudioFocusChange AUDIOFOCUS_GAIN_TRANSIENT");
                    break;
                case AudioManager.AUDIOFOCUS_GAIN_TRANSIENT_EXCLUSIVE:
                    LOG.info("onAudioFocusChange AUDIOFOCUS_GAIN_TRANSIENT_EXCLUSIVE");
                    break;
                case AudioManager.AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK:
                    LOG.info("onAudioFocusChange AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK");
                    break;
                case AudioManager.AUDIOFOCUS_LOSS:
                    LOG.info("onAudioFocusChange AUDIOFOCUS_LOSS");
                    abandonAudioFocus();
                    downloadService.pause();
                    break;
                case AudioManager.AUDIOFOCUS_LOSS_TRANSIENT:
                    LOG.info("onAudioFocusChange AUDIOFOCUS_LOSS_TRANSIENT");
                    if (downloadService.getPlayerState() == PlayerState.STARTED) {
                        downloadService.pause();
                        audioFocusState = AudioFocusState.LOST_TRANSIENT;
                    }
                    break;
                case AudioManager.AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK:
                    LOG.info("onAudioFocusChange AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK");
                    if (downloadService.getPlayerState() == PlayerState.STARTED) {
                        volume = audioManager.getStreamVolume(AudioManager.STREAM_MUSIC);
                        audioFocusState = AudioFocusState.LOST_DUCKED;
                        audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, 1, 0);
                    }
                    break;
                default:
                    break;
            }
        }
    }
}
