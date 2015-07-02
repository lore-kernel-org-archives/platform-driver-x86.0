From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Thu, 2 Jul 2015 22:58:32 +0200
Message-ID: <201507022258.32104@pali>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl> <20150701105544.GD17577@pali> <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart12942223.3V9SvJf2VB";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:35839 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753181AbbGBU6f (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Jul 2015 16:58:35 -0400
Received: by wiga1 with SMTP id a1so162777904wig.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jul 2015 13:58:34 -0700 (PDT)
In-Reply-To: <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

--nextPart12942223.3V9SvJf2VB
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 02 July 2015 22:41:22 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > Yes, I'm still thinking about some missing init call.
>=20
> I finally figured it out and we were right - to enable event
> reporting via WMI, a WMI method call with a specially crafted buffer
> passed as an argument is needed. (Though the SMI lead was correct as
> the WMI method generates an SMI calling a BIOS function specified in
> the buffer passed.)
>=20

Nice :-) Can you write which WMI call needs to be called?

> I'll be happy to prepare a patch, though I'll appreciate some
> guidance in two areas:
>=20
>  1) The GUID, buffer format and the function to use (DELL_APP_GUID,
>     struct app_wmi_args and dell_wmi_perform_query(), respectively)
> are already defined in drivers/leds/dell-led.c. However, the call to
> be made is obviously not related to LEDs, but rather to WMI hotkeys,
> which are handled in drivers/platform/x86/dell-wmi.c. Also, the call
> should only be made on a Vostro V131 and DMI-based filtering is done
> in yet another file, drivers/platform/x86/dell-laptop.c. Where
> should the fix be placed?
>=20

Last time when I looked into dell-led.c code it called some WMI
functions which are just re-implementation of SMI based SMBIOS
functions. From information which I have that is just WMI interface for
dell SMBIOS one.

I already asked Alex and other people for official ACPI/WMI Dell
documentation, so we would be able to solve these hotkey problems once
and for all, but I did not get anything yet.

What I found on internet is just this one out-of-dated documentation:
http://vpsservice1.sampo.com.tw/sampo_update/document/jimmy/ACPI-WMI%20.pdf

I would suggest you to read it (it is not long) to see Dell WMI methods
are just ACPI "wrapper" around Dell SMBIOS (dcdbas.ko driver) used by
dell-laptop.ko.

>  2) Pressing hotkey #3 on a Dell Vostro V131 generates WMI event
> 0xe025, but no keycode. Apparently, Dell XPS L502X generates the
> same WMI event for a hotkey which also generates a keycode [1].
> What's the best way to solve this conflict?
>=20
> [1] commit f1566f0: "dell-wmi: Add keys for Dell XPS L502X"

Look at dell-wmi.c source code. Which event format is that? New one
(partially described in above PDF document) when dell_new_hk_type is
true? Or old one?

Can you please enable pr_debug() in dell-wmi.c and send dmesg output
from dell-wmi.ko (specially dell_wmi_notify)?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart12942223.3V9SvJf2VB
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlWVpfgACgkQi/DJPQPkQ1JUxACgyeciVksnO7U/7a3C4M9PesLd
pL0AnRtDUzNttqENBJEc531Ut0EGMfrL
=iTGg
-----END PGP SIGNATURE-----

--nextPart12942223.3V9SvJf2VB--
