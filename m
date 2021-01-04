Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3D5C433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 11:45:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 246E821E92
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 11:45:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbhADLpu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 06:45:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27512 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726098AbhADLpu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 06:45:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609760663;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pPiMxxoNkQ6ZHTSM1btO2xUPHHtV2xXd0B6j0p3+I7w=;
        b=hHxtKWnaqXTBxa+zi22DwnyaLF3oCoiXLQr1ZxXbzAG20ahd27gqtT/NdGhL8uV+iGO8Ap
        Kn+RmTDpMDb0d1+PzV4A9gVWMBh4iTE4Hck4Ijq1qTc+hCgTbTUzHnGGpgQBZxDwNo3ZGA
        B4En24Sk4MS8WyhWLYQ1L4UQ8pGmErM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235--aaXkA5cORmcj_AZ36dD1g-1; Mon, 04 Jan 2021 06:44:21 -0500
X-MC-Unique: -aaXkA5cORmcj_AZ36dD1g-1
Received: by mail-ed1-f70.google.com with SMTP id i15so12054865edx.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jan 2021 03:44:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pPiMxxoNkQ6ZHTSM1btO2xUPHHtV2xXd0B6j0p3+I7w=;
        b=nBhs/mbj/ihiGV8vz9wRZu6uo+/sQF6PEBVjIwKTfvx6/7fAPzpdoE8bp4hIz/63Ft
         pAZZ02ygbU9XVmvkc70ekDhlr3XFnMvFPeX+E80OvyIxshWghyY7iBrqTtCX8TamJ0hb
         QKIEPutg9Z1VRlXGoDvNLoNoJ0WfXf71KUBBEZU+m8KlpMFgtdWANUJY1HC5pXEp3LXb
         IrEF+FhDzlR/IONJuxdh/nqx1JD4v6Yr8vi52ose/0jXWf+Ido2j3hSkj7kt5JZHM4Ut
         +XR1eNjdM3GRJGg3kwP+Hjso1GBT5Bf8Yum1cr8KDd9WopeU/maWgf0f6LG7DiHRMtmR
         Prsw==
X-Gm-Message-State: AOAM5323pjDbUtoKoJ4n4aul4LYsi1UFj3yOQHxfFwMZ3NkFa6w0Gp4e
        4kXfl4P9UO9zosT/Hc+9Ot7Y/pnmLxnWhP3ZWBmgqC3tfwxsTBEy2pUO/r7HeHHRnOy6lUrBMO7
        i9zculJsgnhjmQf0Pz/rpFbgpIcVmIj1dTK3aXI8oPJGVM3kN4dPdRI02yq7gC0j8+JCsn8xswb
        ICfB6zoCWCMw==
X-Received: by 2002:a17:906:17d5:: with SMTP id u21mr50809912eje.109.1609760660608;
        Mon, 04 Jan 2021 03:44:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS5cFYXDS2dnZf/FPMSarPHzP6kT1MrfLii3KZrmVND8GnmkwWpEQnJCsg3HblC8jkUnrzgQ==
X-Received: by 2002:a17:906:17d5:: with SMTP id u21mr50809891eje.109.1609760660434;
        Mon, 04 Jan 2021 03:44:20 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id ho34sm23097652ejc.13.2021.01.04.03.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 03:44:19 -0800 (PST)
Subject: Re: [PATCH v2 -next] platform: surface: fix non-PM_SLEEP build
 warnings
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20201214233336.19782-1-rdunlap@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e85b0067-6128-b078-d9b4-843f5b2c1a54@redhat.com>
Date:   Mon, 4 Jan 2021 12:44:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201214233336.19782-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/15/20 12:33 AM, Randy Dunlap wrote:
> Fix build warnings when CONFIG_PM_SLEEP is not enabled and these
> functions are not used:
> 
> ../drivers/platform/surface/surface_gpe.c:189:12: warning: ‘surface_gpe_resume’ defined but not used [-Wunused-function]
>  static int surface_gpe_resume(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~
> ../drivers/platform/surface/surface_gpe.c:184:12: warning: ‘surface_gpe_suspend’ defined but not used [-Wunused-function]
>  static int surface_gpe_suspend(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~~
> 
> Fixes: 274335f1c557 ("platform/surface: Add Driver to set up lid GPEs on MS Surface device")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Maximilian Luz <luzmaximilian@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: platform-driver-x86@vger.kernel.org
> ---
> v2: dropped Maximilian's RVB tag since the patch changed
>     use preferred __maybe_unused instead of ifdeffery:
>       https://lore.kernel.org/patchwork/patch/732981/


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

> 
>  drivers/platform/surface/surface_gpe.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-next-20201214.orig/drivers/platform/surface/surface_gpe.c
> +++ linux-next-20201214/drivers/platform/surface/surface_gpe.c
> @@ -181,12 +181,12 @@ static int surface_lid_enable_wakeup(str
>  	return 0;
>  }
>  
> -static int surface_gpe_suspend(struct device *dev)
> +static int __maybe_unused surface_gpe_suspend(struct device *dev)
>  {
>  	return surface_lid_enable_wakeup(dev, true);
>  }
>  
> -static int surface_gpe_resume(struct device *dev)
> +static int __maybe_unused surface_gpe_resume(struct device *dev)
>  {
>  	return surface_lid_enable_wakeup(dev, false);
>  }
> 

