From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 2/8] platform/x86: dell-smbios: Introduce a WMI-ACPI interface
Date: Sat, 30 Sep 2017 23:06:23 +0200
Message-ID: <201709302306.23823@pali>
References: <cover.1506571187.git.mario.limonciello@dell.com> <20170929073545.GA13546@pali> <755afe9768c842a187751454cc7bb6e4@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2495303.ooB6R7jfAK";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f177.google.com ([209.85.128.177]:48759 "EHLO
        mail-wr0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751141AbdI3VG1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Sep 2017 17:06:27 -0400
In-Reply-To: <755afe9768c842a187751454cc7bb6e4@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com

--nextPart2495303.ooB6R7jfAK
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 30 September 2017 22:01:04 Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
> > Sent: Friday, September 29, 2017 2:36 AM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; andy.shevchenko@gmail.com; linux-
> > kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
> > luto@kernel.org; quasisec@google.com
> > Subject: Re: [PATCH v3 2/8] platform/x86: dell-smbios: Introduce a
> > WMI-ACPI interface
> >=20
> > On Thursday 28 September 2017 22:43:36 Mario.Limonciello@dell.com
> > wrote:
> > > > > @@ -170,10 +226,43 @@ static void __init find_tokens(const
> > > > > struct
> >=20
> > dmi_header
> >=20
> > > > *dm, void *dummy)
> > > >=20
> > > > >  	}
> > > > > =20
> > > > >  }
> > > > >=20
> > > > > -static int __init dell_smbios_init(void)
> > > > > +static int dell_smbios_wmi_probe(struct wmi_device *wdev)
> > > > > +{
> > > > > +	/* no longer need the SMI page */
> > > > > +	free_page((unsigned long)buffer);
> > > > > +
> > > > > +	/* WMI buffer should be 32k */
> > > > > +	buffer =3D (void *)__get_free_pages(GFP_KERNEL, 3);
> > > > > +	if (!buffer)
> > > > > +		return -ENOMEM;
> > > > > +	bufferlen =3D sizeof(struct wmi_calling_interface_buffer);
> > > > > +	wmi_dev =3D wdev;
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static int dell_smbios_wmi_remove(struct wmi_device *wdev)
> > > > >=20
> > > > >  {
> > > > >=20
> > > > > -	int ret;
> > > > > +	wmi_dev =3D NULL;
> > > > > +	free_pages((unsigned long)buffer, 3);
> > > > > +	return 0;
> > > > > +}
> > > >=20
> > > > This code does not seem to be safe. dell_smbios_wmi_probe and
> > > > dell_smbios_wmi_remove are called at any time when kernel
> > > > register new device which matches some properties OR when user
> > > > manually bind this driver to that device.
> > >=20
> > > I'll adjust for the assumptions I made about it only happening at
> > > module init.
> > >=20
> > > > buffer and wmi_dev is shared as a global variable which means
> > > > that when there are two devices which want to bind to this
> > > > driver, kernel would get double free at removing time.
> > >=20
> > > But there is only one GUID in id_table.
> >=20
> > That is truth, but ...
> >=20
> > > How can two devices bind to this?
> > > This should be an impossible scenario.
> >=20
> > ... in ACPI DSDT can be more WMI _WDG buffers which could lead to
> > more wmi buses and each could have own GUID. Therefore there is a
> > theoretical chance that specially prepared ACPI DSDT code can
> > cause this problem.
>=20
> I guess I'm a bit confused - is this for protecting a user who
> patches their own DSDT or from a vendor releasing a system with two
> _WDG buffers with the same GUID?

It is protection for memory corruption done by dell-smbios driver in=20
case such DSDT would be parsed by kernel (either by user who patches=20
original DSDT or when vendor created such DSDT by mistake or by=20
malicious software which patch/provide such DSDT...).

DSDT is from kernel point of view external (possible untrusted) data.=20
ACPI parser in kernel parse it if they are syntactically correct, but=20
semantic or e.g. _WDG meaning is up to consumer -- in our case wmi and=20
dell-smbios wmi drivers.

> I don't believe MOF has a concept of which WDG buffer GUIDs are
> assigned to.  That could lead to massively undefined behavior too
> since the WDG buffer will potentially assign different ASL to
> process for each GUID.=20

Yes, that would lead to undefined behaviour. But still it should not=20
crash kernel. Either treat such thing as "corrupted data" and refuse to=20
use it or treat it in deterministic way, e.g. "first come, first serve"=20
or load it driver for all guids...

E.g. DSDT on Thinkpads has more _WDG buffers and I was told that some=20
machines with Nvidia graphics cards really have duplicate WMI GUIDs in=20
_WDG. So such situation really happen in world, it is not just=20
theoretical.

> > The whole problem is that SMBIOS calls are implemented via
> > singleton pattern. And this singleton "instance" needs to use
> > something which is not a singleton, but a dynamic objects (wmi
> > device <--> driver pattern).
> >=20
> > Idea how to handle it:
> > * put wmi smbios call function into own driver
> > * put smm smbios call function into own driver
> > * create dispatcher function which take first available device of
> > one of
> >=20
> >   the above driver and call on them smbios call function
> >=20
> > This problem is very similar to problems in objects world... driver
> > as a class and device as a instance.
> >=20
> > (Or if somebody has a better idea, let us know...)
>=20
> So I like the 3rd idea the most, and it's what I'm working on.  I've
> got some problems with it that I'm still fixing, but unless someone
> tells me otherwise I'll go for that with v4.

All above 3 points (*) were meant as one solution. Putting wmi and smm=20
calls into own drivers and then creating dispatcher function which would=20
use available device of one of those two drivers.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2495303.ooB6R7jfAK
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlnQB08ACgkQi/DJPQPkQ1I+ugCgr/a0KUg7hAh6+M12tgjKQ5Ic
FW4AniZcvVRfGuE930d45ykakozitIxv
=ATTz
-----END PGP SIGNATURE-----

--nextPart2495303.ooB6R7jfAK--
