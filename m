Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2999940488C;
	Wed, 10 Jun 2026 12:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095357; cv=none; b=fgc/bA5E+XVh0QYpgnPLj4/DcAPaE1BbGO6Dt58hGOCw/hxHqr32uvXFa5rkr8z6g1inkiERp7KFHaUacbHHcH5SiYTWzS+ua3ar7TLrExYEZQ3oTa02yXbuhmjs5MeNFV2rYxeNAXf7bpXKl/eRnBlATw038BPpvAoNSyz9Cvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095357; c=relaxed/simple;
	bh=Kb7wjX3OlsSA3rICdLSIFMjiDjiXJc5L1vpv+2yRrmk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=q/btnchDi8vkzxiCOA9duQJGYMGQzRmf+SRw1Du2PDoIZRA8vfapb96n52AyG2FWxSH0OqeTA0klSkWBbmmmJpu3F6lEZ3ApNlcGLQClbCRozXzdcyyoQsZ6oRQhPJoEGSmPcWzF1aH3UmvJrtsZR9nx+aw/nkALOj6S/6G2A30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4Qn8nUT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4Qn8nUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781095356; x=1812631356;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Kb7wjX3OlsSA3rICdLSIFMjiDjiXJc5L1vpv+2yRrmk=;
  b=A4Qn8nUTjUXrecUaAKZu9IJR467hVKsv8eBCPawX66N92CXviS1eBeSD
   So6LTfaDD78vaY6xEYel182rYO0hgg6CdMEFh8P4Xi50QxClRnJyTORWU
   zUtNW5hlvdAgb0b5AUgpSTJEqQNa89vmlWccFyZB8KCwI88WAltWRXh5y
   NRLA+LWVCm6JzNGO4DmoYZVxk4ojAuWv5VPNMbW2bc/N6m1nQQWQU3PXL
   lEm/qxOcyFv9eLnKVxKUc1CmEXAsL6j5srw7D1N0RY7Vv8StNfuM+K8FT
   brLDT1nhz0k/dCyIKxvk7w+dBkiieZFDiNQu+BCCfqq1s+61wTf4KfnCA
   Q==;
X-CSE-ConnectionGUID: c/UDf3LVSuit76WAohwcuQ==
X-CSE-MsgGUID: DvasWVgjRvSRDsTWFdgrbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81016572"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81016572"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 05:42:35 -0700
X-CSE-ConnectionGUID: 5XN6YGTzQoy56iLRoM+qyg==
X-CSE-MsgGUID: Q5q3ZkfvSpKxG7BEEb9aSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="270164368"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 05:42:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jun 2026 15:42:29 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: Hans de Goede <hansg@kernel.org>, irenic.rajneesh@gmail.com, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    srinivas.pandruvada@linux.intel.com, xi.pardee@linux.intel.com
Subject: Re: [PATCH v6 10/15] platform/x86/intel/pmc/ssram: Add PCI platform
 data
In-Reply-To: <cc2c6bd3f4b72048022dc3fc4a9e64a1992fadf6.1780248804.git.david.e.box@linux.intel.com>
Message-ID: <e02e58e2-c7d2-937d-8a50-ff0c8d2d72bf@linux.intel.com>
References: <cover.1780248804.git.david.e.box@linux.intel.com> <cc2c6bd3f4b72048022dc3fc4a9e64a1992fadf6.1780248804.git.david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 31 May 2026, David E. Box wrote:

> Add per-device platform data for SSRAM telemetry PCI IDs and route probe
> through a method selector driven by id->driver_data.
> 
> This is a preparatory refactor for follow-on discovery methods while
> preserving current behavior: all supported IDs continue to use the PCI
> initialization path.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> V6 changes:
>   - Reordered from v5 patch 12 to maintain logical flow before probe
>     state refactoring.
> 
> V5 - No changes
> 
> V4 - No changes
> 
> V3 - No changes
> 
> V2 changes:
>   - Added missing <linux/device.h> include for dev_dbg() usage in probe
> 
>  .../platform/x86/intel/pmc/ssram_telemetry.c  | 71 +++++++++++++++----
>  1 file changed, 57 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> index 1deb4d71da3f..3d1f5a17903b 100644
> --- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> +++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/cleanup.h>
> +#include <linux/device.h>
>  #include <linux/intel_vsec.h>
>  #include <linux/pci.h>
>  #include <linux/types.h>
> @@ -24,6 +25,18 @@
>  
>  DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap(_T))
>  
> +enum resource_method {
> +	RES_METHOD_PCI,
> +};
> +
> +struct ssram_type {
> +	enum resource_method method;
> +};
> +
> +static const struct ssram_type pci_main = {
> +	.method = RES_METHOD_PCI,
> +};
> +
>  static struct pmc_ssram_telemetry *pmc_ssram_telems;
>  static bool device_probed;
>  
> @@ -69,7 +82,7 @@ static inline u64 get_base(void __iomem *addr, u32 offset)
>  }
>  
>  static int
> -pmc_ssram_telemetry_get_pmc(struct pci_dev *pcidev, unsigned int pmc_idx, u32 offset)
> +pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev, unsigned int pmc_idx, u32 offset)
>  {
>  	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram = NULL;
>  	void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram = NULL;
> @@ -109,6 +122,20 @@ pmc_ssram_telemetry_get_pmc(struct pci_dev *pcidev, unsigned int pmc_idx, u32 of
>  	return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
>  }
>  
> +static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev)
> +{
> +	int ret;
> +
> +	ret = pmc_ssram_telemetry_get_pmc_pci(pcidev, PMC_IDX_MAIN, 0);
> +	if (ret)
> +		return ret;
> +
> +	pmc_ssram_telemetry_get_pmc_pci(pcidev, PMC_IDX_IOE, SSRAM_IOE_OFFSET);
> +	pmc_ssram_telemetry_get_pmc_pci(pcidev, PMC_IDX_PCH, SSRAM_PCH_OFFSET);
> +
> +	return ret;

return 0;

> +}
> +
>  /**
>   * pmc_ssram_telemetry_get_pmc_info() - Get a PMC devid and base_addr information
>   * @pmc_idx:               Index of the PMC
> @@ -151,6 +178,8 @@ EXPORT_SYMBOL_GPL(pmc_ssram_telemetry_get_pmc_info);
>  
>  static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_device_id *id)
>  {
> +	const struct ssram_type *ssram_type;
> +	enum resource_method method;
>  	int ret;
>  
>  	pmc_ssram_telems = devm_kzalloc(&pcidev->dev, sizeof(*pmc_ssram_telems) * MAX_NUM_PMC,
> @@ -160,18 +189,25 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_de
>  		goto probe_finish;
>  	}
>  
> +	ssram_type = (const struct ssram_type *)id->driver_data;
> +	if (!ssram_type) {
> +		dev_dbg(&pcidev->dev, "missing driver data\n");
> +		ret = -EINVAL;
> +		goto probe_finish;
> +	}
> +
> +	method = ssram_type->method;
> +
>  	ret = pcim_enable_device(pcidev);
>  	if (ret) {
>  		dev_dbg(&pcidev->dev, "failed to enable PMC SSRAM device\n");
>  		goto probe_finish;
>  	}
>  
> -	ret = pmc_ssram_telemetry_get_pmc(pcidev, PMC_IDX_MAIN, 0);
> -	if (ret)
> -		goto probe_finish;
> -
> -	pmc_ssram_telemetry_get_pmc(pcidev, PMC_IDX_IOE, SSRAM_IOE_OFFSET);
> -	pmc_ssram_telemetry_get_pmc(pcidev, PMC_IDX_PCH, SSRAM_PCH_OFFSET);
> +	if (method == RES_METHOD_PCI)
> +		ret = pmc_ssram_telemetry_pci_init(pcidev);
> +	else
> +		ret = -EINVAL;
>  
>  probe_finish:
>  	/*
> @@ -184,13 +220,20 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_de
>  }
>  
>  static const struct pci_device_id pmc_ssram_telemetry_pci_ids[] = {
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_MTL_SOCM) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_ARL_SOCS) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_ARL_SOCM) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_LNL_SOCM) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_PTL_PCDH) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_PTL_PCDP) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_WCL_PCDN) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_MTL_SOCM),
> +		.driver_data = (kernel_ulong_t)&pci_main },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_ARL_SOCS),
> +		.driver_data = (kernel_ulong_t)&pci_main },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_ARL_SOCM),
> +		.driver_data = (kernel_ulong_t)&pci_main },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_LNL_SOCM),
> +		.driver_data = (kernel_ulong_t)&pci_main },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_PTL_PCDH),
> +		.driver_data = (kernel_ulong_t)&pci_main },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_PTL_PCDP),
> +		.driver_data = (kernel_ulong_t)&pci_main },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_WCL_PCDN),
> +		.driver_data = (kernel_ulong_t)&pci_main },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, pmc_ssram_telemetry_pci_ids);
> 

-- 
 i.

