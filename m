Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B80C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 08:39:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D2B461177
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 08:39:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233827AbhDGIjn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 04:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbhDGIjm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 04:39:42 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACCEAC06174A
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Apr 2021 01:39:31 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id p22so784514wmc.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 01:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hUQmUAZk2wCebXvuQSV5Wkz+ixKs6PIME7Dx3dRdP20=;
        b=cijLSs1vxRXjCFzqNFDw9Js0Afm9Fn7y05fVW2VcD3F/E/vCNj5QOiqqL51CTX2ueE
         H8Be0KUUP5xTIayV3snk6kLdDXTxiXZ8MmOlN1JtCh2BZ/0mydzee2FryeLqhAjqx/bP
         j6hRI4X8jgqHnM2NwT4dpouQTa0fYOTHcgGa7cKOFxxlohKB6Fx09TYmkUYCrhwez1vZ
         fIDOzELvxt59xLNCX+8Q5e7A7icsn0+kIKiExkU784mQUumPu8f/AcGttyhjl4TISYtj
         sfNosLNeLD+RBspGmrDZMb03ZjhG9nibxTnYPqaCgrkBQM4XD1L7JEGsIUyr7MAfrFZS
         2XGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hUQmUAZk2wCebXvuQSV5Wkz+ixKs6PIME7Dx3dRdP20=;
        b=i0Q9J5IxdrvUSH+rD6Vyd6z8ZiZD1K79svy7x2TGI/pGp5gALY3gQ2ytOgfUs/jezf
         +cGtoYJkJIyo8z0v6IJVMoZWCkJXiZWe1ca96V//SdsoELsBa6B1Y3FpYujXSWdn1sXp
         8EhKdXOix2lRN+ZkQNKFETDmGA0rRikFPPhtMDzetH5xhZE4S97os/N2dGkG6qoFjbI9
         fb9zo9XwHJXUPNLJAt691g5y36gxCBIWDAar3jOGH2X/ZzTMfSnuAbWddpftihpa859y
         X03rleXleycgA23iSUOoA9Ic5d+fl4VVoxhQPDMb4mr8S7NscT8GBSxRyUxROtGmMOgS
         ai5w==
X-Gm-Message-State: AOAM531veCRkncLo2+c/+vTGmS8wuW5zVdheqUQtk0vKKWo3xvAeT3ug
        rC2/AjB2ssdw78MU+tvSOmTnGWYEhnY=
X-Google-Smtp-Source: ABdhPJyqHbbO4UNp69LjqVCXgn76PH6mtiRUY6tCqAwEzSpP0XO08Ta+zRS4spdFqfKQek7D0BAGQA==
X-Received: by 2002:a05:600c:3325:: with SMTP id q37mr2081629wmp.45.1617784770157;
        Wed, 07 Apr 2021 01:39:30 -0700 (PDT)
Received: from [192.168.2.202] (pd9e5a581.dip0.t-ipconnect.de. [217.229.165.129])
        by smtp.gmail.com with ESMTPSA id h8sm37693938wrt.94.2021.04.07.01.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 01:39:29 -0700 (PDT)
Subject: Re: [PATCH] platform/surface: aggregator: move to use request_irq by
 IRQF_NO_AUTOEN flag
To:     Tian Tao <tiantao6@hisilicon.com>, hdegoede@redhat.com,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <1617778852-26492-1-git-send-email-tiantao6@hisilicon.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <8734116a-2da6-60fe-e8bf-e273a27205ac@gmail.com>
Date:   Wed, 7 Apr 2021 10:39:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1617778852-26492-1-git-send-email-tiantao6@hisilicon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 4/7/21 9:00 AM, Tian Tao wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable because of requesting.
> 
> this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
> is being merged: https://lore.kernel.org/patchwork/patch/1388765/
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Looks good to me.

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

Thanks,
Max

> ---
>   drivers/platform/surface/aggregator/controller.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
> index aa6f37b..00e3828 100644
> --- a/drivers/platform/surface/aggregator/controller.c
> +++ b/drivers/platform/surface/aggregator/controller.c
> @@ -2483,7 +2483,8 @@ int ssam_irq_setup(struct ssam_controller *ctrl)
>   	 * interrupt, and let the SAM resume callback during the controller
>   	 * resume process clear it.
>   	 */
> -	const int irqf = IRQF_SHARED | IRQF_ONESHOT | IRQF_TRIGGER_RISING;
> +	const int irqf = IRQF_SHARED | IRQF_ONESHOT |
> +			 IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN;
>   
>   	gpiod = gpiod_get(dev, "ssam_wakeup-int", GPIOD_ASIS);
>   	if (IS_ERR(gpiod))
> @@ -2501,7 +2502,6 @@ int ssam_irq_setup(struct ssam_controller *ctrl)
>   		return status;
>   
>   	ctrl->irq.num = irq;
> -	disable_irq(ctrl->irq.num);
>   	return 0;
>   }
>   
> 
