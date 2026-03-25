Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D11824EA90
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774447513; cv=none; b=l/qaw9HYSVJsCSMFwULceXsw7ZNEvdHWD0yx15VD+vVQhUcIpechmCmpgzCeLXkP3MTdUeZflMTWSEOilgC8xbPuqof7PyF+A3OH/Ail0T2e1ROo2erji8S67xUhCMeW/qjpoIh/wakI9WKaBcUq43mJMJAXZltQTsLR26NVfUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774447513; c=relaxed/simple;
	bh=k4oXmzxTmoP0ehV7BOCAR9Tj5QvCsGkTcUobGgJTGMY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HiwuiFSRMbuutEQMC+Vurxe1U3ITgDaueDIoZ3wLuE+6xlN9+3MJ8Je9ATrywbkph6j1uUN3LbPErY4XW1cfwdfWPfxoq4CKc8C3ju7zpb15Da5nTj8LOymY1WSQ0xmQfO0pTFRPMTlDgVKl2ShOwGMISN6JfZEqqca/UZ4DxAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/ocefRl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/ocefRl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774447511; x=1805983511;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=k4oXmzxTmoP0ehV7BOCAR9Tj5QvCsGkTcUobGgJTGMY=;
  b=X/ocefRlXuo6Rn7gMseTIjNVD7gWTWa6iRdGwcgidwskCBLgxbgbXYsx
   qIeNx8fGt/FeSdcZNk9J3ilyI1XGJnulZPkFWhrm5Bx3WphCVttd+iBEi
   TAPuC4vKmd+uTw7qomCg+/wzBL3bdCqSLc6e4UVh4mdKhl3zlbW6/2dSz
   vdpOQdq9CmDoWxhMf6e8q1YDoa0bQaASv3CLsBAtNfNcDqcJ5V92JIqE+
   CV7WMOnBTjTnt//s64jFPYrR3dEOlzGl9rxqf/0nANo4zL8jnA6sVi4qa
   hu9WSmhfcluL658qLgIJEpvZB2xy9wp4ncumBV/XGtCz2xO6MlwWF9/pC
   w==;
X-CSE-ConnectionGUID: m0EoHaUIQySG1niDkQqAfA==
X-CSE-MsgGUID: BEd++j+7Q6KL5N+UtZ4z4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75372525"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75372525"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 07:05:11 -0700
X-CSE-ConnectionGUID: ahZP7ajBSt6YMktv3PNKgQ==
X-CSE-MsgGUID: vFFwFDeqTOOLdbCmAAMNrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="221802934"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 07:05:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Mar 2026 16:05:04 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v3 1/7] platform/x86/amd/pmf: Add util layer and userspace
 misc device interface
In-Reply-To: <20260301131124.1370565-2-Shyam-sundar.S-k@amd.com>
Message-ID: <86b8f4be-dfe7-afeb-7390-17b75bf438e7@linux.intel.com>
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com> <20260301131124.1370565-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 1 Mar 2026, Shyam Sundar S K wrote:

> Add a util layer to AMD PMF that exposes a minimal userspace interface
> via a misc character device for metrics monitoring and feature discovery.
> 
> This creates /dev/amdpmf_interface with basic ioctl support to retrieve
> PMF metrics such as:
> *Power source and power slider position
> *Platform type, lid state, and user presence
> *Skin temperature and ambient light
> *BIOS input parameters (1-10)
> *Graphics workload metrics
> *CPU C-state residency (average and maximum)
> *Socket power consumption
> 
> The interface enables smoother integration with userspace tools such as
> AMD SystemDeck [1], which is widely used for monitoring and controlling
> power and thermal behavior on AMD platforms. These tools help designers
> keep major components within thermal limits to ensure proper operation
> and enhance overall system stability and reliability.
> 
> The feature is gated behind the CONFIG_AMD_PMF_UTIL_SUPPORT Kconfig
> option, allowing it to be disabled if not needed. The implementation
> uses existing PMF infrastructure to populate data from the TA (Trusted
> Application) shared memory buffer.
> 
> Link: https://docs.amd.com/v/u/en-US/68773_0.50 [1]
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Kconfig  |  10 ++
>  drivers/platform/x86/amd/pmf/Makefile |   2 +
>  drivers/platform/x86/amd/pmf/core.c   |   5 +
>  drivers/platform/x86/amd/pmf/pmf.h    |   9 ++
>  drivers/platform/x86/amd/pmf/util.c   | 174 ++++++++++++++++++++++++++
>  include/uapi/linux/amd-pmf.h          | 115 +++++++++++++++++
>  6 files changed, 315 insertions(+)
>  create mode 100644 drivers/platform/x86/amd/pmf/util.c
>  create mode 100644 include/uapi/linux/amd-pmf.h
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index 25b8f7ae3abd..ad21f679b8ab 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -30,3 +30,13 @@ config AMD_PMF_DEBUG
>  	 in the PMF config store.
>  
>  	 Say Y here to enable more debug logs and Say N here if you are not sure.
> +
> +config AMD_PMF_UTIL_SUPPORT
> +	bool "AMD PMF Util layer support"
> +	depends on AMD_PMF
> +	help
> +	Enabling this option provides a character device for userspace to capture
> +	PMF features (Smart PC Builder, Auto Mode, Static Power Slider, Dynamic
> +	Power Slider AC/DC) along with PMF metrics from the AMD PMF driver.
> +
> +	Say Y here to enable it and Say N here if you are not sure.
> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> index 5978464e0eb7..bf7aad80b9e9 100644
> --- a/drivers/platform/x86/amd/pmf/Makefile
> +++ b/drivers/platform/x86/amd/pmf/Makefile
> @@ -8,3 +8,5 @@ obj-$(CONFIG_AMD_PMF)		+= amd-pmf.o
>  amd-pmf-y 			:= core.o acpi.o sps.o \
>  				   auto-mode.o cnqf.o \
>  				   tee-if.o spc.o
> +# Build util.c only when AMD_PMF_UTIL_SUPPORT is enabled
> +amd-pmf-$(CONFIG_AMD_PMF_UTIL_SUPPORT) += util.o
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index b9e5a2cf3aae..919d02f30aae 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -634,6 +634,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  
>  	pmf_device = dev->dev;
>  
> +	err = amd_pmf_cdev_register(dev);
> +	if (err)
> +		dev_warn(dev->dev, "failed to register util interface: %d\n", err);
> +
>  	dev_info(dev->dev, "registered PMF device successfully\n");
>  
>  	return 0;
> @@ -646,6 +650,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
>  	amd_pmf_deinit_features(dev);
>  	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
>  		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_UNLOAD);
> +	amd_pmf_cdev_unregister();
>  	apmf_acpi_deinit(dev);
>  	amd_pmf_dbgfs_unregister(dev);
>  }
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 69fef7448744..6f61076a9386 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -928,4 +928,13 @@ int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid);
>  void amd_pmf_tee_deinit(struct amd_pmf_dev *dev);
>  int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev);
>  
> +/* Util Layer */
> +#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
> +int amd_pmf_cdev_register(struct amd_pmf_dev *dev);
> +void amd_pmf_cdev_unregister(void);
> +#else
> +static inline int amd_pmf_cdev_register(struct amd_pmf_dev *dev) { return 0; }
> +static inline void amd_pmf_cdev_unregister(void) {}
> +#endif
> +
>  #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
> new file mode 100644
> index 000000000000..c6837caa44e0
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/util.c
> @@ -0,0 +1,174 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AMD Platform Management Framework Util Layer
> + *
> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *			 Sanket Goswami <Sanket.Goswami@amd.com>
> + */
> +
> +#include <linux/amd-pmf.h>
> +#include <linux/miscdevice.h>
> +#include <linux/mutex.h>
> +#include <linux/uaccess.h>
> +
> +#include "pmf.h"
> +
> +/* Convert BIOS input control code to array index (0-9) */
> +static int amd_pmf_get_bios_idx(u32 control_code)
> +{
> +	if (control_code >= IOCTL_BIOS_INPUT_1 && control_code <= IOCTL_BIOS_INPUT_10)
> +		return control_code - IOCTL_BIOS_INPUT_1;
> +
> +	return -EINVAL;
> +}
> +
> +static long long amd_pmf_populate_bios_input(struct ta_pmf_enact_table *in, u32 control_code)
> +{
> +	u32 idx;
> +
> +	idx = amd_pmf_get_bios_idx(control_code);
> +
> +	return (idx < 2) ? in->ev_info.bios_input_1[idx] : in->ev_info.bios_input_2[idx - 2];
> +}
> +
> +static long long amd_pmf_device_state(struct ta_pmf_enact_table *in, u32 control_code)
> +{
> +	switch (control_code) {
> +	case IOCTL_PLATFORM_TYPE:
> +		return in->ev_info.platform_type;
> +	case IOCTL_LAPTOP_PLACEMENT:
> +		return in->ev_info.device_state;
> +	case IOCTL_LID_STATE:
> +		return in->ev_info.lid_state;
> +	case IOCTL_USER_PRESENCE:
> +		return in->ev_info.user_present;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int amd_pmf_populate_data(struct device *dev, void __user *argp)
> +{
> +	struct amd_pmf_ioctl_info output = {0};
> +	struct ta_pmf_shared_memory *ta_sm = NULL;
> +	struct ta_pmf_enact_table *in = NULL;
> +	struct amd_pmf_dev *pdev;
> +
> +	pdev = dev_get_drvdata(dev);
> +	if (!pdev)
> +		return -EINVAL;
> +
> +	memset(pdev->shbuf, 0, pdev->policy_sz);
> +	ta_sm = pdev->shbuf;
> +	in = &ta_sm->pmf_input.enact_table;
> +
> +	if (copy_from_user(&output, argp, sizeof(output)))
> +		return -EFAULT;
> +
> +	switch (output.control_code) {
> +	case IOCTL_POWER_SOURCE:
> +		output.val = in->ev_info.power_source;
> +		break;
> +	case IOCTL_POWER_SLIDER_POSITION:
> +		output.val = in->ev_info.power_slider;
> +		break;
> +	case IOCTL_SKIN_TEMP:
> +		/* Convert from centi-degrees to degrees Celsius */
> +		output.val = in->ev_info.skin_temperature / 100;
> +		break;
> +	case IOCTL_PLATFORM_TYPE ... IOCTL_LID_STATE:
> +	case IOCTL_USER_PRESENCE:
> +		output.val = amd_pmf_device_state(in, output.control_code);
> +		break;
> +	case IOCTL_BIOS_INPUT_1 ... IOCTL_BIOS_INPUT_10:
> +		output.val = amd_pmf_populate_bios_input(in, output.control_code);
> +		break;
> +	case IOCTL_GFX_WORKLOAD:
> +		output.val = in->ev_info.gfx_busy;
> +		break;
> +	case IOCTL_AMBIENT_LIGHT:
> +		output.val = in->ev_info.ambient_light;
> +		break;
> +	case IOCTL_AVG_C0_RES:
> +		output.val = in->ev_info.avg_c0residency;
> +		break;
> +	case IOCTL_MAX_C0_RES:
> +		output.val = in->ev_info.max_c0residency;
> +		break;
> +	case IOCTL_SOCKET_POWER:
> +		output.val = in->ev_info.socket_power;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (copy_to_user(argp, &output, sizeof(output)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
> +static struct amd_pmf_dev *pmf_dev_handle;
> +static DEFINE_MUTEX(pmf_util_lock);
> +
> +static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> +{
> +	struct amd_pmf_dev *pdev = filp->private_data;
> +	void __user *argp = (void __user *)arg;
> +
> +	if (cmd != IOCTL_PMF_POPULATE_DATA)
> +		return -EINVAL;
> +
> +	guard(mutex)(&pmf_util_lock);
> +	return amd_pmf_populate_data(pdev->dev, argp);
> +}
> +
> +static int amd_pmf_open(struct inode *inode, struct file *filp)
> +{
> +	guard(mutex)(&pmf_util_lock);
> +	if (!pmf_dev_handle)
> +		return -ENODEV;
> +
> +	filp->private_data = pmf_dev_handle;
> +	return 0;
> +}
> +
> +static const struct file_operations pmf_if_ops = {
> +	.owner          = THIS_MODULE,
> +	.open           = amd_pmf_open,
> +	.unlocked_ioctl = amd_pmf_set_ioctl,
> +};
> +
> +static struct miscdevice amd_pmf_util_if = {
> +	.minor		= MISC_DYNAMIC_MINOR,
> +	.name		= "amdpmf_interface",
> +	.fops		= &pmf_if_ops,
> +};
> +
> +int amd_pmf_cdev_register(struct amd_pmf_dev *dev)
> +{
> +	int ret;
> +
> +	guard(mutex)(&pmf_util_lock);
> +	pmf_dev_handle = dev;
> +	ret = misc_register(&amd_pmf_util_if);
> +	if (ret)
> +		pmf_dev_handle = NULL;
> +
> +	return ret;
> +}
> +
> +void amd_pmf_cdev_unregister(void)
> +{
> +	guard(mutex)(&pmf_util_lock);
> +	pmf_dev_handle = NULL;
> +	misc_deregister(&amd_pmf_util_if);
> +}
> +#else
> +int amd_pmf_cdev_register(struct amd_pmf_dev *dev) { return 0; }
> +void amd_pmf_cdev_unregister(void) {}
> +#endif
> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
> new file mode 100644
> index 000000000000..d29431c67eaa
> --- /dev/null
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -0,0 +1,115 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
> +/*
> + * AMD Platform Management Framework (PMF) UAPI Header
> + *
> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * This file defines the user-space API for interacting with the AMD PMF
> + * driver. It provides ioctl interfaces to query platform-specific metrics
> + * such as power source, slider position, platform type, laptop placement,
> + * and various BIOS input/output parameters.
> + */
> +
> +#ifndef _UAPI_LINUX_AMD_PMF_H
> +#define _UAPI_LINUX_AMD_PMF_H
> +
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +
> +/**
> + * AMD_PMF_IOC_MAGIC - Magic number for AMD PMF ioctl commands
> + *
> + * This magic number uniquely identifies AMD PMF ioctl operations.
> + */
> +#define AMD_PMF_IOC_MAGIC	'p'
> +
> +/**
> + * IOCTL_PMF_POPULATE_DATA - ioctl command to retrieve PMF metrics data
> + *
> + * This ioctl command is used to populate the amd_pmf_ioctl_info structure
> + * with the requested metrics data based on the control_code provided.
> + */
> +#define IOCTL_PMF_POPULATE_DATA		_IOWR(AMD_PMF_IOC_MAGIC, 0x00, struct amd_pmf_ioctl_info)
> +
> +/**
> + * enum pmf_ioctl_id - Control codes for PMF ioctl operations
> + * @IOCTL_POWER_SOURCE: Query current power source (AC/DC)
> + * @IOCTL_POWER_SLIDER_POSITION: Query current power slider position
> + * @IOCTL_PLATFORM_TYPE: Query current platform/form factor type
> + * @IOCTL_LAPTOP_PLACEMENT: Query laptop physical placement state
> + * @IOCTL_LID_STATE: Query laptop lid open/close state
> + * @IOCTL_HETERO_STATE: Query heterogeneous computing state
> + * @IOCTL_SKIN_TEMP: Query skin temperature sensor reading
> + * @IOCTL_USER_PRESENCE: Query user presence detection state
> + * @IOCTL_DISPLAY_NUM: Query number of active displays
> + * @IOCTL_USER_ENGAGED: Query user engagement state
> + * @IOCTL_BIOS_INPUT_1: Query BIOS input parameter 1
> + * @IOCTL_BIOS_INPUT_2: Query BIOS input parameter 2
> + * @IOCTL_BIOS_INPUT_3: Query BIOS input parameter 3
> + * @IOCTL_BIOS_INPUT_4: Query BIOS input parameter 4
> + * @IOCTL_BIOS_INPUT_5: Query BIOS input parameter 5
> + * @IOCTL_BIOS_INPUT_6: Query BIOS input parameter 6
> + * @IOCTL_BIOS_INPUT_7: Query BIOS input parameter 7
> + * @IOCTL_BIOS_INPUT_8: Query BIOS input parameter 8
> + * @IOCTL_BIOS_INPUT_9: Query BIOS input parameter 9
> + * @IOCTL_BIOS_INPUT_10: Query BIOS input parameter 10
> + * @IOCTL_GFX_WORKLOAD: Query current graphics workload type
> + * @IOCTL_AMBIENT_LIGHT: Query ambient light sensor reading
> + * @IOCTL_AVG_C0_RES: Query average C0 residency
> + * @IOCTL_MAX_C0_RES: Query maximum C0 residency
> + * @IOCTL_SOCKET_POWER: Query current socket power consumption
> + * @IOCTL_TA_BIN_VER: Query Trusted Application binary version
> + *
> + * These control codes are used with the IOCTL_PMF_POPULATE_DATA ioctl
> + * to specify which metrics data to retrieve from the AMD PMF driver.
> + */
> +enum pmf_ioctl_id {
> +	IOCTL_POWER_SOURCE,
> +	IOCTL_POWER_SLIDER_POSITION,
> +	IOCTL_PLATFORM_TYPE,
> +	IOCTL_LAPTOP_PLACEMENT,
> +	IOCTL_LID_STATE,
> +	IOCTL_HETERO_STATE,
> +	IOCTL_SKIN_TEMP,
> +	IOCTL_USER_PRESENCE,
> +	IOCTL_DISPLAY_NUM,
> +	IOCTL_USER_ENGAGED,
> +	IOCTL_BIOS_INPUT_1,
> +	IOCTL_BIOS_INPUT_2,
> +	IOCTL_BIOS_INPUT_3,
> +	IOCTL_BIOS_INPUT_4,
> +	IOCTL_BIOS_INPUT_5,
> +	IOCTL_BIOS_INPUT_6,
> +	IOCTL_BIOS_INPUT_7,
> +	IOCTL_BIOS_INPUT_8,
> +	IOCTL_BIOS_INPUT_9,
> +	IOCTL_BIOS_INPUT_10,
> +	IOCTL_GFX_WORKLOAD,
> +	IOCTL_AMBIENT_LIGHT = 29,
> +	IOCTL_AVG_C0_RES = 36,
> +	IOCTL_MAX_C0_RES,
> +	IOCTL_SOCKET_POWER = 50,
> +	IOCTL_TA_BIN_VER
> +};
> +
> +/**
> + * struct amd_pmf_ioctl_info - Structure for PMF ioctl data exchange
> + * @control_code: Input parameter specifying which data to query (enum pmf_ioctl_id)
> + * @feature_supported: Output flag indicating if the queried feature is supported
> + * @feature_version: Output field containing the feature version number
> + * @val: Output field containing the queried value
> + *
> + * This structure is used with the IOCTL_PMF_POPULATE_DATA ioctl command
> + * to exchange data between user space and the AMD PMF kernel driver.
> + * The user provides the control_code to specify the query type, and the
> + * driver populates the remaining fields with the response data.
> + */
> +struct amd_pmf_ioctl_info {
> +	enum pmf_ioctl_id control_code; /* In */
> +	bool feature_supported; /* Out */
> +	unsigned long feature_version; /* Out */
> +	long long val; /* Out */

I somehow seem to now recall that Hans suggested that the interface should 
be a struct which encodes many/all values...

Yes, it seems so. This is what he said:

https://lore.kernel.org/all/6104959e-0214-492d-8ceb-c7376d3b1121@kernel.org/


-- 
 i.

