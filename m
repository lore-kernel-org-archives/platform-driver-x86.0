Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A862C08DC;
	Fri, 22 May 2026 01:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779415150; cv=none; b=bOASqkmNbVdpMWZaI9SmOQ2icLu2NFhRiZnlEDKyCVlxJNElDziJNRZYBu0S3PZ9Q6ogLxBw9pq4y2G85BZMqoQC0zmGGlxUZUbqU/VCnyoM/VhMPE8iaz6hWrMsBIHqb+FO607BtkOBF2rpzwWSow/CLjNYtTijpweiNrDu0Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779415150; c=relaxed/simple;
	bh=THgKe1Fo6LD/xyb9PbGGL69UBrdeqiw0t21/CBorkc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjlzSgqA+5TNEnF7+jeQxsyO9VmOjA/t1KhbFIkCFPvC2ZNGl+NzEPVMDcnlz2N8riSZmtsMgqHnqvdONkdIKl1c58W/Sa3SiKXg5RTysdgWJTkti9jYgmx41ct7XCDs29p7kCSrZHDJXG+4y6RMSrHV2/8DRTl5fliWG+s8SYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=javGHbXJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="javGHbXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779415148; x=1810951148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=THgKe1Fo6LD/xyb9PbGGL69UBrdeqiw0t21/CBorkc4=;
  b=javGHbXJ/hs8Fm2wc7b8jlAXpEWaLZjcCQVnoWoIbD94Wh48CTy+Gjle
   uLPb5ROr0p/4XI4K7OK4ADXJRHiiUXgoNy+hFjksf1l54WFnURAwiisvS
   dCv97cqvtGKGNBwpXqgSIBnl0YuLIjhOxlQ52DNlp3eaKmW9VAXMwPwFR
   Gw6WFlcaAcOKmHxvS8Q0kLaFaUwu062Yd5OfxHekFLsWYaK1J1GFQWMZc
   SKwWESFSXS5Pi4JGh/8HT0l/BMklw63jZTTL6jgAAGBqCi+Yy+lHxX5H3
   s1Mfy+++mRaITHfdhFRpWhSOFVsDFhQLeJMcrW1BYteBS18n5NSz8rtUm
   A==;
X-CSE-ConnectionGUID: Nl8EVrKfRQKUOTbGxdx6ow==
X-CSE-MsgGUID: plzPRPMcSIu1fOYZjF6jEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="82922083"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="82922083"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 18:59:07 -0700
X-CSE-ConnectionGUID: ZakR17XxReOiILMc/Pdv8g==
X-CSE-MsgGUID: FVVawsztSoe2DK6vGmoTYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="245016460"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 18:59:07 -0700
Date: Thu, 21 May 2026 18:59:07 -0700
From: David Box <david.e.box@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: y@linux.intel.com, Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Xi Pardee <xi.pardee@linux.intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v4 14/16] platform/x86/intel/pmc/ssram: Add ACPI
 discovery scaffolding
Message-ID: <glavd7hludlc23ycynwha6ofu2ij525q7pl66tebmh72o6thur@ctrw6jt6okwc>
References: <20260515002130.701457-1-david.e.box@linux.intel.com>
 <20260515002130.701457-15-david.e.box@linux.intel.com>
 <44de558e-76af-997b-6097-0718616340d1@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44de558e-76af-997b-6097-0718616340d1@linux.intel.com>

On Tue, May 19, 2026 at 03:46:46PM +0300, Ilpo Järvinen wrote:
> On Thu, 14 May 2026, David E. Box wrote:
> 
> > Prepare the SSRAM telemetry driver for ACPI-based discovery by adding the
> > common initialization path and selection framework needed for both PCI and
> > ACPI resource discovery.
> > 
> > At this stage, existing supported devices continue to use the PCI path.
> > This change lays the groundwork for follow-on patches that wire platform
> > IDs to the ACPI policy path.
> > 
> > Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > ---
> > V4 - Replaced local raw ACPI discovery pointer type u32 (*)[4] with
> >      acpi_disc_t in SSRAM ACPI initialization path.
> > 
> > V3 - No changes
> > 
> > V2 changes:
> >   - Fixed cleanup patterns using __free() attributes
> >   - Addressed Ilpo's recommendations for safer cleanup.h patterns
> > 
> >  .../platform/x86/intel/pmc/ssram_telemetry.c  | 70 +++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> > index 597bfb7ad822..1a9f1e67cbe1 100644
> > --- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> > +++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (c) 2023, Intel Corporation.
> >   */
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/bits.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/device.h>
> > @@ -29,14 +30,17 @@ DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap(_T))
> >  
> >  enum resource_method {
> >  	RES_METHOD_PCI,
> > +	RES_METHOD_ACPI,
> >  };
> >  
> >  struct ssram_type {
> >  	enum resource_method method;
> > +	enum pmc_index p_index;
> >  };
> >  
> >  static const struct ssram_type pci_main = {
> >  	.method = RES_METHOD_PCI,
> > +	.p_index = PMC_IDX_MAIN,
> >  };
> >  
> >  static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
> > @@ -149,6 +153,67 @@ static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev)
> >  	return ret;
> >  }
> >  
> > +static int pmc_ssram_telemetry_get_pmc_acpi(struct pci_dev *pcidev,  unsigned int pmc_idx)
> > +{
> > +	u64 ssram_base;
> > +
> > +	ssram_base = pci_resource_start(pcidev, 0);
> > +	if (!ssram_base)
> > +		return -ENODEV;
> > +
> > +	void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =
> > +		ioremap(ssram_base, SSRAM_HDR_SIZE);
> > +	if (!ssram)
> > +		return -ENOMEM;
> > +
> > +	pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
> > +
> > +	return 0;
> > +}
> > +
> > +static int pmc_ssram_telemetry_acpi_init(struct pci_dev *pcidev,
> > +					 enum pmc_index index)
> > +{
> > +	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
> > +	acpi_handle handle = ACPI_HANDLE(&pcidev->dev);
> 
> Move the assignment next to !handle check.

Done.

> 
> > +	struct intel_vsec_header header;
> > +	struct intel_vsec_header *headers[2] = { &header, NULL };
> > +	struct intel_vsec_platform_info info = { };
> > +	void *dsd_buf __free(pmc_acpi_free) = buf.pointer;
> 
> Why is this here and not below the acpi function call?

Good catch. I had several of these and missed this one.

> 
> > +	union acpi_object *dsd;
> > +	acpi_status status;
> > +	int ret;
> > +
> > +	if (!handle)
> > +		return -ENODEV;
> > +
> > +	status = acpi_evaluate_object(handle, "_DSD", NULL, &buf);
> > +	if (ACPI_FAILURE(status))
> > +		return -ENODEV;
> > +
> > +	dsd = pmc_find_telem_guid(buf.pointer);
> 
> pmc_find_telem_guid(dsd_buf) ?

Yes. Switched in V5.

Thanks for the review.

David

> 
> > +	if (!dsd)
> > +		return -ENODEV;
> > +
> > +	acpi_disc_t disc __free(kfree) = pmc_parse_telem_dsd(dsd, &header);
> > +	if (IS_ERR(disc))
> > +		return PTR_ERR(disc);
> > +
> > +	info.headers = headers;
> > +	info.caps = VSEC_CAP_TELEMETRY;
> > +	info.acpi_disc = disc;
> > +	info.src = INTEL_VSEC_DISC_ACPI;
> > +
> > +	/* This is an ACPI companion device. PCI BAR will be used for base addr. */
> > +	info.base_addr = 0;
> > +
> > +	ret = intel_vsec_register(&pcidev->dev, &info);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return pmc_ssram_telemetry_get_pmc_acpi(pcidev, index);
> > +}
> > +
> >  /**
> >   * pmc_ssram_telemetry_get_pmc_info() - Get a PMC devid and base_addr information
> >   * @pmc_idx:               Index of the PMC
> > @@ -189,6 +254,7 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_de
> >  {
> >  	const struct ssram_type *ssram_type;
> >  	enum resource_method method;
> > +	enum pmc_index index;
> >  	int ret;
> >  
> >  	ssram_type = (const struct ssram_type *)id->driver_data;
> > @@ -198,6 +264,7 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_de
> >  	}
> >  
> >  	method = ssram_type->method;
> > +	index = ssram_type->p_index;
> >  
> >  	ret = pcim_enable_device(pcidev);
> >  	if (ret) {
> > @@ -207,6 +274,8 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_de
> >  
> >  	if (method == RES_METHOD_PCI)
> >  		ret = pmc_ssram_telemetry_pci_init(pcidev);
> > +	else if (method == RES_METHOD_ACPI)
> > +		ret = pmc_ssram_telemetry_acpi_init(pcidev, index);
> >  	else
> >  		ret = -EINVAL;
> >  
> > @@ -239,6 +308,7 @@ static struct pci_driver pmc_ssram_telemetry_driver = {
> >  };
> >  module_pci_driver(pmc_ssram_telemetry_driver);
> >  
> > +MODULE_IMPORT_NS("INTEL_PMC_CORE");
> >  MODULE_IMPORT_NS("INTEL_VSEC");
> >  MODULE_AUTHOR("Xi Pardee <xi.pardee@intel.com>");
> >  MODULE_DESCRIPTION("Intel PMC SSRAM Telemetry driver");
> > 
> 
> -- 
>  i.
> 
