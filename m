Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D67037DE84
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 19:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710650; cv=none; b=owIPexHQIgDP/QZpkkoPLmL8dgEkcpL6pFpWsd+NiMYRus6ea+t4aiVwMYd0Kai0X2TbLleAV50j4B9PTDqseIFSw6YUozP+vQWSz43/ncgxurPK5FSr8OlpLdVLceshC1hvaMWzpzQ7gB3XgfeEwIaWkes6RCUKeGXfMqxxlzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710650; c=relaxed/simple;
	bh=DWhX0KavzgcUwCXvW6FGDt6JuL3jbdkFxxseQa7BZRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ruDJJY6NmfKJ4JTkhh/zP1u7kRKGh8cJxlacRdGw7m4vwH4kQXLYFPrRVp2Y3YSxcADJbsfYN+V6II6eZs6/2fyDb7LCSTWcB0kG5fxOJouzcQKZcDuW2WMbDd4nwhr9sDkLR96sq0BFHKUf2sbelWrpE7WhhTFcUpojH0ojX1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyuuRoYm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyuuRoYm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335D81F000E9;
	Fri, 10 Jul 2026 19:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783710648;
	bh=ms97fwFdD3J4fCbAnK10Wn7m4ff0/9uQktHDS14uDEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VyuuRoYmguvMMuiXRKTqjxo5hXFSMtMjmzqO2QP54XRr2e10Buo5U2zBMEOt06vJv
	 SsEUDmTzJYpjnh0/ulEtgCQu2ioXVFxeZIQjm+4QV54tsAiLR2dYwheEJhWuGWLzZX
	 jJlyVXFNT3zxIXH8rUauyINGMd+Kb13dz2u1KgitBLLvAYFDk8jeVzy8a+YHrcXcVi
	 tBOcS/zS3kEoafbekWpFk7csIs/nOKYDCgYKMkgJ2/BlYoSkjWQ2x30G3Tzxj4qxsa
	 Xv80iLl5y1X+5UYGnA/vnytOHNbdjspBU4KKBesXK0vHXe2SWLlwjRjzCQjm1AjtQt
	 Gp5vlW4zHgZJw==
Message-ID: <ae796911-58bb-4ebb-994d-d6d338392f5d@kernel.org>
Date: Fri, 10 Jul 2026 14:10:47 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] platform/x86/amd/pmf: Move metrics code to dedicated
 file
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
 <20260710174219.2522269-4-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260710174219.2522269-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/10/26 12:42, Shyam Sundar S K wrote:
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
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/platform/x86/amd/pmf/Makefile  |   2 +-
>   drivers/platform/x86/amd/pmf/core.c    | 156 +--------------------
>   drivers/platform/x86/amd/pmf/metrics.c | 179 +++++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/pmf.h     |   3 +
>   4 files changed, 185 insertions(+), 155 deletions(-)
>   create mode 100644 drivers/platform/x86/amd/pmf/metrics.c
> 
> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> index bf7aad80b9e9..8cac51182433 100644
> --- a/drivers/platform/x86/amd/pmf/Makefile
> +++ b/drivers/platform/x86/amd/pmf/Makefile
> @@ -7,6 +7,6 @@
>   obj-$(CONFIG_AMD_PMF)		+= amd-pmf.o
>   amd-pmf-y 			:= core.o acpi.o sps.o \
>   				   auto-mode.o cnqf.o \
> -				   tee-if.o spc.o
> +				   tee-if.o spc.o metrics.o
>   # Build util.c only when AMD_PMF_UTIL_SUPPORT is enabled
>   amd-pmf-$(CONFIG_AMD_PMF_UTIL_SUPPORT) += util.o
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 7c5a1ec3d7fc..c0a21808b867 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -55,7 +55,7 @@
>   #define DELAY_MAX_US	3000
>   
>   /* override Metrics Table sample size time (in ms) */
> -static int metrics_table_loop_ms = 1000;
> +int metrics_table_loop_ms = 1000;
>   module_param(metrics_table_loop_ms, int, 0644);
>   MODULE_PARM_DESC(metrics_table_loop_ms, "Metrics Table sample size time (default = 1000ms)");
>   
> @@ -68,8 +68,6 @@ static bool smart_pc_support = true;
>   module_param(smart_pc_support, bool, 0444);
>   MODULE_PARM_DESC(smart_pc_support, "Smart PC Support (default = true)");
>   
> -static struct device *pmf_device;
> -
>   static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>   {
>   	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
> @@ -138,37 +136,6 @@ int amd_pmf_get_power_source(void)
>   		return POWER_SOURCE_DC;
>   }
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
>   static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
>   {
>   	return ioread32(dev->regbase + reg_offset);
> @@ -297,125 +264,6 @@ static const struct pci_device_id pmf_pci_ids[] = {
>   	{ }
>   };
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
>   static int amd_pmf_reinit_ta(struct amd_pmf_dev *pdev)
>   {
>   	bool status;
> @@ -678,7 +526,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
>   		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
>   
> -	pmf_device = dev->dev;
> +	amd_pmf_set_device(dev->dev);
>   
>   	err = amd_pmf_cdev_register(dev);
>   	if (err)
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
>   #define METRICS_TABLE_ID	7
>   #define BIOS_OUTPUT_MAX		10
>   
> +extern int metrics_table_loop_ms;
> +
>   typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
>   
>   static const uuid_t amd_pmf_ta_uuid[] __used = { UUID_INIT(0xd9b39bf2, 0x66bd, 0x4154, 0xaf, 0xb8,
> @@ -864,6 +866,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer);
>   int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
>   u32 fixp_q88_fromint(u32 val);
>   int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev);
> +void amd_pmf_set_device(struct device *p_device);
>   
>   /* SPS Layer */
>   int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);

