Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BED1C4743D
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 19:59:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 529F2613AD
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 19:59:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhFDUAw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Jun 2021 16:00:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58715 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229913AbhFDUAv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Jun 2021 16:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622836745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MeLCbWGLPbKpwD68tQRInvLh8X7i6mG8txZCfwrNhsE=;
        b=BLwxp5BQ895KRNTmv9TsAS4wsU0xDOy6Ij78TwvcQ2c5f5ksyF1EWLxT3b8Y/9RqNkro0J
        tp6tlawdOILCUhFVYe006xBR4q9Z4ghs1EFplYloW4PCOd73uUanjNkwTByxlrz9g/3CA4
        jZx9Bc7Ew86IDmT8IT1QyX2B8KTyov8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-HLAcuq5_MhGnklFOmAVINQ-1; Fri, 04 Jun 2021 15:59:03 -0400
X-MC-Unique: HLAcuq5_MhGnklFOmAVINQ-1
Received: by mail-ed1-f70.google.com with SMTP id c12-20020aa7d60c0000b029038fccdf4390so5553786edr.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Jun 2021 12:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MeLCbWGLPbKpwD68tQRInvLh8X7i6mG8txZCfwrNhsE=;
        b=aHB7uzVPFhuPKmR2u/ooCfc1WihynM0HC5a587B8p8XlZd/qHSlA+iKDDOrX1ey4sJ
         lVklUVEHoArxPKoIqEPnp0H4nq8baoRG8FpIbbQChE8uIjMvQWZ1TnLkinh1tPJTNF3M
         OzI3rV3W+qkSA+S89zIlvEB2tVbw5lGK7UyYK2uj5iOofvwh1G6ILXaZRp/8tAyS/RFb
         o/CaBrpKxZg7O75WWFeq/75MqE5LkZeUrRQcTjmSXdEnPcwbKNHBzE9hz1eYkhSZROhy
         ZiPD9YnKRFFfUrgyOfY9KHdMoH2Iioo+QsU6wBjnAk+8xBSYAVvpzUpXqe0gN5rBuJ8h
         P4aQ==
X-Gm-Message-State: AOAM530/HIGMwjPT7/UIDlUyVCRUfk8xl8Ahc/z479tcQbuMeYO5Vw3v
        44/5NDmpNAlwGjO3Q4GdUL8clcSrK5I0IW0cKSsv8+sAua5qj5Kag8hIYProbbDd2ZVhI7C2wT1
        GWcJ8mPHmQjcmp0gCH3zNSi2ykKBuS5oagQ==
X-Received: by 2002:aa7:db94:: with SMTP id u20mr6420912edt.381.1622836741845;
        Fri, 04 Jun 2021 12:59:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCWYtmHTyeLIePKKHV8313kgSgqiwqzJrgp9dOWmUpD2dDzIRQO38I9R3M0juIJaKUD+tUDA==
X-Received: by 2002:aa7:db94:: with SMTP id u20mr6420900edt.381.1622836741612;
        Fri, 04 Jun 2021 12:59:01 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gg22sm1743002ejb.114.2021.06.04.12.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 12:59:01 -0700 (PDT)
Subject: Re: [PATCH platform] Revert "platform/mellanox: mlxreg-hotplug: move
 to use request_irq by IRQF_NO_AUTOEN flag"
To:     Mykola Kostenok <c_mykolak@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org, vadimp@nvidia.com
References: <20210603172827.2599908-1-c_mykolak@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <df6f26d5-4bf4-499a-0249-da6f2202fdf2@redhat.com>
Date:   Fri, 4 Jun 2021 21:59:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603172827.2599908-1-c_mykolak@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/3/21 7:28 PM, Mykola Kostenok wrote:
> It causes mlxreg-hotplug probing failure: request_threaded_irq()
>  returns -EINVAL due to true value of condition:
> ((irqflags & IRQF_SHARED) && (irqflags & IRQF_NO_AUTOEN))
> after flag "IRQF_NO_AUTOEN" has been added to:
> 	err = devm_request_irq(&pdev->dev, priv->irq,
> 			       mlxreg_hotplug_irq_handler, IRQF_TRIGGER_FALLING
> 			       | IRQF_SHARED | IRQF_NO_AUTOEN,
> 			       "mlxreg-hotplug", priv);
> 
> This reverts commit bee3ecfed0fc9ad104722c501aac1e892b53d1e3.
> 
> Signed-off-by: Mykola Kostenok <c_mykolak@nvidia.com>
> Acked-by: Vadim Pasternak <vadimp@nvidia.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I'll also add this to the fixes branch, so that it gets included
in my next pull-req to Linus for 5.13.

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/mellanox/mlxreg-hotplug.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index a9db2f32658f..b013445147dd 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -683,13 +683,13 @@ static int mlxreg_hotplug_probe(struct platform_device *pdev)
>  
>  	err = devm_request_irq(&pdev->dev, priv->irq,
>  			       mlxreg_hotplug_irq_handler, IRQF_TRIGGER_FALLING
> -			       | IRQF_SHARED | IRQF_NO_AUTOEN,
> -			       "mlxreg-hotplug", priv);
> +			       | IRQF_SHARED, "mlxreg-hotplug", priv);
>  	if (err) {
>  		dev_err(&pdev->dev, "Failed to request irq: %d\n", err);
>  		return err;
>  	}
>  
> +	disable_irq(priv->irq);
>  	spin_lock_init(&priv->lock);
>  	INIT_DELAYED_WORK(&priv->dwork_irq, mlxreg_hotplug_work_handler);
>  	dev_set_drvdata(&pdev->dev, priv);
> 

