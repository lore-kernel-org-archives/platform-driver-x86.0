Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F32C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 18:05:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B09F6124C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 18:05:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355089AbhDGSGG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 14:06:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26612 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1355081AbhDGSGG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 14:06:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617818755;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U4SpyrRb7wXoflXTbLagnEQwOsHtMWAPZ7xS0V/H++g=;
        b=fWfsYHlxT2syr6dCHLA09PL7pQ36MrI/wVYPBXHp9FIr4bKJbYwXsp6SJ+jT3FXlSga9+z
        iXvVjL7iLWiURf6qrJ0154T4sGeAmOznpeqjjNhQXMCqvkdvTmvhEG6+NwP2Jd7BpE9d9j
        OVFtdV28nkn1AxmIiz6FePvCbs8YV4I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-J3dQCiwRNw6mNNx_GovcWg-1; Wed, 07 Apr 2021 14:05:54 -0400
X-MC-Unique: J3dQCiwRNw6mNNx_GovcWg-1
Received: by mail-ej1-f72.google.com with SMTP id yk6so3502439ejb.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 11:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U4SpyrRb7wXoflXTbLagnEQwOsHtMWAPZ7xS0V/H++g=;
        b=Eb9zcayMBVp6C5DimV7lzlmervx414lzDaVudRm12uZRxjxkvhYCAZYNaj/YnFFS+z
         oSzVt7DQwiQS9h4xiRm2nBSk7lIjEx1EUmtQjSj3ExQYzNxKd2DY1TWX8Rlrc6f6nr0m
         jHcPKUtGytsJCsp9ufvk/7vDR1NM+hgpuYIWWJNdGh8PTIHNceKPlVZRMoDl517ShrpV
         WBJtP8gIYhz4hTUFZfQFjR74fIxa4WJA4cOTLIqFheerC41KGEnvLse2sTpt0+MVmrM8
         1Yfi1bzAL66o8mH+3MhCo04zw8/0jT4nM4UtuLNir6uCXtrRfwk9rgZ00+kW7rx443ZX
         15PQ==
X-Gm-Message-State: AOAM531gPCT78nW41PKCnQ0n0hbKvLZGgRtMNf1eMij8h2uI2LaLKDFs
        oTCPSX9q+zJgU8pIIhHPAFK0ec19mfmMxpRpiJHWH88o3X0YkZOQxtEtlTFl6OovbnDEIVGBKXm
        DlZHXxlyorcZbJHIgHsm2Q1rLg5fBJ1YGUTCgtUcEzJbPZD6pjyTRg4X8t9NF3TjB+VZQPbk0+R
        kI1qsSUQz7EQ==
X-Received: by 2002:a17:906:bcc8:: with SMTP id lw8mr5268663ejb.321.1617818752443;
        Wed, 07 Apr 2021 11:05:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+AyW3fdUFfOGpbtvuTB694o5RnraxRWYdpYK+fTMNPsWAsHhbd0n04nh12BuE2vl4a82HeA==
X-Received: by 2002:a17:906:bcc8:: with SMTP id lw8mr5268635ejb.321.1617818752258;
        Wed, 07 Apr 2021 11:05:52 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ka11sm4828248ejb.43.2021.04.07.11.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 11:05:51 -0700 (PDT)
Subject: Re: [PATCH] platform/surface: aggregator: move to use request_irq by
 IRQF_NO_AUTOEN flag
To:     Tian Tao <tiantao6@hisilicon.com>, luzmaximilian@gmail.com,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <1617778852-26492-1-git-send-email-tiantao6@hisilicon.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3e07998b-b408-e6ae-bf28-781cd054b830@redhat.com>
Date:   Wed, 7 Apr 2021 20:05:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1617778852-26492-1-git-send-email-tiantao6@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/7/21 9:00 AM, Tian Tao wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable because of requesting.
> 
> this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
> is being merged: https://lore.kernel.org/patchwork/patch/1388765/
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

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
>  drivers/platform/surface/aggregator/controller.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
> index aa6f37b..00e3828 100644
> --- a/drivers/platform/surface/aggregator/controller.c
> +++ b/drivers/platform/surface/aggregator/controller.c
> @@ -2483,7 +2483,8 @@ int ssam_irq_setup(struct ssam_controller *ctrl)
>  	 * interrupt, and let the SAM resume callback during the controller
>  	 * resume process clear it.
>  	 */
> -	const int irqf = IRQF_SHARED | IRQF_ONESHOT | IRQF_TRIGGER_RISING;
> +	const int irqf = IRQF_SHARED | IRQF_ONESHOT |
> +			 IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN;
>  
>  	gpiod = gpiod_get(dev, "ssam_wakeup-int", GPIOD_ASIS);
>  	if (IS_ERR(gpiod))
> @@ -2501,7 +2502,6 @@ int ssam_irq_setup(struct ssam_controller *ctrl)
>  		return status;
>  
>  	ctrl->irq.num = irq;
> -	disable_irq(ctrl->irq.num);
>  	return 0;
>  }
>  
> 

