From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v10 12/15] platform/x86: dell-smbios: Add filtering
 support
Date: Mon, 29 Jan 2018 17:44:24 +0100
Message-ID: <20180129164424.yzem3xz3kt7qfxuf@pali>
References: <cover.1508434513.git.mario.limonciello@dell.com>
 <2dfbb122aa11fa9ff73cbfc6a403b82d1bb2e7c8.1508434514.git.mario.limonciello@dell.com>
 <20180105111313.23c6vjs2x3fhtvi4@pali>
 <8e1b17a4da0d404eb36920297e408d9f@ausx13mpc120.AMER.DELL.COM>
 <20180105144406.vifyj46b2ca34aol@pali>
 <7f2516be75654c2ca3404298a70124cf@ausx13mpc120.AMER.DELL.COM>
 <20180127145101.y4rkc36kvuqpbkji@pali>
 <fd59a3621e864b4a84fc69f72e0a51af@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="n7sd4eclgvc2aw2j"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:54550 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751072AbeA2Qo2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Jan 2018 11:44:28 -0500
Content-Disposition: inline
In-Reply-To: <fd59a3621e864b4a84fc69f72e0a51af@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com, gnomes@lxorguk.ukuu.org.uk


--n7sd4eclgvc2aw2j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Monday 29 January 2018 16:22:07 Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
> > Sent: Saturday, January 27, 2018 8:51 AM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; andy.shevchenko@gmail.com; linux-
> > kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; luto@kerne=
l.org;
> > quasisec@google.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de;
> > greg@kroah.com; gnomes@lxorguk.ukuu.org.uk
> > Subject: Re: [PATCH v10 12/15] platform/x86: dell-smbios: Add filtering=
 support
> >=20
> > On Friday 05 January 2018 14:48:39 Mario.Limonciello@dell.com wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-dr=
iver-x86-
> > > > owner@vger.kernel.org] On Behalf Of Pali Roh=C3=A1r
> > > > Sent: Friday, January 5, 2018 8:44 AM
> > > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > > > Cc: dvhart@infradead.org; andy.shevchenko@gmail.com; linux-
> > > > kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
> > luto@kernel.org;
> > > > quasisec@google.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.d=
e;
> > > > greg@kroah.com; gnomes@lxorguk.ukuu.org.uk
> > > > Subject: Re: [PATCH v10 12/15] platform/x86: dell-smbios: Add filte=
ring support
> > > >
> > > > On Friday 05 January 2018 14:32:54 Mario.Limonciello@dell.com wrote:
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: platform-driver-x86-owner@vger.kernel.org [mailto:platfor=
m-driver-
> > x86-
> > > > > > owner@vger.kernel.org] On Behalf Of Pali Roh=C3=A1r
> > > > > > Sent: Friday, January 5, 2018 5:13 AM
> > > > > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > > > > > Cc: dvhart@infradead.org; Andy Shevchenko
> > <andy.shevchenko@gmail.com>;
> > > > > > LKML <linux-kernel@vger.kernel.org>; platform-driver-
> > x86@vger.kernel.org;
> > > > Andy
> > > > > > Lutomirski <luto@kernel.org>; quasisec@google.com; rjw@rjwysock=
i.net;
> > > > > > mjg59@google.com; hch@lst.de; Greg KH <greg@kroah.com>; Alan Cox
> > > > > > <gnomes@lxorguk.ukuu.org.uk>
> > > > > > Subject: Re: [PATCH v10 12/15] platform/x86: dell-smbios: Add f=
iltering
> > support
> > > > > >
> > > > > > I know that this patch is already applied and merged, but I spo=
tted this
> > > > > > problem:
> > > > > >
> > > > > > On Thursday 19 October 2017 12:50:15 Mario Limonciello wrote:
> > > > > > > +/* calls that are explicitly blacklisted */
> > > > > > > +static struct smbios_call call_blacklist[] =3D {
> > > > > > > +	{0x0000, 01, 07}, /* manufacturing use */
> > > > > > > +	{0x0000, 06, 05}, /* manufacturing use */
> > > > > > > +	{0x0000, 11, 03}, /* write once */
> > > > > > > +	{0x0000, 11, 07}, /* write once */
> > > > > >
> > > > > > Numbers prefixed by zero means that they are in octal notation,=
 right?
> > > > > Is that how the kernel interprets an integer prefix by zero?
> > > >
> > > > No, this is how C language define it. See e.g. C11 standard, section
> > > > 6.4.4.1 Integer constants:
> > > >
> > > > decimal-constant:
> > > > 	nonzero-digit
> > > > 	decimal-constant digit
> > > >
> > > > octal-constant:
> > > > 	0
> > > > 	octal-constant octal-digit
> > > >
> > > > So in C decimal number cannot start with digit zero.
> > > >
> > > > I think the place where octal numbers are used are in permissions (=
0777)
> > > >
> > > > > I prefixed by zero for readability, they're supposed to be decima=
l.
> > > > >
> > > > > > This can lead to misunderstanding, confusion or problems in fut=
ure...
> > > > > >
> > > > > > Can we have all numbers either in hexadecimal or decimal notati=
on?
> > > > >
> > > > > Could you elaborate more why this is problematic the way it is?
> > > >
> > > > Currently it is not problem as 7 is same number in octal (07) and
> > > > decimal (7). representation. But e.g. octal 077 is 63 in decimal.
> > > >
> > > > > Are you meaning you would rather see this?
> > > > > 	{0x0000, 1, 7}, /* manufacturing use */
> > > > > 	{0x0000, 6, 5}, /* manufacturing use */
> > > > > 	{0x0000, 11, 3}, /* write once */
> > > > > 	{0x0000, 11, 7}, /* write once */
> > > >
> > > > Yes, this is better. If you need to achieve alignment then use spac=
es.
> > > > Really, not leading zeros.
> > > >
> > > > > That seems less readable to me but should interpret the same way.
> > > >
> > > > Example:
> > > >
> > > > {0x000, 077, 7},
> > > > {0x000, 007, 7},
> > > >
> > > > is **not** same as
> > > >
> > > > {0x000,  77, 7},
> > > > {0x000,   7, 7},
> > > >
> > > > As first number in first section is (decimal) 63, not (decimal) 77.
> > > >
> > > > > Perhaps it would be better if you submit a patch with what is cle=
arer to
> > > > > you.
> > > > >
> > > > > >
> > > > > > > +	{0x0000, 11, 11}, /* write once */
> > > > > > > +	{0x0000, 19, -1}, /* diagnostics */
> > > > > > > +	/* handled by kernel: dell-laptop */
> > > > > > > +	{0x0000, CLASS_INFO, SELECT_RFKILL},
> > > > > > > +	{0x0000, CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT},
> > > > > > > +};
> > > > > >
> > > > > > --
> > > > > > Pali Roh=C3=A1r
> > > > > > pali.rohar@gmail.com
> > > >
> > > > --
> > > > Pali Roh=C3=A1r
> > > > pali.rohar@gmail.com
> > >
> > > Thanks very much for sharing.  I wasn't aware of this.  I'll send a p=
atch.
> >=20
> > Hi! Do you have a patch for it?
>=20
> I used the wrong tag so it didn't automatically CC you.  Sorry about that.
> It's here:
>=20
> https://patchwork.kernel.org/patch/10146671/

Ok, looks good for me.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--n7sd4eclgvc2aw2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCWm9PZwAKCRCL8Mk9A+RD
UtGcAKDCVvRAn1UujEpVQFx7PlOkzzTkqwCgndEYmDusYbgpZRtYDcFUL1zG/Wc=
=L8hu
-----END PGP SIGNATURE-----

--n7sd4eclgvc2aw2j--
