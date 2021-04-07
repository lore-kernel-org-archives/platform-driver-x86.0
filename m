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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8D3C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 14:23:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37B2861074
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 14:23:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348408AbhDGOXc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:23:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36103 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234346AbhDGOXc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 10:23:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617805402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SXz0LSYnn7tD4zJ0WOLI+LMaY9g3slT4szwbB9fYP4A=;
        b=WeSkR4lMuE8r+6v503bmlstyiPxy23Hx9m1g6/CwxFKJF+SfhhuEY0wigdCCOQC3bTTuXt
        fCKHZuaoQIgs37S8hgme8UZCKTjspILF8OLG5ENsRM2k/nC7euKg8A1Jjqaqch2FjUFd4f
        IINNIVMgaRjrYuUU+HCcX02HvwsYZgQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-ASwlKIMdNwiDQwum18eVUw-1; Wed, 07 Apr 2021 10:23:20 -0400
X-MC-Unique: ASwlKIMdNwiDQwum18eVUw-1
Received: by mail-ej1-f71.google.com with SMTP id e23so2453651ejt.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 07:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SXz0LSYnn7tD4zJ0WOLI+LMaY9g3slT4szwbB9fYP4A=;
        b=Ln5nw4ARAO30m5iC1eHt1pl9IBrfVWatK5Uz37odYKx0PFkGEVONmP6y1wY+s1p4a+
         J6P/+b2MHyGFt2+dVH+UPlOe6DQynvGN9Er7D/XQAGLnH8EMc3LHsD+3F06HaF0gy74c
         wf8PwSDMz/1LR53I0l3rXK5bgteZ8UmyDD45U+yR1lDHkygNPihmNY5Ye9YmCHccr7U+
         kcV2rST178c1TVxwUJ1tvoJce4Cc0A/FPOWLG5UM/f7K5uOPUuJFACXb5us4TO1sCGFC
         umE+oxVszMbA8+4jErzEkKRwCKhZf8gJRzr4TEIWTZ5CnOGrIw/MGTPSIwacA3RXpHpJ
         9+Mw==
X-Gm-Message-State: AOAM530enBNHqnBpZKNMw72Zkm4d+tZtBaWt2ckQhqId0i1X2tpj2eT9
        MsFRGtlacP89BJhaPXVlgaYjD/HpSnt9I9GAkLUMqkfd27HFKnxJkFMfPpVIZGRFvcqakYGTk5E
        QmDEjCqfGELmj5OB4gWuilpjWqKMhDKfxiw==
X-Received: by 2002:a05:6402:3486:: with SMTP id v6mr4709001edc.109.1617805399726;
        Wed, 07 Apr 2021 07:23:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjr/l9Y2N7pqPgGIKIXi5VIXhrUNZjhNOryGutMY/Xp/hdtDIFCVoQ4E7ST3/iEL1m/Pgj6A==
X-Received: by 2002:a05:6402:3486:: with SMTP id v6mr4708969edc.109.1617805399470;
        Wed, 07 Apr 2021 07:23:19 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id m1sm9289105ejl.35.2021.04.07.07.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 07:23:19 -0700 (PDT)
Subject: Re: [PATCH 2/9] platform/x86: intel_pmc_core: Remove global struct
 pmc_dev
To:     "David E. Box" <david.e.box@linux.intel.com>,
        irenic.rajneesh@gmail.com, mgross@linux.intel.com,
        gayatri.kammela@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210401030558.2301621-1-david.e.box@linux.intel.com>
 <20210401030558.2301621-3-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <02017c9f-d330-e23f-81e9-da67d931cfae@redhat.com>
Date:   Wed, 7 Apr 2021 16:23:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210401030558.2301621-3-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/1/21 5:05 AM, David E. Box wrote:
> The intel_pmc_core driver did not always bind to a device which meant it
> lacked a struct device that could be used to maintain driver data. So a
> global instance of struct pmc_dev was used for this purpose and functions
> accessed this directly. Since the driver now binds to an ACPI device,
> remove the global pmc_dev in favor of one that is allocated during probe.
> Modify users of the global to obtain the object by argument instead.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/platform/x86/intel_pmc_core.c | 41 ++++++++++++++-------------
>  1 file changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 260d49dca1ad..5ca40fe3da59 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -31,8 +31,6 @@
>  
>  #include "intel_pmc_core.h"
>  
> -static struct pmc_dev pmc;
> -
>  /* PKGC MSRs are common across Intel Core SoCs */
>  static const struct pmc_bit_map msr_map[] = {
>  	{"Package C2",                  MSR_PKG_C2_RESIDENCY},
> @@ -617,9 +615,8 @@ static int pmc_core_dev_state_get(void *data, u64 *val)
>  
>  DEFINE_DEBUGFS_ATTRIBUTE(pmc_core_dev_state, pmc_core_dev_state_get, NULL, "%llu\n");
>  
> -static int pmc_core_check_read_lock_bit(void)
> +static int pmc_core_check_read_lock_bit(struct pmc_dev *pmcdev)
>  {
> -	struct pmc_dev *pmcdev = &pmc;
>  	u32 value;
>  
>  	value = pmc_core_reg_read(pmcdev, pmcdev->map->pm_cfg_offset);
> @@ -744,28 +741,26 @@ static int pmc_core_ppfear_show(struct seq_file *s, void *unused)
>  DEFINE_SHOW_ATTRIBUTE(pmc_core_ppfear);
>  
>  /* This function should return link status, 0 means ready */
> -static int pmc_core_mtpmc_link_status(void)
> +static int pmc_core_mtpmc_link_status(struct pmc_dev *pmcdev)
>  {
> -	struct pmc_dev *pmcdev = &pmc;
>  	u32 value;
>  
>  	value = pmc_core_reg_read(pmcdev, SPT_PMC_PM_STS_OFFSET);
>  	return value & BIT(SPT_PMC_MSG_FULL_STS_BIT);
>  }
>  
> -static int pmc_core_send_msg(u32 *addr_xram)
> +static int pmc_core_send_msg(struct pmc_dev *pmcdev, u32 *addr_xram)
>  {
> -	struct pmc_dev *pmcdev = &pmc;
>  	u32 dest;
>  	int timeout;
>  
>  	for (timeout = NUM_RETRIES; timeout > 0; timeout--) {
> -		if (pmc_core_mtpmc_link_status() == 0)
> +		if (pmc_core_mtpmc_link_status(pmcdev) == 0)
>  			break;
>  		msleep(5);
>  	}
>  
> -	if (timeout <= 0 && pmc_core_mtpmc_link_status())
> +	if (timeout <= 0 && pmc_core_mtpmc_link_status(pmcdev))
>  		return -EBUSY;
>  
>  	dest = (*addr_xram & MTPMC_MASK) | (1U << 1);
> @@ -791,7 +786,7 @@ static int pmc_core_mphy_pg_show(struct seq_file *s, void *unused)
>  
>  	mutex_lock(&pmcdev->lock);
>  
> -	if (pmc_core_send_msg(&mphy_core_reg_low) != 0) {
> +	if (pmc_core_send_msg(pmcdev, &mphy_core_reg_low) != 0) {
>  		err = -EBUSY;
>  		goto out_unlock;
>  	}
> @@ -799,7 +794,7 @@ static int pmc_core_mphy_pg_show(struct seq_file *s, void *unused)
>  	msleep(10);
>  	val_low = pmc_core_reg_read(pmcdev, SPT_PMC_MFPMC_OFFSET);
>  
> -	if (pmc_core_send_msg(&mphy_core_reg_high) != 0) {
> +	if (pmc_core_send_msg(pmcdev, &mphy_core_reg_high) != 0) {
>  		err = -EBUSY;
>  		goto out_unlock;
>  	}
> @@ -842,7 +837,7 @@ static int pmc_core_pll_show(struct seq_file *s, void *unused)
>  	mphy_common_reg  = (SPT_PMC_MPHY_COM_STS_0 << 16);
>  	mutex_lock(&pmcdev->lock);
>  
> -	if (pmc_core_send_msg(&mphy_common_reg) != 0) {
> +	if (pmc_core_send_msg(pmcdev, &mphy_common_reg) != 0) {
>  		err = -EBUSY;
>  		goto out_unlock;
>  	}
> @@ -863,9 +858,8 @@ static int pmc_core_pll_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_ATTRIBUTE(pmc_core_pll);
>  
> -static int pmc_core_send_ltr_ignore(u32 value)
> +static int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value)
>  {
> -	struct pmc_dev *pmcdev = &pmc;
>  	const struct pmc_reg_map *map = pmcdev->map;
>  	u32 reg;
>  	int err = 0;
> @@ -891,6 +885,8 @@ static ssize_t pmc_core_ltr_ignore_write(struct file *file,
>  					 const char __user *userbuf,
>  					 size_t count, loff_t *ppos)
>  {
> +	struct seq_file *s = file->private_data;
> +	struct pmc_dev *pmcdev = s->private;
>  	u32 buf_size, value;
>  	int err;
>  
> @@ -900,7 +896,7 @@ static ssize_t pmc_core_ltr_ignore_write(struct file *file,
>  	if (err)
>  		return err;
>  
> -	err = pmc_core_send_ltr_ignore(value);
> +	err = pmc_core_send_ltr_ignore(pmcdev, value);
>  
>  	return err == 0 ? count : err;
>  }
> @@ -1228,13 +1224,19 @@ static void pmc_core_do_dmi_quirks(struct pmc_dev *pmcdev)
>  static int pmc_core_probe(struct platform_device *pdev)
>  {
>  	static bool device_initialized;
> -	struct pmc_dev *pmcdev = &pmc;
> +	struct pmc_dev *pmcdev;
>  	const struct x86_cpu_id *cpu_id;
>  	u64 slp_s0_addr;
>  
>  	if (device_initialized)
>  		return -ENODEV;
>  
> +	pmcdev = devm_kzalloc(&pdev->dev, sizeof(*pmcdev), GFP_KERNEL);
> +	if (!pmcdev)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, pmcdev);
> +
>  	cpu_id = x86_match_cpu(intel_pmc_core_ids);
>  	if (!cpu_id)
>  		return -ENODEV;
> @@ -1264,8 +1266,7 @@ static int pmc_core_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	mutex_init(&pmcdev->lock);
> -	platform_set_drvdata(pdev, pmcdev);
> -	pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit();
> +	pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit(pmcdev);
>  	pmc_core_do_dmi_quirks(pmcdev);
>  
>  	/*
> @@ -1274,7 +1275,7 @@ static int pmc_core_probe(struct platform_device *pdev)
>  	 */
>  	if (pmcdev->map == &tgl_reg_map) {
>  		dev_dbg(&pdev->dev, "ignoring GBE LTR\n");
> -		pmc_core_send_ltr_ignore(3);
> +		pmc_core_send_ltr_ignore(pmcdev, 3);
>  	}
>  
>  	pmc_core_dbgfs_register(pmcdev);
> 

