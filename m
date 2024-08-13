Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011413A8CE
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Aug 2024 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723558271; cv=none; b=U8/f6unMIwYJQMNR23//ffhREjYdGfQD4WKaAX3R8r2G7fmCC6XFwkgaMsCSiVzSWIG4YmYqqZilMcebg+B20DB4ZnfGtFT/S1BbPopvYxl3br8FO3vgYSLrB4ED2FIgUY27AlsAFRUtJFqTXnwumonEQj5flid6/0nFJepiOYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723558271; c=relaxed/simple;
	bh=yP42tp1EKZIXmizeIVPPkqaLg7MrakOsR6KTQIj6Qzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNJTd0m4v/W5+Bl3gtDbQ1EhjZCVmzFHceAk82P+7q85xgEC9feWjFdTT6PfHRIpvmDvcAk8fHsRhsnK+FQV6AyVrespYhBCcgQ7awb281vevJ5wk4BNZYmRC0Ux+WMZiuKtuG489XfOFTCXEzc8ig+So9cblcdi+LUkn26IqlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1Y7ZzQF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1Y7ZzQF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723558269; x=1755094269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yP42tp1EKZIXmizeIVPPkqaLg7MrakOsR6KTQIj6Qzo=;
  b=L1Y7ZzQF29TnS31k/B7i/T6DJyYpLDc5EXfO81oSJImPArvYB+2Xd0NH
   ePACC4kM1AuPODlWkIcVNsAYMmfyXggn4GOSWjzKpu/x03YFLY964KAUN
   DhARmM7D69FmH7qHRmgVJtFzEoke3qqwRnxeRi38CWoauh7VTSHpZW70M
   5vyyWlgF1ss//RhtTXoBVT1XAUXrvqn+keG1lYji1NVerzPvcBnnaYiiD
   mGTL8iWvCBsDp1j5SCSuIqogpq85AzY0uiqiYwI8Kt+kzy2Dv2IfZyDXp
   MoivpT/ahDEa7HPIXabwnopyrdLIyobKmf3w7nnOA/vn0imk13C+7gyHX
   g==;
X-CSE-ConnectionGUID: 75C5e6VtT3GCbZrX7FbvIg==
X-CSE-MsgGUID: 9SNoLdTNRo2S3tNSNzGuqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21367539"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="21367539"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 07:11:08 -0700
X-CSE-ConnectionGUID: xLvWgcslSRSHbZUN8q8ZnA==
X-CSE-MsgGUID: CxDpHyeMR6eYZlQRBgDAXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; 
   d="scan'208";a="59237391"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 07:11:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdsEp-0000000ErHe-1I8R;
	Tue, 13 Aug 2024 17:11:03 +0300
Date: Tue, 13 Aug 2024 17:11:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com, hdegoede@redhat.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v11] drm/xe/vsec: Support BMG devices
Message-ID: <Zrtpd_WwougszltH@smile.fi.intel.com>
References: <20240812200422.444078-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812200422.444078-1-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 12, 2024 at 04:04:22PM -0400, Michael J. Ruhl wrote:
> The Battlemage (BMG) discrete graphics card supports
> the Platform, Monitoring Technology (PMT) feature
> directly on the primary PCI device.
> 
> Utilize the PMT callback API to add support for the BMG
> devices.

...

> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/intel_vsec.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pci.h>

...

> +#define SOC_BASE		0x280000
> +
> +#define BMG_PMT_BASE		0xDB000
> +#define BMG_DISCOVERY_OFFSET	(SOC_BASE + BMG_PMT_BASE)

> +#define BMG_TELEMETRY_BASE	0xE0000
> +#define BMG_TELEMETRY_OFFSET	(SOC_BASE + BMG_TELEMETRY_BASE)

This looks like double indirection.
Wouldn't suffix _BASE_OFFSET be better for PMT and TELEMETRY cases?

...

> +#define BMG_DEVICE_ID 0xE2F8

Is this defined in any specification? I mean is the format the same as PCI device ID?

...

> +#define GFX_BAR			0

Do you need a separate definition for this?

...

> +enum record_id {
> +	PUNIT,
> +	OOBMSM_0,
> +	OOBMSM_1

Trailing comma?

> +};
> +
> +enum capability {
> +	CRASHLOG,
> +	TELEMETRY,
> +	WATCHER

Ditto?

> +};

...

> +	switch (record_id) {
> +	case PUNIT:
> +		*index = 0;
> +		if (cap_type == TELEMETRY)
> +			*offset = PUNIT_TELEMETRY_OFFSET;
> +		else
> +			*offset = PUNIT_WATCHER_OFFSET;
> +		break;
> +
> +	case OOBMSM_0:
> +		*index = 1;
> +		if (cap_type == WATCHER)
> +			*offset = OOBMSM_0_WATCHER_OFFSET;
> +		break;
> +
> +	case OOBMSM_1:
> +		*index = 1;
> +		if (cap_type == TELEMETRY)
> +			*offset = OOBMSM_1_TELEMETRY_OFFSET;
> +		break;

default case?

> +	}

...

> +static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, u32 count)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
> +	u32 mem_region;
> +	u32 offset;
> +	int ret;
> +
> +	ret = guid_decode(guid, &mem_region, &offset);
> +	if (ret)
> +		return ret;
> +
> +	telem_addr += offset;
> +
> +	guard(mutex)(&xe->pmt.lock);
> +
> +	/* indicate that we are not at an appropriate power level */
> +	if (!xe_pm_runtime_get_if_active(xe))
> +		return -ENODATA;
> +
> +	/* set SoC re-mapper index register based on GUID memory region */
> +	xe_mmio_rmw32(xe->tiles[0].primary_gt, SG_REMAP_INDEX1, SG_REMAP_BITS,
> +		      FIELD_PREP(SG_REMAP_BITS, mem_region));
> +
> +	memcpy_fromio(data, telem_addr, count);

> +	ret = count;
> +	xe_pm_runtime_put(xe);

Does this have a side effect on count? If yes, a comment, if no, you may return
count directly.

> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko


