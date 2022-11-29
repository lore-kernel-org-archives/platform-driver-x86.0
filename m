Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E44C4321E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Nov 2022 11:28:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbiK2L2z (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Nov 2022 06:28:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232990AbiK2L2x (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Nov 2022 06:28:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D3DF55
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Nov 2022 03:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669721266;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JNeN8GPpJrHlbWssIOBz2DcHNIKoFYFW+IzzrdE30Ic=;
        b=MJxnnySuxsDH9xy4vse0nyAJFTgBQB0WHcYc9IiiYaKzOSicEgeKwCcTz4FiuzHBBmAvgo
        v3yCVIaWqOAvQX9qTQbKdZyjpKe+GlnUbPf88lBEhz2c8Y1NoyR4PWCcY4jJroln63ZL4v
        patBwCDwi7Fr1MHCGku6e1eY+tBvWMA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-290-EPf0U0-7P2ihf2Vr2eXhjQ-1; Tue, 29 Nov 2022 06:27:44 -0500
X-MC-Unique: EPf0U0-7P2ihf2Vr2eXhjQ-1
Received: by mail-ed1-f71.google.com with SMTP id w22-20020a056402269600b0046b00a9ee5fso4146191edd.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Nov 2022 03:27:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNeN8GPpJrHlbWssIOBz2DcHNIKoFYFW+IzzrdE30Ic=;
        b=mvMScQlup8/HcTKpEdM8iA9Yqj5kvmasGfxdMmLmYBXmlYq4xDFrtANsEO3qewHTJC
         4RScDvAtj/S4zJbB3Hs6Qio9PsX+pXMxKQJHTzO7oKeZSrvazyD1N7bRwqg2XMtNboHz
         l6wkG9sG664VS3DYrjDzGNWKHK4BCpAsNBUkwyDZxS3cVxv387dp4UdA9INaSYNCKVAO
         uTKfQ8V1kWcgYgNcDYFx8yDVZBaT4gYiI2Uq0URjbnA3fuJBf9O0nsQTugkthUZD9uN6
         jkZMyUWgNXol+WV5Pb3PRR7jrecMlC7vraVAuCxdl4JkYzy4N/F1HRIsJQOb9R+n76yK
         0J0Q==
X-Gm-Message-State: ANoB5plRepTfuwFXNwvEQqszmrxJc3DW43zJps3jhv9zsHGR/L+GpJOm
        0UhK/8zM9/VwPisE2FwtcDX8bDnHEijAUx7V8QufoUKqlXXLmKQODt+3wIBPlDE3qKcvyoWT+QY
        uFwYGIGC+pZIsA1FQB8wDOkBTSDkGIuUyLQ==
X-Received: by 2002:a05:6402:2488:b0:467:3ea1:acdd with SMTP id q8-20020a056402248800b004673ea1acddmr52740584eda.96.1669721262539;
        Tue, 29 Nov 2022 03:27:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf40Atovb0T/uPocwF34I4V7PN+Lzr4d20b7/Ii4B2B97qox/i3YuuKF9f/Z0Ewh2ohVjnBEBg==
X-Received: by 2002:a05:6402:2488:b0:467:3ea1:acdd with SMTP id q8-20020a056402248800b004673ea1acddmr52740565eda.96.1669721262322;
        Tue, 29 Nov 2022 03:27:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id v3-20020a056402174300b004691de0e25bsm6171213edx.54.2022.11.29.03.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 03:27:41 -0800 (PST)
Message-ID: <9a4336d1-3222-fe50-f234-93ab175d606a@redhat.com>
Date:   Tue, 29 Nov 2022 12:27:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/5] gpio: tps68470: Fix tps68470_gpio_get() reading from
 the wrong register
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221128214408.165726-1-hdegoede@redhat.com>
 <20221128214408.165726-2-hdegoede@redhat.com>
 <CAHp75VcXfh46z4m+R4bDTZbcWrqEmebzg-2gT_P+2uAYTNPoYQ@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcXfh46z4m+R4bDTZbcWrqEmebzg-2gT_P+2uAYTNPoYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/29/22 11:22, Andy Shevchenko wrote:
> On Mon, Nov 28, 2022 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> For the regular GPIO pins the value should be read from TPS68470_REG_GPDI,
>> so that the actual value of the pin is read, rather then the value the pin
> 
> than

Ack.

>> would output when put in output mode.
> 
> I don't see it here and haven't checked the context, but the idea is
> to check the direction and return either input (if pin is in input
> mode) or [cached] output.If it's the case, the patch looks good to me.

No the idea is to always actually use the input register when reading
the pins, independent of the input/output mode. Instead of always
reading the [cached] output register value.

The input buffer will still work when the device is in output mode
and if somehow an external force is pushing the pin low/high against
the output value then the input buffer will correctly reflect this
(assuming the output is current limited and thus the magic smoke
stays inside the chip).

Regards,

Hans



> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpio/gpio-tps68470.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
>> index aaddcabe9b35..778a72cf800c 100644
>> --- a/drivers/gpio/gpio-tps68470.c
>> +++ b/drivers/gpio/gpio-tps68470.c
>> @@ -30,7 +30,7 @@ static int tps68470_gpio_get(struct gpio_chip *gc, unsigned int offset)
>>  {
>>         struct tps68470_gpio_data *tps68470_gpio = gpiochip_get_data(gc);
>>         struct regmap *regmap = tps68470_gpio->tps68470_regmap;
>> -       unsigned int reg = TPS68470_REG_GPDO;
>> +       unsigned int reg = TPS68470_REG_GPDI;
>>         int val, ret;
>>
>>         if (offset >= TPS68470_N_REGULAR_GPIO) {
>> --
>> 2.38.1
>>
> 
> 

