From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Sat, 14 Nov 2015 17:13:46 +0100
Message-ID: <201511141713.48766@pali>
References: <cover.1447479930.git.luto@kernel.org> <20151114092704.GA25957@pali> <CALCETrU9RDOGSOJVxmxu-6XxrovW2ugQRcNfy-fE8p8Qbu2uBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1877678.uPXnvDRii4";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:35982 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751283AbbKNQNw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 Nov 2015 11:13:52 -0500
In-Reply-To: <CALCETrU9RDOGSOJVxmxu-6XxrovW2ugQRcNfy-fE8p8Qbu2uBg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

--nextPart1877678.uPXnvDRii4
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 14 November 2015 16:48:25 Andy Lutomirski wrote:
> On Nov 14, 2015 1:27 AM, "Pali Roh=C3=A1r" <pali.rohar@gmail.com> wrote:
> > On Friday 13 November 2015 21:49:30 Andy Lutomirski wrote:
> > > The XPS 13 Skylake has an rfkill button and a switchvideomode
> > > button that aren't enumerated in the DMI table AFAICT.  Add a
> > > table listing extra un-enumerated hotkeys.  To avoid breaking
> > > things that worked before, these un-enumerated hotkeys won't be
> > > used if the DMI table maps them to something else.
> >=20
> > Do you have any (Dell) documentation which specify list of these
> > wmi codes send to dell-wmi driver?
>=20
> No.  Do you know where to get that documentation?
>=20

Time to time Dell release some documentation or example code. You could=20
ask Dell people on LKML (e.g. Mario Limonciello is active) or on smbios=20
mailing list libsmbios-devel@lists.us.dell.com.

But currently there there are open questions about WMI hotkeys on Dell=20
Vostro V131 which we cannot fix yet :-(

> > > This also adds the Fn-lock key as a KE_IGNORE entry.
> > >=20
> > > Signed-off-by: Andy Lutomirski <luto@kernel.org>
> > > ---
> > >=20
> > >  drivers/platform/x86/dell-wmi.c | 48
> > >  +++++++++++++++++++++++++++++++++++------ 1 file changed, 41
> > >  insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/dell-wmi.c
> > > b/drivers/platform/x86/dell-wmi.c index
> > > f2d77fe696ac..5be1abec4f64 100644
> > > --- a/drivers/platform/x86/dell-wmi.c
> > > +++ b/drivers/platform/x86/dell-wmi.c
> > > @@ -142,6 +142,16 @@ static const u16 bios_to_linux_keycode[256]
> > > __initconst =3D {
> > >=20
> > >       0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_PROG3
> > > =20
> > >  };
> > >=20
> > > +/* These are applied if the hk table is present and doesn't
> > > override them. */ +static const struct key_entry
> > > dell_wmi_extra_keymap[] __initconst =3D { +     /* Fn-lock -- no
> > > action is required by the kernel. */ +     { KE_IGNORE, 0x151, {
> > > KEY_RESERVED } },
> > > +
> > > +     /* Keys that need our help (on XPS 13 Skylake and maybe
> > > others. */ +     { KE_KEY, 0x152, { KEY_SWITCHVIDEOMODE } },
> > > +     { KE_KEY, 0x153, { KEY_RFKILL } },
> >=20
> > On more Dell laptops rfkill events are handed by ACPI driver
> > dell-rbtn.ko. Are you sure that dell-rbtn.ko does not send keypress
> > event and you really need it from dell-wmi? We already masked
> > KEY_RFKILL in dell-wmi to prevent double events...
>=20
> Hmm, interesting.  I have DELLABC6, not DELLABCE.  I'll play around
> with it a bit.  Are there Dell docs for this?
>=20

Decompiling ACPI table is documentation :-) Probably DELLABC6 will have=20
similar (or maybe same) ACPI interface. Post relevant ACPI ASL code,=20
maybe I could help with it.

Anyway first version of DELLABCE driver was written by Alex Hung (from=20
Canonical), so it is possible that also non-Dell could help with=20
documentation/behaviour as well.

> Regardless, we'll need something like this, but maybe with KE_IGNORE,
> just to silence the warnings.
>=20

Yes, with KE_IGNORE we will have documented behaviour in code.

> > > +
> > > +             /*
> > > +              * Check if we've already found this scancode.=20
> > > This takes +              * quadratic time, but it doesn't
> > > matter unless the list +              * of extra keys gets very
> > > long.
> > > +              */
> > > +             for (j =3D 0; j < num_bios_keys; j++)
> > > +                     if (keymap[j].code =3D=3D
> > > dell_wmi_extra_keymap[i].code) +                           =20
> > > goto skip;
> >=20
> > Rather move this code into separate boolean function and for return
> > value here. This will prevent using hacky goto...
>=20
> I'll do that in v2.
>=20
> --Andy

OK.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1877678.uPXnvDRii4
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlZHXbwACgkQi/DJPQPkQ1KoGQCffB9UElXFcfXOjCNZP+ZEeyeh
12QAn3sqyHDgqDtW2u6siMBS21lhQseB
=Lpnp
-----END PGP SIGNATURE-----

--nextPart1877678.uPXnvDRii4--
