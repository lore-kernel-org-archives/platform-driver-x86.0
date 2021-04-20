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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB6BC433B4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Apr 2021 15:30:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A977613AB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Apr 2021 15:30:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbhDTPbZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 20 Apr 2021 11:31:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46312 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232507AbhDTPbZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Apr 2021 11:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618932653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RBBsrjmHRDP21lnXRazBH5eMtCC8CXeVM/g8RMCBPvM=;
        b=SQCWukSSFfevkr4c3gIgTUZzTC0WgUpdGirFsKz0TFYGdecF3jRJzINVOnDgEE+d+9c2U1
        KgvzXsQNMfDkJSKXR94hSV/2Z2xAPVm8K/LATmNgNhC1AKax24Tiy5a3cYVn+DvsFq9oqB
        LDZ7tQsIGqrX1BQYWnmnr3V+LrgEp2I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-uBT-kW-9MDqKBOBVacNkPg-1; Tue, 20 Apr 2021 11:30:51 -0400
X-MC-Unique: uBT-kW-9MDqKBOBVacNkPg-1
Received: by mail-ej1-f72.google.com with SMTP id o25-20020a1709061d59b029037c94676df5so4941974ejh.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Apr 2021 08:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RBBsrjmHRDP21lnXRazBH5eMtCC8CXeVM/g8RMCBPvM=;
        b=HDwwwlB21dBmLnEXieoThyRO017B+fzISpwlgqLm3/4zoemQYK5XWzaruAZbfewwuf
         uU5yDej5PKJYtBqq+c5yu9qjHeAXK9Db8OtxdnX4uLlM22ex9CJNfcWDjpvKOR7HO6Sj
         HYZ322lgHzePur+AC7LxmySJsEV6xcoFzknfXUUCyvnn2CWiEQo55QCEwQTD2V9dTblz
         th7Yi3uUy3sjk3r1pj0LRheG60PE9u0l9hg18KvG1dxhM6Xwi0cYFodEa8FvVyzdhVhc
         y5LbxJ/5hStSb5IAvShFJ3qXkMAG0z24JHwRlFSNENDczZyxCeQz0e6rXzanoywx7LYz
         1/rg==
X-Gm-Message-State: AOAM5305fYLs3NsfxaNpV18qLcdsGU5bVhmfPQS8FglLub843HdBQeC9
        P/FwOVxyOKLzoV4vyZ7tqXTUrMpC+4tlMzvn+DCagWTXaEAhxjLzfj8Wt2k4bgbNlS/3TYjW0UO
        c7xQqzH75Hmq1iQTn7vJIFb3G1NiOncUyvw==
X-Received: by 2002:a05:6402:134f:: with SMTP id y15mr15446458edw.259.1618932650227;
        Tue, 20 Apr 2021 08:30:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuVHu6/YIHf26jz/l5PBJO5dia9L05ZHer0be0n8fwzCxg/hUL9LLA7M5dpD9wD7isJaO0ng==
X-Received: by 2002:a05:6402:134f:: with SMTP id y15mr15446440edw.259.1618932650105;
        Tue, 20 Apr 2021 08:30:50 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h19sm12796131ejc.94.2021.04.20.08.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 08:30:49 -0700 (PDT)
Subject: Re: [PATCH] platform/surface: aggregator: fix a bit test
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YH6UUhJhGk3mk13b@mwanda>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <abec80a7-6fee-1105-e219-21fcd88f9949@redhat.com>
Date:   Tue, 20 Apr 2021 17:30:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YH6UUhJhGk3mk13b@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/20/21 10:44 AM, Dan Carpenter wrote:
> The "funcs" variable is a u64.  If "func" is more than 31 then the
> BIT() shift will wrap instead of testing the high bits.
> 
> Fixes: c167b9c7e3d6 ("platform/surface: Add Surface Aggregator subsystem")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
>  drivers/platform/surface/aggregator/controller.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
> index 00e38284885a..69e86cd599d3 100644
> --- a/drivers/platform/surface/aggregator/controller.c
> +++ b/drivers/platform/surface/aggregator/controller.c
> @@ -1040,7 +1040,7 @@ static int ssam_dsm_load_u32(acpi_handle handle, u64 funcs, u64 func, u32 *ret)
>  	union acpi_object *obj;
>  	u64 val;
>  
> -	if (!(funcs & BIT(func)))
> +	if (!(funcs & BIT_ULL(func)))
>  		return 0; /* Not supported, leave *ret at its default value */
>  
>  	obj = acpi_evaluate_dsm_typed(handle, &SSAM_SSH_DSM_GUID,
> 

