Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F54C4361B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 16:00:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31ADD23731
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 16:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgLGQAM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 11:00:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbgLGQAL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 11:00:11 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947B5C061793
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Dec 2020 07:59:25 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id a12so6454853wrv.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Dec 2020 07:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TsbR/ygYxyXFNxTWS+rlq87PYRq6NOfsyxwkN1nkloE=;
        b=Bsbi60AptI1vCJOxzvRvBbaEKPAazGs9IEdCxKhzFzQREOIMVOxK/5D4TcbhHl968t
         gmU7bHFSKllntii/SUXLSDINSRLe9zYtzjuqy8kMXaxCarhOunVii2BEwuBUbfpJLg3l
         ni/IaIbbbofOVXhCPSyK6RDKyoD5EZ/9n4nEtinLJE94xlg+0UCfpNoNJFHp+lSJJyrl
         mY0ptoOYtLWZzA8LjxvxeeshAPcGFcUggO9W9Vp+7tJruGyHafRFbxADiuh3FXS/ksyr
         jvzB1gi53Bk8J9U93Qb9S4JomZTrgXGsB0DKpkvQv+8yfcTXH822m7KMH9p8ByG/+aM1
         XoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TsbR/ygYxyXFNxTWS+rlq87PYRq6NOfsyxwkN1nkloE=;
        b=hQj6E9hlUmyyeEA9iD9wfCMufisunwfFHgp4fpwbml5Fp5h873ZA3aLY9IDhCcBhfj
         n4QNb+kgnPeIGVfT7Sw9Xc7gf6xbzNF4ryUzwMCWIyN+TdD517SyZKAT7V1tHIsvfzsJ
         VLbTQDlmQEdAFacvwhKQCvVNqsMImxyKZpx59atcFFQSFMi0DqwbbDg5TJ90Nu3sBaaF
         ll8xA+oSszwE9tLH7Z18r8KtDK9dBAWBfh32EzO8QsNvRk8bKbw5/F6tk1Qr5WnEIj5O
         65OT14BcGopwChPBV/0cOw9Hd0qTpGx7XLc6G4VDFB8QL5hLYiaUDnk+dzAmURh7p3WF
         5TuA==
X-Gm-Message-State: AOAM533KUI853E+kd6HcoH32RQHRwIQ8F9Vl29INEvXGk3hDGod8JkjB
        HFE1UxSmiqkMchEB+RmIPs/00Q==
X-Google-Smtp-Source: ABdhPJzYlkkV9y15L7sZt8a7Aq3G0pyggpPyg/Q7eQW9JtvvXF7bANlqEB6ECjgdqyaNMQ8sIzIulg==
X-Received: by 2002:adf:f347:: with SMTP id e7mr20465446wrp.183.1607356764149;
        Mon, 07 Dec 2020 07:59:24 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:797d:a1c3:5539:208e? ([2a01:e34:ed2f:f020:797d:a1c3:5539:208e])
        by smtp.googlemail.com with ESMTPSA id s63sm7041541wms.18.2020.12.07.07.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 07:59:23 -0800 (PST)
Subject: Re: [PATCH v2 2/2] platform/x86/drivers/acerhdf: Check the interval
 value when it is set
To:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Peter_K=c3=a4stle?= <peter@piie.net>,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201203071738.2363701-2-daniel.lezcano@linaro.org>
 <20201203071738.2363701-1-daniel.lezcano@linaro.org>
 <92e330ff28a10b1fb92d91c083fa3cac@piie.net>
 <bf62927f-972b-b4c3-ff97-179af6d53882@linaro.org>
 <771a76da-bdd3-54b2-3661-e9db918ee00d@redhat.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <b42f067e-aebf-4e6a-0adb-ccc1b8bfc8ba@linaro.org>
Date:   Mon, 7 Dec 2020 16:59:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <771a76da-bdd3-54b2-3661-e9db918ee00d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 07/12/2020 15:54, Hans de Goede wrote:
> Hi,
> 
> On 12/4/20 12:43 PM, Daniel Lezcano wrote:
>> On 03/12/2020 22:22, Peter Kästle wrote:
>>> 3. Dezember 2020 08:17, "Daniel Lezcano" <daniel.lezcano@linaro.org> schrieb:
>>>
>>>> Currently the code checks the interval value when the temperature is
>>>> read which is bad for two reasons:
>>>>
>>>> - checking and setting the interval in the get_temp callback is
>>>> inaccurate and awful, that can be done when changing the value.
>>>>
>>>> - Changing the thermal zone structure internals is an abuse of the
>>>> exported structure, moreover no lock is taken here.
>>>>
>>>> The goal of this patch is to solve the first item by using the 'set'
>>>> function called when changing the interval. The check is done there
>>>> and removed from the get_temp function. If the thermal zone was not
>>>> initialized yet, the interval is not updated in this case as that will
>>>> happen in the init function when registering the thermal zone device.
>>>
>>> Thanks for your effort.  This improves the code, good finding.
>>>
>>>  
>>>> I don't have any hardware to test the changes.
>>>
>>> Tests successfully executed on my good old AOA110.
>>>
>>>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>
>>> Acked-by: Peter Kaestle <peter@piie.net>
>>
>> Thanks for testing the changes.
>>
>> Shall pick the patches through the thermal tree ?
> 
> I can take them through the drivers/platform/x86 (pdx86) tree,
> but if you prefer to take them upstream through the thermal tree,
> then that is fine too...
> 
> Here is my ack (as pdx86 maintainer) for taking them through
> the thermal tree:
> 
> Acked-by: Hans de Goede <hdegoede@redhat.com>

Thanks. I'll take them through the thermal tree.

  -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
