Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CE44C9553;
	Tue, 21 Jul 2026 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629773; cv=none; b=jPo6V+qXxckD/A1htRIiqwhYakFeSJ9dLWGBZV+fPKtEUv5oqT+LqaQdt0QeZeOaf3rhFvIwcfQi2Qs7ZhlMunH+10Ho6wvo8CJboRkvYarHAbrLOpUmSvGPTCcKHcVYn7C4NQshF0u6dTcLHpIO8jsUxHIenIVZN2V9RLhjGLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629773; c=relaxed/simple;
	bh=uRO5N8yQijaCuDU7kcjXgMElAud/7FW0ZnqKhI+AK5s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=u7hrUfTEiYA7BbWmwbXZkFO7LDQQrtuFK0SPCkaEOCwBLkHS1RLtnYOrSX96mTdHelUuFzhvT1jyj7gNkAGazDyHPVG0Gn+BiEsCqjF406W2mqUQjFfl9be0dAQ905eGNA3mOqOwiWGiUf85h+Q1nGGOpvXPMwi8IZQxXybl7eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXYNQuIs; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXYNQuIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784629771; x=1816165771;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=uRO5N8yQijaCuDU7kcjXgMElAud/7FW0ZnqKhI+AK5s=;
  b=RXYNQuIsHRsoxS7crr3SGLATAfMb4tP9QW/jmez/BIA8UHhF0QFkuUpj
   lBFQTH3NeF4u5fGpu41jY+BWUe4jOaAED/bLPD1sObGal/PpQ3oUMGKLW
   JJQjIPdzuLw6gxflg+wEoKU/crpdw3F0PoG/AgOVbbnIgc54P2wFTT5b4
   lvU5pid8zzMt77U3EmaDaoXhh3fHPFChg6RAe21Zmt+2/N9BNFsNvOWrr
   vLGEIQnbTqmBh+0dyApvWQ9hCvahq77OYc8QLfP80q1xqVcqHkVOzsOKg
   fj4s+9FegWFARnJgVkm1790aoFzrs7vb98mwQ36XZXYcZx0PEomLNe42l
   g==;
X-CSE-ConnectionGUID: soIC00ekTVu2il4uly32yQ==
X-CSE-MsgGUID: ji/jgMRJRq2twd5bBaZXdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85242325"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="85242325"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 03:29:30 -0700
X-CSE-ConnectionGUID: oXF7oo4tQ+2nlaS+lJQhxQ==
X-CSE-MsgGUID: P49V/z63SLKM9LsrJeZDvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="295933521"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 03:29:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 13:29:25 +0300 (EEST)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Hans de Goede <hansg@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
    "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, 
    Francis De Brabandere <francisdb@gmail.com>
Subject: Re: [PATCH 3/4] platform/x86/amd/pmc: Do not fail probe when STB
 init fails
In-Reply-To: <20260717162023.956346-4-mario.limonciello@amd.com>
Message-ID: <03684762-b5f7-a48b-33a6-0c5aff345d6a@linux.intel.com>
References: <20260717162023.956346-1-mario.limonciello@amd.com> <20260717162023.956346-4-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Jul 2026, Mario Limonciello wrote:

> STB (Spill to DRAM) is an optional debugging facility that is only
> enabled through the enable_stb module parameter.  On some platforms the

One whitespace is enough.

> SMU refuses the S2D setup outright, and on long-running systems the large
> telemetry region can fail to ioremap.  In either case amd_stb_s2d_init()
> returns an error and, because probe treated that as fatal, the entire
> PMC driver failed to load - silently disabling s0i3 support even though

There's odd change to past tense here.

treated -> treats
failed -> fails

> STB is only a debug aid.
> 
> Downgrade the failure to a warning and continue probing so that s0i3
> support via the LPS0 handler no longer depends on an optional debug
> feature.
> 
> Since probe no longer aborts on this path, the LPS0 and debugfs
> unwinding added by the earlier fix in this series becomes unreachable
> and is removed.
> 
> Assisted-by: Claude:opus
> Reported-by: Francis De Brabandere <francisdb@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221759
> Tested-by: Francis De Brabandere <francisdb@gmail.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 630a664bdd2f4..5b6c90abd4e5f 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -917,19 +917,24 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	}
>  
>  	amd_pmc_dbgfs_register(dev);
> +
> +	/*
> +	 * STB is an optional debugging facility, only enabled via the
> +	 * enable_stb module parameter.  A failure to initialize it (e.g. the
> +	 * SMU refusing the request, or the telemetry region failing to map)
> +	 * must not prevent the rest of the driver - most importantly the s0i3
> +	 * LPS0 handler - from working, so treat it as non-fatal.
> +	 */
>  	err = amd_stb_s2d_init(dev);
>  	if (err)
> -		goto err_dbgfs_unregister;
> +		dev_warn(dev->dev, "STB initialization failed (%d), continuing without STB support\n",
> +			 err);

Please add include.

>  
>  	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
>  		amd_mp2_stb_init(dev);
>  	pm_report_max_hw_sleep(U64_MAX);
>  	return 0;
>  
> -err_dbgfs_unregister:
> -	amd_pmc_dbgfs_unregister(dev);
> -	if (IS_ENABLED(CONFIG_SUSPEND))
> -		acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
>  err_pci_dev_put:
>  	pci_dev_put(rdev);
>  	return err;
> 

-- 
 i.

