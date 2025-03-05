Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D5E1FCF4F
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Mar 2025 12:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741177302; cv=none; b=tUTjtz3hoGHwS0cp0b3kjWUnIYcIxAddAI71R6z2ti71abTbT1ZgQeNEUjCNmHG2L8W3jIEYsaBvjMdI30UcQDlfVoKykHBF/3Cd1Ru6QxhXcovQIK7TTlaHNO+PvT8HrlrM5v6TRqzgOuHiUVudWfGoY6xp9tATV7YaICcUAyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741177302; c=relaxed/simple;
	bh=5a90tsHT+9W1rfhprKuEo1UAJy9BySl/hFygNe+sBzg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jP1K/jP8kaBXpYLsaGMGz1ruISttdKiScfh3YpU95O7U2HV2DmVjFC+eK4SgtA3nrWUlH1ufcixfSRGf1aEd2tZC0YjUAp/s8IHYUgdV+12zbkDC7kIZZQlcx4+i4HLTH53g+aZT/SONwnRMk6L4txPS8hTGaCIUZUhCqdH00LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzQu7ZHQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzQu7ZHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741177301; x=1772713301;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5a90tsHT+9W1rfhprKuEo1UAJy9BySl/hFygNe+sBzg=;
  b=bzQu7ZHQwb7avRHH0DkfKZULJLJ8GdMVEitWu8zzJsKh3QBscd0NeRn0
   DYlN0aPK5QumYKc+Bt0F26S2D+A3o5XVDjltPcFIXqfBswaZqXVF3D/Pj
   1A52blpXh1G/A2RBL1QueBA7Wokdq/JJI65c/2ps6vUstMriypwZdLWHi
   rfF8uYBWGWZyatnQ/hxccZpsc77znVZkcxVuJUn4hM2E2GPMGF2e2LIe1
   8RjYwA1uEwCM40y9aX0DeStgCRVI7Hg9ZqhyD/2591lmL0DJ5j65JaioM
   1t/TgBETXmF08wetsl0eQjUBSWskDjND/l9CS8mYeTAiTtV0g+znHIdeg
   Q==;
X-CSE-ConnectionGUID: q+OPYTzLSiuOdxcc9eDPeQ==
X-CSE-MsgGUID: dU9aTbjCR+qgUkAkUDKdVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52774009"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="52774009"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 04:21:40 -0800
X-CSE-ConnectionGUID: HHdVOQFtToWNjmzyQdFCXw==
X-CSE-MsgGUID: n7ecsQ4bT9+S60o70CtFIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123877998"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.112])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 04:21:38 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 5 Mar 2025 14:21:34 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/4] platform/x86/amd/pmc: Remove unnecessary line
 breaks
In-Reply-To: <20250217081720.107719-3-Shyam-sundar.S-k@amd.com>
Message-ID: <2e56ec65-7d74-20f4-32f0-6937184a8c48@linux.intel.com>
References: <20250217081720.107719-1-Shyam-sundar.S-k@amd.com> <20250217081720.107719-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Feb 2025, Shyam Sundar S K wrote:

> Enhance code readability by fixing line break and blank line
> inconsistencies.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 742920530987..d80a5b899a1d 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -168,7 +168,6 @@ static int get_metrics_table(struct amd_pmc_dev *pdev, struct smu_metrics *table
>  {
>  	if (!pdev->smu_virt_addr) {
>  		int ret = amd_pmc_setup_smu_logging(pdev);
> -
>  		if (ret)

This should be:

		int ret;

		ret = amd_pmc_setup_smu_logging(pdev);
		if (ret)

However, I'd make ret function level local since these functions are not 
that complicated so block local variables aren't that useful.

While at it, I'd also rename the variable to rc to be consistent with the 
rest of the file.

>  			return ret;
>  	}
> @@ -222,7 +221,6 @@ static ssize_t smu_fw_version_show(struct device *d, struct device_attribute *at
>  
>  	if (!dev->major) {
>  		int rc = amd_pmc_get_smu_version(dev);
> -
>  		if (rc)
>  			return rc;
>  	}
> @@ -236,7 +234,6 @@ static ssize_t smu_program_show(struct device *d, struct device_attribute *attr,
>  
>  	if (!dev->major) {
>  		int rc = amd_pmc_get_smu_version(dev);
> -
>  		if (rc)
>  			return rc;
>  	}
> @@ -704,7 +701,6 @@ static int amd_pmc_suspend_handler(struct device *dev)
>  	 */
>  	if (pdev->disable_8042_wakeup && !disable_workarounds) {
>  		int rc = amd_pmc_wa_irq1(pdev);
> -
>  		if (rc) {
>  			dev_err(pdev->dev, "failed to adjust keyboard wakeup: %d\n", rc);
>  			return rc;
> @@ -743,7 +739,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	u32 val;
>  
>  	dev->dev = &pdev->dev;
> -
>  	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>  	if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
>  		err = -ENODEV;
> @@ -751,7 +746,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	}
>  
>  	dev->cpu_id = rdev->device;
> -
>  	if (dev->cpu_id == AMD_CPU_ID_SP || dev->cpu_id == AMD_CPU_ID_SHP) {
>  		dev_warn_once(dev->dev, "S0i3 is not supported on this hardware\n");
>  		err = -ENODEV;
> @@ -767,7 +761,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	}
>  
>  	base_addr_lo = val & AMD_PMC_BASE_ADDR_HI_MASK;
> -
>  	err = amd_smn_read(0, AMD_PMC_BASE_ADDR_HI, &val);
>  	if (err) {
>  		dev_err(dev->dev, "error reading 0x%x\n", AMD_PMC_BASE_ADDR_HI);
> 

-- 
 i.

