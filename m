Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3865256C650
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 15:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882798; cv=none; b=I8W/UmzrESYo6wfFkwImpj1DjeYFMpkWmXCVUrKwLq7+YUUFEAhe6hi+YQD6LP4EZbFsIkzkg1vM7YvF4ZlJPs44ieWDDxYHNF425XqkGK1h50z0sOUC02K1FPIe/E/I32RaA+mmG5FrJUlR4yRnzoT5hO7GRA3wKjqFHhI9+/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882798; c=relaxed/simple;
	bh=E7n7efcL+FU6GvjK4ZDItRGo1F3p6DAx/2ZzkiPlhkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3MHiuGUhWuKM+PM2a2lOXOMDyaSp8KV43e/RQcPJEYA5r1aRs3lVvCUvL5Y4T88q5pnapO2Be0DVpuRJ9lgomxqKG4AtMguTOT5Jmnos2cIR/M8VG5rzt6s+XZRSRyzxhJzwN6yqfWedmF0BlkSp95/r/4U935vRa1jFU72as8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ifjNbn5W; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ifjNbn5W"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so48189565e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2026 08:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788882794; x=1789487594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E7n7efcL+FU6GvjK4ZDItRGo1F3p6DAx/2ZzkiPlhkg=;
        b=ifjNbn5W8oNZglsJKy9U9h1GN6fKrlziiakA/PftoOJqD0TytlC0GkA1oy0/3/goNS
         IWl6J44WxuVhXOGhIFaUeW1ZP0CHlypTWEdTT1btCeEmsIzPFEExhWpDmzowiBpBhL+w
         M6uoj0hUL61ywwxEEX1T5E8+VXD6Sdm1U4TO7PCZTlu4VHd11UXpR+eHANAFedx8Rkc+
         Viot/xkn3xN25B5BDjNwjufh3W1pBUQQsi+dbD3mIDjAcjeaWUB1aWxJ9e95sE6kMDS8
         do9zkBgWi4HcaSkC4ivsba1Y83dZS8FvzoXe9hodT0wXNe4zs04o8MmVw6S0k6yqt/MG
         dO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882794; x=1789487594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7n7efcL+FU6GvjK4ZDItRGo1F3p6DAx/2ZzkiPlhkg=;
        b=piH/HHJXRKjbQwI14Supc0r+DMR5zwY9zOpwZrmyAyNgQYBmWWez/hati9bptns03a
         f7qMjn6g0QoC34tX8lxJsT8xRFNQnLnpMUcNpiStRkOCf6qKv2Q0ZvC/dJVYULCm+qXi
         Ok72kWuZbZ0UQBKOg9CN063VlLNIdAmGjFw1ziHWQ6WyEYwF+cKWtzr/CTNzPFY4Rvlt
         Pb7pRggJ4aj7etf63xwsmPh3yXcKuoYesVIppCkyE+hbL5gD4aYgED0B9HssZaOkDuIM
         kd6VTVqYOjryFfsGyXjgXm55jLDz1kdjZSIL3eHsQXb7ZuQ7ov1/Mw1cZ9f1rqafrWmr
         kT6A==
X-Forwarded-Encrypted: i=1; AKwUvBxEf8MZiNNdopbppbfI/rH3Xd4Dc2XGpFKMdrFbAosmtbJP/R6axJsVM1mm3jnoo43q1vQQCp7BMN7yGd8PoDzym7r6@vger.kernel.org
X-Gm-Message-State: AFuF++lL0oKwUx5azHMrCLUOW+YHQiSV/oZAMjMqJcqwpmGzlIqXGkae
	qLK61ZdNFUVvvmUj/cXJzPr2pxAYe5S7Hhi/rStgLKJMXj6X2oxIjJzeM9PZ67Qav2k=
X-Gm-Gg: AYBFou2Ux/qmoISJI7+kUAKhUPKZWMmkWo8qFOO68jb0i4Ww1LyVWET5WoPgPwiV/eK
	PdJW8abQFlDVxHoaURlHh16Mt01Jggkz6XTzvNcRtTHdQ7zkxd37a+3oZ0jCrDLKYJPfAoFhv4E
	KTd7+LEHo3dzxskGmWk40DI3fyLPmGenoPb+Phm3UtznzXGGyQTg0ziNk6chmY/WQKrKY4RfKL1
	/K/DbHG2ckpYq55o3XsQgC5UbGoactwiuRbKUN+i4A56BTc16axFzaAU5eHL7AsIfMKdJ+odLM0
	dddqSf2yG42VWXe58d/cjW6EncbctppctMBMKVpoiwR+Mg6EsjjQoPGgx+XsZ+IjkOpfuSMnFFe
	QfjoO4ZZq5P4aRctqJp/BsWxlq1fy/fkbawaTwGjVg8exsL7quxijqWTbo1wzlbOoA5f0t+oxRB
	LkX76NnBrylAz92RvyhCrSCRZqF9Fgo2x7cZoboQXIyhfnbJo/WwKEkvolDNeJ98SWhiyo0llMl
	kon/UXp+95/hSZDGdHsXfTE742CDcNd1bwUbn8ciTl3kxzS7tE=
X-Received: by 2002:a05:600c:6098:b0:49c:fc6c:be05 with SMTP id 5b1f17b1804b1-49cfc6cbfdbmr310435145e9.28.1788882793168;
        Tue, 08 Sep 2026 08:53:13 -0700 (PDT)
Received: from localhost (p200300f65f19a9042cc2680c1f1bf2f5.dip0.t-ipconnect.de. [2003:f6:5f19:a904:2cc2:680c:1f1b:f2f5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49cf7740d44sm881111065e9.15.2026.09.08.08.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:53:12 -0700 (PDT)
Date: Tue, 8 Sep 2026 17:53:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC
 driver
Message-ID: <aqAvALulXKtsQQnc@monoceros>
References: <20260908091752.5508-1-okerixx@gmail.com>
 <20260908091752.5508-3-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="27nkzeturjw7lglz"
Content-Disposition: inline
In-Reply-To: <20260908091752.5508-3-okerixx@gmail.com>


--27nkzeturjw7lglz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC
 driver
MIME-Version: 1.0

On Tue, Sep 08, 2026 at 11:17:52AM +0200, Oleg Keri wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>, this header should go
away soon. To get a definition of of_device_id and i2c_device_id
<linux/i2c.h> is enough. (Or if you want to go the full iwyu way,
include <linux/device-id/of.h> and <linux/device-id/i2c.h>.)

Best regards
Uwe

--27nkzeturjw7lglz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqgL2UACgkQj4D7WH0S
/k7CwAgAnPntIvnHC0kMw1/QQBqCS3Vp07x/cj5/X3i2U07bGMvno27pCqx+dt5k
NmyHEYA6GG1TzZ+fTlIBrP80JJBOlITt5D2bCVpqzWZfmVRP9lqEMTNzlPwHyID7
WrxJ8AiL6IYplgPdSNo7ma4EjworEEjyrTfkzSFUAbLkPFKv6y4kreCZ3LaiMSk0
b+inF4QOHKm+ZRqpaB/3QvOpt8ZM6m+RDrcqS+8dwblVR5kf2OVbxaHbhby0Wcta
kgf1MkOpTASnGDan1SR1YSYKNHtu/Hwo+9TGnWITgb6MRZC/lBYdfysuLmhFrXMC
hJ/3zZkWmanAcK1NoI3uKrIY4n84eg==
=8Ft8
-----END PGP SIGNATURE-----

--27nkzeturjw7lglz--
