Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8A93D8911
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444607; cv=none; b=eZ3YN1AfxNDLSV1SfNnGgZZYxINiRf9OhZXMhSAVo1Cv4HYmiTx3YmMDr/aQ+vYxFVwlQ+ZAim8wtADEbVAgGykxt36JgSq1YYIjaS2/RQ786vd0iv54m3DJpnULdLz8dXzcd3c2gQNuTj00zCu/dSgkqojhEzj8lANUofo6eg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444607; c=relaxed/simple;
	bh=DKoi8m+mI/I3HBD7mcYD3PFChaVArh+L9oy6ljus9nY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iCM+w0vcAG6EzWxNyvq3a040/p0SkRAYWQNVxgepNo2gb4L+9GRTBa03INz23guVhz6aoV1g+0IWghX2dOYPqZ1aJ8Yqn2tSe2vFlgoQhMnWImNMMbMb1ZQWiYxsPLb58JahkEpV0msOW27eiM/VqVLLoCbUbDj1WyseotRa8A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DG1elwJq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DG1elwJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774444605; x=1805980605;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DKoi8m+mI/I3HBD7mcYD3PFChaVArh+L9oy6ljus9nY=;
  b=DG1elwJqm3plm72+DvLxMQDoU+ptBOJCHNtIPVZX9yh3ide8Ifxv7PQM
   Ia3krxhHaCNJE5Ao6rQhMcUJnxkZt6HF1Uf85gRNvHNfeWebEpfQft8kE
   ily8Th5bxwgw9Ilj9zlt6HSPu5A+Iqd2yvIC1VJwuMTsKKVKacuA+m9qB
   dCkl6IIK5SRbOW5phex0L7hArnG3/QQaiC7jCJ3zwZ21gvpySDfDQ6D9I
   nsrp3yMrzOKYuO4lxaYv5hhouaaVIRZylQFvlVzy55dw2mX0BS0JQSZoJ
   +3BZyYSD1LEfXJ+JWq00lQYLEOpZG6EWq1mVhKModLB1lNWRBr8EWoqFS
   g==;
X-CSE-ConnectionGUID: /4zOPOJnTLuOshtlgn+DQg==
X-CSE-MsgGUID: fvpCVC2tQbeHEq/x+nkI5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="98100251"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="98100251"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:16:45 -0700
X-CSE-ConnectionGUID: Xk3NPu07SOyCva6VgKouEQ==
X-CSE-MsgGUID: uHM0NgZuS6i/SUyzPQuYYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="218102377"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:16:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Mar 2026 15:16:39 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v3 1/7] platform/x86/amd/pmf: Add util layer and userspace
 misc device interface
In-Reply-To: <20260301131124.1370565-2-Shyam-sundar.S-k@amd.com>
Message-ID: <7337d904-4a3f-5b8d-ef25-7759ad8461e1@linux.intel.com>
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

Nit, I don't know why these are aligned so oddly.

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

= {}; is enough to do default initialization.

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

[...snip...]

> +#else
> +int amd_pmf_cdev_register(struct amd_pmf_dev *dev) { return 0; }
> +void amd_pmf_cdev_unregister(void) {}

You don't build this file without UTIL_SUPPORT so these are dead code.

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
> +};
> +
> +#endif /* _UAPI_LINUX_AMD_PMF_H */
> 

-- 
 i.

