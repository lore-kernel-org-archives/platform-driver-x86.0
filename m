Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832181DF725
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Feb 2025 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739955968; cv=none; b=YSi3m7veR8f5jCp8VpMnzdmR+EYaTilWZpawiLm9ip93ZCrRkZZtb2BN+17d/UkziMsP+OSlPeQtyztNmmj2lLh/PhTya8+RbWEh0XYOEIpT0Owsctpfcl6+jSqGERxaCyYwCsnhXUUuXGxacsA44NzyvT3Zq9vvMJ73oNuDjdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739955968; c=relaxed/simple;
	bh=Ll4Hm33BOP6BRDteNaeEkalteukRrEcf/dQJ2Kgc9eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddymI6+HXWG/KtlQYj1wvkX4T7Ah66XZ7074KrB3bljAOB1LYL4YuyPf12epxLNFNwUMkaPiZJi1NSgYyF0fJ5JsAwe4ilPetIKOF2Q6NdPnT34arHPQDzzzTTdsWACg4m2vMsGb+AGmc4FFmxn/1qCHRcCPXfqny9ytlkImb3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Or4nQuM7; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Or4nQuM7"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5461f2ca386so2888284e87.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Feb 2025 01:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739955964; x=1740560764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JParjzdc5yBYoG0m5UmXTy5mjDiWwZLgHUFOravZSiI=;
        b=Or4nQuM7nTSyBqwDP5wJ/fwD8lL2sW7zUCjTGIDt5vK5uZQXQAsTbeDKtNdtRRIu3M
         cGu5aeWkF4o/oouZ7hZHhBgpVdIkp7bhZC2HHJDNlybdeFhGVtZWfjhcKpvoM1JuMtVL
         V3aaqxI0TGOZl8C5hPFh/PwbLTJNpgfmQY/hKHQknZIXREBN5Dpu1P72SoR5zj2Lf3tt
         KMPTdpWaYhYiROMN3CREXh/jpTthjnAnDxBS8rAFwUjA5NS9d9W2+KMLKG8EEGi4CYfn
         IYK7uFcZZaLr2uTNRyFx79y4VCPTsRSYu+pqk+8F07R/mLroAxNCLySC5x10SH7Edm23
         GqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739955964; x=1740560764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JParjzdc5yBYoG0m5UmXTy5mjDiWwZLgHUFOravZSiI=;
        b=bZ8RWCaRp12KPjsxLqwi7e6f9eMoAexoa/o8EUyshDS8T9JOiYR8pBtenfNvjU2a9y
         CSXtn9E052SopqwlFLMUVtx906QtasMZO6tqcH6BxrLYeE9U0qLthcTJ7OGxZR23fZ+C
         r/Mvp9L3fjgN8hGoDgwyLzNn5E4rqqySKv5cyzIrAZlj+i1ObqdkZkSDqucp1w1qbYm/
         TkCM3u/7NAct10trEo6clgmFn4sg80Q0PfV74XQ35+l/7y3D6voIkccBxXVC9EzbdDjU
         rFcbqu6OHWzoQG2OFIWm9X2cR4Fv6gygBp3h1uI2u10zxSmHvNlpF5D1R5tSuW7o0e7w
         L8vg==
X-Forwarded-Encrypted: i=1; AJvYcCXIICTA4SUPOLidBUGxit56UdCuLDF2cOT4wv98qpsCivtuwUnvg6CqE0QMyLZsZ8Lc5KPF+t0X1khh8p7a1Rf7xSop@vger.kernel.org
X-Gm-Message-State: AOJu0YwVJj8Hum1A3qjoIDqdrue7PxE/zPSAV/8rm3SWh8v310qNirmz
	Qbv+HiEKmggWKI+pG5TrTWuAA1GPSXHq77JxLnnnPKb1fB2kKrEasNmCB5crvP8=
X-Gm-Gg: ASbGncuLqJbOJdHjGtmvtgrduG9VPZmZHTFQVSwXlNJ6zAijpqdcUAvQCydXU2+A7oO
	8EPaPgrTJzd2YYk7TZI/UOs/d26n9tJkrpfkUsO+Zrx0YV/0Bww/uTqlQEkVtjoMy+Hl/pcb1Fd
	EiPI04NfbxsoKPw+27xBHNuBiOXcphE1gtqh7PteIOR8FTi5e3GLvuJ/1OtMqTQJrKXsQGQU1Xy
	mXhFquYBeGBdBykU7xJAgxYMDTLYazhVYh6yRa9ohdR91KPv5k6sWPVtsn3sLVOFeZvC44FvOii
	L9YnBaeFZjv+AKzdXroPbwAV4+5m0gkOCFp3EXae3ZrqY4eE1axnkKSyWkaKQ1TrbFZZrFE=
X-Google-Smtp-Source: AGHT+IHm7rrZGF7gWE8rLuZPX4nvDlV3DcFc5Uk1QwC4R6ncjGo7U2SoOER3uymDvhu6BZaa/4okgQ==
X-Received: by 2002:a05:6512:3a94:b0:545:10bc:20ca with SMTP id 2adb3069b0e04-5452fe583c4mr6368433e87.24.1739955964491;
        Wed, 19 Feb 2025 01:06:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54530df9016sm1454714e87.36.2025.02.19.01.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 01:06:04 -0800 (PST)
Date: Wed, 19 Feb 2025 11:06:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Danilo Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <crtrciitrlqkxh5mxvnbdjy6zoxny5onse7xgbw7biozg6myux@grp3ketgl2uh>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>

On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
> Add helper functions to create a device on the auxiliary bus.
> 
> This is meant for fairly simple usage of the auxiliary bus, to avoid having
> the same code repeated in the different drivers.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/base/auxiliary.c      | 108 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/auxiliary_bus.h |  17 +++++++
>  2 files changed, 125 insertions(+)
> 
> diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..a6d46c2759be81a0739f07528d5959c2a76eb8a8 100644
> --- a/drivers/base/auxiliary.c
> +++ b/drivers/base/auxiliary.c
> @@ -385,6 +385,114 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
>  }
>  EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
>  
> +static void auxiliary_device_release(struct device *dev)
> +{
> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> +
> +	kfree(auxdev);
> +}
> +
> +/**
> + * auxiliary_device_create - create a device on the auxiliary bus
> + * @dev: parent device
> + * @modname: module name used to create the auxiliary driver name.
> + * @devname: auxiliary bus device name
> + * @platform_data: auxiliary bus device platform data
> + * @id: auxiliary bus device id
> + *
> + * Helper to create an auxiliary bus device.
> + * The device created matches driver 'modname.devname' on the auxiliary bus.
> + */
> +struct auxiliary_device *auxiliary_device_create(struct device *dev,
> +						 const char *modname,
> +						 const char *devname,
> +						 void *platform_data,
> +						 int id)
> +{
> +	struct auxiliary_device *auxdev;
> +	int ret;
> +
> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> +	if (!auxdev)
> +		return NULL;
> +
> +	auxdev->id = id;
> +	auxdev->name = devname;
> +	auxdev->dev.parent = dev;
> +	auxdev->dev.platform_data = platform_data;
> +	auxdev->dev.release = auxiliary_device_release;
> +	device_set_of_node_from_dev(&auxdev->dev, dev);
> +
> +	ret = auxiliary_device_init(auxdev);
> +	if (ret) {
> +		kfree(auxdev);
> +		return NULL;
> +	}
> +
> +	ret = __auxiliary_device_add(auxdev, modname);
> +	if (ret) {

This loses possible error return values from __auxiliary_device_add().
I'd suggest to return ERR_PTR(ret) here and in the
auxiliary_device_init() chunks and ERR_PTR(-ENOMEM) in case of kzalloc()
failure.

> +		/*
> +		 * It may look odd but auxdev should not be freed here.
> +		 * auxiliary_device_uninit() calls device_put() which call
> +		 * the device release function, freeing auxdev.
> +		 */
> +		auxiliary_device_uninit(auxdev);
> +		return NULL;
> +	}
> +
> +	return auxdev;
> +}
> +EXPORT_SYMBOL_GPL(auxiliary_device_create);
> +

-- 
With best wishes
Dmitry
