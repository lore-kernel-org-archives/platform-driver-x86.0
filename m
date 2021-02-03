Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A4CC433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 11:02:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0F3E64F5D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 11:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233983AbhBCLCa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 06:02:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50429 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234015AbhBCLCM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 06:02:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612350045;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KCSa5lqIenqXIlAmv/dn1kl+bMnIGvCEYfxXgplOIfQ=;
        b=NIrYr+sRw9L+2TbiyNr2v+cHIUYdCvK9vhYOngPDTNerkOL2Di0BG3H1gWHhP6w85VnpRL
        Z8w2MAdCm1Ij9nonBCnJDmP1Y5qHxGzWftm7u/8gcKy00RSC8DoIYYFSECTvIPnpr4tymf
        FGSSyhO98/mfUDR8AHkd40F45s/WCKU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-hko1UIIpOaelVSmEJJWKww-1; Wed, 03 Feb 2021 06:00:44 -0500
X-MC-Unique: hko1UIIpOaelVSmEJJWKww-1
Received: by mail-ed1-f71.google.com with SMTP id x13so11255214edi.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Feb 2021 03:00:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KCSa5lqIenqXIlAmv/dn1kl+bMnIGvCEYfxXgplOIfQ=;
        b=tHKVizPpcLfO9LpDLbsX45EHxaNqpVO+KqixXbOxZIFO+wsf7nue+RBP56jt7UXqnX
         cwdWsDOBdFv73uq/FYuF64C5Wap27trZuWYr65ciRO06K7Yj8/zeQoNY/8sAkc63DuOg
         7sPSSFEw9cRoXeW7Hp24vmi/1hODvWxJlLagN5S/k+md2KWcewW0NiDSr2G9vYSK9yRz
         dzwKbQu9Y8K4St5AdzIMhCd80cposJufKWfc3CpQof6hA5gqs7Mnzfej36W061CGh+pC
         1nsm/wVROFml1/ztmjFMnLv8yg+qOEqZlWTHr1VhKAST+VQB6dilc/WjM+zZhojki5QL
         2UCg==
X-Gm-Message-State: AOAM530Yk9ukmMwC/81wPjFSaDeoe7gZM4Oh9schfEOkwl1BvOgf1v7N
        zdu4Bq0jejzEZ/E1t0YEk+zDpzPUMEd2UQ0dmxI15CsUOcST+vWyCzgEqIf/tk7XpFdF1UXy6jc
        zQ5OAcC0o3lqo5XAZk75QRcKV2xTVZYE+PiQ1H2ox4zalLeGCFoNsOrkgQcSq63joNdlTakOM0W
        vcc943sBkFtQ==
X-Received: by 2002:a50:ed97:: with SMTP id h23mr2241504edr.278.1612350042578;
        Wed, 03 Feb 2021 03:00:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5+OLXqPmoxWdsM1P7jww7AASC6rqlBrL6Li9Bsi+Nns3QzJxI3XuY/Za7MZ3bU6D7ahLeWA==
X-Received: by 2002:a50:ed97:: with SMTP id h23mr2241475edr.278.1612350042396;
        Wed, 03 Feb 2021 03:00:42 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id t19sm840389ejc.62.2021.02.03.03.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 03:00:41 -0800 (PST)
Subject: Re: [PATCH 1/3] platform/x86: intel_pmt: Make INTEL_PMT_CLASS
 non-user-selectable
To:     "David E. Box" <david.e.box@linux.intel.com>, mark.gross@intel.com,
        lee.jones@linaro.org, torvalds@linux-foundation.org
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20210126205508.30907-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ac6d173d-370f-1f91-a004-b3fe0ade79b1@redhat.com>
Date:   Wed, 3 Feb 2021 12:00:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126205508.30907-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/26/21 9:55 PM, David E. Box wrote:
> Fix error in Kconfig that exposed INTEL_PMT_CLASS as a user selectable
> option. It is already selected by INTEL_PMT_TELEMETRY and
> INTEL_PMT_CRASHLOG which are user selectable.
> 
> Fixes: e2729113ce66 ("platform/x86: Intel PMT class driver")
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
>  drivers/platform/x86/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 91e6176cdfbd..af75c3342c06 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1369,7 +1369,7 @@ config INTEL_PMC_CORE
>  		- MPHY/PLL gating status (Sunrisepoint PCH only)
>  
>  config INTEL_PMT_CLASS
> -	tristate "Intel Platform Monitoring Technology (PMT) Class driver"
> +	tristate
>  	help
>  	  The Intel Platform Monitoring Technology (PMT) class driver provides
>  	  the basic sysfs interface and file hierarchy uses by PMT devices.
> 

