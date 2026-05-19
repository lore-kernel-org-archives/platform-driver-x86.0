Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583563E7BD5;
	Tue, 19 May 2026 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779194816; cv=none; b=V/pqwFEa5fqPpVOKUrQ3GGkbZkrGmsGA4YaeO0mBSOdKE8J1qJUljaSWSEQjCNBqb5bpL9ahyin2W+N1o6HijK4fqsNOQ/hJ86y6Or08l2bNhOwCWEBSIK7BJ8rf/ku9zOtLRWbFgYa10mKJ64bEIfuXbYLb55+wXRgaMYrevns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779194816; c=relaxed/simple;
	bh=jLuE31y50iZiLe7bqHjf+aKVLWhm+UhugOPoVWZB7uA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gS+Pa3bf1RZb2ouwCypEgedYMhiPz37k/IMfpbkOQZJmtJVrTY7QKjYJNvct/lINW+kmDqp5mVgbPbL0fktGOp8+rZxqaLBEaqi9IlFmNbJJKng4my/GGEWvUZIV25YEpQBgvuToiaWdsUeufTt0ppJulVPFKeF314QX7oiCW/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BfM+ECoX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfM+ECoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779194814; x=1810730814;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jLuE31y50iZiLe7bqHjf+aKVLWhm+UhugOPoVWZB7uA=;
  b=BfM+ECoXexKaM9fg5o91PjLCKg6bPKdLCC+uzYlGhiI+Re/UXavlh4pR
   L40xmqAj0rB26844x8/x9urzy2YuhiajFdMEWL+MqwP3WQIspKM7Ro/1w
   lXmrCw7EunkPKdVGMxq91Oa2sO7h1+rQWhxKbIgX4YI7Rc3V8647z/Yqa
   98BSgx9jQlf64xU8Qz0ItPTFJVrNxCf8p+VRJKAT06Az5sIsH/mIbaO7G
   /XRYJ1qJXxE4hbYfJZpOCEuswchV8/++kRfSSI11kDn1u/9Py97G9WM21
   Isp6qSWb4OAvEghQk4Ll1AQXm8ow8Xtla0hmTG1TsDHqHk88LqsSPeD/I
   w==;
X-CSE-ConnectionGUID: Z9wlBFRsSaO9SwjNTC5uEg==
X-CSE-MsgGUID: ezseLt7NRJ2d9QnbByqpZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79971773"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79971773"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:46:53 -0700
X-CSE-ConnectionGUID: lSLL+OfKSwWEorAjMdVVZQ==
X-CSE-MsgGUID: FlZQfe9ZTMqw489MtKJvTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235505453"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:46:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 May 2026 15:46:46 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: y@linux.intel.com, Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Xi Pardee <xi.pardee@linux.intel.com>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v4 14/16] platform/x86/intel/pmc/ssram: Add ACPI discovery
 scaffolding
In-Reply-To: <20260515002130.701457-15-david.e.box@linux.intel.com>
Message-ID: <44de558e-76af-997b-6097-0718616340d1@linux.intel.com>
References: <20260515002130.701457-1-david.e.box@linux.intel.com> <20260515002130.701457-15-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 May 2026, David E. Box wrote:

> Prepare the SSRAM telemetry driver for ACPI-based discovery by adding the
> common initialization path and selection framework needed for both PCI and
> ACPI resource discovery.
> 
> At this stage, existing supported devices continue to use the PCI path.
> This change lays the groundwork for follow-on patches that wire platform
> IDs to the ACPI policy path.
> 
> Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> V4 - Replaced local raw ACPI discovery pointer type u32 (*)[4] with
>      acpi_disc_t in SSRAM ACPI initialization path.
> 
> V3 - No changes
> 
> V2 changes:
>   - Fixed cleanup patterns using __free() attributes
>   - Addressed Ilpo's recommendations for safer cleanup.h patterns
> 
>  .../platform/x86/intel/pmc/ssram_telemetry.c  | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> index 597bfb7ad822..1a9f1e67cbe1 100644
> --- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> +++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2023, Intel Corporation.
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/bits.h>
>  #include <linux/cleanup.h>
>  #include <linux/device.h>
> @@ -29,14 +30,17 @@ DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap(_T))
>  
>  enum resource_method {
>  	RES_METHOD_PCI,
> +	RES_METHOD_ACPI,
>  };
>  
>  struct ssram_type {
>  	enum resource_method method;
> +	enum pmc_index p_index;
>  };
>  
>  static const struct ssram_type pci_main = {
>  	.method = RES_METHOD_PCI,
> +	.p_index = PMC_IDX_MAIN,
>  };
>  
>  static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
> @@ -149,6 +153,67 @@ static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev)
>  	return ret;
>  }
>  
> +static int pmc_ssram_telemetry_get_pmc_acpi(struct pci_dev *pcidev,  unsigned int pmc_idx)
> +{
> +	u64 ssram_base;
> +
> +	ssram_base = pci_resource_start(pcidev, 0);
> +	if (!ssram_base)
> +		return -ENODEV;
> +
> +	void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =
> +		ioremap(ssram_base, SSRAM_HDR_SIZE);
> +	if (!ssram)
> +		return -ENOMEM;
> +
> +	pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
> +
> +	return 0;
> +}
> +
> +static int pmc_ssram_telemetry_acpi_init(struct pci_dev *pcidev,
> +					 enum pmc_index index)
> +{
> +	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_handle handle = ACPI_HANDLE(&pcidev->dev);

Move the assignment next to !handle check.

> +	struct intel_vsec_header header;
> +	struct intel_vsec_header *headers[2] = { &header, NULL };
> +	struct intel_vsec_platform_info info = { };
> +	void *dsd_buf __free(pmc_acpi_free) = buf.pointer;

Why is this here and not below the acpi function call?

> +	union acpi_object *dsd;
> +	acpi_status status;
> +	int ret;
> +
> +	if (!handle)
> +		return -ENODEV;
> +
> +	status = acpi_evaluate_object(handle, "_DSD", NULL, &buf);
> +	if (ACPI_FAILURE(status))
> +		return -ENODEV;
> +
> +	dsd = pmc_find_telem_guid(buf.pointer);

pmc_find_telem_guid(dsd_buf) ?

> +	if (!dsd)
> +		return -ENODEV;
> +
> +	acpi_disc_t disc __free(kfree) = pmc_parse_telem_dsd(dsd, &header);
> +	if (IS_ERR(disc))
> +		return PTR_ERR(disc);
> +
> +	info.headers = headers;
> +	info.caps = VSEC_CAP_TELEMETRY;
> +	info.acpi_disc = disc;
> +	info.src = INTEL_VSEC_DISC_ACPI;
> +
> +	/* This is an ACPI companion device. PCI BAR will be used for base addr. */
> +	info.base_addr = 0;
> +
> +	ret = intel_vsec_register(&pcidev->dev, &info);
> +	if (ret)
> +		return ret;
> +
> +	return pmc_ssram_telemetry_get_pmc_acpi(pcidev, index);
> +}
> +
>  /**
>   * pmc_ssram_telemetry_get_pmc_info() - Get a PMC devid and base_addr information
>   * @pmc_idx:               Index of the PMC
> @@ -189,6 +254,7 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_de
>  {
>  	const struct ssram_type *ssram_type;
>  	enum resource_method method;
> +	enum pmc_index index;
>  	int ret;
>  
>  	ssram_type = (const struct ssram_type *)id->driver_data;
> @@ -198,6 +264,7 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_de
>  	}
>  
>  	method = ssram_type->method;
> +	index = ssram_type->p_index;
>  
>  	ret = pcim_enable_device(pcidev);
>  	if (ret) {
> @@ -207,6 +274,8 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_de
>  
>  	if (method == RES_METHOD_PCI)
>  		ret = pmc_ssram_telemetry_pci_init(pcidev);
> +	else if (method == RES_METHOD_ACPI)
> +		ret = pmc_ssram_telemetry_acpi_init(pcidev, index);
>  	else
>  		ret = -EINVAL;
>  
> @@ -239,6 +308,7 @@ static struct pci_driver pmc_ssram_telemetry_driver = {
>  };
>  module_pci_driver(pmc_ssram_telemetry_driver);
>  
> +MODULE_IMPORT_NS("INTEL_PMC_CORE");
>  MODULE_IMPORT_NS("INTEL_VSEC");
>  MODULE_AUTHOR("Xi Pardee <xi.pardee@intel.com>");
>  MODULE_DESCRIPTION("Intel PMC SSRAM Telemetry driver");
> 

-- 
 i.

