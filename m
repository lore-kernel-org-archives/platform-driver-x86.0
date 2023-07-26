Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C37C001DE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 09:06:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbjGZJGm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 05:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbjGZJE4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 05:04:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60062720
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 02:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690362049;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TiaNoGDG10JKkqQfPFpaYK5witKD3uWAX3L2Pe50qEU=;
        b=cZ0OZExg7zdi5psE67UEhyy4fsthBZsFlmx6xsPjKJuvl7bIMZHXwGxhBV27iK5aKVsBXo
        eOWaiSleW8wqBll2OqBqwW876kfuH6EgkrEJzqwpUyNbm/VR4gSHFKHtcX+IDCc2YF45G+
        BdMToI3nVQrDUFJCRrCy9Nhb6JRzgH4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-AmRKX8b9NhaXa-bydjRFzw-1; Wed, 26 Jul 2023 05:00:47 -0400
X-MC-Unique: AmRKX8b9NhaXa-bydjRFzw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99bb70a4b28so74357366b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 02:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690362046; x=1690966846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TiaNoGDG10JKkqQfPFpaYK5witKD3uWAX3L2Pe50qEU=;
        b=RV1+B4THdi+CBbjQ6AIAQYIrGuFst3r8oQuN2qLm21DTtCUhtzT5DSr2eS9iGIJDjR
         o/lm6xDquAF/wqH4+HvCFzF/XKlmjNZD10AqlQSWkuIW63/K0zQ/+AWnbKjjwtlkblDD
         5Wq2gV6qIqw5tBiIBuEc67qlbRuDza+lHORVoYdkNRdteLE8o3trMO7cO3xtLB0okuqV
         VTtT0nGP5VWDHYwULBv/8Tdhal47u8OhP76YvyYw6pshZqXH1PUxFzHjXNcSPB4/kPLq
         LBZQkIN+NUNFgi+upfzza4EZZ9vK58z1jlwn1lyx7wRpiO392JJJS9EuZ+BmfHnb5feQ
         opyw==
X-Gm-Message-State: ABy/qLavN2mxNyrwu2LmoWrRo2hgTgK43ZDBe/MJhHh1CSS8YiJqnJT3
        vbONvVuytVt+qoDuwXXM4DogfpsYMZQ66kaaSLtAucKn/aLZ/21zjwcIJW443+J+PgAZXh3NxTm
        bB/pOtgMQoMfpMmc4VhkGqaEIwH9UlNjuaDQ7Nou+eA==
X-Received: by 2002:a17:906:292:b0:992:a838:a564 with SMTP id 18-20020a170906029200b00992a838a564mr1185827ejf.28.1690362045763;
        Wed, 26 Jul 2023 02:00:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG4c3dsce5aa+v0p1Z/i9pFuBdR/RMlKFiv28gosfKvFL9HuTKlxrlqGr6J8RzunbDteX6qMg==
X-Received: by 2002:a17:906:292:b0:992:a838:a564 with SMTP id 18-20020a170906029200b00992a838a564mr1185811ejf.28.1690362045455;
        Wed, 26 Jul 2023 02:00:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v27-20020a170906339b00b00985ed2f1584sm9398890eja.187.2023.07.26.02.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 02:00:44 -0700 (PDT)
Message-ID: <a6fab978-ec73-0b9a-2d0f-87fb2cabebc9@redhat.com>
Date:   Wed, 26 Jul 2023 11:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] platform/x86: system76: Handle new KBLED ACPI methods
Content-Language: en-US, nl
To:     Tim Crawford <tcrawford@system76.com>,
        platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
References: <20230719181324.47035-1-tcrawford@system76.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230719181324.47035-1-tcrawford@system76.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/19/23 20:13, Tim Crawford wrote:
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

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
>  drivers/platform/x86/system76_acpi.c | 74 ++++++++++++++++++++++------
>  1 file changed, 59 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
> index fc4708fa6ebe..3da753b3d00d 100644
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
> @@ -459,8 +475,9 @@ static void kb_led_hotkey_color(struct system76_data *data)
>  {
>  	int i;
>  
> -	if (data->kb_color < 0)
> +	if (data->kbled_type != KBLED_RGB)
>  		return;
> +
>  	if (data->kb_brightness > 0) {
>  		for (i = 0; i < ARRAY_SIZE(kb_colors); i++) {
>  			if (kb_colors[i] == data->kb_color)
> @@ -687,19 +704,46 @@ static int system76_add(struct acpi_device *acpi_dev)
>  	data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
>  	data->kb_led.brightness_get = kb_led_get;
>  	data->kb_led.brightness_set_blocking = kb_led_set;
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
> +			// Nothing to do: Device will not be registered.
> +			break;
> +		case KBLED_WHITE:
> +			data->kb_led.max_brightness = 255;
> +			data->kb_toggle_brightness = 72;
> +			break;
> +		case KBLED_RGB:
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
> +		if (acpi_has_method(acpi_device_handle(data->acpi_dev), "SKBC")) {
> +			data->kbled_type = KBLED_RGB;
> +			data->kb_led.max_brightness = 255;
> +			data->kb_led.groups = system76_kb_led_color_groups;
> +			data->kb_toggle_brightness = 72;
> +			data->kb_color = 0xffffff;
> +			system76_set(data, "SKBC", data->kb_color);
> +		} else {
> +			data->kbled_type = KBLED_WHITE;
> +			data->kb_led.max_brightness = 5;
> +		}
> +	}
> +
> +	if (data->kbled_type != KBLED_NONE) {
> +		err = devm_led_classdev_register(&acpi_dev->dev, &data->kb_led);
> +		if (err)
> +			return err;
>  	}
> -	err = devm_led_classdev_register(&acpi_dev->dev, &data->kb_led);
> -	if (err)
> -		return err;
>  
>  	data->input = devm_input_allocate_device(&acpi_dev->dev);
>  	if (!data->input)

