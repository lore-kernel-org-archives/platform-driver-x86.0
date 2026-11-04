Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776161;
	b=U+htsiyF76u9eBAsHqORMcoKWtt9/+uoZLNp1mv6CtP2f4HdbrfYMUSyNf5Y3qBNca03
	 SZuFQuJ528Su+svEhUVKd1ct3jeO2bD6Ne/t+Cxg98miB7PMiyG50YhGcaSKM9YJgVBOU
	 PYTv/M3wnE0jVttwgx/Q/ZadUMHFmNI68+k00se0keMDZLwVdktQo/ztc+bK6DHM920UT
	 0cjllQ1YM9pO6kj6jNOiRpQJvR/htAxs8DrvI8hxjQpp9Y71vvMdHRCrq+dFF5iiIlf5A
	 gyuqrC+oSjt517qTrtIrq/iH1esjrcu+Wt836zrFE24ASj1KyQ5uh0aWlYgUTlitKbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776161;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+WCXDp290Xn9BgrkPrZnMpev3OHMqbb44cnXI2R4Ars=;
	b=vOdn/CrHRW5N06oZuGRp4ZkSkRNB80a+n21xuQ5eV5SB4DZHf1TtbfLjUYXCAf0T8rwH
	 Mg3ZCBbdCgpqJxRMJLTIsSdzwuDrjYN0DGUjEuHyOZ3fpi/tmBX2LYgRZZ2bqqYqJzk9s
	 +UoBi1ZsDbsjNxPcd9/0v2aQoz8/q5QvOGldmp6aR0ybGDEpJIzl8r4xnOKfG/7kws/sl
	 D4BnqgyS+frdRdudI6+RMBOU4G4wNE+ebWlfRA1IXcSWbgUcqZ9bIxyfuowsgigROzDui
	 OMHQIqn8DjBRLdza0TUJW4EynDzog0aWWvdCM8hwp/hNeSlA4yTqRjdlVX4z/AdU9Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yog98cya;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B9F606A31B;
	Wed,  4 Nov 2026 07:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yog98cya
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3981F000C1;
	Wed,  4 Nov 2026 07:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776160;
	bh=+WCXDp290Xn9BgrkPrZnMpev3OHMqbb44cnXI2R4Ars=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yog98cyaQu9tQ0W3YE2U0w2wGOQpf6mxyyrYoLLY4LcaWn2xb2s6a0M8urISHaKu7
	 e8Oj0D3PJ/HsAF7pya7pNU5B1GN9mptNWjYhOF+8PIGQVfpeA4UeZzQiiK++dIGHxo
	 8iFg5Vo4Y4SWl521+9qpfgqfVhl+zfs9BLBB53ExRWDrLBdYtl/AzJwyHIGEm63mlm
	 03NE0VKnYnR7ageymtUUTHtmP804LffsRFElg1Z0HrNS7mVNZc1CQVnDooBInIbEwb
	 hdZMfK56DIx0lbycKeAo5g5PQvUaqvyHmlVdhroTrY3SMPrqZpEK8PzSt07NiKrWcZ
	 7trimbdDvsdsQ==
Date: Wed, 4 Nov 2026 07:09:17 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	tfiga@chromium.org
Subject: Re: [PATCH v2] platform/x86/intel/pmc: Disable ACPI PM timer during
 suspend on Panther Lake
Message-ID: <auraHR9azYGrq70d@google.com>
References: <20261016075416.3139759-1-tzungbi@kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016075416.3139759-1-tzungbi@kernel.org>

On Fri, Oct 16, 2026 at 07:54:16AM +0000, Tzung-Bi Shih wrote:
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
> v2:
>  - Include <linux/bits.h> for BIT().
>  - Rename ptl_set_acpi_pm_timer_on_suspend() -> ptl_set_acpi_pm_timer().
>  - Update register values on separate lines.
> 
> v1: https://lore.kernel.org/all/20261015035712.3604634-1-tzungbi@kernel.org
> ---
>  drivers/platform/x86/intel/pmc/core.h |  2 ++
>  drivers/platform/x86/intel/pmc/ptl.c  | 40 ++++++++++++++++++++++++++-
>  2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
> index e55164e5807f..8aae69775ab3 100644
> --- a/drivers/platform/x86/intel/pmc/core.h
> +++ b/drivers/platform/x86/intel/pmc/core.h
> @@ -487,6 +487,7 @@ struct pmc {
>   * @s0ix_counter:	S0ix residency (step adjusted)
>   * @suspend:		Function to perform platform specific suspend
>   * @resume:		Function to perform platform specific resume
> + * @pm_timer_enabled:	Whether the ACPI PM timer was enabled before suspend
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
> index a7d5d4f77934..3cb063944007 100644
> --- a/drivers/platform/x86/intel/pmc/ptl.c
> +++ b/drivers/platform/x86/intel/pmc/ptl.c
> @@ -6,6 +6,8 @@
>   * Copyright (c) 2025, Intel Corporation.
>   */
>  
> +#include <linux/bits.h>
> +#include <linux/io.h>
>  #include <linux/pci.h>
>  
>  #include "core.h"
> @@ -548,6 +550,9 @@ static const u8 ptl_pmc_list[] = {PMC_IDX_MAIN};
>  #define PTL_NPU_PCI_DEV                0xb03e
>  #define PTL_IPU_PCI_DEV                0xb05d
>  
> +#define ACPI_TMR_CTL_OFFSET            0x18fc
> +#define ACPI_TIM_DIS                   BIT(1)
> +
>  /*
>   * Set power state of select devices that do not have drivers to D3
>   * so that they do not block Package C entry.
> @@ -558,9 +563,42 @@ static void ptl_d3_fixup(void)
>  	pmc_core_set_device_d3(PTL_NPU_PCI_DEV);
>  }
>  
> +static void ptl_set_acpi_pm_timer(struct pmc_dev *pmcdev, bool suspend)
> +{
> +	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
> +	u8 val, old_val;
> +
> +	if (!pmc || !pmc->regbase)
> +		return;
> +
> +	if (!suspend && !pmcdev->pm_timer_enabled)
> +		return;
> +
> +	val = readb(pmc->regbase + ACPI_TMR_CTL_OFFSET);
> +	old_val = val;
> +
> +	if (suspend) {
> +		pmcdev->pm_timer_enabled = !(old_val & ACPI_TIM_DIS);
> +		if (pmcdev->pm_timer_enabled)
> +			val |= ACPI_TIM_DIS;
> +	} else {
> +		val &= ~ACPI_TIM_DIS;
> +	}
> +
> +	if (val != old_val)
> +		writeb(val, pmc->regbase + ACPI_TMR_CTL_OFFSET);
> +}
> +
> +static void ptl_suspend(struct pmc_dev *pmcdev)
> +{
> +	ptl_set_acpi_pm_timer(pmcdev, true);
> +	cnl_suspend(pmcdev);
> +}
> +
>  static int ptl_resume(struct pmc_dev *pmcdev)
>  {
>  	ptl_d3_fixup();
> +	ptl_set_acpi_pm_timer(pmcdev, false);
>  	return cnl_resume(pmcdev);
>  }
>  
> @@ -576,7 +614,7 @@ struct pmc_dev_info ptl_pmc_dev = {
>  	.regmap_list = ptl_pmc_info_list,
>  	.map = &ptl_pcdp_reg_map,
>  	.sub_req_show = &pmc_core_substate_blk_req_fops,
> -	.suspend = cnl_suspend,
> +	.suspend = ptl_suspend,
>  	.resume = ptl_resume,
>  	.init = ptl_core_init,
>  	.sub_req = pmc_core_pmt_get_blk_sub_req,

Hi,

Does this look okay to be picked up, or are there any changes you'd like
me to make?
