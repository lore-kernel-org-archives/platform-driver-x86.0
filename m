Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968C41A683E
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 18:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783707426; cv=none; b=nczc+h7beOVMaDYu7vBdPPJ0czqpCvsKfnXwTbAhlLd7LlgTubJR4h8hVTAFHv65vAxsBRLWzOckp4sWnTBMz33olaqOXI3b9AQnDCItIovJ7Wz7vHBh/+FGv99BPMtGfzl9m/vkmqAEL734qV+Ruqd1fipMeFR2vSdF1b2Fz00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783707426; c=relaxed/simple;
	bh=CfrH3lI61tfb6bhps39m1hXOIuZEivrTuFpx2OBDg+E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uvFojWQE3Z9WF/ohJnRGgPrJEoF6M4YrN6nmldpohOTDs/cHorpGNx70h1faiI+jNG1yrKlkaG3xmLBRR34uD9LMb9Qu7c+zuhK7CM5n8xnO0rsk+3bXSqv2TvwfZ1OEClUkkT3MCFso0jbFpLrtxXNCtvwJNFwqvubuQE9VB/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNnxoC6c; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNnxoC6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783707424; x=1815243424;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CfrH3lI61tfb6bhps39m1hXOIuZEivrTuFpx2OBDg+E=;
  b=SNnxoC6cL58pCNZCY/AGjQuJN/V270tlnTRWvCmQEcy0Ud8frXYZYxQo
   nTpt7WOrFpbbrHg1nWkuQ6EIyOk3J2R7PoL5x9DO8AdUtnyTN8GsL4K6E
   btUiFy/QaLt1gCqphQws8CzcLdCUZwzzsFfMP+8ZjMKLvexYqIr+IxPgn
   ym1bgf1H0pTml71SXrf3PFtKsvTeeulQ/iaH6k5wf6nY8tjfFQIRQLGnV
   vqdOmyRQtsnZolUiFwun5N4hXaKg62iqpasowxBcoLDNDHG+c0G75kd5E
   7nCtJAz2EVRbk2nHtZF2ZiQM2/Hfhl98C9zzOcUcu/wABam3cvCnfHtfb
   Q==;
X-CSE-ConnectionGUID: BFm7hU2JSzqPV9SfTWmVmg==
X-CSE-MsgGUID: YtC0Gk1ETs+ODQUSAsoZGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71931746"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="71931746"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 11:17:04 -0700
X-CSE-ConnectionGUID: kdjIxsdPQhGmZzcCe42xmQ==
X-CSE-MsgGUID: jjLKOlszQ4ylCNfclppQTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259276640"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 11:17:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Jul 2026 21:16:58 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH 5/5] platform/x86/amd/pmf: Add 1AH_M80H metrics table
 and NPU metrics support
In-Reply-To: <20260710174219.2522269-6-Shyam-sundar.S-k@amd.com>
Message-ID: <39c6af1d-f9fe-f093-0ca2-90f5c324ffde@linux.intel.com>
References: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com> <20260710174219.2522269-6-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 10 Jul 2026, Shyam Sundar S K wrote:

> The 1AH_M80H platform introduces a new firmware managed DRAM based
> metrics table (amd_pmf_metrics_v3) covering the full platform telemetry
> including power, voltages, frequencies, throttlers and activity monitors.
> 
> As a first consumer of this table, add NPU metrics retrieval. Unlike
> earlier platforms that use a transfer table command, 1AH_M80H metrics
> are accumulator based and require delta calculation between consecutive
> samples.
> 
> Extend amd_pmf_npu_metrics with npu_temp, populated from the
> npu_temp_acc accumulator field available on 1AH_M80H.
> 
> Key changes include:
>  - Add DRAM based metrics table support for the 1AH_M80H platform
>  - Introduce amd_pmf_get_tbl_dram_addr() to obtain the DRAM address
>  - Add amd_pmf_get_metrics_table_log_sample() to trigger metrics updates
>  - Add struct amd_pmf_metrics_v3 for the 1AH_M80H metrics format
>  - Implement accumulator based delta calculation for metrics
>  - Introduce amd_pmf_calculate_acc_npu_metrics() to get NPU metrics
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c    |  25 +++
>  drivers/platform/x86/amd/pmf/metrics.c | 142 ++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h     | 218 +++++++++++++++++++++++++
>  include/linux/amd-pmf-io.h             |   2 +
>  4 files changed, 387 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index c0a21808b867..5d744eb71418 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -68,6 +68,12 @@ static bool smart_pc_support = true;
>  module_param(smart_pc_support, bool, 0444);
>  MODULE_PARM_DESC(smart_pc_support, "Smart PC Support (default = true)");
>  
> +/* Helper to check if platform is 1AH_M80H */
> +bool is_amd_pmf_1ah_m80h(struct amd_pmf_dev *pdev)
> +{
> +	return pdev->cpu_id == PCI_DEVICE_ID_AMD_1AH_M80H_ROOT;
> +}
> +
>  static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>  {
>  	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
> @@ -155,6 +161,12 @@ static void __maybe_unused amd_pmf_dump_registers(struct amd_pmf_dev *dev)
>  
>  	value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
>  	dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT:%d\n", value);
> +	if (is_amd_pmf_1ah_m80h(dev)) {
> +		value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[1]);
> +		dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT1:%d\n", value);
> +		value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[2]);
> +		dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT2:%d\n", value);
> +	}
>  
>  	value = amd_pmf_reg_read(dev, dev->smu_regs->msg_reg);
>  	dev_dbg(dev->dev, "AMD_PMF_REGISTER_MESSAGE:%x\n", value);
> @@ -214,6 +226,13 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
>  			/* PMFW may take longer time to return back the data */
>  			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
>  			*data = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
> +			if (is_amd_pmf_1ah_m80h(dev) &&
> +			    message == GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR) {
> +				dev->dram_addr.hi = amd_pmf_reg_read(dev,
> +								     dev->smu_regs->arg_reg[1]);
> +				dev->dram_addr.size = amd_pmf_reg_read(dev,
> +								       dev->smu_regs->arg_reg[2]);
> +			}
>  		}
>  		break;
>  	case AMD_PMF_RESULT_CMD_REJECT_BUSY:
> @@ -518,6 +537,12 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> +	if (is_amd_pmf_1ah_m80h(dev)) {
> +		err = amd_pmf_get_tbl_dram_addr(dev);
> +		if (err)
> +			return err;
> +	}
> +
>  	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
>  	amd_pmf_dbgfs_register(dev);
> diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
> index 5a8ebacbc3b3..4cb45a8bbdb4 100644
> --- a/drivers/platform/x86/amd/pmf/metrics.c
> +++ b/drivers/platform/x86/amd/pmf/metrics.c
> @@ -17,6 +17,8 @@
>  #include <linux/device/devres.h>
>  #include <linux/io.h>
>  #include <linux/ktime.h>
> +#include <linux/math.h>
> +#include <linux/minmax.h>

This was the fourth header I was missing earlier from the almost always 
forgotten list. :-)

>  #include <linux/string.h>
>  #include <linux/workqueue.h>
>  
> @@ -24,6 +26,89 @@
>  
>  static struct device *pmf_device;
>  
> +static u16 amd_pmf_q10_acc_to_mW(u64 avg_acc)
> +{
> +	u64 val = DIV_ROUND_CLOSEST_ULL(avg_acc, 1024) * 1000;

Please use one of the 64-bit divide helpers whenever any of the values is 
64-bit.

Is that 1000 something from units.h?

> +
> +	return min_t(u16, val, U16_MAX);
> +}
> +
> +static u16 amd_pmf_q10_acc_to_int(u64 avg_acc)
> +{
> +	u64 val = DIV_ROUND_CLOSEST_ULL(avg_acc, 1024);

Ditto.

> +
> +	return min_t(u16, val, U16_MAX);

+ limits.h

> +}
> +
> +static u64 amd_pmf_avg_acc_metric(u32 curr_counter, u32 prev_counter,
> +				  u64 curr_value, u64 prev_value)
> +{
> +	u32 counter_diff;
> +	u64 val_diff;
> +
> +	/* Check for counter reset */
> +	if (curr_counter <= prev_counter)
> +		return 0;
> +
> +	counter_diff = curr_counter - prev_counter;
> +
> +	if (curr_value < prev_value)
> +		return 0;
> +
> +	val_diff = curr_value - prev_value;
> +
> +	return DIV_ROUND_CLOSEST_ULL(val_diff, counter_diff);

Use 64-bit helpers.

> +}
> +
> +int amd_pmf_get_tbl_dram_addr(struct amd_pmf_dev *dev)
> +{
> +	int ret;
> +
> +	ret = amd_pmf_send_cmd(dev, GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR, GET_CMD,
> +			       ARG_NONE, &dev->dram_addr.lo);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to get DRAM address: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev->metrics_table_phys = ((u64)dev->dram_addr.hi << 32) | dev->dram_addr.lo;
> +	dev->mtable_size = dev->dram_addr.size;
> +
> +	if (dev->mtable_size != sizeof(dev->mtable_v3)) {
> +		dev_err(dev->dev, "Metrics table size mismatch: got %u, expected %zu\n",
> +			dev->dram_addr.size, sizeof(dev->mtable_v3));
> +		return -EINVAL;
> +	}
> +
> +	dev->metrics_table_virt = devm_ioremap(dev->dev, dev->metrics_table_phys, dev->mtable_size);
> +	if (!dev->metrics_table_virt) {
> +		dev_err(dev->dev, "Failed to map DRAM address for PMF metrics table\n");
> +		dev->metrics_table_phys = 0;
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_pmf_get_metrics_table_log_sample(struct amd_pmf_dev *dev)
> +{
> +	int ret;
> +
> +	if (!dev->metrics_table_virt) {
> +		dev_err(dev->dev, "Metrics DRAM not mapped\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Send command to PMFW to update metrics table log sample */
> +	ret = amd_pmf_send_cmd(dev, GET_1AH_M80H_METRICS_TABLE_LOG_SAMPLE, SET_CMD, ARG_NONE, NULL);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to request metrics log sample: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static void amd_pmf_get_metrics(struct work_struct *work)
>  {
>  	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, work_buffer.work);
> @@ -119,12 +204,46 @@ static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
>  	switch (pdev->cpu_id) {
>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
>  		return 0;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
>  }
>  
> +static void amd_pmf_calculate_acc_npu_metrics(struct amd_pmf_dev *dev,
> +					      struct amd_pmf_npu_metrics *data)
> +{
> +	struct amd_pmf_metrics_iod *curr, *prev;
> +	u64 val;
> +	int i;
> +
> +	curr = &dev->mtable_v3.iod;
> +	prev = &dev->prev_metrics.iod;
> +
> +	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
> +				     curr->npu_temp_acc, prev->npu_temp_acc);
> +	data->npu_temp = amd_pmf_q10_acc_to_int(val);
> +	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
> +				     curr->npu_power_acc, prev->npu_power_acc);
> +	data->npu_power = amd_pmf_q10_acc_to_mW(val);
> +	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
> +				     curr->npuhclk_freq_eff_acc,
> +				     prev->npuhclk_freq_eff_acc);
> +	data->mpnpuclk_freq = amd_pmf_q10_acc_to_int(val);
> +	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
> +				     curr->aieclk_freq_eff_acc,
> +				     prev->aieclk_freq_eff_acc);
> +	data->npuclk_freq = amd_pmf_q10_acc_to_int(val);
> +
> +	for (i = 0; i < ARRAY_SIZE(curr->npu_busy_acc); i++) {
> +		val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
> +					     curr->npu_busy_acc[i],
> +					     prev->npu_busy_acc[i]);
> +		data->npu_busy[i] = amd_pmf_q10_acc_to_int(val);
> +	}
> +}
> +
>  static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_metrics *data)
>  {
>  	int ret, i;
> @@ -135,6 +254,8 @@ static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_m
>  	if (ret)
>  		return ret;
>  
> +	memset(data, 0, sizeof(*data));
> +
>  	switch (dev->cpu_id) {
>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> @@ -161,6 +282,27 @@ static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_m
>  		data->npu_reads = dev->m_table_v2.npu_reads;
>  		data->npu_writes = dev->m_table_v2.npu_writes;
>  		break;
> +	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
> +		ret = amd_pmf_get_metrics_table_log_sample(dev);
> +		if (ret)
> +			return ret;
> +
> +		memcpy_fromio(&dev->mtable_v3, dev->metrics_table_virt, sizeof(dev->mtable_v3));
> +
> +		/*Ignore the first sample, as previous metrics is uninitialized (zero)
> +		 * Metrics are calculated as:
> +		 *	metrics = current_metrics - previous_metrics
> +		 * Skipping the initial sample ensures accurate delta calculations.
> +		 */
> +		if (!dev->npu_metrics_have_prev) {
> +			memcpy(&dev->prev_metrics, &dev->mtable_v3, sizeof(dev->mtable_v3));
> +			dev->npu_metrics_have_prev = true;
> +			return 0;
> +		}
> +
> +		amd_pmf_calculate_acc_npu_metrics(dev, data);
> +		memcpy(&dev->prev_metrics, &dev->mtable_v3, sizeof(dev->mtable_v3));
> +		break;
>  	}
>  
>  	return 0;
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 4873685c84ad..76cfeb2b963c 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -75,6 +75,10 @@ struct cookie_header {
>  #define SET_PMF_PPT            0x25
>  #define SET_PMF_PPT_APU_ONLY   0x26
>  
> +/* Message IDs for 1AH_M80H platform */
> +#define GET_1AH_M80H_METRICS_TABLE_LOG_SAMPLE	0x0E
> +#define GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR	0x0F
> +
>  /* OS slider update notification */
>  #define DC_BEST_PERF		0
>  #define DC_BETTER_PERF		1
> @@ -139,6 +143,11 @@ struct cookie_header {
>  
>  extern int metrics_table_loop_ms;
>  
> +#define AMD_PMF_METRIC_CORE_TYPE_MAX	4
> +#define AMD_PMF_METRIC_CCX_MAX		4
> +#define AMD_PMF_NUM_CLK_DPM_LEVELS	8
> +#define AMD_PMF_NUM_MAX_CORES		12
> +
>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
>  
>  static const uuid_t amd_pmf_ta_uuid[] __used = { UUID_INIT(0xd9b39bf2, 0x66bd, 0x4154, 0xaf, 0xb8,


-- 
 i.

