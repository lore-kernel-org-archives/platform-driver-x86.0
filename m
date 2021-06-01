Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BA2C4708F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Jun 2021 12:09:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C99860FE3
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Jun 2021 12:09:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhFAML1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Jun 2021 08:11:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21440 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231201AbhFAML0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Jun 2021 08:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622549385;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OsXAm0jFsmBYTsBvOwGqk3GC8A+f9Cg7DIDbyX5aisA=;
        b=WkOpVs9oX9/mBSIW84z0JA2vJ177i6wRUpucRkaToqlTrcST+gxOupviJlIhoriP1e3DGh
        A4xAo7ncx2P2efOozsYZXFWz2K1lhPymJSMKYLLiGqo+XIND/Ln0toaHiOLWbBjpVxoxYj
        NQvXp7ILfzVRXe51ZvcJCjJHPwU3oUk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-NRzPkdrmPWGlx9qXE1IFew-1; Tue, 01 Jun 2021 08:09:43 -0400
X-MC-Unique: NRzPkdrmPWGlx9qXE1IFew-1
Received: by mail-ej1-f71.google.com with SMTP id eb10-20020a170907280ab02903d65bd14481so3223433ejc.21
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Jun 2021 05:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OsXAm0jFsmBYTsBvOwGqk3GC8A+f9Cg7DIDbyX5aisA=;
        b=DYJ+ABXyl3xLPoGkmGjK5SVmhYEi6z9473CYt3K4WvBsDFt/0Ib6GpSAepbk17xKCE
         whlT1GCQN2Fkyl6afpTzFLnCwz6C0o2vbmDBMzTegPbDJtfrYCbBGDQixgTJmaWdR4wP
         zfb/Tl4hJWZhP81SV4JEoHckq2FpBzFwAaiCYezh3wa05ZvhvWtn6uH45ZWCy0iplWz5
         GvW2tzPy9IrE7gYEpOrDQtz2Rgs2Q6mby+aoEzOk8G+P3mvt0dMenc99FZVEzPQa/+x5
         bKZYq17t2tEVEbRaPY08XR50xInwqCh+xkUqucPUhXppH4SZBmKLPglxJrbc+Sfkp2C4
         mQPA==
X-Gm-Message-State: AOAM533HX68x4CUzEeTOHLgLfDUA/EpvCovi4YTTCZH3GkJBKyMfe27/
        COgvH2nRqx1Iff2XqOPZ3ANRn1AFXH6hngvVW74WmdVwXaZHu5pXjwn43OJ8YN54KD+M9DJBdN5
        U+vONAH8t55EUKG13DKKlmIRXLI5C5Cc40+sxjUgdGg9q4FzcBQsVz6fWmKYGfqEKp6YAaf6vjg
        gFYlOEAXjGUw==
X-Received: by 2002:aa7:c545:: with SMTP id s5mr18681206edr.113.1622549382291;
        Tue, 01 Jun 2021 05:09:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVI3dpC91TspVw56Hw1/b9Ahox8SDTvz91VRhKmZvm6Uz5gzajO17yJOveC0FKYyL+RIugCw==
X-Received: by 2002:aa7:c545:: with SMTP id s5mr18681183edr.113.1622549382118;
        Tue, 01 Jun 2021 05:09:42 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bv17sm7087535ejb.37.2021.06.01.05.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 05:09:41 -0700 (PDT)
Subject: Re: [PATCH platform] platform/mellanox: mlxreg-hotplug: remove
 IRQF_NO_AUTOEN flag from request_irq
To:     Mykola Kostenok <c_mykolak@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210601111744.2247071-1-c_mykolak@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3986919a-45b0-7cde-acbe-26877c7525ab@redhat.com>
Date:   Tue, 1 Jun 2021 14:09:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601111744.2247071-1-c_mykolak@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/1/21 1:17 PM, Mykola Kostenok wrote:
> This flag causes mlxreg-hotplug probing failure after flag "IRQF_NO_AUTOEN"
> has been added to:
> 	err = devm_request_irq(&pdev->dev, priv->irq,
> 			       mlxreg_hotplug_irq_handler, IRQF_TRIGGER_FALLING
> 			       | IRQF_SHARED | IRQF_NO_AUTOEN,
> 			       "mlxreg-hotplug", priv);


Right, but if you look at commit bee3ecfed0fc9 ("platform/mellanox: mlxreg-hotplug:
move to use request_irq by IRQF_NO_AUTOEN flag") then that also removes a

disable_irq(priv->irq);

Immediately after this call, if the IRQF_NO_AUTOEN flag is going to be dropped
then that call should be re-added. In cases like this it is usually better to
just do a git revert of the offending patch, that would have also re-added
the disable_irq() call. Also see below.

> This is because request_threaded_irq() returns EINVAL due to true value of
> condition:
> ((irqflags & IRQF_SHARED) && (irqflags & IRQF_NO_AUTOEN))

Is the IRQF_SHARED flag really necessary though ? IOW is the IRQ actually
shared?  If it is really shared then the disable_irq() call will also block
the irq for other users of the irq. Drivers which are properly coded to share
interrupts should thus avoid using disable_irq().  But often the IRQF_SHARED
flag has just been copied from other code without the IRQ actually being
shared.

Please check if the IRQF_SHARED flag is really necessary and if it is not
necessary, please drop that instead.

Regards,

Hans




> Fixes: bee3ecfed0fc9 ("platform/mellanox: mlxreg-hotplug: move to use request_irq by IRQF_NO_AUTOEN flag")
> Signed-off-by: Mykola Kostenok <c_mykolak@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/platform/mellanox/mlxreg-hotplug.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index a9db2f32658f..07706f0a6d77 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -683,8 +683,7 @@ static int mlxreg_hotplug_probe(struct platform_device *pdev)
>  
>  	err = devm_request_irq(&pdev->dev, priv->irq,
>  			       mlxreg_hotplug_irq_handler, IRQF_TRIGGER_FALLING
> -			       | IRQF_SHARED | IRQF_NO_AUTOEN,
> -			       "mlxreg-hotplug", priv);
> +			       | IRQF_SHARED, "mlxreg-hotplug", priv);
>  	if (err) {
>  		dev_err(&pdev->dev, "Failed to request irq: %d\n", err);
>  		return err;
> 

