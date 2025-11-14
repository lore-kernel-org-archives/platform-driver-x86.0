Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7BD314A83
	for <platform-driver-x86@vger.kernel.org>; Fri, 14 Nov 2025 13:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763126688; cv=none; b=pJHSz1dV6IlseoM26jCIgg1dx2rchQoOfka3YRugSSUMPKW/XOJjWwmMgEuE7cURQbsWPzTxiG3ifdua+YiSPgZp2yZ2rnrKw63vZ5bUt6B2OicZOa81bPi4F9JtPl5Rgz3NEmmIsUONUqHVXgl04MLYV17g+8qmh+OszoYKZbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763126688; c=relaxed/simple;
	bh=/MfNmCaMbBpwAOzkjJvB9GOQKWmOcsbFnthRP3WrP4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEfN12U8S85jkacYrDwaCDhfTfIYZJasGqURSkvjCeIZTluaIiOnM+nAPJgFJiDj3vMUUibWLhAQV/CzXbbBhMOxWsSAfcDkYYS44PT4OFkwCEgCv3JJF3KiQJAoyB1z9x6OrVPN/NNfTTfR7TTlOAXAbOOLJmFTFBVYMeJtVfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=An0Ki4z5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="An0Ki4z5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4710022571cso18962315e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Nov 2025 05:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763126685; x=1763731485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9tFYx+r0LtpX/2l5hmodetJ2Wuc+Oih4VLt/Zf0jWOY=;
        b=An0Ki4z5M41xmXqsKse7t1kP32LyH7afmW0YlcG9Klz4WF2Qx46YDfpOj9RcO8CIW9
         f8efAj6aNHro8mPQWwq81DAj64i0kZRyu87XRwFl0qsvaDUW0vE7DzGLHl7CTqkpF8cB
         RBuTx/0HmQ+ZYpJotrbnDXqLaCZFTiycAX58s0n649VTxK2Lw1+OmXloblDS4EynSQeh
         zYKoVclD7t4CU9KkLLfS4mJ4oK49bGhGV6eIqqTlPrKW/uKBy3IvcxdrDTU1Mc6NblsK
         ByrgavWKyOE8tH68P8SfojNr4pMgMWJrBUDZjexZwzoxjXBw2o2kLowBzdJ/f4HwwtK3
         SFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763126685; x=1763731485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tFYx+r0LtpX/2l5hmodetJ2Wuc+Oih4VLt/Zf0jWOY=;
        b=Jyz5q8zbQlRUnuJCcSXAIZgC5CofrBf021iijeMstMPHch4HMvXBHZfNyIUpUAYxOE
         DE8Plu2aymm3obNND/V4oC7CYXGgu4MHjRUukwVgHRgZuYs9Hf7QAlWnqK/aA5rb6DtF
         HsTS8h/smVy8mZGl963AnEOM+mlZW18gZvuD3dhTjOzuq3LilaVKzj3uxJCmCziykZuG
         Az7MJnXQAlmQig26E4Dfur1a4Fuu2p3XjsPmlGi6QIUKZ62B4aJ0awCCkIfp/wCvEw01
         4KFb1bkFnBGPS6jBNMTWAluQy6CmlL7lP5jB9LTEtWdmH0a1D5wIdb4uln9Y1B8ychSU
         nlEg==
X-Forwarded-Encrypted: i=1; AJvYcCXT16jWvzxKciGPqJMYQjG9uC/Pi9GQydjfEqL9tMlAQuc105ZN/M5nMnrw3ir+ZZjDH+78Je7yH9Q1WQ4YOgRC8fM+@vger.kernel.org
X-Gm-Message-State: AOJu0YzYdRk0bHVj6B1j42qWU+h/RvKIb32UkoszEsjKbs916j52aZY9
	hJlz9YQzh8/icdSfwZ8bb1Qt+4Q5JGLMlkSkCcJepE6nWMrurB3zcDwe
X-Gm-Gg: ASbGncszTA/qcbBxGCof4z41572KNshAPjJc2Sq2SdUCdxaYZzW4A+nTRnLHEsNPTMY
	KC9FRP8TGxQcZxb6bY5V9BKfhHzmHZYrfXaw/7EggcRzjquLGxSaeTsYgtzlvL43D9Q6rTZbkVT
	HsiSsvU9nhvwtC3xGqUyMi8aBHNmDgoTEuJpZbNmIFYa9+ayOWpDxcaMsVh6s2BDtflZOQajorp
	41AG+y4+0kZA0RhSQBNgBD7CE2EmYBffKXZXbBo6rOPHF2lL4YG6AhOxrw/8LyGZqQ+2RTLKBwp
	waVg7bPEyJNcFPY3TX+S6DcZ9uSQcIEpi6fiydvZpgxA1bHNaVXxZuouIVq95/7fp+cXrruHilp
	oyULpkALYplFEB8qnNBufyye2Hu+q7PSzU5vzvvu91jNSvyp6uLfrWhYh5w7wlPEYTIYH5YF3Bn
	2hG6QCYJoU+HbCVtGVQ5VJYuYZSTHIcHkS0YNWouUuRRvou4dVXpWkuJ1eQ16VyO/7a50H3AxX2
	A==
X-Google-Smtp-Source: AGHT+IGGro6Ab6Q6hQTIcaBq7Nzqv7eihH1X2JDeRvd7W4sKRsUWsSzI35q89svHlSq6wH7pBHiBUw==
X-Received: by 2002:a05:600c:1c20:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-4778fe4f635mr29777265e9.5.1763126684877;
        Fri, 14 Nov 2025 05:24:44 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb454a6sm46271815e9.2.2025.11.14.05.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:24:43 -0800 (PST)
Date: Fri, 14 Nov 2025 14:24:41 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/11] of: Add wrappers to match root node with OF
 device ID tables
Message-ID: <kqtjfqkzz3lfnpg7lo5m4dctowsxqxtlcdtktoatpze3hr3tue@ku6p25skb666>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
 <f949c2a6-df24-41bb-aac7-f5567d03c5f5@collabora.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ntn2juw5rgeaer4c"
Content-Disposition: inline
In-Reply-To: <f949c2a6-df24-41bb-aac7-f5567d03c5f5@collabora.com>


--ntn2juw5rgeaer4c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 00/11] of: Add wrappers to match root node with OF
 device ID tables
MIME-Version: 1.0

On Wed, Nov 12, 2025 at 12:52:48PM +0100, AngeloGioacchino Del Regno wrote:
> Il 12/11/25 11:28, Krzysztof Kozlowski ha scritto:
> > Changes in v2:
>=20
> Note:
>=20
> Looks ok based on code and based on testing on the following platforms:
>  - tegra: Jetson Xavier NX Development Kit

Thanks for testing, but Xavier NX doesn't run any of the code changed by
this patch. soc_is_tegra() is a legacy function that we need for DT
backwards-compatibility and should only run on 32-bit ARM devices.

Technically there's one case in drivers/soc/tegra/flowctrl.c that runs
this on Tegra210, but it should probably undergo the same treatment as
the PMC and FUSE drivers. The code that needs this is only used for CPU
power management on 32-bit ARM devices.

Thierry

--ntn2juw5rgeaer4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXLZkACgkQ3SOs138+
s6G/cA/+IgP1K3OXIF03hJ/xSNn2a6/dnr1TTFLAUI6Ge13aBNVPxKCDqoxLZCAt
pN2vtjYNWX0Z80+tnCpGdf961hS6OY28OJmABKNotQvlrnzBSn8ggsZ64UlAka80
SRr74Do7F4bWqWrBHEDD4FRjlYR0OVy2/s0i5Zcavhixa1bqN/F9gTWT+kKItZOE
TcV+O8gQF/op9NSShu+oXIZFRcPKdugCNN8w77cE/9B/0o1iII9DzX5uzFYK0Au4
M7rAxBiHHh71czN3ts79Mcyinj9kcC3zGq9wtusv3N18sDRqwZCp+mPP3Y8Up0t4
OotwMzxf59FsoSpNDUh/FgkCNoDoDXbajVzHTig9OQspb/nNis+P5Pbw7FIZb8Q2
3jq8uRvMP3p8gc2pB7nnyQoC6ToofIcHlnhbW0oi1Fi0HovauoN7Vb8/gsJDWY6c
hBe4ABpghzhh0VXFf8CM0vK2MonZYPO0BTyDguUr4nx6QGrrLnBG7S/B2wvaIzgs
UeyUPjbgEhQVdyWALBKf6aK9IXi/Wp+s9w0XJ7qG14q665MqwxIXXIo0ZOIiIe28
e+Ajuapyv0juG6x+mVb44mHgWqZ6bquDTegdCr9PakfF4rDYnDKAcdzOM7/y8/UX
FXAgwJiScvxp/LO7D70bNXMPtYPQ3TVxDJu2I5128N5iNtuaxgE=
=vxrn
-----END PGP SIGNATURE-----

--ntn2juw5rgeaer4c--
