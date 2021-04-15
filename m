Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8F7C433ED
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 11:47:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10DBA613B1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Apr 2021 11:47:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbhDOLrj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Apr 2021 07:47:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58207 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231549AbhDOLri (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Apr 2021 07:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618487235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9/Vr8p1THCN/DK42Nwq+VcLtYwCyjRFL5WcO7ZnHzy0=;
        b=A0zqkxIJwITnfoeN2LLZca0V8lVs1xP9Mz7PevIw3oeYC1ODs4+iI8My1wkoISkIChk9Ea
        vpJpXaOiR3nX7hn6EuaOCVisSkcTe0//GCrklf78Q28UFL9cuLT/fsiSb2CFyOoviqPfZA
        sKtDzV1eL7wGtMOqLK4709DlUR069l8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-E7pzOfvGNj-S0W-m4_bD1w-1; Thu, 15 Apr 2021 07:47:13 -0400
X-MC-Unique: E7pzOfvGNj-S0W-m4_bD1w-1
Received: by mail-ed1-f70.google.com with SMTP id s4-20020a0564021644b0290384e9a246a7so1423066edx.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Apr 2021 04:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9/Vr8p1THCN/DK42Nwq+VcLtYwCyjRFL5WcO7ZnHzy0=;
        b=qb1sqzvhCUlqOXlubur3+C29ggFiJPWHKegZfHgIXayUaY0adgvgzxxTzKExMWde2q
         23WyAfcswFyY743+BPVLxGycCeH7cMwNWN1oFWlxJaTTzQRYajr7ektWP/c0FQyrrhg5
         0kUdZ3DfnqluXVGU/Ce7hDl6RdFRlDTwEIDjiE+0/s/rAJZDUJz3+zyPZ+MHgTv7Q8B/
         wdaZl5/XwBkpWQ/xGYArLnDeDXSYy6hBjaNJyneLJDv92N707yjnfiPD5yeMT17Dds4W
         6YEmnikd6XPiu/WBw8PJC7LZgZTCGF1HvBMLtEQLnlAyFQJFXgUuycplBRV2wmbABOg3
         LTaA==
X-Gm-Message-State: AOAM531+P4ay935W4/Z9pm9NlmqUWNgRtYPrlWH/h7yr2hBhnboETM38
        j9h0VUvWKcUxy6c1VjMjV1jt57wNfrboc/9Ad6X0HAqDrCl33LF6VWYWFhT68LqV2IO5MPQNnsA
        9MYjr1JXEfs8MkyoC9x0ZfiFdIodXG/+OnA==
X-Received: by 2002:a50:fd99:: with SMTP id o25mr1950906edt.148.1618487232498;
        Thu, 15 Apr 2021 04:47:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw48vldng5FQg2esKENn67yYkgvsngUizmBIAXHUM4yQ42DazJeJx8UzfzF/vVG+31BkotxCQ==
X-Received: by 2002:a50:fd99:: with SMTP id o25mr1950898edt.148.1618487232397;
        Thu, 15 Apr 2021 04:47:12 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id jw7sm1759739ejc.4.2021.04.15.04.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 04:47:12 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel_chtdc_ti_pwrbtn: Fix missing
 IRQF_ONESHOT as only threaded handler
To:     zhuguangqing83@gmail.com, Mark Gross <mgross@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210415091435.10486-1-zhuguangqing83@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <972a44be-2ee1-1a5f-75e6-90b888480f51@redhat.com>
Date:   Thu, 15 Apr 2021 13:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415091435.10486-1-zhuguangqing83@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/15/21 11:14 AM, zhuguangqing83@gmail.com wrote:
> From: Guangqing Zhu <zhuguangqing83@gmail.com>
> 
> Coccinelle noticed:
>   drivers/platform/x86/intel_chtdc_ti_pwrbtn.c:59:7-32: ERROR: Threaded IRQ
> with no primary handler requested without IRQF_ONESHOT
> 
> Signed-off-by: Guangqing Zhu <zhuguangqing83@gmail.com>

So I was wondering why this driver worked at all despite the missing flag.

The reason that this still works is that the irqchip instantiated by
the MFD driver for the CHT TI PMIC is using nested IRQ handling and
then the request_irq error for this does not trigger.

This is still the right thing to do though.

I've tested that the driver still works after this.

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
>  drivers/platform/x86/intel_chtdc_ti_pwrbtn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_chtdc_ti_pwrbtn.c b/drivers/platform/x86/intel_chtdc_ti_pwrbtn.c
> index 0df2e82dd249..9606a994af22 100644
> --- a/drivers/platform/x86/intel_chtdc_ti_pwrbtn.c
> +++ b/drivers/platform/x86/intel_chtdc_ti_pwrbtn.c
> @@ -58,7 +58,7 @@ static int chtdc_ti_pwrbtn_probe(struct platform_device *pdev)
>  
>  	err = devm_request_threaded_irq(dev, irq, NULL,
>  					chtdc_ti_pwrbtn_interrupt,
> -					0, KBUILD_MODNAME, input);
> +					IRQF_ONESHOT, KBUILD_MODNAME, input);
>  	if (err)
>  		return err;
>  
> 

