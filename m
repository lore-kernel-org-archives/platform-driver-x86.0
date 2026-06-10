Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300F2312826;
	Wed, 10 Jun 2026 12:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095322; cv=none; b=Kre036CFr72VDa4o7S3T4ZtRwn1UBHnV/mNuAXhMYqrkfEzKK3t2AJsexi6GF/2PSFQaLeJNVut9loQpsAPppXtstpzWbWMu71ZeLemh7w7S8mx8YV34NYwv0BEpqQDfHWiPZbouMOPacqTxTgTLCwMSvFp3pkOkJYOXTcidUrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095322; c=relaxed/simple;
	bh=um91tP6gGlQrzW+srMy5xZcCPemjE7RBSKYShBk1x1Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=o6Emsgvmlz3EpdrvcAzClUTIXjVPkiJJvdGGkdCUCCMgRwtIU8b52qN5brNkJjqmPozx+2caZ/IdJvgbuMAPlrep7+m77KSBmiD9efDm5IchAAcZ1zvpEJdgUJe4r4e3q6OgEGyXalhTO1fHIlZjn6QJ2CkaHD4kMNgN9IXuwbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zi4NWjza; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zi4NWjza"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781095320; x=1812631320;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=um91tP6gGlQrzW+srMy5xZcCPemjE7RBSKYShBk1x1Y=;
  b=Zi4NWjzaYN7ZCI91h2pW4VlADzDxS0GBC4sE7TbMSXL2dezyFqo9Wsmy
   Ht1+GQ0jNTxLynwuzXCRw2CntX02Jilb5HVNjwDXGDXe9QHpYZAng4YBD
   gIcGpSqcBoSl+649Tj6VVCddSslQa6Abehzgg+Yr78QcafX83DG8Ocyy/
   2f0MO3G9WYmISqQwEvHVI8jvG76Tr54Y3fFDkkdNTzt6iUSLCjRFAvBHI
   0b33CtYbdQrrKLN55JRNelsJq262L7j5iGpjxxsvscW4z7ab0TdGwnCBi
   xoept+/U54fTcHgBPCLA4hKnbTgLrIgy2rmrPeaeKNelta9NPNG1DWDIs
   A==;
X-CSE-ConnectionGUID: 58YDvuUURNuPNXfqOb/+hA==
X-CSE-MsgGUID: B6mSbZiXTMS/WugDQ+jcJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="99305367"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="99305367"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 05:42:00 -0700
X-CSE-ConnectionGUID: xzY0M0g8SK6jqEmZOq1cvQ==
X-CSE-MsgGUID: Cj7S+JLIQ+OTcpywAUVrxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="250448747"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 05:41:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jun 2026 15:41:53 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: Hans de Goede <hansg@kernel.org>, irenic.rajneesh@gmail.com, 
    Xi Pardee <xi.pardee@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: Re: [PATCH v6 12/15] platform/x86/intel/pmc/ssram: Switch to static
 array with per-index probe state
In-Reply-To: <e5e53a792e572efc2ac9e3a747e73a0e6aa505cb.1780248804.git.david.e.box@linux.intel.com>
Message-ID: <1a5e1ec5-c0be-ba6d-06ec-02997ab1b5b8@linux.intel.com>
References: <cover.1780248804.git.david.e.box@linux.intel.com> <e5e53a792e572efc2ac9e3a747e73a0e6aa505cb.1780248804.git.david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 31 May 2026, David E. Box wrote:

> From: Xi Pardee <xi.pardee@linux.intel.com>
> 
> Replace devm-allocated pmc_ssram_telems pointer with a fixed-size static
> array and introduce per-index probe state tracking.
> 
> This prepares the driver for later per-device probe handling where tying
> the PMC tracking storage to one probed PCI device is no longer suitable.
> 
> The previous single global device_probed flag cannot describe the state of
> individual PMC indices when multiple devices can be probed independently.
> Replace it with per-index state (UNPROBED, PROBING, PRESENT, ABSENT) and a
> staging cache that publishes discovered values only after probe completes.
> This avoids races between probe/unbind and concurrent readers.
> 
> Use READ_ONCE/WRITE_ONCE for pmc_ssram_state[] accesses to prevent compiler
> optimizations from refetching or tearing the state value across concurrent
> probe/unbind cycles.
> 
> Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Assisted-by: Claude:claude-sonnet-4-5
> ---
> V6 changes:
>   - Squashed patch combining v5 patches 10 ("Use fixed-size static pmc
>     array") and 13 ("Refactor memory barrier for reentrant probe"). Both
>     patches addressed per-index probe state tracking and reentrant probe
>     protection, so they were combined for better logical cohesion.
>   - Added per-index probe state enum (UNPROBED, PROBING, PRESENT, ABSENT)
>     to replace devid overload where devid was used as both payload and
>     probe state indicator. This fixes stale data issues on reprobe,
>     distinguishes between -EAGAIN (probe in progress) and -ENODEV (probe
>     failed) error semantics, and prevents stale values from being visible
>     after failed reprobe (Ilpo/Sashiko/Claude).
>   - Added staging cache that publishes devid and base_addr only after probe
>     completes successfully to avoid races between probe/unbind and
>     concurrent readers.
>   - Added .remove callback to handle proper state cleanup on driver unbind.
>   - Used READ_ONCE/WRITE_ONCE for pmc_ssram_state[] accesses to prevent
>     compiler optimizations from causing issues across concurrent probe/
>     unbind cycles.
> 
> V5 - No changes (for both original patches)
> 
> V4 - No changes (for both original patches)
> 
> V3 - No changes (for both original patches)
> 
> V2 changes (from original patch 10 "Use fixed-size static pmc array"):
>   - Replaced hardcoded array size [3] with MAX_NUM_PMC constant
> 
> V2 changes (from original patch 13 "Refactor memory barrier"):
>   - Expanded commit message to explain synchronization rationale
>   - Remove unused probe_finish label associated with the old global flag
> 
>  .../platform/x86/intel/pmc/ssram_telemetry.c  | 198 ++++++++++++++----
>  1 file changed, 159 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> index e7ddd1788132..ad961ee469b2 100644
> --- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> +++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2023, Intel Corporation.
>   */
>  
> +#include <linux/bitmap.h>
>  #include <linux/bits.h>
>  #include <linux/cleanup.h>
>  #include <linux/device.h>
> @@ -24,6 +25,7 @@
>  #define SSRAM_IOE_OFFSET	0x68
>  #define SSRAM_DEVID_OFFSET	0x70
>  #define SSRAM_BASE_ADDR_MASK	GENMASK_ULL(63, 3)
> +#define SSRAM_PCI_PMC_MASK	(BIT(PMC_IDX_MAIN) | BIT(PMC_IDX_IOE) | BIT(PMC_IDX_PCH))
>  
>  DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap(_T))
>  
> @@ -39,15 +41,33 @@ static const struct ssram_type pci_main = {
>  	.method = RES_METHOD_PCI,
>  };
>  
> -static struct pmc_ssram_telemetry *pmc_ssram_telems;
> -static bool device_probed;
> +enum pmc_ssram_state {
> +	PMC_SSRAM_UNPROBED,

If I understand things correctly, this should be made = 0 explicitly as 
it refers to the default value from initialization.

> +	PMC_SSRAM_PROBING,
> +	PMC_SSRAM_PRESENT,
> +	PMC_SSRAM_ABSENT,
> +};
> +
> +static enum pmc_ssram_state pmc_ssram_state[MAX_NUM_PMC];
> +static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
> +
> +struct pmc_ssram_probe_cache {
> +	struct pmc_ssram_telemetry telems[MAX_NUM_PMC];
> +	unsigned long owned_mask;
> +	unsigned long valid_mask;
> +};
> +
> +struct pmc_ssram_drvdata {
> +	unsigned long owned_mask;
> +};
>  
>  static inline u64 get_base(void __iomem *addr, u32 offset)
>  {
>  	return lo_hi_readq(addr + offset) & SSRAM_BASE_ADDR_MASK;
>  }
>  
> -static void pmc_ssram_get_devid_pwrmbase(void __iomem *ssram, unsigned int pmc_idx)
> +static void pmc_ssram_get_devid_pwrmbase(struct pmc_ssram_probe_cache *probe_cache,
> +					 void __iomem *ssram, unsigned int pmc_idx)
>  {
>  	u64 pwrm_base;
>  	u16 devid;
> @@ -55,8 +75,46 @@ static void pmc_ssram_get_devid_pwrmbase(void __iomem *ssram, unsigned int pmc_i
>  	pwrm_base = get_base(ssram, SSRAM_PWRM_OFFSET);
>  	devid = readw(ssram + SSRAM_DEVID_OFFSET);
>  
> -	pmc_ssram_telems[pmc_idx].devid = devid;
> -	pmc_ssram_telems[pmc_idx].base_addr = pwrm_base;
> +	probe_cache->telems[pmc_idx].base_addr = pwrm_base;
> +	probe_cache->telems[pmc_idx].devid = devid;
> +}
> +
> +static void pmc_ssram_publish_absent(unsigned int pmc_idx)
> +{
> +	/*
> +	 * Publish only the state without modifying telemetry data. This avoids
> +	 * a TOCTOU race where a reader that sampled state==PRESENT before unbind
> +	 * could read modified data after its smp_rmb(). Readers check state first
> +	 * and return -ENODEV for ABSENT without accessing data.
> +	 */
> +	WRITE_ONCE(pmc_ssram_state[pmc_idx], PMC_SSRAM_ABSENT);
> +}
> +
> +static void pmc_ssram_publish_present(struct pmc_ssram_probe_cache *probe_cache,
> +				      unsigned int pmc_idx)
> +{
> +	/*
> +	 * The devid and base_addr fields are read from immutable hardware MMIO
> +	 * registers and do not change across unbind/rebind cycles. A reader
> +	 * observing PRESENT from an earlier probe can safely read fields being
> +	 * updated by a concurrent rebind because both probes read identical
> +	 * values from the same hardware.
> +	 */
> +	pmc_ssram_telems[pmc_idx] = probe_cache->telems[pmc_idx];
> +	/*
> +	 * Barrier ensures telemetry data write completes before PRESENT state
> +	 * becomes visible. Pairs with smp_rmb() in reader.
> +	 */
> +	smp_wmb();
> +	WRITE_ONCE(pmc_ssram_state[pmc_idx], PMC_SSRAM_PRESENT);
> +}
> +
> +static void pmc_ssram_mark_probing(unsigned long mask)
> +{
> +	unsigned long bit;
> +
> +	for_each_set_bit(bit, &mask, MAX_NUM_PMC)
> +		WRITE_ONCE(pmc_ssram_state[bit], PMC_SSRAM_PROBING);
>  }
>  
>  static int
> @@ -96,11 +154,14 @@ pmc_ssram_telemetry_add_pmt(struct pci_dev *pcidev, u64 ssram_base, void __iomem
>  }
>  
>  static int
> -pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev, unsigned int pmc_idx, u32 offset)
> +pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev,
> +				struct pmc_ssram_probe_cache *probe_cache,
> +				unsigned int pmc_idx, u32 offset)
>  {
>  	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram = NULL;
>  	void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram = NULL;
>  	u64 ssram_base;
> +	int ret;
>  
>  	ssram_base = pci_resource_start(pcidev, 0);
>  	tmp_ssram = ioremap(ssram_base, SSRAM_HDR_SIZE);
> @@ -125,22 +186,38 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev, unsigned int pmc_idx, u3
>  		ssram = no_free_ptr(tmp_ssram);
>  	}
>  
> -	pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
> +	pmc_ssram_get_devid_pwrmbase(probe_cache, ssram, pmc_idx);
>  
>  	/* Find and register and PMC telemetry entries */
> -	return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
> +	ret = pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
> +	if (ret)
> +		return ret;
> +
> +	probe_cache->valid_mask |= BIT(pmc_idx);
> +
> +	return 0;
>  }
>  
> -static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev)
> +static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev,
> +					struct pmc_ssram_probe_cache *probe_cache)
>  {
>  	int ret;
>  
> -	ret = pmc_ssram_telemetry_get_pmc_pci(pcidev, PMC_IDX_MAIN, 0);
> +	ret = pmc_ssram_telemetry_get_pmc_pci(pcidev, probe_cache, PMC_IDX_MAIN, 0);
>  	if (ret)
>  		return ret;
>  
> -	pmc_ssram_telemetry_get_pmc_pci(pcidev, PMC_IDX_IOE, SSRAM_IOE_OFFSET);
> -	pmc_ssram_telemetry_get_pmc_pci(pcidev, PMC_IDX_PCH, SSRAM_PCH_OFFSET);
> +	/*
> +	 * If MAIN PMC enumeration is successful but either IOE or PCH fail,
> +	 * don't fail probe as the MAIN PMC is still useful as it provides the
> +	 * global reset and slp_s0 counter access. Failed or missing secondary
> +	 * PMCs are left out of valid_mask and published as absent.
> +	 */
> +	pmc_ssram_telemetry_get_pmc_pci(pcidev, probe_cache, PMC_IDX_IOE,
> +					SSRAM_IOE_OFFSET);
> +
> +	pmc_ssram_telemetry_get_pmc_pci(pcidev, probe_cache, PMC_IDX_PCH,
> +					SSRAM_PCH_OFFSET);
>  
>  	return ret;
>  }
> @@ -159,53 +236,86 @@ static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev)
>  int pmc_ssram_telemetry_get_pmc_info(unsigned int pmc_idx,
>  				     struct pmc_ssram_telemetry *pmc_ssram_telemetry)
>  {
> +	enum pmc_ssram_state state;
> +
> +	if (pmc_idx >= MAX_NUM_PMC)
> +		return -EINVAL;
> +
>  	/*
>  	 * PMCs are discovered in probe function. If this function is called before
> -	 * probe function complete, the result would be invalid. Use device_probed
> -	 * variable to avoid this case. Return -EAGAIN to inform the consumer to call
> -	 * again later.
> +	 * probe function complete, the result would be invalid. Use per-PMC state
> +	 * to inform the consumer to call again later.
>  	 */
> -	if (!device_probed)
> +	state = READ_ONCE(pmc_ssram_state[pmc_idx]);
> +	if (state == PMC_SSRAM_UNPROBED || state == PMC_SSRAM_PROBING)
>  		return -EAGAIN;
>  
> +	if (state == PMC_SSRAM_ABSENT)
> +		return -ENODEV;
> +
>  	/*
>  	 * Memory barrier is used to ensure the correct read order between
> -	 * device_probed variable and PMC info.
> +	 * pmc_ssram_state and PMC info.
>  	 */
>  	smp_rmb();
> -	if (pmc_idx >= MAX_NUM_PMC)
> -		return -EINVAL;
> -
> -	if (!pmc_ssram_telems || !pmc_ssram_telems[pmc_idx].devid)
> -		return -ENODEV;
> -
>  	pmc_ssram_telemetry->devid = pmc_ssram_telems[pmc_idx].devid;
>  	pmc_ssram_telemetry->base_addr = pmc_ssram_telems[pmc_idx].base_addr;
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(pmc_ssram_telemetry_get_pmc_info);
>  
> +static void pmc_ssram_publish_absent_mask(unsigned long mask)
> +{
> +	unsigned long bit;
> +
> +	for_each_set_bit(bit, &mask, MAX_NUM_PMC)
> +		pmc_ssram_publish_absent(bit);
> +}
> +
> +static void pmc_ssram_publish_telems(struct pmc_ssram_probe_cache *probe_cache, int ret)
> +{
> +	unsigned long bit;
> +
> +	if (ret) {
> +		pmc_ssram_publish_absent_mask(probe_cache->owned_mask);
> +		return;
> +	}
> +
> +	for_each_set_bit(bit, &probe_cache->owned_mask, MAX_NUM_PMC) {
> +		if (probe_cache->valid_mask & BIT(bit))
> +			pmc_ssram_publish_present(probe_cache, bit);
> +		else
> +			pmc_ssram_publish_absent(bit);
> +	}
> +}
> +
>  static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_device_id *id)
>  {
> +	struct pmc_ssram_probe_cache probe_cache = {};
> +	struct pmc_ssram_drvdata *drvdata;
>  	const struct ssram_type *ssram_type;
>  	enum resource_method method;
>  	int ret;
>  
> -	pmc_ssram_telems = devm_kzalloc(&pcidev->dev, sizeof(*pmc_ssram_telems) * MAX_NUM_PMC,
> -					GFP_KERNEL);
> -	if (!pmc_ssram_telems) {
> -		ret = -ENOMEM;
> -		goto probe_finish;
> -	}
> -
>  	ssram_type = (const struct ssram_type *)id->driver_data;
>  	if (!ssram_type) {
>  		dev_dbg(&pcidev->dev, "missing driver data\n");
> -		ret = -EINVAL;
> -		goto probe_finish;
> +		return -EINVAL;
>  	}
>  
>  	method = ssram_type->method;
> +	if (method == RES_METHOD_PCI)
> +		probe_cache.owned_mask = SSRAM_PCI_PMC_MASK;
> +	else
> +		return -EINVAL;
> +
> +	pmc_ssram_mark_probing(probe_cache.owned_mask);
> +
> +	drvdata = devm_kzalloc(&pcidev->dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata) {
> +		ret = -ENOMEM;
> +		goto probe_finish;
> +	}
>  
>  	ret = pcim_enable_device(pcidev);
>  	if (ret) {
> @@ -214,20 +324,29 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_de
>  	}
>  
>  	if (method == RES_METHOD_PCI)
> -		ret = pmc_ssram_telemetry_pci_init(pcidev);
> +		ret = pmc_ssram_telemetry_pci_init(pcidev, &probe_cache);
>  	else
>  		ret = -EINVAL;
>  
> +	if (!ret) {
> +		drvdata->owned_mask = probe_cache.owned_mask;
> +		pci_set_drvdata(pcidev, drvdata);
> +	}
> +
>  probe_finish:
> -	/*
> -	 * Memory barrier is used to ensure the correct write order between PMC info
> -	 * and device_probed variable.
> -	 */
> -	smp_wmb();
> -	device_probed = true;
> +	pmc_ssram_publish_telems(&probe_cache, ret);
> +
>  	return ret;
>  }
>  
> +static void pmc_ssram_telemetry_remove(struct pci_dev *pcidev)
> +{
> +	struct pmc_ssram_drvdata *drvdata = pci_get_drvdata(pcidev);
> +
> +	if (drvdata)
> +		pmc_ssram_publish_absent_mask(drvdata->owned_mask);
> +}
> +
>  static const struct pci_device_id pmc_ssram_telemetry_pci_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_MTL_SOCM),
>  		.driver_data = (kernel_ulong_t)&pci_main },
> @@ -251,6 +370,7 @@ static struct pci_driver pmc_ssram_telemetry_driver = {
>  	.name = "intel_pmc_ssram_telemetry",
>  	.id_table = pmc_ssram_telemetry_pci_ids,
>  	.probe = pmc_ssram_telemetry_probe,
> +	.remove = pmc_ssram_telemetry_remove,
>  };
>  module_pci_driver(pmc_ssram_telemetry_driver);
>  
> 

-- 
 i.

