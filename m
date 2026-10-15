Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AE9488203;
	Thu, 15 Oct 2026 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054344; cv=none; b=RQfhnRxBkr0W4AiP6crBrKFJHYwKg6chZrpDobDB/5pFca/BVUY8adtfAFMU35Y6nJtgrLbAyQFfJ1JSt3NY1em0BTlA/FXs/fMzRtJen3EpKiIB7H7/AqvsXAM74LRe1TxVwhuvMrOR+8OYzRBQvBJElR/BUI/3nGPaZV0VyL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054344; c=relaxed/simple;
	bh=yFt9TUKBM4tE/4iJsABTs9xHHlo9G4TOCQ8wwkNFkSE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JQhQM4I+x/TFnTrQzGTrKeF7/VxXDptzZMyKYdAN6sy/OoIqGa/7E2D8g+AuoLSB0Wuw7ft3vfax6c2GOlB8XrrOIw+1FI3FFN9PtEJKTn8XsZDpbz3PN9eUeu+CKvKymuMjBCzq83pLjWIO6PVLOCykiDcOSyTRiAw7dFpd7IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzcdyFog; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzcdyFog"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792054331; x=1823590331;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=yFt9TUKBM4tE/4iJsABTs9xHHlo9G4TOCQ8wwkNFkSE=;
  b=EzcdyFogGQ4FKn1px91QOYQPdqONy7EQLv4X9iGd/1/ebRsmZcy7DWkP
   kMzaXSF3Ph7sC91N64+wVlsC4THtQOIXgTITBNWF+1obZj+gwI0jMHLgf
   LfkJHA5gh7Dg0PSFygh7k0ae3oAE55kB00usJtxzZSyLfhqRBuDvZot4/
   ZOK5rxxxtEyrHsNhGiIczvicn2omySSX4NzMRpdyzmpXCn9PCsGw7Y+6i
   6caOwTs1DNak5S2Q6bkNp/3B5uhnuZ6U2OSTT3MZ2U3KODvezIKmTdv+c
   gssQW2xJ1rugEsSPr68PQhIatYchHa8HugEU8aKgGXJ+CzMzjEtUV4DJV
   g==;
X-CSE-ConnectionGUID: zzKPuGChT2CQBoDCkSECPw==
X-CSE-MsgGUID: JE648vE7S9CjppuwTApfrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="812833"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="812833"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 01:52:10 -0700
X-CSE-ConnectionGUID: VyimD5FFTqW5feh8ObEudw==
X-CSE-MsgGUID: HzZFz/KnTL6OtWaaEtcqzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1553231"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 01:52:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Oct 2026 11:52:05 +0300 (EEST)
To: Tzung-Bi Shih <tzungbi@kernel.org>
cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
    Xi Pardee <xi.pardee@linux.intel.com>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    tfiga@chromium.org
Subject: Re: [PATCH] platform/x86/intel/pmc: Disable ACPI PM timer during
 suspend on Panther Lake
In-Reply-To: <20261015035712.3604634-1-tzungbi@kernel.org>
Message-ID: <6075cb9a-b739-644a-2dac-998e7893ec31@linux.intel.com>
References: <20261015035712.3604634-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Oct 2026, Tzung-Bi Shih wrote:

> The ACPI PM timer is used to drive the ACPI Watchdog Action Table
> (wdat_wdt) hardware watchdog.  When the ACPI PM timer is enabled by
> firmware on Panther Lake, leaving it running during s2idle prevents the
> SoC from entering its deepest S0i2.2 substate (staying in S0i2.1).
> 
> Since the watchdog is stopped during system suspend, the ACPI PM timer
> does not need to remain active while suspended.  Disable the timer via
> ACPI_TMR_CTL (PWRMBASE + 0x18fc) in ptl_suspend() and re-enable it in
> ptl_resume() only if it was active prior to suspend.
> 
> Unlike commit e86c8186d03a ("platform/x86:intel/pmc: Enable the ACPI PM
> Timer to be turned off when suspended"), which was reverted in commit
> 5fa607880168 because it acquired pmcdev->lock from the acpi_pm
> clocksource suspend callback inside tick_freeze() atomic context, toggle
> the register in ptl_suspend() and ptl_resume() without taking
> pmcdev->lock.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/platform/x86/intel/pmc/core.h |  2 ++
>  drivers/platform/x86/intel/pmc/ptl.c  | 35 ++++++++++++++++++++++++++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
> index e55164e5807f..a5bd45c4b44e 100644
> --- a/drivers/platform/x86/intel/pmc/core.h
> +++ b/drivers/platform/x86/intel/pmc/core.h
> @@ -487,6 +487,7 @@ struct pmc {
>   * @s0ix_counter:	S0ix residency (step adjusted)
>   * @suspend:		Function to perform platform specific suspend
>   * @resume:		Function to perform platform specific resume
> + * @pm_timer_enabled:	Whether the ACPI PM timer enabled before suspend
>   *
>   * @pkgc_ltr_blocker_counters: Array of PKGC LTR blocker counters
>   * @pkgc_ltr_blocker_offset: Offset to PKGC LTR blockers in telemetry region
> @@ -506,6 +507,7 @@ struct pmc_dev {
>  	u64 s0ix_counter;
>  	void (*suspend)(struct pmc_dev *pmcdev);
>  	int (*resume)(struct pmc_dev *pmcdev);
> +	bool pm_timer_enabled;
>  
>  	u64 *pkgc_res_cnt;
>  	u8 num_of_pkgc;
> diff --git a/drivers/platform/x86/intel/pmc/ptl.c b/drivers/platform/x86/intel/pmc/ptl.c
> index a7d5d4f77934..8c32f9be9302 100644
> --- a/drivers/platform/x86/intel/pmc/ptl.c
> +++ b/drivers/platform/x86/intel/pmc/ptl.c
> @@ -6,6 +6,7 @@
>   * Copyright (c) 2025, Intel Corporation.
>   */
>  
> +#include <linux/io.h>
>  #include <linux/pci.h>
>  
>  #include "core.h"
> @@ -548,6 +549,9 @@ static const u8 ptl_pmc_list[] = {PMC_IDX_MAIN};
>  #define PTL_NPU_PCI_DEV                0xb03e
>  #define PTL_IPU_PCI_DEV                0xb05d
>  
> +#define ACPI_TMR_CTL_OFFSET            0x18fc
> +#define ACPI_TIM_DIS                   BIT(1)

Please add include for this as well.

> +
>  /*
>   * Set power state of select devices that do not have drivers to D3
>   * so that they do not block Package C entry.
> @@ -558,9 +562,38 @@ static void ptl_d3_fixup(void)
>  	pmc_core_set_device_d3(PTL_NPU_PCI_DEV);
>  }
>  
> +static void ptl_set_acpi_pm_timer_on_suspend(struct pmc_dev *pmcdev, bool suspend)
> +{
> +	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
> +	bool enabled;
> +	u8 val;
> +
> +	if (!pmc || !pmc->regbase)
> +		return;
> +
> +	if (!suspend && !pmcdev->pm_timer_enabled)
> +		return;
> +
> +	val = readb(pmc->regbase + ACPI_TMR_CTL_OFFSET);
> +	enabled = !(val & ACPI_TIM_DIS);
> +	if (suspend && enabled)
> +		writeb(val | ACPI_TIM_DIS, pmc->regbase + ACPI_TMR_CTL_OFFSET);
> +	else if (!suspend)
> +		writeb(val & ~ACPI_TIM_DIS, pmc->regbase + ACPI_TMR_CTL_OFFSET);

Change val on a separate line for clarity.

How about using this alternative:

	old_val = val;
	if (...)
		val |= ACPI_TIM_DIS;
	else if (...)
		val &= ~ACPI_TIM_DIS;
	if (val != old_val)
		writeb(...);

?

> +
> +	pmcdev->pm_timer_enabled = suspend && enabled;
> +}
> +
> +static void ptl_suspend(struct pmc_dev *pmcdev)
> +{
> +	ptl_set_acpi_pm_timer_on_suspend(pmcdev, true);
> +	cnl_suspend(pmcdev);
> +}
> +
>  static int ptl_resume(struct pmc_dev *pmcdev)
>  {
>  	ptl_d3_fixup();
> +	ptl_set_acpi_pm_timer_on_suspend(pmcdev, false);
>  	return cnl_resume(pmcdev);
>  }
>  
> @@ -576,7 +609,7 @@ struct pmc_dev_info ptl_pmc_dev = {
>  	.regmap_list = ptl_pmc_info_list,
>  	.map = &ptl_pcdp_reg_map,
>  	.sub_req_show = &pmc_core_substate_blk_req_fops,
> -	.suspend = cnl_suspend,
> +	.suspend = ptl_suspend,
>  	.resume = ptl_resume,
>  	.init = ptl_core_init,
>  	.sub_req = pmc_core_pmt_get_blk_sub_req,
> 

-- 
 i.

