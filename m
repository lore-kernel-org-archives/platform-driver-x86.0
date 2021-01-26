Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAF0C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jan 2021 07:02:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AA612072C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jan 2021 07:02:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S316698AbhA0BA1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 20:00:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25138 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727187AbhAZSfA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jan 2021 13:35:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611686012;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WqMbFBiR5bxTo9dvjO6KoLK8PoaeAMT7uahfFjAtB40=;
        b=Zz2gV7HAD1g+eXpeNZ21icdGX00Q8q68R21qc6pLcti9HwucvGJukOmEL0YoWZOx6MCHqF
        LVayIFVhPi/XeyDlSdYbW71Iiptv4y649/OFYTRAbYIAwWXhx/7ncMnSRiq3Y+MbQoqjck
        ayUvjEchmcWO/sKrph6C+TpPy3OdKog=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-ZtbcFMdpOx-Mu4Gh6b5vNQ-1; Tue, 26 Jan 2021 13:33:28 -0500
X-MC-Unique: ZtbcFMdpOx-Mu4Gh6b5vNQ-1
Received: by mail-ej1-f70.google.com with SMTP id p1so5289954ejo.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Jan 2021 10:33:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WqMbFBiR5bxTo9dvjO6KoLK8PoaeAMT7uahfFjAtB40=;
        b=Lhzx2zC8eA+A5hud0CKQ0oBQjI7s7+9tz2tlUR7FGAYM6cUtEvH3sFIZy1m0Dn0dj8
         +671s98b5zrBLOrgab1ZwA8mkbd5h5fgWPjMoC+FhTmjLQfJ8xSpu3dlZRabxEZkex1K
         5MENzjvHILuoHmDYRG4go4AyNBzXwz9nTXOp1Zb9oWA/vLKj20A6xC5hj7jVYytXy15+
         +9I6B4hBSZVnSav7iE/ccTVaBxGyMSjO/MYNYJ1U9aVpHR9YRJSYbjJ0KDJyccU6hsu0
         wBqLuszvVZXgSHlXwVPbRutNxs8gOIJzEwWDlW8i87yRPPNiQ1i1zYKw6lsL0YxNUvqf
         PJsA==
X-Gm-Message-State: AOAM532vqtf45vg0V/WOHs7zBv6tItqPUXLCD9xMpy4kyAh67zbqgcaw
        zEcZru4XToObzql2hzqb/eVs0JCSY3N0g3InFk5hLLRBy0LZWCiSuAn/neZuI/EbicJwwzPBZKq
        zdxxTnUQCcDEg/oVnwnF8QAGhxueFk11yNA==
X-Received: by 2002:a17:906:1c13:: with SMTP id k19mr4334516ejg.338.1611686007762;
        Tue, 26 Jan 2021 10:33:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyN194XtVlCKAdXK5VKIvZ0VfeTCUimiW4/dTBZnu6yHH6IeYtTZlE3OE5MXYja0RwyxasFow==
X-Received: by 2002:a17:906:1c13:: with SMTP id k19mr4334512ejg.338.1611686007623;
        Tue, 26 Jan 2021 10:33:27 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id k22sm13162485edv.33.2021.01.26.10.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 10:33:27 -0800 (PST)
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75Vc9RAHvTDAw1ryHq_CPRMtjqkzg9081nw0+RPY_yWPJgA@mail.gmail.com>
 <CAMeQTsY6k64LUg3DYbi67W6-Gx6znOeJbDfKUhzGt-BxF2BgKA@mail.gmail.com>
 <CAHp75VdKxARQAyyTd=ZcaoER1iF6Mk4AS1Dn6U9VCjt_D_+q8A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3b4c2f63-14e6-5041-3c15-c2d65b229269@redhat.com>
Date:   Tue, 26 Jan 2021 19:33:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdKxARQAyyTd=ZcaoER1iF6Mk4AS1Dn6U9VCjt_D_+q8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/26/21 6:14 PM, Andy Shevchenko wrote:
> On Tue, Jan 26, 2021 at 6:55 PM Patrik Jakobsson
> <patrik.r.jakobsson@gmail.com> wrote:
>> On Tue, Jan 26, 2021 at 4:51 PM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>>
>>> On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
>>> <patrik.r.jakobsson@gmail.com> wrote:
>>>> On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
>>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>>>
>>>>> Hi guys,
>>>>>
>>>>> This is first part of Intel MID outdated platforms removal. It's collected into
>>>>> immutable branch with a given tag, please pull to yours subsystems.
>>>>
>>>> Hi Andy,
>>>> Do you plan on eventually removing X86_INTEL_MID completely? If so,
>>>> then I should probably start looking at removing the corresponding
>>>> parts in GMA500.
>>>
>>> Nope. It is related to only Medfield / Clovertrail platforms.
>>>
>>> There are other (MID) platforms that may / might utilize this driver
>>> in the future.
>>
>> Right, there's still Oaktrail / Moorestown with hardware in the wild.
> 
> Actually Moorestown had to be removed a few years ago (kernel won't
> boot on them anyway from that date when Alan removed support under
> arch/x86 for it).
> 
> I'm talking about Merrifield and Moorefield that can utilize it and
> also some other platforms that are not SFI based (Cedar something...
> IIRC).

Yes at least there are some 64 bit capable SoCs with GMA500 which were
used in NAS like devices. These NAS-es actually have a VGA output
(and maybe also DVI?) which is attached to the GMA500.

I know people are running Fedora on these, so we should at least keep
these supported.

Regards,

Hans

