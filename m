Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA5A191F83
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Oct 2024 09:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729070537; cv=none; b=tz8A35rAFE9ACCOMDlXzgWr6Tk3rfz8p0pdwCPONJmky0pXgznV1tzhDdP1avseVYBNs8Dt6p6xvSgDI06a2LCvhFMqTOwdfBoD8oHzMaaLv8YExmGwg9FTUqUjreQlt6ysGIaQTO9HySNEcvQ8lmbNNjP913eNldLlsozVWhs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729070537; c=relaxed/simple;
	bh=oT8bepxgiMc7eYXPUVdHyL9usBRvV5oUL83EE2LRL5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9KcKPqwTh7q1AonPc1T8QH/RT8x4ykpz2Jdz6hEBqIqHGx/FponKY+0twR+kdo9W0bd+1GnUBNdMggGSbuHlASKf/LTuh3G5oDsq559JiQq3NMqyyyD53by6zrFPXd9qzaTj5LD1V6AHEa5OE2kLUyskOdOvyuXAW5hJbZujqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nqoXiKg7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nqoXiKg7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4314f38d274so8821425e9.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Oct 2024 02:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729070533; x=1729675333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r9HmZV1HG+6gwTAP0CfUfE6HfllOXSnTHvKBpuXMoQo=;
        b=nqoXiKg7q2UWMnLRiLdMtHgsl11GdO/seWGOTA/DuYDM4vIESfsSkId89ESScehEM/
         EZDVHGk1PJVyZJSVhobFNUJHA37vJPbHxfuK04IYAtwEvsYumW4GfUE7FE6kEvbn1OxX
         Yr4+W0cp+y8SlV5u2JQBrSKbKu6Ajqt+XiUT57W4LBapUYnIu7A+QQ+y9TyBHGxIlYxc
         Tak0hEp7ZWx/8ngWR0dmiVwdh9jqcqGJciP76wDO39lrUyKSbTzl0AzaW7xm8Hc3PuHN
         Bc1hmjmwYNuaMB/+tLMQVaP/77GN0DrQY0UPNjlOcDXygW6+wTRK6GxuuhMsvGRdOlRs
         wBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070533; x=1729675333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9HmZV1HG+6gwTAP0CfUfE6HfllOXSnTHvKBpuXMoQo=;
        b=L4qBMBJUlaHRvUrSm/ihg94OPaibcEEWRBTjZjtRFDPdd16W+punjUuaTC43qmNm5t
         cIDhvW1ZBwryXbG3EuXIZLhiGErKhzbiVxuIo6Y+CJU8krDeOb+/6dEARPXK8IehIfzH
         WyapSVH+4NG4fq3EbAkzYk9kpIwHcbiMgUJvYULW//6qX9qKTxXodolYNbQ2ofvpOyPD
         pzIhP5dp7EzQ8c9yVrQz2YwgFax03zKLbY4Z19cIEP/MOiXRYpRFQ9J/411TWU096WLN
         /tRAl6SXv513pxAZXLmKyPMPzqnRAvAirugiN/hwcC/VnIKxRVPeWX/ClXMBQkUaCADI
         XNvA==
X-Gm-Message-State: AOJu0Yx92ISEI0A78n5taPCIvugbJ5/CH4EY40hmQigUZq4WWSHEt/Qn
	MGZ7+Dr4hTChhWX/HkxGpXcOq3Ri42Lj+k01PcHGwnwPQ06XYBSgH74Ckc+4yQE=
X-Google-Smtp-Source: AGHT+IHV2OF3U3F0Q3YPbiBGZhk4UBufn3jGmgT38dqTIkLBdNB8ui3dyxZykrca9+XJZnXDTNzbmg==
X-Received: by 2002:a05:600c:19d0:b0:42c:ba83:3f00 with SMTP id 5b1f17b1804b1-431255cea07mr170505335e9.1.1729070533240;
        Wed, 16 Oct 2024 02:22:13 -0700 (PDT)
Received: from localhost (p200300f65f19e3002f38cf427133ca7b.dip0.t-ipconnect.de. [2003:f6:5f19:e300:2f38:cf42:7133:ca7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa9052esm3807743f8f.51.2024.10.16.02.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:22:12 -0700 (PDT)
Date: Wed, 16 Oct 2024 11:22:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Suma Hegde <suma.hegde@amd.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	hdegoede@redhat.com, Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v9 08/11] platform/x86/amd/hsmp: Create separate ACPI, plat and
 common drivers
Message-ID: <ydskm5fihupy2upascoks6eva76ieepyxoryisxwfopplme6r4@4ahumehpt44j>
References: <20241003111515.2955700-1-suma.hegde@amd.com>
 <20241003111515.2955700-8-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u63ugwgpvy3p2e5r"
Content-Disposition: inline
In-Reply-To: <20241003111515.2955700-8-suma.hegde@amd.com>


--u63ugwgpvy3p2e5r
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [v9 08/11] platform/x86/amd/hsmp: Create separate ACPI, plat and
 common drivers
MIME-Version: 1.0

On Thu, Oct 03, 2024 at 11:15:12AM +0000, Suma Hegde wrote:
> +static struct platform_driver amd_hsmp_driver = {
> +	.probe		= hsmp_acpi_probe,
> +	.remove_new	= hsmp_acpi_remove,
> +	.driver		= {
> +		.name	= DRIVER_NAME,
> +		.acpi_match_table = amd_hsmp_acpi_ids,
> +	},
> +};

Since commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers. Please just drop "_new" above.

Best regards
Uwe

--u63ugwgpvy3p2e5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcPhcAACgkQj4D7WH0S
/k4mtAf/TwjzUOKbPwySnE+9q/cFDfCh+SSevtIjKBbS+aX1P6923B4NIdoql2DV
lTxmjos63Pcf1v7zKFVkFgE3+QOg5D2SfWlIy+w+2EjADtIhSsC5hMYPKLErU75s
EyosljwOY/dgSETCKcNdMDB2ry854aLZFKoifpcRUhkW14TBrN8SHHTt3K3xQpM0
ZfQ6v+vJhKuTlI0NzOI2zKHp5cp1Kt1a6xG7rvWC3+z16I402hFL6N5rH2jTwlba
Ue2S+auM/1OTWriCTcRVyad+P5Q1/lPXDXGV5UPWcuiO1de7XhUZGtr9nXgFfZfY
J523SlZq8BBBRqmgk3SmxBSQZXeEtw==
=WgTe
-----END PGP SIGNATURE-----

--u63ugwgpvy3p2e5r--
