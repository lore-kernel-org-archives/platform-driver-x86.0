Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4B3282F2C;
	Fri, 17 Apr 2026 22:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776464925; cv=none; b=NrPgW1Nm4IWQrQ1JzwEyroeI8DhHIEG7oMiDLwRuPMXisYauuzW1x5G1dahlAffJqQCq9D8PgyhCky9Ihuj8W/F3zCfGQt8CQnU4FoI65sT0w3dypfEnDl36ZggrgcZoacGi5EobmElYtGf+JXC8fUMTOKBIE7ZvxP5ANmV7M0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776464925; c=relaxed/simple;
	bh=gU5pB6iNbJFnMd5RWs1WF/acncy1VETzFDA1JBHx5dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJlWm/J0OyCLKvy0SnerHasZ5TxxHTkRZknLNAgx1yXj1Yzass6E80orq+laIQsVvTOdjr0Z3Yp0YoPZ5gWeSezsul/DL0qfFUzNfMlAjx2MC9sD2a/Ol0TBO2Zt30M0lI5meGSTNjGpwUh26KFHayQ6D6fxWlp/MiNqCmSlM9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hD80TieF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hD80TieF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776464923; x=1808000923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gU5pB6iNbJFnMd5RWs1WF/acncy1VETzFDA1JBHx5dw=;
  b=hD80TieFPhV0rNnkNv5rnDNvS2Tn0VGrQ+2e6KcYBlEwmMf1XHDhpNTL
   jDIT39Oe4X63drzjHD1xnPUo4I/j6FfcZnWA0AU7jT6O+i4bMM6J6Lw3f
   rdKPTcm7hlQTPJxpKR8qrTkH3B3AoIYLqG1uZ7wPzKXRSC9OY6OQbKij0
   NlEKP64uvEEsGGovVgh9954TiANETTtTs8ayghmkznr516qVhiXCOD777
   6gTS9SG/eFOVn+uwjkgp810W309NSzWP0rBJCm959PLcEstg8UgLB4pop
   9NuH2ZG60K33XOWshacThj3OvR2eiY1qVhcanMlgtcdK3wwey2H3Pg0s2
   w==;
X-CSE-ConnectionGUID: guxF5Ye/RTq8FF8ar0t3HQ==
X-CSE-MsgGUID: pK40CZudQTG62mqfyEE5Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77188121"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="77188121"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 15:28:43 -0700
X-CSE-ConnectionGUID: GE19Jwe5TmKfpDp2ANU/PQ==
X-CSE-MsgGUID: pqlgxaJLQu6Bv1/z94EC6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="230154803"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 15:28:43 -0700
Date: Fri, 17 Apr 2026 15:28:42 -0700
From: David Box <david.e.box@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
	xi.pardee@linux.intel.com, Hans de Goede <hansg@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V2 14/17] platform/x86/intel/pmc/ssram_telemetry: Fix
 cleanup pattern for __free() variables
Message-ID: <2zvgl6u2yhxf5wrmkxqsxayojpwuz5umcgpia2f2vue7q5k7fh@54plrzfnzluw>
References: <20260325014819.1283566-1-david.e.box@linux.intel.com>
 <20260325014819.1283566-15-david.e.box@linux.intel.com>
 <4e5324cb-a60d-c292-8945-583723f18571@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e5324cb-a60d-c292-8945-583723f18571@linux.intel.com>

On Tue, Apr 07, 2026 at 04:33:06PM +0300, Ilpo Järvinen wrote:
> On Tue, 24 Mar 2026, David E. Box wrote:
> 
> > Fix improper cleanup.h usage where __free() variables were initialized to
> > NULL and then assigned later. Move ssram variable declarations into the
> > if/else branches where they're actually assigned to follow the safer
> > pattern recommended in cleanup.h.  This change requires also moving the
> > pmc_ssram_get_devid_pwrmbase() and add_pmt calls into both if/else branches
> > to keep operations within the scope of the local ssram variables.
> > 
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > ---
> > 
> > V2 changes:
> > - New patch addressing Ilpo's review of cleanup.h patterns
> > 
> >  .../platform/x86/intel/pmc/ssram_telemetry.c  | 25 +++++++++++--------
> >  1 file changed, 15 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> > index b329e0c0080b..b1ba17f18ea5 100644
> > --- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> > +++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> > @@ -102,12 +102,11 @@ pmc_ssram_telemetry_add_pmt(struct pci_dev *pcidev, u64 ssram_base, void __iomem
> >  static int
> >  pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev, unsigned int pmc_idx, u32 offset)
> >  {
> > -	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram = NULL;
> > -	void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram = NULL;
> >  	u64 ssram_base;
> >  
> >  	ssram_base = pci_resource_start(pcidev, 0);
> > -	tmp_ssram = ioremap(ssram_base, SSRAM_HDR_SIZE);
> > +	void __iomem __free(pmc_ssram_telemetry_iounmap) *tmp_ssram =
> > +		ioremap(ssram_base, SSRAM_HDR_SIZE);
> >  	if (!tmp_ssram)
> >  		return -ENOMEM;
> >  
> > @@ -121,18 +120,24 @@ pmc_ssram_telemetry_get_pmc_pci(struct pci_dev *pcidev, unsigned int pmc_idx, u3
> >  		if (!ssram_base)
> >  			return 0;
> >  
> > -		ssram = ioremap(ssram_base, SSRAM_HDR_SIZE);
> > +		void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =
> > +			ioremap(ssram_base, SSRAM_HDR_SIZE);
> >  		if (!ssram)
> >  			return -ENOMEM;
> >  
> > +		pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
> > +
> > +		/* Find and register and PMC telemetry entries */
> > +		return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
> >  	} else {
> > -		ssram = no_free_ptr(tmp_ssram);
> > +		void __iomem __free(pmc_ssram_telemetry_iounmap) *ssram =
> > +			no_free_ptr(tmp_ssram);
> > +
> > +		pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
> > +
> > +		/* Find and register and PMC telemetry entries */
> > +		return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
> >  	}
> > -
> > -	pmc_ssram_get_devid_pwrmbase(ssram, pmc_idx);
> > -
> > -	/* Find and register and PMC telemetry entries */
> > -	return pmc_ssram_telemetry_add_pmt(pcidev, ssram_base, ssram);
> 
> Hi,
> 
> I'm sorry you probably made this because of my request, but this doesn't 
> make things simpler so lets stick with having that = NULL outside of the 
> inner blocks.
> 
> You could have overruled me at your own discretion when you realized you 
> have to start duplicating code (and just mention that in the coverletter).

Thanks. I'll change it back and remember that.

David
> 
> -- 
>  i.
> 
