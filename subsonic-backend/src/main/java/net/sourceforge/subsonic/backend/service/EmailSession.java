/*
 This file is part of Subsonic.

 Subsonic is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Subsonic is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Subsonic.  If not, see <http://www.gnu.org/licenses/>.

 Copyright 2010 (C) Sindre Mehus
 */
package net.sourceforge.subsonic.backend.service;

import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.io.IOUtils;

import net.sourceforge.subsonic.backend.Util;

/**
 * @author Sindre Mehus
 */
public class EmailSession {

    private static final String SMTP_MAIL_SERVER = "smtp.gmail.com";
    private static final String IMAP_MAIL_SERVER = "imap.gmail.com";
    private static final String USER = "subsonic@activeobjects.no";

    private Session session;
    private String password;

    public EmailSession() throws Exception {
        Properties props = new Properties();
//        props.setProperty("mail.debug", "true");
        props.setProperty("mail.store.protocol", "pop3s");
        props.setProperty("mail.smtps.host", SMTP_MAIL_SERVER);
        props.setProperty("mail.smtps.auth", "true");
        props.setProperty("mail.smtps.timeout", "10000");
        props.setProperty("mail.smtps.connectiontimeout", "10000");
        props.setProperty("mail.pop3s.timeout", "10000");
        props.setProperty("mail.pop3s.connectiontimeout", "10000");

        session = Session.getDefaultInstance(props, null);
        password = Util.getPassword("gmailpwd.txt");
    }

    public String fromTemplate(String template, Map<String, String> tokens) throws Exception {
        InputStream in = null;
        try {
            in = getClass().getResourceAsStream(template);
            String text = IOUtils.toString(in);
            for (Map.Entry<String, String> entry : tokens.entrySet()) {
                text = text.replace("$" + entry.getKey(), entry.getValue());
            }
            return text;
        } finally {
            IOUtils.closeQuietly(in);
        }
    }

    public void sendMessage(String from, List<String> to, List<String> cc, List<String> bcc, List<String> replyTo,
                            String subject, String text) throws MessagingException {
        MimeMessage message = createMessage(from, to, cc, bcc, replyTo, subject);
        message.setText(text);
        sendMessage(message);
    }

    public void sendHtmlMessage(String from, List<String> to, List<String> cc, List<String> bcc, List<String> replyTo,
                                String subject, String html, String plain) throws MessagingException {
        MimeMessage message = createMessage(from, to, cc, bcc, replyTo, subject);

        MimeBodyPart plainPart = new MimeBodyPart();
        plainPart.setText(plain);

        MimeBodyPart htmlPart = new MimeBodyPart();
        htmlPart.setText(html, "utf-8", "html");

        MimeMultipart multipart = new MimeMultipart("alternative");
        multipart.addBodyPart(plainPart);
        multipart.addBodyPart(htmlPart);
        message.setContent(multipart);

        sendMessage(message);
    }

    private MimeMessage createMessage(String from, List<String> to, List<String> cc, List<String> bcc, List<String> replyTo, String subject) throws MessagingException {
        MimeMessage message = new MimeMessage(session);

        message.setFrom(new InternetAddress(from));
        message.setReplyTo(new Address[]{new InternetAddress(from)});
        message.setRecipients(Message.RecipientType.TO, convertAddress(to));
        message.setRecipients(Message.RecipientType.CC, convertAddress(cc));
        message.setRecipients(Message.RecipientType.BCC, convertAddress(bcc));
        message.setReplyTo(convertAddress(replyTo));
        message.setSubject(subject);
        return message;
    }

    private void sendMessage(MimeMessage message) throws MessagingException {
        Transport transport = null;
        try {
            transport = session.getTransport("smtps");
            transport.connect(USER, password);
            transport.sendMessage(message, message.getAllRecipients());
        } finally {
            if (transport != null) {
                transport.close();
            }
        }
    }

    public Folder getFolder(String name) throws Exception {
        Store store = session.getStore("imaps");
        store.connect(IMAP_MAIL_SERVER, USER, password);
        Folder folder = store.getFolder(name);
        folder.open(Folder.READ_ONLY);
        return folder;
    }

    private Address[] convertAddress(List<String> addresses) throws AddressException {
        if (addresses == null) {
            return null;
        }
        Address[] result = new Address[addresses.size()];
        for (int i = 0; i < addresses.size(); i++) {
            result[i] = new InternetAddress(addresses.get(i));
        }
        return result;
    }
}
