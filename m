Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A611863F
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 Nov 2024 15:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731770223; cv=none; b=D+4E3o8Ek8UaWKUOPEKJOe6dTsZD9ImMp7JX9XGegqRDt15kK8MOWpNUdb5dWvA4cWHP8jlGnPYp2z5ToIdKfeEUOnhIr315XUbmYDqbBzY8prH7xoh/ZlMa0n9GqXwZPThXRkus+CsuZb/fBBey52ZGBZR0AngMFgsvCHjVLTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731770223; c=relaxed/simple;
	bh=QbKddInVDkwIXsTRG7MHV8N4f4jhPAZEw3B12bEltws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ITzGv+17hvRBXmH91RduJbt4fTGC1g97Z+CC814+D8N539c2yY7mjVinawSWOr/LKAZSdu8qqsKiT3IkdrdHmd7JU3lPhqcUPn/d0V1ahvMclkY00wqHpqplLcm2HdAGKaC+P7A3f0DRpwkwbOhwwslNA9zgm+pAyixv2nYJBDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DY0joPU3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DY0joPU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731770219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrnqZa5yYwsXzQ5JATadHXnpVvnuVo+18MEhKF3C9PM=;
	b=DY0joPU3IT9MfpC4LJRGqM2hC/xOzWhle6yucIBLwxH/V/+MEsXohXVzijxp2HKDoirnJp
	ezLJEE8fntjBJlmmasM7Vi85wBmmfol5UYOZ6gPXKznWwiAHvEKPeyMcK4UlPmPimi/VTK
	JLrf0N7Ux+ENWQykoAv8FJaaf2ld3c8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-LdwcSaqgPnaeR2DkfdLsoQ-1; Sat, 16 Nov 2024 10:16:58 -0500
X-MC-Unique: LdwcSaqgPnaeR2DkfdLsoQ-1
X-Mimecast-MFC-AGG-ID: LdwcSaqgPnaeR2DkfdLsoQ
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9a1b8d4563so26346066b.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Nov 2024 07:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731770217; x=1732375017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrnqZa5yYwsXzQ5JATadHXnpVvnuVo+18MEhKF3C9PM=;
        b=ckHIwIYiOLMw+mbbAXF4xx0Mpv/BAIbeU74xH+Zqa9gRILXixjbA0hBvqGcR8HTbvi
         scHMPsuQp79jK/WOvRMyCJ6Jbfhu/xoVN7+tYp91gDfhN0f706eR55F5AIwKgM1MQLvF
         swKJ0Eb+LdvjVPmy+RoCQUHmaIClCWu1sQIoOoMOJ4JWjtnfVYCkD3GVFbDEMSfS6q+O
         xvFAPMS+m6Nk62LtsVOTqcL19ncXocKVoaa6I6kyt4+WjTyWGyIFMahjT684DGnHzF5R
         NYzsdihTNtFKPRFp8270fP9PSLc/nmq0yxF8aPRDhORE4rSUvYToTqM5PGVroRVYPEAq
         S1tQ==
X-Gm-Message-State: AOJu0Yz8dbZGixxhcYMM2JMkA2ma6b4//GQj+hZ0+MvvZzbZkDVFEZEW
	bQpWTWEqvZWZMwO4vyMnhzwgCGdqftZSgxhuZnAtkr9+Vu78/z/1wjvSp7KfHr7BTKTa8jzTdaq
	ZO63EEM8y34dsGEtcvn73v6lEU23r3bXwLRyAlDFxiU3qJMyove16Ns1/Esc8pbw4CeJNCYQzbh
	AYHfU=
X-Received: by 2002:a05:6402:234f:b0:5cf:b846:1e93 with SMTP id 4fb4d7f45d1cf-5cfb846240emr746570a12.10.1731770216778;
        Sat, 16 Nov 2024 07:16:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkPTZv5adEzu8Nt5hr2DLauAoI4IaxubtNjzRfagBA4b4idDrbpDqJY6vF4hfczOy8Y4UB4Q==
X-Received: by 2002:a05:6402:234f:b0:5cf:b846:1e93 with SMTP id 4fb4d7f45d1cf-5cfb846240emr746540a12.10.1731770216410;
        Sat, 16 Nov 2024 07:16:56 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20dffd695sm313589366b.114.2024.11.16.07.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:16:56 -0800 (PST)
Message-ID: <38506d35-b07f-47b0-9154-9b0d4b9fee7e@redhat.com>
Date: Sat, 16 Nov 2024 16:16:55 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86/intel: bytcrc_pwrsrc: Optionally
 register a power_supply dev
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20241116121659.57487-1-hdegoede@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241116121659.57487-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 16-Nov-24 1:16 PM, Hans de Goede wrote:
> On some Android tablets with Crystal Cove PMIC the DSDT lacks an ACPI AC
> device to indicate whether a charger is plugged in or not.
> 
> Add support for registering a "crystal_cove_pwrsrc" power_supply class
> device to indicate charger online status. This is made conditional on
> a "linux,register-pwrsrc-power_supply" boolean device-property to avoid
> registering a duplicate power_supply class device on devices where this
> is already handled by an ACPI AC device.
> 
> Note the "linux,register-pwrsrc-power_supply" property is only used on
> x86/ACPI (non devicetree) devs and the devicetree-bindings maintainers
> have requested properties like these to not be added to the devicetree
> bindings, so the new property is deliberately not added to any bindings.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Adress a few small review remarks

I forgot to add Andy's Reviewed-by, since the changes were very
minimal and all address remarks from Andy I presume that the review
still stands:

Reviewed-by: Andy Shevchenko <andy@kernel.org>

Regards,

Hans


> ---
>  drivers/platform/x86/intel/bytcrc_pwrsrc.c | 79 +++++++++++++++++++++-
>  1 file changed, 77 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/bytcrc_pwrsrc.c b/drivers/platform/x86/intel/bytcrc_pwrsrc.c
> index 418b71af27ff..73121f77c017 100644
> --- a/drivers/platform/x86/intel/bytcrc_pwrsrc.c
> +++ b/drivers/platform/x86/intel/bytcrc_pwrsrc.c
> @@ -8,13 +8,22 @@
>   * Copyright (C) 2013 Intel Corporation
>   */
>  
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
>  #include <linux/debugfs.h>
> +#include <linux/interrupt.h>
>  #include <linux/mfd/intel_soc_pmic.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/power_supply.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  
> +#define CRYSTALCOVE_PWRSRC_IRQ		0x03
>  #define CRYSTALCOVE_SPWRSRC_REG		0x1E
> +#define CRYSTALCOVE_SPWRSRC_USB		BIT(0)
> +#define CRYSTALCOVE_SPWRSRC_DC		BIT(1)
> +#define CRYSTALCOVE_SPWRSRC_BATTERY	BIT(2)
>  #define CRYSTALCOVE_RESETSRC0_REG	0x20
>  #define CRYSTALCOVE_RESETSRC1_REG	0x21
>  #define CRYSTALCOVE_WAKESRC_REG		0x22
> @@ -22,6 +31,7 @@
>  struct crc_pwrsrc_data {
>  	struct regmap *regmap;
>  	struct dentry *debug_dentry;
> +	struct power_supply *psy;
>  	unsigned int resetsrc0;
>  	unsigned int resetsrc1;
>  	unsigned int wakesrc;
> @@ -118,13 +128,60 @@ static int crc_pwrsrc_read_and_clear(struct crc_pwrsrc_data *data,
>  	return regmap_write(data->regmap, reg, *val);
>  }
>  
> +static irqreturn_t crc_pwrsrc_irq_handler(int irq, void *_data)
> +{
> +	struct crc_pwrsrc_data *data = _data;
> +	unsigned int irq_mask;
> +
> +	if (regmap_read(data->regmap, CRYSTALCOVE_PWRSRC_IRQ, &irq_mask))
> +		return IRQ_NONE;
> +
> +	regmap_write(data->regmap, CRYSTALCOVE_PWRSRC_IRQ, irq_mask);
> +
> +	power_supply_changed(data->psy);
> +	return IRQ_HANDLED;
> +}
> +
> +static int crc_pwrsrc_psy_get_property(struct power_supply *psy,
> +				       enum power_supply_property psp,
> +				       union power_supply_propval *val)
> +{
> +	struct crc_pwrsrc_data *data = power_supply_get_drvdata(psy);
> +	unsigned int pwrsrc;
> +	int ret;
> +
> +	if (psp != POWER_SUPPLY_PROP_ONLINE)
> +		return -EINVAL;
> +
> +	ret = regmap_read(data->regmap, CRYSTALCOVE_SPWRSRC_REG, &pwrsrc);
> +	if (ret)
> +		return ret;
> +
> +	val->intval = !!(pwrsrc & (CRYSTALCOVE_SPWRSRC_USB |
> +				   CRYSTALCOVE_SPWRSRC_DC));
> +	return 0;
> +}
> +
> +static const enum power_supply_property crc_pwrsrc_psy_props[] = {
> +	POWER_SUPPLY_PROP_ONLINE,
> +};
> +
> +static const struct power_supply_desc crc_pwrsrc_psy_desc = {
> +	.name = "crystal_cove_pwrsrc",
> +	.type = POWER_SUPPLY_TYPE_MAINS,
> +	.properties = crc_pwrsrc_psy_props,
> +	.num_properties = ARRAY_SIZE(crc_pwrsrc_psy_props),
> +	.get_property = crc_pwrsrc_psy_get_property,
> +};
> +
>  static int crc_pwrsrc_probe(struct platform_device *pdev)
>  {
>  	struct intel_soc_pmic *pmic = dev_get_drvdata(pdev->dev.parent);
> +	struct device *dev = &pdev->dev;
>  	struct crc_pwrsrc_data *data;
> -	int ret;
> +	int irq, ret;
>  
> -	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
>  
> @@ -149,6 +206,24 @@ static int crc_pwrsrc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	if (device_property_read_bool(dev->parent, "linux,register-pwrsrc-power_supply")) {
> +		struct power_supply_config psy_cfg = { .drv_data = data };
> +
> +		irq = platform_get_irq(pdev, 0);
> +		if (irq < 0)
> +			return irq;
> +
> +		data->psy = devm_power_supply_register(dev, &crc_pwrsrc_psy_desc, &psy_cfg);
> +		if (IS_ERR(data->psy))
> +			return dev_err_probe(dev, PTR_ERR(data->psy), "registering power-supply\n");
> +
> +		ret = devm_request_threaded_irq(dev, irq, NULL,
> +						crc_pwrsrc_irq_handler,
> +						IRQF_ONESHOT, KBUILD_MODNAME, data);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "requesting IRQ\n");
> +	}
> +
>  	data->debug_dentry = debugfs_create_dir(KBUILD_MODNAME, NULL);
>  	debugfs_create_file("pwrsrc", 0444, data->debug_dentry, data, &pwrsrc_fops);
>  	debugfs_create_file("resetsrc", 0444, data->debug_dentry, data, &resetsrc_fops);

