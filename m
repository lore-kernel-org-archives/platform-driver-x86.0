Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB27261B71
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 18:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706702; cv=none; b=gzdmyM1oyBxDyKwDST6rA+1eegqUCmnQCG2gglM+9J/oR7g3iY/d2v9CiO4+WFAZu+ns063gf1g2KfZaooa60lGCSQlNq0J8ulLiyZrF2jYp2SCOxWE29txkbnOM9sDHh4JmPjn4HMlit/Vyl66DsrVPN+RCfctXZklM/09B3Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706702; c=relaxed/simple;
	bh=vigg+pjwqmq2w+XRbw99MpkmM0aOvOrHoDS1fFS8fPQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gq3ty+9ErZQFEJ2LY0YyjjJU6IEZmpmGw9UeELU5gGHUEysf5AnrGlEYIITSr9etTF+OJ3sXrQGKML6jv/Q9zHC7E8QQxjIF4BPk1t16/hoP8mrBCl8hA7QPBT1siMmxoX0UnTq5dT1V8c6N4cG/qbej3fsMj50/JFBQkCjENx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1W5jzxa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1W5jzxa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783706700; x=1815242700;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vigg+pjwqmq2w+XRbw99MpkmM0aOvOrHoDS1fFS8fPQ=;
  b=I1W5jzxax3JYN8kF9PCGjAmhRwk3INUy5V63xLSgyy7ahhnHtjkFZz0f
   Rkm8ZcnEo4eD/vO3zaLQWKYfcoPWYDH7bnqusQCvKVYOs0+y2tuQq+M/M
   g1XxkZfy7SvRgLjiPpk/BlwhraFOmXMs2dln/pOadAmPBo98ZfOhKmcHu
   o5pl5//OBZ09DyXG5mPXz3xHpMBWbCpnewwnzwiK7kXwu2IDc545sNYna
   kfliviamx9uNVk/Wk83AZ3HLR0fxVlBlac8DEeDmPga8EwSPobQCaIEOV
   Rlv1AWCKrDuGv4EYpFaxbzzOGugNpkecdKLAKtr+aYktkN85FOsS2GKJ9
   g==;
X-CSE-ConnectionGUID: nUK8wv8SRFe2FaVJrF6h3g==
X-CSE-MsgGUID: QmzbLdCYS2Co5YV1AluSCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95783529"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95783529"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 11:04:59 -0700
X-CSE-ConnectionGUID: x3bREGsdTZmXMX/+S4Zx7Q==
X-CSE-MsgGUID: nXOP3ZNeQlWC08cH77/ZvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252311219"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 11:04:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Jul 2026 21:04:54 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH 3/5] platform/x86/amd/pmf: Move metrics code to dedicated
 file
In-Reply-To: <20260710174219.2522269-4-Shyam-sundar.S-k@amd.com>
Message-ID: <cb39c233-d162-b75e-620d-6cfd329f342a@linux.intel.com>
References: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com> <20260710174219.2522269-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 10 Jul 2026, Shyam Sundar S K wrote:

> Refactor metrics related code from core.c into a new metrics.c file
> to improve code organization and maintainability. The metrics
> functionality is evolving with new platform support, warranting a
> separate file.
> 
> No functional changes.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Makefile  |   2 +-
>  drivers/platform/x86/amd/pmf/core.c    | 156 +--------------------
>  drivers/platform/x86/amd/pmf/metrics.c | 179 +++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h     |   3 +
>  4 files changed, 185 insertions(+), 155 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/pmf/metrics.c
> 
> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> index bf7aad80b9e9..8cac51182433 100644
> --- a/drivers/platform/x86/amd/pmf/Makefile
> +++ b/drivers/platform/x86/amd/pmf/Makefile
> @@ -7,6 +7,6 @@
>  obj-$(CONFIG_AMD_PMF)		+= amd-pmf.o
>  amd-pmf-y 			:= core.o acpi.o sps.o \
>  				   auto-mode.o cnqf.o \
> -				   tee-if.o spc.o
> +				   tee-if.o spc.o metrics.o
>  # Build util.c only when AMD_PMF_UTIL_SUPPORT is enabled
>  amd-pmf-$(CONFIG_AMD_PMF_UTIL_SUPPORT) += util.o
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 7c5a1ec3d7fc..c0a21808b867 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -55,7 +55,7 @@
>  #define DELAY_MAX_US	3000
>  
>  /* override Metrics Table sample size time (in ms) */
> -static int metrics_table_loop_ms = 1000;
> +int metrics_table_loop_ms = 1000;
>  module_param(metrics_table_loop_ms, int, 0644);
>  MODULE_PARM_DESC(metrics_table_loop_ms, "Metrics Table sample size time (default = 1000ms)");
>  
> @@ -68,8 +68,6 @@ static bool smart_pc_support = true;
>  module_param(smart_pc_support, bool, 0444);
>  MODULE_PARM_DESC(smart_pc_support, "Smart PC Support (default = true)");
>  
> -static struct device *pmf_device;
> -
>  static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>  {
>  	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
> @@ -138,37 +136,6 @@ int amd_pmf_get_power_source(void)
>  		return POWER_SOURCE_DC;
>  }
>  
> -static void amd_pmf_get_metrics(struct work_struct *work)
> -{
> -	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, work_buffer.work);
> -	ktime_t time_elapsed_ms;
> -	int socket_power;
> -
> -	guard(mutex)(&dev->update_mutex);
> -
> -	/* Transfer table contents */
> -	memset(dev->buf, 0, sizeof(dev->m_table));
> -	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
> -	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
> -
> -	time_elapsed_ms = ktime_to_ms(ktime_get()) - dev->start_time;
> -	/* Calculate the avg SoC power consumption */
> -	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
> -
> -	if (dev->amt_enabled) {
> -		/* Apply the Auto Mode transition */
> -		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
> -	}
> -
> -	if (dev->cnqf_enabled) {
> -		/* Apply the CnQF transition */
> -		amd_pmf_trans_cnqf(dev, socket_power, time_elapsed_ms);
> -	}
> -
> -	dev->start_time = ktime_to_ms(ktime_get());
> -	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
> -}
> -
>  static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
>  {
>  	return ioread32(dev->regbase + reg_offset);
> @@ -297,125 +264,6 @@ static const struct pci_device_id pmf_pci_ids[] = {
>  	{ }
>  };
>  
> -int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
> -{
> -	u64 phys_addr;
> -	u32 hi, low;
> -
> -	/* Get Metrics Table Address */
> -	if (alloc_buffer) {
> -		switch (dev->cpu_id) {
> -		case AMD_CPU_ID_PS:
> -		case AMD_CPU_ID_RMB:
> -			dev->mtable_size = sizeof(dev->m_table);
> -			break;
> -		case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> -		case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -			dev->mtable_size = sizeof(dev->m_table_v2);
> -			break;
> -		default:
> -			dev_err(dev->dev, "Invalid CPU id: 0x%x", dev->cpu_id);
> -		}
> -
> -		dev->buf = devm_kzalloc(dev->dev, dev->mtable_size, GFP_KERNEL);
> -		if (!dev->buf)
> -			return -ENOMEM;
> -	}
> -
> -	phys_addr = virt_to_phys(dev->buf);
> -	hi = phys_addr >> 32;
> -	low = phys_addr & GENMASK(31, 0);
> -
> -	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, SET_CMD, hi, NULL);
> -	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, SET_CMD, low, NULL);
> -
> -	return 0;
> -}
> -
> -int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
> -{
> -	int ret;
> -
> -	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
> -
> -	ret = amd_pmf_set_dram_addr(dev, true);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * Start collecting the metrics data after a small delay
> -	 * or else, we might end up getting stale values from PMFW.
> -	 */
> -	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms * 3));
> -
> -	return 0;
> -}
> -
> -static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
> -{
> -	switch (pdev->cpu_id) {
> -	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> -	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -		return 0;
> -	default:
> -		return -EOPNOTSUPP;
> -	}
> -}
> -
> -static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_metrics *data)
> -{
> -	int ret, i;
> -
> -	guard(mutex)(&dev->metrics_mutex);
> -
> -	ret = is_npu_metrics_supported(dev);
> -	if (ret)
> -		return ret;
> -
> -	ret = amd_pmf_set_dram_addr(dev, true);
> -	if (ret)
> -		return ret;
> -
> -	memset(dev->buf, 0, dev->mtable_size);
> -
> -	/* Send SMU command to get NPU metrics */
> -	ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
> -	if (ret) {
> -		dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n", ret);
> -		return ret;
> -	}
> -
> -	memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
> -
> -	data->npuclk_freq = dev->m_table_v2.npuclk_freq;
> -	for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
> -		data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
> -	data->npu_power = dev->m_table_v2.npu_power;
> -	data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
> -	data->npu_reads = dev->m_table_v2.npu_reads;
> -	data->npu_writes = dev->m_table_v2.npu_writes;
> -
> -	return 0;
> -}
> -
> -int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
> -{
> -	struct amd_pmf_dev *pdev;
> -
> -	if (!info)
> -		return -EINVAL;
> -
> -	if (!pmf_device)
> -		return -ENODEV;
> -
> -	pdev = dev_get_drvdata(pmf_device);
> -	if (!pdev)
> -		return -ENODEV;
> -
> -	return amd_pmf_get_smu_metrics(pdev, info);
> -}
> -EXPORT_SYMBOL_NS_GPL(amd_pmf_get_npu_data, "AMD_PMF");
> -
>  static int amd_pmf_reinit_ta(struct amd_pmf_dev *pdev)
>  {
>  	bool status;
> @@ -678,7 +526,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
>  		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
>  
> -	pmf_device = dev->dev;
> +	amd_pmf_set_device(dev->dev);
>  
>  	err = amd_pmf_cdev_register(dev);
>  	if (err)
> diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
> new file mode 100644
> index 000000000000..bb4f9127c655
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/metrics.c
> @@ -0,0 +1,179 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AMD Platform Management Framework Driver - Metrics Support
> + *
> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *	    Patil Rajesh Reddy <Patil.Reddy@amd.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/device/devres.h>
> +#include <linux/io.h>
> +#include <linux/ktime.h>
> +#include <linux/string.h>
> +#include <linux/workqueue.h>
> +
> +#include "pmf.h"
> +
> +static struct device *pmf_device;
> +
> +static void amd_pmf_get_metrics(struct work_struct *work)
> +{
> +	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, work_buffer.work);
> +	ktime_t time_elapsed_ms;
> +	int socket_power;
> +
> +	guard(mutex)(&dev->update_mutex);
> +
> +	/* Transfer table contents */
> +	memset(dev->buf, 0, sizeof(dev->m_table));
> +	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
> +	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
> +
> +	time_elapsed_ms = ktime_to_ms(ktime_get()) - dev->start_time;
> +	/* Calculate the avg SoC power consumption */
> +	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
> +
> +	if (dev->amt_enabled) {
> +		/* Apply the Auto Mode transition */
> +		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
> +	}
> +
> +	if (dev->cnqf_enabled) {
> +		/* Apply the CnQF transition */
> +		amd_pmf_trans_cnqf(dev, socket_power, time_elapsed_ms);
> +	}
> +
> +	dev->start_time = ktime_to_ms(ktime_get());
> +	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
> +}
> +
> +int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
> +{
> +	u64 phys_addr;
> +	u32 hi, low;
> +
> +	/* Get Metrics Table Address */
> +	if (alloc_buffer) {
> +		switch (dev->cpu_id) {
> +		case AMD_CPU_ID_PS:
> +		case AMD_CPU_ID_RMB:
> +			dev->mtable_size = sizeof(dev->m_table);
> +			break;
> +		case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +		case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +			dev->mtable_size = sizeof(dev->m_table_v2);
> +			break;
> +		default:
> +			dev_err(dev->dev, "Invalid CPU id: 0x%x", dev->cpu_id);
> +		}
> +
> +		dev->buf = devm_kzalloc(dev->dev, dev->mtable_size, GFP_KERNEL);
> +		if (!dev->buf)
> +			return -ENOMEM;
> +	}
> +
> +	phys_addr = virt_to_phys(dev->buf);
> +	hi = phys_addr >> 32;
> +	low = phys_addr & GENMASK(31, 0);

upper/lower_32_bits(). Don't forget to add the header.

> +
> +	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, SET_CMD, hi, NULL);
> +	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, SET_CMD, low, NULL);
> +
> +	return 0;
> +}
> +
> +int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
> +{
> +	int ret;
> +
> +	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
> +
> +	ret = amd_pmf_set_dram_addr(dev, true);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Start collecting the metrics data after a small delay
> +	 * or else, we might end up getting stale values from PMFW.
> +	 */
> +	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms * 3));
> +
> +	return 0;
> +}
> +
> +void amd_pmf_set_device(struct device *p_device)
> +{
> +	pmf_device = p_device;
> +}
> +
> +static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
> +{
> +	switch (pdev->cpu_id) {
> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_metrics *data)
> +{
> +	int ret, i;
> +
> +	guard(mutex)(&dev->metrics_mutex);
> +
> +	ret = is_npu_metrics_supported(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = amd_pmf_set_dram_addr(dev, true);
> +	if (ret)
> +		return ret;
> +
> +	memset(dev->buf, 0, dev->mtable_size);
> +
> +	/* Send SMU command to get NPU metrics */
> +	ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
> +	if (ret) {
> +		dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n", ret);
> +		return ret;
> +	}
> +
> +	memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
> +
> +	data->npuclk_freq = dev->m_table_v2.npuclk_freq;
> +	for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)

Typically developers always forget these, ARRAY_SIZE() and dev_*() 
printing need headers.

Check also types.h. I had 4th one in my mind but seem to have forgotten it 
while typing...

> +		data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
> +	data->npu_power = dev->m_table_v2.npu_power;
> +	data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
> +	data->npu_reads = dev->m_table_v2.npu_reads;
> +	data->npu_writes = dev->m_table_v2.npu_writes;
> +
> +	return 0;
> +}
> +
> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
> +{
> +	struct amd_pmf_dev *pdev;
> +
> +	if (!info)
> +		return -EINVAL;
> +
> +	if (!pmf_device)
> +		return -ENODEV;
> +
> +	pdev = dev_get_drvdata(pmf_device);
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	return amd_pmf_get_smu_metrics(pdev, info);
> +}
> +EXPORT_SYMBOL_NS_GPL(amd_pmf_get_npu_data, "AMD_PMF");
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 088edfab08f0..4873685c84ad 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -137,6 +137,8 @@ struct cookie_header {
>  #define METRICS_TABLE_ID	7
>  #define BIOS_OUTPUT_MAX		10
>  
> +extern int metrics_table_loop_ms;
> +
>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
>  
>  static const uuid_t amd_pmf_ta_uuid[] __used = { UUID_INIT(0xd9b39bf2, 0x66bd, 0x4154, 0xaf, 0xb8,
> @@ -864,6 +866,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer);
>  int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
>  u32 fixp_q88_fromint(u32 val);
>  int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev);
> +void amd_pmf_set_device(struct device *p_device);
>  
>  /* SPS Layer */
>  int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
> 

-- 
 i.

