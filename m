Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892636;
	b=xkay/CXnLxr2S4NMvJ6HcUVxkPsIOj2HYJezFAwRFa1PGqf62Xy0nSM0KM98LOP7aVIu
	 L25FAwVhyOmMtvuN9JCW8XJbajP0Xk2EEoLcGiO2ffRWA6k7MLvp8BavYdzrH5+e/7mGB
	 O9viadlO6wkX3Hdoq6y1bj2PUNlSZHmdbugbEh4NavKDt/4b45AXBrFzDvpSsRG1kjvFh
	 miT9wLvho4EZuM5d53g07GPhJAgr/3O276n7a9FksVV6y1C5GQInt/9v4mfMFrsQtem87
	 TvBDftDbws/pZWsCjf3HPpH8C7pf6bCjxqEUNjaxq8E/lFfumjFIPqsy5HaSgwRM11w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892636;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+4qw84n4FYiibcPf2EEIlNujOlcQHsDQ/INfhukq1Wk=;
	b=hMJl10WPma2sjG3/GYj5HHTOia0xuG+iOyGrv6vhHUbQSsscAnJfDUJj7NfWhCLmKTm0
	 itGHBkC+Jjl9UxO/KAGGOlxW43td2ojSEbk0IyrqATmGka0j2M+hdUruwvFeQYvEpJdtI
	 MA78jx4oCvexlL+EEBIjZFsG9ozRWWmQushBdHftg1Q3fYFC6hzfFoiDPGv8NU4cLfVS7
	 KW3yY2klj5mczmQTQpRbqQS455eydW34bgjzSWbLSDTkfJa4y0Yu9OfM6fvF3v8PwylIM
	 rr5RBZEAw/r1zRb3XH6+QGaBOmp7XOG8UCaTzLUO7zTmGiM6r6tM+6aSQz1TZbuUAJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C+Rx1XJl;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2746606A31C;
	Tue, 17 Nov 2026 05:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2746606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C+Rx1XJl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794892636; x=1826428636;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Y5t2/J8wTWoQGNKSMl8evF6GjFE70w8RQ/L1NehAYUA=;
  b=C+Rx1XJlCtEHyJzPu/HvH3MfgAU+LQyGRUljyQktNrhFxtjgO3WrsGzH
   SL7/Z+1WlQbYWUG+LxwWPuq8DHSLQto0Q+ReCzIAVDMhwwsK8ooqNH3Kn
   FB59fxQ6OFDWg1DMN0tOxKheupebe3wNrQ1Fcz1ogVllu2s0ks4XYY9az
   kDNzMGN0IOGXsR0t3HK9pRr8MpJTiT2nV2D/gHbd3QB0mV7iJ+JAFNU47
   qMb6dZbDHvWQwtaTC6EAZVuNwVDQZ7KbEla+sqn8u6NreZ7XEdqS8nWfj
   faKMPIcFnxZ0mtOowhoH+4XjU6tvcVF+HyDLqXzMUVlsegycHij/s2YU8
   w==;
X-CSE-ConnectionGUID: +omfHwZfQqqqYQIzm/T9NQ==
X-CSE-MsgGUID: jrkIJtu6SOa6rUrxowK9xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3528107"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3528107"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 21:17:15 -0800
X-CSE-ConnectionGUID: 25NioXkeSCanfn2UjnY3PA==
X-CSE-MsgGUID: Ygg+zK0QRCCMKc8On9iq7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9675662"
Received: from xpardee-mobl.amr.corp.intel.com (HELO [10.124.33.127]) ([10.124.33.127])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 21:17:15 -0800
Message-ID: <766daa32-2247-40c2-980f-2a2317733b96@linux.intel.com>
Date: Mon, 16 Nov 2026 21:17:13 -0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86/intel/pmc: Disable ACPI PM timer during
 suspend on Panther Lake
To: Tzung-Bi Shih <tzungbi@kernel.org>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 tfiga@chromium.org
References: <20261112032040.930597-1-tzungbi@kernel.org>
Content-Language: en-US
From: Xi Pardee <xi.pardee@linux.intel.com>
In-Reply-To: <20261112032040.930597-1-tzungbi@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tzung-Bi,

Thanks for the v3. Avoiding  pmcdev->lock  and the tick_freeze()  atomic 
context resolves the problem behind the revert in 5fa607880168, and the 
save and restore logic looks correct.

Two requests:

1. Ordering vs. the  acpi_pm  clocksource.
• The reverted code toggled the timer from the clocksource's own 
callbacks. These run inside  timekeeping_suspend()  after the last read 
and inside  timekeeping_resume()  before the first read, so the counter 
is never read while stopped.
• Here the timer is stopped in  suspend_late  and restarted in 
resume_early . That is before  timekeeping_forward_now()  on suspend and 
after  tk_clock_read()  on resume.
• If  acpi_pm  is the active clocksource, for example when TSC is 
unstable, timekeeping can read a stopped counter, and ktime_get()  stops 
advancing from  suspend_late  on.
• Have you tested with  clocksource=acpi_pm ? If TSC is always used on 
PTL, please say so in the commit message.
2. Evidence for S0i2.2.
• Please share S0i2.1 and S0i2.2 residency with and without the patch.
• Include the platform, firmware and kernel version, and say whether 
firmware enabled the timer and  wdat_wdt  was active.

Also, does WCL, which reuses the PTL ops, need the same fix?

Thanks,
Xi

On 11/11/2026 7:20 PM, Tzung-Bi Shih wrote:
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
> v3:
> - Rebase to next-20261111.
>
> v2: https://lore.kernel.org/all/20261016075416.3139759-1-tzungbi@kernel.org
>   - Include <linux/bits.h> for BIT().
>   - Rename ptl_set_acpi_pm_timer_on_suspend() -> ptl_set_acpi_pm_timer().
>   - Update register values on separate lines.
>
> v1: https://lore.kernel.org/all/20261015035712.3604634-1-tzungbi@kernel.org
> ---
>   drivers/platform/x86/intel/pmc/core.h |  2 ++
>   drivers/platform/x86/intel/pmc/ptl.c  | 40 ++++++++++++++++++++++++++-
>   2 files changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
> index e55164e5807f..8aae69775ab3 100644
> --- a/drivers/platform/x86/intel/pmc/core.h
> +++ b/drivers/platform/x86/intel/pmc/core.h
> @@ -487,6 +487,7 @@ struct pmc {
>    * @s0ix_counter:	S0ix residency (step adjusted)
>    * @suspend:		Function to perform platform specific suspend
>    * @resume:		Function to perform platform specific resume
> + * @pm_timer_enabled:	Whether the ACPI PM timer was enabled before suspend
>    *
>    * @pkgc_ltr_blocker_counters: Array of PKGC LTR blocker counters
>    * @pkgc_ltr_blocker_offset: Offset to PKGC LTR blockers in telemetry region
> @@ -506,6 +507,7 @@ struct pmc_dev {
>   	u64 s0ix_counter;
>   	void (*suspend)(struct pmc_dev *pmcdev);
>   	int (*resume)(struct pmc_dev *pmcdev);
> +	bool pm_timer_enabled;
>   
>   	u64 *pkgc_res_cnt;
>   	u8 num_of_pkgc;
> diff --git a/drivers/platform/x86/intel/pmc/ptl.c b/drivers/platform/x86/intel/pmc/ptl.c
> index a7d5d4f77934..3cb063944007 100644
> --- a/drivers/platform/x86/intel/pmc/ptl.c
> +++ b/drivers/platform/x86/intel/pmc/ptl.c
> @@ -6,6 +6,8 @@
>    * Copyright (c) 2025, Intel Corporation.
>    */
>   
> +#include <linux/bits.h>
> +#include <linux/io.h>
>   #include <linux/pci.h>
>   
>   #include "core.h"
> @@ -548,6 +550,9 @@ static const u8 ptl_pmc_list[] = {PMC_IDX_MAIN};
>   #define PTL_NPU_PCI_DEV                0xb03e
>   #define PTL_IPU_PCI_DEV                0xb05d
>   
> +#define ACPI_TMR_CTL_OFFSET            0x18fc
> +#define ACPI_TIM_DIS                   BIT(1)
> +
>   /*
>    * Set power state of select devices that do not have drivers to D3
>    * so that they do not block Package C entry.
> @@ -558,9 +563,42 @@ static void ptl_d3_fixup(void)
>   	pmc_core_set_device_d3(PTL_NPU_PCI_DEV);
>   }
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
>   static int ptl_resume(struct pmc_dev *pmcdev)
>   {
>   	ptl_d3_fixup();
> +	ptl_set_acpi_pm_timer(pmcdev, false);
>   	return cnl_resume(pmcdev);
>   }
>   
> @@ -576,7 +614,7 @@ struct pmc_dev_info ptl_pmc_dev = {
>   	.regmap_list = ptl_pmc_info_list,
>   	.map = &ptl_pcdp_reg_map,
>   	.sub_req_show = &pmc_core_substate_blk_req_fops,
> -	.suspend = cnl_suspend,
> +	.suspend = ptl_suspend,
>   	.resume = ptl_resume,
>   	.init = ptl_core_init,
>   	.sub_req = pmc_core_pmt_get_blk_sub_req,
