Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CDE3E49ED
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 16:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650408; cv=none; b=s0eigYr70ACiNAKUALcesr9rFfsTyKXTFW0WPbG+rUlP99gQm1Us1UhUotOMaut7ngFkCszAaFPhut13ODl4vDVsZSkWh3YYYXLoy2hHJ6lWydtukBzSjVhjHdG/SiBp8+t5YmkywpvTf0h83By6WZfel2I3GOVE42VzZ5H5xS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650408; c=relaxed/simple;
	bh=3rFkByIEk8J6hZPaWNL6XjGQgCcvdVgvg5901Yb13A8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=L3476OPVsnIIkZzTdKIBHxhvnm0hKuPIBPp+sboDyeOx6hZm/reLfWR9x0y0HqrODdSLZe43TRm9pNSwhsiLbjk0PeZSHN/glYJKKhYavLtt0f2doX+CvGu+ICuI9/sbBraX0UiXnoYODyG+Nt3Fqa4fLisTHbjHZ7AW6+LMZLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dI4AGNPD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dI4AGNPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784650405; x=1816186405;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3rFkByIEk8J6hZPaWNL6XjGQgCcvdVgvg5901Yb13A8=;
  b=dI4AGNPDalyyXUv2gizFHm/MiC9ysoB5y9kSWJca/jFTYtzYbTpXcC4+
   5uHKULavzS/vmhPgom/PFJtODOqay8IPVJICQEJ+YoxbS8Fmo9lao0ixn
   6PsE6Kjg3VFZ+eaMsAQ7EbLcoC/O6d32OvBi0bj5hn6ys63XjfD7fAkkt
   0tUJ5YEh8bMMtnHOsohT4FASlRA4rstmW2Ljfqev21YZg1laVY1X1yMyC
   PyTsvRXNbjAmA8WjrzytjHo54kdEpUWdhbEYdesEXfUvSRLZX/QDibN5V
   QPDBO8ej9EB0lusV4AsfWhWVqs+PYpvcl7mp1MaYxXdrEXwQiAzClde2P
   A==;
X-CSE-ConnectionGUID: blhFh/SxSl+EGGSCtRuyjQ==
X-CSE-MsgGUID: l57XOWJtTvKD4tWcFSUVIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85458406"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85458406"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 09:13:23 -0700
X-CSE-ConnectionGUID: 0HwiWXvZQ2a9YR72VpLdmA==
X-CSE-MsgGUID: 90ywr3bGToq+oRo25PcoeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="261586998"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 09:13:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 19:13:17 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH v2 6/6] platform/x86/amd/pmf: Add 1AH_M80H metrics table
 and NPU metrics support
In-Reply-To: <20260713183936.690228-7-Shyam-sundar.S-k@amd.com>
Message-ID: <d2aff198-0ebb-b1d3-1aaf-3ee0f241e86a@linux.intel.com>
References: <20260713183936.690228-1-Shyam-sundar.S-k@amd.com> <20260713183936.690228-7-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Jul 2026, Shyam Sundar S K wrote:

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
>  - Introduce amd_pmf_supports_accumulator_metrics() to check the
>    accumulator based metrics support.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c    |  29 ++++
>  drivers/platform/x86/amd/pmf/metrics.c | 144 ++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h     | 217 +++++++++++++++++++++++++
>  include/linux/amd-pmf-io.h             |   2 +
>  4 files changed, 392 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 600992f0e2c7..303cf3c45712 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -68,6 +68,16 @@ static bool smart_pc_support = true;
>  module_param(smart_pc_support, bool, 0444);
>  MODULE_PARM_DESC(smart_pc_support, "Smart PC Support (default = true)");
>  
> +static bool amd_pmf_supports_accumulator_metrics(struct amd_pmf_dev *pdev)
> +{
> +	switch (pdev->cpu_id) {
> +	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>  {
>  	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
> @@ -155,6 +165,12 @@ static void __maybe_unused amd_pmf_dump_registers(struct amd_pmf_dev *dev)
>  
>  	value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
>  	dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT:%d\n", value);
> +	if (amd_pmf_supports_accumulator_metrics(dev)) {
> +		value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[1]);
> +		dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT1:%d\n", value);
> +		value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[2]);
> +		dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT2:%d\n", value);
> +	}
>  
>  	value = amd_pmf_reg_read(dev, dev->smu_regs->msg_reg);
>  	dev_dbg(dev->dev, "AMD_PMF_REGISTER_MESSAGE:%x\n", value);
> @@ -214,6 +230,13 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
>  			/* PMFW may take longer time to return back the data */
>  			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
>  			*data = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
> +			if (amd_pmf_supports_accumulator_metrics(dev) &&
> +			    message == GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR) {
> +				dev->dram_addr.hi = amd_pmf_reg_read(dev,
> +								     dev->smu_regs->arg_reg[1]);
> +				dev->dram_addr.size = amd_pmf_reg_read(dev,
> +								       dev->smu_regs->arg_reg[2]);
> +			}
>  		}
>  		break;
>  	case AMD_PMF_RESULT_CMD_REJECT_BUSY:
> @@ -517,6 +540,12 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> +	if (amd_pmf_supports_accumulator_metrics(dev)) {
> +		err = amd_pmf_get_tbl_dram_addr(dev);
> +		if (err)
> +			return err;
> +	}
> +
>  	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
>  	amd_pmf_dbgfs_register(dev);
> diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
> index c4f5f4d36bd6..ceff4f139043 100644
> --- a/drivers/platform/x86/amd/pmf/metrics.c
> +++ b/drivers/platform/x86/amd/pmf/metrics.c
> @@ -16,8 +16,12 @@
>  #include <linux/device/devres.h>
>  #include <linux/io.h>
>  #include <linux/ktime.h>
> +#include <linux/limits.h>
> +#include <linux/math64.h>
> +#include <linux/minmax.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
> +#include <linux/units.h>
>  #include <linux/wordpart.h>
>  #include <linux/workqueue.h>
>  
> @@ -25,6 +29,89 @@
>  
>  static struct device *pmf_device;
>  
> +static u16 amd_pmf_q10_acc_to_mW(u64 avg_acc)
> +{
> +	u64 val = DIV_U64_ROUND_CLOSEST(avg_acc, 1024) * MILLIWATT_PER_WATT;
> +
> +	return min_t(u16, val, U16_MAX);
> +}
> +
> +static u16 amd_pmf_q10_acc_to_int(u64 avg_acc)
> +{
> +	u64 val = DIV_U64_ROUND_CLOSEST(avg_acc, 1024);
> +
> +	return min_t(u16, val, U16_MAX);
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
> +	return DIV_U64_ROUND_CLOSEST(val_diff, counter_diff);
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
> @@ -120,12 +207,46 @@ static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
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
> @@ -136,6 +257,8 @@ static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_m
>  	if (ret)
>  		return ret;
>  
> +	memset(data, 0, sizeof(*data));
> +
>  	switch (dev->cpu_id) {
>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> @@ -162,6 +285,27 @@ static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_m
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
> index 4873685c84ad..0f8e6cc9a453 100644
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
> @@ -250,6 +259,199 @@ struct apmf_fan_idx {
>  	u32 fan_ctl_idx;
>  } __packed;
>  
> +struct amd_pmf_metrics_iod {
> +	u32 counter_acc;
> +	/* Set Voltage */
> +	u64 vddcr_set_voltage;
> +	u64 vddcr_soc_set_voltage;
> +	u64 vddcr_npu_set_voltage;
> +	u64 vddcr_lp_set_voltage;
> +	u64 vddcr_gfx_set_voltage;
> +	u64 vdd_misc_set_voltage;
> +	/* Telemetry Voltages */
> +	u64 vddcr_telemetry_voltage;
> +	u64 vddcr_soc_telemetry_voltage;
> +	u64 vddcr_npu_telemetry_voltage;
> +	u64 vddcr_lp_telemetry_voltage;
> +	u64 vddcr_gfx_telemetry_voltage;
> +	u64 vdd_misc_telemetry_voltage;
> +	/* Telemetry Powers */
> +	u64 vddcr_telemetry_power;
> +	u64 vddcr_soc_telemetry_power;
> +	u64 vddcr_npu_telemetry_power;
> +	u64 vddcr_lp_telemetry_power;
> +	u64 vddcr_gfx_telemetry_power;
> +	u64 vdd_misc_telemetry_power;
> +	/* Throttlers - Fast PPT */
> +	u32 fppt_fused_limit;
> +	u32 fppt_max_irm_limit;
> +	u32 fppt_max_pbo_limit;
> +	u32 fppt_limit;
> +	u64 fppt_value_acc;
> +	u32 fppt_residency_acc;
> +	/* Throttlers - Slow PPT */
> +	u32 sppt_fused_limit;
> +	u32 sppt_max_irm_limit;
> +	u32 sppt_max_pbo_limit;
> +	u32 sppt_limit;
> +	u64 sppt_value_acc;
> +	u32 sppt_residency_acc;
> +	/* Throttlers - STAPM */
> +	u32 spl_fused_limit;
> +	u32 spl_max_irm_limit;
> +	u32 spl_max_pbo_limit;
> +	u32 spl_limit;
> +	u64 spl_value_acc;
> +	u32 spl_residency_acc;
> +	/* Throttlers - TDC VDDCR */
> +	u32 tdc_vddcr_fused_limit;
> +	u32 tdc_vddcr_max_irm_limit;
> +	u32 tdc_vddcr_max_pbo_limit;
> +	u32 tdc_vddcr_limit;
> +	u64 tdc_vddcr_value_acc;
> +	u32 tdc_vddcr_residency_acc;
> +	/* Throttlers - TDC VDDCR_SOC */
> +	u32 tdc_vddcr_soc_fused_limit;
> +	u32 tdc_vddcr_soc_max_irm_limit;
> +	u32 tdc_vddcr_soc_max_pbo_limit;
> +	u32 tdc_vddcr_soc_limit;
> +	u64 tdc_vddcr_soc_value_acc;
> +	u32 tdc_vddcr_soc_residency_acc;
> +	/* Throttlers - TDC VDDCR_NPU */
> +	u32 tdc_vddcr_npu_fused_limit;
> +	u32 tdc_vddcr_npu_max_irm_limit;
> +	u32 tdc_vddcr_npu_max_pbo_limit;
> +	u32 tdc_vddcr_npu_limit;
> +	u64 tdc_vddcr_npu_value_acc;
> +	u32 tdc_vddcr_npu_residency_acc;
> +	/* Throttlers - TDC VDDCR_LP */
> +	u32 tdc_vddcr_lp_fused_limit;
> +	u32 tdc_vddcr_lp_max_irm_limit;
> +	u32 tdc_vddcr_lp_max_pbo_limit;
> +	u32 tdc_vddcr_lp_limit;
> +	u64 tdc_vddcr_lp_value_acc;
> +	u32 tdc_vddcr_lp_residency_acc;
> +	/* Throttlers - TDC VDDCR_GFX */
> +	u32 tdc_vddcr_gfx_fused_limit;
> +	u32 tdc_vddcr_gfx_max_irm_limit;
> +	u32 tdc_vddcr_gfx_max_pbo_limit;
> +	u32 tdc_vddcr_gfx_limit;
> +	u64 tdc_vddcr_gfx_value_acc;
> +	u32 tdc_vddcr_gfx_residency_acc;
> +	/* Throttlers - EDC VDDCR */
> +	u32 edc_vddcr_fused_limit;
> +	u32 edc_vddcr_max_irm_limit;
> +	u32 edc_vddcr_max_pbo_limit;
> +	u32 edc_vddcr_limit;
> +	/* Throttlers - Thermal */
> +	u32 thm_fused_limit;
> +	u32 thm_limit;
> +	u64 thm_value_acc;
> +	u32 thm_residency_acc;
> +	u32 prochot_residency_acc;
> +	u64 gfx_temp_acc;
> +	u64 soc_temp_acc;
> +	u32 p3t_fused_limit;
> +	u64 p3t_value_acc;
> +	/* Power */
> +	u64 system_power_acc;
> +	u64 apu_power_acc;
> +	u64 dgpu_power_acc;
> +	u64 npu_power_acc;
> +	/* Frequencies */
> +	u64 fclk_freq_eff_acc;
> +	u64 memclk_freq_eff_acc;
> +	u64 lclk_freq_eff_acc;
> +	u64 gfxclk_freq_eff_acc;
> +	u64 socclk_freq_eff_acc;
> +	u64 vclk_freq_eff_acc;
> +	u64 vpeclk_freq_eff_acc;
> +	u64 aieclk_freq_eff_acc;
> +	u64 npuhclk_freq_eff_acc;
> +	/* Bandwidth */
> +	u64 dram_read_bandwidth;
> +	u64 dram_write_bandwidth;
> +	/* Activity Monitors */
> +	u64 gfx_busy_acc;
> +	u64 vcn_busy_acc;
> +	u64 npu_busy_acc[3];
> +	/* STT Limits */
> +	u32 stt_min_limit;
> +	u64 stt_apu_hotspot_temp_acc;
> +	u64 stt_hs2_hotspot_temp_acc;
> +	u32 stt_apu_temp_limit;
> +	u64 stt_apu_skin_temp_acc;
> +	/* Residencies */
> +	u64 cpuoff_residency_ccx0;
> +	u64 cpuoff_residency_ccx1;
> +	u64 cpuoff_residency_ccx2;
> +	u64 cpuoff_residency_ccx3;
> +	/* DF-pstates */
> +	u32 fclk_freq_table[AMD_PMF_NUM_CLK_DPM_LEVELS];
> +	u32 uclk_freq_table[AMD_PMF_NUM_CLK_DPM_LEVELS];
> +	u32 ddr_rate_table[AMD_PMF_NUM_CLK_DPM_LEVELS];
> +	u8 dfpstate_source[AMD_PMF_NUM_CLK_DPM_LEVELS];
> +	/* System */
> +	u8 gfx_disabled;
> +	u8 spare2[3];
> +	u32 gfxclk_fmax;
> +	u8 cclk_core_fuse_enable[AMD_PMF_METRIC_CORE_TYPE_MAX][AMD_PMF_NUM_MAX_CORES];
> +	u8 cclk_core_enabled[AMD_PMF_METRIC_CORE_TYPE_MAX][AMD_PMF_NUM_MAX_CORES];
> +	u32 cclk_fmax[AMD_PMF_METRIC_CORE_TYPE_MAX][AMD_PMF_NUM_MAX_CORES];
> +	/* Overclock Capable */
> +	u8 cpu_precise_and_direct_oc_capable;
> +	u8 gfx_precise_and_direct_oc_capable;
> +	u8 pbo_basic_oc_capable;
> +	u8 pbo_advanced_oc_capable;
> +	u8 pbo_nitro_oc_capable;
> +	u8 memory_and_fabric_oc_capable;
> +	u8 misc_oc_capable;
> +	u8 extreme_cold_oc_capable;
> +	u8 down_config_control_capable;
> +	u8 spare0[3];
> +	/* Overclock Status */
> +	u32 fit_limit_scalar;
> +	u8 ln2_enabled;
> +	u8 cpu_precise_and_direct_oc_enabled;
> +	u8 gfx_precise_and_direct_oc_enabled;
> +	u8 spare1[2];
> +	/* Voltage Guardband in PSM count */
> +	s8 psm_guardband[5][5][3];
> +	s32 core_power_limit_offset;
> +	u32 max_freq_offset[5];
> +	u64 npu_temp_acc;
> +	u64 dfpstate_residency_acc[AMD_PMF_NUM_CLK_DPM_LEVELS];
> +	u32 cclk_fboost;
> +	/* PMF */
> +	u32 pmf_fast_apu_ppt_limit;
> +	u64 pmf_fast_apu_ppt_value_acc;
> +	u32 pmf_fast_apu_ppt_residency_acc;
> +	u32 pmf_slow_apu_ppt_limit;
> +	u64 pmf_slow_apu_ppt_value_acc;
> +	u32 pmf_slow_apu_ppt_residency_acc;
> +	u32 pmf_fast_spm_limit;
> +	u64 pmf_fast_spm_value_acc;
> +	u32 pmf_fast_spm_residency_acc;
> +	u32 pmf_slow_spm_limit;
> +	u64 pmf_slow_spm_value_acc;
> +	u32 pmf_slow_spm_residency_acc;
> +	u32 spare3[5];
> +} __packed __aligned(4);

Include is missing (it's a pre-existing problem).

> +
> +struct amd_pmf_metrics_ccx {
> +	u64 core_c0[AMD_PMF_NUM_MAX_CORES];
> +	u64 core_cc6[AMD_PMF_NUM_MAX_CORES];
> +	u64 core_freq[AMD_PMF_NUM_MAX_CORES];
> +	u64 core_freqeff[AMD_PMF_NUM_MAX_CORES];
> +	u64 core_temp[AMD_PMF_NUM_MAX_CORES];
> +	u64 core_power[AMD_PMF_NUM_MAX_CORES];
> +} __packed __aligned(4);
> +
> +struct amd_pmf_metrics_v3 {
> +	struct amd_pmf_metrics_iod iod;
> +	struct amd_pmf_metrics_ccx ccx[AMD_PMF_METRIC_CCX_MAX];
> +} __packed __aligned(4);
> +
>  struct smu_pmf_metrics_v2 {
>  	u16 core_frequency[16];		/* MHz */
>  	u16 core_power[16];		/* mW */
> @@ -406,6 +608,12 @@ struct amd_pmf_smu_regs {
>  	u32 arg_reg[3];
>  };
>  
> +struct amd_pmf_arg_data {
> +	u32 lo;
> +	u32 hi;
> +	u32 size;
> +};
> +
>  struct amd_pmf_dev {
>  	void __iomem *regbase;
>  	void __iomem *smu_virt_addr;
> @@ -459,6 +667,12 @@ struct amd_pmf_dev {
>  	struct mutex metrics_mutex;
>  	u32 bios_output[BIOS_OUTPUT_MAX];
>  	const struct amd_pmf_smu_regs *smu_regs;
> +	void __iomem *metrics_table_virt;	/* Mapped DRAM virtual address for metrics table */
> +	phys_addr_t metrics_table_phys;		/* DRAM physical address for metrics table */
> +	struct amd_pmf_metrics_v3 mtable_v3;	/* IOD and CCX */
> +	struct amd_pmf_arg_data dram_addr;
> +	struct amd_pmf_metrics_v3 prev_metrics;	/* Previous metrics for delta calculation */
> +	bool npu_metrics_have_prev;
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> @@ -868,6 +1082,9 @@ u32 fixp_q88_fromint(u32 val);
>  int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev);
>  void amd_pmf_set_device(struct device *p_device);
>  
> +/* Metrics layer */
> +int amd_pmf_get_tbl_dram_addr(struct amd_pmf_dev *dev);
> +
>  /* SPS Layer */
>  int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
>  void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index e014d4ce5a20..b84c200b0f8e 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -60,6 +60,7 @@ struct amd_sfh_info {
>   * @mpnpuclk_freq: MPNPU [MHz]
>   * @npu_reads: NPU read bandwidth [MB/sec]
>   * @npu_writes: NPU write bandwidth [MB/sec]
> + * @npu_temp: NPU temperature [C]
>   */
>  struct amd_pmf_npu_metrics {
>  	u16 npuclk_freq;
> @@ -68,6 +69,7 @@ struct amd_pmf_npu_metrics {
>  	u16 mpnpuclk_freq;
>  	u16 npu_reads;
>  	u16 npu_writes;
> +	u16 npu_temp;
>  };
>  
>  int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
> 

-- 
 i.

