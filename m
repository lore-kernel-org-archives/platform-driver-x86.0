Return-Path: <SRS0=2mT5=DG=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70481C4346E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Sep 2020 09:51:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B80020897
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Sep 2020 09:51:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KM7/B/44"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgI2JvK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Sep 2020 05:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgI2JvK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Sep 2020 05:51:10 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C47C0613D0
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2020 02:51:10 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id t17so1468758wmi.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2020 02:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=g//3YKslqEEjdWy4bFstcnviEz8Yjtvb1bJDuqH9QfE=;
        b=KM7/B/44Z4zZq5f25gu+hF+LJFGIUg+P2fUBeUj31s75he1XhFefiaqsnnrlYkEFQ1
         qJF4E8TJvsIRWLsP1Ra7PniO2iEO3rnrIHT8/KB3j6xPXEiuEtTbKIX9KvB1WP2mMfTc
         t5kgcG+AFHBgATTCK9oQ2AWJ7Ca424ekWbBz5tkuVdZ/UowL0pD7jdR8kTp9dICsvXuX
         pn2K7X7tX3UeHUw3smf+XFRXrGtOaB8tyjOmeDw+nCqqEMPpWqX6kv8ash9LWYI9cZmz
         3f/O2uzLqSrhixsOZJJM76YcK0eiOLfENJnMrowexKiRY5DtI0xob7XM7JeCPgt38Mwn
         7l7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=g//3YKslqEEjdWy4bFstcnviEz8Yjtvb1bJDuqH9QfE=;
        b=Y7nPVK8rsmDpaX/BqCwWXPXTeHLbgcqJyTs3faDw+WYihO1MGY2SnAdEF+PAKQduim
         UH83I0o1qkNS0P/cYCadox+ya8YTjNoEvwO+gohf8io627iZmGA6Zs/5TousuBB+FZQi
         +ncyl7fIFiN2aK9njZCFNHSC0OaJMrAjSuOS7bmd4iH2S4Ni1RHmOMrkuEprZEUDvBUf
         O+DOttZ9+85/l6L4wV0pkEraW1sG3lGoVbLNJZe7WXJkuaMJ0slZQNqLbpnbwY1PnmAt
         LIMPrONlKxa0BAE7/2BxtHv3p6FVIVBM15yEZxH2VWxWoILf76b6GvSqPLEd1EbPbhH3
         uKyQ==
X-Gm-Message-State: AOAM532VSa5KSpIJh4tMK0S216S8KB+ZixnkhBablBV1DIZ3/z4eGcVI
        1ZUT/1w0jVpGL0hcQ0RIFNo69A==
X-Google-Smtp-Source: ABdhPJwCbmhF47JEAgld/dSPUltKiEKJn903XuyqkTkNAIZrfNzJbuSsAWeQttI0/PP713UsXqfi0g==
X-Received: by 2002:a1c:ed19:: with SMTP id l25mr3654659wmh.49.1601373068677;
        Tue, 29 Sep 2020 02:51:08 -0700 (PDT)
Received: from dell ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id r21sm6040568wrc.70.2020.09.29.02.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 02:51:07 -0700 (PDT)
Date:   Tue, 29 Sep 2020 10:51:06 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     "David E. Box" <david.e.box@linux.intel.com>
Cc:     dvhart@infradead.org, andy@infradead.org,
        alexander.h.duyck@linux.intel.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/3] mfd: intel_pmt: Add OOBMSM device ID
Message-ID: <20200929095106.GG6148@dell>
References: <20200911194549.12780-1-david.e.box@linux.intel.com>
 <20200911194549.12780-2-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200911194549.12780-2-david.e.box@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 11 Sep 2020, David E. Box wrote:

> Add Out of Band Management Services Module device ID to Intel PMT driver.
> 
> Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/mfd/intel_pmt.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mfd/intel_pmt.c b/drivers/mfd/intel_pmt.c
> index 0e572b105101..8f9970ab3026 100644
> --- a/drivers/mfd/intel_pmt.c
> +++ b/drivers/mfd/intel_pmt.c
> @@ -55,6 +55,8 @@ struct pmt_platform_info {
>  	unsigned long quirks;
>  };
>  
> +static const struct pmt_platform_info pmt_info;
> +
>  static const struct pmt_platform_info tgl_info = {
>  	.quirks = PMT_QUIRK_NO_WATCHER | PMT_QUIRK_NO_CRASHLOG |
>  		  PMT_QUIRK_TABLE_SHIFT,
> @@ -200,8 +202,10 @@ static void pmt_pci_remove(struct pci_dev *pdev)
>  	pm_runtime_get_sync(&pdev->dev);
>  }
>  
> +#define PCI_DEVICE_ID_INTEL_PMT_OOBMSM	0x09a7
>  #define PCI_DEVICE_ID_INTEL_PMT_TGL	0x9a0d
>  static const struct pci_device_id pmt_pci_ids[] = {
> +	{ PCI_DEVICE_DATA(INTEL, PMT_OOBMSM, &pmt_info) },

Why are you supplying an empty struct?

>  	{ PCI_DEVICE_DATA(INTEL, PMT_TGL, &tgl_info) },
>  	{ }
>  };

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
