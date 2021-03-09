Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BF0C433DB
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Mar 2021 16:45:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDDB96523C
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Mar 2021 16:45:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbhCIQpX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Mar 2021 11:45:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbhCIQpJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Mar 2021 11:45:09 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83477C06175F
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 Mar 2021 08:45:09 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id d15so16972736wrv.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Mar 2021 08:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HQAapd2VYff0FVMH+At0UuE1zM/4LNj6vNP0aGstbj4=;
        b=f7i6/zFL5uCo6uPBWoKGpNHNJRsNwgOhsJ8NP0zJqHE/fIYYt7SzSCqGlzOChkykzL
         rEh+Vix2cdfJL5JqvUXCB91eeqObk4nSKwOhx7CpRliLDuE3hrr+g2mfkOtKpzdIJOZy
         J6dycplUlG4YnjIigvDTQ0qWsrDAmDW0BNDPjrDicjkWDn25UODM7uW0iEQRUzxEl9tc
         Xwddm4Q+wljabinj9dJyQIfQ0WDO4jdzGDk9hGl2oiOkSlFE8jgd1LL2CIEnxN9OYZEg
         pWahPXl+XiV8ERvLl/qz+F3NFKC9+Q0RXVVCa2SmWG7gUaQnSgmVU/kgqlogCjqBBZP0
         mN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HQAapd2VYff0FVMH+At0UuE1zM/4LNj6vNP0aGstbj4=;
        b=cvNM7qHrnF74ve01QBCtfOHXvfJjgCAVN4BBCW2tM7TU1BfMi2jgpLuBDiWMzDUWgq
         vpcejA5cEP+9/Hv+XXwhBukDk6gjoR4cNOi2wDLduub2OMM8W+k1tFnMYt44zltNTxwA
         D+hFTiFYCzKUKcimmFtkDBYBQDyA4b3BjKrboJO8GwTnLSWx4sDRsbzf/agNl0kA4oW1
         RbtuqjuDdE7wu5lCCJgA0wYa1M0+wEndOx3gOnY5ooaIZcBgVZBqPteBeXnd+7IJuvq0
         eD1V+1chpTDGU+18uvHTVVg+/trU9dJsQRKSpQviXVbPTDh9mscy9F/MjQqXsRRWKuCf
         R4cw==
X-Gm-Message-State: AOAM531YGnrPquotMQG91ug4hW/JyoyMXUZ+QjpIQpkWyBFPMIDn/Msz
        j4T1rUWDIXhvIEZzn3rQczPSXQ==
X-Google-Smtp-Source: ABdhPJwDMP0K8mu7QTzWcY95OMns2CzLD9V4ndIZmXoVoRCvUj1IsCW1jpwW4Fn0nQRg0y8YkoPfgQ==
X-Received: by 2002:a05:6000:221:: with SMTP id l1mr29124435wrz.370.1615308308069;
        Tue, 09 Mar 2021 08:45:08 -0800 (PST)
Received: from dell ([91.110.221.192])
        by smtp.gmail.com with ESMTPSA id u23sm4908290wmn.26.2021.03.09.08.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:45:07 -0800 (PST)
Date:   Tue, 9 Mar 2021 16:45:05 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "David E. Box" <david.e.box@linux.intel.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2 V2] MFD: intel_pmt: Add support for DG1
Message-ID: <20210309164505.GS4931@dell>
References: <20210128172846.99352-1-david.e.box@linux.intel.com>
 <20210224201005.1034005-2-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210224201005.1034005-2-david.e.box@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 24 Feb 2021, David E. Box wrote:

> Adds PMT Telemetry aggregator support for the DG1 graphics PCIe card. The
> device does not have the DVSEC region in its PCI config space so hard
> code the discovery table data in the driver. Also requires a fix for DG1
> in the Telemetry driver for how the ACCESS_TYPE field is used.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> Based on 5.11-rc1 review-hans branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
> 
> Changes from V1:
> 
> 	- New patch
> 
>  drivers/mfd/intel_pmt.c                    | 101 +++++++++++++++------
>  drivers/platform/x86/intel_pmt_class.c     |  46 ++++++++++
>  drivers/platform/x86/intel_pmt_class.h     |   1 +
>  drivers/platform/x86/intel_pmt_telemetry.c |  20 ----
>  4 files changed, 119 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/mfd/intel_pmt.c b/drivers/mfd/intel_pmt.c
> index 65da2b17a204..dd7eb614c28e 100644
> --- a/drivers/mfd/intel_pmt.c
> +++ b/drivers/mfd/intel_pmt.c
> @@ -49,10 +49,14 @@ enum pmt_quirks {
>  
>  	/* Use shift instead of mask to read discovery table offset */
>  	PMT_QUIRK_TABLE_SHIFT	= BIT(2),
> +
> +	/* DVSEC not present (provided in driver data) */
> +	PMT_QUIRK_NO_DVSEC	= BIT(3),
>  };
>  
>  struct pmt_platform_info {
>  	unsigned long quirks;
> +	struct intel_dvsec_header **capabilities;
>  };
>  
>  static const struct pmt_platform_info tgl_info = {
> @@ -60,6 +64,26 @@ static const struct pmt_platform_info tgl_info = {
>  		  PMT_QUIRK_TABLE_SHIFT,
>  };
>  
> +/* DG1 Platform with DVSEC quirk*/
> +static struct intel_dvsec_header dg1_telemetry = {
> +	.length = 0x10,
> +	.id = 2,
> +	.num_entries = 1,
> +	.entry_size = 3,
> +	.tbir = 0,
> +	.offset = 0x466000,
> +};
> +
> +static struct intel_dvsec_header *dg1_capabilities[] = {
> +	&dg1_telemetry,
> +	NULL
> +};
> +
> +static const struct pmt_platform_info dg1_info = {
> +	.quirks = PMT_QUIRK_NO_DVSEC,
> +	.capabilities = dg1_capabilities,
> +};
> +
>  static int pmt_add_dev(struct pci_dev *pdev, struct intel_dvsec_header *header,
>  		       unsigned long quirks)
>  {
> @@ -147,37 +171,54 @@ static int pmt_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	if (info)
>  		quirks = info->quirks;
>  
> -	do {
> -		struct intel_dvsec_header header;
> -		u32 table;
> -		u16 vid;
> +	if (info && (info->quirks & PMT_QUIRK_NO_DVSEC)) {

Nit: Why not use 'quirks' from a few lines above?

> +		struct intel_dvsec_header **header;

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
