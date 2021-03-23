Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF879C433E0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 20:59:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B771361994
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 20:59:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbhCWU7Q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Mar 2021 16:59:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28973 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233443AbhCWU65 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Mar 2021 16:58:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616533136;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fQBO+u481DlzoGNQ69nNMTbn2tlelS5FZZUNirAyOj4=;
        b=HmeERUksi1snZiMl4uDXIYopVvqldk5d1dApI+OEV810vewhappX/4UsKKEhjIm90gpRcg
        JIQFGA2UDNuQjQKrKMm94LyW8cJt9eimCrM6nX8ousfue7OS28XqwKxzEWzKCx39GB/GUr
        H9T0ZbNEngeKzigUgYFC0DVLiXbNh3I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-YgeOBc_TPTefkdHUCIVEVQ-1; Tue, 23 Mar 2021 16:58:52 -0400
X-MC-Unique: YgeOBc_TPTefkdHUCIVEVQ-1
Received: by mail-ed1-f71.google.com with SMTP id q12so1568696edv.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Mar 2021 13:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fQBO+u481DlzoGNQ69nNMTbn2tlelS5FZZUNirAyOj4=;
        b=PTLVDPVgH9tuF8aByAFOhcJAcUTPgJo/CMb1Q5+wbs2K95f37Zi/vWsnlj0ZHwp11I
         EChQy6xGpKsaBwaTNfYHQdzfEbVOyOPYEb2Che2Fqpq12jZI5WsuLbBMgzquJBZfOz8m
         6hMp7ZMmg0fGKo4ONPwQORmtytb8dpm/0MpFy3nLV8WgvF/lo902kE1iYxFQbfVj5RD7
         SFclwklsybo6mw+R7L7XsHp3ssJIbUmSB5mJs3Cm7XArf5BllCkhfIVQtWBZF0ZCRy1m
         +LwNOdUmItxU46CnwOpFYUcPlrf3DKbVchYr3zpIwH0rucZiU61yDCqiCfu9ugujhwo+
         kpYQ==
X-Gm-Message-State: AOAM5307LyxAespEu3TT7EvxNEIXyaASG2Tt57Q6qEiB3g6R/WnKzckB
        MWaqACy+L/8S7FK93xV3/4RirqGspTAsy9BgYMHGOo71JPWDYKLKg1aLNSzK1ERTa6kWa3G6tGW
        YA9aj2kvlqn0KeomYEvI/Cm/l1LPA/pMb3w==
X-Received: by 2002:a05:6402:375:: with SMTP id s21mr6390699edw.287.1616533131642;
        Tue, 23 Mar 2021 13:58:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKsqe20kZE+DFpcsbQKUpdRPl2U5AN4NySfbhaqdMoaLK+U8RZaTHXlZLNRxug8MwfPPGMwg==
X-Received: by 2002:a05:6402:375:: with SMTP id s21mr6390693edw.287.1616533131537;
        Tue, 23 Mar 2021 13:58:51 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v25sm73057edr.18.2021.03.23.13.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 13:58:51 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: asus-wmi: Add param to turn fn-lock mode
 on by default
To:     Luca Stefani <luca.stefani.ge1@gmail.com>
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210323202505.141496-1-luca.stefani.ge1@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <097b8aff-70f4-bd0f-e561-60a773b3231c@redhat.com>
Date:   Tue, 23 Mar 2021 21:58:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323202505.141496-1-luca.stefani.ge1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/23/21 9:25 PM, Luca Stefani wrote:
> * On recent ZenBooks the fn-lock is disabled
>   by default on boot while running Windows.
> 
> * Add a module param ( fnlock_default ) that allows
>   changing the default at probe time
> 
> Signed-off-by: Luca Stefani <luca.stefani.ge1@gmail.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 9ca15f724343..f3ed72f01462 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -47,6 +47,9 @@ MODULE_AUTHOR("Corentin Chary <corentin.chary@gmail.com>, "
>  MODULE_DESCRIPTION("Asus Generic WMI Driver");
>  MODULE_LICENSE("GPL");
>  
> +static bool fnlock_default = false;

The initial value of this needs to be true, so that there is no behavioral
change when people upgrade from a kernel without this to one with it.

And then people who want a different behavior can get that by setting
the module option.

Regards,

Hans


> +module_param(fnlock_default, bool, 0444);
> +
>  #define to_asus_wmi_driver(pdrv)					\
>  	(container_of((pdrv), struct asus_wmi_driver, platform_driver))
>  
> @@ -2673,7 +2676,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2, NULL);
>  
>  	if (asus_wmi_has_fnlock_key(asus)) {
> -		asus->fnlock_locked = true;
> +		asus->fnlock_locked = fnlock_default;
>  		asus_wmi_fnlock_update(asus);
>  	}
>  
> 

