Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3176A175A5
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Nov 2024 13:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730726381; cv=none; b=sZ35E9PVOyp8oIEdvmvvn7SAbY/C+HY+ZO7DIcGmfMQfmrzSkC5ZO8M04tOuG972df2Zi92D5ydaB0WDN1e15DHh+stvbpC1eTZUSve4wegSAQQeN2vp8vKPqUztkA3epHQt13jj467canXH+EUSEjgIRHRSqA1WREEuaeA6jcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730726381; c=relaxed/simple;
	bh=2l3gxFq58oX5fmm8Pgbj7OK0VTyAPoB5UKnOgYS8alI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=W+/Hcb7CafeOOp+nJvycAnV+ANtRxHI6glzLJWphd4e57fGtB3eiGDtACSjWKnXdQqKfCq2/4nBaZPBiJ5OZVHG8QCPxIraa2yVFo9ITI3KClvr8pWNsgxQAnLSMgeLeBu67vhlhqUW8HTNmMf9KFF77XxzPtR6Ox4255cf8by8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMxZxr+N; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMxZxr+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730726380; x=1762262380;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2l3gxFq58oX5fmm8Pgbj7OK0VTyAPoB5UKnOgYS8alI=;
  b=MMxZxr+NtlyWFW33MlbQR8Mn/ETg+ED06ctqxpMg0V66r0s13b5H5t7M
   dTsrvYHke4wrc0hfjVnR3YCmPqEvZFoN/EXETuFghKBuv5rBYkOeJNRZJ
   GLjeKOdR79T9jtK7OnWfdiOK43aSbW6xAkSNJq/9HOjxqZCulJL/baXLY
   5WCP5yxkNgZAbkrftXuqE7MUjahfC+jUGvdDrMwpbvfTpdBzi2p1OWuFm
   jphZOS4+m98/SfInhQ/6HRCSGLx7w6G4zrdX38SS7nmzDfl1zxRRY0bsP
   WeAWmGro+6w/zmwtbCTx9KGuRZNVzDpGswv/pL5MFASykYFIz/VPH1SoK
   A==;
X-CSE-ConnectionGUID: IPWOvk8QR/iN3+EL3IeTVg==
X-CSE-MsgGUID: ir6AYtKPR56i0gOxcruuYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30274586"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30274586"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 05:19:39 -0800
X-CSE-ConnectionGUID: gdp7CJboQu6kDy5ZeBMymg==
X-CSE-MsgGUID: YEtwM76dQBSiLZh6d6roRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83540799"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.33])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 05:19:38 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 4 Nov 2024 15:19:35 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH v4 3/3] platform/x86/amd/pmf: Switch to platform_get_resource()
 and devm_ioremap_resource()
In-Reply-To: <20241104054829.620858-4-Shyam-sundar.S-k@amd.com>
Message-ID: <021403b7-29ea-173c-2251-62a8e9476cdc@linux.intel.com>
References: <20241104054829.620858-1-Shyam-sundar.S-k@amd.com> <20241104054829.620858-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Nov 2024, Shyam Sundar S K wrote:

> Use platform_get_resource() to fetch the memory resource instead of
> acpi_walk_resources() and devm_ioremap_resource() for mapping the
> resources.
> 
> PS: We cannot use resource_size() here because it adds an extra byte to
> round off the size. In the case of PMF ResourceTemplate(), this rounding
> is already handled within the _CRS. Using resource_size() would increase
> the resource size by 1, causing a mismatch with the length field and
> leading to issues. Therefore, simply use end-start of the ACPI resource to
> obtain the actual length.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Kconfig  |  1 +
>  drivers/platform/x86/amd/pmf/acpi.c   | 46 +++++++++++----------------
>  drivers/platform/x86/amd/pmf/pmf.h    |  6 ++--
>  drivers/platform/x86/amd/pmf/tee-if.c |  8 ++---
>  4 files changed, 28 insertions(+), 33 deletions(-)
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
> index d5b496433d69..1b9c7acf0ddf 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -433,37 +433,29 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
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
> +		dev_dbg(pmf_dev->dev, "Failed to get I/O memory resource\n");
> +		return -EINVAL;
>  	}
>  
> -	return AE_OK;
> -}
> -
> -int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
> -{
> -	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> -	acpi_status status;
> -
> -	status = acpi_walk_resources(ahandle, METHOD_NAME__CRS, apmf_walk_resources, pmf_dev);
> -	if (ACPI_FAILURE(status)) {
> -		dev_dbg(pmf_dev->dev, "acpi_walk_resources failed :%d\n", status);
> +	pmf_dev->policy_addr = pmf_dev->res->start;
> +	/*
> +	 * We cannot use resource_size() here because it adds an extra byte to round off the size.
> +	 * In the case of PMF ResourceTemplate(), this rounding is already handled within the _CRS.
> +	 * Using resource_size() would increase the resource size by 1, causing a mismatch with the
> +	 * length field and leading to issues. Therefore, simply use end-start of the ACPI resource
> +	 * to obtain the actual length.
> +	 */
> +	pmf_dev->policy_sz = pmf_dev->res->end - pmf_dev->res->start;
> +
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

Hi,

I applied these to review-ilpo. While applying, I added cast to this line 
since %llu and resource_size_t are not guaranteed to be same.

I should really find time to look at adding a printf formatter for 
resource sizes as Andy once suggested.

-- 
 i.

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

