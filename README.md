Booksonic Server v1.0
===================

Booksonic aka Popeens Subsonic is a fork of the music streaming server Subsonic but with a twist.
While Subsonic and as far as I know all the other forks out there are focused on music, Booksonic, as the name suggests is focused on audiobooks.

At the moment the webclient that comes with this server has not been modified at all meaning that you wont notice anything different from the vanilla Subsonic and any update notifications you might get are for the vanilla one as well.


So why would you even use this server instead of the vanilla one if its basically the same?
Well for the moment you would probably only do that if you intend to use it with the Booksonic Android app (Forked from DSub), that beeing said it does support any other Subsonic players as well. 
The api of this version has a couple of addisional endpoints that allows you to get book descriptions in the Booksonic app.

In the future you will get more information inside the app and once the app is where I want it I will probably start working on getting the webclient audiobook friendly as well.



So how do I use it to get book descriptions in the app?
Thats simple, in the folder of you book (or album if we use subsonic terms) you place a textfile called desc.txt. Anything you enter into this file will be reported by the api as a description of the book. 


Booksonic Android app: https://github.com/popeen/Popeens-DSub/

Subsonic: http://sourceforge.net/projects/subsonic/

DSub: https://github.com/daneren2005/Subsonic