Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B21C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:42:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E099C611AE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:42:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234640AbhESNn6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 09:43:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49478 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346637AbhESNn5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 09:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621431757;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rZruJbBBiPyol//Y6D1lcVyQcd9DKEkSU7NK63ClYKU=;
        b=gvh8G8m9MBjVDcjcsSyT3LnJKzVNb0jXN2wNqfvIrnr2+uFT16BGONb+THzWqbCJ/eINAG
        1TcqF8tR2gSM4HN5+rqKiASrjZb9WCrFG0IGzpaWRPmzJ2Za5ikGwMDxX/UHH+3grccPpX
        C/Us7GofIKq4FirldFkPrdxgZl73v9E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-M_6IAi6ZNiaufTgZ4i-Q4g-1; Wed, 19 May 2021 09:42:36 -0400
X-MC-Unique: M_6IAi6ZNiaufTgZ4i-Q4g-1
Received: by mail-ej1-f71.google.com with SMTP id x20-20020a1709061354b02903cff4894505so3702583ejb.14
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 06:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rZruJbBBiPyol//Y6D1lcVyQcd9DKEkSU7NK63ClYKU=;
        b=ABBj1Z/km/q8HmkOJSymMEOK1iDHZ65UXZKJIDKRKWTWp1SPmb7w1LFIPVzfbbGIey
         /GC6HW5eMRGMzJ1pKYcqAbnIl5str+2fnOawwHOIhJke1MR6pcFeI9HkhQxOS+gIe4iW
         lK6L+bhAyUehgwpUJ5X6gyNa5xZ3WTUUugtViP3v015iMTwQi2Jrz6MbF6JPon6P+pjs
         NVj9snqGqVo2MSyM2mrizBEZEOaKGevu5ebOjBLXSZN4JedmKbJAIJu0UA7x08qq4GX+
         076GF/kBwqo9w0zz0IlRBaJefdl6cNSkOFc/PxNTUkIhv7F1DemGjNjiibJiHbhZiNkp
         kinQ==
X-Gm-Message-State: AOAM531TetaVridjL01Sb5azpYV/dR8yXGg9Xb6Wp1sXviBSBWUHjFv+
        1T/Y4eYqYRKpJ47agcs+zO23pq4Yit+DgZ1Rt0rU2aJlEUBvvCuBdfE3pudwUhgXTtbtI5AGb2b
        0Zp2ROXAQV4A/tJeWsAWhMbybiElCBoyLLA==
X-Received: by 2002:a50:ab16:: with SMTP id s22mr14347992edc.323.1621431754958;
        Wed, 19 May 2021 06:42:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLFNYffy1Be3WQ+WowlzfbWgKqT7yGAs5ntPDDBau1K9D5xso4+M88j9EeQimOuuq6ltMZ4A==
X-Received: by 2002:a50:ab16:: with SMTP id s22mr14347977edc.323.1621431754835;
        Wed, 19 May 2021 06:42:34 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id i2sm9396334edc.96.2021.05.19.06.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:42:34 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: drop unneeded assignment in
 host_control_smi()
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     stuart.w.hayes@gmail.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1620809825-84105-1-git-send-email-yang.lee@linux.alibaba.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f52156f6-a9db-e936-81e9-16049deba54f@redhat.com>
Date:   Wed, 19 May 2021 15:42:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1620809825-84105-1-git-send-email-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/12/21 10:57 AM, Yang Li wrote:
> Making '==' operation with ESM_STATUS_CMD_UNSUCCESSFUL directly
> after calling the function inb() is more efficient, so assignment
> to 'cmd_status' is redundant.
> 
> Eliminate the following clang_analyzer warning:
> drivers/platform/x86/dell/dcdbas.c:397:11: warning: Although the value
> stored to 'cmd_status' is used in the enclosing expression, the value
> is never actually read from 'cmd_status'
> 
> No functional change.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
> 
> Change in v2
> --According to Hans's suggestion, store the inb() value into the s8.
> https://lore.kernel.org/patchwork/patch/1419026/
> 
>  drivers/platform/x86/dell/dcdbas.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
> index d513a59..28447c1 100644
> --- a/drivers/platform/x86/dell/dcdbas.c
> +++ b/drivers/platform/x86/dell/dcdbas.c
> @@ -394,8 +394,7 @@ static int host_control_smi(void)
>  
>  		/* wait a few to see if it executed */
>  		num_ticks = TIMEOUT_USEC_SHORT_SEMA_BLOCKING;
> -		while ((cmd_status = inb(PCAT_APM_STATUS_PORT))
> -		       == ESM_STATUS_CMD_UNSUCCESSFUL) {
> +		while ((s8)inb(PCAT_APM_STATUS_PORT) == ESM_STATUS_CMD_UNSUCCESSFUL) {
>  			num_ticks--;
>  			if (num_ticks == EXPIRED_TIMER)
>  				return -ETIME;
> 

