Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C44BE810A2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Sep 2023 08:42:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjI0Il7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Sep 2023 04:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjI0Il6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2023 04:41:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C9C3CC
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 01:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695804071;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dRjpHatXMpLPR28RDuixweakSgTj14YOtfkxYl7i+lQ=;
        b=WVHNUYUC3zrJ0PWKhQuMtQtdTyLhkWdKeco7Bp5JxmtzXg3yDlH24e/WYsgPGTynj4Anag
        ooO7aFfsZZfmTC5zRYbyayjME9jqapknGs54MwrzKm/uPApwPcVnkQ+qagc3PKTJOZX4sy
        ehD+vKDhwLpm+eFOIQZBWWRdmitI68E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-esp0jHH6NguhbR34i8v-IA-1; Wed, 27 Sep 2023 04:41:09 -0400
X-MC-Unique: esp0jHH6NguhbR34i8v-IA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9adad8f306fso888857166b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 01:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804068; x=1696408868;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dRjpHatXMpLPR28RDuixweakSgTj14YOtfkxYl7i+lQ=;
        b=X+qgazkp2lRuQX6UcAj8lz+86JRoeF3UwDOJxA2iAS/fx6xfCq/xidzm0JhwfLX0J9
         RG2YVOAHkR1nQtGLBKj/hCr10i796uMoB05evD+aA6D3WWiePQ0UWq2aeq155X/BaHFY
         8n5vHa1lSB2jTLdjDfSjaS7jnzx/Mgsd4MBsxS8dwQ+qEvGkQSYImOIMG8mIx3My5iyh
         /YWu/JdH9v+IkE8DfmUuX0o1XOLEen+A9n568lmFuTSHI1E0JeGzmjiNNGbo2+HEsPSX
         QuYuNTvTGtE3X9TYitevOntWYEFrP+cIb1/bwQCH8oBF8UL2ssACfyrum9+K6sLHEEZB
         1O5g==
X-Gm-Message-State: AOJu0YwjXOd6KPPM+GruNL/VR/lbOoTyFfV04KshLZ3E3iGsSqH9PRSI
        7igvlYz6UKv3w0POdDIn5ihp5y6UKJ6+6gIAlL0O+bFGYkIN164Pp64BZSxQ7foA05ViTkNRs9v
        K1xEqn4xUdW1b9/DzwQXCdK9yXyInBaYJYA==
X-Received: by 2002:a17:906:d6:b0:9ae:2f33:4ad0 with SMTP id 22-20020a17090600d600b009ae2f334ad0mr1286248eji.71.1695804067909;
        Wed, 27 Sep 2023 01:41:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGe2pqu6JcAU51HEq3OLEnrMnL9FsmxkzqYCWJwkknNkJZo4Yj9H1+Hni85bBZ+QOsKjJLXQ==
X-Received: by 2002:a17:906:d6:b0:9ae:2f33:4ad0 with SMTP id 22-20020a17090600d600b009ae2f334ad0mr1286224eji.71.1695804067504;
        Wed, 27 Sep 2023 01:41:07 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.155.235])
        by smtp.gmail.com with ESMTPSA id vb5-20020a170907d04500b009b299529709sm2262486ejc.132.2023.09.27.01.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 01:41:07 -0700 (PDT)
Message-ID: <5e127422-1e09-816c-d956-d7afd7ed1c6d@redhat.com>
Date:   Wed, 27 Sep 2023 10:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFT PATCH 0/4] platform/x86: int3472: don't use
 gpiod_toggle_active_low()
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
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
 <ffb5b1a8-a4fa-f794-afc8-52eed4420a5c@redhat.com>
In-Reply-To: <ffb5b1a8-a4fa-f794-afc8-52eed4420a5c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/27/23 10:38, Hans de Goede wrote:
> Hi Bartosz,
> 
> On 9/26/23 16:59, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> gpiod_toggle_active_low() is a badly designed API that should have never
>> been used elsewhere then in the MMC code. And even there we should find
>> a better solution.
>>
>> Replace the uses of it in the int3472 driver with the good old temporary
>> lookup table trick. This is not very pretty either but it's the lesser
>> evil.
> 
> I saw your previous proposal which added a new api to directly set
> the active_low flag, rather then toggle it.
> 
> I intended to reply to that thread to say that I liked that approach,
> but I don't remember if I actually did reply.
> 
> I wonder what made you abandon the new function to directly set
> the active-low flag on a gpio_desc?
> 
> For the int3472 code that would work pretty well and it would
> be much cleaner then the temp gpio-lookup approach.

I missed that 4/4 removes acpi_get_and_request_gpiod(),
so I guess that this is not just only about removing gpiod_toggle_active_low()
but also about removing gpiod_toggle_active_low() ?

Regards,

Hans



>>
>> Bartosz Golaszewski (4):
>>   platform/x86: int3472: provide a helper for getting GPIOs from lookups
>>   platform/x86: int3472: led: don't use gpiod_toggle_active_low()
>>   platform/x86: int3472: clk_and_regulator: use GPIO lookup tables
>>   gpio: acpi: remove acpi_get_and_request_gpiod()
>>
>>  drivers/gpio/gpiolib-acpi.c                   | 28 ------------------
>>  .../x86/intel/int3472/clk_and_regulator.c     | 22 ++++++--------
>>  drivers/platform/x86/intel/int3472/common.c   | 29 +++++++++++++++++++
>>  drivers/platform/x86/intel/int3472/common.h   |  9 ++++++
>>  drivers/platform/x86/intel/int3472/led.c      | 12 +++-----
>>  include/linux/gpio/consumer.h                 |  8 -----
>>  6 files changed, 51 insertions(+), 57 deletions(-)
>>

