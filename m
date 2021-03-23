Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883A0C433C1
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 20:12:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A624619D4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 20:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbhCWULg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Mar 2021 16:11:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26066 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230247AbhCWULB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Mar 2021 16:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616530261;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CMmqphSIpyGIdwXaXQ9UFjEoXFttNCQg2W2cJwWjR9I=;
        b=bVcxg5lN74nVMc00814xTi7xxkZGNJZLOawKd5eNHSrfA15w9pkyl2vTeuKa2D2tdKIfsH
        EhNYwaHlXp2n5N6tWBU6RShdratIUeWF49ZRnpVFtwD6IYiErkbXTg9qGd3wmgYn5L+AGR
        YOsmpQdt3eSdY7fsnKMKpyMG8nORtXY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-ft6YU6hrPpSx63H34EeO2Q-1; Tue, 23 Mar 2021 16:10:55 -0400
X-MC-Unique: ft6YU6hrPpSx63H34EeO2Q-1
Received: by mail-ej1-f71.google.com with SMTP id en21so1568324ejc.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Mar 2021 13:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CMmqphSIpyGIdwXaXQ9UFjEoXFttNCQg2W2cJwWjR9I=;
        b=Oc5lRMrTttvKpfJ/xONq8ZRN1xLIfb1MI0PM76qxJigBmeosy6IOJTRS3+f0BQ9/Hc
         CCJEXt/tI7COra9hJNrEMF4+ni8NK27vURbRhlvprU6Adkpi8nCZ7+pVMtE/TnZnl5G/
         u0r71biZaNyjhBalzpGNEO4yzwl6sxnKTaPTdwMGOqWxsaM8ibCPVknP7FocOTKXxkB4
         kRQ2lOTzy7bPSeVOEWYRI5p6Z9AWhEESMjL6HZpo1ZZG0Aw9ri1xzVBX66cTmrD881D4
         JxGD4hNYji3SX9Z7tuFks2gjhJZ5SNNVlqHeRhTrpG92V/qLwTT7b4O+2x5sgcebmqzX
         pIuw==
X-Gm-Message-State: AOAM53377UoDXwf4OHirnCyWEbHXywbNU9xYuHOlAeGmFgr407y7+QvQ
        6beWOGPaX/6eUBML+AimaiwJseyq80Up7lFJurNxl5vKbIY55Y1+MfAX7FxcRgwZ0AH4/Q2irpZ
        s3/pasBhs8r49sVv2OJnO+f6ZCXAGUyWTCw==
X-Received: by 2002:a17:906:3952:: with SMTP id g18mr6571547eje.104.1616530254591;
        Tue, 23 Mar 2021 13:10:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmQnpxczsdFVTCGrCOlrNBdv4450SdVerGPHtabMnbA6KqhVkl6oDhjpPgZ+CJH7bKt+sEsQ==
X-Received: by 2002:a17:906:3952:: with SMTP id g18mr6571536eje.104.1616530254459;
        Tue, 23 Mar 2021 13:10:54 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q26sm11651636eja.45.2021.03.23.13.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 13:10:54 -0700 (PDT)
Subject: Re: [PATCH 1/2] platform/x86: intel_pmt_class: Initial resource to 0
To:     "David E. Box" <david.e.box@linux.intel.com>,
        mgross@linux.intel.com
Cc:     lee.jones@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210317024455.3071477-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ce0a6502-21d6-0010-66d7-beeacd16d063@redhat.com>
Date:   Tue, 23 Mar 2021 21:10:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210317024455.3071477-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/17/21 3:44 AM, David E. Box wrote:
> Initialize the struct resource in intel_pmt_dev_register to zero to avoid a
> fault should the char *name field be non-zero.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
> Base commit is v5.12-rc3.
> 
>  drivers/platform/x86/intel_pmt_class.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_pmt_class.c b/drivers/platform/x86/intel_pmt_class.c
> index c8939fba4509..ee2b3bbeb83d 100644
> --- a/drivers/platform/x86/intel_pmt_class.c
> +++ b/drivers/platform/x86/intel_pmt_class.c
> @@ -173,7 +173,7 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
>  				  struct intel_pmt_namespace *ns,
>  				  struct device *parent)
>  {
> -	struct resource res;
> +	struct resource res = {0};
>  	struct device *dev;
>  	int ret;
>  
> 
> base-commit: 1e28eed17697bcf343c6743f0028cc3b5dd88bf0
> 

