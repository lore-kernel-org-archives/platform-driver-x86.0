From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Tue, 17 Nov 2015 09:36:07 +0100
Message-ID: <201511170936.08646@pali>
References: <cover.1447479930.git.luto@kernel.org> <201511141713.48766@pali> <CALCETrWss=zCWhNkR2S_oi_m3W1xNO+UL_-uOnOVeLh5WHsDgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart32910810.ZjQyoLtlgn";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35928 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751041AbbKQIgN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 17 Nov 2015 03:36:13 -0500
In-Reply-To: <CALCETrWss=zCWhNkR2S_oi_m3W1xNO+UL_-uOnOVeLh5WHsDgQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Alex Hung <alex.hung@canonical.com>, Mario Limonciello <mario_limonciello@dell.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, libsmbios-devel@lists.us.dell.com

--nextPart32910810.ZjQyoLtlgn
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 14 November 2015 18:07:57 Andy Lutomirski wrote:
> [lots of people added]
>=20
> On Sat, Nov 14, 2015 at 8:13 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com>
> wrote:
> > On Saturday 14 November 2015 16:48:25 Andy Lutomirski wrote:
> >> On Nov 14, 2015 1:27 AM, "Pali Roh=C3=A1r" <pali.rohar@gmail.com> wrot=
e:
> >> > On Friday 13 November 2015 21:49:30 Andy Lutomirski wrote:
> >> > > The XPS 13 Skylake has an rfkill button and a switchvideomode
> >> > > button that aren't enumerated in the DMI table AFAICT.  Add a
> >> > > table listing extra un-enumerated hotkeys.  To avoid breaking
> >> > > things that worked before, these un-enumerated hotkeys won't
> >> > > be used if the DMI table maps them to something else.
> >> >=20
> >> > Do you have any (Dell) documentation which specify list of these
> >> > wmi codes send to dell-wmi driver?
> >>=20
> >> No.  Do you know where to get that documentation?
> >=20
> > Time to time Dell release some documentation or example code. You
> > could ask Dell people on LKML (e.g. Mario Limonciello is active)
> > or on smbios mailing list libsmbios-devel@lists.us.dell.com.
> >=20
> > But currently there there are open questions about WMI hotkeys on
> > Dell Vostro V131 which we cannot fix yet :-(
>=20
> On the Dell XPS 13 Skylake (XPS 13 9350), upstream Linux doesn't
> support the rfkill button.
>=20
> There seem to be three WMI events that aren't reflected in the OEM
> type 178 DMI table:
>=20
> 0x151: Fn-lock (no action needed by OS)
> 0x152: Switch video mode (should send KEY_SWITCHVIDEOMODE, but
> currently just warns)
> 0x153: rfkill -- currently warns, and see below.
>=20
> On several Dell models, there's the dell_rbtn (DELRBTN / DELLABCE)
> device.  It's here in the DSDT, too, but it seems to be disabled if
> _OSI reports "Windows 2012" or "Windows 2013", so _STA returns zero.
> (It also shows up as DELLRBC6, but I haven't tried all the _OSI
> hackery that seems to be needed in order to test the driver.)
>=20

Hi!

In your ASL code is:

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((OIDE () < One))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

OIDE() returns 1 for Windows 8.

This is quite interesting, on my Latitude E6440 is this ASL code:

            Method (_STA, 0, NotSerialized)
            {
                If (LLess (OIDE (), One))
                {
                    Return (Zero)
                }

                Return (0x0F)
            }

And again OIDE() returns 1 for Windows 8. So behaviour is negated.

Can you check if you have latest version of BIOS? Maybe Dell written=20
that condition incorrectly?

Can you try to add "DELLRBC6" into dell-rbtn.c acpi table and boot=20
kernel with acpi_osi=3D"!Windows 2012" acpi_osi=3D"!Windows 2013" what=20
happens?

> My proposal is to modify dell_wmi to handle 0x151 (ignore), 0x152
> (send KEY_SWITCHVIDEOMODE), and 0x153 (send KEY_RFKILL), but only if
> there isn't something else mapped to them in the DMI table.
>=20
> I've attached dmidecode output and the DSDT.
>=20

Can you please provide debug output from dell-wmi module when you press=20
those hotkeys? Specially I want to see wmi buffer for each pressed=20
hotkey. In debug dmesg it starts with "Received WMI event" and "Process=20
buffer". Look into dell-wmi.c source code.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart32910810.ZjQyoLtlgn
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlZK5vgACgkQi/DJPQPkQ1KViQCcCg4SZnM5cjRDHeenPTk/FMIG
ZBkAni5SU6U2Jdw5PiL1kmsCM5tjFLum
=FyBb
-----END PGP SIGNATURE-----

--nextPart32910810.ZjQyoLtlgn--
