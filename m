From: Pavel Machek <pavel@ucw.cz>
Subject: Re: ThinkPad T480s & LED_MUTE, LED_MICMUTE
Date: Fri, 15 Jun 2018 13:26:06 +0200
Message-ID: <20180615112606.GA3986@amd>
References: <20180608111057.4wxpg7m7nm7suf6n@pali>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180608111057.4wxpg7m7nm7suf6n@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Hi! With up-to-date thinkpad_acpi.ko driver on ThinkPad T480s I'm seeing
> a strange behavior of LEDs which are integrated into mic mute (Fn+F4)
> and mute (Fn+F1) keys.
>=20
> When thinkpad_acpi.ko is not loaded, then mute key is working fine. When
> pressed, it correctly generates KEY_MUTE on AT Translated Set 2 keyboard
> input device and also turn on/of mute led. But when micmute key is
> pressed then, nothing happen. No key event is reported and also led is
> not turned on/off.
>=20
> On the other hand, when thinkpad_acpi.ko is loaded, then both buttons
> mute and micmute correctly generates input events; mute via AT keyboard
> and micmute via ThinkPad Extra Buttons. But led is not changed. When
> thinkpad_acpi.ko is loaded it turn off both leds (mute and micmute) and
> leds after pressing any of those buttons, leds are not turned on again.

With thinkpad_acpi.ko loaded, kernel should handle the LEDs, right? Do
we have a support for that? Do they have directories in
/sys/class/leds? What are the triggers there?

With thinkpad_acpi.ko unloaded, hardware drives the LEDs, so nothing
for us to do...

       	     	      	     	   	    	     	 	   Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlsjok4ACgkQMOfwapXb+vJTEACfbG5HQU4kYLOq3fbpLGJAooAw
QNMAn2o8gm/YhsNRC6XLsbg3KgkvBr/t
=tPqh
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
