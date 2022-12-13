Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84773C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Dec 2022 13:36:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235336AbiLMNgj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Dec 2022 08:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbiLMNgh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Dec 2022 08:36:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8515E1C924
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Dec 2022 05:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670938553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=widk5hNTyqXU4J+yiK3oB+nWuzI+1Tyxo1lS302yiSU=;
        b=i+eAEfPRN95RlR+PFoSUwBylqTCgcJ5aZqyF2kyMrURwrZxsHca1an1cZoPO7XZbH/u7wc
        KRbrGIErDb7iNg7Nw37TINqpDHqFo69PKy+RtF0JMjWLQJ+c/bm0hALVVkQApAjkoRutnX
        bxPBevQH+wwi5Bz6+h/y3kgyCr6PPXM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-ESA0AwofNv-1_UfyljzcXA-1; Tue, 13 Dec 2022 08:35:52 -0500
X-MC-Unique: ESA0AwofNv-1_UfyljzcXA-1
Received: by mail-ed1-f71.google.com with SMTP id w15-20020a05640234cf00b0046d32d7b153so7159604edc.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Dec 2022 05:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=widk5hNTyqXU4J+yiK3oB+nWuzI+1Tyxo1lS302yiSU=;
        b=hGAHrUX4jHrOZ5fAsnm/UheP9d4YLTsjuwgVQIy2p24aZ3iu200dkGysmXkp3yjTCN
         UzYk1I0yd1ShE8aoitVSEfLSRwmxbTuKTACfhu3AwPy4TEFGci93IJSdybobjSNtrmtX
         XJ4eIbC/qMeUbzY5Oq0FWs5iRFE9b4mO1SuEsXthpL/U3ZzEWoQ8S+E5BNkVH32lDwVD
         BmJDnIObKbgTYmvSxcc5fQa7+G1o4kLkJrU8x4JqdAviuQWfubHbVRBkxlvmB9LmFPDZ
         //QT5+84f7LkXHEuC9TyEfg26FiQuHsmg0iZcCVfB5plrj1NZSUPcTfUOBESx8EVPsA5
         nMpQ==
X-Gm-Message-State: ANoB5pnbhnyEbuGUFR7BEDr5y/96FJ+G+E8ljovcm+qyTYF1Hd99tqpH
        w1g1BfcUbRUIL46YUbslT0Jka3el4S32xvJkuO7c1xauDtvY31MvoAHQ8lWyF8kahtw7SfxRb8u
        DD6JxuOIqDOtvkihThgclp3wyh3cWZjLXWQ==
X-Received: by 2002:a17:906:b114:b0:78d:f455:b4b6 with SMTP id u20-20020a170906b11400b0078df455b4b6mr18405929ejy.29.1670938551328;
        Tue, 13 Dec 2022 05:35:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7K/FryDUfjnEIA9nPv04jdMFeDfKwtJEaShMnt2zscfl9VnusCNDvxLRcipu3sYWC5zceXzg==
X-Received: by 2002:a17:906:b114:b0:78d:f455:b4b6 with SMTP id u20-20020a170906b11400b0078df455b4b6mr18405916ejy.29.1670938551105;
        Tue, 13 Dec 2022 05:35:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id i13-20020a1709061ccd00b007c11f2a3b3dsm4521186ejh.107.2022.12.13.05.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 05:35:50 -0800 (PST)
Message-ID: <8fc57150-3dbc-ec9b-bcb7-8a442e0d1ddd@redhat.com>
Date:   Tue, 13 Dec 2022 14:35:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] platform/x86: sony-laptop: Don't turn off 0x153 keyboard
 backlight during probe
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mattia Dongili <malattia@linux.it>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20221213122943.11123-1-hdegoede@redhat.com>
 <CAHp75VeDOrB6zd4Xz+kiAnb74hv7LNYrgNdT_XsN+qAPBYEJRw@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeDOrB6zd4Xz+kiAnb74hv7LNYrgNdT_XsN+qAPBYEJRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/13/22 14:03, Andy Shevchenko wrote:
> On Tue, Dec 13, 2022 at 2:29 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The 0x153 version of the kbd backlight control SNC handle has no separate
>> address to probe if the backlight is there.
>>
>> This turns the probe call into a set keyboard backlight call with a value
>> of 0 turning off the keyboard backlight.
>>
>> Skip probing when there is no separate probe address to avoid this.
> 
> ...
> 
>> +       /*
>> +        * Only probe if there is a separate probe_base, otherwise the probe call
>> +        * is equivalent to __sony_nc_kbd_backlight_mode_set(0), resulting in
>> +        * the keyboard backlight being turned off.
>> +        */
>> +       if (probe_base) {
> 
> I'm wondering if it wouldn't be better to split this into the helper
> and hence just call it here.

The helper here is sony_call_snc_handle() which is not only used for
probing it is a generic helper.

Calling sony_call_snc_handle() with an argument of 0 is valid, specifically
this turns of the kbd backlight on the affected laptop models.

Which is a valid thing to do if the user requests it, but it is not a valid
thing to do as a "probe" to see if there is a kbd-backlight.

Regards,

Hans


