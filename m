Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D584BE810A4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Sep 2023 08:39:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjI0IjC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Sep 2023 04:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbjI0IjA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2023 04:39:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F43C0
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 01:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695803892;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oFBFk293L3WpA/SF5GLh0iya0M5nZqt8LWn5s306O2o=;
        b=EKHdtYPRureqJduIGY9ufxO3zyAB2acAklipUj65F+JpDLs/Gvq12lAtWeYv19QvMh5W/X
        931oV5o2mNU3MZ3C9CtrlNWOZ9NxBTtwVz3vdXAyFhPVDiE6o3OWSg3kjBJ7Ft4W7ueOR2
        76yZPOX9DXSSRteGaZ0GgBD9wcykUDw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-PNMbA0hXPjObAhuoEVWI4w-1; Wed, 27 Sep 2023 04:38:11 -0400
X-MC-Unique: PNMbA0hXPjObAhuoEVWI4w-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-53498ce5aceso608221a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 01:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695803890; x=1696408690;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFBFk293L3WpA/SF5GLh0iya0M5nZqt8LWn5s306O2o=;
        b=a8eArTUwAs8WAMHhepa4LMMEeY1h8uX2hRF+aNt4xMQ/RhcXNRYFpgG569p2WL7ZH0
         QCaMb44G1fjGLCPSGWX1WNGo3o6mrrlMN18K1FYAplAyGZDxxRC0GU1jVkiDqIbunB34
         FGezd2+dCYeppRqeZLTVo68Xg8D7Fvcs+yYsWInGN67Tae415On1xEBVErrh76kJuyId
         zdq9bKSctkCCNCwaetaheD961/a5TM5VxU6V5r/hmqd/FZenDEcEcCVZibm36Oibf082
         VyFJfZNER6K48yTidvRdgDjehmb7ywB/lRTrwJ/0ZTCRh2/Rri4037PtnctamqmZZSQr
         5SWg==
X-Gm-Message-State: AOJu0YzSTCeCn9K5q5+yjUNqnJTFPXjo8lSmx04pAQ+khlWvr5OsRwoS
        VDG/h/NgdXvPp0EKJMU65gHoUR2PTpQH2sojuanujovxKWlNHqCFd/O8hKyM7ySoqep6Odlr+MO
        +LUqSxhfGaM9tpLZ5IXhNUD7NGy9HGc85kQ==
X-Received: by 2002:a05:6402:6da:b0:530:9fbc:8df5 with SMTP id n26-20020a05640206da00b005309fbc8df5mr1352490edy.9.1695803889952;
        Wed, 27 Sep 2023 01:38:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaAq1i5bLDH0/vOkJlIJOevgIvVaw73om6syxk8ocMxZ0l92s3G7QXYUlLWnJSKN24ep4wYA==
X-Received: by 2002:a05:6402:6da:b0:530:9fbc:8df5 with SMTP id n26-20020a05640206da00b005309fbc8df5mr1352472edy.9.1695803889612;
        Wed, 27 Sep 2023 01:38:09 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.155.235])
        by smtp.gmail.com with ESMTPSA id x62-20020a50bac4000000b0053443c8fd90sm2645885ede.24.2023.09.27.01.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 01:38:08 -0700 (PDT)
Message-ID: <ffb5b1a8-a4fa-f794-afc8-52eed4420a5c@redhat.com>
Date:   Wed, 27 Sep 2023 10:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFT PATCH 0/4] platform/x86: int3472: don't use
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230926145943.42814-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Bartosz,

On 9/26/23 16:59, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> gpiod_toggle_active_low() is a badly designed API that should have never
> been used elsewhere then in the MMC code. And even there we should find
> a better solution.
> 
> Replace the uses of it in the int3472 driver with the good old temporary
> lookup table trick. This is not very pretty either but it's the lesser
> evil.

I saw your previous proposal which added a new api to directly set
the active_low flag, rather then toggle it.

I intended to reply to that thread to say that I liked that approach,
but I don't remember if I actually did reply.

I wonder what made you abandon the new function to directly set
the active-low flag on a gpio_desc?

For the int3472 code that would work pretty well and it would
be much cleaner then the temp gpio-lookup approach.

Regards,

Hans



> 
> Bartosz Golaszewski (4):
>   platform/x86: int3472: provide a helper for getting GPIOs from lookups
>   platform/x86: int3472: led: don't use gpiod_toggle_active_low()
>   platform/x86: int3472: clk_and_regulator: use GPIO lookup tables
>   gpio: acpi: remove acpi_get_and_request_gpiod()
> 
>  drivers/gpio/gpiolib-acpi.c                   | 28 ------------------
>  .../x86/intel/int3472/clk_and_regulator.c     | 22 ++++++--------
>  drivers/platform/x86/intel/int3472/common.c   | 29 +++++++++++++++++++
>  drivers/platform/x86/intel/int3472/common.h   |  9 ++++++
>  drivers/platform/x86/intel/int3472/led.c      | 12 +++-----
>  include/linux/gpio/consumer.h                 |  8 -----
>  6 files changed, 51 insertions(+), 57 deletions(-)
> 

