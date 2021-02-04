Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1251BC433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 16:26:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C737564E35
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 16:26:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237072AbhBDQ0W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 11:26:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35233 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237140AbhBDQZr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 11:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612455859;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WNwlKTDWoeqLyiAXQQIOfkUaFk/WLHzLd9vQiv5PVsU=;
        b=NkzKNWQYwyWxxCxBk9FIbdCF2PrKdJOVrpE8qu7vuOmkaArxxWH3fxtldEHspcjPyvZhiP
        l0wqbr8njDYkq1lQP5Z5I/w59DB3NrvsyhBK5Q0bHb5kpo0tJbUaCMCS0kAIQ78Wrc9k7l
        nQxDlR1k5QT0qrsScEjUoadiOC4yt9U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-u3I7FxM3Pxi83cNDUsOxCw-1; Thu, 04 Feb 2021 11:24:17 -0500
X-MC-Unique: u3I7FxM3Pxi83cNDUsOxCw-1
Received: by mail-ej1-f69.google.com with SMTP id le12so2938361ejb.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Feb 2021 08:24:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WNwlKTDWoeqLyiAXQQIOfkUaFk/WLHzLd9vQiv5PVsU=;
        b=mZ5Ii92xXuqMwl68Suex1jeNzU+94R/CRa2NXotMJzzZdpRHHmNiHBdc41rIi0Ney/
         lqc2+6E+1iCKEfm69EYgM4of8zm6A759m2QWJDTFhdk3+LtEVK8HGZhAWOpdLQKtmk4r
         EIcqgJaaUfu/XcVHkJIPCrVSxM9i7yISHZaP8Bm3/eCD57RXCARu6qn8Ng/IG6An5BGP
         Hzu5t+CaqkGGss9ZxpC1dHUJSiEqOjEP4uClZ0p0GBO2+7KkokapLHAjI+oQnHv/eBsE
         6lALA98o0ybOsHE8iJ/gNz6GQ+75PE+ZEyLEoJxx/JzI75stKP2jIEupcTeiLdLEYZkZ
         2JcA==
X-Gm-Message-State: AOAM532RjiRPeDu6IfB53FWFNHR9y6Do5HoNX9PNETRIHKyfmbK/3M+p
        PAk4VbqXbtPxns0DnEaLCvCJa/3lsHE417fJl95EtTUkVDgNCZ5FUM/btkwF3Ma2/JnrjAnSp6F
        YAXO+JRnMigKtOhrV1+Di89Vb+iv2zU77sw==
X-Received: by 2002:aa7:d15a:: with SMTP id r26mr8467643edo.29.1612455855717;
        Thu, 04 Feb 2021 08:24:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHvu1J/wIvXBEojQwfLAYuEXrORLTJLC0yLWW3OEy6kRZiOp9LGMFe1wS52PlkMhfgcJGwSg==
X-Received: by 2002:aa7:d15a:: with SMTP id r26mr8467626edo.29.1612455855524;
        Thu, 04 Feb 2021 08:24:15 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id jg33sm2586403ejc.103.2021.02.04.08.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 08:24:15 -0800 (PST)
Subject: Re: [PATCH v1] platform/x86: intel_scu_wdt: Drop mistakenly added
 const
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>
References: <20210204150508.62659-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a5fe50e4-2d8a-10e4-5d12-c3e79e14561f@redhat.com>
Date:   Thu, 4 Feb 2021 17:24:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210204150508.62659-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/4/21 4:05 PM, Andy Shevchenko wrote:
> Neither original structure nor platform_data is declared with const.
> Drop mistakenly added const when assing platform_data.
> 
> Fixes: a507e5d90f3d ("platform/x86: intel_scu_wdt: Get rid of custom x86 model comparison")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

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
>  drivers/platform/x86/intel_scu_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_scu_wdt.c b/drivers/platform/x86/intel_scu_wdt.c
> index 85ee85ca2215..c2479777a1d6 100644
> --- a/drivers/platform/x86/intel_scu_wdt.c
> +++ b/drivers/platform/x86/intel_scu_wdt.c
> @@ -63,7 +63,7 @@ static int __init register_mid_wdt(void)
>  	if (!id)
>  		return -ENODEV;
>  
> -	wdt_dev.dev.platform_data = (const struct intel_mid_wdt_pdata *)id->driver_data;
> +	wdt_dev.dev.platform_data = (struct intel_mid_wdt_pdata *)id->driver_data;
>  	return platform_device_register(&wdt_dev);
>  }
>  arch_initcall(register_mid_wdt);
> 

