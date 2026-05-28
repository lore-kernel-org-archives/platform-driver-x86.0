Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1D2330B2D;
	Thu, 28 May 2026 19:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779998215; cv=none; b=GqPSY2IYwxxx7oVnOyicwHH2/NDcE4hRRtJYphiOj3BSh/8AK8GtwTrFwX2pWJznbWlBjlDQFVjJgGqEjbVzTrypu1O0NxouAVZU/7r76EjgX6hF7xacef0qP97U9ZZ1R5Ra3sAEA3/HgXJ9+1QpbeSse0sNfZ/9e8+xN+LWvJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779998215; c=relaxed/simple;
	bh=CyblDoAHlBuG4XhW9P6oNl005gldxC++MhDFHb0JYzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tF8XVVLc1w60oaWUfUirLf9L/E5YXj2ZWvFeR+WOhk1qiVadPbfWmgQzyCDmR6nEDfT35omj7iJMXcOyqJx2AsJXSfoHs4uZxYvP/TjNDw+dczjhU504RU9kxloHRY8Xz5nKXoHSUC73c2OJLtdb+UIdy2WnzDOms4YsIoJsdJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fAISUGV2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAISUGV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779998214; x=1811534214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CyblDoAHlBuG4XhW9P6oNl005gldxC++MhDFHb0JYzM=;
  b=fAISUGV2I8XLgzTxj5IqLYVyHpmJE1rD1noG91NAchabu+7VmBC5c9bk
   mTQOifga20FZa0p4lI8DhN7Bya0zsakdqXee1WDl5BHfB73axQZE6EoCs
   hyvBFqAIzhz4Fn/0MxrT4w2cuWbweUNGYCxPsurtk2XUw5Rr8rUh4NjLt
   BH/mxGmhi0NAFUNRiKBfuySjvDQykPIsp1jE0Wc99+WVJxgOWLDTxEd4Z
   uuLHL1nZXoKcUaFdVHVlvMZUPJrFlziqFYv7RdEU/Pdt7VPh5shDcjH4y
   DxL44V9kq3/WPRtVophLRaSnPQ6GxIUhdj+ztFkZFNwuG5ZxxeZWl2rSB
   Q==;
X-CSE-ConnectionGUID: TlW3nc1eT5CzJMeL0KELxw==
X-CSE-MsgGUID: dv2usYEuQRWBRcfVlyb4JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80821851"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80821851"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 12:56:54 -0700
X-CSE-ConnectionGUID: i/NMmHtNQwC4Z8ZDGGgMRA==
X-CSE-MsgGUID: Cnm7okrZRFqNq9ECCEb5RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="247725835"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 12:56:53 -0700
Date: Thu, 28 May 2026 12:56:52 -0700
From: David Box <david.e.box@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Xi Pardee <xi.pardee@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v5 10/16] platform/x86/intel/pmc/ssram: Use fixed-size
 static pmc array
Message-ID: <o73njl5yysyqqdiir4xbvdvw4bn3du7i6n7fgod7e27wmcw6zb@n4stzqw7ldr5>
References: <20260522022147.4137494-1-david.e.box@linux.intel.com>
 <20260522022147.4137494-11-david.e.box@linux.intel.com>
 <96195b96-23eb-da7c-1437-39ed9ca6a151@linux.intel.com>
 <hxber63ytsxzif5qg4zdevspxszio6jopk5ojfw54w6orjh2uj@gkxighh6ueb7>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hxber63ytsxzif5qg4zdevspxszio6jopk5ojfw54w6orjh2uj@gkxighh6ueb7>

On Fri, May 22, 2026 at 12:49:43PM -0700, David Box wrote:
> On Fri, May 22, 2026 at 01:37:07PM +0300, Ilpo Järvinen wrote:
> > On Thu, 21 May 2026, David E. Box wrote:
> > 
> > > From: Xi Pardee <xi.pardee@linux.intel.com>
> > > 
> > > Switch pmc_ssram_telems from a devm-allocated pointer to a fixed-size
> > > static array, eliminating per-probe allocation overhead and simplifying
> > > lifetime management.
> > > 
> > > Correspondingly simplify pmc_ssram_telemetry_get_pmc_info() validation to
> > > check devid availability and tighten input bounds checking. Drop
> > > null-pointer checks now that the storage is static.
> > > 
> > > Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
> > > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > > Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > ---
> > 
> > Sashiko has noted some corner case issues related probe/init paths and 
> > missing cleanup which may have some merit, especially if this series makes 
> > the issue worse (for patches 10-14 but all those seem to fundamendally 
> > relate to same reprobe corner case and leaks of stale setups through 
> > static vars).
> > 
> > It has some false positives too, such as not realizing smp_*mb() implies 
> > a compiler barrier so those READ/WRITE_ONCE() requests look bogus to me.
> 
> Okay thanks. This will be the first time I try it myself.
> 

I couldn't get Sashiko to rerun with my Claude setup, but I did manually use
Claude to find what I think is the same issue.

On Fri, May 22, 2026 at 12:49:43PM -0700, David Box wrote:
> On Fri, May 22, 2026 at 01:37:07PM +0300, Ilpo Järvinen wrote:
> > On Thu, 21 May 2026, David E. Box wrote:
> > 
> > > From: Xi Pardee <xi.pardee@linux.intel.com>
> > > 
> > > Switch pmc_ssram_telems from a devm-allocated pointer to a fixed-size
> > > static array, eliminating per-probe allocation overhead and simplifying
> > > lifetime management.
> > > 
> > > Correspondingly simplify pmc_ssram_telemetry_get_pmc_info() validation to
> > > check devid availability and tighten input bounds checking. Drop
> > > null-pointer checks now that the storage is static.
> > > 
> > > Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
> > > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > > Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > ---
> > 
> > Sashiko has noted some corner case issues related probe/init paths and 
> > missing cleanup which may have some merit, especially if this series makes 
> > the issue worse (for patches 10-14 but all those seem to fundamendally 
> > relate to same reprobe corner case and leaks of stale setups through 
> > static vars).
> > 
> > It has some false positives too, such as not realizing smp_*mb() implies 
> > a compiler barrier so those READ/WRITE_ONCE() requests look bogus to me.
> 
> Okay thanks. This will be the first time I try it myself.
> 

I couldn't get Sashiko to rerun with my Claude setup, but I did manually use
Claude to find what I think is the same issue.

First, I realize the commit message doesn't capture why we eliminated the devm
allocation. Up to this point the driver probes all PMCs from a single PCI
device probe, but the following patches move toward probing once per device.
That means a per-device allocated PMC tracker no longer fits the later model.
I'll update the commit message with that information.

The bug Claude found in this patch is that the original devm allocation made
pmc_ssram_telems freshly zeroed on every probe attempt, while switching to a
static array means it's only zeroed at module load time.  If we fail and have to
reprobe the data is stale. I fixed this temporarily by zeroing the array at the
top of probe. It will be removed in the next patch when we start probing per
device.

David

> 
> > 
> > -- 
> >  i.
> > 
> > > V5 - No changes
> > > 
> > > V4 - No changes
> > > 
> > > V3 - No changes
> > > 
> > > V2 changes:
> > >   - Replaced hardcoded array size [3] with MAX_NUM_PMC constant
> > > 
> > >  drivers/platform/x86/intel/pmc/ssram_telemetry.c | 10 ++--------
> > >  1 file changed, 2 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> > > index 1deb4d71da3f..4bfe60ee55ca 100644
> > > --- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> > > +++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> > > @@ -24,7 +24,7 @@
> > >  
> > >  DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap(_T))
> > >  
> > > -static struct pmc_ssram_telemetry *pmc_ssram_telems;
> > > +static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
> > >  static bool device_probed;
> > >  
> > >  static int
> > > @@ -140,7 +140,7 @@ int pmc_ssram_telemetry_get_pmc_info(unsigned int pmc_idx,
> > >  	if (pmc_idx >= MAX_NUM_PMC)
> > >  		return -EINVAL;
> > >  
> > > -	if (!pmc_ssram_telems || !pmc_ssram_telems[pmc_idx].devid)
> > > +	if (!pmc_ssram_telems[pmc_idx].devid)
> > >  		return -ENODEV;
> > >  
> > >  	pmc_ssram_telemetry->devid = pmc_ssram_telems[pmc_idx].devid;
> > > @@ -153,12 +153,6 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_de
> > >  {
> > >  	int ret;
> > >  
> > > -	pmc_ssram_telems = devm_kzalloc(&pcidev->dev, sizeof(*pmc_ssram_telems) * MAX_NUM_PMC,
> > > -					GFP_KERNEL);
> > > -	if (!pmc_ssram_telems) {
> > > -		ret = -ENOMEM;
> > > -		goto probe_finish;
> > > -	}
> > >  
> > >  	ret = pcim_enable_device(pcidev);
> > >  	if (ret) {
> > > 
> 
> 
