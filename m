Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA15E810B1
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Sep 2023 09:15:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjI0JPD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Sep 2023 05:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjI0JPA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2023 05:15:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9279EF4
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 02:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695806053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T/bCjD93zGx7k6DS0sd/nFhrwYQMV95Gpv7IoiMJVN0=;
        b=KicycVgGKik6XvnQQ5XFbQdLay1nLpKXKfiuaw8ZkUuDd/JKJ5NXZZCW6eSQXmC0ew1r7M
        6iqAVCtXpVLBSUFcBG740wFngq12dwDILP+uyxlOGKFJgawnpmpqxSxJzMta2J/PvQpOPZ
        Q/GG+qAUTSujqZe1eCJfTABfCLSGK9Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-jX6aeiJpPM6SNkx3jDBbiA-1; Wed, 27 Sep 2023 05:14:11 -0400
X-MC-Unique: jX6aeiJpPM6SNkx3jDBbiA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9ae12311183so910733766b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 02:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695806048; x=1696410848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/bCjD93zGx7k6DS0sd/nFhrwYQMV95Gpv7IoiMJVN0=;
        b=IOhQwfjwOYgD8NGBGq+F7+h6pnqfvFwJIzGp3tPlip2CVPbjadmSXuJ+FkIrCZsWcx
         L5arQnF+6DEJqiUsLykcsk0N0E1FYVfYn4xoTdKZkYLSGV7hlm32VJvaue486f7KeOec
         FC7cqmiW2X8LPb20Z/9CW1L2BcymNPpKZoRc3/cHRgXotFa9HzIs8Znfl09DpaniDhGK
         a0WwZs0cdbbr7mPoQ9V34VQsK2Cq2LnpqrvWX0JO/RB/v49RE7vwWi7xHtQ2CM+dZBnb
         f7SiWtvfaJjHm9lHWlc9w32ZlTWxBXG6RZVdUzuoYlTfLtCj/TJZDs7HQcSoJnll+NHi
         lmcA==
X-Gm-Message-State: AOJu0YyDWGvsJzvWhsSB/7GlXblfN/bXC42O5CYEHhsV9iswEb60HYZH
        9IuEDuXyy2brQRFif1vEnngoL6AgJJfjLaAv+zel03Nmj1jciuPwY7fPAYzGOzPE2zuSjfWO3Ll
        Xa9n3zC4Y/J3oNf1l2Ydu7+NESRpQ5ytFR/aOatJaCw==
X-Received: by 2002:a17:907:1ca1:b0:9a1:bd33:4389 with SMTP id nb33-20020a1709071ca100b009a1bd334389mr1744701ejc.74.1695806048725;
        Wed, 27 Sep 2023 02:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBja2h6H4iNhc0j95Q0ZZoVn1HywvIdObcsejBA4MbQ5G7O+fTuE/uCPp8hyYYFBBIWF65Tg==
X-Received: by 2002:a17:907:1ca1:b0:9a1:bd33:4389 with SMTP id nb33-20020a1709071ca100b009a1bd334389mr1744683ejc.74.1695806048395;
        Wed, 27 Sep 2023 02:14:08 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.155.235])
        by smtp.gmail.com with ESMTPSA id e8-20020a170906374800b009920e9a3a73sm8972076ejc.115.2023.09.27.02.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 02:14:06 -0700 (PDT)
Message-ID: <adf04176-273d-e365-f765-f84c4e4f6a11@redhat.com>
Date:   Wed, 27 Sep 2023 11:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFT PATCH 2/4] platform/x86: int3472: led: don't use
 gpiod_toggle_active_low()
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230926145943.42814-1-brgl@bgdev.pl>
 <20230926145943.42814-3-brgl@bgdev.pl> <ZRL4PYeX21bwCPR0@smile.fi.intel.com>
 <CAMRc=Mf7P4sWdhgTV+jVD8HEVpxbSuGK8JjJb5Q9djCkKUeUcg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMRc=Mf7P4sWdhgTV+jVD8HEVpxbSuGK8JjJb5Q9djCkKUeUcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

HI,

On 9/27/23 09:02, Bartosz Golaszewski wrote:
> On Tue, Sep 26, 2023 at 5:27 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>>
>> On Tue, Sep 26, 2023 at 04:59:41PM +0200, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Instead of acpi_get_and_request_gpiod() + gpiod_toggle_active_low(), use
>>> temporary lookup tables with appropriate lookup flags.
>>
>> ...
>>
>>> +     int3472->pled.gpio = skl_int3472_gpiod_get_from_temp_lookup(
>>> +                             int3472->dev, path, agpio->pin_table[0],
>>> +                             "int3472,privacy-led", polarity,
>>> +                             GPIOD_OUT_LOW);
>>
>> Personally I found this style weird. I prefer to have longer line over
>> the split on the parentheses.
>>
> 
> I in turn prefer this one. Checkpatch doesn't complain either way so
> I'll leave it to the maintainers of this driver to decide.

I'm fine with keeping this as is, using longer lines does not seem to make
things better here.

Regards,

Hans

