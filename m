Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753CEE810B2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Sep 2023 09:41:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjI0Jlv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Sep 2023 05:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbjI0Jlh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2023 05:41:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 118ACE6
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695807648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/i4A81R1SOe5sMSZk1FkdVOSrAXx6uhn5C/e/5JfxKw=;
        b=ASAgiM07qlWCCy7TqEZ0NSsi0nABZSFvYVjitVOXkK+hVs3Rc497nDFhlJWIcAk3NaI33X
        lt4wY1KAr8CwWZLQoLANZ9qNHgzkYXLe1FUsFyVsoUMWDYnWKzX+dxuuABNlNyVXxqeMw+
        7MQy13WYSe7dsJNkFOpZdBDodhdMf14=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-zTxqWwITOvWWYBVKqShZEQ-1; Wed, 27 Sep 2023 05:40:46 -0400
X-MC-Unique: zTxqWwITOvWWYBVKqShZEQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5042bc93273so15403203e87.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 02:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695807645; x=1696412445;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/i4A81R1SOe5sMSZk1FkdVOSrAXx6uhn5C/e/5JfxKw=;
        b=A/JYHPnq9GcHx+It3qt8l5r1Ye2MALnEeschoSV7/pDY6bn1OWXmBPb/g4CLfuWl/v
         2jRjOi/Pik0eiwMYG0WpHNl7IYIfZtxvxTd/4sRctkB/QrMLKpALhRNl+4pitFWUyHGN
         jsjCm2CnHmlKllScbZI39Mfg0boTSkI8KdOdDSZFyoU3LjKrWiaoim0QNquK6GJjyuWY
         7nUIzdiQxiF0pMDgXyMwyTCG0P1KcL+9SxfTmzJE56zjktGflf+IPhp2rwBnM23v9sou
         Uu547Z9k/3hqp/czIKInQAhN6+XB35Tq3rqdfv9zhkpfLfoPGC9Vcc/sXU1QRr7vjK3L
         wNDw==
X-Gm-Message-State: AOJu0Yxo6rlv2III51eFUfnJL8tRQ6gEWWSxm2dWGPf6gVXQjdqp7/6r
        Dnb2CxBQcMneSgVsRsUeyU2bOIZMP57Yed9jIT1+tKfWq/I9a+FANIpN0Hc7k7rRM9979GO7uOP
        w1jTcn9TMzKuwkjdOPF0ku4Cqk1abcOSl1w==
X-Received: by 2002:ac2:4a8d:0:b0:500:a408:dbd with SMTP id l13-20020ac24a8d000000b00500a4080dbdmr1059001lfp.55.1695807644988;
        Wed, 27 Sep 2023 02:40:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjUVW20BZuFqVbLrrWpnov4PyrKwKTzDVOzlxaGka/uXwcB7ZIQIvSuGMN2Dj3juaFboTdSQ==
X-Received: by 2002:ac2:4a8d:0:b0:500:a408:dbd with SMTP id l13-20020ac24a8d000000b00500a4080dbdmr1058967lfp.55.1695807644119;
        Wed, 27 Sep 2023 02:40:44 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.155.235])
        by smtp.gmail.com with ESMTPSA id r16-20020aa7cfd0000000b00530aae2d5bfsm7965154edy.9.2023.09.27.02.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 02:40:43 -0700 (PDT)
Message-ID: <2b5db794-c00f-e9f5-c0c9-4c5fb4df0802@redhat.com>
Date:   Wed, 27 Sep 2023 11:40:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFT PATCH 2/4] platform/x86: int3472: led: don't use
 gpiod_toggle_active_low()
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230926145943.42814-1-brgl@bgdev.pl>
 <20230926145943.42814-3-brgl@bgdev.pl>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230926145943.42814-3-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/26/23 16:59, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Instead of acpi_get_and_request_gpiod() + gpiod_toggle_active_low(), use
> temporary lookup tables with appropriate lookup flags.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/platform/x86/intel/int3472/led.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
> index bca1ce7d0d0c..62e0cd5207a7 100644
> --- a/drivers/platform/x86/intel/int3472/led.c
> +++ b/drivers/platform/x86/intel/int3472/led.c
> @@ -25,18 +25,14 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472,
>  	if (int3472->pled.classdev.dev)
>  		return -EBUSY;
>  
> -	int3472->pled.gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
> -							     "int3472,privacy-led");
> +	int3472->pled.gpio = skl_int3472_gpiod_get_from_temp_lookup(
> +				int3472->dev, path, agpio->pin_table[0],
> +				"int3472,privacy-led", polarity,
> +				GPIOD_OUT_LOW);

Yeah so this is not going to work, path here is an ACPI device path, e.g.
on my laptop (which actually uses the INT3472 glue code) the path-s of
the 2 GPIO controllers are: `\_SB_.GPI0` resp `\_SB_.PC00.XHCI.RHUB.HS08.VGPO`

Where as skl_int3472_gpiod_get_from_temp_lookup() stores the passed in path
in  gpiod_lookup_table.table[0].key, which is the dev_name() of the GPIO
controller's parent dev which are `INTC1055:00` resp. `INTC1096:00` .

So we are going to need to add some code to INT3472 to go from path to
a correct value for gpiod_lookup_table.table[0].key which means partly
reproducing most of acpi_get_gpiod:

        struct gpio_chip *chip;
        acpi_handle handle;
        acpi_status status;

        status = acpi_get_handle(NULL, path, &handle);
        if (ACPI_FAILURE(status))
                return ERR_PTR(-ENODEV);

        chip = gpiochip_find(handle, acpi_gpiochip_find);
        if (!chip)
                return ERR_PTR(-EPROBE_DEFER);

And then get the key from the chip. Which means using gpiochip_find
in the int3472 code now, which does not sound like an improvement.

I think that was is needed instead is adding an active_low flag
to acpi_get_and_request_gpiod() and then have that directly
set the active-low flag on the returned desc.

Regards,

Hans








>  	if (IS_ERR(int3472->pled.gpio))
>  		return dev_err_probe(int3472->dev, PTR_ERR(int3472->pled.gpio),
>  				     "getting privacy LED GPIO\n");
>  
> -	if (polarity == GPIO_ACTIVE_LOW)
> -		gpiod_toggle_active_low(int3472->pled.gpio);
> -
> -	/* Ensure the pin is in output mode and non-active state */
> -	gpiod_direction_output(int3472->pled.gpio, 0);
> -
>  	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
>  	snprintf(int3472->pled.name, sizeof(int3472->pled.name),
>  		 "%s::privacy_led", acpi_dev_name(int3472->sensor));

