Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2E7C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 10:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348238AbiAKKKA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 05:10:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46208 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237384AbiAKKKA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 05:10:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641895799;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XLQgouFyH0NcgrTWkUfK17GyfTSKFW5WlwBJJ3ghfNs=;
        b=aAB5Q5jrKhbOhRwMDz9UXYLPupRBfG2yp2cK9sADY8MhgL9cU93CbcIgFriVpN1A7YMXkM
        eilakwsH9fwRF2684Wb7MF80oejz83EvVtZV/lew/cVMJKLJjiXNvXAaWnj7juA3yG4naM
        MjT4uHOqCGueOx+3q4DZ69vj8zGrLKY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-zPE78xmOMqWh0155uErz3w-1; Tue, 11 Jan 2022 05:09:58 -0500
X-MC-Unique: zPE78xmOMqWh0155uErz3w-1
Received: by mail-ed1-f69.google.com with SMTP id g2-20020a056402424200b003f8ee03207eso12876790edb.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 02:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XLQgouFyH0NcgrTWkUfK17GyfTSKFW5WlwBJJ3ghfNs=;
        b=yNJtvecPxWpFLD20IuqohZe40BAYS7TX5quQ3yVgJBIyoNxNmNQTLxIX5bLw1m6eAW
         Gzyy7usPrCTLTosHaOZo2Ps+uz4dLOS6Jy83BHWh9SRMA4ohuF6+KHqfFdGAu+Q5zNp7
         wZQ7IxGhTVXRsPDPuKwekjbgaWU4nQRj1t2h3RpxGL1bw9Qb+k71BJUFCjul2DgomDkb
         6OhGifs1yisaTouKytPBvejqt6PUOreV5bNgPCKBKD366p8qCuS//MnIBboRA3RkMGoJ
         mlvl3bqrt4/XychGlWN9GlKd7mgCnHQw1E8+4VwO2bzbyg5k1Jl4YoiqX5p8WkosS7wr
         rIeA==
X-Gm-Message-State: AOAM532ZIdLgo5omjeZfTG97ABAqM02w39la79WHfn8PKCADonabwxAI
        CmkWFQKI4dLUNNgagXtTTxYrH7SY9TPht7Xcwpgc19RVO/Kf7SeNo3gi+cA57hUstZvnalVHoQZ
        n69owhKRFfFamhVOlWz4SQr39FlzbuadigQ==
X-Received: by 2002:a50:d492:: with SMTP id s18mr3661053edi.145.1641895797486;
        Tue, 11 Jan 2022 02:09:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjNxW645o31BOFY35HEaPBaa/unplk1sISLNir7mH4eCfJbjkXZavk6Pwz5v1ktAsRD6pSwA==
X-Received: by 2002:a50:d492:: with SMTP id s18mr3661043edi.145.1641895797268;
        Tue, 11 Jan 2022 02:09:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id qp24sm3407252ejb.84.2022.01.11.02.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 02:09:57 -0800 (PST)
Message-ID: <82d28382-eb68-a5a8-32f2-f23fd99e1bc0@redhat.com>
Date:   Tue, 11 Jan 2022 11:09:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] platform/x86: x86-android-tablets: Add support for
 disabling ACPI _AEI handlers
Content-Language: en-US
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20220110103952.48760-1-hdegoede@redhat.com>
 <Yd1Ww7InM/+voqk2@demiurge.local>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yd1Ww7InM/+voqk2@demiurge.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/11/22 11:06, Lubomir Rintel wrote:
> On Mon, Jan 10, 2022 at 11:39:50AM +0100, Hans de Goede wrote:
>> Some of the broken DSDTs on these devices often also include broken / wrong
>> _AEI (ACPI Event Interrupt) handlers, which can cause e.g. interrupt storms
>> by listening to a floating GPIO pin.
>>
>> Add support for disabling these and disable them on the Asus ME176C and
>> TF103C tablets.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> The whole series looks good to me. Feel free to slap on:
> 
> Reviewed-By: Lubomir Rintel <lkundrak@V3.sk>

Thanks, I've added the tag to the patches in my review-hans branch.

Regards,

Hans



>> ---
>>  drivers/platform/x86/x86-android-tablets.c | 23 ++++++++++++++++++++--
>>  1 file changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
>> index 3ba63ad91b28..d125d7a5189a 100644
>> --- a/drivers/platform/x86/x86-android-tablets.c
>> +++ b/drivers/platform/x86/x86-android-tablets.c
>> @@ -26,6 +26,7 @@
>>  #include <linux/string.h>
>>  /* For gpio_get_desc() which is EXPORT_SYMBOL_GPL() */
>>  #include "../../gpio/gpiolib.h"
>> +#include "../../gpio/gpiolib-acpi.h"
>>  
>>  /*
>>   * Helper code to get Linux IRQ numbers given a description of the IRQ source
>> @@ -47,7 +48,7 @@ struct x86_acpi_irq_data {
>>  	int polarity; /* ACPI_ACTIVE_HIGH / ACPI_ACTIVE_LOW / ACPI_ACTIVE_BOTH */
>>  };
>>  
>> -static int x86_acpi_irq_helper_gpiochip_find(struct gpio_chip *gc, void *data)
>> +static int gpiochip_find_match_label(struct gpio_chip *gc, void *data)
>>  {
>>  	return gc->label && !strcmp(gc->label, data);
>>  }
>> @@ -73,7 +74,7 @@ static int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data)
>>  		return irq;
>>  	case X86_ACPI_IRQ_TYPE_GPIOINT:
>>  		/* Like acpi_dev_gpio_irq_get(), but without parsing ACPI resources */
>> -		chip = gpiochip_find(data->chip, x86_acpi_irq_helper_gpiochip_find);
>> +		chip = gpiochip_find(data->chip, gpiochip_find_match_label);
>>  		if (!chip) {
>>  			pr_err("error cannot find GPIO chip %s\n", data->chip);
>>  			return -ENODEV;
>> @@ -143,6 +144,7 @@ struct x86_serdev_info {
>>  };
>>  
>>  struct x86_dev_info {
>> +	char *invalid_aei_gpiochip;
>>  	const char * const *modules;
>>  	struct gpiod_lookup_table **gpiod_lookup_tables;
>>  	const struct x86_i2c_client_info *i2c_client_info;
>> @@ -317,6 +319,7 @@ static const struct x86_dev_info asus_me176c_info __initconst = {
>>  	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
>>  	.gpiod_lookup_tables = asus_me176c_gpios,
>>  	.modules = bq24190_modules,
>> +	.invalid_aei_gpiochip = "INT33FC:02",
>>  };
>>  
>>  /* Asus TF103C tablets have an Android factory img with everything hardcoded */
>> @@ -417,6 +420,7 @@ static const struct x86_dev_info asus_tf103c_info __initconst = {
>>  	.pdev_count = ARRAY_SIZE(int3496_pdevs),
>>  	.gpiod_lookup_tables = asus_tf103c_gpios,
>>  	.modules = bq24190_modules,
>> +	.invalid_aei_gpiochip = "INT33FC:02",
>>  };
>>  
>>  /*
>> @@ -795,6 +799,7 @@ static __init int x86_android_tablet_init(void)
>>  {
>>  	const struct x86_dev_info *dev_info;
>>  	const struct dmi_system_id *id;
>> +	struct gpio_chip *chip;
>>  	int i, ret = 0;
>>  
>>  	id = dmi_first_match(x86_android_tablet_ids);
>> @@ -803,6 +808,20 @@ static __init int x86_android_tablet_init(void)
>>  
>>  	dev_info = id->driver_data;
>>  
>> +	/*
>> +	 * The broken DSDTs on these devices often also include broken
>> +	 * _AEI (ACPI Event Interrupt) handlers, disable these.
>> +	 */
>> +	if (dev_info->invalid_aei_gpiochip) {
>> +		chip = gpiochip_find(dev_info->invalid_aei_gpiochip,
>> +				     gpiochip_find_match_label);
>> +		if (!chip) {
>> +			pr_err("error cannot find GPIO chip %s\n", dev_info->invalid_aei_gpiochip);
>> +			return -ENODEV;
>> +		}
>> +		acpi_gpiochip_free_interrupts(chip);
>> +	}
>> +
>>  	/*
>>  	 * Since this runs from module_init() it cannot use -EPROBE_DEFER,
>>  	 * instead pre-load any modules which are listed as requirements.
>> -- 
>> 2.33.1
>>
> 

