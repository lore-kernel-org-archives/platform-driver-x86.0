Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0457C0015E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Jul 2023 13:39:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbjGYNjL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Jul 2023 09:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbjGYNjK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Jul 2023 09:39:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35EAF1FFA
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 06:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690292299;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GDA1yKftH08WsPDZOktAV1knliMhfS8uSGdD/fN0U2I=;
        b=NpSeCCwECNCipiuC+zNtZ5yoMI7JMugDa4H9eCGFEve6ZKbJWtoSI47l/wHFKEBr8qGhbz
        1gJRZOAmwaUcl88txZ6XOqfbdHqYP1Qm4x+CV4hmrOt44Rjd1kPUcPZCyMFvHpB6c4agWK
        1ELYm0FzdBOB1x76n4dl/SUiECrvDNg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-D7O4n9d_N9mqxKGP2bkBBw-1; Tue, 25 Jul 2023 09:38:17 -0400
X-MC-Unique: D7O4n9d_N9mqxKGP2bkBBw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-98df34aa83aso288633966b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 06:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690292296; x=1690897096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GDA1yKftH08WsPDZOktAV1knliMhfS8uSGdD/fN0U2I=;
        b=Ku88wtHkieTr4BBvFZa+/tI787dHJHSEun0/DdmZWadTjsRhRpZ0wUzNKXzh+JE5+u
         rdYO4ij+OXGacb8IsCcp89cFVFmPqljZHVSs+E7OXpwFTfuM/l9NUZJUCuAS9R5krS55
         voynRGMzdcTCLxhb8ziL5Vf9WY1C3BfIfMLULHzYTZldi+N2Qo7XN2MVEV5mTxpNhA8B
         Wqq3Pl7pSH1jxZtf9IXH2jRtJDKItAmKN18h0SMx/luZh25eiAET1zltWHmazIgv8iOV
         267bFMvdS7Mf43T5XVECc2kLM/zHspMBTzGQvQyNicxixWtzwsZzMCEMvRnTLAtvkWKt
         e7/w==
X-Gm-Message-State: ABy/qLbMiIogZksk5Zp+rLy/ag7moO0IZjbZJ9UeBY9BgB5zhK3a1O7F
        XdckxJzgWUENB8fg+8ZTzj6YVVo8C5UIXPPWFqveY4kabuBOv2eLV2DXktp5rAFkxoZJo6tgeHU
        7DnlLO6f4pIRP08tamlf2q+w1qbXpmRes+g==
X-Received: by 2002:a17:906:3018:b0:98e:1a0c:12c0 with SMTP id 24-20020a170906301800b0098e1a0c12c0mr2444604ejz.7.1690292295867;
        Tue, 25 Jul 2023 06:38:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHBasUqJpnc3ZlBTKN8R96ngi4PkVd4C1CPjHTYCHJ94IAQI5E+SZqvMtT91Fw+JYghefHInw==
X-Received: by 2002:a17:906:3018:b0:98e:1a0c:12c0 with SMTP id 24-20020a170906301800b0098e1a0c12c0mr2444589ejz.7.1690292295580;
        Tue, 25 Jul 2023 06:38:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906130800b00992b510089asm8259927ejb.84.2023.07.25.06.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 06:38:15 -0700 (PDT)
Message-ID: <6ee963fb-e17c-e7f4-6772-d536ee571f9d@redhat.com>
Date:   Tue, 25 Jul 2023 15:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
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

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

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

