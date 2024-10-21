Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA9B1F1306
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 10:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729507715; cv=none; b=mB/xvoP7YHXR4jKrs/zPF3x1OL9Q2j4JABt78GVqs4AuzUXwoad8o6yTBnmNZ+IbFm+1lNZ1bL7v+zzFEV3fGr8faMkw6vKPEGAvZ5+B+iL6Desolx6McEtifkEA3/evp5AgPq/bLXKOgi1SQr745ErvycHy84x4pV9w+C7F9GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729507715; c=relaxed/simple;
	bh=Za20hkWHb8g6xU/7pSHyeQEEEaKbg0SSCDIUOUGt7bM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WJFKV7LkBvKHA8bY5D+VROqFX8myAAdCRgqPb9DT2O+HMzWXr5hZznFvEBX4TbNsOI1n0Xyc8ruWXTkpPoUR5vnt+IXxGHNp0sdPO5myS+ydY/G3Th4PFrg2Pf0OX6m8TASdCvpaJD4nP7J9PJFGSGA6QM2nmCWphc/9Kxe0vK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iA/GypSd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iA/GypSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729507713; x=1761043713;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Za20hkWHb8g6xU/7pSHyeQEEEaKbg0SSCDIUOUGt7bM=;
  b=iA/GypSd3fxMAkA367GyKmI2ZzLERQvUzzgISI1dFGZ6eUDk8rPnESwX
   sJfTSwU3XpgTNnmw6kAQD/RlDENmlN5KqSlmBUJm+DEmEO5kQGuGs0Pk8
   VNA05aUZDtibtcx3a7mPkk7gYMaFkVQ8aRi8GkttSidBEZzTFn5F8lxw4
   j51Jm2QaB/va1EUIUyckzTVaKZpxiaJXDkkCn0s+DGn7Ukmdbjuf8nC0F
   F7IzHJezw9TNjstDg1ah0IYJcFl36N1GtTbSL/5EqJMeqReW0cHCVZBt0
   z01e5VaFrJ2hU3k7Hi+FmAMC36/N0nongGgoZTyMASnSYnsJACrzr7AAz
   A==;
X-CSE-ConnectionGUID: NJ1mBt+FQE2sXvQbmu+19w==
X-CSE-MsgGUID: 4DU0C9DzTseqzgOUD+qN/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="28862593"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="28862593"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 03:48:33 -0700
X-CSE-ConnectionGUID: 06A/00d3Qq69LmriHHziwg==
X-CSE-MsgGUID: NQulh/FGS+qHvBkDx/EcxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="79562083"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 03:48:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 21 Oct 2024 13:48:28 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH v2 4/5] platform/x86/amd/pmf: Switch to platform_get_resource()
 and devm_ioremap_resource()
In-Reply-To: <20241015103021.1843019-5-Shyam-sundar.S-k@amd.com>
Message-ID: <0067f1f8-1efa-a7a2-0d7d-2ed4fe144308@linux.intel.com>
References: <20241015103021.1843019-1-Shyam-sundar.S-k@amd.com> <20241015103021.1843019-5-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Oct 2024, Shyam Sundar S K wrote:

> Use platform_get_resource() to fetch the memory resource instead of
> acpi_walk_resources() and devm_ioremap_resource() for mapping the
> resources.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Kconfig  |  1 +
>  drivers/platform/x86/amd/pmf/acpi.c   | 37 ++++++++-------------------
>  drivers/platform/x86/amd/pmf/pmf.h    |  6 +++--
>  drivers/platform/x86/amd/pmf/tee-if.c |  8 +++---
>  4 files changed, 20 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index f4fa8bd8bda8..99d67cdbd91e 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -11,6 +11,7 @@ config AMD_PMF
>  	select ACPI_PLATFORM_PROFILE
>  	depends on TEE && AMDTEE
>  	depends on AMD_SFH_HID
> +	depends on HAS_IOMEM
>  	help
>  	  This driver provides support for the AMD Platform Management Framework.
>  	  The goal is to enhance end user experience by making AMD PCs smarter,
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index d5b496433d69..2d871ff74fa7 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -433,37 +433,22 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>  	return 0;
>  }
>  
> -static acpi_status apmf_walk_resources(struct acpi_resource *res, void *data)
> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>  {
> -	struct amd_pmf_dev *dev = data;
> +	struct platform_device *pdev = to_platform_device(pmf_dev->dev);
>  
> -	switch (res->type) {
> -	case ACPI_RESOURCE_TYPE_ADDRESS64:
> -		dev->policy_addr = res->data.address64.address.minimum;
> -		dev->policy_sz = res->data.address64.address.address_length;
> -		break;
> -	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> -		dev->policy_addr = res->data.fixed_memory32.address;
> -		dev->policy_sz = res->data.fixed_memory32.address_length;
> -		break;
> -	}
> -
> -	if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ || dev->policy_sz == 0) {
> -		pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
> -		return AE_ERROR;
> +	pmf_dev->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!pmf_dev->res) {
> +		dev_err(pmf_dev->dev, "Failed to get I/O memory resource\n");
> +		return -EINVAL;
>  	}
>  
> -	return AE_OK;
> -}
> +	pmf_dev->policy_addr = pmf_dev->res->start;
> +	pmf_dev->policy_sz = pmf_dev->res->end - pmf_dev->res->start;

A small thing still, I realized this should really have a comment because 
it has a big risk of getting "fixed".

Also please describe what's going on here in the changelog (answer "why?") 
since this is such a thing that people who look this code from history 
have zero chance on figuring out the reasoning on their own.

-- 
 i.

> -int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
> -{
> -	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> -	acpi_status status;
> -
> -	status = acpi_walk_resources(ahandle, METHOD_NAME__CRS, apmf_walk_resources, pmf_dev);
> -	if (ACPI_FAILURE(status)) {
> -		dev_dbg(pmf_dev->dev, "acpi_walk_resources failed :%d\n", status);
> +	if (!pmf_dev->policy_addr || pmf_dev->policy_sz > POLICY_BUF_MAX_SZ ||
> +	    pmf_dev->policy_sz == 0) {
> +		dev_err(pmf_dev->dev, "Incorrect policy params, possibly a SBIOS bug\n");
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 8ce8816da9c1..a79808fda1d8 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -13,6 +13,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/input.h>
> +#include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
>  
>  #define POLICY_BUF_MAX_SZ		0x4b000
> @@ -355,19 +356,20 @@ struct amd_pmf_dev {
>  	/* Smart PC solution builder */
>  	struct dentry *esbin;
>  	unsigned char *policy_buf;
> -	u32 policy_sz;
> +	resource_size_t policy_sz;
>  	struct tee_context *tee_ctx;
>  	struct tee_shm *fw_shm_pool;
>  	u32 session_id;
>  	void *shbuf;
>  	struct delayed_work pb_work;
>  	struct pmf_action_table *prev_data;
> -	u64 policy_addr;
> +	resource_size_t policy_addr;
>  	void __iomem *policy_base;
>  	bool smart_pc_enabled;
>  	u16 pmf_if_version;
>  	struct input_dev *pmf_idev;
>  	size_t mtable_size;
> +	struct resource *res;
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 19c27b6e4666..555b8d6314e0 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -257,7 +257,7 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
>  		return -ENODEV;
>  	}
>  
> -	dev_dbg(dev->dev, "Policy Binary size: %u bytes\n", dev->policy_sz);
> +	dev_dbg(dev->dev, "Policy Binary size: %llu bytes\n", dev->policy_sz);
>  	memset(dev->shbuf, 0, dev->policy_sz);
>  	ta_sm = dev->shbuf;
>  	in = &ta_sm->pmf_input.init_table;
> @@ -512,9 +512,9 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  	if (ret)
>  		goto error;
>  
> -	dev->policy_base = devm_ioremap(dev->dev, dev->policy_addr, dev->policy_sz);
> -	if (!dev->policy_base) {
> -		ret = -ENOMEM;
> +	dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
> +	if (IS_ERR(dev->policy_base)) {
> +		ret = PTR_ERR(dev->policy_base);
>  		goto error;
>  	}
>  
> 
