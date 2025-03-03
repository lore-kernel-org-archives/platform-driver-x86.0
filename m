Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E21B212B04
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Mar 2025 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741008047; cv=none; b=urzQiQuLCZ65C1klud0qpVkx58G4WCmBPwPcTx8suXCeUaDP5rWlPVr4T1slyg5g00WtusDpupFKzby2f3lglsD706+QaXVfsIQyXU2fBqFpm2PJkmfjWJmW/afWc/5xYy10GG6AG/tHRbENqxmAZz8Ilyyh62+AsqY9t/sSS3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741008047; c=relaxed/simple;
	bh=N0s/huLD898vd05IBHqIxYbAQkvjN8mCaDsZPRULlhA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=O+H8tFZdVtVQPCtim00deBghNu3Tazmfwg2PMlLyiaUFbj13Fp9PTMk+Emz5hSIMjQOy9lWvq1XSK4ZaF6S1QhFMsCyq8nU01cbMmIe7NqXc1kXg7TsxXo7w3O3SNNjWEL4O/IZLUEoFYMfDPYOy1zK1LvymJHMxwIp/UlbYd2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXz1X1sQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXz1X1sQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741008046; x=1772544046;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=N0s/huLD898vd05IBHqIxYbAQkvjN8mCaDsZPRULlhA=;
  b=GXz1X1sQBlPlHWay/cYZuIyeG0epUkH0H96WSG9jGNUSbBapSmkwN5NJ
   hhCFuRDI6D+kNSE3BwQAaHTxr1snymS1Z28EKzo+HDs8Gfds9KLYi5+5f
   XkhlobIpapPWg0qP75/kLI6OjD6hDndwUnfBIr2ypbopzpc2bHj9B4hm9
   YP1ovuVgTCOvnZqVFf+8CBV7bgMlAg08Ca/8ViQ4ufD9BXg5u48HCPcB4
   O9I/5w7fzgM1zr7F+Cgu7FEcYhLQQRZQ/YQ2T0M/KWMYW4hZJmLOvjPoM
   SgwjO0pnexeCl4f1k1YE0K3c8qVWhe0GlkPVzuJESFDto1ZZxcxZ63JPc
   g==;
X-CSE-ConnectionGUID: JGren9zwSQe12Z1nJ2P4ow==
X-CSE-MsgGUID: FeHz09/xRi6lr4BKagMrfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41735234"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41735234"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 05:20:46 -0800
X-CSE-ConnectionGUID: E6+8VuePQ+mDNuaVQ4NzCQ==
X-CSE-MsgGUID: C7mHIciDQaiBc3i8E8OCyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="118496736"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.14])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 05:20:43 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Mar 2025 15:20:39 +0200 (EET)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH 2/3] platform/x86/amd/hsmp: Report power using hwmon
 sensors
In-Reply-To: <20250218123905.51984-3-suma.hegde@amd.com>
Message-ID: <3ef6ba82-494d-f61c-bb39-868d92bccd6b@linux.intel.com>
References: <20250218123905.51984-1-suma.hegde@amd.com> <20250218123905.51984-3-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Feb 2025, Suma Hegde wrote:

> Expose power reading and power limits via hwmon power sensors.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> 
> ---
>  Documentation/arch/x86/amd_hsmp.rst    |  10 ++
>  drivers/platform/x86/amd/hsmp/Makefile |   2 +-
>  drivers/platform/x86/amd/hsmp/acpi.c   |   3 +
>  drivers/platform/x86/amd/hsmp/hsmp.h   |  12 +-
>  drivers/platform/x86/amd/hsmp/hwmon.c  | 191 +++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/plat.c   |   3 +
>  6 files changed, 219 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/hsmp/hwmon.c
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 2fd917638e42..9e5fef538f4f 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -117,6 +117,16 @@ for socket with ID00 is given below::
>  		}
>  
>  
> +HSMP HWMON interface
> +==================
> +HSMP power sensors are registered with hwmon interface.
> +Following files with 0444 permission are created.
> +- powerx_input
> +- powerx_cap_max
> +- powerx_cap
> +one powerx file is created for each socket. powerx_label is used to
> +identify the socket to which this info belongs.
> +
>  An example
>  ==========
>  
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
> index 3175d8885e87..f63fdc12def1 100644
> --- a/drivers/platform/x86/amd/hsmp/Makefile
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -5,7 +5,7 @@
>  #
>  
>  obj-$(CONFIG_AMD_HSMP)			+= hsmp_common.o
> -hsmp_common-objs			:= hsmp.o
> +hsmp_common-objs			:= hsmp.o hwmon.o
>  obj-$(CONFIG_AMD_HSMP_PLAT)		+= amd_hsmp.o
>  amd_hsmp-objs				:= plat.o
>  obj-$(CONFIG_AMD_HSMP_ACPI)		+= hsmp_acpi.o

Please rebase.

Also, this probably lacks some hwmon depends on ?

> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 0c54c91b5f1a..f73b6aedb986 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -342,6 +342,9 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  		if (ret)
>  			return ret;
>  		hsmp_pdev->is_probed = true;
> +		ret = hsmp_create_sensor(&pdev->dev, hsmp_pdev);
> +		if (ret)
> +			dev_err(&pdev->dev, "Failed to create hwmon interface.\n");
>  	}
>  
>  	return 0;
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 3dee0bb684c7..e0227247c995 100644
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
> @@ -49,12 +50,20 @@ struct hsmp_socket {
>  	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
>  };
>  
> +struct hsmp_hwmon {
> +	char (*p_label)[20];
> +	const struct hwmon_channel_info *info[2];
> +	struct hwmon_channel_info power_info;
> +	struct hwmon_chip_info chip;
> +};
> +
>  struct hsmp_plat_device {
>  	struct miscdevice mdev;
>  	struct hsmp_socket *sock;
>  	u32 proto_ver;
>  	u16 num_sockets;
>  	bool is_probed;
> +	struct hsmp_hwmon hwmon;
>  };
>  
>  int hsmp_cache_proto_ver(u16 sock_ind);
> @@ -65,4 +74,5 @@ int hsmp_misc_register(struct device *dev);
>  int hsmp_get_tbl_dram_base(u16 sock_ind);
>  ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
>  struct hsmp_plat_device *get_hsmp_pdev(void);
> +int hsmp_create_sensor(struct device *dev, struct hsmp_plat_device *pdev);
>  #endif /* HSMP_H */
> diff --git a/drivers/platform/x86/amd/hsmp/hwmon.c b/drivers/platform/x86/amd/hsmp/hwmon.c
> new file mode 100644
> index 000000000000..a2925c53fbe9
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/hwmon.c
> @@ -0,0 +1,191 @@
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
> +#include <asm-generic/int-ll64.h>

What is this for??

> +#include <linux/device.h>
> +#include <linux/hwmon.h>
> +
> +#include "hsmp.h"
> +
> +#define NR_PWR_CHANNELS		3
> +#define HSMP_HWMON_NAME		"amd_hsmp_hwmon"
> +
> +static const char * const power_label[] = {
> +	"pinput",
> +	"pcap",
> +	"pcap_max"
> +};
> +
> +static int hsmp_hwmon_read_label(struct device *dev,
> +				 enum hwmon_sensor_types type, u32 attr,
> +				 int channel, const char **str)
> +{
> +	struct hsmp_plat_device *pdev = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_power:
> +		*str = pdev->hwmon.p_label[channel];
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +	return 0;
> +}
> +
> +static int hsmp_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +			    u32 attr, int channel, long val)
> +{
> +	struct hsmp_message msg = { 0 };
> +	int ret = -EOPNOTSUPP;
> +
> +	switch (type) {
> +	case hwmon_power:
> +		switch (channel % NR_PWR_CHANNELS) {
> +		case 1:
> +			msg.sock_ind = channel / NR_PWR_CHANNELS;
> +			msg.num_args = 1;
> +			msg.args[0] = val;
> +			msg.msg_id = HSMP_SET_SOCKET_POWER_LIMIT;
> +			return hsmp_send_message(&msg);

> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;

That's quite much boilerplate where direct returns would avoid some of it.
Is checkpatch the cause for all this madness?? There's no point in 
cascading breaks just to return in the end of the chain.

> +	}
> +
> +	return ret;

You don't need variable to return -EOPNOTSUPP; here ;-).

> +}
> +
> +static int hsmp_hwmon_read(struct device *dev,
> +			   enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long *val)
> +{
> +	struct hsmp_message msg = { 0 };
> +	int ret;
> +
> +	msg.sock_ind = channel / NR_PWR_CHANNELS;
> +	msg.response_sz = 1;
> +
> +	switch (type) {
> +	case hwmon_power:
> +		switch (channel % NR_PWR_CHANNELS) {
> +		case 0:
> +			msg.msg_id = HSMP_GET_SOCKET_POWER;
> +			break;
> +		case 1:
> +			msg.msg_id = HSMP_GET_SOCKET_POWER_LIMIT;
> +			break;
> +		case 2:
> +			msg.msg_id = HSMP_GET_SOCKET_POWER_LIMIT_MAX;
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
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
> +	switch (type) {
> +	case hwmon_power:
> +		switch (channel % NR_PWR_CHANNELS) {
> +		case 0:
> +		case 2:
> +			return 0444;
> +		case 1:
> +			return 0644;

> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}

boilerplate

> +
> +	return 0;
> +}
> +
> +const struct hwmon_ops hsmp_hwmon_ops = {
> +	.read = hsmp_hwmon_read,
> +	.read_string = hsmp_hwmon_read_label,
> +	.is_visible = hsmp_hwmon_is_visble,
> +	.write	= hsmp_hwmon_write,
> +};
> +
> +static int hsmp_create_power_sensor(struct device *dev, struct hsmp_plat_device *pdev)
> +{
> +	char (*p_label)[20];
> +	u32 *p_config;
> +	int j;
> +
> +	p_config = devm_kcalloc(dev, pdev->num_sockets * NR_PWR_CHANNELS + 1,
> +				sizeof(*p_config), GFP_KERNEL);
> +	if (!p_config)
> +		return -ENOMEM;
> +
> +	p_label = devm_kcalloc(dev, NR_PWR_CHANNELS * pdev->num_sockets,
> +			       sizeof(*p_label), GFP_KERNEL);
> +	if (!p_label)
> +		return -ENOMEM;
> +
> +	for (j = 0; j < pdev->num_sockets * NR_PWR_CHANNELS;) {
> +		p_config[j] = HWMON_P_INPUT | HWMON_P_LABEL;
> +		p_config[j + 1] = HWMON_P_CAP | HWMON_P_LABEL;
> +		p_config[j + 2] = HWMON_P_CAP_MAX | HWMON_P_LABEL;
> +		scnprintf(p_label[j], 20, "sock%u_%s", j / NR_PWR_CHANNELS, power_label[0]);
> +		scnprintf(p_label[j + 1], 20, "sock%u_%s", j / NR_PWR_CHANNELS, power_label[1]);
> +		scnprintf(p_label[j + 2], 20, "sock%u_%s", j / NR_PWR_CHANNELS, power_label[2]);

You could just devm_kasprintf() these and get rid of that magic 20. And do 
you even have to alloc the array, it's going to 3 entries always?

> +		j += NR_PWR_CHANNELS;
> +	}
> +
> +	pdev->hwmon.power_info.type = hwmon_power;
> +	pdev->hwmon.power_info.config = p_config;
> +	pdev->hwmon.info[0] = &pdev->hwmon.power_info;
> +	pdev->hwmon.p_label = p_label;
> +
> +	return 0;
> +}
> +
> +int hsmp_create_sensor(struct device *dev, struct hsmp_plat_device *pdev)
> +{
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	ret = hsmp_create_power_sensor(dev, pdev);
> +	if (ret)
> +		return ret;
> +
> +	pdev->hwmon.chip.ops	= &hsmp_hwmon_ops;
> +	pdev->hwmon.chip.info	= pdev->hwmon.info;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, HSMP_HWMON_NAME,
> +							 pdev,
> +							 &pdev->hwmon.chip,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS(hsmp_create_sensor, "AMD_HSMP");
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 63034408985c..2bb590a34642 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -220,6 +220,9 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
>  		return ret;
>  	}
> +	ret = hsmp_create_sensor(&pdev->dev, hsmp_pdev);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to create hwmon interface.\n");
>  
>  	return hsmp_misc_register(&pdev->dev);
>  }
> 

-- 
 i.

