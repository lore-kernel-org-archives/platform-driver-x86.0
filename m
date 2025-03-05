Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61565245013
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Mar 2025 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741176971; cv=none; b=ORKsjx4uNSeKfzTGer0wudoPQQtrJSnC/m48+uoSxQnVWvUAtROpVNPvSD9ZS5WPPq89QzyYesY1EDnf0RdkX4yLCi2R58CyIkNjPd7ra/Au3KQ93gnKACuJGNQKTwjzJkv1+d3BzNQPUFPfkwrBIbwpN0qtZIbmOpjP5dBwx8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741176971; c=relaxed/simple;
	bh=W6LtIE6ZGBj0vK54shSnSb2o0lqGX8I8zKAVwf4rJbU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=d9RdTIFAuGSk8ZQHKob/y5ANXbhOKld3JyR3dWfaaXyzDAd6ovR9ezUdYT1yZ+TME8wANPpQ5XbiWM7Bl7vrBYZJXLydJa3sY8btfnG6SnR0oEHdy0qIq6ts0lQG0zdhFjGjjIoRwehmkipN6jL2RFHiXuKTbi0opwAH47IOEMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNWd2Zrh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNWd2Zrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741176969; x=1772712969;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=W6LtIE6ZGBj0vK54shSnSb2o0lqGX8I8zKAVwf4rJbU=;
  b=DNWd2Zrh323a4O8pOymrBwwnaOrpVJYHLUDho8T0Qzn+MY4kcJ3PZ+PK
   aVKOKt9P27TSmQ2SgOu4VSVcKDKtuY19jGCHWT+nLOKUFbXvIF4x6Spd7
   GbaUwuB3O7rhlrYAbeKnNPAxvKeTdTjCVYak4615omTBgZpfe4qbQHx/u
   UL+qSsmFJ8N/yIjk3Z0GwBcNkTwOwU/ZpVeH8fY5IQjGeyxx3O26aZJ3t
   BtC2Y9MBr54plNMGY31gEzIixYN5tRI4uto+Jb8Tofn0CSyk4Iq+ZwKFW
   2SSXOwLclKldyGNnCCfsGUi8RmbAQAvQ/vmlL5xuLtpCrjU5t5O1bOFgD
   w==;
X-CSE-ConnectionGUID: oCT8RANrQxm3lEehcTdnUw==
X-CSE-MsgGUID: 5zOg5fSNQWywNMCpecoibA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42263549"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="42263549"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 04:16:08 -0800
X-CSE-ConnectionGUID: xZ6YCSoPQEKhFWFW/TJaiw==
X-CSE-MsgGUID: AgZFfTVQRb+4jPTXl0nt+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149632450"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.112])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 04:16:06 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 5 Mar 2025 14:16:03 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 4/4] platform/x86/amd/pmc: Use managed APIs for mutex
In-Reply-To: <20250217081720.107719-4-Shyam-sundar.S-k@amd.com>
Message-ID: <b762fb76-970c-1106-d990-1160372688bb@linux.intel.com>
References: <20250217081720.107719-1-Shyam-sundar.S-k@amd.com> <20250217081720.107719-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Feb 2025, Shyam Sundar S K wrote:

> Adopt managed devm_* APIs for handling mutex creation and deletion,
> facilitating automatic resource cleanup.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index d80a5b899a1d..f4768bd6b424 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -778,7 +778,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  		goto err_pci_dev_put;
>  	}
>  
> -	mutex_init(&dev->lock);
> +	devm_mutex_init(dev->dev, &dev->lock);

Please add error handling.

>  
>  	/* Get num of IP blocks within the SoC */
>  	amd_pmc_get_ip_info(dev);
> @@ -817,7 +817,6 @@ static void amd_pmc_remove(struct platform_device *pdev)
>  	pci_dev_put(dev->rdev);
>  	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
>  		amd_mp2_stb_deinit(dev);
> -	mutex_destroy(&dev->lock);
>  }
>  
>  static const struct acpi_device_id amd_pmc_acpi_ids[] = {
> 

-- 
 i.

