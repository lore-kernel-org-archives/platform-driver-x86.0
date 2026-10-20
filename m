Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792528360;
	b=VZO+8XIIy5oIfIUWhVZByTQfm/prOQDozlYX8tWenO0Q35w8CqWllqYMinSlggUbAmJD
	 ZSAbwr5dKB07agf+9G4HJEoMHteneoX8Bn+8fG8m4kYmCH/6iby/2F5Jhcs8ijZL8y9l3
	 1RakDjTuqetjIkpFiqEiobje4CQ6kdKTkv9o5P2YL0W5Dp/zurOf1MJ013ouZzCBDLCYN
	 xF+DK6lHPtnrClVK9yuI8mCgwY0Qy386UUiS7mN1en1VhBuE/96jpq3uT9thxGgl5y3K0
	 7ZeYnwCgJSSescW1Yuoezmr/jZA00W+uee9VjBgpPG4Q/XMwGRV0TUoUpiE7tKKICPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792528360;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=ZMhN4YWqU46nfJ2wks0JC39BiEuwNXi38a0DZImfk4I=;
	b=D99egAtok1KQkJ8N5PS4+f+qb84o3nBwuLIgflWZuMN5q/D7+joGYVuFbD5fHewAM3JT
	 RqBoMccKTeXhFUzXwBNs42SizqcDOAlVCFqtbA0jI03D3PgCOwX918+1QekdsottrHURT
	 EacrZ+gGzC/GaUFXRCL7/lj3vw1Xw4m8UqRE7s8d9qeqfwYRfPmwhi8AQMjcrl6unyNId
	 PlKNFDpTxMupkhZXpyROYPNWncOdoX5aCjnuKwqMM9ITrN/XhiiwfpgphEaeUJuGuA4ex
	 8qBtgL3UCf+QXH3rn2eOS7nPO1cn0e9NbezQBE6kOGCTvYsUm0pe4sISeMGmUtPAlDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RFQzkah1;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D34606A31C;
	Tue, 20 Oct 2026 20:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D34606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RFQzkah1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792528360; x=1824064360;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fs08BkGZd244acMeAJaZ0Jtbav2E6i3/PVNh9U3vmh0=;
  b=RFQzkah1m3CgffofWykDe5PsiANVTDhWTHbs1CbUSigV9PYmv7Ha/9i3
   gg/0AqnQXiLNZd6EL7PTLypNCCC6M04mYkbBnN2zhjZsIQLY2X/QrXF3j
   xYujm+6dM9K+FYaFSlJkRcnG5AN4T8mVn0ne1yclGsIgL95mhOxQkUTpp
   Wz4XiChHBuY7XecfKDEnTNGK19Nn+czKRbVslKi6vWjR3CiCJZRpll99t
   ZzkqxKrq/OkYRUx5WGDL/w1juxO/ahXePh9gzJuOkTYiwcPToBcDRDeSe
   D3SEHEP1H5PM5425Bz4bdDhhZS6bRWQxVe+7EkpmQQKB1jBgJPsSGkD/q
   w==;
X-CSE-ConnectionGUID: 5TbTUvIJR3q8wi7dwMyN+A==
X-CSE-MsgGUID: fQ5GO1UlQ9+SVOO0wHSCAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1254985"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1254985"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 13:32:39 -0700
X-CSE-ConnectionGUID: 5AMqFZ0nQ9CrjL5bhMQ54A==
X-CSE-MsgGUID: SgQ6um/xQ5yfRStGbLUcjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2948477"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 13:32:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Oct 2026 23:32:31 +0300 (EEST)
To: Cole Leavitt <cole@unwrap.rs>
cc: Hans de Goede <hansg@kernel.org>, 
    Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
    Xi Pardee <xi.pardee@linux.intel.com>, 
    Rajvi Jingar <rajvi.jingar@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/intel/pmc: Use each PMC's own status map
 on S0ix failure
In-Reply-To: <20261018164037.133658-1-cole@unwrap.rs>
Message-ID: <20096655-ef73-b57a-b1c6-4a580b2bff60@linux.intel.com>
References: <20261018164037.133658-1-cole@unwrap.rs>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 18 Oct 2026, Cole Leavitt wrote:

> When S0ix entry fails and warn_on_s0ix_failures is set,
> pmc_core_resume_common() dumps the latched LPM status registers of every
> PMC.  The loop over pmcdev->pmcs[] however passes the register offset and

One space is enough.

> bit maps of the main PMC to pmc_core_lpm_display() for all of them, so
> the registers of the secondary PMCs are read at the main PMC's offset
> and decoded with the main PMC's bit names.  On platforms with more than
> one PMC, such as Arrow Lake-HX with an 800 series PCH, the dump
> attributes the PCH's power gating state to the wrong IP blocks, which
> makes it useless for finding the device that blocks S0ix.
> 
> Use the status offset and maps of the PMC being displayed.
> 
> Fixes: 2bcef4529222 ("platform/x86:intel/pmc: Enable debugfs multiple PMC support")
> Signed-off-by: Cole Leavitt <cole@unwrap.rs>
> ---
> 
> Notes:
>     Tested on a Lenovo ThinkPad P16 Gen 3 (Core Ultra 9 275HX, JHL9580
>     Barlow Ridge host, I226 Ethernet), in daily use since 2026-09-17.
> 
>  drivers/platform/x86/intel/pmc/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index 9f77c0716e59..3fd72e6a08ce 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -2068,8 +2068,6 @@ int pmc_core_resume_common(struct pmc_dev *pmcdev)
>  {
>  	struct device *dev = &pmcdev->pdev->dev;
>  	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
> -	const struct pmc_bit_map **maps = pmc->map->lpm_sts;
> -	int offset = pmc->map->lpm_status_offset;
>  	unsigned int pmc_idx, i;
>  
>  	/* Check if the syspend used S0ix */
> @@ -2114,7 +2112,9 @@ int pmc_core_resume_common(struct pmc_dev *pmcdev)
>  		if (!pmc)
>  			continue;
>  		if (pmc->map->lpm_sts)
> -			pmc_core_lpm_display(pmc, dev, NULL, offset, pmc_idx, "STATUS", maps);
> +			pmc_core_lpm_display(pmc, dev, NULL,
> +					     pmc->map->lpm_status_offset,
> +					     pmc_idx, "STATUS", pmc->map->lpm_sts);

This looks good finding but I suggest you use intermediate variables 
similar to what the other callers of pmc_core_lpm_display() do. It would 
also allow converting that if check to use the same local var.

-- 
 i.

