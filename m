Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85223859EC;
	Tue,  7 Apr 2026 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568813; cv=none; b=WDNK2eD8+yLqyID1FBy+PDxmn+oo7CSMk8j4ifCxj93scGCIXekRJJkQfAIi+gh0AtgR60Jk6+LVQ2SCFV3AT00A+QNXzJ0A8C0WhDIUZw3k2GMf7ImbHXYkixBAMYO/ifmQJ6ZbJd1tQwx8Cu376oLJ17AJUMHhcvQ/3vBJxuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568813; c=relaxed/simple;
	bh=o5weGs+fvxwUJXqhhhAGaa2cpAqk/dlykKj8ROgw8Dw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iQCM0GUVIVhsUCC5hKT8H5H8j0/GjQxKgK1ThsvGpYSAEZqC/5gRbdJ52pu7khvVqggNPtRVjW5jUJwsEg9wSvaJ4ozRk9Ax7MFKCCbrSNL2mYCAqWiIiI4PmCZWvX97RkXHDWXqdz5WwHtCuaxNDgMsCi1NMDAvF+gmRs9NkjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ircx8SmR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ircx8SmR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775568811; x=1807104811;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=o5weGs+fvxwUJXqhhhAGaa2cpAqk/dlykKj8ROgw8Dw=;
  b=Ircx8SmRyqXGDHsm0CbVnGh+tWluOkRjC4Ft+HLcvjLfPYGKQtwE0Hrm
   s29kdiV3TpKNrjg4HnwKB6/r4J6lDRM3lbNhmxe7hs593+vj7XzN0iFBx
   HnpY4v1fJxlAX5m4ougwiHc1j4uLBHq639Kp2ghWL1BCQd/vsYq4EU0uv
   F0Lemn2y1t5Xx/NU1K0izxLuEjljRdSsrdAxYiZCg84gBXdRM1fLMEKgh
   caRoxTbxLrcmfCCJV9ME0Aq7RgSmMB/7E/KaIxKnxoGMUIRI2c46i0dXs
   vSH+puyCdLvI0/52GQfdFc+/xislhYz9k7x4jUmtMi9cc+WCftxXaKF/l
   Q==;
X-CSE-ConnectionGUID: U6R7cMpmQ1eSh9nNB5lazQ==
X-CSE-MsgGUID: +LOifNbISUuFXQG3BKBVvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76426276"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76426276"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 06:33:31 -0700
X-CSE-ConnectionGUID: oIYJA6DPSUK+6tsAlUnJYg==
X-CSE-MsgGUID: BvosUNORSpOmXe4v4jqg2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="224986734"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 06:33:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Apr 2026 16:33:06 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V2 14/17] platform/x86/intel/pmc/ssram_telemetry: Fix
 cleanup pattern for __free() variables
In-Reply-To: <20260325014819.1283566-15-david.e.box@linux.intel.com>
Message-ID: <4e5324cb-a60d-c292-8945-583723f18571@linux.intel.com>
References: <20260325014819.1283566-1-david.e.box@linux.intel.com> <20260325014819.1283566-15-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Mar 2026, David E. Box wrote:

> Fix improper cleanup.h usage where __free() variables were initialized to
> NULL and then assigned later. Move ssram variable declarations into the
> if/else branches where they're actually assigned to follow the safer
> pattern recommended in cleanup.h.  This change requires also moving the
> pmc_ssram_get_devid_pwrmbase() and add_pmt calls into both if/else branches
> to keep operations within the scope of the local ssram variables.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> 
> V2 changes:
> - New patch addressing Ilpo's review of cleanup.h patterns
> 
>  .../platform/x86/intel/pmc/ssram_telemetry.c  | 25 +++++++++++--------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> index b329e0c0080b..b1ba17f18ea5 100644
> --- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> +++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> @@ -102,12 +102,11 @@ pmc_ssram_telemetry_add_pmt(struct pci_dev *pcidev, u64 ssram_base, void __iomem
>  static int
>  pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev, unsigned int pmc_idx, u32 offset)
>  {
> -	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram = NULL;
> -	void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram = NULL;
>  	u64 ssram_base;
>  
>  	ssram_base = pci_resource_start(pcidev, 0);
> -	tmp_ssram = ioremap(ssram_base, SSRAM_HDR_SIZE);
> +	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram =
> +		ioremap(ssram_base, SSRAM_HDR_SIZE);
>  	if (!tmp_ssram)
>  		return -ENOMEM;
>  
> @@ -121,18 +120,24 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev, unsigned int pmc_idx, u3
>  		if (!ssram_base)
>  			return 0;
>  
> -		ssram = ioremap(ssram_base, SSRAM_HDR_SIZE);
> +		void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =
> +			ioremap(ssram_base, SSRAM_HDR_SIZE);
>  		if (!ssram)
>  			return -ENOMEM;
>  
> +		pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
> +
> +		/* Find and register and PMC telemetry entries */
> +		return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
>  	} else {
> -		ssram = no_free_ptr(tmp_ssram);
> +		void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =
> +			no_free_ptr(tmp_ssram);
> +
> +		pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
> +
> +		/* Find and register and PMC telemetry entries */
> +		return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
>  	}
> -
> -	pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
> -
> -	/* Find and register and PMC telemetry entries */
> -	return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);

Hi,

I'm sorry you probably made this because of my request, but this doesn't 
make things simpler so lets stick with having that = NULL outside of the 
inner blocks.

You could have overruled me at your own discretion when you realized you 
have to start duplicating code (and just mention that in the coverletter).

-- 
 i.

