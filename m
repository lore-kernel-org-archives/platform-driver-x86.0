Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896E51487F6
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Sep 2025 07:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758614375; cv=none; b=s56glMTdBsVcv5uRh1x09XVC//HFsQ63SwWcRRKQbv+3MmWxxOHSGZs76SDYoSQgjEaszUnW2DT8nfApKzokiLGE/BbsuvNyWI4NxCKCSPjKt/jAP3ycCLwIt2ARLOKpOEtKJyJV50efAmkGWOyu1bIqhUk7ZPsoVeMZJc7aq00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758614375; c=relaxed/simple;
	bh=muRlqspb1dXTHyFf573FmrtC1coArkyaWyHnZFEg8cs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MHyjrYKrw1f1VvnRMcCHZPU8rG6Iw3wCtAXLqBQudjQFV0uybNBUgaNo/gELqZ7/Np5C1iO6G8xgEWc2uIU/7bopYY3C9r2F9AxT32igmBAbPEzqTPlIHGpbvZZ/oP+0MgnjQ0Mwu0A7H7i6tjNmE+y0slBl06WPQPydP+nb2EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZYGURxq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZYGURxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758614373; x=1790150373;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=muRlqspb1dXTHyFf573FmrtC1coArkyaWyHnZFEg8cs=;
  b=nZYGURxql3CbM/rbD39A08zRIIsJln0KR8iI3VMePyMs7k2uE4zbmGqH
   Uh6IqRDAmHBuo8cd8vwxugq/y79ewHwGJ7j/WJAYK28nrnyrTdQeVt+uc
   RTKhPQSaRRfb//oaeQnSRaqw8mMrtV90Oml9S+DGAoWI6w9luXE1zppWI
   LWNIteKbDEpv4ElYQTZryUgw1mJwzWFEZ0i+dWOpwzDUVZ1U41MC55mSH
   RNUkPHXqYkr6aimolu8oCStKvC7msTMydDmeTGApW0CkOxzxXO6bK5Q1i
   PvKC/kOEygbebU02GwDU8b8d9OWraN/7+Co7F22kpbYTsqdCCdRzAkYKU
   Q==;
X-CSE-ConnectionGUID: RGmqoQsEQpGxcX/338y5Qg==
X-CSE-MsgGUID: 4uln8KgkQFOkaWWux4rUFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78493462"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="78493462"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 00:59:31 -0700
X-CSE-ConnectionGUID: YcLqqffhQmeDTcu0+k8c6w==
X-CSE-MsgGUID: CFBrV4ioTXi2VMYtXXfQYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="180708856"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.234])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 00:59:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 23 Sep 2025 10:59:25 +0300 (EEST)
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
cc: platform-driver-x86@vger.kernel.org, irenic.rajneesh@gmail.com, 
    david.e.box@intel.com, xi.pardee@linux.intel.com, kernel-dev@igalia.com, 
    kernel@gpiccoli.net
Subject: Re: [PATCH 2/4] platform/x86/intel/pmc: Dump raw SLP_Sx_DBG registers
 and distinguish between them
In-Reply-To: <20250922230812.1584253-3-gpiccoli@igalia.com>
Message-ID: <db836cd7-c3aa-ee60-e622-c52fcdb78fb3@linux.intel.com>
References: <20250922230812.1584253-1-gpiccoli@igalia.com> <20250922230812.1584253-3-gpiccoli@igalia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 22 Sep 2025, Guilherme G. Piccoli wrote:

> Right now, SLP_Sx_DBG registers output only show matching bits according
> to the register maps and do not distinguish between the different offsets
> (SLP_S0_DBG, SLP_S1_DBG, etc).
> 
> Let's dump the full register read (like the LPM output does), and
> show the id of register to help matching with specs.
> 
> This should bring no functional change, the goal is only to improve
> reading and allow full comparison between raw register values.

Hi,

I don't think that's exactly the definition of "no function change" if you 
intentionally make a change to the reading. :-)

> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  drivers/platform/x86/intel/pmc/core.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index d040290e80ff..c8ce5d6ec30c 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -226,24 +226,31 @@ static void pmc_core_slps0_display(struct pmc *pmc, struct device *dev,
>  	const struct pmc_bit_map **maps = pmc->map->slps0_dbg_maps;
>  	const struct pmc_bit_map *map;
>  	int offset = pmc->map->slps0_dbg_offset;
> +	u8 cnt = 0;
>  	u32 data;
>  
>  	while (*maps) {
>  		map = *maps;
>  		data = pmc_core_reg_read(pmc, offset);
>  		offset += 4;
> +
> +		if (dev)
> +			dev_info(dev, "\nSLP_S%u_DBG:\t0x%x\n", cnt, data);
> +		if (s)
> +			seq_printf(s, "\nSLP_S%u_DBG:\t0x%x\n", cnt, data);
>  		while (map->name) {
>  			if (dev)
> -				dev_info(dev, "SLP_S0_DBG: %-32s\tState: %s\n",
> -					map->name,
> +				dev_info(dev, "SLP_S%u_DBG: %-32s\tState: %s\n",

I'm not sure about this change. To me it looks the naming is "SLP S0 DEBUG 
REGx (SLP_S0_DBG_x)" according to this:

https://edc.intel.com/content/www/tw/zh/design/publications/14th-generation-core-processors-ioe-p-registers/slp-s0-debug-reg2-slp-s0-dbg-2-offset-10bc/

...So changing from S0 to S1 or S2 does not seem correct here?

I wonder if this really a problem to begin with as the names should be 
unique, no?

> +					cnt, map->name,
>  					data & map->bit_mask ? "Yes" : "No");
>  			if (s)
> -				seq_printf(s, "SLP_S0_DBG: %-32s\tState: %s\n",
> -					   map->name,
> +				seq_printf(s, "SLP_S%u_DBG: %-32s\tState: %s\n",
> +					   cnt, map->name,
>  					   data & map->bit_mask ? "Yes" : "No");
>  			++map;
>  		}
>  		++maps;
> +		++cnt;

This assumption seems somewhat fragile but maybe it's not worth 
engineering it beyond this at this point.


Also, please remember to add all maintainers as receipients when posting.



-- 
 i.

