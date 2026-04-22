Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FAA2857EA;
	Wed, 22 Apr 2026 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776840857; cv=none; b=lv+m5Y3j2XW9RbSBSjwrguLLc+glVxmE0tDMJC/dLIU1VUXTn6pfaKnc6SX81BfDyZQxIha/gRFxKkh5bMF6LBaicqx72xHQIddzdhsc/QwwS4KlcDDnjclTeuehndSmAwQHFzz/6rurwMIreYACf1F4bN3dCjeGY4MbyJC90mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776840857; c=relaxed/simple;
	bh=0khrdPwN7/B/JaOiHCF0u6aBQihTb63y1pMx89Buflg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8tjXZ5MUY3ZReFT0dxEkASoa2gxl4EIK1y/ZycnBIp8srCT6KLOkViQAot2TRpQ9lpZX5oSY3Q3YXlgEa9yOEyW8vZcAh1cNWV3quRWz6idYAD/zOXpqNFhQk1DOezWGXt01365l4dcgtTTGAUbybTfGp7uKTv5cmV0swWc1X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+fdS1g0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+fdS1g0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776840857; x=1808376857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0khrdPwN7/B/JaOiHCF0u6aBQihTb63y1pMx89Buflg=;
  b=S+fdS1g02Mhi0Ezk7PcPkyQEeRlLgHQIkJK9Ma8WVScGnx6Kwl4pDHWl
   BaAyNTVbOM5JcNKaE8xkt/94RoIG0K2yGVrGXTuOmxCpWgGZKfUHC+pIl
   7CIqNKNmNepylc0uLWxB0XAWTi57RM3J/Xf7XaMKwm96yCmF4Nt4eq2BX
   5BhjUETb8Kh0L5L4kfd69WZ4AHOkvaWAMRlqTolOrI+9unURPgwUQ0YJN
   /bUTOoi/0A+pqXDOQPfCCcGfPMAwRB1hsgtPtyam4on+ju/jS4o4VKmN0
   X2MAB8zXEmGPlKKp+MTH2I5Nvya/kp2VsAxXzBuG33nqFGm2pn3Cul6PF
   Q==;
X-CSE-ConnectionGUID: jpy/ITvVRpyTOqKcH0Ccnw==
X-CSE-MsgGUID: yqnFY0iETbi+0wppYB6XlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="65323165"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="65323165"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 23:54:16 -0700
X-CSE-ConnectionGUID: H+P6kzcwRxa+8vwyP7qmFg==
X-CSE-MsgGUID: h1Of9f8zRHm0NhMmTjEBWQ==
X-ExtLoop1: 1
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 23:54:13 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 316361201FC;
	Wed, 22 Apr 2026 09:54:12 +0300 (EEST)
Date: Wed, 22 Apr 2026 09:54:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net
Subject: Re: [PATCH v4 1/5] platform/x86: intel_lpss: add resource conflict
 quirk for Dell Latitude 5285
Message-ID: <aehwlPPQf5LzwmAM@kekkonen.localdomain>
References: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
 <20260421225217.12472-1-tchatard@gmail.com>
 <20260421225217.12472-2-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421225217.12472-2-tchatard@gmail.com>

Hi Thierry,

Thanks for the update.

On Tue, Apr 21, 2026 at 03:52:13PM -0700, Thierry Chatard wrote:
> The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
> and the I2C4 controller (INT3446) both claim the same MMIO region via the
> shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
> with -EBUSY, preventing the front camera (OV5670) sensor from being
> registered.
> 
> Add a DMI quirk that selects IGNORE_RESOURCE_CONFLICTS for INT3446 on this
> machine, matching the existing pattern used by other LPSS quirks.
> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>
> ---
>  drivers/mfd/intel-lpss-acpi.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
> index 63406026d..c48eac03a 100644
> --- a/drivers/mfd/intel-lpss-acpi.c
> +++ b/drivers/mfd/intel-lpss-acpi.c
> @@ -13,6 +13,8 @@
>  #include <linux/ioport.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/platform_device.h>
> @@ -52,6 +54,16 @@ static const struct intel_lpss_platform_info spt_i2c_info = {
>  	.swnode = &spt_i2c_node,
>  };
>  
> +/*
> + * Same as spt_i2c_info but with QUIRK_IGNORE_RESOURCE_CONFLICTS for Dell 5285
> + * where ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources.
> + */
> +static const struct intel_lpss_platform_info spt_i2c_info_ignore_conflicts = {
> +	.clk_rate = 120000000,
> +	.swnode = &spt_i2c_node,
> +	.quirks = QUIRK_IGNORE_RESOURCE_CONFLICTS,
> +};
> +
>  static const struct property_entry uart_properties[] = {
>  	PROPERTY_ENTRY_U32("reg-io-width", 4),
>  	PROPERTY_ENTRY_U32("reg-shift", 2),
> @@ -172,6 +184,16 @@ static const struct acpi_device_id intel_lpss_acpi_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, intel_lpss_acpi_ids);
>  
> +static const struct dmi_system_id dell5285_lpss_dmi[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
> +		},
> +	},
> +	{ }
> +};
> +
>  static int intel_lpss_acpi_probe(struct platform_device *pdev)
>  {
>  	const struct intel_lpss_platform_info *data;
> @@ -182,6 +204,18 @@ static int intel_lpss_acpi_probe(struct platform_device *pdev)
>  	if (!data)
>  		return -ENODEV;
>  
> +	/*
> +	 * Apply IGNORE_RESOURCE_CONFLICTS for I2C4 on Dell Latitude 5285.
> +	 * The ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources
> +	 * due to a BIOS bug where both use the same SB04 variable.
> +	 */
> +	if (data == &spt_i2c_info &&

I believe you can drop this check: there are other devices that yield
&spt_i2c_info, but the check below is more precise in any case.

> +	    acpi_dev_hid_uid_match(ACPI_COMPANION(&pdev->dev), "INT3446", NULL) &&
> +	    dmi_check_system(dell5285_lpss_dmi)) {
> +		dev_info(&pdev->dev, "Dell 5285: applying IGNORE_RESOURCE_CONFLICTS for I2C4\n");
> +		data = &spt_i2c_info_ignore_conflicts;
> +	}
> +
>  	info = devm_kmemdup(&pdev->dev, data, sizeof(*info), GFP_KERNEL);
>  	if (!info)
>  		return -ENOMEM;

-- 
Regards,

Sakari Ailus
