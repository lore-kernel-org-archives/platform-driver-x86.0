Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5891E39B944;
	Thu,  7 May 2026 13:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160174; cv=none; b=GrF8kNOLGTw7uwWVh7BRs5kp1ESqR/jYiJBeUlz8xz14oMZHAe3PwI4ejxQYEQJGO7y7i5rjgEPkDy7wpwsaiWmHnspEWszMe/y7uXhSVjAZB0sOrMKxdI0iSCVKybWYsjRh2gT4R1mWARbaoiTFvU+6bBmCrSvmd3/aGKmrD68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160174; c=relaxed/simple;
	bh=OaG8mGo0qcmY0l53Sdl3tN/ATQ6H7I7/btcZLgA1NJ4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fw2JB91jBKs3FsciE6PfShwCDgcf+mJ11CVlVge1I26sEryC7pFnePDXfkcl2yiv9Rh9GmNLH0ObVrFqawpgfpYHhx3AIgL4d3HuM6ccp03qV+Jm7qWmhjaig+SSsgx3AkwdNT9jrAOqsckwckcEt0dF6Ii7KOcDCR9VOr0Ecqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqM/jf5w; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqM/jf5w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778160172; x=1809696172;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OaG8mGo0qcmY0l53Sdl3tN/ATQ6H7I7/btcZLgA1NJ4=;
  b=bqM/jf5wg5gsorLZna6tBllpKBXpS7YNuDGyqQLlRPSU73WLJPziF+gu
   lp39fQJt8le5s0vb9zogArIEyrEWqNJOoVmDgjMAhjfq0Slfufrwku4NQ
   JX42nJPlFwj77on+zpXxwqFMdWCW0THXFPJLFByCegfQzYJCRF4Z5psPH
   SAVGffeB9ui5hiwn6E61mWVsSs0FjoKk8nl0f5p+vSoz7QoC8DcffUuyG
   jjAW3x14WWbscplfeNBppLkdJnWOBrbYAYu7pqwZTuQZx1SNrEYiWMSB+
   ZFyVvStwKIA91QXyria4UsTaqjOQ0HZJK97O2ylaelvNPOlyorNPrcs5J
   Q==;
X-CSE-ConnectionGUID: cOTyEpk7R323pfk8YIHtTQ==
X-CSE-MsgGUID: fAIXg9vLQS65UnEEVNsg8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90568902"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="90568902"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 06:22:52 -0700
X-CSE-ConnectionGUID: A5huCnsnSYu3KU9TkoCACw==
X-CSE-MsgGUID: RjV9RjceTHyi64BEz7U44g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="230070861"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.116])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 06:22:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 7 May 2026 16:22:44 +0300 (EEST)
To: Daniel Gibson <daniel@gibson.sh>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    Mario Limonciello <superm1@kernel.org>, 
    Sindre Henriksen <sindrehenriksen93@gmail.com>
Subject: Re: [PATCH 1/2] platform/x86/amd/pmc: Delay suspend for some Lenovo
 Laptops
In-Reply-To: <20260501032655.283789-2-daniel@gibson.sh>
Message-ID: <ecd9767a-ea6d-8c1f-699e-e1ced0247f2e@linux.intel.com>
References: <20260501032655.283789-1-daniel@gibson.sh> <20260501032655.283789-2-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 May 2026, Daniel Gibson wrote:

> Some IdeaPad Slim 3 devices and similar with AMD CPUs have a
> nonfunctional keyboard and lid switch after s2idle.
> It helps to delay suspend by 2.5 seconds so the EC has some time
> to do whatever it needs to get done before suspend.
> 
> This issue has been reported for many different devices, this patch
> has been tested with the Zen3-based IdeaPad Slim 3 16ABR8 (82XR)
> and the Zen3+-based IdeaPad Slim 3 14ARP10 (83K6), see
> https://bugzilla.kernel.org/show_bug.cgi?id=221383
> 
> Reported-by: Sindre Henriksen <sindrehenriksen93@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221383
> Tested-by: Sindre Henriksen <sindrehenriksen93@gmail.com>
> Tested-by: Daniel Gibson <daniel@gibson.sh>
> Suggested-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
> ---
>  drivers/platform/x86/amd/pmc/pmc-quirks.c | 36 +++++++++++++++++++++++
>  drivers/platform/x86/amd/pmc/pmc.c        |  5 +++-
>  drivers/platform/x86/amd/pmc/pmc.h        |  1 +
>  3 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> index 24506e342943..cea30f68f8dc 100644
> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> @@ -18,6 +18,7 @@
>  struct quirk_entry {
>  	u32 s2idle_bug_mmio;
>  	bool spurious_8042;
> +	bool need_suspend_delay;
>  };
>  
>  static struct quirk_entry quirk_s2idle_bug = {
> @@ -33,6 +34,10 @@ static struct quirk_entry quirk_s2idle_spurious_8042 = {
>  	.spurious_8042 = true,
>  };
>  
> +static struct quirk_entry quirk_s2idle_need_suspend_delay = {
> +	.need_suspend_delay = true

Please add comma to any non-terminating entry.

> +};
> +
>  static const struct dmi_system_id fwbug_list[] = {
>  	{
>  		.ident = "L14 Gen2 AMD",
> @@ -203,6 +208,32 @@ static const struct dmi_system_id fwbug_list[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "82XQ"),
>  		}
>  	},
> +	/*
> +	 * Some Lenovo Laptops (like different IdeaPad 3 Slims) need some
> +	 * me-time before sleeping or they get uncooperative after waking
> +	 * up and don't send events for keyboard and lid switch anymore.
> +	 * See https://bugzilla.kernel.org/show_bug.cgi?id=221383
> +	 */
> +	{
> +		.ident = "Zen3-based IdeaPad Slim and similar",
> +		.driver_data = &quirk_s2idle_need_suspend_delay,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			/*
> +			 * Note: there are also some Zen2-based 82X* devices that
> +			 * need different quirks, they're already handled above
> +			 */
> +			DMI_MATCH(DMI_PRODUCT_NAME, "82X")

Ditto.

> +		}
> +	},
> +	{
> +		.ident = "Zen3+-based IdeaPad Slim and similar",
> +		.driver_data = &quirk_s2idle_need_suspend_delay,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83K")

Ditto.

> +		}
> +	},
>  	/* https://bugzilla.kernel.org/show_bug.cgi?id=221273 */
>  	{
>  		.ident = "Thinkpad L14 Gen3",
> @@ -356,6 +387,11 @@ void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev)
>  		amd_pmc_skip_nvme_smi_handler(dev->quirks->s2idle_bug_mmio);
>  }
>  
> +bool amd_pmc_quirk_need_suspend_delay(struct amd_pmc_dev *dev)
> +{
> +	return dev->quirks->need_suspend_delay;
> +}
> +
>  void amd_pmc_quirks_init(struct amd_pmc_dev *dev)
>  {
>  	const struct dmi_system_id *dmi_id;
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index cae3fcafd4d7..c604dc7207ed 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -634,10 +634,13 @@ static void amd_pmc_s2idle_check(void)
>  	struct amd_pmc_dev *pdev = &pmc;
>  	struct smu_metrics table;
>  	int rc;
> +	bool ec_needs_sleep = !disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev);

Why isn't disable_workarounds inside amd_pmc_quirk_need_suspend_delay() ?

>  
>  	/* Avoid triggering OVP */
> -	if (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)
> +	if (ec_needs_sleep || (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)) {

It would be clearer what's going on here if these two checks are clearly 
separated.

As is, the comment confuses if it's only meant for the 2nd check.

One of the checks will be in amd_pmc_quirk_need_suspend_delay() and the 
other (the existing one + the comment) should be moved in to own function 
(perhaps in a patch preceeding this one) so it's clear the reasoning is 
different(?). You can check the commit that introduced msleep(2500) here
for details about the existing check.

> +		dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
>  		msleep(2500);
> +	}
>  
>  	/* Dump the IdleMask before we add to the STB */
>  	amd_pmc_idlemask_read(pdev, pdev->dev, NULL);
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index fe3f53eb5955..f5257e47b8c4 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -147,6 +147,7 @@ enum amd_pmc_def {
>  };
>  
>  void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
> +bool amd_pmc_quirk_need_suspend_delay(struct amd_pmc_dev *dev);
>  void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
>  void amd_mp2_stb_init(struct amd_pmc_dev *dev);
>  void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
> 

-- 
 i.

