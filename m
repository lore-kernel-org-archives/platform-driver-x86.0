Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF7718801F
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Oct 2024 06:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729233642; cv=none; b=cc5sUZK2DaBac8ZXuIaIefMwLHBLdz3P1rGveCL2zMGsuINBNd5JZmjcHL/MvenWcxynevvxczAZoUWczD96HyAf1CBZ7MsOP8jI7h2BZW6Fph9WvNmFYfICdtHv4NTTlwy6RQhFsNf5ZxCr3ORCcao9Hk01V18Tk9SmmRq4iZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729233642; c=relaxed/simple;
	bh=a1/l89aFF3iZxzxm9q9BzHAxqnEzpRKVES/G+t+kDKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNwjk5D/2CSoVoqsIsQZ3a4LqFYsLO4/kS5rRurp7RanC1KwkMRoZvOLomFxyVrTFd4c8K+DFR71JL4IYJ3XEdbR622uSnA9zo8OaJSQ//47mNfxnjZi0MqbNIJt+fb+lmfQmPrxKfksQrTcp4ShO4x0fwj5AP628QfsU50+d1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qJpKOTTs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qJpKOTTs"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4314c452180so19168735e9.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Oct 2024 23:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729233638; x=1729838438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a1/l89aFF3iZxzxm9q9BzHAxqnEzpRKVES/G+t+kDKk=;
        b=qJpKOTTsGv4Ux/1xdDyWSadkc0H+O6O7QDuTbVFabuVfLy2gTfPJDd1+pKk3xHjllO
         yq5MV4FpPBib0jmRckv7lVTtGkW4hu9Vt7OnG2EFiFgCt9fFhPaMqJTEjcGywD/Cq7pf
         QN0RXc6sOrj14HGux8bXg2JCGyEytxw5VVu2kjgnQA/i2dJsHKPSsrYZcnpG6uQOR6gK
         fbHmNJt9PEQHFox5hEpNHT7LfZnJINY/gyMPSO0Paf0SjRUvGX+TW9ITsUFk3N8HUVqZ
         uoA/pElwxHtKczqO5LoD/U45q1oG9xw+JFTWigif9leUVWys1YLysixkat8p4Bn8ZJ0e
         lMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729233638; x=1729838438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1/l89aFF3iZxzxm9q9BzHAxqnEzpRKVES/G+t+kDKk=;
        b=rqCtoI8UhGqOI9w89y87jBI/bZtV0QeK2kNH4sMB2WwKMlTsVOvOPOnlj2Eupid1xf
         zudfkh3yX5sLntqoNv6j/ZtfsYb7Z4Ktpjbdo1ACvfHKh/V/Tg8n4MFl86d4oKqY1vCx
         h3vaMcjMxBdkAlVDQP441TFEMfAW0lOtkClsWBgGm+KZ1qiTkhyURo16WpTiMvF41tek
         r4UcfDZp0v//nxOEL+o8DVRmRnxGaN9eJ7m+rLL+3tiQLW4C16dNpk1ve3nU+OdZsn0k
         GJTOJNmzl0/6v6rw7N/xMuuVXW60dKyFoauFILR00U/udnDM4NsFZ4NJnlVvaQ8ifJ7d
         0zRg==
X-Forwarded-Encrypted: i=1; AJvYcCWWNmoOQClzYoxj1xABnrsUWM1n3/8ko3vEVW6dNC7E+e1DpgYDNxg4+BHp8RRxF5mrN+OHF2aYVDyOtZDMuC75EeUr@vger.kernel.org
X-Gm-Message-State: AOJu0YxrukqXbOvzBFjYno/cQgMei8YX7Y64VEhF/BYMqmaANA1IsGvk
	FjmFd6P0hnUuY8Zr4eueKJ5uVrR+GPgNsUPhw3C7jHxaiofdUDBTx2MCkXl0nDw=
X-Google-Smtp-Source: AGHT+IGQ+sLfQnCnUNjx7Nr+TelPsFFkGvuHzKpfSrtS8bduv8FaNVaNFstwtpdYCWPteLgcSePgvw==
X-Received: by 2002:a05:600c:4e12:b0:42c:b98d:b993 with SMTP id 5b1f17b1804b1-4316161db92mr5632805e9.2.1729233637811;
        Thu, 17 Oct 2024 23:40:37 -0700 (PDT)
Received: from localhost (p509151f9.dip0.t-ipconnect.de. [80.145.81.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316067de15sm18143335e9.5.2024.10.17.23.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 23:40:37 -0700 (PDT)
Date: Fri, 18 Oct 2024 08:40:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: Switch back to struct
 platform_driver::remove()
Message-ID: <ge3xoxfiobwm5z572tdfc6rueikxlqwivngruhysdw5gtoif67@wagx5eid4bjy>
References: <20241017073802.53235-2-u.kleine-koenig@baylibre.com>
 <734d8937-a111-789a-4e0b-83c623408255@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k7lukmgbnq54umf4"
Content-Disposition: inline
In-Reply-To: <734d8937-a111-789a-4e0b-83c623408255@linux.intel.com>


--k7lukmgbnq54umf4
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] platform/x86: Switch back to struct
 platform_driver::remove()
MIME-Version: 1.0

Hello Ilpo,

On Thu, Oct 17, 2024 at 12:52:44PM +0300, Ilpo J=E4rvinen wrote:
> On Thu, 17 Oct 2024, Uwe Kleine-K=F6nig wrote:
> > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > return void") .remove() is (again) the right callback to implement for
> > platform drivers.
> >=20
> > Convert all platform drivers below drivers/platform/x86/ to use
> > .remove(), with the eventual goal to drop struct
> > platform_driver::remove_new(). As .remove() and .remove_new() have the
> > same prototypes, conversion is done by just changing the structure
> > member name in the driver initializer.
> >=20
> > While touching these files, make indention of the struct initializer
> > consistent in several files.
>=20
> Thanks.
>=20
> I've applied this patch now to review-ilpo branch, it applied conflict=20
> free (unsurprisingly).

Thanks.

> Next time, please make PATCH x/y out of indentation or any other unrelate=
d=20
> change (I'm happy to take them too). I often validate large-scale=20
> mechanical changes like this using tools because it's harder to fool=20
> a pattern matcher than my eyes/mind. Any unrelated change creates noise
> I have to deal with.

I'll try to remember. But I already now ask for forgiveness because in
my experience trivial whitespace only changes are not so well received
by most maintainers and in the past I was asked to squash these cleanups
into the functional patches. Do you know about git show -b (and diff
-b)?

Best regards
Uwe

--k7lukmgbnq54umf4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcSAtoACgkQj4D7WH0S
/k5Mzwf41fu7IgP/mqEAb6EetLdHybG4P8TL84Tda+33zgKe+FOjLvGf/xRXZ3Nn
IdmZqt3ZNIUdCMRB9dpQDokGIkNq2mb8lK+phjHqdXx+lNI6vYxOWinO1AuNQ9MQ
xXH+LDRdP1SSMUy+82klPe5SF9JKO40i8gJ9mCmOSSrEewsLUHxSGQuNvR7nPhs7
2qsKR2DUoei0sHElrLaJMVkQU9mnqg/I7Q1XtY0xQ+2hmnPFbss1aA/ZjqUmvXY8
dCtaKuT5lQS6Xtg9pYWtyB5BdRlaZidou2EfNd2SqXtbvdQahrSsUlVn5PFxzdUI
+6GVEEtRC6MQS49vV5iFzzqoH/7o
=B4D9
-----END PGP SIGNATURE-----

--k7lukmgbnq54umf4--
