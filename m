Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D8844CF2C;
	Mon, 11 May 2026 17:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519557; cv=none; b=aV9Tmt/X1OzbtrVyTE3aKilY8G4py5Lbh2EfGxCEoLB5AFU15jTwQ6Z1fYInK/Mpcrf1TwbfcPGk2QvNh1tWVD4xeiyW7bq9K+vbVF7cLrB20TN3UCEcdEqAmy6u7zntpxtdTDnYywPdD1F3OXA7iMc4bJ9nATuS1aaYorrUqyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519557; c=relaxed/simple;
	bh=OJqbEVqPpsGl7sw9OQ6UIsHKt7a2I3x9r50XJ46TTho=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Q8VoA/XGn66pbHFMZJXYef7AY2w0WRddf3l4PAuYQIQxl0cBgKydX6PHWlYNcUg0cTGKN9g4CaZFQhEeg3izPmAGr/2XZ3gfTiZLMCUJ5lxAKgxpy2YYvL8yBnbYnAJfsWqHWXqGD7CldlQGsx5xUMuxdg8bj7NZqRzyGW5p4x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czUQdm7T; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czUQdm7T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778519554; x=1810055554;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OJqbEVqPpsGl7sw9OQ6UIsHKt7a2I3x9r50XJ46TTho=;
  b=czUQdm7TQEpSp+mfjzYFqYNgowrp02wC4SmH+CqPf+fAaF0wa3Wnfr2F
   XZ1UjtSOD2kqXI3fpO2Vs71ZjBVwaox9FP0QyG5Smp6g99VIbTt/HWng4
   l8hAcbwtcrMOOTbrBhvsVVT009pTEs+PhaTs8KO5AOVVOv1W8QdZnGL+s
   r6qefyWgHHRwjng6gfiIHHn/xuqLm2jxFkIly30brHJ41YuWDXavqv9jT
   5Hh6YinCgu6ojKnK/vttXF6XxvjVL45qq3j98AhAfVGF0ztCvLcDi9oQr
   RLfVKivIOQ5FF3ucV8x9C+bKONyEwnLG35NRlAd0z3T/ebj7kF8Ly+Vbj
   A==;
X-CSE-ConnectionGUID: DY/oXUqYSQugJMwfU8OcOQ==
X-CSE-MsgGUID: emo8Juz8SCKnOdm5zByvBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="89720114"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="89720114"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 10:12:34 -0700
X-CSE-ConnectionGUID: dhqwgcBWS92JI870+nWqbA==
X-CSE-MsgGUID: C3dpS6jrTjaJcS92wwl9Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="242474718"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 10:12:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 May 2026 20:12:27 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: irenic.rajneesh@gmail.com, ilpo.jarvinen@linux.intel.com, 
    srinivas.pandruvada@linux.intel.com, xi.pardee@linux.intel.com, 
    hansg@kernel.org, linux-kernel@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V3 06/16] platform/x86/intel/pmt: Unify header fetch and
 add ACPI source
In-Reply-To: <20260501231054.3890305-7-david.e.box@linux.intel.com>
Message-ID: <51cd9130-4d15-6415-707e-95f95ef21866@linux.intel.com>
References: <20260501231054.3890305-1-david.e.box@linux.intel.com> <20260501231054.3890305-7-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 May 2026, David E. Box wrote:

> Allow the PMT class to read discovery headers from either PCI MMIO or
> ACPI-provided entries, depending on the discovery source. The new
> source-aware fetch helper retrieves the first two QWORDs for both paths
> while keeping the mapped discovery table available for users such as
> crashlog.
> 
> Split intel_pmt_populate_entry() into source-specific resolvers:
>   - pmt_resolve_access_pci(): handles both ACCESS_LOCAL and ACCESS_BARID
>     for PCI-backed devices and sets entry->pcidev. Same existing
>     functionality.
>   - pmt_resolve_access_acpi(): handles only ACCESS_BARID for ACPI-backed
>     devices, rejecting ACCESS_LOCAL which has no valid semantics without
>     a physical discovery resource.
> 
> This maintains existing PCI behavior and makes no functional changes
> for PCI devices.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> V3 changes:
>   - Folded the header fetch rework back into intel_pmt_dev_create() after
>     dropping the previous common header decode helper patch
>   - Replaced repeated literal header count values with
>     PMT_DISC_HEADER_QWORDS for discovery-header handling
>   - Updated discovery-header buffer declarations and copy size
>     calculations to use PMT_DISC_HEADER_QWORDS * sizeof(*headers)
>     for clarity in function-parameter context
>   - Cleaned up line wrapping/indentation
> 
> V2 changes:
>   - In pmt_resolve_access_acpi(), moved dev_err() call to single line
>     instead of split across two lines
>   - Restructured error handling in intel_pmt_populate_entry(), moving error
>     returns from after switch/case into each case statement for better
>     readability
>   - Addressed Ilpo's feedback on error message formatting and error
>     handling patterns
> 
>  drivers/platform/x86/intel/pmt/class.c | 130 ++++++++++++++++++++++---
>  1 file changed, 118 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index 61834cbe3764..a162df5939e0 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -204,9 +204,9 @@ struct class intel_pmt_class = {
>  };
>  EXPORT_SYMBOL_GPL(intel_pmt_class);
>  
> -static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
> -				    struct intel_vsec_device *ivdev,
> -				    int idx)
> +static int pmt_resolve_access_pci(struct intel_pmt_entry *entry,
> +				  struct intel_vsec_device *ivdev,
> +				  int idx)
>  {
>  	struct pci_dev *pci_dev = to_pci_dev(ivdev->dev);
>  	struct device *dev = &ivdev->auxdev.dev;
> @@ -286,6 +286,81 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
>  	}
>  
>  	entry->pcidev = pci_dev;
> +
> +	return 0;
> +}
> +
> +static int pmt_resolve_access_acpi(struct intel_pmt_entry *entry,
> +				   struct intel_vsec_device *ivdev)
> +{
> +	struct pci_dev *pci_dev = NULL;
> +	struct device *dev = &ivdev->auxdev.dev;
> +	struct intel_pmt_header *header = &entry->header;
> +	u8 bir;
> +
> +	if (dev_is_pci(ivdev->dev))
> +		pci_dev = to_pci_dev(ivdev->dev);
> +
> +	/*
> +	 * The base offset should always be 8 byte aligned.
> +	 *
> +	 * For non-local access types the lower 3 bits of base offset
> +	 * contains the index of the base address register where the
> +	 * telemetry can be found.
> +	 */
> +	bir = GET_BIR(header->base_offset);
> +
> +	switch (header->access_type) {
> +	case ACCESS_BARID:
> +		/* ACPI platform drivers use base_addr */
> +		if (ivdev->base_addr) {
> +			entry->base_addr = ivdev->base_addr +
> +					   GET_ADDRESS(header->base_offset);
> +			break;
> +		}
> +
> +		/* If base_addr is not provided, then this is an ACPI companion device */
> +		if (!pci_dev) {
> +			dev_err(dev, "ACCESS_BARID requires PCI BAR resources or base_addr\n");
> +			return -EINVAL;
> +		}
> +
> +		entry->base_addr = pci_resource_start(pci_dev, bir) +
> +			GET_ADDRESS(header->base_offset);
> +		break;
> +	default:
> +		dev_err(dev, "Unsupported access type %d for ACPI based PMT\n",
> +			header->access_type);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
> +				    struct intel_vsec_device *ivdev,
> +				    int idx)
> +{
> +	struct intel_pmt_header *header = &entry->header;
> +	struct device *dev = &ivdev->auxdev.dev;
> +	int ret;
> +
> +	switch (ivdev->src) {
> +	case INTEL_VSEC_DISC_PCI:
> +		ret = pmt_resolve_access_pci(entry, ivdev, idx);
> +		if (ret)
> +			return ret;
> +		break;
> +	case INTEL_VSEC_DISC_ACPI:
> +		ret = pmt_resolve_access_acpi(entry, ivdev);
> +		if (ret)
> +			return ret;
> +		break;
> +	default:
> +		dev_err(dev, "Unknown discovery source: %d\n", ivdev->src);
> +		return -EINVAL;
> +	}
> +
>  	entry->guid = header->guid;
>  	entry->size = header->size;
>  	entry->cb = ivdev->priv_data;
> @@ -370,21 +445,52 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
>  	return ret;
>  }
>  
> +static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
> +			   struct intel_pmt_entry *entry, u64 headers[2])
> +{
> +	struct device *dev = &ivdev->auxdev.dev;
> +
> +	switch (ivdev->src) {
> +	case INTEL_VSEC_DISC_PCI: {
> +		void __iomem *disc_table;
> +
> +		disc_table = devm_ioremap_resource(dev, &ivdev->resource[idx]);
> +		if (IS_ERR(disc_table))
> +			return PTR_ERR(disc_table);
> +
> +		memcpy_fromio(headers, disc_table, 2 * sizeof(u64));
> +		memcpy(entry->disc_header, headers, sizeof(entry->disc_header));
> +
> +		/* Used by crashlog driver */
> +		entry->disc_table = disc_table;
> +
> +		return 0;
> +	}
> +	case INTEL_VSEC_DISC_ACPI: {
> +		memcpy(headers, &ivdev->acpi_disc[idx][0], 2 * sizeof(u64));
> +		memcpy(entry->disc_header, headers, sizeof(entry->disc_header));

This risks copying from stack if one of the magic literals (that is not 
bound to each other) is ever changed, so static_assert()ing it cannot 
occur wouldn't hurt. It took me a while to figure out how you can safely 
copy 4 entries from 2 before realizing there's also type downsizing going 
on here.

TBH, I don't very much like how this is currently architected. It would be 
much nicer if the magic numbers would be properly bound to each other 
with defines so we wouldn't need to bind them using static_assert()s.
Is there some reason why one of these copy/array sizes cannot be 
determined from the other?

> +		entry->disc_table = NULL;
> +
> +		return 0;
> +	}
> +	default:
> +		dev_err(dev, "Unknown discovery source type: %d\n", ivdev->src);
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_namespace *ns,
>  			 struct intel_vsec_device *intel_vsec_dev, int idx)
>  {
>  	struct device *dev = &intel_vsec_dev->auxdev.dev;
> -	struct resource	*disc_res;
> +	u64 headers[2];
>  	int ret;
>  
> -	disc_res = &intel_vsec_dev->resource[idx];
> -
> -	entry->disc_table = devm_ioremap_resource(dev, disc_res);
> -	if (IS_ERR(entry->disc_table))
> -		return PTR_ERR(entry->disc_table);
> -
> -	memcpy_fromio(entry->disc_header, entry->disc_table,
> -		      sizeof(entry->disc_header));
> +	ret = pmt_get_headers(intel_vsec_dev, idx, entry, headers);
> +	if (ret)
> +		return ret;
>  
>  	if (ns->pmt_pre_decode) {
>  		ret = ns->pmt_pre_decode(intel_vsec_dev, entry);
> 

-- 
 i.

