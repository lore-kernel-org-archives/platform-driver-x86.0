Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC664B8DF8
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 10:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186459; cv=none; b=S9Iu+Si3hSH0pKFdgo/9EIA3Ja2cSGVv2K2cbrswNHo3mH7DmPBCSwxXdtbuesL6p5kv1ms7WNIESRf1G5o7fKZooJfTkQiyZyfhmb1vqmjMxaT8dJU+jeiAelinmhg3x9+5VTrdo+cytG+rUJ1Sfzpk6LxslVuGMZW4kWOIgTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186459; c=relaxed/simple;
	bh=EjwFPjpdG9/rS57YDsEbFK39z5HLYS/Kb0C4CA3dnfs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kfb9TuDyvkK/2k64/1T68RLFSnHPMh/RPWYhjFB30/xU80G5BeSSW1n7ICBrPsP31IGcrtADQS4Bb8I/8IXVhhgJVI/N8G6ztJbxQRxMrwX8OznnCUsVfYtBA2RwfzGguTu2XnCgtJwOe6DTVihsegT0mYeTcCqX+avNjuApGq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G48q7hd5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G48q7hd5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779186458; x=1810722458;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EjwFPjpdG9/rS57YDsEbFK39z5HLYS/Kb0C4CA3dnfs=;
  b=G48q7hd5f3kXAeTj6A8pt7lk5w/FwyY+6UsgS8WLVRRgEbXiwcFZjxIt
   TShJEa56R9GXTV4uOvfHBvvuCxx2K/+CtmuB0/ArID0eBz2G2c5xSSU4U
   AGSCKv/IDEOOnFKdS8Xpi/BFK08zVQLp+gEgefYvJ4i3qiI4AdKr9M/Do
   prajLkFljemYgXdQtB0zOjqysDMHFNN99Hh8DQfS5KhbOCkPc62x8kbdC
   Bf/NvcfwVROpLtyWkZqxqFHSNxcf392h1gzB7qsdcOn+aWiM6RieaWTrh
   Ix5lPZ5GE4sFMOiqKNSVuI5S3+4avCohjpWQ/b0bVWgt1PRv/ECUiS2rY
   w==;
X-CSE-ConnectionGUID: 0iKCrzITTqqKHXXvm3eg/Q==
X-CSE-MsgGUID: O1a+T2HjQq6Sn+2XMFCjhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90755380"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="90755380"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:27:37 -0700
X-CSE-ConnectionGUID: SzCeAjHjTk+GdUp8PTPGHQ==
X-CSE-MsgGUID: q/1AWTXnSVm5S8zL51CG4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239974666"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:27:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 May 2026 13:27:31 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v4 1/7] platform/x86/amd/pmf: Add util layer and userspace
 character device interface
In-Reply-To: <20260507144524.664001-2-Shyam-sundar.S-k@amd.com>
Message-ID: <45b5440a-705e-c755-c805-24a907016ba3@linux.intel.com>
References: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com> <20260507144524.664001-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 May 2026, Shyam Sundar S K wrote:

> Add a util layer to AMD PMF that exposes a minimal userspace interface
> via a character device for metrics monitoring and feature discovery.
> 
> This creates /dev/amdpmf_interface with basic ioctl support to retrieve
> PMF metrics such as:
> *  Power source and power slider position
> *  Platform type, lid state, and user presence
> *  Skin temperature and ambient light
> *  BIOS input parameters (1-10)
> *  Graphics workload metrics
> *  CPU C-state residency (average and maximum)
> *  Socket power consumption
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
>  drivers/platform/x86/amd/pmf/util.c   | 139 ++++++++++++++++++++++++++
>  include/uapi/linux/amd-pmf.h          |  63 ++++++++++++
>  6 files changed, 228 insertions(+)
>  create mode 100644 drivers/platform/x86/amd/pmf/util.c
>  create mode 100644 include/uapi/linux/amd-pmf.h
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index 25b8f7ae3abd..ad4faf18de47 100644
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
> +	  Enabling this option provides a character device for userspace to capture
> +	  PMF features (Smart PC Builder, Auto Mode, Static Power Slider, Dynamic
> +	  Power Slider AC/DC) along with PMF metrics from the AMD PMF driver.
> +
> +	  Say Y here to enable it and Say N here if you are not sure.
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
> index 000000000000..6682aadfea2c
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/util.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AMD Platform Management Framework Util Layer
> + *
> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *	    Sanket Goswami <Sanket.Goswami@amd.com>
> + */
> +
> +#include <linux/amd-pmf.h>
> +#include <linux/miscdevice.h>
> +#include <linux/mutex.h>
> +#include <linux/uaccess.h>
> +
> +#include "pmf.h"
> +
> +static struct amd_pmf_dev *pmf_dev_handle;
> +static DEFINE_MUTEX(pmf_util_lock);
> +
> +static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *info)
> +{
> +	struct ta_pmf_shared_memory *ta_sm = NULL;
> +	struct ta_pmf_enact_table *in = NULL;
> +	int idx;
> +
> +	if (!pdev || !info)
> +		return -EINVAL;
> +
> +	ta_sm = pdev->shbuf;
> +	in = &ta_sm->pmf_input.enact_table;
> +
> +	/* Set size and version */
> +	info->size = sizeof(struct amd_pmf_info);
> +
> +	/* Device States */
> +	info->platform_type = in->ev_info.platform_type;
> +	info->laptop_placement = in->ev_info.device_state;
> +	info->lid_state = in->ev_info.lid_state;
> +	info->user_presence = in->ev_info.user_present;
> +	info->slider_position = in->ev_info.power_slider;
> +
> +	/* Thermal and Power Metrics */
> +	info->power_source = in->ev_info.power_source;
> +	info->skin_temp = in->ev_info.skin_temperature;
> +	info->gfx_busy = in->ev_info.gfx_busy;
> +	info->ambient_light = in->ev_info.ambient_light;
> +	info->avg_c0_residency = in->ev_info.avg_c0residency;
> +	info->max_c0_residency = in->ev_info.max_c0residency;
> +	info->socket_power = in->ev_info.socket_power;
> +
> +	/* Custom BIOS input parameters */
> +	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++) {
> +		if (idx < 2)
> +			info->bios_input[idx] = in->ev_info.bios_input_1[idx];
> +		else
> +			info->bios_input[idx] = in->ev_info.bios_input_2[idx - 2];
> +	}
> +
> +	return 0;
> +}
> +
> +static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> +{
> +	struct amd_pmf_dev *pdev = filp->private_data;
> +	void __user *argp = (void __user *)arg;
> +	struct amd_pmf_info info = {};
> +	size_t copy_size;
> +	__u64 user_size;
> +	int ret;
> +
> +	if (cmd != IOCTL_AMD_PMF_POPULATE_DATA)
> +		return -ENOTTY;
> +
> +	/* First read just the size field from userspace */
> +	if (copy_from_user(&user_size, argp, sizeof(user_size)))
> +		return -EFAULT;
> +
> +	if (user_size < sizeof(__u64))
> +		return -EINVAL;

I wonder if besides the size check, there should be some alignment check 
for the user_size (e.g. at least 32-bit aligned?) as well so one doesn't 
end up copying odd bytes at the tail.

> +
> +	guard(mutex)(&pmf_util_lock);
> +	ret = amd_pmf_populate_data(pdev, &info);
> +	if (ret)
> +		return ret;
> +
> +	copy_size = min_t(size_t, user_size, sizeof(struct amd_pmf_info));
> +
> +	/* Set actual size being copied */
> +	info.size = copy_size;
> +
> +	if (copy_to_user(argp, &info, copy_size))
> +		return -EFAULT;
> +
> +	return 0;
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
> +	misc_deregister(&amd_pmf_util_if);
> +	pmf_dev_handle = NULL;
> +}
> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
> new file mode 100644
> index 000000000000..fa6aeea38c22
> --- /dev/null
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -0,0 +1,63 @@
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
> + * IOCTL_AMD_PMF_POPULATE_DATA - ioctl command to retrieve PMF metrics data
> + *
> + * This ioctl command is used to populate the amd_pmf_info structure
> + * with the requested PMF metrics information.
> + */
> +#define IOCTL_AMD_PMF_POPULATE_DATA		_IOWR(AMD_PMF_IOC_MAGIC, 0x00, struct amd_pmf_info)
> +
> +#define AMD_PMF_BIOS_PARAMS_MAX		10
> +
> +struct amd_pmf_info {
> +	__u64 size;
> +
> +	/* Power and state info */
> +	__u32 platform_type;
> +	__u32 power_source;
> +	__u32 laptop_placement;
> +	__u32 lid_state;
> +	__u32 user_presence;
> +	__u32 slider_position;
> +
> +	/* Thermal and power metrics */
> +	__s32 skin_temp;
> +	__u32 gfx_busy;
> +	__s32 ambient_light;
> +	__u32 avg_c0_residency;
> +	__u32 max_c0_residency;
> +	__u32 socket_power;
> +
> +	/* BIOS parameters */
> +	__u32 bios_input[AMD_PMF_BIOS_PARAMS_MAX];
> +
> +	/* Reserved for future expansion */
> +	__u32 rsvd[8];
> +};

This looks much better, thanks.

But now I'm left to wonder if rsvd is useful since userspace and kernel 
negotiate the length?

I'd also prefer you add the actual ioctl func after adding all what's in 
this series.

> +
> +#endif /* _UAPI_LINUX_AMD_PMF_H */
> 

-- 
 i.

