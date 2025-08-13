Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F92BF3C5
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Aug 2025 19:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755112220; cv=none; b=d14YBMX3fpGNx0B7gf05fnmlJ37c5IAMdrL02HOEPaLwqjnDsRtNj9V6ZBbrdkWt5IAdJPYfFrszRjuFlWJZCqdAILn075wzqQxa8yaMh70CnpaDydtnYbC5eCBXBU91Pa+7lyLOJ6XicGSMJFWBRK+631cO2OeR5LHGtSK0e2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755112220; c=relaxed/simple;
	bh=m7hBXsIBxitVlmsl3609mk3+4iieYV9lm/di6S973zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ociWP7Ts/E2+72nq0kecG9iXX3SGAI586sJe4S5gkN6HMxuRwxeAb0cix/mUpDPzMMrbkTGTJT4bKjacikHkvfNWEZMx8eR7krmE8EsJf9JQAaD0NcoTzSfZFdbYlep/F6XoxMTQdrEgD8VGK9bGc18q6om4zLaqbllme/o71Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dBrB/EPM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dBrB/EPM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=MW59
	OM8iyHM8tNxaL/4snZLv48pcT0pbQZwdeZXlE2Q=; b=dBrB/EPM6J4aD0RXEZ+C
	wtWg/Bfts7eCs/1jfaFGs/UV1lv2XViHvTiPx46B/8Qs105RPVeqmHFiZGfZI1z0
	QYvQHDqgcRo0oZO+E+HSQJews6M5MXhLmxAofObJk1HJIHcU8tkYMF4W+64AZqmg
	r6mXgj4yP5eXa0k45nOeILA3eL1C0MNfr5lvvzGCX625bfh3XTnXKwkvZjpHyIPH
	2snzGNVemqftbFSL9nlfrsE3RnPeYKrCGAnhEk2XLwvYlI1PUDJ8AJQ4x7iVa9nq
	NyUrDQJVzQFJw6JXwNG7nSK9T6qi0hHOGCKoHHEqgcraKX3ReozQ2eqeaK+fKr2z
	xw==
Received: (qmail 733730 invoked from network); 13 Aug 2025 21:10:15 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 21:10:15 +0200
X-UD-Smtp-Session: l3s3148p1@JYIU6EM8lIptKDDX
Date: Wed, 13 Aug 2025 21:10:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: platform-driver-x86@vger.kernel.org
Cc: Yen-Chi Huang <jesse.huang@portwell.com.tw>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH] platform/x86: portwell-ec: don't print superfluous errors
Message-ID: <aJzjFjAouLMDIvOw@shikoro>
References: <20250813190816.3742-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tBOfM8QV9V4AMtqX"
Content-Disposition: inline
In-Reply-To: <20250813190816.3742-2-wsa+renesas@sang-engineering.com>


--tBOfM8QV9V4AMtqX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


>  	ec_wdt_dev.parent =3D &pdev->dev;
>  	ret =3D devm_watchdog_register_device(&pdev->dev, &ec_wdt_dev);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "failed to register Portwell EC Watchdog\n");
> +	if (ret < 0)
>  		return ret;
> -	}
> =20
>  	return 0;

Argh, I just saw, this can be simplified more. Sorry for the premature
patch!


--tBOfM8QV9V4AMtqX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmic4xIACgkQFA3kzBSg
KbaYww//ZdKqcxTTur60HznfhpQqcpq505JT1mfmTmQd4pfVRtAeT1peGiXi7+dM
Qkn7Tj/X80nhIs1TNQ69xqDXuuQQfJG/9Q01gx/3cmT/AXmFFPNyZ9HhwQJMgYHA
ur7v2q4qB8wvaLVlRZBM0UeMToWkymhgDHXyycH2C5Bmx7QSRrqxQWcXSFe9RcUN
G58Fnt/ANHe3TBoFL3+VAHSnOtsk7Nm3dnN55mNnUFmuIsJ7Tpezco+JdIZfH4RL
A/rQcVSmLjG5ROfhTpCPm1LnTeiPqaeuk+TOay48SodL41eR9grThJjMn+KFVYMY
NnJLGvJ45Nwod+FNFjhf2YCSr+h3FDOK60R52t/rRyQALc44FMzYdxg83vngQyf4
gU6Kcfh1kJj8Wi0o3HVX0u/xolF/jnASniNrfmhMRc1Uo7Daav/el5plafNmtSHd
Nn0WzC4WXkfUotV0k4FxinLmrZzmRdXKFF1EA1PXifEZYZXsTEtJrN0PlolfMoIA
BvQV+nzxxubqnbTO/gK/sA3xleeR9WzM3Nky7QS8hj08aPXdzWSAL+CfBdb8g6/P
esRjO3DOfnvCNy1jmgtjTwMYnb4+AJchV2HbjC0O9Pf4Havaivy75HGszOdYlT8n
dtiXpCqBnHzCFZBDplab1k0LRGtUP2SJh/PHFv74q0dCa7vnchU=
=U3Zi
-----END PGP SIGNATURE-----

--tBOfM8QV9V4AMtqX--
