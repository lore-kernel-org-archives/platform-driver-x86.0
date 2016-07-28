From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] dell-wmi: Add events created by Dell Rugged 2-in-1s
Date: Thu, 28 Jul 2016 21:22:40 +0200
Message-ID: <201607282122.40816@pali>
References: <1469217684-6643-1-git-send-email-mario_limonciello@dell.com> <be8bbf443c804fde8ebf5e9c237ce83f@ausx13mpc120.AMER.DELL.COM> <20160728184930.GF16852@dtor-ws>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1898995.VKyRu0VuxU";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:33095 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753273AbcG1TWq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 Jul 2016 15:22:46 -0400
In-Reply-To: <20160728184930.GF16852@dtor-ws>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mario_Limonciello@dell.com, dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, pavel@ucw.cz

--nextPart1898995.VKyRu0VuxU
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 28 July 2016 20:49:30 Dmitry Torokhov wrote:
> On Thu, Jul 28, 2016 at 03:52:11PM +0000, Mario_Limonciello@Dell.com
> wrote:=20
> > > - Even if something is a key/button/switch it does not
> > > necessarily need to be sent through input subsystem or we may
> > > want to wait until we add a new input event. This is because
> > > vendors love to come up with "value add" features that require
> > > vendor specific driver that noone ends up using. I mean, for the
> > > "WiFi catcher" do you have any kind of numbers for the users of
> > > the feature?
> >=20
> > Like I said, this particular feature hasn't been in use for quite a
> > few generations. In its time it was deemed "beneficial" in that
> > day because of the amount of time it took for waking up the
> > machine only to determine there was no available wifi nearby. It's
> > been superseded by other technology improvements.
> >=20
> > There are other types of "notification" only events that could be
> > useful to userspace. I don't think they need to all be generally
> > demonized with the connotation as a negative vendor specific value
> > add, there are plenty of generic things that userspace could
> > notify on
>=20
> Generic things should find a specific system they are part of (i.e.
> wifi notifications -> rflill, wifi switching -> input, etc), it is
> one-off that "sounded good" but are hard to discover by user and
> nobody ends up using that I am demonizing.

User (as consumer) of applications should not discovering such parts.=20
User just open/configure his favourite gnome/kde/unity/xface/...=20
application. But developers of wifi/power/led applications must know=20
where to find those events.

And I need to say, if I change wifi state via rfkill interface, I would=20
expect that also rfkill interface provides me information about changes.=20
If I change keyboard backlight level via LED interface, then I somehow=20
expect that LED interface should be able to tell me information that it=20
was changed (but that's not truth... yet).

> > that are essentially "killed" at the WMI driver today.
> >=20
> > Here's a few I find:
> > "Keyboard illumination toggle"
> > "Mic mute toggle"
> > "ALS sensor toggle"
> > " Rotation lock toggle"
> > "Airplane mode toggle"
>=20
> These all seem valid key events (unless they are not requests to
> execute said actions but rather notifiers of events already
> happened).

Previously "Keyboard illumination toggle" event was translated to=20
KEY_KBDILLUMTOGGLE, but it later after implementing dell::kbd_backlight=20
LED driver (software control via /sys/ of keyboard backlight) it was=20
changed to KE_IGNORE.

Reason was following: All userspace applications (KDE, Unity, upowerd)=20
understand KEY_KBDILLUMTOGGLE input event as "key for toggling keyboard=20
backlight level" was pressed. Their answer to that input key is to find=20
*::kbd_backlight led device in /sys/class/leds and switch keyboard=20
backlight level to next value.

Dell ACPI/firmware send "Keyboard illumination toggle" event every time=20
when keyboard backlight level is changed (software via driver or by HW=20
key press) and all above applications started infinite loop...

So there are difference between:

*) user pressed key with icon of "keyboard illumination", but hardware=20
did nothing

*) hardware changed keyboard illumination level (either by its own ---=20
e.g. because of long inactivity of user or user closed LID --- or as=20
reaction of user request via special driver)

Months ago we agreed that if pressing key with icon "keyboard=20
illumination" cause 1) emitting key press event (via ACPI/WMI) and also=20
2) hardware unconditionally change keyboard backlight level, then we=20
should not send that key press to userspace (as it was already processed=20
by hardware). Same is for hardware key which block WIFI (as userspace=20
react on input KEY_RFKILL to block all rfkills).

But I agree that could somehow inform userspace about changes which=20
hardware did. For rfkills we already support interface when rfkill=20
device send to userspace all change events.

=46or keyboard backlight we do not have notify interface yet, but I=20
proposed that LED subsystem could be extended, so select/poll syscalls=20
could be used on "brightness" sysfs node (which is used for changing LED=20
level).

> Are they "killed" because they are also delivered via i8042?

No, (at least on my machine they are sent via WMI).

> > > - In the same vein, we can come up with something generic to
> > > shuffle the crap over to userspace
> > > ("com.vendor.crap.morecrap..." over connector? I think I just
> > > threw into my mouth a little), but do we have consumer for this?
> >=20
> > I think it would be most equitable to shuffle all notification
> > events over to userspace with a generic connector and let
> > userspace maintainers decide which ones make sense to show to the
> > user.
> >=20
> > The most logical one to me will be adding patches into
> > gnome-settings-daemon and similar UI interfaces that already
> > display things like brightness and volume changes.
>=20
> Well, it is really easy to shove stuff up into userspace and say "let
> them deal with it", but we if stuff is useful and applicable to many
> devices, then I am sure there are more specific interfaces that would
> be better suited for such events, and one off will require writing
> "tray notification apps" that we all so love.
>=20
> Thanks.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1898995.VKyRu0VuxU
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAleaW4AACgkQi/DJPQPkQ1LysACgwcZj0gmojAAgMO6TGy4q3Jn4
DccAoL+pT4d713/hgytEzae9WnkmMARU
=9Wii
-----END PGP SIGNATURE-----

--nextPart1898995.VKyRu0VuxU--
