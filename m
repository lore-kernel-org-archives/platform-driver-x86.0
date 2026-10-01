Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321523E1233;
	Thu,  1 Oct 2026 07:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838314; cv=none; b=hwfuVgxH0x31EGeA0l7xqwMg0cFy79+JaS+VLg4jHvGo8i4pE8ILjD88B5/A/y5Zo6xIS0rpGLUZT8PHlqvQDzuT2jrR724jMV3DLSO3CrAmQ1GMU0NYbJTCzElSgBiuVAYSsZI/XPwxHDFKOX41VC4hNgT3qBRV101JGHViM1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838314; c=relaxed/simple;
	bh=kAzdru/C0A6ARNZbdes3zuIadmsgrU/V3oc7IQnzo7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uY6Ps1247nweH7WS1Fnabjl3f0pMWT5XPjo393avYS1Cn5XCp40sBNxe/thynut/5Zpy2j9AJvC08fGjGvx5TB1peVLLgsRdhrmIM9R4CQrdB32dbB6yk4oRU5sQWbMZev1KP69JtW7s+gf4MxhUr/pfB21GuiiXcb2iCjhP+BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itpg7SUP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itpg7SUP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790838312; x=1822374312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kAzdru/C0A6ARNZbdes3zuIadmsgrU/V3oc7IQnzo7g=;
  b=itpg7SUPuPfFjbywI4e5VnTGVHKUV4Bbrl9GYyIktInCadQ+jHN/W21l
   DUBQWSaWjT+svaywMxu6B+9poMJ0g0n+BrB26vOlt2oq+giEbFA0QHER2
   kKdGm2iI9QwpJxNuyfrqMwpZslBt2ysvcH+jdSDMKPa1WuHRSOVSG5g7/
   MQt003R/uQ02wB9kHago6RRz9Qn+vdu5NDJVaW/zicgy+BaILq4Ix0rXM
   P2avNFBeoKW7q3MxvQjjMe+RWdR2+x6/q+TvJbaRMzMvjsP1AoSweo3aS
   Ulv6EMj1n8qNYkhLNoZjobAN5rcEVJyEkuD10c/aY/o61iaoBWy6eg/uN
   w==;
X-CSE-ConnectionGUID: r0pzhX1ATb+Fo4uf+/aImA==
X-CSE-MsgGUID: ZwMfxQprRUu52qeTVTvGpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="109070855"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="109070855"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:05:11 -0700
X-CSE-ConnectionGUID: 4Ux6PACETFaFUPRvix9ing==
X-CSE-MsgGUID: AZ3dHKneQ0ejsXukcNZ9DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="305424184"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.27])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:05:08 -0700
Date: Thu, 1 Oct 2026 10:05:05 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net, v.vitovt@gmail.com, dmanresa@gmail.com
Subject: Re: [PATCH v11 1/9] mfd: intel-lpss: add resource conflict quirk for
 Dell Latitude 5285
Message-ID: <ar4GIfvaxGiykYKX@ashevche-desk.local>
References: <20260930214321.600863-1-tchatard@gmail.com>
 <20260930214321.600863-2-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930214321.600863-2-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 30, 2026 at 02:43:13PM -0700, Thierry Chatard wrote:
> The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
> and the I2C4 controller (INT3446) both claim the same MMIO region via the
> shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
> with -EBUSY, preventing the front camera (OV5670) sensor from being
> registered.
> 
> Match the affected machine by DMI and the affected device by ACPI ID,
> carrying QUIRK_IGNORE_RESOURCE_CONFLICTS in the ACPI match data and
> applying it to the per-device info in probe. This follows the quirk
> organisation used by the PCI counterpart.

> Assisted-by: Claude Code:claude-opus-4-8

Assisted-by: LLM

...

> +/*
> + * Devices that need a quirk applied only on the machines matched by
> + * intel_lpss_quirk_dmi[] below. The quirk to apply is carried in the
> + * matching entry's driver_data.
> + */
> +static const struct acpi_device_id intel_lpss_acpi_quirk_ids[] = {
> +	/* Dell Latitude 5285: ACPI GEXP device conflicts with I2C4 (INT3446) */
> +	{ "INT3446", QUIRK_IGNORE_RESOURCE_CONFLICTS },

While at it, please move to use C99 initialisers.

> +	{ }
> +};

-- 
With Best Regards,
Andy Shevchenko


