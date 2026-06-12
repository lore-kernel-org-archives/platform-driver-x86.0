Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD352FD68B;
	Fri, 12 Jun 2026 21:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298069; cv=none; b=dukj2U+qEumtC12fOPKivyEy3CEXPfgWqIxevmUFGZT1CdjOHWwHC+IyMAg9ofXpHEp58l5itutPgxoN1pMyhBh3TtckEcdbbNy5OMzymfXgpis67okPjHcsBIkKM3F8GxdYUrLP0kGzjziWfog1aF/xtLvbw7an8r+5GX52+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298069; c=relaxed/simple;
	bh=qpJg56lkr62X+MNSnZ4lheL90KpIl/FZZ16ZDR0eJzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZH1X8QsTdb5qR6BwRtzn8Okn+lE7dK2P8h6bMC2TepbVg9OfwGyaLt6U/lirKi2gX8WRrQcmzYqs1K3x1CJoZj3+V72L7Vn9jdubhqqys3MwwSHp8/6/1LtzDR5NHiBKrD4x0GTvl4SlHwdExL8XlzSI6EN1nflJeVPIekEEGmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PMin8XPG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMin8XPG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781298067; x=1812834067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qpJg56lkr62X+MNSnZ4lheL90KpIl/FZZ16ZDR0eJzY=;
  b=PMin8XPGfPLvDLywVjNYOUPch1hcx2xgRn4UNypApaib4B3JG7I2pYjr
   Ee8d+7EAnZorWOMrWvAoc15F4/PM2bfcz/UmENHSnj7SWtwr/M9vAOP4P
   Nln/8myEikmm0pnAbRXWBhPyQbN5dqjtzZ2rU1tFJt2LPl+rT48Et4Yko
   R+QyB6fRDDv+zi1fdpActmW29fSf7L2oVvr/gOJsOKRgMKPZ7NaMHdAqQ
   u8AqkhRgQaM2r9OmDgABjVT6eIDTdYfUdg8cqvs+qU6Rts7tsqjAY/5nK
   wfdcZ1U7C5OBX+Gjj/Jf/vm6WL1E53PuTGnMfMHEedx5JliCqRS2G9X3X
   A==;
X-CSE-ConnectionGUID: oHPb17cUT36THjZtWltBWA==
X-CSE-MsgGUID: cNUhG/mlStWQ+UZ9mFucbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81881165"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="81881165"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:01:06 -0700
X-CSE-ConnectionGUID: oj34BhKfRzuTGLzan6cohA==
X-CSE-MsgGUID: 72egyhI4S8ign/93hpQC9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="251855130"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:01:07 -0700
Date: Fri, 12 Jun 2026 14:01:06 -0700
From: David Box <david.e.box@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, irenic.rajneesh@gmail.com, 
	Xi Pardee <xi.pardee@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: Re: [PATCH v7 12/15] platform/x86/intel/pmc/ssram: Switch to static
 array with per-index probe state
Message-ID: <idh3l5672ztge7a6v55jokb3lboswatgg27hlhx5ytn6ddlztn@4knk5fvzlq5y>
References: <cover.1781146840.git.david.e.box@linux.intel.com>
 <566f9b6fb5fa2e8514b650df983362eb89adf45f.1781146840.git.david.e.box@linux.intel.com>
 <fc711b92-bd19-e87d-7a09-54c4392564e9@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc711b92-bd19-e87d-7a09-54c4392564e9@linux.intel.com>

On Thu, Jun 11, 2026 at 08:24:30PM +0300, Ilpo Järvinen wrote:
> On Wed, 10 Jun 2026, David E. Box wrote:
> 
> > From: Xi Pardee <xi.pardee@linux.intel.com>
> > 
> > Replace devm-allocated pmc_ssram_telems pointer with a fixed-size static
> > array and introduce per-index probe state tracking.
> > 
> > This prepares the driver for later per-device probe handling where tying
> > the PMC tracking storage to one probed PCI device is no longer suitable.
> > 
> > The previous single global device_probed flag cannot describe the state of
> > individual PMC indices when multiple devices can be probed independently.
> > Replace it with per-index state (UNPROBED, PROBING, PRESENT, ABSENT) and a
> > staging cache that publishes discovered values only after probe completes.
> > This avoids races between probe/unbind and concurrent readers.
> > 
> > Use marked state accesses with release/acquire ordering to prevent compiler
> > and CPU reordering issues across concurrent probe/unbind cycles.
> > 
> > Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
> 
> Hi,
> 
> I started to wonder is this anymore Xi's handiwork? This patch as been 
> rewritten so totally from the earlier that I cannot really see much from 
> the earlier remaining, so is Xi still the right author for it? (It might 
> be correct, I just don't know who did the actual work here).

It has significantlly changed. I removed Xi's authorship and signoff but
added attribution for v1 in the commit message for v8.

> 
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > Assisted-by: Claude:claude-sonnet-4-5
> > ---
> > V7 changes:
> >   - Made PMC_SSRAM_UNPROBED explicitly = 0 for clarity.
> >   - Replace the explicit smp_wmb() / smp_rmb() pairing with
> >     smp_store_release() / smp_load_acquire() when publishing and consuming
> >     the per-index SSRAM state.
> > 
> > V6 changes:
> >   - Squashed patch combining v5 patches 10 ("Use fixed-size static pmc
> >     array") and 13 ("Refactor memory barrier for reentrant probe"). Both
> >     patches addressed per-index probe state tracking and reentrant probe
> >     protection, so they were combined for better logical cohesion.
> >   - Added per-index probe state enum (UNPROBED, PROBING, PRESENT, ABSENT)
> >     to replace devid overload where devid was used as both payload and
> >     probe state indicator. This fixes stale data issues on reprobe,
> >     distinguishes between -EAGAIN (probe in progress) and -ENODEV (probe
> >     failed) error semantics, and prevents stale values from being visible
> >     after failed reprobe (Ilpo/Sashiko/Claude).
> >   - Added staging cache that publishes devid and base_addr only after probe
> >     completes successfully to avoid races between probe/unbind and
> >     concurrent readers.
> >   - Added .remove callback to handle proper state cleanup on driver unbind.
> >   - Used READ_ONCE/WRITE_ONCE for pmc_ssram_state[] accesses to prevent
> >     compiler optimizations from causing issues across concurrent probe/
> >     unbind cycles.
> > 
> > V5 - No changes (for both original patches)
> > 
> > V4 - No changes (for both original patches)
> > 
> > V3 - No changes (for both original patches)
> > 
> > V2 changes (from original patch 10 "Use fixed-size static pmc array"):
> >   - Replaced hardcoded array size [3] with MAX_NUM_PMC constant
> > 
> > V2 changes (from original patch 13 "Refactor memory barrier"):
> >   - Expanded commit message to explain synchronization rationale
> >   - Remove unused probe_finish label associated with the old global flag
> > 
> >  .../platform/x86/intel/pmc/ssram_telemetry.c  | 202 ++++++++++++++----
> >  1 file changed, 160 insertions(+), 42 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> > index 211d842df449..110ea2dfa542 100644
> > --- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> > +++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (c) 2023, Intel Corporation.
> >   */
> >  
> > +#include <linux/bitmap.h>
> >  #include <linux/bits.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/device.h>
> > @@ -24,6 +25,7 @@
> >  #define SSRAM_IOE_OFFSET	0x68
> >  #define SSRAM_DEVID_OFFSET	0x70
> >  #define SSRAM_BASE_ADDR_MASK	GENMASK_ULL(63, 3)
> > +#define SSRAM_PCI_PMC_MASK	(BIT(PMC_IDX_MAIN) | BIT(PMC_IDX_IOE) | BIT(PMC_IDX_PCH))
> >  
> >  DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap(_T))
> >  
> > @@ -39,15 +41,33 @@ static const struct ssram_type pci_main = {
> >  	.method = RES_METHOD_PCI,
> >  };
> >  
> > -static struct pmc_ssram_telemetry *pmc_ssram_telems;
> > -static bool device_probed;
> > +enum pmc_ssram_state {
> > +	PMC_SSRAM_UNPROBED = 0,
> > +	PMC_SSRAM_PROBING,
> > +	PMC_SSRAM_PRESENT,
> > +	PMC_SSRAM_ABSENT,
> > +};
> > +
> > +static enum pmc_ssram_state pmc_ssram_state[MAX_NUM_PMC];
> > +static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
> > +
> > +struct pmc_ssram_probe_cache {
> > +	struct pmc_ssram_telemetry telems[MAX_NUM_PMC];
> > +	unsigned long owned_mask;
> > +	unsigned long valid_mask;
> 
> I went through this change again and as far as I could understand it, it 
> looks okay to me.
> 
> But, could you please suggest some descriptive comments to these (or 
> kerneldoc for the entire struct). I think it would be helpful for 
> understanding the state tracking algorithm to have the intent for 
> each of these stated upfront (rather than code reader having to 
> decipher it from the code like I had to do).
> 
> I can try to put the comment(s) in while applying (unless you want to 
> send an updated version of the entire series yourself which would be fine 
> as well and save me little bit of editing effort).

I'll send a v8. Thanks Ilpo.

David

> 
> -- 
>  i.
> 
> > +};
> > +
> > +struct pmc_ssram_drvdata {
> > +	unsigned long owned_mask;
> > +};
> >  
> >  static inline u64 get_base(void __iomem *addr, u32 offset)
> >  {
> >  	return lo_hi_readq(addr + offset) & SSRAM_BASE_ADDR_MASK;
> >  }
> >  
> > -static void pmc_ssram_get_devid_pwrmbase(void __iomem *ssram, unsigned int pmc_idx)
> > +static void pmc_ssram_get_devid_pwrmbase(struct pmc_ssram_probe_cache *probe_cache,
> > +					 void __iomem *ssram, unsigned int pmc_idx)
> >  {
> >  	u64 pwrm_base;
> >  	u16 devid;
> > @@ -55,8 +75,45 @@ static void pmc_ssram_get_devid_pwrmbase(void __iomem *ssram, unsigned int pmc_i
> >  	pwrm_base = get_base(ssram, SSRAM_PWRM_OFFSET);
> >  	devid = readw(ssram + SSRAM_DEVID_OFFSET);
> >  
> > -	pmc_ssram_telems[pmc_idx].devid = devid;
> > -	pmc_ssram_telems[pmc_idx].base_addr = pwrm_base;
> > +	probe_cache->telems[pmc_idx].base_addr = pwrm_base;
> > +	probe_cache->telems[pmc_idx].devid = devid;
> > +}
> > +
> > +static void pmc_ssram_publish_absent(unsigned int pmc_idx)
> > +{
> > +	/*
> > +	 * Publish only the state without modifying base_addr and devid. This
> > +	 * lets a reader that already observed PRESENT finish copying the
> > +	 * previous values even if unbind concurrently publishes ABSENT. Readers
> > +	 * that observe ABSENT return -ENODEV without accessing data.
> > +	 */
> > +	smp_store_release(&pmc_ssram_state[pmc_idx], PMC_SSRAM_ABSENT);
> > +}
> > +
> > +static void pmc_ssram_publish_present(struct pmc_ssram_probe_cache *probe_cache,
> > +				      unsigned int pmc_idx)
> > +{
> > +	/*
> > +	 * The devid and base_addr fields are read from hardware MMIO registers
> > +	 * whose values are stable for a given PMC index. A reader that observed
> > +	 * PRESENT from an earlier probe can safely copy them while a concurrent
> > +	 * rebind republishes those fields because both probes read the same
> > +	 * hardware values.
> > +	 */
> > +	pmc_ssram_telems[pmc_idx] = probe_cache->telems[pmc_idx];
> > +	/*
> > +	 * Publish base_addr and devid before publishing PRESENT. Pairs with the
> > +	 * acquire load in the reader that consumes them after observing PRESENT.
> > +	 */
> > +	smp_store_release(&pmc_ssram_state[pmc_idx], PMC_SSRAM_PRESENT);
> > +}
> > +
> > +static void pmc_ssram_mark_probing(unsigned long mask)
> > +{
> > +	unsigned long bit;
> > +
> > +	for_each_set_bit(bit, &mask, MAX_NUM_PMC)
> > +		WRITE_ONCE(pmc_ssram_state[bit], PMC_SSRAM_PROBING);
> >  }
> >  
> >  static int
> > @@ -96,11 +153,14 @@ pmc_ssram_telemetry_add_pmt(struct pci_dev *pcidev, u64 ssram_base, void __iomem
> >  }
> >  
> >  static int
> > -pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev, unsigned int pmc_idx, u32 offset)
> > +pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev,
> > +				struct pmc_ssram_probe_cache *probe_cache,
> > +				unsigned int pmc_idx, u32 offset)
> >  {
> >  	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram = NULL;
> >  	void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram = NULL;
> >  	u64 ssram_base;
> > +	int ret;
> >  
> >  	ssram_base = pci_resource_start(pcidev, 0);
> >  	tmp_ssram = ioremap(ssram_base, SSRAM_HDR_SIZE);
> > @@ -125,22 +185,38 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev, unsigned int pmc_idx, u3
> >  		ssram = no_free_ptr(tmp_ssram);
> >  	}
> >  
> > -	pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
> > +	pmc_ssram_get_devid_pwrmbase(probe_cache, ssram, pmc_idx);
> >  
> >  	/* Find and register and PMC telemetry entries */
> > -	return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
> > +	ret = pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
> > +	if (ret)
> > +		return ret;
> > +
> > +	probe_cache->valid_mask |= BIT(pmc_idx);
> > +
> > +	return 0;
> >  }
> >  
> > -static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev)
> > +static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev,
> > +					struct pmc_ssram_probe_cache *probe_cache)
> >  {
> >  	int ret;
> >  
> > -	ret = pmc_ssram_telemetry_get_pmc_pci(pcidev, PMC_IDX_MAIN, 0);
> > +	ret = pmc_ssram_telemetry_get_pmc_pci(pcidev, probe_cache, PMC_IDX_MAIN, 0);
> >  	if (ret)
> >  		return ret;
> >  
> > -	pmc_ssram_telemetry_get_pmc_pci(pcidev, PMC_IDX_IOE, SSRAM_IOE_OFFSET);
> > -	pmc_ssram_telemetry_get_pmc_pci(pcidev, PMC_IDX_PCH, SSRAM_PCH_OFFSET);
> > +	/*
> > +	 * If MAIN PMC enumeration is successful but either IOE or PCH fail,
> > +	 * don't fail probe as the MAIN PMC is still useful as it provides the
> > +	 * global reset and slp_s0 counter access. Failed or missing secondary
> > +	 * PMCs are left out of valid_mask and published as absent.
> > +	 */
> > +	pmc_ssram_telemetry_get_pmc_pci(pcidev, probe_cache, PMC_IDX_IOE,
> > +					SSRAM_IOE_OFFSET);
> > +
> > +	pmc_ssram_telemetry_get_pmc_pci(pcidev, probe_cache, PMC_IDX_PCH,
> > +					SSRAM_PCH_OFFSET);
> >  
> >  	return 0;
> >  }
> > @@ -154,58 +230,90 @@ static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev)
> >   * * 0           - Success
> >   * * -EAGAIN     - Probe function has not finished yet. Try again.
> >   * * -EINVAL     - Invalid pmc_idx
> > - * * -ENODEV     - PMC device is not available
> > + * * -ENODEV     - PMC device is not available (hardware absent or driver failed to initialize)
> >   */
> >  int pmc_ssram_telemetry_get_pmc_info(unsigned int pmc_idx,
> >  				     struct pmc_ssram_telemetry *pmc_ssram_telemetry)
> >  {
> > +	enum pmc_ssram_state state;
> > +
> > +	if (pmc_idx >= MAX_NUM_PMC)
> > +		return -EINVAL;
> > +
> >  	/*
> >  	 * PMCs are discovered in probe function. If this function is called before
> > -	 * probe function complete, the result would be invalid. Use device_probed
> > -	 * variable to avoid this case. Return -EAGAIN to inform the consumer to call
> > -	 * again later.
> > +	 * probe function complete, the result would be invalid. Use per-PMC state
> > +	 * to inform the consumer to call again later.
> >  	 */
> > -	if (!device_probed)
> > +	state = smp_load_acquire(&pmc_ssram_state[pmc_idx]);
> > +	if (state == PMC_SSRAM_UNPROBED || state == PMC_SSRAM_PROBING)
> >  		return -EAGAIN;
> >  
> > -	/*
> > -	 * Memory barrier is used to ensure the correct read order between
> > -	 * device_probed variable and PMC info.
> > -	 */
> > -	smp_rmb();
> > -	if (pmc_idx >= MAX_NUM_PMC)
> > -		return -EINVAL;
> > -
> > -	if (!pmc_ssram_telems || !pmc_ssram_telems[pmc_idx].devid)
> > +	if (state == PMC_SSRAM_ABSENT)
> >  		return -ENODEV;
> >  
> > +	/*
> > +	 * Acquire semantics order reads of devid and base_addr after observing
> > +	 * PRESENT and pair with the writer's release-store.
> > +	 */
> >  	pmc_ssram_telemetry->devid = pmc_ssram_telems[pmc_idx].devid;
> >  	pmc_ssram_telemetry->base_addr = pmc_ssram_telems[pmc_idx].base_addr;
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(pmc_ssram_telemetry_get_pmc_info);
> >  
> > +static void pmc_ssram_publish_absent_mask(unsigned long mask)
> > +{
> > +	unsigned long bit;
> > +
> > +	for_each_set_bit(bit, &mask, MAX_NUM_PMC)
> > +		pmc_ssram_publish_absent(bit);
> > +}
> > +
> > +static void pmc_ssram_publish_telems(struct pmc_ssram_probe_cache *probe_cache, int ret)
> > +{
> > +	unsigned long bit;
> > +
> > +	if (ret) {
> > +		pmc_ssram_publish_absent_mask(probe_cache->owned_mask);
> > +		return;
> > +	}
> > +
> > +	for_each_set_bit(bit, &probe_cache->owned_mask, MAX_NUM_PMC) {
> > +		if (probe_cache->valid_mask & BIT(bit))
> > +			pmc_ssram_publish_present(probe_cache, bit);
> > +		else
> > +			pmc_ssram_publish_absent(bit);
> > +	}
> > +}
> > +
> >  static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_device_id *id)
> >  {
> > +	struct pmc_ssram_probe_cache probe_cache = {};
> > +	struct pmc_ssram_drvdata *drvdata;
> >  	const struct ssram_type *ssram_type;
> >  	enum resource_method method;
> >  	int ret;
> >  
> > -	pmc_ssram_telems = devm_kzalloc(&pcidev->dev, sizeof(*pmc_ssram_telems) * MAX_NUM_PMC,
> > -					GFP_KERNEL);
> > -	if (!pmc_ssram_telems) {
> > -		ret = -ENOMEM;
> > -		goto probe_finish;
> > -	}
> > -
> >  	ssram_type = (const struct ssram_type *)id->driver_data;
> >  	if (!ssram_type) {
> >  		dev_dbg(&pcidev->dev, "missing driver data\n");
> > -		ret = -EINVAL;
> > -		goto probe_finish;
> > +		return -EINVAL;
> >  	}
> >  
> >  	method = ssram_type->method;
> > +	if (method == RES_METHOD_PCI)
> > +		probe_cache.owned_mask = SSRAM_PCI_PMC_MASK;
> > +	else
> > +		return -EINVAL;
> > +
> > +	pmc_ssram_mark_probing(probe_cache.owned_mask);
> > +
> > +	drvdata = devm_kzalloc(&pcidev->dev, sizeof(*drvdata), GFP_KERNEL);
> > +	if (!drvdata) {
> > +		ret = -ENOMEM;
> > +		goto probe_finish;
> > +	}
> >  
> >  	ret = pcim_enable_device(pcidev);
> >  	if (ret) {
> > @@ -214,20 +322,29 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_de
> >  	}
> >  
> >  	if (method == RES_METHOD_PCI)
> > -		ret = pmc_ssram_telemetry_pci_init(pcidev);
> > +		ret = pmc_ssram_telemetry_pci_init(pcidev, &probe_cache);
> >  	else
> >  		ret = -EINVAL;
> >  
> > +	if (!ret) {
> > +		drvdata->owned_mask = probe_cache.owned_mask;
> > +		pci_set_drvdata(pcidev, drvdata);
> > +	}
> > +
> >  probe_finish:
> > -	/*
> > -	 * Memory barrier is used to ensure the correct write order between PMC info
> > -	 * and device_probed variable.
> > -	 */
> > -	smp_wmb();
> > -	device_probed = true;
> > +	pmc_ssram_publish_telems(&probe_cache, ret);
> > +
> >  	return ret;
> >  }
> >  
> > +static void pmc_ssram_telemetry_remove(struct pci_dev *pcidev)
> > +{
> > +	struct pmc_ssram_drvdata *drvdata = pci_get_drvdata(pcidev);
> > +
> > +	if (drvdata)
> > +		pmc_ssram_publish_absent_mask(drvdata->owned_mask);
> > +}
> > +
> >  static const struct pci_device_id pmc_ssram_telemetry_pci_ids[] = {
> >  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PMC_DEVID_MTL_SOCM),
> >  		.driver_data = (kernel_ulong_t)&pci_main },
> > @@ -251,6 +368,7 @@ static struct pci_driver pmc_ssram_telemetry_driver = {
> >  	.name = "intel_pmc_ssram_telemetry",
> >  	.id_table = pmc_ssram_telemetry_pci_ids,
> >  	.probe = pmc_ssram_telemetry_probe,
> > +	.remove = pmc_ssram_telemetry_remove,
> >  };
> >  module_pci_driver(pmc_ssram_telemetry_driver);
> >  
> > 
> 
