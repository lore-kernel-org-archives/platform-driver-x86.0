From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] dell-wmi: add module param to control Dell Instant Launch hotkey processing
Date: Sun, 29 Nov 2015 20:50:18 +0100
Message-ID: <201511292050.18883@pali>
References: <1f6ac54784b39ebb6ce02a9fb9e944c840fddb7b.1448547341.git.kernel@kempniu.pl> <20151126144130.GI14190@pali> <20151126145556.GA9371@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2806495.gMxD0dIWtc";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33600 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751835AbbK2TuW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 29 Nov 2015 14:50:22 -0500
In-Reply-To: <20151126145556.GA9371@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart2806495.gMxD0dIWtc
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 26 November 2015 15:55:56 Micha=C5=82 K=C4=99pie=C5=84 wrote:=20
> > >  	/* Shortcut and audio panel keys */
> > >=20
> > > -	{ KE_IGNORE, 0xe025, { KEY_RESERVED } },
> > > +	{ KE_KEY, 0xe025, { KEY_PROG4 } },
> > >=20
> > >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> >=20
> > I'm trying to figure out if those two keys are really reported via
> > keyboard controller or not. They were added 4 years ago in commit
> > f1566f0dc07ec9b5409b348070f5a700032d7881. But from bug report
> > http://bugs.launchpad.net/bugs/815914 there is no information if
> > those two keys are really reported by keyboard controller or not.
> >=20
> > And if not our problem could be easier...
>=20
> That would indeed be sweet as this patch could then be shrinked to
> just changing the entry in the sparse keymap.  Does anyone have a
> Dell XPS L502X handy?  Also, any ideas for making sure no other
> model is generating that keypress?

And now I have info how keys are reported on Dell XPS L502X. Sadly it is=20
worse as I expected :-( Here is output from Jean-Louis Dupond notebook:

$ sudo /usr/bin/input-events 4
/dev/input/event4
    bustype : BUS_I8042
    vendor  : 0x1
    product : 0x1
    version : 43841
    name    : "AT Translated Set 2 keyboard"
    phys    : "isa0060/serio0/input0"
    bits ev : EV_SYN EV_KEY EV_MSC EV_LED EV_REP

waiting for events

10:26:29.945739: EV_MSC MSC_SCAN 219
10:26:29.945739: EV_KEY KEY_LEFTMETA (0x7d) pressed
10:26:29.945739: EV_SYN code=3D0 value=3D0
10:26:29.946468: EV_MSC MSC_SCAN 45
10:26:29.946468: EV_KEY KEY_X (0x2d) pressed
10:26:29.946468: EV_SYN code=3D0 value=3D0
10:26:29.948469: EV_MSC MSC_SCAN 45
10:26:29.948469: EV_KEY KEY_X (0x2d) released
10:26:29.948469: EV_SYN code=3D0 value=3D0
10:26:29.951473: EV_MSC MSC_SCAN 219
10:26:29.951473: EV_KEY KEY_LEFTMETA (0x7d) released
10:26:29.951473: EV_SYN code=3D0 value=3D0
x

(Press+release first key with name "Windows Mobility Center control")
(key X was printed to console)

10:26:32.898689: EV_MSC MSC_SCAN 133
10:26:32.898689: EV_KEY KEY_BRIGHTNESSDOWN (0xe0) pressed
10:26:32.898689: EV_SYN code=3D0 value=3D0
10:26:32.898730: EV_MSC MSC_SCAN 133
10:26:32.898730: EV_KEY KEY_BRIGHTNESSDOWN (0xe0) released
10:26:32.898730: EV_SYN code=3D0 value=3D0

(Press+release second key with name "Instant launch control")

10:26:35.090018: EV_MSC MSC_SCAN 132
10:26:35.090018: EV_KEY KEY_NEXTSONG (0xa3) pressed
10:26:35.090018: EV_SYN code=3D0 value=3D0
10:26:35.092765: EV_MSC MSC_SCAN 132
10:26:35.092765: EV_KEY KEY_NEXTSONG (0xa3) released
10:26:35.092765: EV_SYN code=3D0 value=3D0

(Press+release third key with name "Audio control-panel control")

As you can see events are send also via keyboard controller!

Key codes are configured by userspace (udev/systemd) and looks like=20
there is bug in userspace rules (reason for brightnes or nextsong), see:
https://wiki.ubuntu.com/HardwareSupport/Machines/Laptops/Dell/XPS/15

So it is not easy to make both machines (Dell XPS L502X and Dell Vostro=20
V131) works correctly :-( At least I do not see how.

And that mapping "Windows Mobility Center control" key to combination of=20
two keys (KEY_LEFTMETA + X) is some total stupid nonsense...

If anybody has idea how to fix this big firmware/BIOS mess please let us=20
know...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2806495.gMxD0dIWtc
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlZbVvoACgkQi/DJPQPkQ1LtjQCglW0Wyf1YjuVzd2ZVyCLcG6YD
4DgAnivS+DZTwXFAFfjX88vPgeY9ZeYH
=dFxC
-----END PGP SIGNATURE-----

--nextPart2806495.gMxD0dIWtc--
