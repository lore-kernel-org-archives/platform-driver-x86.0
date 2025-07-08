Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F027D2DBF73
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Jul 2025 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751978485; cv=none; b=Gq/SD3cuOoZShWpf44tEgRyqHhtgvwNwLnTjc3SVTkS5fbyBVKg3wMovw29rPgwVMS5OlsSdtvpohht/8nwjItEvgtW671TwMs/OJMMLVIdtoQWjOxb4e4bFBbgaEOKia3hcLsTGj2AHWxUWFnOYPG6BwARnp2maCBAoBz9xg2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751978485; c=relaxed/simple;
	bh=xqixcIP0gWxGyhxWzYYMaWu2Za4gV7cIt3Y36VSA1M4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tQIk9Ntb1Zi0v7AmqaedGROH4nxicP0HRDp4byZsnG+g7PTazvZmKV5hpXggqHaVj7V9ziYRt3GuBoR5ZWmwXXCPBCKnTLZGULpp6s1UKHqZ7wUPPej6KiMtYQN8enqwpncjWuwinL+zbMwTA96vLk7nNZB7Q73V7SBX2M2S01s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVluEe/G; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVluEe/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751978484; x=1783514484;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xqixcIP0gWxGyhxWzYYMaWu2Za4gV7cIt3Y36VSA1M4=;
  b=kVluEe/GpuQUjFSo1BrU7SiRQit2vvZt61CufByFsfCaVZNSHHXvyAwb
   yELw9Fw/80Ac5TRhGft4o8WwFmG9mAZKGv2U43bsdsw6frOZ2X+hKEslS
   RUmxGlrfnKKzfilQf9jDMs014wbZkXBNP2WUU/4HBD3eop86h1ydsmosc
   BbUSV3teoOzUVPefWV2jdVOvexwnYNS+ZibLYaGF4o6San7ExwSyNv+/6
   XFOC0CrZzRht3LB1yPkb8S8eFLpIfeeiLwQgmbe0GVc0TXSkFacwacP90
   3dMDTxVZC4ALCRXvKjrj1DaCKCJh6DKFZU1qC4duiz8FWZweEvklYw6i0
   g==;
X-CSE-ConnectionGUID: suIvP3bcRgSNmqLMsWzWKQ==
X-CSE-MsgGUID: P2qXgcSkSk6fkUZzeuBa3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54103130"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="54103130"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 05:41:24 -0700
X-CSE-ConnectionGUID: ekaKT/eBQWOTrXv07ZLcPA==
X-CSE-MsgGUID: vFAZPPA3Q5KNqWBnrK3t9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="159811961"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.247])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 05:41:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 8 Jul 2025 15:41:19 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v3] platform/x86/amd/hsmp: Enhance the print messages to prevent
 confusion
In-Reply-To: <20250708122605.1436917-1-suma.hegde@amd.com>
Message-ID: <38581026-8655-6bd3-dc50-97f10dc2c360@linux.intel.com>
References: <20250708122605.1436917-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Jul 2025, Suma Hegde wrote:

> When the HSMP ACPI device is present, loading the amd_hsmp.ko
> module incorrectly displays the message "HSMP is not supported on
> Family:%x model:%x\n" despite being supported by the hsmp_acpi.ko
> module, leading to confusion.
> 
> To address this issue, relocate the acpi_dev_present() check to the
> beginning of the hsmp_plt_init() and revise the print message to
> better reflect the current support status.
> 
> Additionally, add more error messages in the error paths and debug
> messages to indicate successful probing for both hsmp_acpi.ko
> and amd_hsmp.ko modules.
> 
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> ---
> Changes since v2
> 1. Update the commit message and description
> 2. Add dev_printk.h and kconfig.h
> 3. Replace dev_info() with dev_dbg()
> 4. Add few more err prints in hsmp_acpi_probe() and hsmp_pltdrv_probe(()
>    hsmp_plt_init() in the error paths
> 
> Changes since v1
> Move successful probe print message inside the if condition in acpi.c.
> 
>  drivers/platform/x86/amd/hsmp/acpi.c |  9 +++++++--
>  drivers/platform/x86/amd/hsmp/plat.c | 29 ++++++++++++++++++++++------
>  2 files changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 2f1faa82d13e..d974c2289f5a 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -587,8 +587,10 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  
>  	if (!hsmp_pdev->is_probed) {
>  		hsmp_pdev->num_sockets = amd_num_nodes();
> -		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES)
> +		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES) {
> +			dev_err(&pdev->dev, "Wrong number of sockets\n");
>  			return -ENODEV;
> +		}
>  
>  		hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
>  					       sizeof(*hsmp_pdev->sock),
> @@ -605,9 +607,12 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  
>  	if (!hsmp_pdev->is_probed) {
>  		ret = hsmp_misc_register(&pdev->dev);
> -		if (ret)
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to register misc device\n");
>  			return ret;
> +		}
>  		hsmp_pdev->is_probed = true;
> +		dev_dbg(&pdev->dev, "AMD HSMP ACPI is probed successfully\n");
>  	}
>  
>  	return 0;
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index e3874c47ed9e..d4eeac0094ed 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -14,6 +14,8 @@
>  #include <linux/acpi.h>
>  #include <linux/build_bug.h>
>  #include <linux/device.h>
> +#include <linux/dev_printk.h>
> +#include <linux/kconfig.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> @@ -215,7 +217,14 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	return hsmp_misc_register(&pdev->dev);
> +	ret = hsmp_misc_register(&pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register misc device\n");
> +		return ret;
> +	}
> +
> +	dev_dbg(&pdev->dev, "AMD HSMP is probed successfully\n");
> +	return 0;
>  }
>  
>  static void hsmp_pltdrv_remove(struct platform_device *pdev)
> @@ -287,15 +296,21 @@ static int __init hsmp_plt_init(void)
>  {
>  	int ret = -ENODEV;
>  
> +	if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1)) {
> +#if IS_ENABLED(CONFIG_AMD_HSMP_ACPI)

This doesn't require use of #if, but if (IS_ENABLED(CONFIG_AMD_HSMP_ACPI)) should do.

Other than that, this change looked fine now.

> +		pr_debug("HSMP is supported through ACPI on this platform, please use hsmp_acpi.ko\n");
> +#else
> +		pr_info("HSMP is supported through ACPI on this platform, please enable AMD_HSMP_ACPI config\n");
> +#endif
> +		return -ENODEV;
> +	}
> +
>  	if (!legacy_hsmp_support()) {
> -		pr_info("HSMP is not supported on Family:%x model:%x\n",
> +		pr_info("HSMP interface is either disabled or not supported on family:%x model:%x\n",
>  			boot_cpu_data.x86, boot_cpu_data.x86_model);
>  		return ret;
>  	}
>  
> -	if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1))
> -		return -ENODEV;
> -
>  	hsmp_pdev = get_hsmp_pdev();
>  	if (!hsmp_pdev)
>  		return -ENOMEM;
> @@ -305,8 +320,10 @@ static int __init hsmp_plt_init(void)
>  	 * if we have N SMN/DF interfaces that ideally means N sockets
>  	 */
>  	hsmp_pdev->num_sockets = amd_num_nodes();
> -	if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES)
> +	if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES) {
> +		pr_err("Wrong number of sockets\n");
>  		return ret;
> +	}
>  
>  	ret = platform_driver_register(&amd_hsmp_driver);
>  	if (ret)
> 

-- 
 i.

