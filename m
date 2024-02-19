Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0633770E
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 14:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708351469; cv=none; b=GO/SMvPLN0fAgHXs6sCalFUL6BjkP0z+KvQYU7OvWsNrMD+qBlZvOIWGu/fR/kWUljK2VuuVl0vC2ppZObeVtAJQRKuiRSE6c9MjvGsDm9MQPTAO8P3JSLO8EQKDA5Jr4zYUmfbzO69ruJofGnVARUlZVn/MncjxmJ7VaF6BGeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708351469; c=relaxed/simple;
	bh=/B+cRa2xJ91j6ScKUeZTulN4GesGbuWX+zluK6emdQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hW4zOEET3sykN+pSauMOjShHuoD/Q+KJW9BhtUY1QnQ/KBXmQZEBX+a5aQcDtUMbEsfeq4Y9KPBzqrjsNeZh5vyjkRjAQE6Fjjwo6iFWp0oOnBT7HxF4+gh6eSOnVnq5stuJyuxrm1xixW5nAXtqF/4CYBI17oYc1Vfdy2rcBUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H3bN79ZX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H3bN79ZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708351466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QHPqJN8GSi+c88EzSJKHbyZ5WbbcaZEMD3hh+KPEbjw=;
	b=H3bN79ZXCFS3HoBeYd/y6xKc3PvRQP0szKDKCjp7C0N9hA7Sblv36oVsQqwvB3N2YfS54e
	EkayJ2iwqND6+vx20xr8ksNth0R8JlYxDsjuJm64ot992S/aNhUgoQMmnPVTh8n8Okdjor
	8cgBpJtXzwj1VafTGBXtGCB8Ns5JxR4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-71JXL1KpP7yRUMcd77Db7w-1; Mon, 19 Feb 2024 09:04:24 -0500
X-MC-Unique: 71JXL1KpP7yRUMcd77Db7w-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a3d7cd58ae2so152984866b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 06:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708351463; x=1708956263;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHPqJN8GSi+c88EzSJKHbyZ5WbbcaZEMD3hh+KPEbjw=;
        b=u6X4incfSZf4yst3kWRiJsC20JtOqyEbHY+xztQfN4b2JKnF884mzuRwSEXhPqtES2
         mX79WyjRt0uKwDgUQ9771gYDnDmtUhW+r4QdDV5tMB8kH2vo3rFEzy+IOnJYWLECX9GS
         qq6YdqAIqBQjI3ntkFs4PUEnAVXTHHKYhXYpEcYmOSFiytNpGWJTq4D3on8dF5Lwjaem
         EUlQ+H9m8y9KxlotY48v1SSRONF1OPajIPFJ+cGuyqR9W4q9t1dd2vLmEAotMvg6MbH9
         ewALB2slsj3QZ+Y04SOPw56MF60T8z/uuccl3vK8OI5teyJzkxAWYQPfOWXyXhOF3Tzc
         EvTw==
X-Forwarded-Encrypted: i=1; AJvYcCVRdIbvlnxdTrs7qPwEmJfMM6iU56b7YDQHKoVC3KvdDR2VQEGL1NiRNKbRM7FMnaNMTjLDrK1MxypOvKse/Syc1Skou/fwPyh/ruaJvon9TaK0Zw==
X-Gm-Message-State: AOJu0Ywfe2VOb/PZ8eKWhG6sXIzpgaMEUP6CSdvjlOFNGMVeQUZnFXU3
	F7J1jm5FyoOVZA4cPbJ2ZopcOXIZxEnY3Og92BbGqNz74ahuQ+v5uJcCZ6wwmnXJbELWdMobKA6
	DOOZJgnhv9QPdhfD9sOUgNCCN2wfYp/VU17MGySpGH1dIq1BNo6BDR8SWPhKSkmnCeiBMEVw=
X-Received: by 2002:a17:906:69d0:b0:a3c:af7e:1660 with SMTP id g16-20020a17090669d000b00a3caf7e1660mr8522809ejs.22.1708351462902;
        Mon, 19 Feb 2024 06:04:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGz7IAiC18FsCML50nThBUxUMGtk6XyxTXjjCRB/EeQqSIwn7ofYopDWQf480IyL0ABa8haIQ==
X-Received: by 2002:a17:906:69d0:b0:a3c:af7e:1660 with SMTP id g16-20020a17090669d000b00a3caf7e1660mr8522793ejs.22.1708351462566;
        Mon, 19 Feb 2024 06:04:22 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id rg8-20020a1709076b8800b00a3e209b225asm2589356ejc.43.2024.02.19.06.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 06:04:22 -0800 (PST)
Message-ID: <5c5840f6-35fe-4581-a275-ab1b2b6a1cf3@redhat.com>
Date: Mon, 19 Feb 2024 15:04:20 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] leds: rgb: leds-ktd202x: Skip regulator settings
 for Xiaomi pad2
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Kate Hsuan <hpa@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
References: <20240216160526.235594-1-hpa@redhat.com>
 <20240216160526.235594-4-hpa@redhat.com>
 <9f2d02ff-5a8a-4c11-a1a3-bea43d7b6454@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9f2d02ff-5a8a-4c11-a1a3-bea43d7b6454@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kate, Ilpo,

On 2/19/24 14:28, Ilpo Järvinen wrote:
> On Sat, 17 Feb 2024, Kate Hsuan wrote:
> 
>> The controller is already powered by BP25890RTWR on Xiaomi Pad2 so the
>> regulator settings can be ignored.
>>
>> Signed-off-by: Kate Hsuan <hpa@redhat.com>
>> ---
>>  drivers/leds/rgb/leds-ktd202x.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
>> index 8eb79c342fb6..6fd0794988e9 100644
>> --- a/drivers/leds/rgb/leds-ktd202x.c
>> +++ b/drivers/leds/rgb/leds-ktd202x.c
>> @@ -14,7 +14,9 @@
>>  #include <linux/of.h>
>>  #include <linux/of_device.h>
>>  #include <linux/regmap.h>
>> +#ifndef CONFIG_ACPI
>>  #include <linux/regulator/consumer.h>
>> +#endif
> 
> Why you need #ifndef here?
>   
>>  #define KTD2026_NUM_LEDS 3
>>  #define KTD2027_NUM_LEDS 4
>> @@ -105,18 +107,22 @@ struct ktd202x {
>>  
>>  static int ktd202x_chip_disable(struct ktd202x *chip)
>>  {
>> +#ifndef CONFIG_ACPI
>>  	int ret;
>> +#endif
>>  
>>  	if (!chip->enabled)
>>  		return 0;
>>  
>>  	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_ENABLE_CTRL_SLEEP);
>>  
>> +#ifndef CONFIG_ACPI
>>  	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip->regulators);
>>  	if (ret) {
>>  		dev_err(chip->dev, "Failed to disable regulators: %d\n", ret);
>>  		return ret;
>>  	}
>> +#endif
>>  
>>  	chip->enabled = false;
>>  	return 0;
>> @@ -129,11 +135,13 @@ static int ktd202x_chip_enable(struct ktd202x *chip)
>>  	if (chip->enabled)
>>  		return 0;
>>  
>> +#ifndef CONFIG_ACPI
>>  	ret = regulator_bulk_enable(ARRAY_SIZE(chip->regulators), chip->regulators);
>>  	if (ret) {
>>  		dev_err(chip->dev, "Failed to enable regulators: %d\n", ret);
>>  		return ret;
>>  	}
>> +#endif
>>  	chip->enabled = true;
>>  
>>  	ret = regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_ENABLE_CTRL_WAKE);
>> @@ -560,6 +568,7 @@ static int ktd202x_probe(struct i2c_client *client)
>>  		return ret;
>>  	}
>>  
>> +#ifndef CONFIG_ACPI
>>  	chip->regulators[0].supply = "vin";
>>  	chip->regulators[1].supply = "vio";
>>  	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(chip->regulators), chip->regulators);
>> @@ -573,10 +582,12 @@ static int ktd202x_probe(struct i2c_client *client)
>>  		dev_err_probe(dev, ret, "Failed to enable regulators.\n");
>>  		return ret;
>>  	}
>> +#endif
>>  
>>  	chip->num_leds = (int) (unsigned long)i2c_get_match_data(client);
>>  
>>  	ret = ktd202x_probe_dt(chip);
>> +#ifndef CONFIG_ACPI
>>  	if (ret < 0) {
>>  		regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip->regulators);
>>  		return ret;
>> @@ -587,6 +598,10 @@ static int ktd202x_probe(struct i2c_client *client)
>>  		dev_err_probe(dev, ret, "Failed to disable regulators.\n");
>>  		return ret;
>>  	}
>> +#else
>> +	if (ret < 0)
>> +		return ret;
>> +#endif
>>  
>>  	mutex_init(&chip->mutex);
> 
> To me this entire approach looks quite ugly. It would be much cleaner to 
> have something along these lines:
> 
> #ifndef CONFIG_ACPI
> static int ktd202x_regulators_disable(struct ktd202x *chip)
> {
> 	int ret;
> 
> 	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip->regulators);
> 	if (ret)
> 		dev_err(chip->dev, "Failed to disable regulators: %d\n", ret);
> 
> 	return ret;
> }
> ...
> #else
> static inline int ktd202x_regulators_disable(struct ktd202x *chip) { return 0; }
> ...
> #endif
> 
> And call that function without any #ifdefs from the other code.

I believe that skipping the regulator stuff in the ACPI case is not
the right solution here.

There likely is some underlying issue which also happens on non ACPI
hw, but I guess no-one has ever tried to remove the module there.

I have the same tablet as on which Kate is testing this. So I plan
to make some time to reproduce this and see if I can come up with
a proper fix.

Regards,

Hans

