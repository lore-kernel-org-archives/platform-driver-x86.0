Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5C9385D9E;
	Fri, 22 May 2026 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444475; cv=none; b=XrHzSjfflsqvISJNrIj1z9nGTyEyNyiIK2xnmyFYMwSAj/xlegJHCvD0TD4rP2ZTUFwQewqgVzohavT4X3yanQ1gwBjvGp5I4Mgl4CwkHBzKMxT+IKxE2OWskVSzzFSzADG/cLcqpuhiQcIFjcthHUrs6sJkxzylDpkluYjHNQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444475; c=relaxed/simple;
	bh=lu5Xz3LTRSfKDm79KX5fhM+NnecJ3gfr7EqVSYnkUp0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VnXm7FikkuTpoRLovnxf5N6fDMTHgLZPIqyVVjUVyssBFjjRPy65YKNbG7fObZN3CtSusZvCMDAbp1UMpyPCQ2BdxuiZI98dy5gg0SsA5XLkUoNYm/V1BiiIoCcMoAso013pVLOyXyWEJYfoEDPDXg0QoDdledBKpad7ysOb+Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsOd0fYs; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsOd0fYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779444472; x=1810980472;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lu5Xz3LTRSfKDm79KX5fhM+NnecJ3gfr7EqVSYnkUp0=;
  b=lsOd0fYs2jcE0WQc//6uMZzFWJhm35kZVMbS4qsoNqi/qxZrumENxAON
   WSnm2F/8ierzFp2A+cz3AJE0gj91hVclzGtgBwgZA39l6xdSdnmZuVq7d
   kADcSj8gtI1IWgKEEJ/1+j09dUt+KGjsYu70irOnPxmF4vF3wO3uEOm4y
   Lu82+PSLXUNzvKDwwx8aTLIWem0XyyBkd20sFAvq7hB8BGlxuECbnZEcv
   eAEXkkkZNolxRJLmYEfLNx3ra5ga50vd6tiX4MRyj+34vXDiojXXS+PQ0
   aVvEacyLfJP5HU6NfENbtwc8A311XCdf2gIYyZR++KUlLnPtGZGmCWJNi
   w==;
X-CSE-ConnectionGUID: tYJoitHUTNGyLfWk4mrwxg==
X-CSE-MsgGUID: JS1p9D9nThmh/5kh5vchIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80357802"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80357802"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:07:51 -0700
X-CSE-ConnectionGUID: RJmwmB8dS3CNcEGNpjQiSw==
X-CSE-MsgGUID: JR5AzBpaSWGBvL085OLzJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="240750312"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:07:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 May 2026 13:07:46 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Xi Pardee <xi.pardee@linux.intel.com>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v5 16/16] platform/x86/intel/pmc: Add NVL PCI IDs for
 SSRAM telemetry discovery
In-Reply-To: <20260522022147.4137494-17-david.e.box@linux.intel.com>
Message-ID: <cbc1575c-1ebf-245a-7dd6-1517ee4c2a48@linux.intel.com>
References: <20260522022147.4137494-1-david.e.box@linux.intel.com> <20260522022147.4137494-17-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 May 2026, David E. Box wrote:

> Add Nova Lake S PMC device IDs to enable binding of the SSRAM telemetry
> driver on NVL platforms, and map them to the ACPI-based discovery policy.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> V5 - No changes
> 
> V4 - No changes
> 
> V3 - No changes
> 
> V2 - No changes
> 
>  drivers/platform/x86/intel/pmc/core.h            |  5 +++++
>  drivers/platform/x86/intel/pmc/ssram_telemetry.c | 16 ++++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
> index f458eb908c07..eb2e1030dbf3 100644
> --- a/drivers/platform/x86/intel/pmc/core.h
> +++ b/drivers/platform/x86/intel/pmc/core.h
> @@ -334,6 +334,11 @@ enum ppfear_regs {
>  #define PMC_DEVID_MTL_IOEP	0x7ecf
>  #define PMC_DEVID_MTL_IOEM	0x7ebf
>  
> +/* NVL */
> +#define PMC_DEVID_NVL_PCDH	0xd37e
> +#define PMC_DEVID_NVL_PCDS	0xd47e
> +#define PMC_DEVID_NVL_PCHS	0x6e27

These seem to already be in pdx86 repo (from Xi Pardee's change).

-- 
 i.

