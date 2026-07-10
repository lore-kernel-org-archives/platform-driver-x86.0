Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371D13B0AF7
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 07:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669347; cv=none; b=nDkWyXwFr12OKAeJljt8LIbbZ7wojVGIj1lh0cWiLKAOn2hxYaHisYlBdL/ROZokAOW+4IsZKm9sZVrIKUuqZl35KX+ErTNRGH3EQ4lm3eJwj8u6tdX/6+lCCGfhOK/ylbEvaq7rKUvlk2TdkQCG9D3znfautZZTA6uwIyTkOtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669347; c=relaxed/simple;
	bh=PNx+7lHV68d843Y5/+sK2JBzg9dRL2pzRtxGkZKEOS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oz/DHVYs6uk/S0GZ+D16mJYqpEFj5k8bicmK6hYfX2jUNHwRLFbnK9+9o62+AKTh26jsEJLJUhvuhU6TKJOyXczCBMhvtBiWGbpXPVHsI3/KBdjAAHFT3mNeRPuWepXtk7RPm709lPZMuia/5Hxmc5dnjDAj3taZS7IPmUdTZoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DH+D3+Lq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DH+D3+Lq"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so4797205e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 00:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783669344; x=1784274144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PNx+7lHV68d843Y5/+sK2JBzg9dRL2pzRtxGkZKEOS8=;
        b=DH+D3+LqRTEoKkA1MTWb4YiU0Vi7CtzglHFzVfCms/sGeyonwpUq7Fd7QazeEnnzeb
         CwBrX7D8+37yoPnpMiUCzQ3rFxFBJJ2dMR5eI+ntfix+nMrVP+mgnUt5V0MqcZzf4/i9
         V0xycI7Nx/lnXlXWmd9AS67S2kbQLT7GBoKDKyex4ZWTAHNgGJlYJtE+oDzdhw6KJnG2
         jzkCjQ0G8h6B3xczKW2mfZEkyTsFyISg8KvfcSYdtSnnUSidODv6HJhJ/iQQnTY3K3ny
         a6oD5NxKaYqkxVHO0f5l/xjw9/nXAtUHfP1ozW/6cP9CO3y9veJSIgy9HJvEqIRvti3c
         xexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669344; x=1784274144;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PNx+7lHV68d843Y5/+sK2JBzg9dRL2pzRtxGkZKEOS8=;
        b=EopbvTCsDZwGhTJvxiuBXZJ5yVJipU+DY00qrtwqHeQBq5/QwX4KmcqoU2GSXv5SNn
         jeVneCyWZRDgRQDH0BFlMHOmhpUyKZz/a+uYPcRCUGQ9vHRPP2m6XBc+6OHO2xG+Fdqa
         v9sFVl8vGQE3yYn1qP7wGZ/S1DJOjR4VESrLeJbrKCU3d9iyuExDyBetNo3tlyINn1QU
         xfTuIJc1bCUIjAkujqEUErSwS/z0sAJiBZ0o4MORPT9xjiyz4fJodLA30MU2fdnf90P7
         bTi5yRGVc1cK+vMblEifrj0hKGKgdvib269ffoCljWUJgV/2h2SrRZ7qjCmUTbLzdVGM
         jX7Q==
X-Forwarded-Encrypted: i=1; AHgh+RpfZkj/mYShuvkOBJfBhPlHo6R05N9YMK3U6mIbM0FDfs9So2ZRweolSY6dZIsqRpf6b8UZTd7pTieAVBQhjKRo4b6X@vger.kernel.org
X-Gm-Message-State: AOJu0Yz20Q8cw8LTfdaqqY/wqRbUGZloTs8e6Pbi7Jgk9AUhmNY876gC
	NO9/dUdBdoYkGZ1yOkurzbTGXxRsfxm0RUUqmRuye2llpTgkW6MhaxkgPGajHuGKbkA=
X-Gm-Gg: AfdE7ckI5pfBN/4lCj2cZNGRtUG+0073QdWkEH7SQftaOHF/Y5tPBYSPth4/wzbB3Q2
	5abyb87lfUyQje53iVk0ksqwHW/kPD45mpqHYn9+59K3k7c7KMVuicQ35y1ER69PJ06bkab9Dz2
	qRzOLXwKa90kiSKm9S9jEO+OYj8gRtpUAD03M8sVxv7fLQK0jiq/puQHKtSC7AeOz+8dcN4Fy+J
	7rHXx82JH3tJL8UYoZMykKFLkZlFjkfdYjk7KutzYsAd1z0WpTXyrf3IhaSW6oI1gGQoWs7x9cg
	1TO0TgR4nlQMUS/RDryyQPJf+Y1X2wtWJuZU5Va6SOXOWQZi0/acMqURiEIluhZulc+0A1dpXHp
	h6c33f71rRZdH2Uu9U9gRYWSKHfoOmgCmUwCL8IVSYyxhNo/24KcZbcT3ZesBeRuwSOXxy/O29C
	1YlfSJzaCSyTVcDqhMD0IxaQvfsnA/EhrO7otYHTw8NyelZPCDYoac/Wp7j5Lg64Lhwo3Vo8SVK
	136
X-Received: by 2002:a05:600c:19d0:b0:493:cce0:3724 with SMTP id 5b1f17b1804b1-493e68aed4dmr89123555e9.4.1783669344235;
        Fri, 10 Jul 2026 00:42:24 -0700 (PDT)
Received: from localhost (p200300f65f47db04fbea22a44ee9ba38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fbea:22a4:4ee9:ba38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb6d5055sm116795385e9.5.2026.07.10.00.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:42:23 -0700 (PDT)
Date: Fri, 10 Jul 2026 09:42:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sean Rhodes <sean@starlabs.systems>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Corentin Chary <corentin.chary@gmail.com>, 
	"Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
	Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Joshua Grisham <josh@joshuagrisham.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>, Kees Cook <kees@kernel.org>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 3/3] firmware: coreboot: Add CFR firmware attributes
 driver
Message-ID: <alCiUSL-fd6SWOYr@monoceros>
References: <cover.1783663929.git.sean@starlabs.systems>
 <b12a36d80e48972fb06b25add0acbe39879f05ca.1783663929.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bxqrjw36ykfsjfpj"
Content-Disposition: inline
In-Reply-To: <b12a36d80e48972fb06b25add0acbe39879f05ca.1783663929.git.sean@starlabs.systems>


--bxqrjw36ykfsjfpj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 3/3] firmware: coreboot: Add CFR firmware attributes
 driver
MIME-Version: 1.0

On Fri, Jul 10, 2026 at 07:12:46AM +0100, Sean Rhodes wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--bxqrjw36ykfsjfpj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQolwACgkQj4D7WH0S
/k64kwf+L5t1vitcPdLcsV50bKYh1DhQc9fdgSuIYKy5CNHJqp+w5M8mIikO4k2m
C46FJ55QyKeOc0ziUm5SFqMGtL8Rgrbkk/QQ6lks0pQzVqoqj+nTIMOQFgPDVYlt
2tPZOAl3eQm8Os/U+Ab9lVd0Ykz//klmoWYSam+IAaERiqKO5ZNSgj6dKFg5XJYC
zcRIOg78dn/hAzujZa0dwDmTaG87IT7qI2YPXZyWKSBE/FUmrkr8Ac5wW3J+GdfD
v+0FrK4IlDu2yJPo1/eYYq7K5mFnlsh2U5czOPR/Tsb+WfXqlWre9ZNn/na5XItv
fR7JQtx3zIeGqXXpHO5Vxwffj5ajdA==
=E9cL
-----END PGP SIGNATURE-----

--bxqrjw36ykfsjfpj--
