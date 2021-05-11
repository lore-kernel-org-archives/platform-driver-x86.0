Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35899C433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 May 2021 11:11:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10F6461624
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 May 2021 11:11:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbhEKLMJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 May 2021 07:12:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34072 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230400AbhEKLMH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 May 2021 07:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620731461;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=in7v/tRkA773Iwu5+kykWRax2cldZCZeHqdbj7yHYKI=;
        b=GXtAzhmtolyLde07CUczpC6gUidwOZO+QSLAWZEbANJEirI1RKBW0oWpxY4JUDLWK6e27d
        v7sWlUIHq0/QycCQuQt/mS/LWT4HV9dMXLKhrLixbfch1Uqn/OLAoXdgeKjZdQpfx71MOd
        0q0Y490KAvgQHODotaxDVb3YElD5os4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-LG9P5ZB_MUOJH_aTIn_0FQ-1; Tue, 11 May 2021 07:10:57 -0400
X-MC-Unique: LG9P5ZB_MUOJH_aTIn_0FQ-1
Received: by mail-ed1-f72.google.com with SMTP id y19-20020a0564022713b029038a9f36060dso10713663edd.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 May 2021 04:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=in7v/tRkA773Iwu5+kykWRax2cldZCZeHqdbj7yHYKI=;
        b=tu0ygXDFUheX2O6LNTYjK4J1pfOjgw4X7UnYIyvQgnFO18wOBSDOCT4a1UUKZ/C4/z
         nF76jzd0Uq+dWfPO/HOCmvuGqUcpY+02tvujiREnILggzlEzg+U/PvIzKKfCZLSwF2Ki
         qk5rdOiLj/YXAsvLKHzrUHuGJWqoaq9HnIgidem7cYvt0ldMhCmxf3APUeCO/BWdlA0D
         JD523RcUQMobbgZQDBTzUjU78VINBvuRoNJWFLLKLhUiO/HmrWcq5WptAu2gvcROB2jg
         WH0nG/ny+9AdoVSWKiv1Kuc2cRc5yIfs+Ovw7VQi9RwhynKTwpfiWo20/+6aTzdJ14V9
         RD/Q==
X-Gm-Message-State: AOAM530urvNbATAbtkoh6JpNLQY0On00ZJi6dOivkUpX5nOv9emKGraq
        YzcahIqhZCJwidCQfW/Okr4tEVrx2xSVVBg5YWcDZBYqhyhJEkMe6HmRsjXXzs/wzFjy7kVrvQG
        bhEdsWOmxYw31sHD+xTEWHL3MWCfzqKGSNQ==
X-Received: by 2002:a05:6402:40cb:: with SMTP id z11mr36834609edb.25.1620731456571;
        Tue, 11 May 2021 04:10:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeHxWGQNqNK8u0GmBUzPzDOPJlaaaxLMeCEZwkxvtraScYrwXZh5b4lwu/qwvLLPbpprSFvA==
X-Received: by 2002:a05:6402:40cb:: with SMTP id z11mr36834562edb.25.1620731456220;
        Tue, 11 May 2021 04:10:56 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id p25sm92059eja.35.2021.05.11.04.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 04:10:55 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: drop unneeded assignment in
 host_control_smi()
To:     Yang Li <yang.lee@linux.alibaba.com>, stuart.w.hayes@gmail.com
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1619523119-112342-1-git-send-email-yang.lee@linux.alibaba.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7c959c70-dc9f-c34c-e7fb-8b3c1c5fe2ab@redhat.com>
Date:   Tue, 11 May 2021 13:10:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1619523119-112342-1-git-send-email-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Yang Li,

On 4/27/21 1:31 PM, Yang Li wrote:
> Making '==' operation with ESM_STATUS_CMD_UNSUCCESSFUL directly
> after calling the function inb() is more efficient, so assignment
> to 'cmd_status' is redundant.
> 
> Eliminate the following clang_analyzer warning:
> drivers/platform/x86/dell/dcdbas.c:397:11: warning: Although the value
> stored to 'cmd_status' is used in the enclosing expression, the value is
> never actually read from 'cmd_status'
> 
> No functional change.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Thank you for your patch, but as the "kernel test robot <lkp@intel.com>"
reported, this actually breaks the check in the while loop.

cmd_status is a s8 and ESM_STATUS_CMD_UNSUCCESSFUL is defined as -1.

By dropping the intermediate step of storing the inb() value into the
s8, we end up comparing the inb() unsigned result directly to -1 which
is never true.

A possible way to fix this (without reworking the rest of the code) would
be to either cast the inb() result to a s8, so that you end up with this:


		while ((s8)inb(PCAT_APM_STATUS_PORT) == ESM_STATUS_CMD_UNSUCCESSFUL) {

Also while at it please change the condition to a single line as I did
above.

Thanks & Regards,

Hans



> ---
>  drivers/platform/x86/dell/dcdbas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
> index d513a59..a9e8a88 100644
> --- a/drivers/platform/x86/dell/dcdbas.c
> +++ b/drivers/platform/x86/dell/dcdbas.c
> @@ -394,7 +394,7 @@ static int host_control_smi(void)
>  
>  		/* wait a few to see if it executed */
>  		num_ticks = TIMEOUT_USEC_SHORT_SEMA_BLOCKING;
> -		while ((cmd_status = inb(PCAT_APM_STATUS_PORT))
> +		while (inb(PCAT_APM_STATUS_PORT)
>  		       == ESM_STATUS_CMD_UNSUCCESSFUL) {
>  			num_ticks--;
>  			if (num_ticks == EXPIRED_TIMER)
> 

