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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF72C43461
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 14:28:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 506E161279
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 14:28:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352887AbhDGO2a (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:28:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38056 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1352879AbhDGO21 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 10:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617805697;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=US66opIuFghtCrRHnxkfqKefrAJrm1KUxts+rEbIoR8=;
        b=botkrnAMkeBAv4DFT/IcOfB0idyPRgAHf5CKxpJLuyOgElTcK/1VuuMiV58nBnztz5IajF
        wfL3/eBQWwKfQopbFZ4upmxwHqjWRjm9UH4qFdnjYn5yp2uJdFhBwHypcRUsWPeAj0zFLI
        sXhuE6rJ8tjOO4xBwXSUchl0vSr+kI4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-hSsVX9sKNuivmoxRR8I-kQ-1; Wed, 07 Apr 2021 10:28:16 -0400
X-MC-Unique: hSsVX9sKNuivmoxRR8I-kQ-1
Received: by mail-ej1-f71.google.com with SMTP id jt26so1179407ejc.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 07:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=US66opIuFghtCrRHnxkfqKefrAJrm1KUxts+rEbIoR8=;
        b=JEwfbpNKaQbD1g/j8KmEAiFt3hod/puDN8mmgyDrRhDodRmxkzGhrMpScegNAFB90G
         BActPvATOlRDUOSCCNb1kvOECH/9bci/KYGopMs+ud8pq9oC8+p8FIMScOCxPUETO+PS
         +Zcc1b7gFzY0/+YBuPw9+Wi3vrTsOwjFrxgFCrKC6hcFnIXjSt0cZMNsKY2dOVNaUuuh
         ywcwDvWx+Yg7IrPwtxQqT5e41jtjdFd30EL2plJ13jbFl1PKQvA9eyyPtnbGu6Qy/mMK
         8RlfOJ/rlrqv6xf41PwCj3xltZOg7KYG/kyAZlphJAbShnU/fCRMCL1tjIjx8KKGvSKx
         jMfA==
X-Gm-Message-State: AOAM530P/sUG6eckX2tB5o55V+g7o7IjPUzdfqMU8mW+6H5ucgKbApp5
        fqtm+UmMEetBNP/I74k9+1X+0NsiZDT9MMd8GBe02RnrMqrwyPgd7L4fkzZLIFx08+pd7gN3FTS
        F//sxF4IerJovofA8ZJY+aUyaJMKKiDd9Jw==
X-Received: by 2002:a17:906:3b81:: with SMTP id u1mr4167987ejf.49.1617805694264;
        Wed, 07 Apr 2021 07:28:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydZVaO/j7cbsNoIMCkW6nZtfibvW3PiRRUtRUJykxIbXCvuRLyfG8eYFYJHXnnegl4go5NlA==
X-Received: by 2002:a17:906:3b81:: with SMTP id u1mr4167970ejf.49.1617805694055;
        Wed, 07 Apr 2021 07:28:14 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w25sm10643508edq.66.2021.04.07.07.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 07:28:13 -0700 (PDT)
Subject: Re: [PATCH 6/9] platform/x86: intel_pmc_core: Add requirements file
 to debugfs
To:     "David E. Box" <david.e.box@linux.intel.com>,
        irenic.rajneesh@gmail.com, mgross@linux.intel.com,
        gayatri.kammela@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210401030558.2301621-1-david.e.box@linux.intel.com>
 <20210401030558.2301621-7-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f708fb0d-31ca-e81b-0131-21425c746d38@redhat.com>
Date:   Wed, 7 Apr 2021 16:28:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210401030558.2301621-7-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/1/21 5:05 AM, David E. Box wrote:
> From: Gayatri Kammela <gayatri.kammela@intel.com>
> 
> Add the debugfs file, substate_requirements, to view the low power mode
> (LPM) requirements for each enabled mode alongside the last latched status
> of the condition.
> 
> After this patch, the new file will look like this:
> 
>                     Element |    S0i2.0 |    S0i3.0 |    S0i2.1 |    S0i3.1 |    S0i3.2 |    Status |
>             USB2PLL_OFF_STS |  Required |  Required |  Required |  Required |  Required |           |
> PCIe/USB3.1_Gen2PLL_OFF_STS |  Required |  Required |  Required |  Required |  Required |           |
>        PCIe_Gen3PLL_OFF_STS |  Required |  Required |  Required |  Required |  Required |       Yes |
>             OPIOPLL_OFF_STS |  Required |  Required |  Required |  Required |  Required |       Yes |
>               OCPLL_OFF_STS |  Required |  Required |  Required |  Required |  Required |       Yes |
>             MainPLL_OFF_STS |           |  Required |           |  Required |  Required |           |
> 
> Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
> Co-developed-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/platform/x86/intel_pmc_core.c | 86 +++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 0ec26a4c715e..0b47a1da5f49 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -1122,6 +1122,86 @@ static int pmc_core_substate_l_sts_regs_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_ATTRIBUTE(pmc_core_substate_l_sts_regs);
>  
> +static void pmc_core_substate_req_header_show(struct seq_file *s)
> +{
> +	struct pmc_dev *pmcdev = s->private;
> +	int i, mode;
> +
> +	seq_printf(s, "%30s |", "Element");
> +	pmc_for_each_mode(i, mode, pmcdev)
> +		seq_printf(s, " %9s |", pmc_lpm_modes[mode]);
> +
> +	seq_printf(s, " %9s |\n", "Status");
> +}
> +
> +static int pmc_core_substate_req_regs_show(struct seq_file *s, void *unused)
> +{
> +	struct pmc_dev *pmcdev = s->private;
> +	const struct pmc_bit_map **maps = pmcdev->map->lpm_sts;
> +	const struct pmc_bit_map *map;
> +	const int num_maps = pmcdev->map->lpm_num_maps;
> +	u32 sts_offset = pmcdev->map->lpm_status_offset;
> +	u32 *lpm_req_regs = pmcdev->lpm_req_regs;
> +	int mp;
> +
> +	/* Display the header */
> +	pmc_core_substate_req_header_show(s);
> +
> +	/* Loop over maps */
> +	for (mp = 0; mp < num_maps; mp++) {
> +		u32 req_mask = 0;
> +		u32 lpm_status;
> +		int mode, idx, i, len = 32;
> +
> +		/*
> +		 * Capture the requirements and create a mask so that we only
> +		 * show an element if it's required for at least one of the
> +		 * enabled low power modes
> +		 */
> +		pmc_for_each_mode(idx, mode, pmcdev)
> +			req_mask |= lpm_req_regs[mp + (mode * num_maps)];
> +
> +		/* Get the last latched status for this map */
> +		lpm_status = pmc_core_reg_read(pmcdev, sts_offset + (mp * 4));
> +
> +		/*  Loop over elements in this map */
> +		map = maps[mp];
> +		for (i = 0; map[i].name && i < len; i++) {
> +			u32 bit_mask = map[i].bit_mask;
> +
> +			if (!(bit_mask & req_mask))
> +				/*
> +				 * Not required for any enabled states
> +				 * so don't display
> +				 */
> +				continue;
> +
> +			/* Display the element name in the first column */
> +			seq_printf(s, "%30s |", map[i].name);
> +
> +			/* Loop over the enabled states and display if required */
> +			pmc_for_each_mode(idx, mode, pmcdev) {
> +				if (lpm_req_regs[mp + (mode * num_maps)] & bit_mask)
> +					seq_printf(s, " %9s |",
> +						   "Required");
> +				else
> +					seq_printf(s, " %9s |", " ");
> +			}
> +
> +			/* In Status column, show the last captured state of this agent */
> +			if (lpm_status & bit_mask)
> +				seq_printf(s, " %9s |", "Yes");
> +			else
> +				seq_printf(s, " %9s |", " ");
> +
> +			seq_puts(s, "\n");
> +		}
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(pmc_core_substate_req_regs);
> +
>  static int pmc_core_pkgc_show(struct seq_file *s, void *unused)
>  {
>  	struct pmc_dev *pmcdev = s->private;
> @@ -1241,6 +1321,12 @@ static void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
>  				    pmcdev->dbgfs_dir, pmcdev,
>  				    &pmc_core_substate_l_sts_regs_fops);
>  	}
> +
> +	if (pmcdev->lpm_req_regs) {
> +		debugfs_create_file("substate_requirements", 0444,
> +				    pmcdev->dbgfs_dir, pmcdev,
> +				    &pmc_core_substate_req_regs_fops);
> +	}
>  }
>  
>  static const struct x86_cpu_id intel_pmc_core_ids[] = {
> 

