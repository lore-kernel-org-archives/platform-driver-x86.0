Return-Path: <SRS0=a5Ee=EJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40D5C388F2
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 10:22:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9498C206F1
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 10:22:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WNliPz5r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbgKCKWJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Nov 2020 05:22:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25822 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727852AbgKCKWJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 05:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604398927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+XR6506nPn8sKTI4vzdlsW0fAk2RS9aQxw0FRMAFP/I=;
        b=WNliPz5rXk2SYYXdvJF9dahDNGsrNzcS+weGbBbB/aG+qehDBCh1YdhzW0hESj5FeRMgcr
        5smW1YcuqY1yXaDSU/nw0rmAX6By4tmka0TW80nM9E1kO3ZejHf5KikjJa7VpXmdzch6Bx
        0W+tne5v/9oP/aNFXIRKm8b5wGQ5mic=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-FxYVn_yxMVWxS5kVIBSxaw-1; Tue, 03 Nov 2020 05:22:03 -0500
X-MC-Unique: FxYVn_yxMVWxS5kVIBSxaw-1
Received: by mail-ej1-f71.google.com with SMTP id p19so5206921ejy.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2020 02:22:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+XR6506nPn8sKTI4vzdlsW0fAk2RS9aQxw0FRMAFP/I=;
        b=Rao8TNTrBHfhRK3g3CJNtnM/n5Mm7nNg0Hfhz6z3fujwN73wD8xW6oImSl7y6vjp/m
         YLeg9cQYE7+FSSU47lXzOsOd931tm8RSfIhtjW2EcPd8Dk7YrN7JpssoWsGYp0XcEo5+
         ovj/DqrED4HckDs3ZqfeaxMSr7in+jp/g1eE2H7bhwcAQbCyivGkt1WUgHh6a2A8TTn4
         JSrusJiHUVrC1buwwqyxz68wQeS02LeJ6uqHLsgkFL2VlKcY0u4SVDoGjd6U5MJHp5DK
         WKQuzUk6Oxs0FtW3dpsOz7enENw4V8mFFXrg8GMRIcTAi5pQhhPvcqztUu2o04LSfOKe
         SXIQ==
X-Gm-Message-State: AOAM533NgYeVdUOr4Dn/e7SXgO1LRgCme3P/DhHdLEnySmOpQUj0uhjd
        A9fflPbFXXs6a0sAJoWPmAzpslgckU6fwwlP9PSswsBMfbvZBVyGzEFOBg03UhU1MZ90L2I7hXz
        ACHmCS0T5WIzPUpDjJ0ySIh3JBIShEnFdgA==
X-Received: by 2002:a17:906:b0d6:: with SMTP id bk22mr19153012ejb.153.1604398922401;
        Tue, 03 Nov 2020 02:22:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfqgkAhBn5aF4g1kP8qOxfrO2hgg83HJ7gVq+LDUDIAF84HmbWErFGEF7Qd7Wh3MJwI+hG3A==
X-Received: by 2002:a17:906:b0d6:: with SMTP id bk22mr19153001ejb.153.1604398922225;
        Tue, 03 Nov 2020 02:22:02 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id pk25sm7526401ejb.16.2020.11.03.02.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 02:22:01 -0800 (PST)
Subject: Re: [PATCH 1/3 v3] x86/platform/geode: Convert net5501 LED to GPIO
 machine descriptor
To:     Linus Walleij <linus.walleij@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andres Salomon <dilinger@queued.net>,
        linux-geode@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20201103000439.325448-1-linus.walleij@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <967ce9e6-0197-c488-2a7d-c7f491d9b361@redhat.com>
Date:   Tue, 3 Nov 2020 11:22:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201103000439.325448-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/3/20 1:04 AM, Linus Walleij wrote:
> This makes the machine look up the LED from a GPIO machine
> descriptor table. The Geode LEDs should be on the CS5535
> companion chip.
> 
> Cc: linux-gpio@vger.kernel.org
> Cc: Andres Salomon <dilinger@queued.net>
> Cc: linux-geode@lists.infradead.org
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: platform-driver-x86@vger.kernel.org
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Linus, in case you did not know yet, I have take over
drivers/platform/x86 maintainership from Andy.

Andy, the MAINTAINERS entry for arch/x86/platform says:

X86 PLATFORM DRIVERS - ARCH
R:      Darren Hart <dvhart@infradead.org>
R:      Andy Shevchenko <andy@infradead.org>
L:      platform-driver-x86@vger.kernel.org
L:      x86@kernel.org
S:      Maintained
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/core
F:      arch/x86/platform

Andy, so I guess that with your Reviewed-by added, these are expected to
get picked up by the tip tree people ?

Linus, it seems that you did not "Cc: x86@kernel.org" which is
listed in MAINTAINERS for these, and is probably necessary to
get these merged through the tip tree.

Note I'm happy to pick these up through:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/

I actually had them in my local review-hans branch before noticing that
that they went to arch/x86/platform. But I've dropped them now as I'm
not sure if merging them through the pdx86 tree is the right thing to do,
the MAINTAINERS file at least suggests things should be done differently.

Linus, if a v4 with "Cc: x86@kernel.org" is necessary you may add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

To the entire series.

Regards,

Hans





> ---
> ChangeLog v2->v3:
> - Rebase on v5.10-rc1
> - Resend
> ChangeLog v1->v2:
> - Drop excess comma after terminator { }
> - Collect Andy's Reviewed-by
> ---
>  arch/x86/platform/geode/net5501.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/platform/geode/net5501.c b/arch/x86/platform/geode/net5501.c
> index 163e1b545517..558384acd777 100644
> --- a/arch/x86/platform/geode/net5501.c
> +++ b/arch/x86/platform/geode/net5501.c
> @@ -20,6 +20,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/input.h>
>  #include <linux/gpio_keys.h>
> +#include <linux/gpio/machine.h>
>  
>  #include <asm/geode.h>
>  
> @@ -55,9 +56,7 @@ static struct platform_device net5501_buttons_dev = {
>  static struct gpio_led net5501_leds[] = {
>  	{
>  		.name = "net5501:1",
> -		.gpio = 6,
>  		.default_trigger = "default-on",
> -		.active_low = 0,
>  	},
>  };
>  
> @@ -66,6 +65,15 @@ static struct gpio_led_platform_data net5501_leds_data = {
>  	.leds = net5501_leds,
>  };
>  
> +static struct gpiod_lookup_table net5501_leds_gpio_table = {
> +	.dev_id = "leds-gpio",
> +	.table = {
> +		/* The Geode GPIOs should be on the CS5535 companion chip */
> +		GPIO_LOOKUP_IDX("cs5535-gpio", 6, NULL, 0, GPIO_ACTIVE_HIGH),
> +		{ }
> +	},
> +};
> +
>  static struct platform_device net5501_leds_dev = {
>  	.name = "leds-gpio",
>  	.id = -1,
> @@ -80,6 +88,7 @@ static struct platform_device *net5501_devs[] __initdata = {
>  static void __init register_net5501(void)
>  {
>  	/* Setup LED control through leds-gpio driver */
> +	gpiod_add_lookup_table(&net5501_leds_gpio_table);
>  	platform_add_devices(net5501_devs, ARRAY_SIZE(net5501_devs));
>  }
>  
> 

