Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEAE1096F
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Nov 2024 10:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730889310; cv=none; b=PcHwo8WmUJr8tLmdhZt0YbQ3Lh0x/jYhCC3w4hwnyKpXJ6bTCeE02hTYfhXsbSdatS/nqhSlc3QG9Fd7jDTg0qG9croW/uCCwJf/BsiiuS568bQ+PZPb7uafbnNOPDFmeul+9lIm1TiUkcsvrI29y0THcVvrLgxCKINifDolS3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730889310; c=relaxed/simple;
	bh=teRpahOSBQwO/Lg/TRx78F6wiFCqiC3nULPy0qPut3M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pYoYZHniJdDEScGnY/PkUjGg5Db9sI2un1aPgeP78CRhHrqoheZLoNywFe+yjMfVy4Ze7GBnM4gT2mZ5ZMgN3SEbkh6TAA5RbkHMzVvBS5O6gAKNU7eNNzYhS14MgGcPN6yqMZfCnfhfwF8t8X6Tp8jYRERx1gNTGCwDuamVzhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEI8tLpA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEI8tLpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730889309; x=1762425309;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=teRpahOSBQwO/Lg/TRx78F6wiFCqiC3nULPy0qPut3M=;
  b=YEI8tLpAz2dD9DqowCGVj2FDiELdo2MSj0rP2/CxD9K9zgVDFJQU7gnm
   By3tQXNR1DKfh271xK4bbIt0wIbM/Bw3TSnRB2qv7eVtfrG0xnLDvQmpU
   J1omwpKE++bjRU9zxepZMB+RosORIik896SuqUChShMabuAZXz/AJa7Vg
   LD74At2UFduNr7Msvld2fvkyf1Kjx3Tupcw2I/1u9ozQkTpyHqnbJDeHL
   tsJUcRDk4DUjFDX6zICGpHzUSXxY++jn4iOEel+18V1AARg48R6emR0EA
   AmkEgFZe5Hnp4HiK/V2C7IryrdLRqatXV/Vrd7FGF7LXil/ZGcS4HKUIe
   A==;
X-CSE-ConnectionGUID: QUIxyfb5Q8G3nT5lBdZpgw==
X-CSE-MsgGUID: mpytwKukRJq8ptG/grIWYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="34607253"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="34607253"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:35:08 -0800
X-CSE-ConnectionGUID: Yh7Y8XaORIafxl1O2lAW4A==
X-CSE-MsgGUID: L/JwJlxvQTa8L8U5UxqzdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84870976"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:35:07 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 Nov 2024 12:35:03 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 04/13] platform/x86/amd/pmc: Invoke amd_pmc_s2d_init()
 Post Debugfs Registration
In-Reply-To: <20241105173637.733589-5-Shyam-sundar.S-k@amd.com>
Message-ID: <dc6f7140-2b0f-99f6-2514-6e3dc2eabe59@linux.intel.com>
References: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com> <20241105173637.733589-5-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Nov 2024, Shyam Sundar S K wrote:

> Relocate the call to amd_pmc_s2d_init() to occur after the creation of the
> "amd_pmc" debugfs directory. This ensures that the driver's root debugfs
> directory is established beforehand.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 58fdf044fd36..6ebb9123ba00 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -822,10 +822,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	/* Get num of IP blocks within the SoC */
>  	amd_pmc_get_ip_info(dev);
>  
> -	err = amd_pmc_s2d_init(dev);
> -	if (err)
> -		goto err_pci_dev_put;
> -
>  	platform_set_drvdata(pdev, dev);
>  	if (IS_ENABLED(CONFIG_SUSPEND)) {
>  		err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
> @@ -836,6 +832,10 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	}
>  
>  	amd_pmc_dbgfs_register(dev);
> +	err = amd_pmc_s2d_init(dev);
> +	if (err)
> +		goto err_pci_dev_put;
> +
>  	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
>  		amd_mp2_stb_init(dev);
>  	pm_report_max_hw_sleep(U64_MAX);
> 

My expectation was that this would be the first patch of the series and 
it would include the move of the if (enable_stb) block 
from amd_pmc_dbgfs_register() to amd_pmc_s2d_init().

(Patch 3 too can be incorporated into that same refactoring patch as long 
as you explain the reason for adding the return in the commit message).

Is that order not viable for some reason?

-- 
 i.

