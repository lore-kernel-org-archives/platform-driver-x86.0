Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDCDC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 09:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236692AbiAKJn5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 04:43:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43722 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229629AbiAKJn4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 04:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641894236;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MeDN7L5fvXPYD1P5CV1dsnYsftRZGrUD7fGFef320Qg=;
        b=AtxKpnpkcNOCfECtoF0jM9bi8UHtPkj19Skmk43dUe+r08NqSOqb/bXG/6gp8vvS/gun8s
        ++qUHXgIgFKDOqtFgGIwfixhtDLRTUVCQvfgIErTjsdxSO+7aJcSCZcVBCi39my2dlm975
        fcIX/WnJz7aZx2RL73MkFf3Bo3y98YQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-j9Dn-jDsOE68bLkn9tYuMQ-1; Tue, 11 Jan 2022 04:43:55 -0500
X-MC-Unique: j9Dn-jDsOE68bLkn9tYuMQ-1
Received: by mail-ed1-f72.google.com with SMTP id eg24-20020a056402289800b003fe7f91df01so3792116edb.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 01:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MeDN7L5fvXPYD1P5CV1dsnYsftRZGrUD7fGFef320Qg=;
        b=J/iZ3ww6ihhhui0TF7pYaky+tlDm1YEOr83VW+VzSV2KE/GWbzRtAsSgzOFz9wPUJy
         NviC/7yGna0K1zTvrSVz9//9+X/V4LMfAtPk9vYm96Ik+wWhE1Sh/3RKGVvod+kROF57
         UByq2tTEHwF2P176RkopeFSN9VU4ivMbSM+0t3iu4ZXHbqFkY5M1p02nf7V5z3/yt8nX
         EVPyAG6F5DEpdb89O74jE2PK0752levWhmrNB/gsDDednN33RXEeQmeiH2sj/fh9jGCn
         TrrsyAjK4djDXR2TL4tsutOnYlXb7JhaWHJMS9nhC1A0D6gkdiWc7S3tFxGU0wWpgX+X
         ixSw==
X-Gm-Message-State: AOAM532FQd+/6GNaupAZ7/fiMHxokupB2uVuJPUZkpXIL3Jn3UnQvnF0
        x067OQ95YfDze2x+TqDzAvZSJy9ymvGzbrDRcfWK6QZCd9QWnGtELljLA07v8FC7HT554QHs7Ix
        DTO3VOhHFWRB4ffI5GXFQ3Hb5AOMTRfmPMA==
X-Received: by 2002:a17:907:8687:: with SMTP id qa7mr1068004ejc.106.1641894233853;
        Tue, 11 Jan 2022 01:43:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxD+7pzCYxoV2whYjacS3F5p/nBNdzHqazcWAamO75H6r64ROuBY/4Nq2pGN9h7TigyA/CmNw==
X-Received: by 2002:a17:907:8687:: with SMTP id qa7mr1067991ejc.106.1641894233684;
        Tue, 11 Jan 2022 01:43:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id cn9sm4769577edb.88.2022.01.11.01.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 01:43:53 -0800 (PST)
Message-ID: <3be9c77e-ae9d-f3c5-39c5-34806e100f6d@redhat.com>
Date:   Tue, 11 Jan 2022 10:43:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] platform/x86: x86-android-tablets: Add support for
 disabling ACPI _AEI handlers
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Lubomir Rintel <lkundrak@v3.sk>,
        platform-driver-x86@vger.kernel.org
References: <20220110103952.48760-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220110103952.48760-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/10/22 11:39, Hans de Goede wrote:
> Some of the broken DSDTs on these devices often also include broken / wrong
> _AEI (ACPI Event Interrupt) handlers, which can cause e.g. interrupt storms
> by listening to a floating GPIO pin.
> 
> Add support for disabling these and disable them on the Asus ME176C and
> TF103C tablets.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this series to my review-hans branch now, I will rebase this
on top of 5.17-rc1 once it out and then push it to for-next.

Regards,

Hans

> ---
>  drivers/platform/x86/x86-android-tablets.c | 23 ++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
> index 3ba63ad91b28..d125d7a5189a 100644
> --- a/drivers/platform/x86/x86-android-tablets.c
> +++ b/drivers/platform/x86/x86-android-tablets.c
> @@ -26,6 +26,7 @@
>  #include <linux/string.h>
>  /* For gpio_get_desc() which is EXPORT_SYMBOL_GPL() */
>  #include "../../gpio/gpiolib.h"
> +#include "../../gpio/gpiolib-acpi.h"
>  
>  /*
>   * Helper code to get Linux IRQ numbers given a description of the IRQ source
> @@ -47,7 +48,7 @@ struct x86_acpi_irq_data {
>  	int polarity; /* ACPI_ACTIVE_HIGH / ACPI_ACTIVE_LOW / ACPI_ACTIVE_BOTH */
>  };
>  
> -static int x86_acpi_irq_helper_gpiochip_find(struct gpio_chip *gc, void *data)
> +static int gpiochip_find_match_label(struct gpio_chip *gc, void *data)
>  {
>  	return gc->label && !strcmp(gc->label, data);
>  }
> @@ -73,7 +74,7 @@ static int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data)
>  		return irq;
>  	case X86_ACPI_IRQ_TYPE_GPIOINT:
>  		/* Like acpi_dev_gpio_irq_get(), but without parsing ACPI resources */
> -		chip = gpiochip_find(data->chip, x86_acpi_irq_helper_gpiochip_find);
> +		chip = gpiochip_find(data->chip, gpiochip_find_match_label);
>  		if (!chip) {
>  			pr_err("error cannot find GPIO chip %s\n", data->chip);
>  			return -ENODEV;
> @@ -143,6 +144,7 @@ struct x86_serdev_info {
>  };
>  
>  struct x86_dev_info {
> +	char *invalid_aei_gpiochip;
>  	const char * const *modules;
>  	struct gpiod_lookup_table **gpiod_lookup_tables;
>  	const struct x86_i2c_client_info *i2c_client_info;
> @@ -317,6 +319,7 @@ static const struct x86_dev_info asus_me176c_info __initconst = {
>  	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
>  	.gpiod_lookup_tables = asus_me176c_gpios,
>  	.modules = bq24190_modules,
> +	.invalid_aei_gpiochip = "INT33FC:02",
>  };
>  
>  /* Asus TF103C tablets have an Android factory img with everything hardcoded */
> @@ -417,6 +420,7 @@ static const struct x86_dev_info asus_tf103c_info __initconst = {
>  	.pdev_count = ARRAY_SIZE(int3496_pdevs),
>  	.gpiod_lookup_tables = asus_tf103c_gpios,
>  	.modules = bq24190_modules,
> +	.invalid_aei_gpiochip = "INT33FC:02",
>  };
>  
>  /*
> @@ -795,6 +799,7 @@ static __init int x86_android_tablet_init(void)
>  {
>  	const struct x86_dev_info *dev_info;
>  	const struct dmi_system_id *id;
> +	struct gpio_chip *chip;
>  	int i, ret = 0;
>  
>  	id = dmi_first_match(x86_android_tablet_ids);
> @@ -803,6 +808,20 @@ static __init int x86_android_tablet_init(void)
>  
>  	dev_info = id->driver_data;
>  
> +	/*
> +	 * The broken DSDTs on these devices often also include broken
> +	 * _AEI (ACPI Event Interrupt) handlers, disable these.
> +	 */
> +	if (dev_info->invalid_aei_gpiochip) {
> +		chip = gpiochip_find(dev_info->invalid_aei_gpiochip,
> +				     gpiochip_find_match_label);
> +		if (!chip) {
> +			pr_err("error cannot find GPIO chip %s\n", dev_info->invalid_aei_gpiochip);
> +			return -ENODEV;
> +		}
> +		acpi_gpiochip_free_interrupts(chip);
> +	}
> +
>  	/*
>  	 * Since this runs from module_init() it cannot use -EPROBE_DEFER,
>  	 * instead pre-load any modules which are listed as requirements.
> 

