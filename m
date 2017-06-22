From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance number
Date: Thu, 22 Jun 2017 09:33:55 +0200
Message-ID: <201706220933.55718@pali>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com> <201706171834.36487@pali> <753a822799094c44ade76a66b1e1036a@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2421509.cGOOPB985b";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:36566 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751116AbdFVHeA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Jun 2017 03:34:00 -0400
In-Reply-To: <753a822799094c44ade76a66b1e1036a@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, andy@infradead.org, luto@kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart2421509.cGOOPB985b
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 21 June 2017 23:52:12 Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
> > Sent: Saturday, June 17, 2017 11:35 AM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; andy@infradead.org; luto@kernel.org;
> > platform-driver- x86@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method
> > instance number
> >=20
> > On Friday 16 June 2017 18:33:54 Mario.Limonciello@dell.com wrote:
> > > > -----Original Message-----
> > > > From: Limonciello, Mario
> > > > Sent: Thursday, June 15, 2017 10:16 AM
> > > > To: 'Pali Roh=C3=A1r' <pali.rohar@gmail.com>; Darren Hart
> > > > <dvhart@infradead.org> Cc: Andy Shevchenko
> > > > <andy@infradead.org>; Andy Lutomirski <luto@kernel.org>;
> > > > platform-driver-x86@vger.kernel.org;
> > > > linux-kernel@vger.kernel.org Subject: RE: [PATCH] RFC:
> > > > platform/x86: wmi: Fix check for method instance number
> > > >=20
> > > > > -----Original Message-----
> > > > > From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
> > > > > Sent: Thursday, June 15, 2017 8:59 AM
> > > > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>; Darren
> > > > > Hart <dvhart@infradead.org>
> > > > > Cc: Andy Shevchenko <andy@infradead.org>; Andy Lutomirski
> > > >=20
> > > > <luto@kernel.org>;
> > > >=20
> > > > > platform-driver-x86@vger.kernel.org;
> > > > > linux-kernel@vger.kernel.org Subject: Re: [PATCH] RFC:
> > > > > platform/x86: wmi: Fix check for method instance number
> > > > >=20
> > > > > Mario, are you able to check if instance number passed to
> > > > > wmi_evaluate_method in following dell WMI drivers is correct
> > > > > and should be really 1?
> > > > >=20
> > > > > I suspect that it should be zero, as instance number is
> > > > > indexed from zero.
> > > > >=20
> > > > > There is no comment in those dell WMI drivers why it is 1,
> > > > > nor what 1 means.
> > > > >=20
> > > > > Ideally it needs to be checked in ACPI byte code, MOF file
> > > > > and WDG dump.
> > > >=20
> > > > I think you're likely correct.  I don't have a box that
> > > > supports alienware-wmi or dell-wmi-led.c handy at the current
> > > > moment to confirm this hypothesis though. I'll confirm this
> > > > later.
> > > >=20
> > > > I didn't realize it was zero indexed when I wrote
> > > > alienware-wmi, and I'm guessing the author of dell-wmi-led
> > > > didn't either.
> > > >=20
> > > > The reason it's probably working is the ACPI byte code isn't
> > > > actually checking the instance since most times _WDG will only
> > > > call out one instance.
> > >=20
> > > I confirmed you're correct.  Switching instance over to 0 works
> > > properly on an ASM200 (supported by alienware-wmi).
> >=20
> > Can you check what is the value in the instance_count in _WDG?
>=20
> Instance count is 1.
>=20
> Thanks,

Ok, in this case instance number should be zero in driver code. Will you=20
send patch for fixing it?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2421509.cGOOPB985b
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAllLcuMACgkQi/DJPQPkQ1LMSQCeO/oyrrr8yllZ4K9Jf+O0SXGJ
Rx8AoLeWEvByj2fGsEqxHYz1hG0TWbkS
=JOty
-----END PGP SIGNATURE-----

--nextPart2421509.cGOOPB985b--
