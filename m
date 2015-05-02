From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 1/3] platform: x86: dell-rbtn: Dell Airplane Mode Switch driver
Date: Sat, 2 May 2015 17:13:11 +0200
Message-ID: <201505021713.11503@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com> <20150430074429.GT24346@pali> <10520902.uqZDZn6tkf@xps13>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3091102.6aEOuiv9ZC";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:37355 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752106AbbEBPNP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 2 May 2015 11:13:15 -0400
In-Reply-To: <10520902.uqZDZn6tkf@xps13>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org

--nextPart3091102.6aEOuiv9ZC
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 02 May 2015 15:51:50 Gabriele Mazzotta wrote:
> On Thursday 30 April 2015 09:44:29 Pali Roh=C3=A1r wrote:
> > On Thursday 30 April 2015 14:06:27 Alex Hung wrote:
> > > Method ABRT is to be used by driver to disable BIOS
> > > handling of radio button. So the changes in behaviours
> > > observed by Gabriele is expected. I have seen other
> > > systems behave the same way.
> >=20
> > Right, that after that ARBT call operating system get full
> > control over radio devices and ACPI/BIOS will not
> > automatically enable/disable them. I think this is OK.
> >=20
> > But for that we need also support for manually
> > enable/disable radio devices and code for this support is
> > missing. Or do DELLABCE/RBTN acpi devices somehow support
> > enabling/disabling it via system/kernel request?
> >=20
> > > I do also see firmware only sends Notify(RBTN, 0x80) and
> > > no hard block whether ABRT(1) is called or not.  Thus
> > > keycode are the only option on those machines.
> >=20
> > Key is ok, but we *must* have ability to hard block it via
> > some ACPI/WMI/BIOS/FW/etc... call. Otherwise ARBT(1) is no
> > go as users should be able to enable/disable their radio
> > devices (bluetooth for powersave)
> >=20
> > > The idea to have an option (kernel parameter) for calling
> > > ABRT is great. I can help verify on more machines. Is
> > > Gabriele's patch above a final version that I should
> > > test?
> >=20
> > No, I do not think so. This looks like hack or pure design.
> > Kernel option could be there, but just for buggy BIOSes
> > (and future changed design).
> >=20
> > But now it looks like for correct work is specifying that
> > param required -- which is bad.
> >=20
> > Alex, can you ask Dell people how should system turn off e.g
> > bluetooth or wifi device if ARTB(1) is called and
> > system/kernel (instead ACPI) is expected to turn off/on
> > blueooth (and wifi) devices?
>=20
> I completely forgot that libsmbios comes with
> smbios-wireless-ctl. It allows me to control the hardware
> slider.
>=20
> > I think that without this information (and working driver
> > for it) we should not enable ARTB(1) or including this
> > driver into kernel tree as it will break some existing
> > machines...
>=20
> Alex, could you test smbios-wireless-ctl and see what it says
> about the laptops with no hardware slider? For instance on
> mine it says:
>=20
> Radio Status for WLAN:
>         WLAN enabled at boot
>         WLAN supported
>         WLAN enabled
>         WLAN installed
>         WLAN boot-time wireless switch setting not present
>         WLAN runtime switch control currently enabled
>         Status Code: 0
>=20
> You can find the utility here:
> http://linux.dell.com/git/libsmbios.git
>=20
> The code to check for the presence of an hardware slider is
> even already implemented in dell-laptop and works on my
> laptop, it says the slider is present.
>=20
>=20
> Pali, you have a Latitude, right? Is "whitelisted" true when
> you load dell-laptop? I'm asking because when I load
> dell-laptop with force_rfkill, my function key stops working.
> Radio devices get disabled the moment dell-laptop is loaded
> and I must use smbios-wireless-ctl to re-enable them. Once I
> re-enabled them, the function keys starts working again.
> I don't know exactly what happens on your laptop, but I was
> wondering if dell-laptop is messing things up on your laptop
> too.

Hi, on my Latitude E6440 machine dell-laptop (with rfkill)=20
working fine. There is no problem with it.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3091102.6aEOuiv9ZC
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlVE6YcACgkQi/DJPQPkQ1Lc1wCgmtSisvrZNCpEnoAibeO2LuPS
6EsAn10wYvZg54HyrbUOkLaZ/sDlAdfH
=WktD
-----END PGP SIGNATURE-----

--nextPart3091102.6aEOuiv9ZC--
