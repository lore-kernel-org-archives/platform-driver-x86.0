Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347BA4A1C
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715612397; cv=none; b=kkWe4eWB5E/A7nA/4B35h63HTAuaoxFRUfFkctP0hBh0k1DVPU3CNv233ZvcJpD32jrEY6Qq71cK/RtFmX0xOQgJ4Wqv/Aj7sPEQegfHmAgsbZlVoTKwk9bH1OC1LAIUaakr4Fc1uogXpWYplEzXcWfhuvDuVqS26gNvHBEN8zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715612397; c=relaxed/simple;
	bh=u2Yc50NOirF0yd+tV9fjWk9fYHw4M0hLkqDOaPSKYqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqjQrG5uFHruLfLFQWHKI3KGbC/Cx6I/Vg6XnrJZe+sC5jw4jOoySJUNk48pkhY/mtZygbRFAaSasepWv+My/s8dNVxuZ32gyScc0M5syCoFBLx/TuB1YKqABRBkueZ6febfsnCyFXa4bqSoS2fTnXg/KzBIE9+Ge9gssDzYq+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hLfjvLhN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hLfjvLhN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715612393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IQUGjwrfkn6Y3YRhNhsLYetaQjsQJie/ipw0GNX6AUM=;
	b=hLfjvLhNt09ILennuYAgJhQX0WRjn95zEaxZqvBffOToZUjTGadl9Mjd09ynxCgncdVHYv
	ahHVFEHOWBn8FFF2cCsl4YTlfQDGmt4HKwGh1UJWV0lrPKydd3hxjQfoqy63nAyYipcowA
	qofDu3rneIwiRNmlMr6G9+P6F0UH1Ro=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-oXdgSKx2PCeTjM6zpr0B-Q-1; Mon, 13 May 2024 10:59:52 -0400
X-MC-Unique: oXdgSKx2PCeTjM6zpr0B-Q-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-572ef242caaso1675684a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 07:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715612391; x=1716217191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IQUGjwrfkn6Y3YRhNhsLYetaQjsQJie/ipw0GNX6AUM=;
        b=TiC536clAyueffzmWS2z7Sl8/ht0FJ/NhfvmMr1hTb0+WAouj9bkqZXKSy4zwaVoc5
         TFu6G2OTB+Rm3RK95szSamsCdXFFmXhAPkTCKbCboHnsFCs/OZxBNhrEbeVCP6BV5snp
         RT/732hNBHKlbpf+sbhyMOYHRvDR4Y/pe2Ugoalz1vgvfmzOG89bzydb6ulKgUE9eohY
         WvmTTyLjQN9AZfYhojcjnVVrq4nBuCLYOFvM/nKy2e25fHMMkGYoxbi/ct3tT/veqbrH
         8y64Cw0vh9FHYmHxmFPG8cnRxwp7AGMGu/5xkGtXsZLtU7c+rJA/rWY1Rub3/hOYzTta
         R2Tg==
X-Gm-Message-State: AOJu0Yxa1c0gY+e5kv4IsDAW5wgT5kD1wR5YwToCWexN5RQBzEErM5Gu
	T/RVv4Cm2GJ75IYrCz7nLIbNET/LI4HiaUjnA2J3Lhvuve9waa44n7gUj524NBA4fDg34fOqilq
	wQCTAr3+GIW6J6uLm/w3ocux4ZYHnZ/bZYwAeuolQ5CQW9a7oCMh8ScwqgcUhEI60958t+Q9IQ6
	y1nMw=
X-Received: by 2002:a05:6402:5247:b0:573:58a2:993a with SMTP id 4fb4d7f45d1cf-57358a299f6mr7839465a12.38.1715612391265;
        Mon, 13 May 2024 07:59:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqFeYInond8Mn4w70pAxHJQYVuvVcaPwTvDCXj9dJv7rY8AgeFaD+sZD2Dvw7DgcyqaPDo+g==
X-Received: by 2002:a05:6402:5247:b0:573:58a2:993a with SMTP id 4fb4d7f45d1cf-57358a299f6mr7839443a12.38.1715612390836;
        Mon, 13 May 2024 07:59:50 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-574bcad0362sm3082730a12.20.2024.05.13.07.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 07:59:50 -0700 (PDT)
Message-ID: <b14774be-a48c-44bf-bb8d-8f8ee8f858a5@redhat.com>
Date: Mon, 13 May 2024 16:59:47 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86: x86-android-tablets: Pass struct
 device to init()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>
References: <20240509141207.63570-1-hdegoede@redhat.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240509141207.63570-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/9/24 4:12 PM, Hans de Goede wrote:
> Pass a struct device pointer for x86_android_tablet_device to the board
> specific init() functions, so that these functions can use this for
> e.g. devm_*() functions.
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this series to my review-hans (soon to be for-next) branch now.

Regards,

Hans

> ---
>  drivers/platform/x86/x86-android-tablets/core.c        |  2 +-
>  drivers/platform/x86/x86-android-tablets/lenovo.c      | 10 +++++-----
>  drivers/platform/x86/x86-android-tablets/other.c       |  6 +++---
>  .../x86/x86-android-tablets/x86-android-tablets.h      |  2 +-
>  4 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
> index 9bb10eadb699..919ef4471229 100644
> --- a/drivers/platform/x86/x86-android-tablets/core.c
> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> @@ -341,7 +341,7 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
>  		gpiod_add_lookup_table(gpiod_lookup_tables[i]);
>  
>  	if (dev_info->init) {
> -		ret = dev_info->init();
> +		ret = dev_info->init(&pdev->dev);
>  		if (ret < 0) {
>  			x86_android_tablet_remove(pdev);
>  			return ret;
> diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
> index 16fa04d604a0..74f39b658d2c 100644
> --- a/drivers/platform/x86/x86-android-tablets/lenovo.c
> +++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
> @@ -230,7 +230,7 @@ static struct gpiod_lookup_table * const lenovo_yb1_x90_gpios[] = {
>  	NULL
>  };
>  
> -static int __init lenovo_yb1_x90_init(void)
> +static int __init lenovo_yb1_x90_init(struct device *dev)
>  {
>  	/* Enable the regulators used by the touchscreens */
>  
> @@ -412,7 +412,7 @@ static struct gpiod_lookup_table * const lenovo_yoga_tab2_830_1050_gpios[] = {
>  	NULL
>  };
>  
> -static int __init lenovo_yoga_tab2_830_1050_init(void);
> +static int __init lenovo_yoga_tab2_830_1050_init(struct device *dev);
>  static void lenovo_yoga_tab2_830_1050_exit(void);
>  
>  const struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initconst = {
> @@ -534,7 +534,7 @@ static int lenovo_yoga_tab2_830_1050_power_off(struct sys_off_data *data)
>  	return NOTIFY_DONE;
>  }
>  
> -static int __init lenovo_yoga_tab2_830_1050_init(void)
> +static int __init lenovo_yoga_tab2_830_1050_init(struct device *dev)
>  {
>  	int ret;
>  
> @@ -731,7 +731,7 @@ const char * const lenovo_yoga_tab2_1380_modules[] __initconst = {
>  	NULL
>  };
>  
> -static int __init lenovo_yoga_tab2_1380_init(void)
> +static int __init lenovo_yoga_tab2_1380_init(struct device *dev)
>  {
>  	int ret;
>  
> @@ -978,7 +978,7 @@ static const struct x86_spi_dev_info lenovo_yt3_spi_devs[] __initconst = {
>  	}
>  };
>  
> -static int __init lenovo_yt3_init(void)
> +static int __init lenovo_yt3_init(struct device *dev)
>  {
>  	int ret;
>  
> diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
> index d3fb19cff555..ff7b1d0abaa3 100644
> --- a/drivers/platform/x86/x86-android-tablets/other.c
> +++ b/drivers/platform/x86/x86-android-tablets/other.c
> @@ -183,7 +183,7 @@ static const struct x86_i2c_client_info chuwi_hi8_i2c_clients[] __initconst = {
>  	},
>  };
>  
> -static int __init chuwi_hi8_init(void)
> +static int __init chuwi_hi8_init(struct device *dev)
>  {
>  	/*
>  	 * Avoid the acpi_unregister_gsi() call in x86_acpi_irq_helper_get()
> @@ -244,7 +244,7 @@ const struct x86_dev_info cyberbook_t116_info __initconst = {
>  #define CZC_EC_EXTRA_PORT	0x68
>  #define CZC_EC_ANDROID_KEYS	0x63
>  
> -static int __init czc_p10t_init(void)
> +static int __init czc_p10t_init(struct device *dev)
>  {
>  	/*
>  	 * The device boots up in "Windows 7" mode, when the home button sends a
> @@ -662,7 +662,7 @@ static const struct software_node *ktd2026_node_group[] = {
>  	NULL
>  };
>  
> -static int __init xiaomi_mipad2_init(void)
> +static int __init xiaomi_mipad2_init(struct device *dev)
>  {
>  	return software_node_register_node_group(ktd2026_node_group);
>  }
> diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> index 821dc094b025..86402b9b46a3 100644
> --- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> +++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> @@ -89,7 +89,7 @@ struct x86_dev_info {
>  	int pdev_count;
>  	int serdev_count;
>  	int gpio_button_count;
> -	int (*init)(void);
> +	int (*init)(struct device *dev);
>  	void (*exit)(void);
>  };
>  

