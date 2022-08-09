Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9E0C19F2D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Aug 2022 21:46:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbiHIVqE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Aug 2022 17:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbiHIVpu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Aug 2022 17:45:50 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 853C84AD7D
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 Aug 2022 14:45:49 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id l4so15679538wrm.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Aug 2022 14:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=5geUTWjaaOcBVhWxz5YB+FFbf6115VxYj5loGEcSOU8=;
        b=x4fQxmWEZCRBZn3qEbFM/+uOtmYZ2uAh11sMqgrnKo/G/Ulw+RAwW6WAnfR/oqPPGG
         oLU/z1i/dN4JbEZENr/AyLI1zM5YMv4kCyUl3WVqtL6/sUGK6HkMltPF5mo3r9nGBpm4
         Dp2BGyd4UI1+HC/EUPIppso+nWPufJnE+OmkXmQ3J3uudHzP4KYI6L9vdN/07FPhEOjl
         NlcohzxolgNyRL0PMhaPJ0AJj5aaBYx99HzNfnYzAYIXmhQ4PRioxOLLZXygGjxFa5NO
         +Z9xbQ4dJRRlbmKBeHdnac9TVo3DH/++tYfeiAnJFlkEfSm2nHUGLHj3p/nb8vMMtiKF
         qQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=5geUTWjaaOcBVhWxz5YB+FFbf6115VxYj5loGEcSOU8=;
        b=zhRaXceg+0/xGmfQcDKGI++nKSxpQYfb0CJfhiemjJ05VMDbkeR7Wjl6K/wKRnQoDN
         O0XdrabNO1StZLiLi1ldpQ8bTc9GAjZkn1h6kqU92GEToSaPAOUfgaj/yic99bpFIQvJ
         dV6Ax3eX0mLb68faKKCXLNlXbXs4mKpVvUwOC+5Z5/2OuUS2Sir8urSM5mefBO08KABZ
         0Pqho28Gko4e5YwwjieWusva31OlIAXAiMtKC5uj4eek1LxKR6Wjp5cemESB7kVTKq90
         Jv9ODue+8bTaPxPlcI9/H3su8x3PtCui21yVg+PIuw5BwGk/Bo5Cpccv5xCzVI/P8r/E
         6KsQ==
X-Gm-Message-State: ACgBeo3YZFz4Wy4vOkgYpksDbHEVk4YcB5ggoNr1nQ3hzyMVYkcqkXPh
        c+ep1eQlmX0jLHf/mkoh0RHC7Q==
X-Google-Smtp-Source: AA6agR6OYLekP1zwiTGxrgEF3gblfROb0Z0rtoZ9bUCWDXigJhZIB445MsB04r1kNXnyAdrIUUYbGw==
X-Received: by 2002:a05:6000:1a89:b0:222:c186:ca8a with SMTP id f9-20020a0560001a8900b00222c186ca8amr9723969wry.333.1660081548061;
        Tue, 09 Aug 2022 14:45:48 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id z19-20020a05600c0a1300b003a539792542sm227280wmp.7.2022.08.09.14.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 14:45:47 -0700 (PDT)
Message-ID: <1ef26db5-6e2b-ce27-f9ad-34ff8f4055cb@linaro.org>
Date:   Tue, 9 Aug 2022 23:45:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 23/26] thermal/drivers/acerhdf: Use generic
 thermal_zone_get_trip() function
Content-Language: en-US
To:     =?UTF-8?Q?Peter_K=c3=a4stle?= <peter@piie.net>, rafael@kernel.org
Cc:     rui.zhang@intel.com, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        "open list:ACER ASPIRE ONE TEMPERATURE AND FAN DRIVER" 
        <platform-driver-x86@vger.kernel.org>
References: <20220805145729.2491611-1-daniel.lezcano@linaro.org>
 <20220805145729.2491611-24-daniel.lezcano@linaro.org>
 <fdaba367-c657-0d85-7244-918b99569337@piie.net>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <fdaba367-c657-0d85-7244-918b99569337@piie.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 08/08/2022 21:34, Peter Kästle wrote:
> Hello,
> 
> some comments.  Please merge if those are considered.  Thanks.
> 
> 
> On 05.08.22 16:57, Daniel Lezcano wrote:
>> The thermal framework gives the possibility to register the trip
>> points with the thermal zone. When that is done, no get_trip_* ops are
>> needed and they can be removed.
>>
>> Convert ops content logic into generic trip points and register them 
>> with the
>> thermal zone.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> 
> Acked-by: Peter Kästle <peter@piie.net>

Thanks for reviewing the patch

[ ... ]

>>       if (kernelmode && prev_interval != interval) {
>>           if (interval > ACERHDF_MAX_INTERVAL) {
>>               pr_err("interval too high, set to %d\n",
> 
> I don't know the current behavior of the thermal layer well enough.
> Is it ensured, that those new trips[0].temperature / trips[0].hysteresis 
> values are taken into account?

I don't have this platform so it is hard to test. All the device tree 
based sensors are using now those generic trip points and that works.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
