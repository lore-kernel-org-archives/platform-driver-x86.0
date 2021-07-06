Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFD0C07E96
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 09:59:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8B78619A0
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 09:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhGFKCO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Jul 2021 06:02:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47295 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231181AbhGFKCN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jul 2021 06:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625565574;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t0F8HLqx/NFeFMdJaqc4Zso3jHTaEnVE2a3bJY2UWzY=;
        b=SgLrbkg29dAbEAaI3sY3YBOn8YmElfLmIvPulBlAZdMRv/QV67G6WgQgU26w6bTH70IlxT
        rXaaXKvPz4Ot3vK/d4pvbDVJg4Qta2bce9ztro9pDY/firH6O/9xWXnP9JC84KoMJldk9i
        ou/KqvE1cBH+QIWQLIXZTo6TLSra+bs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-TWU3-IDBO6SrPb6GuiVKUQ-1; Tue, 06 Jul 2021 05:59:33 -0400
X-MC-Unique: TWU3-IDBO6SrPb6GuiVKUQ-1
Received: by mail-ed1-f69.google.com with SMTP id z5-20020a05640235c5b0290393974bcf7eso10507241edc.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jul 2021 02:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t0F8HLqx/NFeFMdJaqc4Zso3jHTaEnVE2a3bJY2UWzY=;
        b=G0zM1aiLzeVkbgtUPrb/ymLnJ90OxPkUL55pNDVdKDRV4JZXcpMgMaGKDVPD4yzE59
         O4QgwqpwIquHLJzECio7H003gofk7N6LsofftBOMED5PvRq86JXEq0CN5cBpgQOROMSy
         u5fOwGTwm9eEmmYWZeCpCsYVuqcG9xdzIn6OA1Svumf/ckBH2WDrblUT/xM8tnaM8lSK
         lrYLx5p/xX1DYNJWDqVgKydAa7IFAKJewDxAZhFiFwz4CWD5ht0VX2pR67uIil6z3b0D
         6beRKt+eGaH1WVXs4+PcpiKY+SbDk0Otr+iBTHNVr12nuJk27xzSVA7z19h/HcdsZ8H6
         ePIA==
X-Gm-Message-State: AOAM530gNjw8xrefYvfPu5BohwUeaXpQiyaFUcpCZYdVtLc7G53QigIo
        paTDlaaYMYpv798Pt9Ve5dB3X/JyL/HHFrlKGm9iPpkad8kk3JR7GbCMTlVyiX9lOyH1/NdeHaD
        f8Jts8TxN6fAJ6+FXf9QfJxMc/HKBetQ387qD/n5nSEupUVFeBIX3kPsepQNN1aeOf1x7jihrIj
        GaeSHP49XlZQ==
X-Received: by 2002:a17:906:c156:: with SMTP id dp22mr3640023ejc.525.1625565571819;
        Tue, 06 Jul 2021 02:59:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZeiuO5/Lhr0wb8+pkAiIwXLAPugsxCNE7fmRUXql4qVYwHxNlcSgoKX8T+DVtklVTObm3Tw==
X-Received: by 2002:a17:906:c156:: with SMTP id dp22mr3639994ejc.525.1625565571528;
        Tue, 06 Jul 2021 02:59:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id m18sm6980973edv.82.2021.07.06.02.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 02:59:31 -0700 (PDT)
Subject: Re: [PATCH v5 2/7] platform/x86: amd-pmc: Fix SMU firmware reporting
 mechanism
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        mgross@linux.intel.com, rrangel@chromium.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20210629084803.248498-1-Shyam-sundar.S-k@amd.com>
 <20210629084803.248498-3-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <16bba3fe-22b3-8d99-c96d-ad3c635648ce@redhat.com>
Date:   Tue, 6 Jul 2021 11:59:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629084803.248498-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/29/21 10:47 AM, Shyam Sundar S K wrote:
> It was lately understood that the current mechanism available in the
> driver to get SMU firmware info works only on internal SMU builds and
> there is a separate way to get all the SMU logging counters (addressed
> in the next patch). Hence remove all the smu info shown via debugfs as it
> is no more useful.
> 
> Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v2: split into multiple patches as suggested by Hans
> v3: No change
> v4: No change
> v5: NO change

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> 
>  drivers/platform/x86/amd-pmc.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 1b5f149932c1..b1d6175a13b2 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -52,7 +52,6 @@
>  #define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
>  #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
>  
> -#define AMD_SMU_FW_VERSION		0x0
>  #define PMC_MSG_DELAY_MIN_US		100
>  #define RESPONSE_REGISTER_LOOP_MAX	200
>  
> @@ -89,11 +88,6 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
>  #ifdef CONFIG_DEBUG_FS
>  static int smu_fw_info_show(struct seq_file *s, void *unused)
>  {
> -	struct amd_pmc_dev *dev = s->private;
> -	u32 value;
> -
> -	value = ioread32(dev->smu_base + AMD_SMU_FW_VERSION);
> -	seq_printf(s, "SMU FW Info: %x\n", value);
>  	return 0;
>  }
>  DEFINE_SHOW_ATTRIBUTE(smu_fw_info);
> @@ -280,10 +274,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	pci_dev_put(rdev);
>  	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
>  
> -	dev->smu_base = devm_ioremap(dev->dev, base_addr, AMD_PMC_MAPPING_SIZE);
> -	if (!dev->smu_base)
> -		return -ENOMEM;
> -
>  	dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
>  				    AMD_PMC_MAPPING_SIZE);
>  	if (!dev->regbase)
> 

