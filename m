Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2F1C11F65
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Jun 2021 10:15:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD04061992
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Jun 2021 10:15:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbhF3KRt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Jun 2021 06:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbhF3KRt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Jun 2021 06:17:49 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16C5C06175F
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Jun 2021 03:15:20 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id r3so1668416wmq.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Jun 2021 03:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jCUHrJaEEJ46pB1LIjbjvddaNQwUj6Ic7ood0wzvbnc=;
        b=Wcjj4CqC4RwGvfYdrP3dJsn8XvbsUgpMtW9YzGDuLOZ68PxwRBLxCZGus0RHsQrgK0
         uB9fdPhR+ggYUvA65aTLp23R0vWnhgbt3zj6Ev4Kj4UhHHyJIh7jvTZyQ+0cTlodZHhi
         fd9JLexv2DLXorweD2WdupRq//si6SD380e3SVjmf3+SpHsCirMD2dF5W0AOjNIPhu8f
         FkAkV9pvvichUNsuoc9MjuCC7oXSLjv1Jsa7lfcf/blKlXG36MzUwCgqIM9wlxQ+HBuy
         kJRI7dlmx0IHpm40rQEHAeCbImumuY2LOLqvSmwKcd1ZHJnQp3UrI7ecBUkBHI4/mHmg
         ht6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jCUHrJaEEJ46pB1LIjbjvddaNQwUj6Ic7ood0wzvbnc=;
        b=TCqT7G8iy06WnnmKhOD6HGYVn/CnWQAnL0WMjaG+UaZcZBZqcjw/45T5V8Cc7hNq2w
         gitFhBbOYKgfylU+KZtXQCMAfRBfmbIDsUZfhzlnBrhG4T2HmL1HwEDWXgu8w3qpTHvC
         V2YLwXsYOS6kFo3ec0OneK2/4Dk5hd8r/p9TbYHhNDrVPwPaxKb1JQuK1BrZRJUDXOeq
         8EKOA6mIjD61vwD/xnTk/lVMlQWJrEIfnHM/TeUmuhVBkG82XFa6U3WTVFJJcqMdzyJk
         22mbfHSKXTNMnpE/MJv8oZa9OgLRrP7Q/F9wVqzos7NBNKngAc3rktQOG463zoOTNNgc
         5ARg==
X-Gm-Message-State: AOAM530v0HWMII3uVSGL1hdgQdRAZQlCOHu91ymu9ZUyzy7DNNFE7WOo
        AjWJsjj+LmOmDaNXEotCAEu7+A==
X-Google-Smtp-Source: ABdhPJxSnHYrm1V3d1t/xao5mg2USW7uU/bK6ILGnLOxAnjG2x0ak+iEi3iqHAOl9Q0ngGTllpnMhQ==
X-Received: by 2002:a1c:98cd:: with SMTP id a196mr5294727wme.150.1625048119145;
        Wed, 30 Jun 2021 03:15:19 -0700 (PDT)
Received: from dell ([95.144.13.171])
        by smtp.gmail.com with ESMTPSA id q19sm5645930wmc.44.2021.06.30.03.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 03:15:18 -0700 (PDT)
Date:   Wed, 30 Jun 2021 11:15:16 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     "David E. Box" <david.e.box@linux.intel.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com, bhelgaas@google.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/4] MFD: intel_pmt: Remove OOBMSM device
Message-ID: <YNxENGGctLXmifzj@dell>
References: <20210617215408.1412409-1-david.e.box@linux.intel.com>
 <20210617215408.1412409-3-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210617215408.1412409-3-david.e.box@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 17 Jun 2021, David E. Box wrote:

> Unlike the other devices in intel_pmt, the Out of Band Management Services
> Module (OOBMSM) is actually not a PMT dedicated device. It can also be used
> to describe non-PMT capabilities. Like PMT, these capabilities are also
> enumerated using PCIe Vendor Specific registers in config space. In order
> to better support these devices without the confusion of a dependency on
> MFD_INTEL_PMT, remove the OOBMSM device from intel_pmt so that it can be
> later placed in its own driver. Since much of the same code will be used by
> intel_pmt and the new driver, create a new file with symbols to be used by
> both.
> 
> While performing this split we need to also handle the creation of platform
> devices for the non-PMT capabilities. Currently PMT devices are named by
> their capability (e.g. pmt_telemetry). Instead, generically name them by
> their capability ID (e.g. intel_extnd_cap_2). This allows the IDs to be
> created automatically.  However, to ensure that unsupported devices aren't
> created, use an allow list to specify supported capabilities.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  MAINTAINERS                                |   1 +
>  drivers/mfd/Kconfig                        |   4 +
>  drivers/mfd/Makefile                       |   1 +
>  drivers/mfd/intel_extended_caps.c          | 208 +++++++++++++++++++++

Please consider moving this <whatever this is> out to either
drivers/pci or drivers/platform/x86.

I suggest Andy should also be on Cc.

>  drivers/mfd/intel_extended_caps.h          |  40 ++++
>  drivers/mfd/intel_pmt.c                    | 198 ++------------------
>  drivers/platform/x86/intel_pmt_crashlog.c  |   2 +-
>  drivers/platform/x86/intel_pmt_telemetry.c |   2 +-
>  8 files changed, 270 insertions(+), 186 deletions(-)
>  create mode 100644 drivers/mfd/intel_extended_caps.c
>  create mode 100644 drivers/mfd/intel_extended_caps.h

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
