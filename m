Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3932C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  6 Feb 2022 19:23:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233543AbiBFTXC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 6 Feb 2022 14:23:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbiBFTXB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Feb 2022 14:23:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 83EB5C06173B
        for <platform-driver-x86@vger.kernel.org>; Sun,  6 Feb 2022 11:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644175377;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VI2JJdvjtTojRxMn12pahngT3MqdoyAfkWxdme4CmxM=;
        b=ISheUAuvhN031T3q/9X3V0OYdTla8CdormKIlvPbbb9Mf4eYA4dt3CZLVj0wzA/p/PWWje
        mTe1PNWUZo9hQTKtow3iN6TWLPAOz/nuT9eAttWxbVO6e/zJQCP5EFNXeHNCa/A+EcNrpf
        L3b1DSOAPcQJ/p/wFxuyevLr9UeubQ0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-rAKOvl5UMNGaSNaZ16LECQ-1; Sun, 06 Feb 2022 14:22:56 -0500
X-MC-Unique: rAKOvl5UMNGaSNaZ16LECQ-1
Received: by mail-ed1-f69.google.com with SMTP id n8-20020a50cc48000000b0040f345d624aso2255027edi.6
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Feb 2022 11:22:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VI2JJdvjtTojRxMn12pahngT3MqdoyAfkWxdme4CmxM=;
        b=3Zo/DmNFqaPLIbk+zH57hw6vgBIALvlzAf8xtq16mYxVu2Hg+G/fe/an0Eag1P4/Tg
         5oevcZn9mVZq0tUqFkSlIOD9nIK9RsXG+joorQCscJ0FTto7/iIeH0sk4hEsxKHH5ixt
         QsAAcnXbx24/XgXdG0DzJfGtYKSlBjPuEDaAZL1SLPov2uJn96Ks3GnSSQY/KlEk0XAu
         QH4Y3qGkiiZJo2zirqnXm2pavBVIEjnwUszmccKk8h6qS/EBGWVCsXApy/rKm++6/9Uj
         RXTAS3xKvy6gh/Hr2HZ2/KkDpXOYl+Iws9F4CnH45+oButZqkbR/QHzo1QAISMLjNxUH
         hJww==
X-Gm-Message-State: AOAM531o613M1W8DTBbzgN6oEetMeLQ/nIqzAAJAJyplB6QahuK2gVzn
        wCCN2lb4xCMiR1Ef5FrD5SHjaQRn2sSvaoGhEEGRZkoOY2ghwoscjtlXGr198t5t/V8TXpGT/dy
        J+Uj5R7rYRI41qDXNZ0F8eXiMzNKERdH6cg==
X-Received: by 2002:a17:907:7f92:: with SMTP id qk18mr7097627ejc.766.1644175374980;
        Sun, 06 Feb 2022 11:22:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQqRve1LgWZuWeei1PDExjWxzNPJOvvzc0FcmcVCMmYFNG8GWNmPDiC3Q/vXNe034+agxL0w==
X-Received: by 2002:a17:907:7f92:: with SMTP id qk18mr7097616ejc.766.1644175374799;
        Sun, 06 Feb 2022 11:22:54 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id n2sm2975858ejl.55.2022.02.06.11.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Feb 2022 11:22:54 -0800 (PST)
Message-ID: <64953b75-3dfe-bc0a-6f3b-58b2329c5a1a@redhat.com>
Date:   Sun, 6 Feb 2022 20:22:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/6] platform/x86: x86-android-tablets: Add lid-switch
 gpio-keys pdev to Asus ME176C + TF103C
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20220205191356.225505-1-hdegoede@redhat.com>
 <20220205191356.225505-4-hdegoede@redhat.com>
 <CAHp75VcBNentfYMymyCnCav-NGK+DrDzTG3Mf973ERXpyvT2uQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcBNentfYMymyCnCav-NGK+DrDzTG3Mf973ERXpyvT2uQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/5/22 21:40, Andy Shevchenko wrote:
> On Sat, Feb 5, 2022 at 9:14 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The Asus ME176C + TF103C both have a lid-switch (for a cover in the ME176C
>> case), add a gpio-keys platform-device and platform-data describing the
>> lid-switch on both.
> 
> USB ID change is not described here.

There is no USB-ID change, the

-       .pdev_info = int3496_pdevs,
-       .pdev_count = ARRAY_SIZE(int3496_pdevs),

members of struct x86_dev_info used to point to int3496_pdevs which
is a generic pdev array with just the single:

/* Generic pdevs array and gpio-lookups for micro USB ID pin handling */
static const struct platform_device_info int3496_pdevs[] __initconst = {
        {
                /* For micro USB ID pin handling */
                .name = "intel-int3496",
                .id = PLATFORM_DEVID_NONE,
        },
};

entry in there.

Since adding lid_switch support involves adding a second pdev,
the contents of the generic int3496_pdevs now gets duplicated into
the new pdevs array which adds the lid gpio_keys pdev:

static const struct platform_device_info asus_me176c_tf103c_pdevs[] __initconst = {
        {
                .name = "gpio-keys",
                .id = PLATFORM_DEVID_AUTO,
                .data = &asus_me176c_tf103c_lid_pdata,
                .size_data = sizeof(asus_me176c_tf103c_lid_pdata),
        },
        {
                /* For micro USB ID pin handling */
                .name = "intel-int3496",
                .id = PLATFORM_DEVID_NONE,
        },
};

So only the "gpio-keys" pdev is new, the other one just needs to be duplicated
because pdev_info now points to the new asus_me176c_tf103c_pdevs array:

+       .pdev_info = asus_me176c_tf103c_pdevs,
+       .pdev_count = ARRAY_SIZE(asus_me176c_tf103c_pdevs),

And without the duplication the dropping of the reference to the old array
would cause the "intel-int3496" pdev to go away. So what looks like an
extra change actually is there to avoid changing behavior.

> ...
> 
>  +/* Asus ME176C and TF103C tablets shared data */
>> +static struct gpio_keys_button asus_me176c_tf103c_lid = {
>> +       .code = SW_LID,
> 
>> +       /* .gpio gets filled in by asus_me176c_tf103c_init() */
> 
> I'm wondering if we can switch gpio_keys*.c drivers to accept GPIO
> descriptor directly.

The current gpio_keys_platform_data struct which expects an
old style gpio integer number is used in a ton of places:

drivers/platform/surface/surface3_button.c
drivers/platform/x86/meraki-mx100.c
drivers/platform/x86/barco-p50-gpio.c
drivers/platform/x86/pcengines-apuv2.c
drivers/platform/x86/x86-android-tablets.c
drivers/mfd/rohm-bd718x7.c
drivers/mfd/rohm-bd71828.c
drivers/mfd/ucb1x00-assabet.c
drivers/input/keyboard/gpio_keys_polled.c
drivers/input/keyboard/gpio_keys.c
drivers/input/misc/soc_button_array.c
arch/x86/platform/geode/net5501.c
arch/x86/platform/geode/alix.c
arch/x86/platform/geode/geos.c
arch/sh/boards/mach-x3proto/setup.c
arch/sh/boards/mach-rsk/devices-rsk7203.c
arch/arm/mach-sa1100/h3xxx.c
arch/arm/mach-sa1100/collie.c
arch/arm/mach-sa1100/assabet.c
arch/arm/mach-sa1100/simpad.c
arch/arm/mach-omap1/board-htcherald.c
arch/arm/mach-orion5x/ls_hgl-setup.c
arch/arm/mach-orion5x/dns323-setup.c
arch/arm/mach-orion5x/net2big-setup.c
arch/arm/mach-orion5x/ts409-setup.c
arch/arm/mach-orion5x/ts209-setup.c
arch/arm/mach-orion5x/mv2120-setup.c
arch/arm/mach-orion5x/wrt350n-v2-setup.c
arch/arm/mach-s3c/mach-h1940.c
arch/arm/mach-s3c/mach-rx1950.c
arch/arm/mach-s3c/mach-mini2440.c
arch/arm/mach-s3c/mach-gta02.c
arch/arm/mach-s3c/mach-n30.c
arch/arm/mach-s3c/mach-smartq7.c
arch/arm/mach-s3c/mach-smartq5.c
arch/arm/mach-s3c/mach-crag6410.c
arch/arm/mach-pxa/hx4700.c
arch/arm/mach-pxa/palmld.c
arch/arm/mach-pxa/tosa.c
arch/arm/mach-pxa/palmt5.c
arch/arm/mach-pxa/magician.c
arch/arm/mach-pxa/csb701.c
arch/arm/mach-pxa/vpac270.c
arch/arm/mach-pxa/z2.c
arch/arm/mach-pxa/palmtx.c
arch/arm/mach-pxa/palmte2.c
arch/arm/mach-pxa/corgi.c
arch/arm/mach-pxa/palmtc.c
arch/arm/mach-pxa/mioa701.c
arch/arm/mach-pxa/spitz.c
arch/arm/mach-pxa/ezx.c
arch/arm/mach-pxa/mainstone.c
arch/arm/mach-davinci/board-da850-evm.c
arch/mips/bcm47xx/buttons.c
arch/mips/alchemy/board-mtx1.c
arch/mips/alchemy/devboards/db1300.c

So changing this is going to be a lot of work, it certainly is
out of scope for this patch-set.

Regards,

Hans

