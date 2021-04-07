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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD5EC43461
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 14:37:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F40861260
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 14:37:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344756AbhDGOha (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:37:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39863 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235011AbhDGOh3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 10:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617806240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZIh9LnPRWOKWMUH2GMP8qgYRkYqYnNn3FD3hyiy76Kw=;
        b=if5xNk9qAj2/LbFYVqxzFDBOo6D7iPmgR2R/GjupGb/CSIY0xg4sieLTJq62h6Op3qZkjZ
        XbBHnK2lKtEMINkgeYwByTMcvPOg4g4heeHRngxJT1F8EPVZ065fXkMXp7OceMItcobLL/
        W/2KYPunoGm74aQH9hH5qqgYYde7e8o=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-_Uem30RhMnqBJq9evpkpOg-1; Wed, 07 Apr 2021 10:37:16 -0400
X-MC-Unique: _Uem30RhMnqBJq9evpkpOg-1
Received: by mail-ej1-f72.google.com with SMTP id jx20so3431499ejc.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 07:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZIh9LnPRWOKWMUH2GMP8qgYRkYqYnNn3FD3hyiy76Kw=;
        b=V31Dz1a9ete2B9crqeS+nporFCYiuNYqV/ep6n+U1M8DSiRMhNLttURJu0FSAAV19V
         /+RqkrMikvrUWQnFqKZmJ0Vlz2mio6IICX8s0Bg4nySS3gGXFFHQdA4VUlLBeu+4INLu
         TOsKOXyEWro6GSGwbKgi7y7OgQ3FGvC9/al0T/81BzoJJqTPpmDtLPkSDhWGmTpijiMl
         UkqUleIYq+4shFqgrngIJmxUdCiOMSjxvhnb0z+sugVAB4B0BBRZRKRtpWS9J1CZzSde
         j5ERWU+tdfeIOz/JCQfbktNrQmvkn7Ey5FAC9Tmbjlut7r2SigBerNLS2MiLvABuHFWq
         sEFQ==
X-Gm-Message-State: AOAM5309r/VJMK2oWbBIjaZimqa2lAD1e0dHRYU0T95hN5q+6s1SnJxe
        nGJJjUb3mXGg3c/d0lDUk7m53FfJm1MgqDv/o3vlpuFC8Y0T+ZFNgPQqtkwBbA3vWZ9v6O4GsPB
        L+sLNbXPxaHyB82Jmv0gNWr1qV4Yh/JF2Kw==
X-Received: by 2002:a17:907:929:: with SMTP id au9mr4028342ejc.28.1617806235176;
        Wed, 07 Apr 2021 07:37:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJiVA75N7bHYsPEfNxaiDP+VUc92wXevE3tuNaIEq2Ls2Fu94hFx9ywlElf/WKBmONAOIeUw==
X-Received: by 2002:a17:907:929:: with SMTP id au9mr4028323ejc.28.1617806234932;
        Wed, 07 Apr 2021 07:37:14 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q6sm2453966ejt.51.2021.04.07.07.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 07:37:14 -0700 (PDT)
Subject: Re: [PATCH 7/9] platform/x86: intel_pmc_core: Add option to set/clear
 LPM mode
To:     "David E. Box" <david.e.box@linux.intel.com>,
        irenic.rajneesh@gmail.com, mgross@linux.intel.com,
        gayatri.kammela@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210401030558.2301621-1-david.e.box@linux.intel.com>
 <20210401030558.2301621-8-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bc8f42ab-7664-4f5e-d9b0-1cf474c21ea2@redhat.com>
Date:   Wed, 7 Apr 2021 16:37:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210401030558.2301621-8-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/1/21 5:05 AM, David E. Box wrote:
> By default the Low Power Mode (LPM or sub-state) status registers will
> latch condition status on every entry into Package C10. This is
> configurable in the PMC to allow latching on any achievable sub-state. Add
> a debugfs file to support this.
> 
> Also add the option to clear the status registers to 0. Clearing the status
> registers before testing removes ambiguity around when the current values
> were set.
> 
> The new file, latch_lpm_mode, looks like this:
> 
> 	[c10] S0i2.0 S0i3.0 S0i2.1 S0i3.1 S0i3.2 clear
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel_pmc_core.c | 94 +++++++++++++++++++++++++++
>  drivers/platform/x86/intel_pmc_core.h | 20 ++++++
>  2 files changed, 114 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 0b47a1da5f49..458c0056e7a1 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -584,6 +584,8 @@ static const struct pmc_reg_map tgl_reg_map = {
>  	.ltr_ignore_max = TGL_NUM_IP_IGN_ALLOWED,
>  	.lpm_num_maps = TGL_LPM_NUM_MAPS,
>  	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
> +	.etr3_offset = TGL_ETR3_OFFSET,
> +	.lpm_sts_latch_en_offset = TGL_LPM_STS_LATCH_EN_OFFSET,
>  	.lpm_en_offset = TGL_LPM_EN_OFFSET,
>  	.lpm_priority_offset = TGL_LPM_PRI_OFFSET,
>  	.lpm_residency_offset = TGL_LPM_RESIDENCY_OFFSET,
> @@ -1202,6 +1204,95 @@ static int pmc_core_substate_req_regs_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_ATTRIBUTE(pmc_core_substate_req_regs);
>  
> +static int pmc_core_lpm_latch_mode_show(struct seq_file *s, void *unused)
> +{
> +	struct pmc_dev *pmcdev = s->private;
> +	bool c10;
> +	u32 reg;
> +	int idx, mode;
> +
> +	reg = pmc_core_reg_read(pmcdev, pmcdev->map->lpm_sts_latch_en_offset);
> +	if (reg & BIT(LPM_STS_LATCH_MODE_BIT)) {
> +		seq_puts(s, "c10");
> +		c10 = false;
> +	} else {
> +		seq_puts(s, "[c10]");
> +		c10 = true;
> +	}
> +
> +	pmc_for_each_mode(idx, mode, pmcdev) {
> +		if ((BIT(mode) & reg) && !c10)
> +			seq_printf(s, " [%s]", pmc_lpm_modes[mode]);
> +		else
> +			seq_printf(s, " %s", pmc_lpm_modes[mode]);
> +	}

So this either shows [c10] selected, or it shows which s0ix modes
are selected, that is a bit weird.

I realize this is a debugfs interface, but can we still get some docs
in this, at a minimum some more explanation in the commit message ?


> +
> +	seq_puts(s, " clear\n");
> +
> +	return 0;
> +}
> +
> +static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
> +					     const char __user *userbuf,
> +					     size_t count, loff_t *ppos)
> +{
> +	struct seq_file *s = file->private_data;
> +	struct pmc_dev *pmcdev = s->private;
> +	bool clear = false, c10 = false;
> +	unsigned char buf[10] = {0};
> +	size_t ret;
> +	int mode;
> +	u32 reg;
> +
> +	ret = simple_write_to_buffer(buf, 10, ppos, userbuf, count);
> +	if (ret < 0)
> +		return ret;

You are using C-string functions on buf below, so you must guarantee
that it is 0 terminated. To guarantee the buffer's size must be 1 larger
then the size which you pass to simple_write_to_buffer()

> +
> +	mode = sysfs_match_string(pmc_lpm_modes, buf);
> +	if (mode < 0) {
> +		if (strncmp("clear", buf, 5) == 0)
> +			clear = true;
> +		else if (strncmp("c10", buf, 3) == 0)
> +			c10 = true;

Ugh, no. Now it will not just accept "clear" and "clear\n" but
also "clear foobar everything else I write now does not matter"
as "clear" string. This misuse of strncmp for sysfs / debugfs write
functions seems to be some sort of anti-pattern in the kernel.

Please use sysfs_streq() here so that only "clear" and "clear\n"
are accepted (and the same for the "c10" check).



> +		else
> +			return mode;
> +	}
> +
> +	if (clear) {
> +		mutex_lock(&pmcdev->lock);
> +
> +		reg = pmc_core_reg_read(pmcdev, pmcdev->map->etr3_offset);
> +		reg |= BIT(ETR3_CLEAR_LPM_EVENTS_BIT);
> +		pmc_core_reg_write(pmcdev, pmcdev->map->etr3_offset, reg);
> +
> +		mutex_unlock(&pmcdev->lock);
> +
> +		return count;
> +	}
> +
> +	if (c10) {
> +		mutex_lock(&pmcdev->lock);
> +
> +		reg = pmc_core_reg_read(pmcdev, pmcdev->map->lpm_sts_latch_en_offset);
> +		reg &= ~BIT(LPM_STS_LATCH_MODE_BIT);
> +		pmc_core_reg_write(pmcdev, pmcdev->map->lpm_sts_latch_en_offset, reg);
> +
> +		mutex_unlock(&pmcdev->lock);
> +
> +		return count;
> +	}
> +
> +	/*
> +	 * For LPM mode latching we set the latch enable bit and selected mode
> +	 * and clear everything else.
> +	 */
> +	reg = BIT(LPM_STS_LATCH_MODE_BIT) | BIT(mode);
> +	pmc_core_reg_write(pmcdev, pmcdev->map->lpm_sts_latch_en_offset, reg);
> +
> +	return count;
> +}
> +DEFINE_PMC_CORE_ATTR_WRITE(pmc_core_lpm_latch_mode);
> +
>  static int pmc_core_pkgc_show(struct seq_file *s, void *unused)
>  {
>  	struct pmc_dev *pmcdev = s->private;
> @@ -1320,6 +1411,9 @@ static void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
>  		debugfs_create_file("substate_live_status_registers", 0444,
>  				    pmcdev->dbgfs_dir, pmcdev,
>  				    &pmc_core_substate_l_sts_regs_fops);
> +		debugfs_create_file("lpm_latch_mode", 0644,
> +				    pmcdev->dbgfs_dir, pmcdev,
> +				    &pmc_core_lpm_latch_mode_fops);
>  	}
>  
>  	if (pmcdev->lpm_req_regs) {
> diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
> index 81d797feed33..f41f61aa7008 100644
> --- a/drivers/platform/x86/intel_pmc_core.h
> +++ b/drivers/platform/x86/intel_pmc_core.h
> @@ -189,6 +189,8 @@ enum ppfear_regs {
>  
>  #define LPM_MAX_NUM_MODES			8
>  #define GET_X2_COUNTER(v)			((v) >> 1)
> +#define ETR3_CLEAR_LPM_EVENTS_BIT		28
> +#define LPM_STS_LATCH_MODE_BIT			31
>  
>  #define TGL_NUM_IP_IGN_ALLOWED			22
>  #define TGL_PMC_SLP_S0_RES_COUNTER_STEP		0x7A
> @@ -197,6 +199,8 @@ enum ppfear_regs {
>  /*
>   * Tigerlake Power Management Controller register offsets
>   */
> +#define TGL_ETR3_OFFSET				0x1048
> +#define TGL_LPM_STS_LATCH_EN_OFFSET		0x1C34
>  #define TGL_LPM_EN_OFFSET			0x1C78
>  #define TGL_LPM_RESIDENCY_OFFSET		0x1C80
>  
> @@ -266,6 +270,8 @@ struct pmc_reg_map {
>  	/* Low Power Mode registers */
>  	const int lpm_num_maps;
>  	const int lpm_res_counter_step_x2;
> +	const u32 etr3_offset;
> +	const u32 lpm_sts_latch_en_offset;
>  	const u32 lpm_en_offset;
>  	const u32 lpm_priority_offset;
>  	const u32 lpm_residency_offset;
> @@ -313,4 +319,18 @@ struct pmc_dev {
>  	     i < pmcdev->num_modes;			\
>  	     i++, mode = pmcdev->lpm_en_modes[i])
>  
> +#define DEFINE_PMC_CORE_ATTR_WRITE(__name)				\
> +static int __name ## _open(struct inode *inode, struct file *file)	\
> +{									\
> +	return single_open(file, __name ## _show, inode->i_private);	\
> +}									\
> +									\
> +static const struct file_operations __name ## _fops = {			\
> +	.owner		= THIS_MODULE,					\
> +	.open		= __name ## _open,				\
> +	.read		= seq_read,					\
> +	.write		= __name ## _write,				\
> +	.release	= single_release,				\
> +}
> +
>  #endif /* PMC_CORE_H */
> 

Regards,

Hans

