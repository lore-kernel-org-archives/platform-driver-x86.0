Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF802148FF3
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Oct 2024 07:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728892622; cv=none; b=hS2KrxX1+kw1zW3Zdsyn7d3QcyBa31DPCqEea/+Zjq5e+ZI5OMz9ihZYbBHYvZx9ZdLKInkoXpvhLtnmTB1quxDctO5hwDdOnDPK9uFMuMswvBPXybL93YcrMPk+2hG1E3FG3nlNom++6srYz8bYh1lhWLIzSYdHuUfq01MuU4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728892622; c=relaxed/simple;
	bh=6Zh2gagywSP6lV41Dhq1sXRuFrrjyh5XMOcvz86fWZ4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JGdp1SBN3v/R94BQ8DhZ573U4HDxvAvaW+X9Sz99SHZ/06Iuv8NQmnhxgu/x5HPmiST7q7FV7xZeK+GRbreDNcvcRvnNOcbliDu3FP1RnT62DHsGV/CreA+nqMWl6z1uyTqqq5o37z0QqLOPbaHZjt+R8RtMM26r4IoRNUmZkII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2YJDfAw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2YJDfAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728892621; x=1760428621;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6Zh2gagywSP6lV41Dhq1sXRuFrrjyh5XMOcvz86fWZ4=;
  b=C2YJDfAwaSUeExoTbklSgYyc03bysaIH4/vOZp1x68jK+mEXLZ1UZblk
   wwTZCX5tWycvIA2ZF3b5nhutT2fA8MCU6c6CbuYXuTjfv9XPabf1Yd5rP
   2aiLbXXLQ32depu4S7CXL2xyIL9VW0Gr0y8G9lMjr//HSA/HCLJMjjhJE
   YEciUOzPnB3A4U7qgzGL1BDQ/93RHu7/JleBcqld2BkPr3Z3i/d/o3vOR
   g/4xaFkxBh9aJX1lEyrwJOb4sk8fo6FrJWKGGEvlud5XAUiLpW1niegfQ
   56AA8ne3zsxuvlEkZaJAw7AxFYAkW3f3rKyt5v8a+L0lP51QXWpIOX9Rm
   A==;
X-CSE-ConnectionGUID: snJkYXv0RUO918mPhOrj5w==
X-CSE-MsgGUID: AjgNbUXvSNyKvhLvxIZExA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45700965"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45700965"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 00:57:00 -0700
X-CSE-ConnectionGUID: GpY997N4RxOxaM0vyCvn1A==
X-CSE-MsgGUID: t39loFfnRSWKIdrekC0oRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="82528720"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.80])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 00:56:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 14 Oct 2024 10:56:55 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH 4/5] platform/x86/amd/pmf: Switch to platform_get_resource()
 and devm_ioremap_resource()
In-Reply-To: <20241014045759.1517226-5-Shyam-sundar.S-k@amd.com>
Message-ID: <279d7dcd-2a94-1dd2-c34e-15b852dbceee@linux.intel.com>
References: <20241014045759.1517226-1-Shyam-sundar.S-k@amd.com> <20241014045759.1517226-5-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Oct 2024, Shyam Sundar S K wrote:

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
> index d5b496433d69..40f1c0e9ec6d 100644
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
> +	pmf_dev->res =  platform_get_resource(pdev, IORESOURCE_MEM, 0);

Extra space.

> +	if (!pmf_dev->res) {
> +		dev_err(pmf_dev->dev, "Failed to get I/O memory resource\n");
> +		return -EINVAL;
>  	}
>  
> -	return AE_OK;
> -}
> +	pmf_dev->policy_addr = pmf_dev->res->start;
> +	pmf_dev->policy_sz = resource_size(pmf_dev->res) - 1;

If you have a resource, why you convert it into something custom like 
this?

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
> index 19c27b6e4666..544c5ce08ff0 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -257,7 +257,7 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
>  		return -ENODEV;
>  	}
>  
> -	dev_dbg(dev->dev, "Policy Binary size: %u bytes\n", dev->policy_sz);
> +	dev_dbg(dev->dev, "Policy Binary size: %lld bytes\n", dev->policy_sz);

resource_size_t is unsigned type. However, it's not unsigned long long 
either so this will trigger a warning without cast which is unacceptable.

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
