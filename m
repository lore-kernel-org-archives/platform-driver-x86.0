Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2929E20C313
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Oct 2024 17:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729878452; cv=none; b=k9uU8xIKxYPYsV/hLIxdKTAviwRDnsX3v1J1FfM520HpVZ/sKClQAdLOD8aQkg5J+vaBEEOv5UUvz1QyVAhxtA6ifKyF8YL7WMk8vIP8EVgr2ordSMf/+/A2fUF9MYVlXQ/6Bpcwb0tV+izZtdToWouARc8oYvENS/hCUQdgoDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729878452; c=relaxed/simple;
	bh=1rQdgS2GBXxxmbQP6sTDBEEY5WaXBOITvoWOmkxTJIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5M9nqMzPrx7ukOOUvdFl2HhtrUvDtdIfz1HrhcKHdCEoVVVkU7tIeG7pdVqkDjop5uN4D8whwzD3yJ7P7tLTKmdyAIfbO087LRoAcKyPqQdy5vtUgKNN7bgdvtvhvpzuo/AmtcWsKljFTqAk/0VyU/0tiUvloR7NjzJRz/SH9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: lrUMTL9XS0eJHUEZPpUp9Q==
X-CSE-MsgGUID: BCZBi/30SJ6YDoXEgkw9bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="54966242"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="54966242"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 10:47:29 -0700
X-CSE-ConnectionGUID: AlBW6P7fSHW62yw6icnXPA==
X-CSE-MsgGUID: sw0o0UCISHCr8TSnIF7L2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="81803110"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 10:47:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1t4OPF-000000070Fp-3pJa;
	Fri, 25 Oct 2024 20:47:25 +0300
Date: Fri, 25 Oct 2024 20:47:25 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: x86-android-tablets: Add support for
 Vexia EDU ATLA 10 tablet
Message-ID: <ZxvZrb4bgbD1C-y9@smile.fi.intel.com>
References: <20241025094435.71718-1-hdegoede@redhat.com>
 <20241025094435.71718-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241025094435.71718-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 25, 2024 at 11:44:35AM +0200, Hans de Goede wrote:
> Add support for the Vexia EDU ATLA 10 tablet, Android 4.2/4.4 + Guadalinex
> Ubuntu tablet distributed to schools in the Spanish Andalucía region.
> 
> Besides the usual broken DSDT issues this tablet is special because all
> its LPSS island peripherals are enumerated as PCI devices rather then as
> ACPI devices as they typically are.

Just wondering if you investigated the possibility to switch this via
(most likely hidden or absent) BIOS options? On the prototypes we have
a switch in the firmware on how to enumerate LPSS, so it's possible
to get them enumerated as ACPI ones.

> At the same time there are disabled (_STA=0) ACPI devices for
> the peripherals and child ACPI devices for e.g. attached I2C/SDIO devices
> are children of these disabled ACPI devices and thus will not be used
> by Linux since the parent is disabled.
> 
> So besides the usual manual i2c-client instantiation for accel/touchscreen
> this tablet also requires manual i2c-client instantiation for the codec
> and for the PMIC.
> 
> Also it seems the mainboard was designed for Windows not Android, so
> it has an I2C attached embedded controller instead of allowing direct
> access to the charger + fuel-gauge chips as is usual with Android boards.
> 
> Normally when there is an embedded controller, there also is ACPI battery
> support, but since this shipped with Android that is missing and Linux
> needs to have a power_supply class driver talking directly to the EC.

...

>  	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB && PMIC_OPREGION
> +	depends on PCI

Maybe it's time to rearrange this a bit?

	depends on I2C && SPI && SERIAL_DEV_BUS
	depends on GPIOLIB && PMIC_OPREGION
	depends on ACPI && EFI && PCI

?

...

> +#include <linux/device.h>
> +#include <linux/device/bus.h>

device.h is enough.

...

> +static int __init vexia_edu_atla10_init(struct device *dev)
> +{
> +	struct device *pdev;
> +	int ret;
> +
> +	/* Enable the Wifi module by setting the wifi_enable pin to 1 */
> +	ret = x86_android_tablet_get_gpiod("INT33FC:02", 20, "wifi_enable",
> +					   false, GPIOD_OUT_HIGH, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/* Reprobe the SDIO controller to enumerate the now enabled Wifi module */
> +	pdev = bus_find_device_by_name(&pci_bus_type, NULL, "0000:00:11.0");
> +	if (!pdev)
> +		return -EPROBE_DEFER;

Why? Can't the pci_get_domain_bus_and_slot() give you the same result more
effectively?

> +	ret = device_reprobe(pdev);
> +	if (ret)
> +		dev_warn(pdev, "Reprobing 0000:00:11.0 error: %d\n", ret);
> +
> +	put_device(pdev);
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


