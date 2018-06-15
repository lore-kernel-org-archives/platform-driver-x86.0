From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: ThinkPad T480s & LED_MUTE, LED_MICMUTE
Date: Fri, 15 Jun 2018 21:09:59 +0200
Message-ID: <20180615190959.pqipwnm6a3tf3lxc@pali>
References: <20180608111057.4wxpg7m7nm7suf6n@pali>
 <s5hk1r01acc.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sak2akqrac45d545"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <s5hk1r01acc.wl-tiwai@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


--sak2akqrac45d545
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Friday 15 June 2018 14:51:47 Takashi Iwai wrote:
> On Fri, 08 Jun 2018 13:10:57 +0200,
> Pali Roh=C3=A1r wrote:
> >=20
> > Hi! With up-to-date thinkpad_acpi.ko driver on ThinkPad T480s I'm seeing
> > a strange behavior of LEDs which are integrated into mic mute (Fn+F4)
> > and mute (Fn+F1) keys.
> >=20
> > When thinkpad_acpi.ko is not loaded, then mute key is working fine. When
> > pressed, it correctly generates KEY_MUTE on AT Translated Set 2 keyboard
> > input device and also turn on/of mute led. But when micmute key is
> > pressed then, nothing happen. No key event is reported and also led is
> > not turned on/off.
> >=20
> > On the other hand, when thinkpad_acpi.ko is loaded, then both buttons
> > mute and micmute correctly generates input events; mute via AT keyboard
> > and micmute via ThinkPad Extra Buttons. But led is not changed. When
> > thinkpad_acpi.ko is loaded it turn off both leds (mute and micmute) and
> > leds after pressing any of those buttons, leds are not turned on again.
> >=20
> > When thinkpad_acpi.ko is unloaded, then pressing mute button again start
> > switching led on/off.
> >=20
> > So it seems that some init sequence of thinkpad_acpi.ko breaks mute led.
> > And fini sequence of thinkpad_acpi.ko makes mute led working again.
>=20
> Usually the mute LED on Thinkpad is triggered from HD-audio driver
> (sound/pci/hda/thinkpad_helper.c), and it's a soft-bound via
> symbol_request(tpacpi_led_set).  I thought thinkpad_acpi is
> auto-loaded when the module gets bound.
>=20
> A possible explanation would be that TPT480s has neither IBM0068,
> LEN0068 nor LEN0268 ACPI HIDs, hence the driver is not auto-loaded.

I have Debian Stretch kernel (4.9) which does not have LEN0268 alias for
thinkpad_acpi.ko. So thinkpad_acpi.ko is not loaded automatically. But I
have put thinkpad_acpi into /etc/modules and it is now automatically
loaded at boot.

I also compiled upstream version of thinkpad_acpi.ko, loaded it in
Stretch kernel, but it behaves in same way.

Maybe... there could be a problem that thinkpad_acpi.ko must be already
loaded when sound subsystem is doing initialization? If yes, this could
explain it as /etc/modules is loaded at later stage and manually loading
of new version of thinkpad_acpi.ko at runtime does not help when sound
subsystem is already running.

> (In HD-audio driver side, the ACPI ID is checked and the mute LED
>  control is applied only to these three IDs, too.)
> Meanwhile, when you load thinkpad_acpi, it does still recognize some
> device and initialize it.  By the initialization, it goes out of BIOS
> control, and the OS control is expected...   This is my wild guess.
>=20
>=20
> BTW, the reason we have no LED class for these is that we don't want
> to confuse users by providing multiple ways to access to the single
> stuff.  We've had already the mute LED control from the audio driver
> since long time ago, we don't want to drop and enforce the user-space
> solution (that is anyway flakier than in kernel in most cases).

If possible... I would prefer swapped LED behavior: turn led on when
microphone is turned on AND turn led off when microphone is turned off.
Because current behavior is to have turned led off when microphone is
on which seems a bit strange. Also microphone is in majority of time not
used and when is not used it is (or should be) turned off. On the other
hand e.g. CAPSLOCK led is turned on when CAPSLOCK is enabled (and not
opposite) -- which matches uses, it is not used in majority of time.

>=20
> thanks,
>=20
> Takashi

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--sak2akqrac45d545
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCWyQPBQAKCRCL8Mk9A+RD
UrtHAJkB5cAenB0sM6BVqgbhZriVYxEaVgCfSNUzJoOmk94jtUKPt0UeA7uh8ws=
=EwWa
-----END PGP SIGNATURE-----

--sak2akqrac45d545--
