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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D19C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:11:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7A2760FF1
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:11:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346515AbhESNNE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 09:13:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47196 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236567AbhESNND (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 09:13:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621429903;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E4iqCQQcWH0B7eHMG9iFWGbs/tWadPcG1oUL8R8VzZU=;
        b=EIDAmm6jrIvi9EFNgfjSs0ndEUS9DuME9tXXOhdUgl+uO8023dt2crsbWdHyjEaC3/K3ir
        SzPVMxeQpJgOC5Dq130oMMd0gmYfdLaMhGoOlAOAysb6IsM/QrPl6jyV8xzeoDY/l4P9yH
        PbwLeJhTwmyOWON3cGWGX7xhXgrd8cc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-bIEQLJXcOvugF4yRCsXBlQ-1; Wed, 19 May 2021 09:11:41 -0400
X-MC-Unique: bIEQLJXcOvugF4yRCsXBlQ-1
Received: by mail-ej1-f72.google.com with SMTP id eb10-20020a170907280ab02903d65bd14481so3387188ejc.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 06:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E4iqCQQcWH0B7eHMG9iFWGbs/tWadPcG1oUL8R8VzZU=;
        b=a6TGlyrkJuRTgAp4EU4r69q4FtCDPHbWfhXxsvJr9Ck/0WPrJSg/IlvU5NuEEqRF/n
         JHw3dOkt6lCaYN+o2372Y9H9JGt7Xces0rVVqorvaeI+VRsxl+5K6q7yi6og8VtdCcf5
         lmDu4xorjlYy4UPOaahlgTlQkE4HsFdkMdct6NDFRdfB8pIkGIeAG3Nw8yhCrtQ0s9bC
         qzOS0kGPppLdfwPD7Yn3KNoufUP4zq2UxSsscrqEENks6lbMNrW710DerVtb5YnqCTZg
         L6f9PggzgdKWImN9GIPC3Rzu85Er/2qb+XMTDAyWc+MW7aNrc18ejS9vrXXLdy9S5s++
         24cw==
X-Gm-Message-State: AOAM533k0EWM0mDRLPnoteJ7DXGjKziX0SqB8kUUh2+cAgzDEYH/wTkF
        mibEV6k2PMqWdiyTZvHRKRuQcdeXGqIE3vCICbpADld0A7eGTEYIqdhuh4i49pE2rFI455dCPJL
        uPNj6aRcXTdoNpeVZequr8tdX4fpoC/f9NQ==
X-Received: by 2002:a17:906:79c8:: with SMTP id m8mr12731200ejo.260.1621429900351;
        Wed, 19 May 2021 06:11:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpW5YZWL01KOdHo9+Pc+VXn0YrDq232IN9c3w6uGoa/uK8WQL+Qf1aFEKzZC50INEVt6tB8Q==
X-Received: by 2002:a17:906:79c8:: with SMTP id m8mr12731184ejo.260.1621429900200;
        Wed, 19 May 2021 06:11:40 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w14sm16048395edj.6.2021.05.19.06.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:11:39 -0700 (PDT)
Subject: Re: [PATCH] platform/surface: aggregator: Do not mark interrupt as
 shared
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210505133635.1499703-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <17e63def-42ed-42d6-156d-cdde573b5e40@redhat.com>
Date:   Wed, 19 May 2021 15:11:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210505133635.1499703-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/5/21 3:36 PM, Maximilian Luz wrote:
> Having both IRQF_NO_AUTOEN and IRQF_SHARED set causes
> request_threaded_irq() to return with -EINVAL (see comment in flag
> validation in that function). As the interrupt is currently not shared
> between multiple devices, drop the IRQF_SHARED flag.
> 
> Fixes: 507cf5a2f1e2 ("platform/surface: aggregator: move to use request_irq by IRQF_NO_AUTOEN flag")
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

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
>  drivers/platform/surface/aggregator/controller.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
> index 69e86cd599d3..8a70df60142c 100644
> --- a/drivers/platform/surface/aggregator/controller.c
> +++ b/drivers/platform/surface/aggregator/controller.c
> @@ -2483,8 +2483,7 @@ int ssam_irq_setup(struct ssam_controller *ctrl)
>  	 * interrupt, and let the SAM resume callback during the controller
>  	 * resume process clear it.
>  	 */
> -	const int irqf = IRQF_SHARED | IRQF_ONESHOT |
> -			 IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN;
> +	const int irqf = IRQF_ONESHOT | IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN;
>  
>  	gpiod = gpiod_get(dev, "ssam_wakeup-int", GPIOD_ASIS);
>  	if (IS_ERR(gpiod))
> 

