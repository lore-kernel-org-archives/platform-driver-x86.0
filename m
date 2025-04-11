Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C41A278E67
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Apr 2025 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744367124; cv=none; b=YPPVUT/GNFJk+5hOxpLwDL60SuBFn9tOaLSwQnrb5MYXPFfMW0VffA7uj5PyT7B+4ZQao6aobPAK9qvBJjxnxJB2dcNbtRuQlzxct/8JkFXtUQWrAw/bfSHYV0OU5aVG3pvsRxfvNyoODYsjz66zdd/te52EdlL/72z0bqNMXbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744367124; c=relaxed/simple;
	bh=Nico0n1645Ebqx8Eat0Hxi+fvStr3FlFi81wuPYh1Iw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QlKwAfVy/JgzyGa+cVqCBbvZZLIN/bX4lyedzTC4MZ9YEt/mS8Xe9RfFTmh3bnpdvDfxBZUxIwUyjCTi7KGpaIE/eskLvb+jjE6sUpASmPe/TW4xzLJ9nNuXTIbVXnLsYudNxallVffH2uoZ5Tkbn5LKYXt+tRySeftnLIjAqzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIa9vgc+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIa9vgc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744367123; x=1775903123;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Nico0n1645Ebqx8Eat0Hxi+fvStr3FlFi81wuPYh1Iw=;
  b=oIa9vgc+ndNvU/1yODyb5krElA9WZiwmkna+kgjcBBJi+ZEK7zvjpvyg
   i9WpUQYEHi9fcwP5gBRp7oFS1jRt3I41z2JY4yODIvYFW8SqRGAGwPi+7
   8cu+FfcZtfNYVY73AL3+TzbJvA7UdVje7ZqFcsk5AJHFq2IYjUMAHf27d
   oPSTKXhPeo/r3i2yPEqMqPsunDOzQomgqLpiXKQ2TaP9WK0DIVXsBWrUt
   cQwxcQ1m7yy7DK3Sn9kYjAk/mjFH+4jJJs3KPYi3F8A3Wxpo0B3V5ojLa
   1nl1Hrg1HMF9Vf+DS/nco1yHwnByvi4OxW3zhpT+yMfyGpj7fkVy2Hnc/
   Q==;
X-CSE-ConnectionGUID: WfOiwyyDQ3GNf055fid5Cw==
X-CSE-MsgGUID: x5Kgl96QSEa2NL102AtAFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="46043971"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="46043971"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 03:25:22 -0700
X-CSE-ConnectionGUID: 8wfCVtwXQQqNlF0xPUgwWg==
X-CSE-MsgGUID: Pf4tu/vQRz+xz/bgyaz2zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="134020428"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.51])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 03:25:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 11 Apr 2025 13:25:16 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v2 2/3] platform/x86/amd/hsmp: Report power using hwmon
 sensors
In-Reply-To: <20250325060457.3643613-2-suma.hegde@amd.com>
Message-ID: <1919f8c8-941d-d1bc-d9cf-cea8554a6fdc@linux.intel.com>
References: <20250325060457.3643613-1-suma.hegde@amd.com> <20250325060457.3643613-2-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Mar 2025, Suma Hegde wrote:

> Expose power reading and power limits via hwmon power sensors.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v1:
> 1. Move hsmp_create_sensor() call to init_acpi() in acpi.c and init_platform_device() in plat.c
> 2. Pass u16 as parameter instead of void * in hsmp_create_sensor()
> 3. Change dev_err() print after hsmp_create_sensor()
> 4. Add CONFIG_HWMON dependency in Makefile
> 5. Add #if IS_REACHABLE(CONFIG_HWMON) condition check in hsmp.h
> 6. Remove hsmp_hwmon struct in hsmp.h and add hwmon_channel_info and hwmon_chip_info to
>    hwmon.c file as static variables
> 7. Change argument to devm_hwmon_device_register_with_info()
> 8. Remove hsmp_create_power_sensor() and define power info statically. Instead of multiple channel,
>    use single channel with different attributes.
> 9. Replace switch with if in hsmp_hwmon_is_visble()
> 10. Remove referencing channel related code in hsmp_hwmon_read() and add code for attribute checking.
> 11. Replace switch with if in hsmp_hwmon_read()
> 12. Remove hsmp_hwmon_read_label().
> 13. Update hsmp_hwmon_write() to remove switch and code related to channel
> 14. Remove int-ll64.h header
> 15. Update the documentation
> 
>  Documentation/arch/x86/amd_hsmp.rst    |  10 ++
>  drivers/platform/x86/amd/hsmp/Makefile |   1 +
>  drivers/platform/x86/amd/hsmp/acpi.c   |   4 +
>  drivers/platform/x86/amd/hsmp/hsmp.h   |  11 ++-
>  drivers/platform/x86/amd/hsmp/hwmon.c  | 124 +++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/plat.c   |   5 +
>  6 files changed, 154 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/platform/x86/amd/hsmp/hwmon.c
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 2fd917638e42..1d7b159a35d5 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -117,6 +117,16 @@ for socket with ID00 is given below::
>  		}
>  
>  
> +HSMP HWMON interface
> +==================
> +HSMP power sensors are registered with hwmon interface.
> +
> +One hwmon directory is created for each socket and following files with 0444 permission are created
> +inside the hwmon directory.
> +- power1_input
> +- power1_cap_max
> +- power1_cap
> +
>  An example
>  ==========
>  
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
> index 0759bbcd13f6..ce8342e71f50 100644
> --- a/drivers/platform/x86/amd/hsmp/Makefile
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -6,6 +6,7 @@
>  
>  obj-$(CONFIG_AMD_HSMP)			+= hsmp_common.o
>  hsmp_common-y				:= hsmp.o
> +hsmp_common-$(CONFIG_HWMON)		+= hwmon.o
>  obj-$(CONFIG_AMD_HSMP_PLAT)		+= amd_hsmp.o
>  amd_hsmp-y				:= plat.o
>  obj-$(CONFIG_AMD_HSMP_ACPI)		+= hsmp_acpi.o
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 0c54c91b5f1a..abbb680b9c71 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -281,6 +281,10 @@ static int init_acpi(struct device *dev)
>  			dev_err(dev, "Failed to init metric table\n");
>  	}
>  
> +	ret = hsmp_create_sensor(dev, sock_ind);
> +	if (ret)
> +		dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 3dee0bb684c7..0063904904ed 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -12,6 +12,7 @@
>  
>  #include <linux/compiler_types.h>
>  #include <linux/device.h>
> +#include <linux/hwmon.h>
>  #include <linux/miscdevice.h>
>  #include <linux/pci.h>
>  #include <linux/semaphore.h>
> @@ -26,7 +27,7 @@
>  #define HSMP_CDEV_NAME		"hsmp_cdev"
>  #define HSMP_DEVNODE_NAME	"hsmp"
>  
> -#define DRIVER_VERSION		"2.4"
> +#define DRIVER_VERSION		"2.5"
>  
>  struct hsmp_mbaddr_info {
>  	u32 base_addr;
> @@ -65,4 +66,12 @@ int hsmp_misc_register(struct device *dev);
>  int hsmp_get_tbl_dram_base(u16 sock_ind);
>  ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
>  struct hsmp_plat_device *get_hsmp_pdev(void);
> +#if IS_REACHABLE(CONFIG_HWMON)
> +int hsmp_create_sensor(struct device *dev, u16 sock_ind);
> +#else
> +int hsmp_create_sensor(struct device *dev, u16 sock_ind);
> +{
> +	return 0;
> +}

Does this even compile with the extra semicolon?!? In any case, put the 
stub's code right after the function:

int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }

> +#endif
>  #endif /* HSMP_H */
> diff --git a/drivers/platform/x86/amd/hsmp/hwmon.c b/drivers/platform/x86/amd/hsmp/hwmon.c
> new file mode 100644
> index 000000000000..98b1d66f491d
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/hwmon.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD HSMP hwmon support
> + * Copyright (c) 2025, AMD.
> + * All Rights Reserved.
> + *
> + * This file provides hwmon implementation for HSMP interface.
> + */
> +
> +#include <asm/amd_hsmp.h>
> +
> +#include <linux/device.h>
> +#include <linux/hwmon.h>
> +
> +#include "hsmp.h"
> +
> +#define HSMP_HWMON_NAME		"amd_hsmp_hwmon"
> +
> +static int hsmp_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +			    u32 attr, int channel, long val)
> +{
> +	u16 sock_ind = (uintptr_t)dev_get_drvdata(dev);

Casting to intermediate type serves no purpose so why not cast directly to 
u16?

> +

Remove extra line.

> +	struct hsmp_message msg = { 0 };


{} is enough to initialize.

> +
> +	if (type != hwmon_power)
> +		return -EOPNOTSUPP;

Add #include.

> +
> +	if (attr != hwmon_power_cap)
> +		return -EOPNOTSUPP;
> +
> +	msg.num_args = 1;
> +	msg.args[0] = val;
> +	msg.msg_id = HSMP_SET_SOCKET_POWER_LIMIT;
> +	msg.sock_ind = sock_ind;
> +	return hsmp_send_message(&msg);
> +}
> +
> +static int hsmp_hwmon_read(struct device *dev,
> +			   enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long *val)
> +{
> +	u16 sock_ind = (uintptr_t)dev_get_drvdata(dev);
> +	struct hsmp_message msg = { 0 };

Remove double cast and {}.

> +	int ret;
> +
> +	if (type != hwmon_power)
> +		return -EOPNOTSUPP;
> +
> +	msg.sock_ind = sock_ind;
> +	msg.response_sz = 1;
> +
> +	switch (attr) {
> +	case hwmon_power_input:
> +		msg.msg_id = HSMP_GET_SOCKET_POWER;
> +		break;
> +	case hwmon_power_cap:
> +		msg.msg_id = HSMP_GET_SOCKET_POWER_LIMIT;
> +		break;
> +	case hwmon_power_cap_max:
> +		msg.msg_id = HSMP_GET_SOCKET_POWER_LIMIT_MAX;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ret = hsmp_send_message(&msg);
> +	if (!ret)
> +		*val = msg.args[0];
> +
> +	return ret;
> +}
> +
> +static umode_t hsmp_hwmon_is_visble(const void *data,
> +				    enum hwmon_sensor_types type,
> +				    u32 attr, int channel)
> +{
> +	if (type != hwmon_power)
> +		return 0;
> +
> +	switch (attr) {
> +	case hwmon_power_input:
> +		return 0444;
> +	case hwmon_power_cap:
> +		return 0644;
> +	case hwmon_power_cap_max:
> +		return 0444;
> +	default:
> +		return 0;
> +	}
> +
> +	return 0;

Is this line required by some stupid checker???

> +}
> +
> +static const struct hwmon_ops hsmp_hwmon_ops = {
> +	.read = hsmp_hwmon_read,
> +	.is_visible = hsmp_hwmon_is_visble,
> +	.write	= hsmp_hwmon_write,
> +};
> +
> +static const struct hwmon_channel_info * const hsmp_info[] = {
> +	HWMON_CHANNEL_INFO(power, HWMON_P_INPUT | HWMON_P_CAP | HWMON_P_CAP_MAX),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info hsmp_chip_info = {
> +	.ops = &hsmp_hwmon_ops,
> +	.info = hsmp_info
> +};
> +
> +int hsmp_create_sensor(struct device *dev, u16 sock_ind)
> +{
> +	struct device *hwmon_dev;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, HSMP_HWMON_NAME,
> +							 (void *)(uintptr_t)(sock_ind),

Double casting seems pointless here as well. And sock_ind doesn't need 
parenthesis either.

> +							 &hsmp_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	return 0;

There's some err helper for this PTR_ERR_OR_ZERO() (IIRC). You also need 
to add #include for it (same would have applied to IS_ERR / PTR_ERR).

> +}
> +EXPORT_SYMBOL_NS(hsmp_create_sensor, "AMD_HSMP");
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 63034408985c..63a5d31341e1 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -200,6 +200,11 @@ static int init_platform_device(struct device *dev)
>  			if (ret)
>  				dev_err(dev, "Failed to init metric table\n");
>  		}
> +
> +		/* Register with hwmon interface for reporting power */
> +		ret = hsmp_create_sensor(dev, i);
> +		if (ret)
> +			dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
>  	}
>  
>  	return 0;
> 

-- 
 i.

