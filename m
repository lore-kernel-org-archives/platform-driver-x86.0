Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2E8C193FE
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Dec 2020 11:44:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2770B2251D
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Dec 2020 11:44:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730044AbgLDLny (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Dec 2020 06:43:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728721AbgLDLnx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Dec 2020 06:43:53 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F8AAC0613D1
        for <platform-driver-x86@vger.kernel.org>; Fri,  4 Dec 2020 03:43:07 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id z7so5026593wrn.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Dec 2020 03:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kq31o14w7QYcuCdmVxhoB3aLD5lZzKhl9gKNui8tRRY=;
        b=hopdKT8kCNjH0lw0/glZo3friFBGBeXkFg0suOCiHeB6U8A875Ua5ytrC1TV/dlhP6
         GI6yhBZnG9YU5c48lbVo7+mxIrcWcV+c9DABI0HY37awkWI1vRVPazM9kI2BqdxpIjy2
         m1LjQeDjclDMjSE0g7j6iSyLzTBW6g2M7G1U7+ez4lL4QSLcIU9zWKJ2jzhsTRa/VI7v
         403x/ZLQc3ub5tzaQRqRKe+38eoBRQ6dgP660I99+6QKAWVFCRC1318LRIdyscAcA8P9
         9JUtb1Gi5rSBHuZvHHBOpUVMGd5WRGVN1pHw67bZWDiwBJMn41himkb/5Io/2VJd+L4y
         rkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kq31o14w7QYcuCdmVxhoB3aLD5lZzKhl9gKNui8tRRY=;
        b=ct7uKN+XVrPzZN7u9HziNz5T8UlvxV0q2EMliyanuC/vpg3zCK2pMzSQU+Hx+qgiwp
         Ox/Wiw1oihuiNkpxnJI7TBZR0RKO7ajrCA+JVlyJRuoWSlQNHI5SZf7P7zeE/AyAM/wi
         HBDhZnBHaC6cktlS+jHcfYwWqe1uRIeartvrdpbszuHmpZSFn3REAO6Hgg1q4UiRfvX6
         u3kG1ikFusYD8tT6MsVdocJwCXz7t6dAKVVM/ecyxURB6qzuxo7xRKabTZqxqxPo9zhM
         6C4cXZ3Pf4/e5cB0h75GPZqW2/lixoS2TNf7qghsMXSfztORU66rGov0iFWcEmt/G4CR
         LNOg==
X-Gm-Message-State: AOAM532niMaSHYQdEycqd20DVqb77vuVacBIEfXiu4b3mDjetFRfjLPs
        AUnTSBpoF4N/cZ/o2Yvqh6kk/dIvrrrxOg==
X-Google-Smtp-Source: ABdhPJzAhvpOaCzKrKd1L2S0vElgk+ms6BHNQ+jJvmh0/Naljzpo/NuGlqq/WJEhM+Wk4D/oXLwozA==
X-Received: by 2002:adf:fc49:: with SMTP id e9mr4463647wrs.31.1607082186276;
        Fri, 04 Dec 2020 03:43:06 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:9cff:9584:adb2:6288? ([2a01:e34:ed2f:f020:9cff:9584:adb2:6288])
        by smtp.googlemail.com with ESMTPSA id b14sm3296895wrx.35.2020.12.04.03.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Dec 2020 03:43:05 -0800 (PST)
Subject: Re: [PATCH v2 2/2] platform/x86/drivers/acerhdf: Check the interval
 value when it is set
To:     =?UTF-8?Q?Peter_K=c3=a4stle?= <peter@piie.net>,
        hdegoede@redhat.com, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201203071738.2363701-2-daniel.lezcano@linaro.org>
 <20201203071738.2363701-1-daniel.lezcano@linaro.org>
 <92e330ff28a10b1fb92d91c083fa3cac@piie.net>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <bf62927f-972b-b4c3-ff97-179af6d53882@linaro.org>
Date:   Fri, 4 Dec 2020 12:43:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <92e330ff28a10b1fb92d91c083fa3cac@piie.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 03/12/2020 22:22, Peter Kästle wrote:
> 3. Dezember 2020 08:17, "Daniel Lezcano" <daniel.lezcano@linaro.org> schrieb:
> 
>> Currently the code checks the interval value when the temperature is
>> read which is bad for two reasons:
>>
>> - checking and setting the interval in the get_temp callback is
>> inaccurate and awful, that can be done when changing the value.
>>
>> - Changing the thermal zone structure internals is an abuse of the
>> exported structure, moreover no lock is taken here.
>>
>> The goal of this patch is to solve the first item by using the 'set'
>> function called when changing the interval. The check is done there
>> and removed from the get_temp function. If the thermal zone was not
>> initialized yet, the interval is not updated in this case as that will
>> happen in the init function when registering the thermal zone device.
> 
> Thanks for your effort.  This improves the code, good finding.
> 
>  
>> I don't have any hardware to test the changes.
> 
> Tests successfully executed on my good old AOA110.
> 
> 
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> 
> Acked-by: Peter Kaestle <peter@piie.net>

Thanks for testing the changes.

Shall pick the patches through the thermal tree ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
