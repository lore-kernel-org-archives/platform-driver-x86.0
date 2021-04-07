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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10817C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 18:05:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2C786124C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 18:05:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355091AbhDGSFz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 14:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38194 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1355081AbhDGSFw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 14:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617818742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HCDkqCYnJxGUuUtQmGkwyhAWJmV1TUUYv2tjynhld48=;
        b=IcYAnD58mg/Z9IfWYUd1L8iRS2DZv5cyCg8L1JHFJi6SZLdCT1GBgego37nH/BZjtiQtOL
        hq8Uq4nDR+TG4Bb4w2jlJxgO7izx7aL6eWqwT/VK3fodnV9N4IuyYCpe2DrBfTgwo3iKuE
        cS0qq1hma2LSi+gSFGuWKGya1bnvPH0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-I9C0LuYbN46_Bpo6YmgIXA-1; Wed, 07 Apr 2021 14:05:41 -0400
X-MC-Unique: I9C0LuYbN46_Bpo6YmgIXA-1
Received: by mail-ej1-f72.google.com with SMTP id k26so3638616ejs.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 11:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HCDkqCYnJxGUuUtQmGkwyhAWJmV1TUUYv2tjynhld48=;
        b=QMXl+U5F0oQvfi0rly25gmwZGGdN8AYUGbcDTTvTu4Y6Mgp+h5RvIWwWJmPT0MlbqD
         dA7UGFvtp6hWBKzXlc1gQ8sOr31dpONpEQ8xh0I0wD9iKS0qXBxVhGKdJ9Fsgxkbf1Dj
         0lg5e8yyj+cM+pi9BpwhfNqqjAf13hgMmurgv647RLWtlTOrkINHQbtbvJcLRTbWEmc8
         TpazOjihlFFZiZyIeKHW9xvwClzjiDE7kSIrnaysEpnaS/WB6BKhiPp8fpvcaG3ZgBZN
         jeakhtLmhUOlvIdXBcD9wqDBwi0UAblMkMUuYOJ4TV3c9QCI/PBNwlITBJ3cPdfOIKls
         ZFVQ==
X-Gm-Message-State: AOAM5305CKUSAQ+s0CuKP19V1XsI3nGulNgEtmWjf9O8h0EQdvT7tGIj
        lvgBfWN0r8lhW7LwHSO5ZHeultMJtecgn21P13cnoq9O57pvoRvq3DcCGTv0gWdWdbzkH0kyYJP
        VQItzYB4eG+Bx2R1no535g/oImMPWem7jIxmnCHWZP45ChHMQmjYTQEFv9aTq5QdfrzrhO/TjXi
        laubrHpKfIiQ==
X-Received: by 2002:a17:906:6a94:: with SMTP id p20mr5281317ejr.68.1617818739113;
        Wed, 07 Apr 2021 11:05:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRxZ3LqWPHWimTBaIr8XgJMia+dB78Xizlucq5H7kzCswGJ/djHFGwGZRV9j+k7816VND+kw==
X-Received: by 2002:a17:906:6a94:: with SMTP id p20mr5281288ejr.68.1617818738866;
        Wed, 07 Apr 2021 11:05:38 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k8sm756786edr.75.2021.04.07.11.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 11:05:38 -0700 (PDT)
Subject: Re: [PATCH] platform/mellanox: mlxreg-hotplug: move to use
 request_irq by IRQF_NO_AUTOEN flag
To:     Tian Tao <tiantao6@hisilicon.com>, mgross@linux.intel.com,
        vadimp@nvidia.com
Cc:     platform-driver-x86@vger.kernel.org
References: <1617785983-28878-1-git-send-email-tiantao6@hisilicon.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <40909c51-da6b-d43a-f4fc-5d0455d9b7c2@redhat.com>
Date:   Wed, 7 Apr 2021 20:05:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1617785983-28878-1-git-send-email-tiantao6@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/7/21 10:59 AM, Tian Tao wrote:
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
>  drivers/platform/mellanox/mlxreg-hotplug.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index b013445..a9db2f3 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -683,13 +683,13 @@ static int mlxreg_hotplug_probe(struct platform_device *pdev)
>  
>  	err = devm_request_irq(&pdev->dev, priv->irq,
>  			       mlxreg_hotplug_irq_handler, IRQF_TRIGGER_FALLING
> -			       | IRQF_SHARED, "mlxreg-hotplug", priv);
> +			       | IRQF_SHARED | IRQF_NO_AUTOEN,
> +			       "mlxreg-hotplug", priv);
>  	if (err) {
>  		dev_err(&pdev->dev, "Failed to request irq: %d\n", err);
>  		return err;
>  	}
>  
> -	disable_irq(priv->irq);
>  	spin_lock_init(&priv->lock);
>  	INIT_DELAYED_WORK(&priv->dwork_irq, mlxreg_hotplug_work_handler);
>  	dev_set_drvdata(&pdev->dev, priv);
> 

