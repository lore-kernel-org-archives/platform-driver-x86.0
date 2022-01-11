Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2594AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 11:46:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238719AbiAKLqV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 06:46:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36372 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238671AbiAKLqU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 06:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641901579;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RzuBgljlPMxvVkB0baeQwY9PJZw8EqXemDkfwx+V21A=;
        b=QpgonbI7qfxt7EcVSAcDsbdk+lA2WiXaLA1TTzVHlUCnu2qixmkMz8gc0rNE4fS2tv8GkW
        cyMKCcmlCQMsSVKuFkJ+rPYFaJ3uXOtbYJBo9ifuOD+6LuNdOEGdznwQQk3NzMj4JCk1uK
        pM1BQMdWRvMAkYuurmg2koAr5fEJ2Jc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-FaU7QLu7NP68lPA-ISsSvg-1; Tue, 11 Jan 2022 06:46:18 -0500
X-MC-Unique: FaU7QLu7NP68lPA-ISsSvg-1
Received: by mail-ed1-f70.google.com with SMTP id p8-20020aa7d308000000b003fe9b0c4760so2909655edq.17
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 03:46:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RzuBgljlPMxvVkB0baeQwY9PJZw8EqXemDkfwx+V21A=;
        b=NTXjodNTlkbzwv2OUxvS0v9uIPbmMEi9B+eRODoS0EfdiP5uSqWca8PJIySE3y54dX
         +6Omaia8I+cHw/o8n7ZvEAAulmaGzgsiQhPoUgkelxownu1snJvhKyj8iNzpnAFbMoiA
         7DwmWvsQC4EKBkpgej49WCiGL+WQS6To9ZCK9DouDPFUCd1BLNk4aGjST6DfLFlHB4/w
         m5bbEcQ7/hvjUkRaz57CFhQcU6N6bXpOTV5Von1NO+AEXhyBOOtkWahReIyqBA/aNHcl
         S8SSjjv2EZRuz6Hljct5dZOmw/8b3NRzp/EJfdWu0QcDzsLIBl0UzQ93oEwRoUpzbeeY
         oIeQ==
X-Gm-Message-State: AOAM533GmEV5JoDqbpE5d6v121fWMW2EmxazVzriKo9bUbyrg6Xml7Cm
        AdEC/79Q4TO0SOHsVPfTNeMSW1RpN8syuF9ixUXdM+xKbzuY3cpMZhzIUvlB0y0I38Ec+41+kJv
        cYfvvNUuz6hMtmZtDabi+b9RopYlIEp4aDA==
X-Received: by 2002:a05:6402:14f:: with SMTP id s15mr3921753edu.118.1641901577082;
        Tue, 11 Jan 2022 03:46:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJws87UF8esr8l6TmOLBBU3sGoSNFTH92DcHwwCzd5szm8rakM4iAM1IipqI9wBTbKwSWofbVA==
X-Received: by 2002:a05:6402:14f:: with SMTP id s15mr3921745edu.118.1641901576942;
        Tue, 11 Jan 2022 03:46:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id l16sm5031362edb.3.2022.01.11.03.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 03:46:16 -0800 (PST)
Message-ID: <dd4387d7-76e7-2831-18ce-c57bfdb3f9a4@redhat.com>
Date:   Tue, 11 Jan 2022 12:46:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] gpio: tps68470: Allow building as module
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20220111105632.219581-1-hdegoede@redhat.com>
 <Yd1qgTKIFa7pTEwg@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yd1qgTKIFa7pTEwg@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/11/22 12:31, Andy Shevchenko wrote:
> On Tue, Jan 11, 2022 at 11:56:32AM +0100, Hans de Goede wrote:
>> The gpio-tps68470 driver binds to a tps68470-gpio platform-device which
>> itself gets instantiated by a special MFD driver from
>> drivers/platform/x86/intel/int3472/tps68470.c
>>
>> This MFD driver itself can be built as a module, so it makes no sense to
>> force the gpio-tps68470 driver to always be built-in.
>>
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
>> Changes in v2:
>> - Fix some spelling errors in the commit msg
>> - Remove blank line between tps68470_gpio_driver decleration and
>>   module_platform_driver(tps68470_gpio_driver)
> 
> It used to be 2 patches in the series, are you going to send another one
> separately?

Ah right, I forgot this was a series. The other one had no review comments,
so v1 is still valid, you can find it here:

https://lore.kernel.org/linux-gpio/20211225120026.95268-2-hdegoede@redhat.com/

Regards,

Hans


