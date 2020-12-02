Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37C8C64E8A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 12:13:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C18222203
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 12:13:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbgLBMNH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Dec 2020 07:13:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57289 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728341AbgLBMNH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Dec 2020 07:13:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606911100;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3zwNOAGvTPJjverHdLPXU9TMwyctlpykIZc8az2HxtA=;
        b=LVVvWSqgj8+Ud4GqgrqCljpdrPF1DeGt0XYiOB4vDTtz7KkKjOp5H2f70NiQb+knVpatY3
        E/xraxhyXQcv0Fu+4YztdBCqbhBC/UN4DKhQ6RzIrvCyby68eFU9wEOB4ne3oudWKhzSxR
        0xFfGr3Gky58hAhE5NQkJ9UxPLvcFxg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-B5tMwnuAPKONL-sJW-qAug-1; Wed, 02 Dec 2020 07:11:39 -0500
X-MC-Unique: B5tMwnuAPKONL-sJW-qAug-1
Received: by mail-ed1-f69.google.com with SMTP id bc27so2814178edb.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Dec 2020 04:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3zwNOAGvTPJjverHdLPXU9TMwyctlpykIZc8az2HxtA=;
        b=IaxYMCIfSFp5e+u46YIFThNuf0YNNY3lbzChfMSGXj6/A+61Es9o6RHEWOLFPJikij
         R5+zl8LTqhuN9ZZ+F6doTpDR5cp7mwftQpTBJui00fJpYnmDM+VWiarbaZ9ToYN5cbp3
         cyHJ2qqzXC3lfGz9DtHFbMvIdpg4prUCo6kEbHSmvK1KN2KrM0gMULV1/HlYYbO3J1sl
         higpOdfYoKbCZ9vP00CAOjbyoLSlc0zNEkAhrzvUehBjyVhexIKCGn+kAmAWR6vh8tmN
         fe63WI77A5HqZ+50ikcvdlPpW39V8NQtSbFNWESNXSkOaimODpzzidht+cmmS4el/F7k
         4xnw==
X-Gm-Message-State: AOAM5307/YSgPTl/JoyPCgIOhF+VUq80DBriQ+56nYRrND/DJ4rBhvA4
        NlodcyWJU9zpdwe1h4qbJqNcokP0n3q5uIjNJ+3WPlJc/NZH9CDlo72Yx0NgwD2Ds0sFfCDyeGC
        f9344jd1yxzYysPhopyn5uEbylv5g7Wyx5g==
X-Received: by 2002:a50:b224:: with SMTP id o33mr2260928edd.21.1606911097856;
        Wed, 02 Dec 2020 04:11:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRgBpuu53UKBFmWvKzRR7IEGE+Oy8B9DOjQmiLMlya/tl6VYs5fNhTuy3mkmNXAtQGlAuGgw==
X-Received: by 2002:a50:b224:: with SMTP id o33mr2260917edd.21.1606911097661;
        Wed, 02 Dec 2020 04:11:37 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id y15sm1057142eds.56.2020.12.02.04.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 04:11:36 -0800 (PST)
Subject: Re: [PATCH] platform/x86: dell-smbios-base: Fix error return code in
 dell_smbios_init
To:     Qinglang Miao <miaoqinglang@huawei.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201125065032.154125-1-miaoqinglang@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <031db440-8af5-c517-08fe-bce627f28492@redhat.com>
Date:   Wed, 2 Dec 2020 13:11:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125065032.154125-1-miaoqinglang@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/25/20 7:50 AM, Qinglang Miao wrote:
> Fix to return the error code -ENODEV when fails to init wmi and
> smm.
> 
> Fixes: 41e36f2f85af ("platform/x86: dell-smbios: Link all dell-smbios-* modules together")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

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
>  drivers/platform/x86/dell-smbios-base.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/dell-smbios-base.c b/drivers/platform/x86/dell-smbios-base.c
> index 2e2cd5659..3a1dbf199 100644
> --- a/drivers/platform/x86/dell-smbios-base.c
> +++ b/drivers/platform/x86/dell-smbios-base.c
> @@ -594,6 +594,7 @@ static int __init dell_smbios_init(void)
>  	if (wmi && smm) {
>  		pr_err("No SMBIOS backends available (wmi: %d, smm: %d)\n",
>  			wmi, smm);
> +		ret = -ENODEV;
>  		goto fail_create_group;
>  	}
>  
> 

