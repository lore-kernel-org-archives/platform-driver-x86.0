Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61923C433ED
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Apr 2021 09:01:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34FF261152
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Apr 2021 09:01:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235859AbhDQJBZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 17 Apr 2021 05:01:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50705 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229972AbhDQJBY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Apr 2021 05:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618650058;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iavCArchwV7RgiQPAM67ldgssKis2X2H1PDR7CgoWuw=;
        b=M6gtcGLIWDhkUkDcOEj3tfGIOpNio3YT5fjALQy9KZnxbhoDOndRe50YmF5IEz0C3dJgLP
        9RtAAhK6Ux/A+tZ2NqhJd1ILbK0efi97CiC0QxcABB/M40YtUFkrOi6HS2SSs5HGEAr+rw
        2qdXCPBsz+Ze+wYNAopRDj0dh3Z+clo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-YqdwR5j-MUOZ6_rBvddbmg-1; Sat, 17 Apr 2021 05:00:56 -0400
X-MC-Unique: YqdwR5j-MUOZ6_rBvddbmg-1
Received: by mail-ed1-f69.google.com with SMTP id l7-20020aa7c3070000b029038502ffe9f2so2633250edq.16
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Apr 2021 02:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iavCArchwV7RgiQPAM67ldgssKis2X2H1PDR7CgoWuw=;
        b=ttZgn/5RVhZk9bxlS+6hi8HncijtpjG/jvjejVObiiLK8030ePQSA/zclpP2MilMuP
         xO7kV97D6BPUPXFotx3eZ1uVPmbOMTgJVrnY5BpY4glDnYJ05m+QV5PSfwt6casQ7V9L
         FNH06xDN5WSJCPiykHUTAYbo45IYY00rXQuiBYY/nc1vyRbPMCcD/QsJlJv6RFRGsiTu
         psx5WmWGWn82j0i7EEyBOWbgRdX1lpGDYFHcc+cNpWHHq1jhoDQmkIHYVKiQ0xjfj4gI
         MBoZwznYMeiOQ1LKvX53RRzmjbcTGlJJq9ArrhmgXosAB6Ynhx4qgKpRue8tF8/RzrVL
         M/Xg==
X-Gm-Message-State: AOAM530CB0v69fpZx94/Drc405mBYGxPI671JKCOKk5q3/8to/FuYZOz
        89wzoPPmsBYWVBGR5RV9usBDxoqx+HNs0urEoRK1NrKvUXAUr2NBUP0SedEo33gNYy1vECKFSpP
        kjmGdVHHJIsjk9Du4TSoEeBIccqLCoztzgg==
X-Received: by 2002:a17:906:b156:: with SMTP id bt22mr8215892ejb.181.1618650055176;
        Sat, 17 Apr 2021 02:00:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbxonGH/xSU3qqYcwukU7crYKfSYUtFyCOSDuoHnb4ZvcDdfJox4dp/8dWcNt1AfEtBisK+A==
X-Received: by 2002:a17:906:b156:: with SMTP id bt22mr8215868ejb.181.1618650054872;
        Sat, 17 Apr 2021 02:00:54 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f13sm5872707ejb.33.2021.04.17.02.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Apr 2021 02:00:54 -0700 (PDT)
Subject: Re: [PATCH V2 5/9] platform/x86: intel_pmc_core: Get LPM requirements
 for Tiger Lake
To:     "David E. Box" <david.e.box@linux.intel.com>,
        irenic.rajneesh@gmail.com, mgross@linux.intel.com,
        gayatri.kammela@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210417031252.3020837-1-david.e.box@linux.intel.com>
 <20210417031252.3020837-6-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6dd84b65-44b4-ae12-fe84-c61d8efd43f3@redhat.com>
Date:   Sat, 17 Apr 2021 11:00:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210417031252.3020837-6-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/17/21 5:12 AM, David E. Box wrote:
> From: Gayatri Kammela <gayatri.kammela@intel.com>
> 
> Platforms that support low power modes (LPM) such as Tiger Lake maintain
> requirements for each sub-state that a readable in the PMC. However, unlike
> LPM status registers, requirement registers are not memory mapped but are
> available from an ACPI _DSM. Collect the requirements for Tiger Lake using
> the _DSM method and store in a buffer.
> 
> Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
> Co-developed-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> 
> V2:	- Move buffer allocation so that it does not need to be freed
> 	  (which was missing anyway) when an error is encountered.
> 	- Use label to free out_obj after errors
> 	- Use memcpy instead of memcpy_fromio for ACPI memory
> 
>  drivers/platform/x86/intel_pmc_core.c | 56 +++++++++++++++++++++++++++
>  drivers/platform/x86/intel_pmc_core.h |  2 +
>  2 files changed, 58 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 0e59a84b51bf..97efe9a6bd01 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -23,7 +23,9 @@
>  #include <linux/slab.h>
>  #include <linux/suspend.h>
>  #include <linux/uaccess.h>
> +#include <linux/uuid.h>
>  
> +#include <acpi/acpi_bus.h>
>  #include <asm/cpu_device_id.h>
>  #include <asm/intel-family.h>
>  #include <asm/msr.h>
> @@ -31,6 +33,9 @@
>  
>  #include "intel_pmc_core.h"
>  
> +#define ACPI_S0IX_DSM_UUID		"57a6512e-3979-4e9d-9708-ff13b2508972"
> +#define ACPI_GET_LOW_MODE_REGISTERS	1
> +
>  /* PKGC MSRs are common across Intel Core SoCs */
>  static const struct pmc_bit_map msr_map[] = {
>  	{"Package C2",                  MSR_PKG_C2_RESIDENCY},
> @@ -590,6 +595,53 @@ static const struct pmc_reg_map tgl_reg_map = {
>  	.etr3_offset = ETR3_OFFSET,
>  };
>  
> +static void pmc_core_get_tgl_lpm_reqs(struct platform_device *pdev)
> +{
> +	struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
> +	const int num_maps = pmcdev->map->lpm_num_maps;
> +	size_t lpm_size = LPM_MAX_NUM_MODES * num_maps * 4;

The type of lpm_size should be an u32, so that it matches
the type of out_obj->buffer.length.

> +	union acpi_object *out_obj;
> +	struct acpi_device *adev;
> +	guid_t s0ix_dsm_guid;
> +	u32 *lpm_req_regs, *addr;
> +
> +	adev = ACPI_COMPANION(&pdev->dev);
> +	if (!adev)
> +		return;
> +
> +	guid_parse(ACPI_S0IX_DSM_UUID, &s0ix_dsm_guid);
> +
> +	out_obj = acpi_evaluate_dsm(adev->handle, &s0ix_dsm_guid, 0,
> +				    ACPI_GET_LOW_MODE_REGISTERS, NULL);
> +	if (out_obj && out_obj->type == ACPI_TYPE_BUFFER) {
> +		int size = out_obj->buffer.length;

out_obj->buffer.length is an u32, please make this an u32 too.

> +
> +		if (size != lpm_size) {
> +			acpi_handle_debug(adev->handle,
> +				"_DSM returned unexpected buffer size,"
> +				" have %d, expect %ld\n", size, lpm_size);

And use %u here (twice), this should also fix the warnings reported
by the kernel test robot.

If there are no objections against the suggested changes, then I can
fix this up while merging this.

Please let me know if the suggested changes are ok with you.

Regards,

Hans


> +			goto free_acpi_obj;
> +		}
> +	} else {
> +		acpi_handle_debug(adev->handle,
> +				  "_DSM function 0 evaluation failed\n");
> +		goto free_acpi_obj;
> +	}
> +
> +	addr = (u32 *)out_obj->buffer.pointer;
> +
> +	lpm_req_regs = devm_kzalloc(&pdev->dev, lpm_size * sizeof(u32),
> +				     GFP_KERNEL);
> +	if (!lpm_req_regs)
> +		goto free_acpi_obj;
> +
> +	memcpy(lpm_req_regs, addr, lpm_size);
> +	pmcdev->lpm_req_regs = lpm_req_regs;
> +
> +free_acpi_obj:
> +	ACPI_FREE(out_obj);
> +}
> +
>  static inline u32 pmc_core_reg_read(struct pmc_dev *pmcdev, int reg_offset)
>  {
>  	return readl(pmcdev->regbase + reg_offset);
> @@ -1424,10 +1476,14 @@ static int pmc_core_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	mutex_init(&pmcdev->lock);
> +
>  	pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit(pmcdev);
>  	pmc_core_get_low_power_modes(pmcdev);
>  	pmc_core_do_dmi_quirks(pmcdev);
>  
> +	if (pmcdev->map == &tgl_reg_map)
> +		pmc_core_get_tgl_lpm_reqs(pdev);
> +
>  	/*
>  	 * On TGL, due to a hardware limitation, the GBE LTR blocks PC10 when
>  	 * a cable is attached. Tell the PMC to ignore it.
> diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
> index aa44fd5399cc..64fb368f40f6 100644
> --- a/drivers/platform/x86/intel_pmc_core.h
> +++ b/drivers/platform/x86/intel_pmc_core.h
> @@ -294,6 +294,7 @@ struct pmc_reg_map {
>   * @s0ix_counter:	S0ix residency (step adjusted)
>   * @num_lpm_modes:	Count of enabled modes
>   * @lpm_en_modes:	Array of enabled modes from lowest to highest priority
> + * @lpm_req_regs:	List of substate requirements
>   *
>   * pmc_dev contains info about power management controller device.
>   */
> @@ -310,6 +311,7 @@ struct pmc_dev {
>  	u64 s0ix_counter;
>  	int num_lpm_modes;
>  	int lpm_en_modes[LPM_MAX_NUM_MODES];
> +	u32 *lpm_req_regs;
>  };
>  
>  #define pmc_for_each_mode(i, mode, pmcdev)		\
> 

