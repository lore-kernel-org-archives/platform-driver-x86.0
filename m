Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3593402BB3;
	Thu, 30 Apr 2026 12:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777552716; cv=none; b=MYZZdWJiubhnQf9KKHmQes9hM5kjyBz/+DfQp8+yAzDMGqz6Jy26tE22Ip83ghqCLytzSMl8vZyRfFVvUG4I4JTXXceUXRm1KoXVuZgegqBIQNNxZ3CyLKan5Fit5TmPIYMwn7PE8UmIhOT8mIdaI3uIsc4tkPLXkcVS4c9D3Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777552716; c=relaxed/simple;
	bh=kEm5D3KE+833sT5WmffRLoFjO3RfIi2a7T7bGUilKWg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BH2DoJCxtj/rBxJatX7n5Zi+FGnFS2pLfpn0JYJoe8+g+g+9krEfhvDEUPeoe3JsduTkwkorXc/vsWtzz6lTQ3MrRiLBvhgMlBVmHMrylEeehQGf3cAost57DRAWJ2R9iA2XQbhHmylF0fvVXAab/QKycbYo6WnJUFVvTJoOYoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hAWueF9J; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hAWueF9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777552715; x=1809088715;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kEm5D3KE+833sT5WmffRLoFjO3RfIi2a7T7bGUilKWg=;
  b=hAWueF9JKwCDsNRTZPIOQXIqn4q6Hc6QWaBnSPgW1XolDb+tWn3E0KNi
   UObjn5oZsTdNZlJXWG8nvQeANCNZEIP1YxLbwWGED8dUeb17YlAeE/qdE
   EA8OfVxJxYfjEakiPWMwfxbVNHqKCT/ijIEVngVram0EnDvRtMcDqgUjI
   0cDHFMlGFNxSGV1SuCqfN1Eo6RQ2RRYe50p/PQL3Vf64m1aEGu7ggbJVw
   jtwt2UftxdnMD2E0cVOMdbCClR2gydoV0PCNWsxHEzt0Y/rmhq3jZ6B8t
   0yeGbzAiVcLQYiCP0m8w1clN0+0PkVDKxg25v4VVHG0QhpY4CHSD8/dZH
   w==;
X-CSE-ConnectionGUID: trjrkNE3Q4iU8qcHFG0iwg==
X-CSE-MsgGUID: tLWvioy3R9OO0dETOcp90w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78423127"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78423127"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:38:35 -0700
X-CSE-ConnectionGUID: FK3+kHw6R2SqHfo/9Kxfvw==
X-CSE-MsgGUID: WzH8TF7jRIWoW40aOOsUaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="258149971"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:38:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 30 Apr 2026 15:38:28 +0300 (EEST)
To: Jack Wu <wojackbb@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    Mario Limonciello <superm1@kernel.org>, Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v5] platform/x86: dell-dw5826e: Add reset driver for
 DW5826e
In-Reply-To: <20260429060643.2367630-1-jackbb_wu@compal.com>
Message-ID: <e973c03d-a92f-f9aa-c952-0c861a632191@linux.intel.com>
References: <20260429060643.2367630-1-jackbb_wu@compal.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 29 Apr 2026, Jack Wu wrote:

> If the DW5826e is in a frozen state and unable to receive USB commands,
> this driver provides a method for the user to reset the DW5826e via ACPI.
> 
> E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/wwan_reset
> 
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
> v5:
>   - Use BIT() for the DSM method
> v4:
>   - Fix version of the ABI documentation to 7.2
>   - Add include linux/types.h
> v3:
>   - Rename sysfs attribute from "pldr" to "wwan_reset" for clarity
>   - Add ABI documentation for the wwan_reset sysfs interface
>   - Validate _DSM method availability in probe using acpi_check_dsm()
> v2:
>   - Remove extra empty line
>   - Add missing includes and Remove unnecessary includes, sort includes alphabetically
>   - Remove noisy dev_info()
>   - Handle obj->type != ACPI_TYPE_BUFFER as error with proper return code
>   - Replace miscdevice/file_operations with sysfs attribute (DEVICE_ATTR_WO) to reduce boilerplate
>   - Propagate trigger_palc_pldr() return code to userspace
>   - Convert from acpi_driver to platform_driver
> ---
> ---
>  .../testing/sysfs-driver-dell-dw5826e-reset   |  9 ++
>  drivers/platform/x86/dell/Kconfig             |  6 ++
>  drivers/platform/x86/dell/Makefile            |  2 +
>  .../platform/x86/dell/dell-dw5826e-reset.c    | 93 +++++++++++++++++++
>  4 files changed, 110 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
>  create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
> new file mode 100644
> index 000000000000..a665e265633f
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
> @@ -0,0 +1,9 @@
> +What:		/sys/bus/platform/devices/<PALC0001 device>/wwan_reset
> +Date:		April 2026
> +KernelVersion:	7.2
> +Contact:	Jackbb Wu <jackbb.wu@compal.com>
> +Description:
> +		Writing to this file triggers a Platform Level Device Reset
> +		(PLDR) of the Dell DW5826e WWAN module via an ACPI _DSM
> +		method. This can be used to recover the modem when it is in
> +		a frozen state and unable to respond to USB commands.
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index 738c108c2163..c4540c837a88 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -276,4 +276,10 @@ config DELL_WMI_SYSMAN
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called dell-wmi-sysman.
>  
> +config DELL_DW5826E_RESET
> +	tristate "Dell DW5826e PLDR reset support"
> +	default m
> +	depends on ACPI
> +	help
> +	  This adds support for the Dell DW5826e PLDR reset via ACPI
>  endif # X86_PLATFORM_DRIVERS_DELL
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
> index c7501c25e627..8150283cfd1d 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -28,3 +28,5 @@ obj-$(CONFIG_DELL_WMI_DESCRIPTOR)		+= dell-wmi-descriptor.o
>  obj-$(CONFIG_DELL_WMI_DDV)			+= dell-wmi-ddv.o
>  obj-$(CONFIG_DELL_WMI_LED)			+= dell-wmi-led.o
>  obj-$(CONFIG_DELL_WMI_SYSMAN)			+= dell-wmi-sysman/
> +obj-$(CONFIG_DELL_DW5826E_RESET)		+= dell-dw5826e-reset.o
> +
> diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> new file mode 100644
> index 000000000000..24b18062ae0e
> --- /dev/null
> +++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  dell-dw5826e-reset.c - Dell DW5826e reset driver
> + *
> + *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/uuid.h>
> +
> +#define PALC_DSM_FN_TRIGGER_PLDR    1
> +
> +static guid_t palc_dsm_guid =

This can be const.

> +	GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0xfd, 0xfe, 0x59);
> +
> +static int trigger_palc_pldr(struct device *dev, acpi_handle handle)
> +{
> +	union acpi_object *obj;
> +	int ret = 0;
> +
> +	obj = acpi_evaluate_dsm(handle, &palc_dsm_guid, 1, BIT(PALC_DSM_FN_TRIGGER_PLDR), NULL);

Should the BIT() be part of the define?

--
 i.

> +	if (!obj) {
> +		dev_err(dev, "Failed to evaluate _DSM\n");
> +		return -EIO;
> +	}
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		dev_err(dev, "Unexpected _DSM return type: %d\n", obj->type);
> +		ret = -EINVAL;
> +	}
> +
> +	ACPI_FREE(obj);
> +	return ret;
> +}
> +
> +static ssize_t wwan_reset_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	acpi_handle handle = ACPI_HANDLE(dev);
> +	int ret;
> +
> +	ret = trigger_palc_pldr(dev, handle);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_WO(wwan_reset);
> +
> +static struct attribute *palc_attrs[] = {
> +	&dev_attr_wwan_reset.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(palc);
> +
> +static int palc_probe(struct platform_device *pdev)
> +{
> +	acpi_handle handle;
> +
> +	handle = ACPI_HANDLE(&pdev->dev);
> +	if (!handle)
> +		return -ENODEV;
> +
> +	if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, BIT(1)))
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static const struct acpi_device_id palc_acpi_ids[] = {
> +	{ "PALC0001", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, palc_acpi_ids);
> +
> +static struct platform_driver palc_driver = {
> +	.driver = {
> +		.name = "dell-dw5826e-reset",
> +		.acpi_match_table = palc_acpi_ids,
> +		.dev_groups = palc_groups,
> +	},
> +	.probe  = palc_probe,
> +};
> +module_platform_driver(palc_driver);
> +
> +MODULE_DESCRIPTION("Dell DW5826e reset driver");
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("JackBB Wu");
> 

