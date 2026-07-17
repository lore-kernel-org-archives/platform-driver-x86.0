Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BF03A75A7;
	Fri, 17 Jul 2026 23:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784332747; cv=none; b=udb7uBIlUrj41beM7C0I03zpJcaneO8xRsRKrKSJSMiawwYTw8oGhj5SQ0gKNr1+MNbjhy+VkMLAZRek9UqgNRhH9clvkR+w154hBWIfCGT+Y0rF/3hCtXOqjpCp5dgGxj4/pxRLW5FY5eBtPgZPghqDWFaNFSG+wa+dJvjX60M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784332747; c=relaxed/simple;
	bh=MFKwdefRCTBWwcf2jZp10uCVqiBPzCY+PZlJvwsbNPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFlBrDwvSmCUHdnLLWCJs3DXhB/stpTGLASJ3GECnAbD7i1lMr1+ubUe9QmA/0EO71dMU5WQsaUqCvjhRuyHZPG3fSYHhjtKcnxCDv1KkY3s0jpSDp+FP+2CifL0Lp84ZJ2JR9k60N0iuhMWFKiPIyghatXcoOBwPBJe2uvWbFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOMKrUGH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOMKrUGH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2E11F000E9;
	Fri, 17 Jul 2026 23:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784332745;
	bh=3G6A+9j+sZX3IO4q+z3msgOTr6UAWCTjtBj4kWpSqs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MOMKrUGH4LCbuepKBvGqfl4lo96t0vHhKQkMzICkMAxxBEHY9dgk4+4qS3I/LZwZ6
	 ERTN3U8fJIaUbofS4RjSpw/2OUBXsDBtCkY4Rr/LoYwdGXIPTWwu0BwvCwocwqrtPo
	 SRLe+1YobrsdxVpwdvzbWyw3SPInFM1MZMdz7HKfH4tD3aLBFQznBS7bxZe7BgYede
	 QqnkaxKS6P+wVRR91Jiuh49z12w01MQM4YtE2o8CFKniaPcGvIznHGNnECY19LYbtV
	 f/1698WRwB2ReYfayMA0YUTU31CcpuKVmgt5gO5A+0BAZqzgmp1PiFhJSKuyuY5zlQ
	 c6t28GxsF2aUg==
Received: by venus (Postfix, from userid 1000)
	id CFD3D181CD9; Sat, 18 Jul 2026 01:59:02 +0200 (CEST)
Date: Sat, 18 Jul 2026 01:59:02 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Pan Chuang <panchuang@vivo.com>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Pengyu Luo <mitltlatltl@gmail.com>, 
	"open list:ARM64 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/7] platform: arm64: Remove redundant dev_err_probe()
Message-ID: <alrBnPQRMChEgqgt@venus>
References: <20260717112103.213017-1-panchuang@vivo.com>
 <20260717112103.213017-2-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vnixo42rmjposadd"
Content-Disposition: inline
In-Reply-To: <20260717112103.213017-2-panchuang@vivo.com>


--vnixo42rmjposadd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/7] platform: arm64: Remove redundant dev_err_probe()
MIME-Version: 1.0

Hi,

On Fri, Jul 17, 2026 at 07:20:39PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err_probe() calls.
>=20
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---

Reviewed-by: Sebastian Reichel <sre@kernel.org>

Greetings,

-- Sebastian

>  drivers/platform/arm64/acer-aspire1-ec.c      | 2 +-
>  drivers/platform/arm64/huawei-gaokun-ec.c     | 2 +-
>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 2 +-
>  drivers/platform/arm64/lenovo-yoga-c630.c     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/arm64/acer-aspire1-ec.c b/drivers/platform/=
arm64/acer-aspire1-ec.c
> index 08d0b155a197..501c62a096f8 100644
> --- a/drivers/platform/arm64/acer-aspire1-ec.c
> +++ b/drivers/platform/arm64/acer-aspire1-ec.c
> @@ -514,7 +514,7 @@ static int aspire_ec_probe(struct i2c_client *client)
>  					aspire_ec_irq_handler, IRQF_ONESHOT,
>  					dev_name(dev), ec);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to request irq\n");
> +		return ret;
> =20
>  	return 0;
>  }
> diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c b/drivers/platform=
/arm64/huawei-gaokun-ec.c
> index 80a8ba8b8dda..d4ce8ad6426c 100644
> --- a/drivers/platform/arm64/huawei-gaokun-ec.c
> +++ b/drivers/platform/arm64/huawei-gaokun-ec.c
> @@ -783,7 +783,7 @@ static int gaokun_ec_probe(struct i2c_client *client)
>  					gaokun_ec_irq_handler, IRQF_ONESHOT,
>  					dev_name(dev), ec);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> +		return ret;
> =20
>  	ec->hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "gaokun_ec_=
hwmon",
>  							     ec, &gaokun_ec_hwmon_chip_info, NULL);
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/plat=
form/arm64/lenovo-thinkpad-t14s.c
> index e7acb66b77f2..191ecd7f85b5 100644
> --- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> @@ -594,7 +594,7 @@ static int t14s_ec_probe(struct i2c_client *client)
>  					t14s_ec_irq_handler,
>  					IRQF_ONESHOT, dev_name(dev), ec);
>  	if (ret < 0)
> -		return dev_err_probe(dev, ret, "Failed to get IRQ\n");
> +		return ret;
> =20
>  	/*
>  	 * Disable wakeup support by default, because the driver currently does
> diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform=
/arm64/lenovo-yoga-c630.c
> index a8600a977fbc..cad40c58c55b 100644
> --- a/drivers/platform/arm64/lenovo-yoga-c630.c
> +++ b/drivers/platform/arm64/lenovo-yoga-c630.c
> @@ -221,7 +221,7 @@ static int yoga_c630_ec_probe(struct i2c_client *clie=
nt)
>  					NULL, yoga_c630_ec_thread_intr,
>  					IRQF_ONESHOT, "yoga_c630_ec", ec);
>  	if (ret < 0)
> -		return dev_err_probe(dev, ret, "unable to request irq\n");
> +		return ret;
> =20
>  	ret =3D yoga_c630_aux_init(dev, YOGA_C630_DEV_PSY, ec);
>  	if (ret)
> --=20
> 2.34.1
>=20

--vnixo42rmjposadd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpawcMACgkQ2O7X88g7
+pqQGhAAh3Br+pGxg/oIQZvUOh7Udav0zwvGCzL6Co4H2vOGk5mvz8nkyWjV5vOi
BJr8+k8OHxC6qgJDcx/3RBCY174/shvfl3MiBymWPIMYf7y5bBGkaMcVn6si1OWo
bujWsXbLdRzElnnd91BhuDbw4SL46Lc7rhEgdiWGHxGzJ5TLRj1UiwMMXhwynlBC
+9OIxTUElXalN76Lfkvz0dm2tibrx8oeMbN2ODlxd2j2EUdbC7xBkJ+Gl7fM3EXu
+vquavr8TdyzQIlAzK9CGVe6ud35o8Nfio5CCPOQ50ouEIY+Td/jWiakOFvYpAhi
1QMCLmkudc6omDAMPyMJ4B0qPKeaMCwhfe2vwOg7ELHpJGNx9I23NVusKJgasiF9
TW48ZcmM/ET8K/oIhxebv1WuxfxbkkcH2/EVe3jtn7q6VYbIW8pKandiA0R58JD6
v1tibhmWA134LxpowAAziXFwgPEuMBcY5k8jw94EvYPNUdcbo0vNiKBVyfyXzjbK
QFzYJidNQWkSH8gO8EwTd+B4k4KTEAZ/O2my3J4jfQ3C9Jn7Vpe7oxMvQhpsW8hC
bJZBhHVFrCxBrVYLNrLJrqk+hX3ppxEL6IpzLKJaKklUHYqlk3NYSFFVSGZNzCtE
iY13SNshfJbQqWV8lUhLcP63ZfIBXbvQj539C0UzewzJo5SNRzQ=
=xsnZ
-----END PGP SIGNATURE-----

--vnixo42rmjposadd--
