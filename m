From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH][v2] asus-rbtn: new driver for asus radio button for Windows 8
Date: Tue, 30 Jun 2015 19:04:40 +0200
Message-ID: <201506301904.41039@pali>
References: <1435114671-24380-1-git-send-email-alex.hung@canonical.com> <20150630085814.GE27720@pali> <CAJ=jquYNQ=R0K+OR538_Tm-E0sNbL6VcAvN_zc99-Z5X1WmCmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2735925.d4aq3sc2Wl";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:34568 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752134AbbF3REo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 30 Jun 2015 13:04:44 -0400
In-Reply-To: <CAJ=jquYNQ=R0K+OR538_Tm-E0sNbL6VcAvN_zc99-Z5X1WmCmA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org

--nextPart2735925.d4aq3sc2Wl
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello, you can create new trigger and use that...

On Tuesday 30 June 2015 18:09:41 Alex Hung wrote:
> Thanks for the information, and I really appreciate it.
>=20
> I took a quick look at my HP laptop and it has a led as below:
>=20
> /sys/class/leds/hp::hddprotect$ cat trigger
> [none] AC-online BAT0-charging-or-full BAT0-charging BAT0-full
> BAT0-charging-blink-full-solid usb-gadget usb-host cpu0 cpu1 cpu2
> cpu3 cpu4 cpu5 cpu6 cpu7 mmc0 rfkill1 rfkill2 rfkill8
>=20
> and I learned that LED can be triggered by rfkill.  I also checked
> asus-wmi and its default_trigger is its rfkill name "asus-wlan".
>=20
> ATK4001 is an independent ACPI device, and Method(HSWC) is its method
> to control LED (actually it has other functions but only LED is
> needed so far). asus-rbtn does not have anything to be triggered
> because it only translate an ACPI event to KEY_RFKILL unless a
> rfkill is created, but this wouldn't make sense that I use both
> rfkill and led when I can only use one.
>=20
> The other concern is that I'd like the LED to be ORed by both WLAN
> and BT in long term.  default_trigger seems to be linked to one
> trigger.
>=20
> On Tue, Jun 30, 2015 at 4:58 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>
> wrote:
> > Hi!
> >=20
> > Ideally, try to touch led trigger configuration from userspace
> > yourself, so you will see how it works. Take some machine which
> > has some configurable led exported in /sys/class/leds/ and try to
> > set some trigger via "trigger" entry.
> >=20
> > I think that default trigger for led device (from kernel) can be
> > set via "default_trigger" property in struct led_classdev. See
> > file linux/leds.h
> >=20
> > On Tuesday 30 June 2015 16:38:18 Alex Hung wrote:
> >> Pali,
> >>=20
> >> Thanks for comments, but will you be able to provide more details
> >> so it is more clear how this works?
> >>=20
> >> On Mon, Jun 29, 2015 at 8:29 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>
> >> wrote:
> >> > On Friday 26 June 2015 23:24:10 Alex Hung wrote:
> >> >> On Fri, Jun 26, 2015 at 10:56 PM, Pali Roh=C3=A1r
> >> >> <pali.rohar@gmail.com> wrote:
> >> >> > Hi!
> >> >> >=20
> >> >> > On Wednesday 24 June 2015 10:57:51 Alex Hung wrote:
> >> >> >> ASUS introduced a new approach to handle wireless hotkey
> >> >> >> since Windows 8.  When the hotkey is pressed, BIOS generates
> >> >> >> a notification 0x88 to a new ACPI device, ATK4001.  This
> >> >> >> new driver not only translates the notification to
> >> >> >> KEY_RFKILL but also toggles its LED accordingly.
> >> >> >>=20
> >> >> >> Signed-off-by: Alex Hung <alex.hung@canonical.com>
> >> >> >=20
> >> >> > ...
> >> >> >=20
> >> >> >> +static int asus_radio_led_set(bool blocked)
> >> >> >> +{
> >> >> >> +     acpi_status status;
> >> >> >> +     union acpi_object arg0 =3D { ACPI_TYPE_INTEGER };
> >> >> >> +     struct acpi_object_list args =3D { 1, &arg0 };
> >> >> >> +     unsigned long long output;
> >> >> >> +
> >> >> >> +     arg0.integer.value =3D blocked;
> >> >> >> +     status =3D
> >> >> >> acpi_evaluate_integer(asus_rbtn_device->handle, "HSWC", + =20
> >> >> >>                                  &args, &output);
> >> >> >=20
> >> >> > What is this ACPI call doing? Just set LED control? Or
> >> >> > something more?
> >> >> >=20
> >> >> >> +     if (!ACPI_SUCCESS(status) || output =3D=3D 0) {
> >> >> >> +             pr_err("fail to change wireless LED.\n");
> >> >> >> +             return -EINVAL;
> >> >> >> +     }
> >> >> >> +
> >> >> >> +     return 0;
> >> >> >> +}
> >> >> >> +
> >> >> >> +static int asus_rfkill_set(void *data, bool blocked)
> >> >> >> +{
> >> >> >> +     radio_led_state =3D blocked ? 0 : 1;
> >> >> >> +
> >> >> >> +     return asus_radio_led_set(radio_led_state);
> >> >> >> +}
> >> >> >=20
> >> >> > In my opinion this is not good idea that "rfkill block" call
> >> >> > from userspace just change LED on/off state and nothing
> >> >> > more...
> >> >> >=20
> >> >> > If above ACPI call just change LED, then should not be this
> >> >> > in LED subsystem instead rfkill one? Or why do you prefer to
> >> >> > use rfkill interface instead led?
> >> >>=20
> >> >> It indeed controls LED only at the moment.  My intention was to
> >> >> have have everything work without the need to modify any
> >> >> userspace applications.  Current it is 1) aus-rbtn issues
> >> >> KEY_RFKILL 2) an userspace application changes rfkill states,
> >> >> and 3) both radio and LED work.  It will also work when a user
> >> >> enable/disable wireless devices on a user application which
> >> >> uses rfkill interface.
> >> >>=20
> >> >> Come to think about it now, I may have to handle LED with WLAN
> >> >> and BT but I will have to find a system with both devices
> >> >> later.
> >> >>=20
> >> >> I am not too familiar with userspace applications v.s. LED.  Is
> >> >> it possible to do the same (i.e. without touching userspace)?
> >> >> I think rfkill is good interface to handle whatever needs
> >> >> doing when changing wireless states, such as LED controls.=20
> >> >> However, if other approach can meet the need I am happy to
> >> >> investigate.
> >> >=20
> >> > There are triggers for led which automatically enable/disable
> >> > led. I think that configuring default wifi/bluetooth trigger
> >> > for that new led could work...
> >> >=20
> >> > --
> >> > Pali Roh=C3=A1r
> >> > pali.rohar@gmail.com
> >=20
> > --
> > Pali Roh=C3=A1r
> > pali.rohar@gmail.com

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2735925.d4aq3sc2Wl
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlWSzCkACgkQi/DJPQPkQ1KpmQCgj9GAb/XPJ8T+Y08Y5Hy2jB5g
qM4AnR1YxwCQ0UWtUiyzedtR+VEOKBVz
=F+zp
-----END PGP SIGNATURE-----

--nextPart2735925.d4aq3sc2Wl--
