Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC42CC4361B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 14:56:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 813172360D
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 14:56:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgLGOzk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 09:55:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45111 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725772AbgLGOzj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 09:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607352853;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZY9alcaJwbCVcJul/NI3QBrRiFsddnsGdax2/APiTVA=;
        b=Z9GZvlSPzSHEl+iNjE0h/baToJ4LhpnSiTAixwueWwKjBcxLJV7Ml+F0BX0glTjWY/63I6
        zrwx9gzl9g6fvLdBs1Et2DNPOBrbIlyjoyoM4uWayVvsm1rho85h5S2JbAKqvHxsyHoIr/
        CX/tjx0FEs9f5/co/GItmc7XFbttUx4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-JZUkxHsgPIeUvf3ltZZmtA-1; Mon, 07 Dec 2020 09:54:11 -0500
X-MC-Unique: JZUkxHsgPIeUvf3ltZZmtA-1
Received: by mail-ej1-f71.google.com with SMTP id rl11so1077810ejb.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Dec 2020 06:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZY9alcaJwbCVcJul/NI3QBrRiFsddnsGdax2/APiTVA=;
        b=eGvPCquf0pZhciZXQLWjFn9wvWGvzslyg/vnF3uQtlRn4XkPKMuTWdAQw4ejvv3bMa
         wArcg570WHDUhTbZi1ioNlVYW8rcHN6XztNWH0kjTjVvAo3rxLvVM5LDdwoL2+SDiaBI
         AHRvanZk99bBdRaMcta7/O99b6Zg8/AMwR1oMr+4bwJ2Pmxpg5wQ0hq3InJvipSnF3tA
         YyTReZrBbW6LmF08mPQRIzDBHAeNNoiWbYZfpiyG5hueAI1/85R8xEY/s4BJ4z7BSFVv
         E0FlAJ/oFDWNoAaYK5zFI7UGDY9pd74obK7phA2EajW89nVqSrcR/t5fqPyidmSqQvbp
         UrmQ==
X-Gm-Message-State: AOAM532evkEPpCNf493LKEP3g/uRQNzVG5Ekd0AjeRRn/fd7ULMPQPvl
        uZE4uosk1tAIJ2klPxHY+F3UKMtccl8OrxyAu5tXXzQG2NKg03wllFd+xWObMoXUxbdfl3MTh1Z
        Zy7L1r0z4sPuIeJuiBNWrnjhdxoB2mgdPkQ==
X-Received: by 2002:a50:998d:: with SMTP id m13mr19773426edb.119.1607352850526;
        Mon, 07 Dec 2020 06:54:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybvxtqBPfHFtpim+Hnhr9mhb51+yZcFZIaYdxT1fb4tmHWVW6GNTQRpZiN6fS1x3dyQf7Elw==
X-Received: by 2002:a50:998d:: with SMTP id m13mr19773417edb.119.1607352850355;
        Mon, 07 Dec 2020 06:54:10 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id rh2sm12520011ejb.68.2020.12.07.06.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 06:54:09 -0800 (PST)
Subject: Re: [PATCH v2 2/2] platform/x86/drivers/acerhdf: Check the interval
 value when it is set
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        =?UTF-8?Q?Peter_K=c3=a4stle?= <peter@piie.net>,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201203071738.2363701-2-daniel.lezcano@linaro.org>
 <20201203071738.2363701-1-daniel.lezcano@linaro.org>
 <92e330ff28a10b1fb92d91c083fa3cac@piie.net>
 <bf62927f-972b-b4c3-ff97-179af6d53882@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <771a76da-bdd3-54b2-3661-e9db918ee00d@redhat.com>
Date:   Mon, 7 Dec 2020 15:54:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <bf62927f-972b-b4c3-ff97-179af6d53882@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/4/20 12:43 PM, Daniel Lezcano wrote:
> On 03/12/2020 22:22, Peter Kästle wrote:
>> 3. Dezember 2020 08:17, "Daniel Lezcano" <daniel.lezcano@linaro.org> schrieb:
>>
>>> Currently the code checks the interval value when the temperature is
>>> read which is bad for two reasons:
>>>
>>> - checking and setting the interval in the get_temp callback is
>>> inaccurate and awful, that can be done when changing the value.
>>>
>>> - Changing the thermal zone structure internals is an abuse of the
>>> exported structure, moreover no lock is taken here.
>>>
>>> The goal of this patch is to solve the first item by using the 'set'
>>> function called when changing the interval. The check is done there
>>> and removed from the get_temp function. If the thermal zone was not
>>> initialized yet, the interval is not updated in this case as that will
>>> happen in the init function when registering the thermal zone device.
>>
>> Thanks for your effort.  This improves the code, good finding.
>>
>>  
>>> I don't have any hardware to test the changes.
>>
>> Tests successfully executed on my good old AOA110.
>>
>>
>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>
>> Acked-by: Peter Kaestle <peter@piie.net>
> 
> Thanks for testing the changes.
> 
> Shall pick the patches through the thermal tree ?

I can take them through the drivers/platform/x86 (pdx86) tree,
but if you prefer to take them upstream through the thermal tree,
then that is fine too...

Here is my ack (as pdx86 maintainer) for taking them through
the thermal tree:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

