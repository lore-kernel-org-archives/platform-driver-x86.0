Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAFA415F0A;
	Fri, 24 Jul 2026 12:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784894613; cv=none; b=GATgHVoCEbPpOWszbGy9yyTDH2v8oCTnY2EmyaFCDJkkYGaUJdRdo66dZQnRs0ZacE7qMGQhqwtwJy47D/4t4DVKsTF+ffPCM0bdd4J3lAGWAVk6gIbuZ5IL/AqQaQagdIlgzVrAsDv9QmhwAANf8/aeYZUSp/iSPrIDPGRJM4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784894613; c=relaxed/simple;
	bh=aTql/5VdF2AUf1AJYRuiTpOH9oUXEQkL7YfI6r1anbE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=c2Jl5YJ29Dmc1jBfM6zRhdFhjQLbjhM/gKAxkaD5CNwV1u7/NuXfmPcuzBhezt23icZaafp8kfmAPFiPfh1/bPgTIxR7LTOlxGo9pD7GCBIA3QfuF8yQdrY7FsJMoDXqr5n+UxGjF/A1IW7lp8o0KL4W7eCE5kU3f56OkDogb3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyYg/wKv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyYg/wKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784894611; x=1816430611;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=aTql/5VdF2AUf1AJYRuiTpOH9oUXEQkL7YfI6r1anbE=;
  b=LyYg/wKv9/ziA4Z+nC39rzMWjr4gTnvY7lZETpnSmnBuYDINOylxvGRw
   /SC12iG6Z5qG5TTa7oJbtyoZ/iw2lt69hINDimCFJomCkOX1elXBK8lN/
   099e4v3yhjG4hVQir7HvR4QzxGsVyixj9JedIrvbWemf7B5DwN5VpoJCW
   4St3mWbiaPgPKeJkn/G7kk/8ZySh0EbcLbohqk2MAepgpibC1dzc15AxD
   wAXp+n4CsCPnm9f7ThDw5Y72cFUoQKRiBIiXvCTH1j3SeW62tjTM6RNNh
   eyjyTpXSQMG9WYWQqUVX8IbWmSKEH1I27y50/dI+ZNDPISz/Aoc8HjpmS
   g==;
X-CSE-ConnectionGUID: RliRLGGXRgOY9r9eMsml9w==
X-CSE-MsgGUID: UPYzd+0ySDCdWW7i1SMu9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85606697"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="85606697"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 05:03:30 -0700
X-CSE-ConnectionGUID: H8jqCiveTY66mCZPyP9x3Q==
X-CSE-MsgGUID: bH5rQNewQ5aleBr68qrl0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="254380852"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.8])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 05:03:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Jul 2026 15:03:24 +0300 (EEST)
To: surendra <kr494167@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, jackbb_wu@compal.com, W_Armin@gmx.de, 
    superm1@kernel.org, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: dell-dw5826e: fix ACPI _DSM function index
 and bitmask usage
In-Reply-To: <20260722034743.13565-1-kr494167@gmail.com>
Message-ID: <75c5c138-11d0-488e-b202-4d9e703aa579@linux.intel.com>
References: <20260722034743.13565-1-kr494167@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Jul 2026, kr494167@gmail.com wrote:

> From: surendra <kr494167@gmail.com>
> 
> PALC_DSM_FN_TRIGGER_PLDR was defined as BIT(1) (value 2).
> 
> acpi_evaluate_dsm() expects a 0-based function index integer (0, 1,
> 2, ...), whereas acpi_check_dsm() expects a bitmask of supported
> function indices (BIT(1), BIT(2), ...).
> 
> Because PALC_DSM_FN_TRIGGER_PLDR was defined as BIT(1),
> acpi_evaluate_dsm() was evaluating Function Index 2 instead of Function
> Index 1, while acpi_check_dsm() was checking for Function Index 1
> support.
> 
> Fix this by setting PALC_DSM_FN_TRIGGER_PLDR to 1 (the function index)
> and passing BIT(PALC_DSM_FN_TRIGGER_PLDR) to acpi_check_dsm().
> 
> Fixes: 1ab843135a77 ("platform/x86: dell-dw5826e: Add reset driver for DW5826e")
> Signed-off-by: surendra <kr494167@gmail.com>

Hi,

Thanks for the fix. We, however, need your real/full name on the 
Signed-off-by line (and From should usually match that as well) to be 
allowed to apply the patch.

For more information, please see:
  Documentation/process/submitting-patches.rst

--
 i.

> ---
>  drivers/platform/x86/dell/dell-dw5826e-reset.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> index 1ca7c3421bb5..64e6e9b1d7a0 100644
> --- a/drivers/platform/x86/dell/dell-dw5826e-reset.c
> +++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> @@ -13,7 +13,7 @@
>  #include <linux/types.h>
>  #include <linux/uuid.h>
>  
> -#define PALC_DSM_FN_TRIGGER_PLDR    BIT(1)
> +#define PALC_DSM_FN_TRIGGER_PLDR    1
>  
>  static guid_t palc_dsm_guid =
>  	GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0xfd, 0xfe, 0x59);
> @@ -66,7 +66,7 @@ static int palc_probe(struct platform_device *pdev)
>  	if (!handle)
>  		return -ENODEV;
>  
> -	if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, PALC_DSM_FN_TRIGGER_PLDR))
> +	if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, BIT(PALC_DSM_FN_TRIGGER_PLDR)))
>  		return -ENODEV;
>  
>  	return 0;
> 

