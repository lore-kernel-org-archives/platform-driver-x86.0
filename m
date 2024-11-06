Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1785552F9B
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Nov 2024 13:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730900887; cv=none; b=B8KhoFkXwkYyrnI+AqB9VzmYUDwF4bjIZtu/HpG9FA9sTU43+94oQTpwn8ma0bJmV7X21nWbHhZ61fv3t8KQ+S6UnxHRn/Jn9dzJsw/vRm+3FYyyYAPcbIhIw4W58yfUYqN+IbqJRNudO+VxSi4DlD5T/n2rSpnXixlXQk+jGqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730900887; c=relaxed/simple;
	bh=8hC1VcXTK34/nQlWih25LUZrrjNng7MEHJsmY9jnxmo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UvuA1T9GpCOELQ7XWlDa0BA+3VqXViHZSsxbAg+80JYH1QD1h4GuEqyN5IZOxIi4CSyDyNd0BgXUbZFYQIz6NuUJcoyTdBH8cYJtKh0mM0gzF9+hC8LsABD0RczTc4qOobHpMQz0axZKA+jpvzuUKc9/tEkJzXjfsLKOGxroXAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G8N9qgRo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G8N9qgRo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730900886; x=1762436886;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8hC1VcXTK34/nQlWih25LUZrrjNng7MEHJsmY9jnxmo=;
  b=G8N9qgRouHgJdtLzLJLREASp1AmPKe/N3+AVfOA29pDP6ut8Zd7AnhMe
   DWwxA8i7Rev/0JGp7AHbL92DPzHfnNqzHFXVvndZgIP9CaS3fRFB/Hbz9
   b4jgrlC0oOMntyIaMD1smo1Usv2n8jtu2f9305BIqd8+h+Q6WbuX7DfM1
   D+WRmL0aVRWSuxacmIHQCBW+AoW39NhScis0OmL85b71x6RS6qoiIa6Z1
   b1HINn4K0rWvdMBkla41bPIjfh+fK6gSx2cXT7eDYyKNCWxggeWwzF0HK
   Cs+I5z7nQbfvcyItgRKHEh0766QxMWlQS8VZ6q7KihQE+nygp5xMN4qKu
   A==;
X-CSE-ConnectionGUID: 33+5F77cRDG2m3PenBXRMg==
X-CSE-MsgGUID: SCH13B5aT0qRtOwxHuVRRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34397933"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34397933"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:48:05 -0800
X-CSE-ConnectionGUID: 7PqhA8mdSn61ZV64BoQOFQ==
X-CSE-MsgGUID: 15Fe6nHcSW2DabkO896eDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="122070529"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:47:37 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 Nov 2024 15:47:34 +0200 (EET)
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    perry.yuan@amd.com, mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com, 
    W_Armin@gmx.de
Subject: Re: [PATCH v4 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D
 V-Cache optimizer driver
In-Reply-To: <20241106112821.1012452-2-Basavaraj.Natikar@amd.com>
Message-ID: <cec45a38-3e30-3a57-ab2c-a6baef484a7a@linux.intel.com>
References: <20241106112821.1012452-1-Basavaraj.Natikar@amd.com> <20241106112821.1012452-2-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Nov 2024, Basavaraj Natikar wrote:

> AMD X3D processors, also known as AMD 3D V-Cache, feature dual Core
> Complex Dies (CCDs) and enlarged L3 cache, enabling dynamic mode
> switching between Frequency and Cache modes. To optimize performance,
> implement the AMD 3D V-Cache Optimizer, which allows selecting either:
> 
> Frequency mode: cores within the faster CCD are prioritized before
> those in the slower CCD.
> 
> Cache mode: cores within the larger L3 CCD are prioritized before
> those in the smaller L3 CCD.
> 
> Co-developed-by: Perry Yuan <perry.yuan@amd.com>
> Signed-off-by: Perry Yuan <perry.yuan@amd.com>
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  MAINTAINERS                           |   7 ++
>  drivers/platform/x86/amd/Kconfig      |  12 ++
>  drivers/platform/x86/amd/Makefile     |   2 +
>  drivers/platform/x86/amd/x3d_vcache.c | 170 ++++++++++++++++++++++++++
>  4 files changed, 191 insertions(+)
>  create mode 100644 drivers/platform/x86/amd/x3d_vcache.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 91d0609db61b..60155effead9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -965,6 +965,13 @@ Q:	https://patchwork.kernel.org/project/linux-rdma/list/
>  F:	drivers/infiniband/hw/efa/
>  F:	include/uapi/rdma/efa-abi.h
>  
> +AMD 3D V-CACHE PERFORMANCE OPTIMIZER DRIVER
> +M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> +R:	Mario Limonciello <mario.limonciello@amd.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Supported
> +F:	drivers/platform/x86/amd/x3d_vcache.c
> +
>  AMD ADDRESS TRANSLATION LIBRARY (ATL)
>  M:	Yazen Ghannam <Yazen.Ghannam@amd.com>
>  L:	linux-edac@vger.kernel.org
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index f88682d36447..d73f691020d0 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -6,6 +6,18 @@
>  source "drivers/platform/x86/amd/pmf/Kconfig"
>  source "drivers/platform/x86/amd/pmc/Kconfig"
>  
> +config AMD_3D_VCACHE
> +	tristate "AMD 3D V-Cache Performance Optimizer Driver"
> +	depends on X86_64 && ACPI
> +	help
> +	  The driver provides a sysfs interface, enabling the setting of a bias
> +	  that alters CPU core reordering. This bias prefers cores with higher
> +	  frequencies or larger L3 caches on processors supporting AMD 3D V-Cache
> +	  technology.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd_3d_vcache.
> +
>  config AMD_HSMP
>  	tristate "AMD HSMP Driver"
>  	depends on AMD_NB && X86_64 && ACPI
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> index dcec0a46f8af..16e4cce02242 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -4,6 +4,8 @@
>  # AMD x86 Platform-Specific Drivers
>  #
>  
> +obj-$(CONFIG_AMD_3D_VCACHE)     += amd_3d_vcache.o
> +amd_3d_vcache-objs              := x3d_vcache.o
>  obj-$(CONFIG_AMD_PMC)		+= pmc/
>  amd_hsmp-y			:= hsmp.o
>  obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
> diff --git a/drivers/platform/x86/amd/x3d_vcache.c b/drivers/platform/x86/amd/x3d_vcache.c
> new file mode 100644
> index 000000000000..4a72ffe75cce
> --- /dev/null
> +++ b/drivers/platform/x86/amd/x3d_vcache.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AMD 3D V-Cache Performance Optimizer Driver
> + *
> + * Copyright (c) 2024, Advanced Micro Devices, Inc.
> + * All Rights Reserved.

Are you sure you need the "All Rights Reserved." part? While I'm not a 
lawyer, GPL only reserves some rights AFAICT.

> + *
> + * Authors: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> + *          Perry Yuan <perry.yuan@amd.com>
> + *          Mario Limonciello <mario.limonciello@amd.com>
> + *

Extra line.

> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +static char *x3d_mode = "frequency";
> +module_param(x3d_mode, charp, 0);
> +MODULE_PARM_DESC(x3d_mode, "Initial 3D-VCache mode; 'frequency' (default) or 'cache'");
> +
> +#define DSM_REVISION_ID			0
> +#define DSM_SET_X3D_MODE		1
> +
> +static guid_t x3d_guid = GUID_INIT(0xdff8e55f, 0xbcfd, 0x46fb, 0xba, 0x0a,
> +				   0xef, 0xd0, 0x45, 0x0f, 0x34, 0xee);

Missing include.

> +enum amd_x3d_mode_type {
> +	MODE_INDEX_FREQ,
> +	MODE_INDEX_CACHE,
> +};
> +
> +static const char * const amd_x3d_mode_strings[] = {
> +	[MODE_INDEX_FREQ] = "frequency",
> +	[MODE_INDEX_CACHE] = "cache",
> +};
> +
> +struct amd_x3d_dev {
> +	struct device *dev;
> +	acpi_handle ahandle;
> +	/* To protect x3d mode setting */
> +	struct mutex lock;
> +	enum amd_x3d_mode_type curr_mode;
> +};
> +
> +static int amd_x3d_get_mode(struct amd_x3d_dev *data)
> +{
> +	guard(mutex)(&data->lock);
> +
> +	return data->curr_mode;

Are you aware that the mutex doesn't really do much here, as soon as it's 
released, the value can change again?

> +}
> +
> +static int amd_x3d_mode_switch(struct amd_x3d_dev *data, int new_state)
> +{
> +	union acpi_object *out, argv;
> +
> +	guard(mutex)(&data->lock);
> +	argv.type = ACPI_TYPE_INTEGER;
> +	argv.integer.value = new_state;
> +
> +	out = acpi_evaluate_dsm(data->ahandle, &x3d_guid, DSM_REVISION_ID, DSM_SET_X3D_MODE,
> +				&argv);

Since you need to split the line anyway, I'd move the second DSM to the 
second line.

> +	if (!out) {
> +		dev_err(data->dev, "failed to evaluate _DSM\n");
> +		return -EINVAL;
> +	}
> +
> +	data->curr_mode = new_state;
> +
> +	kfree(out);
> +
> +	return 0;
> +}
> +
> +static ssize_t amd_x3d_mode_store(struct device *dev, struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct amd_x3d_dev *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = sysfs_match_string(amd_x3d_mode_strings, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = amd_x3d_mode_switch(data, ret);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t amd_x3d_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct amd_x3d_dev *data = dev_get_drvdata(dev);
> +	int mode = amd_x3d_get_mode(data);
> +
> +	return sysfs_emit(buf, "%s\n", amd_x3d_mode_strings[mode]);
> +}
> +static DEVICE_ATTR_RW(amd_x3d_mode);
> +
> +static struct attribute *amd_x3d_attrs[] = {
> +	&dev_attr_amd_x3d_mode.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(amd_x3d);

Add #include.

> +
> +static int amd_x3d_resume_handler(struct device *dev)
> +{
> +	struct amd_x3d_dev *data = dev_get_drvdata(dev);
> +	int ret = amd_x3d_get_mode(data);
> +
> +	return amd_x3d_mode_switch(data, ret);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(amd_x3d_pm, NULL, amd_x3d_resume_handler);

Add include.

> +
> +static const struct acpi_device_id amd_x3d_acpi_ids[] = {
> +	{"AMDI0101"},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, amd_x3d_acpi_ids);
> +
> +static int amd_x3d_probe(struct platform_device *pdev)
> +{
> +	struct amd_x3d_dev *data;
> +	acpi_handle handle;
> +	int ret;
> +
> +	handle = ACPI_HANDLE(&pdev->dev);
> +	if (!handle)
> +		return -ENODEV;
> +
> +	if (!acpi_check_dsm(handle, &x3d_guid, DSM_REVISION_ID, BIT(DSM_SET_X3D_MODE)))
> +		return -ENODEV;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->dev = &pdev->dev;
> +	data->ahandle = handle;
> +	platform_set_drvdata(pdev, data);
> +
> +	ret = match_string(amd_x3d_mode_strings, ARRAY_SIZE(amd_x3d_mode_strings), x3d_mode);

Add include for ARRAY_SIZE()

> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "invalid mode %s\n", x3d_mode);
> +
> +	devm_mutex_init(data->dev, &data->lock);
> +
> +	return amd_x3d_mode_switch(data, ret);
> +}
> +
> +static struct platform_driver amd_3d_vcache_driver = {
> +	.driver = {
> +		.name = "amd_x3d_vcache",
> +		.dev_groups = amd_x3d_groups,
> +		.acpi_match_table = amd_x3d_acpi_ids,
> +		.pm = pm_sleep_ptr(&amd_x3d_pm),
> +	},
> +	.probe = amd_x3d_probe,
> +};
> +module_platform_driver(amd_3d_vcache_driver);
> +
> +MODULE_DESCRIPTION("AMD 3D V-Cache Performance Optimizer Driver");
> +MODULE_LICENSE("GPL");
> 

-- 
 i.

