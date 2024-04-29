Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0BE3C482
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 11:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714388912; cv=none; b=dAfjV+ET9SdPaBB+KaStQVhjKt9928fUQKjwoRL/pNlwmbpbiKnbTDwCfgEmQ/Vr0eUW4UxIQgu0RJcHTGdewnIIk2GW8zkHzgskzBUmiAqO7OaH0LGoP8RZS7JLLEQNQ5YyMPkbu6/KpmSON8b8/2XiwCDe1ZjngCLcRKO+Xoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714388912; c=relaxed/simple;
	bh=rp6+hKC+ad+mgkEi98DBJjCqcJINH+IEzxTI1mkGLxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hjE2zCh4xBC1JsgRcOCuI8ziwEAWeACCi9ivJdRNgzzqD+8xjeprQT51i6BM3OdXbN851DmwIGglS9iN9mTpFT/JZUR5jleTrEfYHLagG93PIfMXCQIoJY1xL2K2FsOVK5psTwqqkcOv4gwxzcH+Jj1Nwoa2vfEmYUxlxKJXEVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OiJZzC9m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OiJZzC9m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714388909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fi9Ww5WN0UHN0lPfAwwVKTm5WIJO8LV9mSzNDaozAKk=;
	b=OiJZzC9mieOw0dAUDNXRKXhE6xcKM6oDkIIMutKLVJgNihi3AMHHmu+ZmpzRkzHRDDUssg
	Ti/nC/wfMZ6wfd9VW9lPEORUp1/4FBPrxAE8bDJiaWAcKnqYwNNfXKvbYox/W0z/LsJknq
	oT/m6aoGafRxKAi+87PMzFmU8xQa7uk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-70vGdK72MVihAYJ1rbXL7A-1; Mon, 29 Apr 2024 07:08:23 -0400
X-MC-Unique: 70vGdK72MVihAYJ1rbXL7A-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2da2f30cb50so34967261fa.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 04:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714388901; x=1714993701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fi9Ww5WN0UHN0lPfAwwVKTm5WIJO8LV9mSzNDaozAKk=;
        b=LeiqUUqLUx4VGEmTN4j70NxoLaZUnk7xlbUrLVdspcC28SCZKbqiUxCgOnrzVJh9SG
         g8hk6qk12S0VEJ+wSU8nkGwo4kHWZbnwg1HW5coY19OIMQRz6W5PwIMkqlmhOYfZNPQn
         leTkcp/ip4k0nEOiqwR9MnLIr4w8M7Qt3Evz+/y39RuBMk1cEIr4yZt4yZoVX79SwQo6
         a726NWwkMFzpcXX1iStFRmMjz5kOwtaEEkQdH5dy1RYma7VzFXY9MpLGDCUNMPgU7eNq
         bSES0sMMYPTun5hflC5duZJbQx4okjWu2MY6HP6a1N8r5C5Q1Cc7woq5eZlo2M5sDuST
         n6EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcdDQ05gZ1U9E0L6Bno4vgSD7BtxKRlKCsl1/cgjH/NJLpm9i7Ddq1eEIU65JpXs6pQrEpAn0dqEdIs3zTo7lB9QoIffDT+uLe2BAsoE2T8RZvLg==
X-Gm-Message-State: AOJu0YwTQI2FiQzoc/F9yI3O44ZumTwHIWjZjtI0bUcJpDMTF6oz8NYG
	zx6ozsmBDwVo9NWVwClheZgtUJBQFWOWkRfRrMeh9Nv4FqgWDPbzcFCYpwBoP6vrr5CqjscD1rJ
	r/XIz76BJcwfTeP2khNjoDRMu6CGPgdEO70/NbKpQj3v7LGsFZR9UONUtY8ZBIwlWF2oto5cQUp
	lYO2g=
X-Received: by 2002:ac2:58e4:0:b0:51a:c8ba:d908 with SMTP id v4-20020ac258e4000000b0051ac8bad908mr4900888lfo.62.1714388901471;
        Mon, 29 Apr 2024 04:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8/9kepMq4qGDA0SgBLzUsoTj90wfyKWPp2nBHN74LvVd8ORCf32skRlaD0gI0fxbnFiZi7g==
X-Received: by 2002:ac2:58e4:0:b0:51a:c8ba:d908 with SMTP id v4-20020ac258e4000000b0051ac8bad908mr4900881lfo.62.1714388901138;
        Mon, 29 Apr 2024 04:08:21 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id y20-20020a056402271400b00572300f0768sm5885853edd.79.2024.04.29.04.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 04:08:19 -0700 (PDT)
Message-ID: <3e103075-c170-42e3-928b-41d3bb11e6e8@redhat.com>
Date: Mon, 29 Apr 2024 13:08:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] leds: rgb: leds-ktd202x: I2C ID tables for KTD2026
 and 2027
To: Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
References: <20240424065212.263784-1-hpa@redhat.com>
 <20240424065212.263784-3-hpa@redhat.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240424065212.263784-3-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/24/24 8:52 AM, Kate Hsuan wrote:

Maybe start the commit message with:

Add an i2c_device_id id_table to match manually instantiated
(non device-tree / ACPI instantiated) KTD202x controllers as
found on some x86 boards.

?

> This table shows the maximum support LED channel for KTD2026 and KTD-2027.
> The 3-channel LED controller KTD2026 controls R/G/B three LEDs. The
> 4-channel LED controller KTD2027 controls R/G/B and flashing LEDs.

Other then that this looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> 
> Datasheet: https://www.kinet-ic.com/uploads/KTD2026-7-04h.pdf
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/leds/rgb/leds-ktd202x.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
> index f1c810c415a4..60ca6ec34336 100644
> --- a/drivers/leds/rgb/leds-ktd202x.c
> +++ b/drivers/leds/rgb/leds-ktd202x.c
> @@ -606,6 +606,13 @@ static void ktd202x_shutdown(struct i2c_client *client)
>  	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_RSTR_RESET);
>  }
>  
> +static const struct i2c_device_id ktd202x_id[] = {
> +	{"ktd2026", KTD2026_NUM_LEDS},
> +	{"ktd2027", KTD2027_NUM_LEDS},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, ktd202x_id);
> +
>  static const struct of_device_id ktd202x_match_table[] = {
>  	{ .compatible = "kinetic,ktd2026", .data = (void *)KTD2026_NUM_LEDS },
>  	{ .compatible = "kinetic,ktd2027", .data = (void *)KTD2027_NUM_LEDS },
> @@ -621,6 +628,7 @@ static struct i2c_driver ktd202x_driver = {
>  	.probe = ktd202x_probe,
>  	.remove = ktd202x_remove,
>  	.shutdown = ktd202x_shutdown,
> +	.id_table = ktd202x_id,
>  };
>  module_i2c_driver(ktd202x_driver);
>  

