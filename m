Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4DB225DA
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Oct 2024 15:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729870340; cv=none; b=aMnPoX10NWEtocyb6LAckAPZXbs3TsquC4Vkfqa33Ujc21hXCZ6UV9ead0y6cGVuPS8uVeugiC84CpLyV4f9DfysFD2z9yS46PclLgprJAjXG89VWthDNKJoIzOyn3+MkJbO3NhJ4CDbC67cvI0vzTHCEMd0h52Itxwp4M5Qu8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729870340; c=relaxed/simple;
	bh=dyjiyqZyWoeK6tl3APnUnXwcPKCmJL3vozF7Qh50p2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ie6zdXbK1OQBKGA2Sc4/5KmpjzTPC76esUgSzaMsG5CVc4PzwyComfmBLOmsS4oAzeZ+pZ/Oyw8UgGB2rNTgVPohn+QuhM4KhSExDyLnlXf2G1THMoIemVBU6dwgW91zxGYtqkzVwfQMhcjtllyT800lC7GM/4M8OjkQ5hon9Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: MOIUg+omSPWAfpMfrsNOxA==
X-CSE-MsgGUID: HqZhD9CBSyaVdS2mq07kOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="33346825"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="33346825"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 08:32:17 -0700
X-CSE-ConnectionGUID: XWcPJ4u4SDedmw7O3sk7TQ==
X-CSE-MsgGUID: 77rvg1rlToKbjYCX8V/R4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="80588409"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 08:32:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1t4MIP-00000006xim-45tO;
	Fri, 25 Oct 2024 18:32:13 +0300
Date: Fri, 25 Oct 2024 18:32:13 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: x86-android-tablets: Add support for
 getting i2c_adapter by PCI parent devname()
Message-ID: <Zxu5_VAe2NLeR-2s@smile.fi.intel.com>
References: <20241025094435.71718-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025094435.71718-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 25, 2024 at 11:44:34AM +0200, Hans de Goede wrote:
> On the Vexia EDU ATLA 10 tablet, which ships with Android + a custom Linux
> (guadalinex) using the custom Android kernel the I2C controllers are not
> enumerated as ACPI devices as they typically are.
> 
> Instead they are enumerated as PCI devices which do not have ACPI firmware
> nodes associated with them, so getting the i2c_adapter by the ACPI path of
> its firmware node does not work.
> 
> Add support for getting the i2c_adapter by the devname() of its PCI parent
> instead.

...

>  #include <linux/acpi.h>
> +#include <linux/device.h>

> +#include <linux/device/bus.h>

The above is enough. but if you want go with this, I would swap them:

#include <linux/device/bus.h>
#include <linux/device.h>

>  #include <linux/dmi.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/irq.h>
>  #include <linux/module.h>
> +#include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/serdev.h>
>  #include <linux/string.h>

...

> +static __init int match_parent(struct device *dev, const void *data)
> +{
> +	return dev->parent == data;
> +}

To me it sounds like a candidate to be in drivers/base/core.c and bus.h.

...

> -	status = acpi_get_handle(NULL, client_info->adapter_path, &handle);
> -	if (ACPI_FAILURE(status)) {
> -		pr_err("Error could not get %s handle\n", client_info->adapter_path);
> -		return -ENODEV;
> +	if (dev_info->use_pci_devname) {
> +		struct device *pdev, *adap_dev;
> +
> +		pdev = bus_find_device_by_name(&pci_bus_type, NULL, client_info->adapter_path);
> +		if (!pdev) {
> +			pr_err("Error could not find %s PCI device\n", client_info->adapter_path);
> +			return -ENODEV;
> +		}
> +
> +		adap_dev = bus_find_device(&i2c_bus_type, NULL, pdev, match_parent);
> +		if (adap_dev) {
> +			adap = i2c_verify_adapter(adap_dev);
> +			if (!adap)
> +				put_device(adap_dev);
> +		}
> +
> +		put_device(pdev);
> +	} else {
> +		acpi_handle handle;
> +		acpi_status status;
> +
> +		status = acpi_get_handle(NULL, client_info->adapter_path, &handle);
> +		if (ACPI_FAILURE(status)) {
> +			pr_err("Error could not get %s handle\n", client_info->adapter_path);
> +			return -ENODEV;
> +		}
> +
> +		adap = i2c_acpi_find_adapter_by_handle(handle);

Can we rather have two patches:
1) create a helper out of the existing code;
2) added the new approach also using a separate helper?

>  	}

-- 
With Best Regards,
Andy Shevchenko


