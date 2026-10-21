Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569460;
	b=XTWZyE6cFnzAhPzy2UMpuhTcVW6aJwLrTuSUxXSTNBxZOE4qkQ/xtfnclVLP/2cBND/l
	 mEkuT4ZZGPd8ng/CwkvSIPJeydX1X6Wee9XbWBPakiJQ7pgUUcf9rZBe5KA2519QF9XP3
	 V0WTEHdXseJqGXunzta9AmLk1NBysbKanaZei5thPkWYe6TdChmJy/Btdjcz2+IXmj3zr
	 EUUx/ibyUDRN6RW6F+pdVPXKVInlgCpfB0JhKTWaVGimzOoC/ShPMJGHuDS10ZVFZw7zW
	 Fu8ulArsYX1yBbCIPvyotn7VRnwOA4myLzzBbBUxKIFrrnEkDkrLpgv5k1zYauTj2YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569460;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BV9BOHopYA3wXVCh5Eknj+WEQ523UWns6dBr5+4bBG0=;
	b=MvUfmkMvEcLqsi7T7q0sLPTJpUDJTIx1h0XR+Zwke0WYh0swGkGjnegT92FgNpiG2gIN
	 P0qscDjMYQ7/K29LSw94/A+GbTlrT6u23TfoTC2Mn7NIljqXT6a1jKvT8nMni3T4gQ5cc
	 mCYUSK2sC6t99sRwhEFe6xerCuCtfGoVMZBIFskcYl6aW98T2HDY6LYkuGok5brhNdjgr
	 ee2Hef9P5r5QR9RZMV/SQoBmWRr2mSmlkmK6avOYS3alrnTNrNkR5iLK+gbFv0dY6xDu9
	 eeb/c2zEdJMWlxq8ZWDTTUacKlLkr9LSiEkYmvHjf1if73xCK1xPBKYsIBKJRWAa8ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jd9ocoul;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 6E344606A328;
	Wed, 21 Oct 2026 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jd9ocoul
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 7AE5A1F00ADF;
	Wed, 21 Oct 2026 07:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792569460;
	bh=BV9BOHopYA3wXVCh5Eknj+WEQ523UWns6dBr5+4bBG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jd9ocoulOy00YLsKjx28C7XkFRzYMQNreki9UstyZ/GcY6oEM9TCpyf/S+Sg44GLd
	 dDiYUVdzCIGukKIHRT9ffHevKMU9nJJEa0RLTqNKTJKFlEd3q06sc+hY9EdY42jpcL
	 lT5IIORLLQUV6sgu8Z/PzJFtYdGi5JbCtB37W6/67NNL6Iz9kdHa+qx+nGkvVnn3LW
	 9KD6M9JOJl15JHclL3HTk7pxz5F02Gr2sKCz3hV9Plav5bvkCP9uV+qqzNLkpsWMlZ
	 OwnEuFa9IHuosXSIQY8m352LbfSupeJjl+mtAOgzOxRwgj4SNvIkjk3c9vR64Qm9Xr
	 9AJ9Cf8Y8eRNg==
Date: Wed, 21 Oct 2026 09:57:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Alexander Patrakov <patrakov@gmail.com>, 
	johannes.goede@oss.qualcomm.com, adee.sahan@gmail.com, andy@kernel.org, 
	antti.laakso@linux.intel.com, dan.scally@ideasonboard.com, diamondback@cohunt.app, 
	ilpo.jarvinen@linux.intel.com, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: ov5675: Add the OVTI5678 RGB-IR variant
Message-ID: <athwFX2It1emIVYk@monoceros>
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com>
 <20261020015001.15672-3-patrakov@gmail.com>
 <atcpXzA6KQfgiD7J@kekkonen.localdomain>
 <atcs_nK50gJ3dBRX@ashevche-desk.local>
 <atdaMqiA3RSb5GEs@monoceros>
 <CAHp75VeoH8FMcwx1Q2C_KhxUrVCEKxetBq53BNwotgPMA714ww@mail.gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6rakhpiudnje6wwv"
Content-Disposition: inline
In-Reply-To: <CAHp75VeoH8FMcwx1Q2C_KhxUrVCEKxetBq53BNwotgPMA714ww@mail.gmail.com>


--6rakhpiudnje6wwv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] media: i2c: ov5675: Add the OVTI5678 RGB-IR variant
MIME-Version: 1.0

Hello Andy,

On Wed, Oct 21, 2026 at 08:57:58AM +0300, Andy Shevchenko wrote:
> On Tue, Oct 20, 2026 at 3:13=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@k=
ernel.org> wrote:
> > On Tue, Oct 20, 2026 at 11:57:34AM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 20, 2026 at 11:42:07AM +0300, Sakari Ailus wrote:
> > > > On Tue, Oct 20, 2026 at 09:50:01AM +0800, Alexander Patrakov wrote:
>=20
> ...
>=20
> > > > >  #include <linux/gpio/consumer.h>
> > > > >  #include <linux/i2c.h>
> > > > > +#include <linux/mod_devicetable.h>
> > > >
> > > > #include <linux/device-id/acpi.h>
> > >
> > > No, this has to be part of i2c.h on par with device-id/of.h
> >
> > Well, <linux/i2c.h> includes <linux/acpi.h> which in turn includes
> > <linux/device-id/acpi.h>, so <linux/i2c.h> already provides
> > acpi_device_id.
> >
> > > Uwe, can we get this fixed, please?
> >
> > With the above said, there is nothing to fix, is there?
>=20
> I believe it's just a coincidence. We need to include both explicitly
> (I mean -id/of.h and -id/acpi.h). Do spi.h and platform_device.h
> include acpi.h as well?
>=20
> TL;DR: we have an inconsistency behind this, so it's definitely
> something to address.

IMHO the transitive include is good enough, so I won't address your
concern. But if you consider it important, I also won't (try to) stop
you.

Best regards
Uwe


--6rakhpiudnje6wwv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrYcG4ACgkQj4D7WH0S
/k70RAgApf6QQsrq+lNVEWv3xsRoSFEJFcLqADowk2GFHip5qaRv0tmd/v+p3xsV
00r9r3gOtNow7tvoEym8c8R2RF0ChjvZ+XIw6/sT45ebvgsW+H54ZDF/l0OsD9Dy
6+zTSHg1Bq6Wwz0jTL0kpdNtppX0jkyk7xeFu7MdgfYEebq1I3GFNDJpNXSVLacI
t5nADdGLjucKmFoTrhfKoFP5ylYQH2olJmwjnGdUISSGJvk0056NrJVcU0XkdMRZ
yv5t8YFxWCSm/13ThFeoNhAIKRBS2OQ5bzKtuRWodEscdTAi8R9mnKmQlomzmZ+E
m8TavMmVTRlhY1sQ07QZ/4AS/fT31Q==
=BzOZ
-----END PGP SIGNATURE-----

--6rakhpiudnje6wwv--
