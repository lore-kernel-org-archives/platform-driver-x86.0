Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498401;
	b=tpaNaxyNSZP2iFoR7rltUb/3ya96mMMuTC7R/Q99f3XqgM/R7+INRkLsLBMnSd5eoCZZ
	 s9XfihN6FTckgGRUdjeHkosUmexNQeHqQlJt+yQ/HUQFgO4b7eVJ4xm5264sjFz+6iolj
	 OPlxzXBYrFS3MkAzosmDxXyZqN8HG7QSUv02VKpyHITOpN9GlgHV1lACU125um5mgNQf8
	 EZfwSyOfCNZWTtHjnZawW8cYAlhcJRIsOymXEF4No7w1LUkPcWMhSa5YxWrmm5Q69gtVe
	 Mw7gPbFcvd7ZMkdKNssyLIGX2+Rbwmpyh6HxejUAShdOVXTKTSGBfz7A3OwbQRmuSew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498401;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CncqAgZ9S7hLi/UzenmlpIHNNZwlqxjlgqT4T6VRPAU=;
	b=EtkW+vBcRS+rGIjjPyFQqJUrVzKeam4poOgriTE0y9/l8+xRjchRGB1pt9gM/8tE3ie3
	 Tc9UNjkL+k+kOnoApf2T4vo+BnjLDGEjWBP9fJrzugwq7hIv6J/fqfAEBKBnnrcnUDlaQ
	 ui+ecD9AIbwagKygNFXgA388EaMzi0C88Zbx+kyIbW5P8zRVlteCYXXU7oc5W1d3f/fPt
	 umCvDKT04QJct2rDyES3lWCly9Q4jOSfKc7P4M25dXoCxJlLI2dClMIID0R9MQVujI/mp
	 dl4Vf9X6oaxbVikEg2Ws8r8vDtod5teiPEO0aNKd5t79pk0e7tjBi6XlqmyE70n8ygw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZDO5sgov;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 20C1A606A319;
	Tue, 20 Oct 2026 12:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZDO5sgov
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3F6541F000C4;
	Tue, 20 Oct 2026 12:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792498400;
	bh=CncqAgZ9S7hLi/UzenmlpIHNNZwlqxjlgqT4T6VRPAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZDO5sgovlktP/l6b5azChhaEkESTLCCr9p0PSHsaKfTj8HMgfI0jvFFqHDkLoXuC0
	 aygB4hfdPcmshcNODALcDs/qeB5LihwAx1QDKF1kpInW6qYMKg+ES3GpjH2HPzeMf8
	 QE2BdoN/uQH/I1bgl4XkhbK3+oYq2W0LqH+xGg9zdCvTCD9WXN5IF42AnYq9tDQirA
	 IXraZdP26rmlM0YdZJ0xjUkSNYAIP4nCcnFnHKwfSf0bVGKiIuUole9Rpj4CAPVAx5
	 cvS5gNXU7F21xq6/dYXGizpGTjE1yAAzk1igpHLnTfBnLu4CFM01k1+AuEVJg13d2P
	 yoyrTGywCP8uw==
Date: Tue, 20 Oct 2026 14:13:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Alexander Patrakov <patrakov@gmail.com>, johannes.goede@oss.qualcomm.com, adee.sahan@gmail.com, 
	andy@kernel.org, antti.laakso@linux.intel.com, dan.scally@ideasonboard.com, 
	diamondback@cohunt.app, ilpo.jarvinen@linux.intel.com, linux-media@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: ov5675: Add the OVTI5678 RGB-IR variant
Message-ID: <atdaMqiA3RSb5GEs@monoceros>
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com>
 <20261020015001.15672-3-patrakov@gmail.com>
 <atcpXzA6KQfgiD7J@kekkonen.localdomain>
 <atcs_nK50gJ3dBRX@ashevche-desk.local>
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
	protocol="application/pgp-signature"; boundary="l6kp3ebxxlydxnu3"
Content-Disposition: inline
In-Reply-To: <atcs_nK50gJ3dBRX@ashevche-desk.local>


--l6kp3ebxxlydxnu3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] media: i2c: ov5675: Add the OVTI5678 RGB-IR variant
MIME-Version: 1.0

Hello Andy,

On Tue, Oct 20, 2026 at 11:57:34AM +0300, Andy Shevchenko wrote:
> On Tue, Oct 20, 2026 at 11:42:07AM +0300, Sakari Ailus wrote:
> > On Tue, Oct 20, 2026 at 09:50:01AM +0800, Alexander Patrakov wrote:
>=20
> ...
>=20
> > >  #include <linux/gpio/consumer.h>
> > >  #include <linux/i2c.h>
> > > +#include <linux/mod_devicetable.h>
> >=20
> > #include <linux/device-id/acpi.h>
>=20
> No, this has to be part of i2c.h on par with device-id/of.h

Well, <linux/i2c.h> includes <linux/acpi.h> which in turn includes
<linux/device-id/acpi.h>, so <linux/i2c.h> already provides
acpi_device_id.
=20
> Uwe, can we get this fixed, please?

With the above said, there is nothing to fix, is there?

Best regards
Uwe

--l6kp3ebxxlydxnu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrXWtsACgkQj4D7WH0S
/k67aAf+M2xQ+7JL8vlpjQwKbDqzc9GZCnp5I84Ikh9GwgOG33Ersfp4W/Wk/feZ
pnWQ6wXGs8EKVy01JMLMzlEvJDSU5NvqEC16SlhCT5L+yUqxMbjW/8Or5P+nctCO
kGa0C0uHcxMdRvrTLnLj1iIhd6BoMVQQqJoEQeYVpA9Z0ZIwSVL4ICPIOgt7msZ+
oxKonvUT0Ut4teMtLMbNqUFzMgwgVu7As6zLGXg6JNI9iE9l3TLIZLD3nvJhpsHu
C3VMdTMUqu5nntqBpUmBUZ2BsigDlqofWiYwPZK6xYG4rfOWS+CAkM7oLa2+86in
F4PUPbk9l95Z3cd8F+Aq/6/JAK4V0Q==
=YNH/
-----END PGP SIGNATURE-----

--l6kp3ebxxlydxnu3--
