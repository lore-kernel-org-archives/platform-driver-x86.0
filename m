Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAB522ACEB;
	Fri, 22 May 2026 19:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479385; cv=none; b=fO/RBDUYqO5DqMuI1qMNrSEPAh/MNRAMuCpFB8AwxRbRkM25ljCBUMzHezTBf9231uM92B/6gxmfyfdsWCl5Fkgqo3EE8x1ibbSmjTjiDEgAZ5YNH5/+6rLagniStW2DPgRp9LDG8WVT1rJmoNzmP+nqB7GKqR3fF4Teian/nTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479385; c=relaxed/simple;
	bh=OpL570roRlQEKhylDjyRcEX2T2YxTpRwDgzgj+7WxQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExAHtA+yuldUqlgZTZfmJRupn7Ks1KNvz9M+XDRiY0QWo9wW1lq6LE+v/fRKaPwfE7bIqXU/9re5TPrfRYF2koqVt6qz1elIru1ZW2tZwMkoTmY/6uXAm0U4vdrWb0ghdN7l2ranqqreZt4/+KuhjYliyU43OnR+vuB0aIFFeuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQNr2yoK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQNr2yoK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779479385; x=1811015385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OpL570roRlQEKhylDjyRcEX2T2YxTpRwDgzgj+7WxQY=;
  b=nQNr2yoKPQxwLQceIxvdFSsypZz0RsNZF9xwkgzAYf4BGTZX5Kml70+D
   DxYT9/x6iz51qG1lNWtStRDoKhxIti+VYlLwANjotdYNgX8k+mx+02g8W
   LKMpieXXQVdqnjAqSQjtEy4SPIZFxXOU65gL9ouUqgLXlKWEz+M9DYMUs
   9LrenBHdMmjVgt9OrHsFT2NXCwFzm7M8zdNzkmiGQBUkcKucEOCwrwXF+
   YRztI/EdQExy0bF2aSLFXIg3O/pc6JzpQ4QBTcI5sAF+KT+FcjgMTo6cZ
   IonOyw9Wi3mxIxsPmmdEI8fL8CW3yuFlcDE5kyPQJNsumcYr7PHTzxaM8
   Q==;
X-CSE-ConnectionGUID: bIdWoMO1RoSDKbY+WeFFQw==
X-CSE-MsgGUID: a0My34BaSPCd71TjoQjqYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="103090374"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="103090374"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 12:49:44 -0700
X-CSE-ConnectionGUID: lPfwPXbkQJG2QNZYq6hKDA==
X-CSE-MsgGUID: BfuSl0X/SgGJdz9vUAGcPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="271342095"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 12:49:43 -0700
Date: Fri, 22 May 2026 12:49:43 -0700
From: David Box <david.e.box@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Xi Pardee <xi.pardee@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v5 10/16] platform/x86/intel/pmc/ssram: Use fixed-size
 static pmc array
Message-ID: <hxber63ytsxzif5qg4zdevspxszio6jopk5ojfw54w6orjh2uj@gkxighh6ueb7>
References: <20260522022147.4137494-1-david.e.box@linux.intel.com>
 <20260522022147.4137494-11-david.e.box@linux.intel.com>
 <96195b96-23eb-da7c-1437-39ed9ca6a151@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96195b96-23eb-da7c-1437-39ed9ca6a151@linux.intel.com>

On Fri, May 22, 2026 at 01:37:07PM +0300, Ilpo Järvinen wrote:
> On Thu, 21 May 2026, David E. Box wrote:
> 
> > From: Xi Pardee <xi.pardee@linux.intel.com>
> > 
> > Switch pmc_ssram_telems from a devm-allocated pointer to a fixed-size
> > static array, eliminating per-probe allocation overhead and simplifying
> > lifetime management.
> > 
> > Correspondingly simplify pmc_ssram_telemetry_get_pmc_info() validation to
> > check devid availability and tighten input bounds checking. Drop
> > null-pointer checks now that the storage is static.
> > 
> > Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> 
> Sashiko has noted some corner case issues related probe/init paths and 
> missing cleanup which may have some merit, especially if this series makes 
> the issue worse (for patches 10-14 but all those seem to fundamendally 
> relate to same reprobe corner case and leaks of stale setups through 
> static vars).
> 
> It has some false positives too, such as not realizing smp_*mb() implies 
> a compiler barrier so those READ/WRITE_ONCE() requests look bogus to me.

Okay thanks. This will be the first time I try it myself.

David

> 
> -- 
>  i.
> 
> > V5 - No changes
> > 
> > V4 - No changes
> > 
> > V3 - No changes
> > 
> > V2 changes:
> >   - Replaced hardcoded array size [3] with MAX_NUM_PMC constant
> > 
> >  drivers/platform/x86/intel/pmc/ssram_telemetry.c | 10 ++--------
> >  1 file changed, 2 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> > index 1deb4d71da3f..4bfe60ee55ca 100644
> > --- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> > +++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
> > @@ -24,7 +24,7 @@
> >  
> >  DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap(_T))
> >  
> > -static struct pmc_ssram_telemetry *pmc_ssram_telems;
> > +static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
> >  static bool device_probed;
> >  
> >  static int
> > @@ -140,7 +140,7 @@ int pmc_ssram_telemetry_get_pmc_info(unsigned int pmc_idx,
> >  	if (pmc_idx >= MAX_NUM_PMC)
> >  		return -EINVAL;
> >  
> > -	if (!pmc_ssram_telems || !pmc_ssram_telems[pmc_idx].devid)
> > +	if (!pmc_ssram_telems[pmc_idx].devid)
> >  		return -ENODEV;
> >  
> >  	pmc_ssram_telemetry->devid = pmc_ssram_telems[pmc_idx].devid;
> > @@ -153,12 +153,6 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *pcidev, const struct pci_de
> >  {
> >  	int ret;
> >  
> > -	pmc_ssram_telems = devm_kzalloc(&pcidev->dev, sizeof(*pmc_ssram_telems) * MAX_NUM_PMC,
> > -					GFP_KERNEL);
> > -	if (!pmc_ssram_telems) {
> > -		ret = -ENOMEM;
> > -		goto probe_finish;
> > -	}
> >  
> >  	ret = pcim_enable_device(pcidev);
> >  	if (ret) {
> > 

