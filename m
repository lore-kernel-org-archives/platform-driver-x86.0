Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94541EB5E3;
	Wed, 15 Apr 2026 09:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246202; cv=none; b=IO+iu2pRTtxKokH1DKEz3NAEzF07/ZSfHGj3pRNYNrIPGKrKQ7BHZGVjKKLY2TrBijIoRkklzChtRsrVJJVyeYRkh2uJ9JKZp8q//MWBq/8tmT2Zalbaaei1Y79S1VaAFdWqjuUpsLVG+Y649xlv2v9ra4g05EOmteDwh7YT5eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246202; c=relaxed/simple;
	bh=0Ri4gHPbploaCPW16c6LkAdMWUb8oknafbLd+SmeCBQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Jh+lWTVY40cOERfdt9kRM1Rs8Mgt+OMFTgdfQ2q9eJzfegyS+TqhukPKQJ+iAtJjrMe12nTL5ShAHsvhKfjLjqcprnBhl48q+CQsTA21JYM2tp9muxkw5RGVi05BzvaDZte1uFnqUcnj1iCX5AbjCwGsiC4I7VgYl2jQXJRT+1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ickmJFvU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ickmJFvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776246200; x=1807782200;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0Ri4gHPbploaCPW16c6LkAdMWUb8oknafbLd+SmeCBQ=;
  b=ickmJFvUf/O1gxSKqadYfVA0HhJW77D1mVHXKYc/DolSUQgwjkYua/f2
   DANY7N5WDV0agiXHR0vtgze3gz9rJkl9sdnfFQgH7kEcJ9QdVSRdPI11c
   UUAXBG0ZJwCqqv5qS3KnSHb6pmo1MczC5knYPm4ku2JCCq/4ZyJJeFoIJ
   OR901X/tYWowSyvgNB6IqbrK5bNq5jq6eLe4MkzTFldcaq/1xQaamxao6
   rqnO8IAkHv6wmeUMTOtKpiYHIMpbyZf3ZkvnFEupvSc3p0i82p8EhD1Iz
   bI6dz5N/0kQAbktjhUBAl8l+jsXrvw8kas0mQMJLhdxrRqBGl9RG7Zyv5
   g==;
X-CSE-ConnectionGUID: 6ynH0sWGTu+kBeC3WIUfhA==
X-CSE-MsgGUID: ULwBZPlbRoSJvlieeYgXrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="102676538"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="102676538"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 02:43:15 -0700
X-CSE-ConnectionGUID: 0C6YxCvxTA2e3bDwR/6Plw==
X-CSE-MsgGUID: 38d/xnFiQhiKEKlI5oPHRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="227727718"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.114])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 02:43:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 15 Apr 2026 12:43:10 +0300 (EEST)
To: Jack Wu <wojackbb@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] platform/x86: dell-dw5826e: Add reset driver for
 DW5826e
In-Reply-To: <20260415062255.1615337-1-jackbb_wu@compal.com>
Message-ID: <1b234e48-b41f-9c81-ce25-a0fe00f654d3@linux.intel.com>
References: <20260415062255.1615337-1-jackbb_wu@compal.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Apr 2026, Jack Wu wrote:



> If the DW5826e is in a frozen state and unable to receive USB commands,
> this driver provides a method for the user to reset the DW5826e via ACPI.
> 
> E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/wwan_reset
> 
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
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
>  .../platform/x86/dell/dell-dw5826e-reset.c    | 89 +++++++++++++++++++
>  4 files changed, 106 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
>  create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
> new file mode 100644
> index 000000000000..88286191caa6
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
> @@ -0,0 +1,9 @@
> +What:		/sys/bus/platform/devices/<PALC0001 device>/wwan_reset
> +Date:		April 2026
> +KernelVersion:	7.0

This ship has sailed long ago. ATM, you're targetting 7.2.

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
> index 000000000000..98c5b68c8746
> --- /dev/null
> +++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  dell-dw5826e-reset.c - Dell DW5826e reset driver
> + *
> + *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/uuid.h>
> +
> +static guid_t palc_dsm_guid =
> +	GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0xfd, 0xfe, 0x59);
> +
> +static int trigger_palc_pldr(struct device *dev, acpi_handle handle)
> +{
> +	union acpi_object *obj;
> +	int ret = 0;
> +
> +	obj = acpi_evaluate_dsm(handle, &palc_dsm_guid, 1, 1, NULL);
> +	if (!obj) {
> +		dev_err(dev, "Failed to evaluate _DSM\n");

Missing include.

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

Please also add linux/types.h for ssize_t.

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

-- 
 i.

