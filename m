From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 3/8] platform/x86: dell-wmi-smbios: Use Dell WMI descriptor check
Date: Sat, 30 Sep 2017 22:01:26 +0200
Message-ID: <201709302201.27017@pali>
References: <cover.1506571187.git.mario.limonciello@dell.com> <20170930012912.GB13307@fury> <fa02a34098914fb7a31b563d8b56dcc7@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2090043.EaakNCKAal";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f179.google.com ([209.85.128.179]:45206 "EHLO
        mail-wr0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751099AbdI3UBa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Sep 2017 16:01:30 -0400
In-Reply-To: <fa02a34098914fb7a31b563d8b56dcc7@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com

--nextPart2090043.EaakNCKAal
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 30 September 2017 21:48:39 Mario.Limonciello@dell.com wrote:
> > > +/*
> >=20
> > > + * Descriptor buffer is 128 byte long and contains:
> > ...
> >=20
> > > +	if (obj->buffer.length !=3D 128) {
> > > +		dev_err(&wdev->dev,
> > > +			"Dell descriptor buffer has invalid length (%d)\n",
> > > +			obj->buffer.length);
> >=20
> > This seems odd. We call it an error (not a warning) if !=3D 128, but
> > we only abort and return an error if it's < 16.
> >=20
> > If it's an error, we should return an error code, if anything above
> > 16 is acceptable but 128 is preferred, the above should be a
> > warning at best. (this scenario seems unlikely).
>=20
> Hopefully the original author can speak up to the intentions here.  I
> would feel that it should have errored out if it wasn't expected
> length too.

Code below access first 16 bytes of buffer. Therefore to prevent buffer=20
overflow check for 16 bytes is needed.

But IIRC we decided to do not throw error and continue driver loading=20
even when buffer length is not 128 (as expected by some Dell=20
documentation) as it could be possible regression because driver itself=20
does not depend on buffer length.

> > > +		if (obj->buffer.length < 16) {
> > > +			ret =3D -EINVAL;
> > > +			goto out;
> > > +		}
> > > +	}
> > > +	desc_buffer =3D (u32 *)obj->buffer.pointer;
> > > +
> > > +	if (desc_buffer[0] !=3D 0x4C4C4544 && desc_buffer[1] !=3D
> > > 0x494D5720)

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2090043.EaakNCKAal
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlnP+BcACgkQi/DJPQPkQ1Kw5gCfdXFrRMn7rd9xCP9oh/U9BeAW
7FgAn3fq24VWWncmYsRRuSplPmZtBBA3
=WRbm
-----END PGP SIGNATURE-----

--nextPart2090043.EaakNCKAal--
