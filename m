Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9192BC47E50
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Jul 2021 09:25:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C8D561167
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Jul 2021 09:25:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240840AbhGOJ1x (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Jul 2021 05:27:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40602 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240822AbhGOJ1w (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Jul 2021 05:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626341098;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1jDol43uaBrThBboocyGhY5CKkpKp9TG07WBkyzgyCI=;
        b=Ke3RgQBxSLYA5JDsZSYOjJk3/kdFDk43cyCXrsR596/OL6Rl8oRXI1T4r5w1DkQXLXRpsK
        fCGQXIkd60SEfnMkMi17aBdhCg2fZLEJ7LbbaF26ho3JdyEh+GbFn6Z8lFdaDM8mlRXEMd
        4h7GgVA3FJ4twenJCJOdI3yc8A2xvdY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-5iOxDSXhMly-G7XaQ6vrHQ-1; Thu, 15 Jul 2021 05:24:57 -0400
X-MC-Unique: 5iOxDSXhMly-G7XaQ6vrHQ-1
Received: by mail-ed1-f71.google.com with SMTP id v4-20020a50a4440000b02903ab1f22e1dcso2764156edb.23
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Jul 2021 02:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1jDol43uaBrThBboocyGhY5CKkpKp9TG07WBkyzgyCI=;
        b=gYjOJwAnJZxa3ALQaY8sR5yrIvhLOZ0p0dWkva7UtG/5NUCh1JM4WPWIsT+DnqMrXI
         uI08pISh3jgxH3b+RoPsSlCKH2rvQ+iVAV0Uzfg/G4dWaco73GqdyHUVzlJs8pMsU0Cm
         xcX5PKFS2rppFyuf0qez97BkjkyMtJMZV4vF63A0BpUVyvKhZFx2U9nAQ1gMgMHkISJl
         fEFp9rRG7LQgSjOpJDKrHtot4UXqQgJlypY93CnQACKvMxvL6qJoAl1otHIIAy/2lrsu
         V4dk7IvP4XsVj0B/pkctKrxYoUftytqCEtZ2GtjwQl2kQ0xNF50EPZdjhQZvr01IsLKO
         hydQ==
X-Gm-Message-State: AOAM530Q5wOxJP20r5DDMb+zHgcQUYtqmefdNNCXQJrlt+CCu0mk/Yu8
        YnpJz8DfvOt2WGvp5UD3lnk3d1+G7Gfx4IxlPYjCWrYkTwedul161MjBpVd1aS5al5ff7VMkHFR
        jZERo59miXwHd+W9a/wl7dLQbEMgCvTvWFg==
X-Received: by 2002:a05:6402:1242:: with SMTP id l2mr5460942edw.97.1626341096223;
        Thu, 15 Jul 2021 02:24:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKmu2RI1E6WG+yViRLzAr6ZJVjzj0/Y5Mevmcq+nX/LqpIgKVJ1wQ9A9ofjL/TIUYlcGss3w==
X-Received: by 2002:a05:6402:1242:: with SMTP id l2mr5460926edw.97.1626341096095;
        Thu, 15 Jul 2021 02:24:56 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id hq9sm1572816ejc.0.2021.07.15.02.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:24:55 -0700 (PDT)
Subject: Re: [PATCH -next] platform/x86: amd-pmc: Fix missing unlock on error
 in amd_pmc_send_cmd()
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     Shyam-sundar.S-k@amd.com, mgross@linux.intel.com
References: <20210715074327.1966083-1-yangyingliang@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bf672394-1d52-d84c-3358-767b773ab305@redhat.com>
Date:   Thu, 15 Jul 2021 11:24:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210715074327.1966083-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/15/21 9:43 AM, Yang Yingliang wrote:
> Add the missing unlock before return from function amd_pmc_send_cmd()
> in the error handling case.
> 
> Fixes: 95e1b60f8dc8 ("platform/x86: amd-pmc: Fix command completion code")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will also apply this to the fixes branch and include it in my
upcoming v5.14 pdx86 fixes pull-req to Linus.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/amd-pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 680f94c7e075..663a4ca0580d 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -275,7 +275,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set, u32 *data, u8 msg
>  				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>  	if (rc) {
>  		dev_err(dev->dev, "failed to talk to SMU\n");
> -		return rc;
> +		goto out_unlock;
>  	}
>  
>  	/* Write zero to response register */
> 

