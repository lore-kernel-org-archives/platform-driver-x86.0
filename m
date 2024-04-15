Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A3A74BE1
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 13:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713188647; cv=none; b=cX4IbN/JL5tGnpO1K0w6cTPcFUDSNzJbcJzfpseBOkBco5B+I3IqtOyQttAlRTM+8BiMBTTeNtncwvFiy7Q0otsjGD0WKhSDDL7wpfWw8K6HhClqTGJkprZplbW+FKbz9ZyBWUKj7it+789S5JBZRWqiDesJn22GZc0VPT2uGTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713188647; c=relaxed/simple;
	bh=jPR/7DtsgfiPVb6jJQO3k25zM6Wmi3y3/pUjt1bYU2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rEJ0yO/wocJMm9CHRxx7OAcYZN4kAqQhHU11WQAyHkfYU5IY+jhdBuO+uEmgPG7hzPZsoxzd34WcRArTYcEIrwXG7tfj4w+jJdsd++13pAoRyyxUqHKb4X2yNcYefp9vUbIVIdANZyAjRibFvjDSqXZJhLQ6Y+3lM4E2ZkGHhO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GrqYKruS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GrqYKruS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713188644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V9M5Cyl9x5IuByDq5Vk8a71E49CZS/HWrR0ok0ybzVQ=;
	b=GrqYKruSD0x6uUWwhxSiIgQqROyhYIc3aWyff5EiI1sEsG+nlEL/dQU6Lia/wk8jYhyOtt
	37IbbnUVgntQ4F+4HWQxUZGf5IG0L9aqSR1BaD+umUo6WtMk78rwTvmJYN4qVcuYU6c2nJ
	u0nLR8I+pivIsBUksTRrhRcHtUbm7Sk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-BLib7pYuPf-4LCWVu3tUBg-1; Mon, 15 Apr 2024 09:44:02 -0400
X-MC-Unique: BLib7pYuPf-4LCWVu3tUBg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a467a6d4e3eso130658966b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 06:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713188641; x=1713793441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9M5Cyl9x5IuByDq5Vk8a71E49CZS/HWrR0ok0ybzVQ=;
        b=szwCGgyoAIkyd1Hv7L61ROeU/mQLSnpOLFnASLOZEBu50mpCsqgf9gdx4CHuPhUW2X
         FCLMQbfpzpsBWBqTOvHzDcADI3BiSuHmhXEPBK7h7B+SIRyr0d9sIGtrQ5u1hK00QbU0
         NyfevKm+Z/5qa0ErUmCIbJ097q/YegRqiWzbrlMa6NStZEdefX3cslVR8dQuBkFMb1MD
         UWI9Z0t0QIQ+5DJwo+h6A+3I1FXFuaL2wUM71P9bckWt7uJ2lPP/xGOOsiYqG9DkgCnW
         +33fqh4lQNYLJ7YHABprvf+6lt0BSSm/hTD39gRRsn8EQXzKwG69dcb0NW/QWvXV3rHG
         jXmg==
X-Gm-Message-State: AOJu0Yz9DQR+hV+7dqMeK/YcKYh3QqqIefA+qKmqKDH71D3MTBepjTru
	I7aUU0jTA1WGCuIm2FmSZ7HgZbj+DgxjfSoMYYvgnY2Dgx/TAlM/XJNdSnFgRkriSbl+IgIJclm
	2Kl+vdfW63Aiwgfrgj7Xx8yVYF8QeYZjuLKdW2G9+juJg97W0q6hI1G0pYNXdTWebXRhLmr0XKk
	R2u0o31Q==
X-Received: by 2002:a17:906:f8d0:b0:a52:6dbf:a88 with SMTP id lh16-20020a170906f8d000b00a526dbf0a88mr1214512ejb.39.1713188641610;
        Mon, 15 Apr 2024 06:44:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsz4i3YOKbRKhDvC9nEwWO1yEtLcvZKA3M9I3b3q/QFHUYaWnc8UuGy177RuDLuxFGknJy7g==
X-Received: by 2002:a17:906:f8d0:b0:a52:6dbf:a88 with SMTP id lh16-20020a170906f8d000b00a526dbf0a88mr1214458ejb.39.1713188639667;
        Mon, 15 Apr 2024 06:43:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id du2-20020a17090772c200b00a52299d8eecsm5033614ejc.135.2024.04.15.06.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 06:43:59 -0700 (PDT)
Message-ID: <5e9be657-1a3e-456c-b597-7ddb85585384@redhat.com>
Date: Mon, 15 Apr 2024 15:43:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] platform/x86: x86-android-tablets: Unregister devices
 in reverse order
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20240406125058.13624-1-hdegoede@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240406125058.13624-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

I've added patch 1/3 and 2/3 of this series to my review-hans
(soon to be for-next) branch now.

I'll send out a v2 of patch 3/3 to address the review comments.

Regards,

Hans



On 4/6/24 2:50 PM, Hans de Goede wrote:
> Not all subsystems support a device getting removed while there are
> still consumers of the device with a reference to the device.
> 
> One example of this is the regulator subsystem. If a regulator gets
> unregistered while there are still drivers holding a reference
> a WARN() at drivers/regulator/core.c:5829 triggers, e.g.:
> 
>  WARNING: CPU: 1 PID: 1587 at drivers/regulator/core.c:5829 regulator_unregister
>  Hardware name: Intel Corp. VALLEYVIEW C0 PLATFORM/BYT-T FFD8, BIOS BLADE_21.X64.0005.R00.1504101516 FFD8_X64_R_2015_04_10_1516 04/10/2015
>  RIP: 0010:regulator_unregister
>  Call Trace:
>   <TASK>
>   regulator_unregister
>   devres_release_group
>   i2c_device_remove
>   device_release_driver_internal
>   bus_remove_device
>   device_del
>   device_unregister
>   x86_android_tablet_remove
> 
> On the Lenovo Yoga Tablet 2 series the bq24190 charger chip also provides
> a 5V boost converter output for powering USB devices connected to the micro
> USB port, the bq24190-charger driver exports this as a Vbus regulator.
> 
> On the 830 (8") and 1050 ("10") models this regulator is controlled by
> a platform_device and x86_android_tablet_remove() removes platform_device-s
> before i2c_clients so the consumer gets removed first.
> 
> But on the 1380 (13") model there is a lc824206xa micro-USB switch
> connected over I2C and the extcon driver for that controls the regulator.
> The bq24190 i2c-client *must* be registered first, because that creates
> the regulator with the lc824206xa listed as its consumer. If the regulator
> has not been registered yet the lc824206xa driver will end up getting
> a dummy regulator.
> 
> Since in this case both the regulator provider and consumer are I2C
> devices, the only way to ensure that the consumer is unregistered first
> is to unregister the I2C devices in reverse order of in which they were
> created.
> 
> For consistency and to avoid similar problems in the future change
> x86_android_tablet_remove() to unregister all device types in reverse
> order.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/x86-android-tablets/core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
> index a3415f1c0b5f..6559bb4ea730 100644
> --- a/drivers/platform/x86/x86-android-tablets/core.c
> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> @@ -278,25 +278,25 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
>  {
>  	int i;
>  
> -	for (i = 0; i < serdev_count; i++) {
> +	for (i = serdev_count - 1; i >= 0; i--) {
>  		if (serdevs[i])
>  			serdev_device_remove(serdevs[i]);
>  	}
>  
>  	kfree(serdevs);
>  
> -	for (i = 0; i < pdev_count; i++)
> +	for (i = pdev_count - 1; i >= 0; i--)
>  		platform_device_unregister(pdevs[i]);
>  
>  	kfree(pdevs);
>  	kfree(buttons);
>  
> -	for (i = 0; i < spi_dev_count; i++)
> +	for (i = spi_dev_count - 1; i >= 0; i--)
>  		spi_unregister_device(spi_devs[i]);
>  
>  	kfree(spi_devs);
>  
> -	for (i = 0; i < i2c_client_count; i++)
> +	for (i = i2c_client_count - 1; i >= 0; i--)
>  		i2c_unregister_device(i2c_clients[i]);
>  
>  	kfree(i2c_clients);

