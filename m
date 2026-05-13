Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE163C1F5B;
	Wed, 13 May 2026 21:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778708594; cv=none; b=rDPSxSC7e45QmcHXavimLeSShspq74+ya8Fj6cqp5Z4NWde8a3pJIeC1z7EpJlPR/Q5HAOSqkq9HQsLk0YXyF/ye3YcRNIkKqa1m9oGz8qno9L5xGo40amHsN7CBK5ii8jjzMtnDZHVH2HpC3FBR3SQDDhhzAxnYkRWXHubgJIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778708594; c=relaxed/simple;
	bh=cArv8S/Fu365F1pnWGS3xJ12Xuko7/yh+m1g2BuCoKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGsUAimU3St6965pNlGBQ3+qt+nGYX0dedDsUjGJG+/VT0OaG1z5DpSozRjnZU5i08ViZP9+J2Blhl+oTaHGtYOVz/T/4J3GKuES+cKW1afngAmp1qbCnu2D5w0IczgXNfmQRG5JA2QT6Eydb3NLCqlqf3cXlvCB+PFe6JYW5Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVngeyud; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVngeyud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778708591; x=1810244591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cArv8S/Fu365F1pnWGS3xJ12Xuko7/yh+m1g2BuCoKM=;
  b=ZVngeyudQXwX+9cZhgivv1DiTm8QZXGVsvcRoWL+8qcxnKGx/8mHMDHn
   1LCzqwFMm6wV18W1hXFiR6LMVTiaj9MD8kLcnQ6H+aDbyh49YUWud0aEj
   1J3XtSC62t9gcDRLMh0hQXyLirCewJPPAa1Lwxvx9s7CXYVEWmubNMhs4
   89HADS4w2zcgBnuj1PvVNf0minxI26Iy6POjLUyOYA6IFn7YiMmziZPH+
   EZRmFzHhC/J5Ovv53JuzmBEkix0guqVG0NrFYsUWPorkgphHuBSV6/dhf
   yxYCljSYkBP+pbjVcqkJUaQiJVbnxCbxsP+Y2yBhwOCn/9dO7ffxEB7Ga
   Q==;
X-CSE-ConnectionGUID: J8TMuPJ7S/+Tu3fdu+shbA==
X-CSE-MsgGUID: ivoDBGF5SAGWrGcgsFtU6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="102314719"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="102314719"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:43:10 -0700
X-CSE-ConnectionGUID: tcrSTaxZTYWBQkUeqrpkLA==
X-CSE-MsgGUID: r9k/s17ESK+BtRJaEQs+hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="238442961"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:43:09 -0700
Date: Wed, 13 May 2026 14:43:09 -0700
From: David Box <david.e.box@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
	xi.pardee@linux.intel.com, hansg@kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V3 06/16] platform/x86/intel/pmt: Unify header fetch and
 add ACPI source
Message-ID: <r4hcgrvuo2km3ceg3n5rnq3vzgxb6akdtqxsumz33smolyr3iu@lprxlq7a2nxt>
References: <20260501231054.3890305-1-david.e.box@linux.intel.com>
 <20260501231054.3890305-7-david.e.box@linux.intel.com>
 <51cd9130-4d15-6415-707e-95f95ef21866@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51cd9130-4d15-6415-707e-95f95ef21866@linux.intel.com>

On Mon, May 11, 2026 at 08:12:27PM +0300, Ilpo Järvinen wrote:
> On Fri, 1 May 2026, David E. Box wrote:
> 
> > Allow the PMT class to read discovery headers from either PCI MMIO or
> > ACPI-provided entries, depending on the discovery source. The new
> > source-aware fetch helper retrieves the first two QWORDs for both paths
> > while keeping the mapped discovery table available for users such as
> > crashlog.
> > 
> > Split intel_pmt_populate_entry() into source-specific resolvers:
> >   - pmt_resolve_access_pci(): handles both ACCESS_LOCAL and ACCESS_BARID
> >     for PCI-backed devices and sets entry->pcidev. Same existing
> >     functionality.
> >   - pmt_resolve_access_acpi(): handles only ACCESS_BARID for ACPI-backed
> >     devices, rejecting ACCESS_LOCAL which has no valid semantics without
> >     a physical discovery resource.
> > 
> > This maintains existing PCI behavior and makes no functional changes
> > for PCI devices.
> > 
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > ---
> > V3 changes:
> >   - Folded the header fetch rework back into intel_pmt_dev_create() after
> >     dropping the previous common header decode helper patch
> >   - Replaced repeated literal header count values with
> >     PMT_DISC_HEADER_QWORDS for discovery-header handling
> >   - Updated discovery-header buffer declarations and copy size
> >     calculations to use PMT_DISC_HEADER_QWORDS * sizeof(*headers)
> >     for clarity in function-parameter context
> >   - Cleaned up line wrapping/indentation
> > 
> > V2 changes:
> >   - In pmt_resolve_access_acpi(), moved dev_err() call to single line
> >     instead of split across two lines
> >   - Restructured error handling in intel_pmt_populate_entry(), moving error
> >     returns from after switch/case into each case statement for better
> >     readability
> >   - Addressed Ilpo's feedback on error message formatting and error
> >     handling patterns
> > 
> >  drivers/platform/x86/intel/pmt/class.c | 130 ++++++++++++++++++++++---
> >  1 file changed, 118 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> > index 61834cbe3764..a162df5939e0 100644
> > --- a/drivers/platform/x86/intel/pmt/class.c
> > +++ b/drivers/platform/x86/intel/pmt/class.c
> > @@ -204,9 +204,9 @@ struct class intel_pmt_class = {
> >  };
> >  EXPORT_SYMBOL_GPL(intel_pmt_class);
> >  
> > -static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
> > -				    struct intel_vsec_device *ivdev,
> > -				    int idx)
> > +static int pmt_resolve_access_pci(struct intel_pmt_entry *entry,
> > +				  struct intel_vsec_device *ivdev,
> > +				  int idx)
> >  {
> >  	struct pci_dev *pci_dev = to_pci_dev(ivdev->dev);
> >  	struct device *dev = &ivdev->auxdev.dev;
> > @@ -286,6 +286,81 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
> >  	}
> >  
> >  	entry->pcidev = pci_dev;
> > +
> > +	return 0;
> > +}
> > +
> > +static int pmt_resolve_access_acpi(struct intel_pmt_entry *entry,
> > +				   struct intel_vsec_device *ivdev)
> > +{
> > +	struct pci_dev *pci_dev = NULL;
> > +	struct device *dev = &ivdev->auxdev.dev;
> > +	struct intel_pmt_header *header = &entry->header;
> > +	u8 bir;
> > +
> > +	if (dev_is_pci(ivdev->dev))
> > +		pci_dev = to_pci_dev(ivdev->dev);
> > +
> > +	/*
> > +	 * The base offset should always be 8 byte aligned.
> > +	 *
> > +	 * For non-local access types the lower 3 bits of base offset
> > +	 * contains the index of the base address register where the
> > +	 * telemetry can be found.
> > +	 */
> > +	bir = GET_BIR(header->base_offset);
> > +
> > +	switch (header->access_type) {
> > +	case ACCESS_BARID:
> > +		/* ACPI platform drivers use base_addr */
> > +		if (ivdev->base_addr) {
> > +			entry->base_addr = ivdev->base_addr +
> > +					   GET_ADDRESS(header->base_offset);
> > +			break;
> > +		}
> > +
> > +		/* If base_addr is not provided, then this is an ACPI companion device */
> > +		if (!pci_dev) {
> > +			dev_err(dev, "ACCESS_BARID requires PCI BAR resources or base_addr\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		entry->base_addr = pci_resource_start(pci_dev, bir) +
> > +			GET_ADDRESS(header->base_offset);
> > +		break;
> > +	default:
> > +		dev_err(dev, "Unsupported access type %d for ACPI based PMT\n",
> > +			header->access_type);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
> > +				    struct intel_vsec_device *ivdev,
> > +				    int idx)
> > +{
> > +	struct intel_pmt_header *header = &entry->header;
> > +	struct device *dev = &ivdev->auxdev.dev;
> > +	int ret;
> > +
> > +	switch (ivdev->src) {
> > +	case INTEL_VSEC_DISC_PCI:
> > +		ret = pmt_resolve_access_pci(entry, ivdev, idx);
> > +		if (ret)
> > +			return ret;
> > +		break;
> > +	case INTEL_VSEC_DISC_ACPI:
> > +		ret = pmt_resolve_access_acpi(entry, ivdev);
> > +		if (ret)
> > +			return ret;
> > +		break;
> > +	default:
> > +		dev_err(dev, "Unknown discovery source: %d\n", ivdev->src);
> > +		return -EINVAL;
> > +	}
> > +
> >  	entry->guid = header->guid;
> >  	entry->size = header->size;
> >  	entry->cb = ivdev->priv_data;
> > @@ -370,21 +445,52 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
> >  	return ret;
> >  }
> >  
> > +static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
> > +			   struct intel_pmt_entry *entry, u64 headers[2])
> > +{
> > +	struct device *dev = &ivdev->auxdev.dev;
> > +
> > +	switch (ivdev->src) {
> > +	case INTEL_VSEC_DISC_PCI: {
> > +		void __iomem *disc_table;
> > +
> > +		disc_table = devm_ioremap_resource(dev, &ivdev->resource[idx]);
> > +		if (IS_ERR(disc_table))
> > +			return PTR_ERR(disc_table);
> > +
> > +		memcpy_fromio(headers, disc_table, 2 * sizeof(u64));
> > +		memcpy(entry->disc_header, headers, sizeof(entry->disc_header));
> > +
> > +		/* Used by crashlog driver */
> > +		entry->disc_table = disc_table;
> > +
> > +		return 0;
> > +	}
> > +	case INTEL_VSEC_DISC_ACPI: {
> > +		memcpy(headers, &ivdev->acpi_disc[idx][0], 2 * sizeof(u64));
> > +		memcpy(entry->disc_header, headers, sizeof(entry->disc_header));
> 
> This risks copying from stack if one of the magic literals (that is not 
> bound to each other) is ever changed, so static_assert()ing it cannot 
> occur wouldn't hurt. It took me a while to figure out how you can safely 
> copy 4 entries from 2 before realizing there's also type downsizing going 
> on here.
> 
> TBH, I don't very much like how this is currently architected. It would be 
> much nicer if the magic numbers would be properly bound to each other 
> with defines so we wouldn't need to bind them using static_assert()s.
> Is there some reason why one of these copy/array sizes cannot be 
> determined from the other?

No. I'll bind with a common define in intel_vsec.h so that ivdev->acpi_disc,
entry->disc_header, and headers (which I'll change to u32 [4]) all use it.

Thanks.

> 
> > +		entry->disc_table = NULL;
> > +
> > +		return 0;
> > +	}
> > +	default:
> > +		dev_err(dev, "Unknown discovery source type: %d\n", ivdev->src);
> > +		break;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> >  int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_namespace *ns,
> >  			 struct intel_vsec_device *intel_vsec_dev, int idx)
> >  {
> >  	struct device *dev = &intel_vsec_dev->auxdev.dev;
> > -	struct resource	*disc_res;
> > +	u64 headers[2];
> >  	int ret;
> >  
> > -	disc_res = &intel_vsec_dev->resource[idx];
> > -
> > -	entry->disc_table = devm_ioremap_resource(dev, disc_res);
> > -	if (IS_ERR(entry->disc_table))
> > -		return PTR_ERR(entry->disc_table);
> > -
> > -	memcpy_fromio(entry->disc_header, entry->disc_table,
> > -		      sizeof(entry->disc_header));
> > +	ret = pmt_get_headers(intel_vsec_dev, idx, entry, headers);
> > +	if (ret)
> > +		return ret;
> >  
> >  	if (ns->pmt_pre_decode) {
> >  		ret = ns->pmt_pre_decode(intel_vsec_dev, entry);
> > 
> 
> -- 
>  i.
> 
