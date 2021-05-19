Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB10C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:12:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 262966135F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:12:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353550AbhESNNr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 09:13:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22426 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346578AbhESNNq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 09:13:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621429946;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PGGZ3Ap7WMfISommx5/p4o4QgfX5H0jYWS0exbqFy2g=;
        b=S99Bv/x3V1vapwSQ8wxTm+kHXGc3eKIRTXz1jo4eRuzbniW0jrAcA8dJjwsRWFA2oUFJCq
        a5k1PvE8Ja7WhO0A/htNerZHB4BbU2XTS682pY3LnNOkMlJW7cFzhUAD8TJXV5IvKQ3QwR
        d/ewkGjsx/91bsf4vlKl6bJQTjDzXUE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-A3ynno2OPsCWRf_rgJvx9A-1; Wed, 19 May 2021 09:12:25 -0400
X-MC-Unique: A3ynno2OPsCWRf_rgJvx9A-1
Received: by mail-ed1-f71.google.com with SMTP id cy15-20020a0564021c8fb029038d26976787so6222583edb.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 06:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PGGZ3Ap7WMfISommx5/p4o4QgfX5H0jYWS0exbqFy2g=;
        b=rgiRlC578HVm89MAXRpqH+YDP/gyJ1kLbmJXqhOwx7PLT65Fx54m1HWOKTKKPG1/tU
         m/frlK5+kzmMWy4XOkYrCpWH/iKSQsTWnisNTZFC0w+DJMD6boKujCmMTtVqA8t5bMJj
         qgAbIhjG8ZqFQUlsfgMt32KQutNgG0SCF1zsFh1qTIa7rtaeECtj2loekve+SO+/jBVf
         dcaUy2Xh/PJAslk28ad7BtRnusEEYh9mtKKiTMSGgBh7ndV3H58wSgoquPqsXEVgxoH1
         q+sZUzCvHIUfQI2BxugCzzwT60vwmTPGiOUIAHOzPVOEg4O3NR1fx8F90ziU91DM+xAt
         ZL6g==
X-Gm-Message-State: AOAM532ow3hBlXJuVRBH47JX4cf4KkMt7vY5yLZbf8auQBNUSDyGfqTf
        37R0oU7jJWJRO4O93mRdG5l2WHn27Sto02yAykWAi2DmMxoDPe2ROovr5c5HFr/8C/XgAwXcbaq
        aewooX2S25vqb4JF8o73ihiaNI48VDjewtw==
X-Received: by 2002:a17:906:c448:: with SMTP id ck8mr12531273ejb.497.1621429943635;
        Wed, 19 May 2021 06:12:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBDqd6onKKCnE0ChOQlrWYabgI44IDpvYziQmUdwDelp+sRWIH3kqq3NW+MLB9wNDIjb+wRw==
X-Received: by 2002:a17:906:c448:: with SMTP id ck8mr12531249ejb.497.1621429943447;
        Wed, 19 May 2021 06:12:23 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n17sm15690961eds.72.2021.05.19.06.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:12:23 -0700 (PDT)
Subject: Re: [PATCH] [v2] platform/surface: aggregator: avoid clang
 -Wconstant-conversion warning
To:     Arnd Bergmann <arnd@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, platform-driver-x86@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
References: <20210514200453.1542978-1-arnd@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <86f09344-7e88-bad0-282d-d76df5be333b@redhat.com>
Date:   Wed, 19 May 2021 15:12:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210514200453.1542978-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/14/21 10:04 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Clang complains about the assignment of SSAM_ANY_IID to
> ssam_device_uid->instance:
> 
> drivers/platform/surface/surface_aggregator_registry.c:478:25: error: implicit conversion from 'int' to '__u8' (aka 'unsigned char') changes value from 65535 to 255 [-Werror,-Wconstant-conversion]
>         { SSAM_VDEV(HUB, 0x02, SSAM_ANY_IID, 0x00) },
>         ~                      ^~~~~~~~~~~~
> include/linux/surface_aggregator/device.h:71:23: note: expanded from macro 'SSAM_ANY_IID'
>  #define SSAM_ANY_IID            0xffff
>                                 ^~~~~~
> include/linux/surface_aggregator/device.h:126:63: note: expanded from macro 'SSAM_VDEV'
>         SSAM_DEVICE(SSAM_DOMAIN_VIRTUAL, SSAM_VIRTUAL_TC_##cat, tid, iid, fun)
>                                                                      ^~~
> include/linux/surface_aggregator/device.h:102:41: note: expanded from macro 'SSAM_DEVICE'
>         .instance = ((iid) != SSAM_ANY_IID) ? (iid) : 0,                        \
>                                                ^~~
> 
> The assignment doesn't actually happen, but clang checks the type limits
> before checking whether this assignment is reached. Replace the ?:
> operator with a __builtin_choose_expr() invocation that avoids the
> warning for the untaken part.
> 
> Fixes: eb0e90a82098 ("platform/surface: aggregator: Add dedicated bus and device type")
> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will also include this in the next pdx86-fixes pull-req for 5.13.

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
> v2: use __builtin_choose_expr() instead of a cast to shut up the warning
> ---
>  include/linux/surface_aggregator/device.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/surface_aggregator/device.h b/include/linux/surface_aggregator/device.h
> index 4441ad667c3f..6ff9c58b3e17 100644
> --- a/include/linux/surface_aggregator/device.h
> +++ b/include/linux/surface_aggregator/device.h
> @@ -98,9 +98,9 @@ struct ssam_device_uid {
>  		     | (((fun) != SSAM_ANY_FUN) ? SSAM_MATCH_FUNCTION : 0),	\
>  	.domain   = d,								\
>  	.category = cat,							\
> -	.target   = ((tid) != SSAM_ANY_TID) ? (tid) : 0,			\
> -	.instance = ((iid) != SSAM_ANY_IID) ? (iid) : 0,			\
> -	.function = ((fun) != SSAM_ANY_FUN) ? (fun) : 0				\
> +	.target   = __builtin_choose_expr((tid) != SSAM_ANY_TID, (tid), 0),	\
> +	.instance = __builtin_choose_expr((iid) != SSAM_ANY_IID, (iid), 0),	\
> +	.function = __builtin_choose_expr((fun) != SSAM_ANY_FUN, (fun), 0)
>  
>  /**
>   * SSAM_VDEV() - Initialize a &struct ssam_device_id as virtual device with
> 

