Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07B1EB64D9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 10 Jul 2023 13:26:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjGJN0V (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 10 Jul 2023 09:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbjGJN0U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Jul 2023 09:26:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D22180
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Jul 2023 06:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688995511;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jby3fwWq49Ha1sduxZlOKoh8VaQzBZ57+w8tL8enNh0=;
        b=NKfNPE61aemfstStPjHnbVPBOJAQ8iQJda1qobG5Qq5QVpxE1iuXEb+BmAme6EphQGWqlm
        1XjTonvUCgh5VQPQABXsaBmAlBIUrCO0E+4cKwXH/dUkXQLjKnj6jzj0z8V1xg0FuU1gpZ
        R/WxVm1ZT0ESaOA0J71lNbMcAyHWAz4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-apvozO7kOViEbpXyWulh5g-1; Mon, 10 Jul 2023 09:25:10 -0400
X-MC-Unique: apvozO7kOViEbpXyWulh5g-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-993c24f3246so478919966b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Jul 2023 06:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688995509; x=1691587509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jby3fwWq49Ha1sduxZlOKoh8VaQzBZ57+w8tL8enNh0=;
        b=KaHdN/xL5v2ojR1J1u8+TsMXIFuMuU2DCB/jVm9Lo1dk8RmdBNqQtXNMajR51lbkLS
         hIJfeJwjBUBFwTNhMkfCL5EbcMJqJfOHdCTEeAACngifrkHpbtSv+jbqJNPT2kk1W7rW
         ydfGeHelr6ae+N7dZxMdpr2ioTGeX9l+9XRHG3z6HIS9MHPv92RI4UDUavkiZTpPVnml
         7fPlq/2S3BoprWt+tNDOMdp/AWBs8I0i31VQ71ibPRDiqV+hWxrVkIJPYh6rVawQ/xhj
         5ixeSwmSR7laFO9KADhbVxibwT4PJvpOAXxW1G4JQz6WwmSMqA7FP7OTeW9KZ6/T/jcV
         4tVw==
X-Gm-Message-State: ABy/qLZ2wwLuY5UDNcsjkG0cIN5GkyVfQzZhzSTifYJdTgcWnKk11HY3
        zPPp2HT8J9aF8oG78NnPfrrqJbN1Z4MzK+cO+zFzt2UPDcf7OohsRZ7RdO4qI894Xe21n9RWtL9
        VnhmHlFM+xqA2h47I9+qiG5FeUllRNvTRVQ==
X-Received: by 2002:a17:906:314f:b0:992:6d73:5696 with SMTP id e15-20020a170906314f00b009926d735696mr14109522eje.5.1688995509486;
        Mon, 10 Jul 2023 06:25:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGUQwDMyrPQc/seU14sKXx7W1Lk8SBsWn8IlAG/Blrppi6ur7wgsoQ8eYgOp17vlw5NGM06IA==
X-Received: by 2002:a17:906:314f:b0:992:6d73:5696 with SMTP id e15-20020a170906314f00b009926d735696mr14109495eje.5.1688995509111;
        Mon, 10 Jul 2023 06:25:09 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g5-20020a170906348500b00992c92af6easm6106293ejb.161.2023.07.10.06.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 06:25:08 -0700 (PDT)
Message-ID: <dae5723a-b725-ef2e-43a1-0c2f2a255057@redhat.com>
Date:   Mon, 10 Jul 2023 15:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86: system76: Handle new KBLED ACPI methods
Content-Language: en-US
To:     Tim Crawford <tcrawford@system76.com>,
        platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
References: <20230701004329.88288-1-tcrawford@system76.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230701004329.88288-1-tcrawford@system76.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Thank you for the patch, I have several review remarks below.

On 7/1/23 02:43, Tim Crawford wrote:
> System76 EC since system76/ec@9ac513128ad9 detects if the keyboard is
> white or RGB backlit via `RGBKB-DET#` at run-time instead of being set
> at compile-time. As part of this, the brightness of white-only backlit
> keyboards was also changed to behave more like the RGB-backlit
> keyboards: a value between 0 and 255 instead of a firmware-defined
> level.
> 
> The EC ACPI methods in coreboot have been updated for this new
> functionality only, removing the old behavior.
> 
> This should preserve behavior as we roll out new firmware with these
> changes included and users update to it.
> 
> Ref: https://github.com/system76/ec/pull/357
> Ref: https://review.coreboot.org/c/coreboot/+/76152
> Signed-off-by: Tim Crawford <tcrawford@system76.com>
> ---
>  drivers/platform/x86/system76_acpi.c | 84 ++++++++++++++++++++++------
>  1 file changed, 67 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
> index fc4708fa6ebe..a172769f5172 100644
> --- a/drivers/platform/x86/system76_acpi.c
> +++ b/drivers/platform/x86/system76_acpi.c
> @@ -2,7 +2,7 @@
>  /*
>   * System76 ACPI Driver
>   *
> - * Copyright (C) 2019 System76
> + * Copyright (C) 2023 System76
>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License version 2 as
> @@ -24,6 +24,12 @@
>  
>  #include <acpi/battery.h>
>  
> +enum kbled_type {
> +	KBLED_NONE,
> +	KBLED_WHITE,
> +	KBLED_RGB,
> +};
> +
>  struct system76_data {
>  	struct acpi_device *acpi_dev;
>  	struct led_classdev ap_led;
> @@ -36,6 +42,7 @@ struct system76_data {
>  	union acpi_object *ntmp;
>  	struct input_dev *input;
>  	bool has_open_ec;
> +	enum kbled_type kbled_type;
>  };
>  
>  static const struct acpi_device_id device_ids[] = {
> @@ -51,7 +58,7 @@ static const enum led_brightness kb_levels[] = {
>  	96,
>  	144,
>  	192,
> -	255
> +	255,
>  };
>  
>  // Array of keyboard LED colors in 24-bit RGB format

Please drop this unnecessary addition of the ',' .

> @@ -62,7 +69,7 @@ static const int kb_colors[] = {
>  	0xFF00FF,
>  	0x00FF00,
>  	0x00FFFF,
> -	0xFFFF00
> +	0xFFFF00,
>  };
>  
>  // Get a System76 ACPI device value by name

Please drop this unnecessary addition of the ',' .

> @@ -327,7 +334,11 @@ static int kb_led_set(struct led_classdev *led, enum led_brightness value)
>  
>  	data = container_of(led, struct system76_data, kb_led);
>  	data->kb_brightness = value;
> -	return system76_set(data, "SKBL", (int)data->kb_brightness);
> +	if (acpi_has_method(acpi_device_handle(data->acpi_dev), "GKBK")) {
> +		return system76_set(data, "SKBB", (int)data->kb_brightness);
> +	} else {
> +		return system76_set(data, "SKBL", (int)data->kb_brightness);
> +	}
>  }
>  
>  // Get the last set keyboard LED color
> @@ -399,7 +410,12 @@ static void kb_led_hotkey_hardware(struct system76_data *data)
>  {
>  	int value;
>  
> -	value = system76_get(data, "GKBL");
> +	if (acpi_has_method(acpi_device_handle(data->acpi_dev), "GKBK")) {
> +		value = system76_get(data, "GKBB");
> +	} else {
> +		value = system76_get(data, "GKBL");
> +	}
> +
>  	if (value < 0)
>  		return;
>  	data->kb_brightness = value;
> @@ -683,20 +699,54 @@ static int system76_add(struct acpi_device *acpi_dev)
>  	if (err)
>  		return err;
>  
> -	data->kb_led.name = "system76_acpi::kbd_backlight";
> -	data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
> -	data->kb_led.brightness_get = kb_led_get;
> -	data->kb_led.brightness_set_blocking = kb_led_set;

These 4 lines are repeated in all 3 scenarios below, please just
keep them here above the if () ... ... ... blocks.

> -	if (acpi_has_method(acpi_device_handle(data->acpi_dev), "SKBC")) {
> -		data->kb_led.max_brightness = 255;
> -		data->kb_led.groups = system76_kb_led_color_groups;
> -		data->kb_toggle_brightness = 72;
> -		data->kb_color = 0xffffff;
> -		system76_set(data, "SKBC", data->kb_color);
> +	if (acpi_has_method(acpi_device_handle(data->acpi_dev), "GKBK")) {
> +		// Use the new ACPI methods
> +		data->kbled_type = system76_get(data, "GKBK");
> +
> +		switch (data->kbled_type) {
> +		case KBLED_NONE:
> +			data->kb_led.max_brightness = 0;
> +			data->kb_color = -1;
> +			break;

In this case you don't want to call the devm_led_classdev_register()
below, so perhaps do an early return from the function here ?

> +		case KBLED_WHITE:
> +			data->kb_led.name = "system76_acpi::kbd_backlight";
> +			data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
> +			data->kb_led.brightness_get = kb_led_get;
> +			data->kb_led.brightness_set_blocking = kb_led_set;
> +			data->kb_led.max_brightness = 255;
> +			data->kb_toggle_brightness = 72;
> +			data->kb_color = 0xffffff;

I don't think that setting kb_color for the non color keyboard
makes sense ? Note the old code uses -1 as color for the non RGB
backlight case.

> +			break;
> +		case KBLED_RGB:
> +			data->kb_led.name = "system76_acpi::kbd_backlight";
> +			data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
> +			data->kb_led.brightness_get = kb_led_get;
> +			data->kb_led.brightness_set_blocking = kb_led_set;
> +			data->kb_led.max_brightness = 255;
> +			data->kb_led.groups = system76_kb_led_color_groups;
> +			data->kb_toggle_brightness = 72;
> +			data->kb_color = 0xffffff;
> +			system76_set(data, "SKBC", data->kb_color);
> +			break;
> +		}
>  	} else {
> -		data->kb_led.max_brightness = 5;
> -		data->kb_color = -1;
> +		// Use the old ACPI methods
> +		data->kb_led.name = "system76_acpi::kbd_backlight";
> +		data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
> +		data->kb_led.brightness_get = kb_led_get;
> +		data->kb_led.brightness_set_blocking = kb_led_set;
> +		if (acpi_has_method(acpi_device_handle(data->acpi_dev), "SKBC")) {
> +			data->kb_led.max_brightness = 255;
> +			data->kb_led.groups = system76_kb_led_color_groups;
> +			data->kb_toggle_brightness = 72;
> +			data->kb_color = 0xffffff;
> +			system76_set(data, "SKBC", data->kb_color);
> +		} else {
> +			data->kb_led.max_brightness = 5;
> +			data->kb_color = -1;

Same remark, is it necesssary to set kb_color here at all ?

Regards,

Hans



> +		}
>  	}
> +
>  	err = devm_led_classdev_register(&acpi_dev->dev, &data->kb_led);
>  	if (err)
>  		return err;

