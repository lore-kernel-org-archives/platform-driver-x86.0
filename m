Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57C917A2FC;
	Fri, 29 May 2026 02:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780022362; cv=none; b=gdHI7CiismjC8ZQsbJPK6+Y3ktub4oFPNbci3TZf9ivVNsiWIu2KGJ+397alGfG4YuGl1LUdAgpfMBh2okrRT96UEXJHIpz/EMwHhCi9m9Cnas2cx5pI/1XNfOE/05cTKMvckZBBd88SzTHH21cLZKKj86aWz3XPv2NVw1S1/Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780022362; c=relaxed/simple;
	bh=nlz23Di20Y81A/u3XjMbgfkZL18xlQXlbm29X116YSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajwicIvEFcTzZUcY6luEFEXHvJcl5IC/+2/Wz0B6LD3Wm7ti41zxtIDzUPqwW2It5KqGgMvMP+0xWNMI3wdit+CVcEysqRNq7QJ6z9i8qJNf93MQsphlaH8pRARaGaHg5y2UHlmIbn8PGkfumb2YymXoXrOy8t5FUaivQMbHr0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HO1SmcEH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HO1SmcEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780022360; x=1811558360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nlz23Di20Y81A/u3XjMbgfkZL18xlQXlbm29X116YSM=;
  b=HO1SmcEHlhyVxsQ+zIbjUaO5Hbhvwu61pkWIMyMGyj5ZJ93fLDllgGfE
   hISAQ028RF9jRLdhZTdnEKxTvLxcO8GXGvj9t+a9TLyH3MtKS8ybl2V73
   w2oWhhA9OPNfiy6TbpJ3QlX1Fr3apo01DuDwnV7WHfxdBX2GLBn2iCERX
   5NVFu9bG4s0ywy/jEGzL8DiY68AcMN/c6kF1lBrnZQPaXIodpRcvl2vX+
   d5HLj8dMYCyurX+4A/aJ3qy4hyWUDxFXRJ5iiRe86u/TMRkaISjtDt0wA
   tVvPqRwh7tYemwQIjf+cuFCqJZn+s6NbJSK1l8g3+PHm/t6f0SxXUrfnb
   A==;
X-CSE-ConnectionGUID: ICuX7aRFRza+kKNcT8O4Gg==
X-CSE-MsgGUID: 3Kgi3g8QSSGZ5H+5uFQbnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80933570"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80933570"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 19:39:19 -0700
X-CSE-ConnectionGUID: DvYlNDVRRDu39s3QYGnHoA==
X-CSE-MsgGUID: VHFQfyNyRluDV2OkJs9yFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="273043718"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 19:39:19 -0700
Date: Thu, 28 May 2026 19:39:19 -0700
From: David Box <david.e.box@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>
Cc: Xi Pardee <xi.pardee@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v5 13/16] platform/x86/intel/pmc/ssram: Refactor memory
 barrier for reentrant probe
Message-ID: <zpfrjf4s3cc2n6kwkwxwqef4yult7tgympqh6tizf65432tjti@z4m4kxefipfr>
References: <20260522022147.4137494-1-david.e.box@linux.intel.com>
 <20260522022147.4137494-14-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522022147.4137494-14-david.e.box@linux.intel.com>

Hi Ilpo,

On Thu, May 21, 2026 at 07:21:43PM -0700, David E. Box wrote:
> From: Xi Pardee <xi.pardee@linux.intel.com>
> 
> Previously, a single global 'device_probed' flag with memory barriers was
> used to prevent callers from reading PMC info before probe completion.  The
> write barrier in probe ensured all data, devid and base_addr, was visible
> before signaling completion, and the read barrier in callers ensured they
> checked the flag before reading data.
> 
> A following commit will make probe reentrant, requiring that a different
> synchronization flag be used since a single global flag cannot coordinate
> multiple concurrent probes.
> 
> Switch to per-index devid publication. Each probe instance writes base_addr
> first, then a write barrier ensures visibility before devid is written as
> the completion signal. Callers check devid first, then use a read barrier
> before reading base_addr. This per-index approach allows multiple probes to
> work independently while maintaining the same memory ordering guarantees.
> 
> Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> V5 - No changes
> 
> V4 - No changes
> 
> V3 - No changes
> 
> V2 changes:
>   - Expanded commit message to explain synchronization rationale
>   - Remove unused probe_finish label associated with the old global flag
> 
>  .../platform/x86/intel/pmc/ssram_telemetry.c  | 40 ++++++++-----------
>  1 file changed, 16 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> index 6917a10cbc80..597bfb7ad822 100644
> --- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> +++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> @@ -40,7 +40,6 @@ static const struct ssram_type pci_main = {
>  };
>  
>  static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
> -static bool device_probed;
>  
>  static inline u64 get_base(void __iomem *addr, u32 offset)
>  {
> @@ -55,8 +54,13 @@ static void pmc_ssram_get_devid_pwrmbase(void __iomem *ssram, unsigned int pmc_i
>  	pwrm_base = get_base(ssram, SSRAM_PWRM_OFFSET);
>  	devid = readw(ssram + SSRAM_DEVID_OFFSET);
>  
> -	pmc_ssram_telems[pmc_idx].devid = devid;
>  	pmc_ssram_telems[pmc_idx].base_addr = pwrm_base;
> +	/*
> +	 * Memory barrier is used to ensure the correct write order between base_addr
> +	 * and devid.
> +	 */
> +	smp_wmb();
> +	pmc_ssram_telems[pmc_idx].devid = devid;

Claude also flagged this area, and I suspect this is the same class of issue
Sashiko found.

I tried to cheat, overloading devid as both payloaad and probe state. But if a
reprobe fails after old values were published, the old devid/base address can
remain visible. In practice those values describe static hardware (the hidden
PMC DID and PWRM base), so the stale payload itself is not the most concerning
part.

...

>  }
>  
>  static int
> @@ -154,32 +158,28 @@ static int pmc_ssram_telemetry_pci_init(struct pci_dev *pcidev)
>   * * 0           - Success
>   * * -EAGAIN     - Probe function has not finished yet. Try again.
>   * * -EINVAL     - Invalid pmc_idx
> - * * -ENODEV     - PMC device is not available

The more important issue is the error semantics here.

With device_probed removed, devid == 0 becomes the only indication that PMC info
is not ready. That loses the old distinction between,

  - probe has not completed yet: -EAGAIN
  - probe completed/failed and no PMC info is available: -ENODEV

So if the SSRAM probe fails before devid is published and does not later reprobe
successfully, pmc_core keeps seeing -EAGAIN and can keep deferring indefinitely
instead of falling back to its own legacy init path.

The fix is a bit more involved because the driver has to handle two models, the
legacy path where one PCI probe discovers all PMC indices, and the
newer Nova Lake direction where each probe instance owns a single PMC index.

I added explicit per-index state and kept the devid and base_addr values staged
until before the final return from probe. The state distinguishs between
in-progress, present, and unavailable without overloading devid.

David


>   */
>  int pmc_ssram_telemetry_get_pmc_info(unsigned int pmc_idx,
>  				     struct pmc_ssram_telemetry *pmc_ssram_telemetry)
>  {
> +	if (pmc_idx >= MAX_NUM_PMC)
> +		return -EINVAL;
> +
>  	/*
>  	 * PMCs are discovered in probe function. If this function is called before
> -	 * probe function complete, the result would be invalid. Use device_probed
> -	 * variable to avoid this case. Return -EAGAIN to inform the consumer to call
> +	 * probe function complete, the result would be invalid. Use devid to avoid
> +	 * this case. Return -EAGAIN to inform the consumer to call
>  	 * again later.
>  	 */
> -	if (!device_probed)
> +	if (!pmc_ssram_telems[pmc_idx].devid)
>  		return -EAGAIN;
>  
> +	pmc_ssram_telemetry->devid = pmc_ssram_telems[pmc_idx].devid;
>  	/*
>  	 * Memory barrier is used to ensure the correct read order between
> -	 * device_probed variable and PMC info.
> +	 * devid variable and base_addr.
>  	 */
>  	smp_rmb();
> -	if (pmc_idx >= MAX_NUM_PMC)
> -		return -EINVAL;
> -
> -	if (!pmc_ssram_telems[pmc_idx].devid)
> -		return -ENODEV;
> -
> -	pmc_ssram_telemetry->devid = pmc_ssram_telems[pmc_idx].devid;
>  	pmc_ssram_telemetry->base_addr = pmc_ssram_telems[pmc_idx].base_addr;
>  	return 0;
>  }
> @@ -194,8 +194,7 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_de
>  	ssram_type = (const struct ssram_type *)id->driver_data;
>  	if (!ssram_type) {
>  		dev_dbg(&pcidev->dev, "missing driver data\n");
> -		ret = -EINVAL;
> -		goto probe_finish;
> +		return -EINVAL;
>  	}
>  
>  	method = ssram_type->method;
> @@ -203,7 +202,7 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_de
>  	ret = pcim_enable_device(pcidev);
>  	if (ret) {
>  		dev_dbg(&pcidev->dev, "failed to enable PMC SSRAM device\n");
> -		goto probe_finish;
> +		return ret;
>  	}
>  
>  	if (method == RES_METHOD_PCI)
> @@ -211,13 +210,6 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_de
>  	else
>  		ret = -EINVAL;
>  
> -probe_finish:
> -	/*
> -	 * Memory barrier is used to ensure the correct write order between PMC info
> -	 * and device_probed variable.
> -	 */
> -	smp_wmb();
> -	device_probed = true;
>  	return ret;
>  }
>  
> -- 
> 2.43.0
> 
