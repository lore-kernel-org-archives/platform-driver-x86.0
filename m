Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E23C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 09:51:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D52A4613A0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 09:51:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350304AbhDGJv2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 05:51:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41221 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346322AbhDGJv1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 05:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617789077;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6eBf/KZl76KZNIiAJc1d8nuRrf7PH8qgwrwoOEqxuNE=;
        b=KQ476KQKNJbB7xOgwvxnZUdWdNmJeS67RjbRSk2nSonS577msuru1FC54ItgDsJlbFaNgc
        vLnTK0nyeH/awZmLrHsm0gUyN/H5OdhSz0shXnusBc4HtDaNpELXqXyE4FLF2sqc8W/N2K
        zVRxySlLLzUn5rrqTi4q3L4fzImCUho=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-QxCObEGcNsWK-i5Ui5pnVQ-1; Wed, 07 Apr 2021 05:51:15 -0400
X-MC-Unique: QxCObEGcNsWK-i5Ui5pnVQ-1
Received: by mail-ed1-f70.google.com with SMTP id t27so11812868edi.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 02:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6eBf/KZl76KZNIiAJc1d8nuRrf7PH8qgwrwoOEqxuNE=;
        b=twiCQZDMmHikCIrGcwv9cgtDkwxD6ThEb+MUwNn5d9xi8KBF9IZNk0Vjx4AmVjmnO1
         WDw1wMi3BAM6PX+lNXY4HHrv/mGTVh8Gn2UQJn3j+eqFDKQEAOGWfv1P/7gPw6hpLx4q
         C9g6DLHpW/HpCwqfCeXbZi1AlEqXGujhPIRQyrq9hV9TikRqsIcZy4OfQepV+04lrLBx
         aNH/DKmxZHwiyzQbymiimHOfeYq5P/l+fLKJb3YaFrXalUj8HAk4YkGl4rVg2hGeegZ+
         iaHjhY9wrvrqOLbNXaqOnSiIu1bJq6W895xp3gQVxcOAwUIt+PaJ878jK3I6KllrgpWs
         F6TQ==
X-Gm-Message-State: AOAM53051LyPKDbL9tW2D5OKn/e8QYINS5HDPpSqPX++Wu9mHopfqGG2
        jHCeEmv2KrVHoZt1KZmITErqiLnlVIsksMsuhN+eNiVk5O18Gq190ED8Sa0rcy1/Xe9yHAKg56V
        vau6GQHTGyRULYu/XawGRxudy7QCOyPDtRoxq5RaG3HlJb0x8hyOGEWsknDzjCOEhMIz7P/eIgP
        KVL8P0pLJ7iQ==
X-Received: by 2002:a50:9b12:: with SMTP id o18mr3378670edi.376.1617789074575;
        Wed, 07 Apr 2021 02:51:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfjpXDbSDaQt1OCBHFm45QPFD6RgNQkS8+aZVi5nKeuEEEfm0MO1zvT5UTAviqzLonDYw1kA==
X-Received: by 2002:a50:9b12:: with SMTP id o18mr3378652edi.376.1617789074410;
        Wed, 07 Apr 2021 02:51:14 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id i2sm15639236edy.72.2021.04.07.02.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 02:51:14 -0700 (PDT)
Subject: Re: [PATCH] platform/surface: aggregator: move to use request_irq by
 IRQF_NO_AUTOEN flag
To:     Tian Tao <tiantao6@hisilicon.com>, luzmaximilian@gmail.com,
        mgross@linux.intel.com, Thomas Gleixner <tglx@linutronix.de>
Cc:     platform-driver-x86@vger.kernel.org
References: <1617778852-26492-1-git-send-email-tiantao6@hisilicon.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ddaed29b-f788-fed9-2522-8b2b3d1f46ec@redhat.com>
Date:   Wed, 7 Apr 2021 11:51:13 +0200
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

Thank you for your patch, it is good to see the issue of there not
being a simply way to request IRQs in a way where they are initially
disabled being solved.

> this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
> is being merged: https://lore.kernel.org/patchwork/patch/1388765/

So this is not yet in Linus' tree. When you write "which is being merged",
I assume that means that this is going upstream in the 5.13 window.

So what is the plan to merge follow-up patches using the new API which
the "add IRQF_NO_AUTOEN for request_irq" patch introduces?

Will there be an immutable branch provided with that patch which other
subsystem maintainers can merge ?

Regards,

Hans




> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
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

