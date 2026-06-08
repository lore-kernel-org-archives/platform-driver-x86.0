Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EAD1419A4
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 09:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911364; cv=none; b=ByBzRPNnRH4+aDQuHBLHYNzhXyZypujwG4sFOSejL7uzmZNbOw+TeHTYEfBDOYG8lx78SWfhJLWzabsi3FaSotKA42Eqd4m/Xbzy+bwC8tbRqmZVQ1JRZxYXBVZx/8Q/+pfNeDh9UBnxhaxKikBEQSFYVMWPz9Q2IljgeauEz6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911364; c=relaxed/simple;
	bh=IJoXPp5/clI1HPMmnvcxAVLX2Cwnixp857stfRKXuYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8UPrzVzBTq9EtLobOzktbngX0s6oNEEtZPNiCdIm2GjMnflV2tuoBW6wEuTDlGGO/eMbRMWcYMD9U81xsIAPF0L5U6w8QVLWX3noVu3nXgGhNo5b/XEr5crNuYlpGQgaQ0oPuxj+0MBX0Wd62/pppNW8QUutSJEeDgfWLhC43A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZT1Q6fUG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZT1Q6fUG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E711F00893;
	Mon,  8 Jun 2026 09:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780911362;
	bh=XiZGK89RTmF1QPHAPF0nQmFGIMM1FZeOcNpSoXuf2VE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZT1Q6fUGFMDdDjXYsMkItOn12xwyLuh73uG9JhNf/OlOROpT+vKkEN7O/+ZUpkWS9
	 fS0pMDqzB4BXwYjCD9bDV3cdvzi0OeTpcuf/DCDzt5i0E48TyY6nC7XMX2Y+htvCJg
	 SqHreuUc304oYIjBugZHGm4wGnK9wGywbJEvxCVT+RBWFK+aTg7/vEyNNKBLCEZSjB
	 jGTRDqHZBNoue8TQQSu1YyPJdRsPDaj4fBGRNs/AHkQ5nqadMqZD0fBxyNO0Z2Rgfc
	 +XPK5+ZvXMVRwpVhLW3//1/OSL2abbWPWbPLjADH30Z9MXjr58KwLtjRFqcT3ZHT+L
	 YGyEvDbzPVw3w==
Message-ID: <3eb979e5-02ea-4af0-beb6-2b0fc7ae9eef@kernel.org>
Date: Mon, 8 Jun 2026 11:36:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] platform/x86/amd/pmf: Add util layer and userspace
 character device interface
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
 Sanket.Goswami@amd.com
References: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
 <20260527140205.4073335-2-Shyam-sundar.S-k@amd.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260527140205.4073335-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 27-May-26 4:01 PM, Shyam Sundar S K wrote:
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
>  drivers/platform/x86/amd/pmf/Kconfig  | 10 ++++
>  drivers/platform/x86/amd/pmf/Makefile |  2 +
>  drivers/platform/x86/amd/pmf/core.c   |  5 ++
>  drivers/platform/x86/amd/pmf/pmf.h    |  9 ++++
>  drivers/platform/x86/amd/pmf/util.c   | 68 +++++++++++++++++++++++++++
>  include/uapi/linux/amd-pmf.h          | 60 +++++++++++++++++++++++
>  6 files changed, 154 insertions(+)
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
> index b9e5a2cf3aae..58d86b4c2828 100644
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
> @@ -643,6 +647,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
>  {
>  	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
>  
> +	amd_pmf_cdev_unregister();
>  	amd_pmf_deinit_features(dev);
>  	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
>  		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_UNLOAD);
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
> index 000000000000..f8a283192ffe
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/util.c
> @@ -0,0 +1,68 @@
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
> +static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> +{
> +	return -ENOTTY;
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
> +	if (pmf_dev_handle)
> +		misc_deregister(&amd_pmf_util_if);
> +	pmf_dev_handle = NULL;
> +}
> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
> new file mode 100644
> index 000000000000..c7099e7f463f
> --- /dev/null
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -0,0 +1,60 @@
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

Since the IOCTL is designed to allow extending the struct I would not code the size
into the IOCTL cmd value. I'm not sure if there is a macro without the size argument,
otherwise just pass __u64 for the size if the size-member which is effectively
the min size?

Regards,

Hans




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
> +};
> +
> +#endif /* _UAPI_LINUX_AMD_PMF_H */

