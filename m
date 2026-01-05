Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6239F137930;
	Mon,  5 Jan 2026 15:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626859; cv=none; b=RiDveIMScRUA4jQIYoBMYhCWTt14qiUSxtl1usxE20r7dUKUhQevWSbPwHdthDACxq+hc0Jj/DhAN0yMvYPWEt7CsG6LY6iwR0OdW7bk+WYVhxjxsh0Du6QblNQ9bznWuxS0mpSEzso7vmQ26zScASblGllcJvOadvrFYoN36ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626859; c=relaxed/simple;
	bh=YLWb4i5hljVxLttUxUgnkFJScOxV3MK6gpbnLbo4Xd4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VPWjHbauSoo6lkmps1GIsGO2N3q0HD9XhRJc1ibBXT9zC1EkygA0mPbhRFrf3SQLjFLJbPyRa2AZX8Sukpcw+E/MsjEAbsvfQBOVYdD/JQ3FpGylyarh4qaKnmscT/KAXsPoJiCtLxLfCL4dj4JI9yTufyBai6RDodJWUNHWWTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7IOuKqc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7IOuKqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767626858; x=1799162858;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YLWb4i5hljVxLttUxUgnkFJScOxV3MK6gpbnLbo4Xd4=;
  b=B7IOuKqcsR4x5/XnJmEynLbl8KqdzDU3naAMbwODwaxiogbfq53uCqlm
   z0NnxYeSI48ApXwf9xQYgYk5kcVB3x8i1+Rls6ztxSSqODGEuy02ddQp7
   LcdSXhg9qIHWMvMM2Lt42HMlb4DnefeFu2pZkzUlz9MuEmxXMYHSzt5Gs
   EyqnRzo22ODrpdqKcBInX/8wBoAoMjSyoCHtH2ZmGB/+P/f573d1sHReq
   /3PQOX0NPRuyonYTIoRCdEI6L+CNzkTApsYTOrJDFALZ9bxZa71EmJcuO
   ohnSMJ/UGWuu7nOB7j0JY9BSVy7jaK5kR44vgaUiORHOXH3IVs7FYRG6C
   A==;
X-CSE-ConnectionGUID: vPYOj5VMTqOHIytFMUNN5g==
X-CSE-MsgGUID: HDCdczjWS0G21gSRFxfw5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="56553595"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="56553595"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 07:27:36 -0800
X-CSE-ConnectionGUID: RreMFCoKRHCvgWRApqM59g==
X-CSE-MsgGUID: I4lFQmsaT5qjLPdIEEdNUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="206893518"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 07:27:30 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 Jan 2026 17:27:28 +0200 (EET)
To: Lizhi Hou <lizhi.hou@amd.com>
cc: Hans de Goede <hansg@kernel.org>, ogabbay@kernel.org, 
    quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    LKML <linux-kernel@vger.kernel.org>, max.zhen@amd.com, 
    sonal.santan@amd.com, mario.limonciello@amd.com, 
    dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
    VinitKumar.Shukla@amd.com, Patil Rajesh Reddy <Patil.Reddy@amd.com>
Subject: Re: [PATCH V2 1/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
In-Reply-To: <20251212181803.1825142-2-lizhi.hou@amd.com>
Message-ID: <975fcbfc-33d2-758c-9efb-cbacef47883b@linux.intel.com>
References: <20251212181803.1825142-1-lizhi.hou@amd.com> <20251212181803.1825142-2-lizhi.hou@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 12 Dec 2025, Lizhi Hou wrote:

> From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> The PMF driver retrieves NPU metrics data from the PMFW. Introduce a new
> interface to make NPU metrics accessible to other drivers like AMDXDNA
> driver, which can access and utilize this information as needed.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 75 +++++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h  |  2 +
>  include/linux/amd-pmf-io.h          | 21 ++++++++
>  3 files changed, 98 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index a6a5d416edf9..8e4ce91b3527 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -8,12 +8,15 @@
>   * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   */
>  
> +#include <linux/array_size.h>
> +#include <linux/cleanup.h>
>  #include <linux/debugfs.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/power_supply.h>
> +#include <linux/string.h>
>  #include <asm/amd/node.h>
>  #include "pmf.h"
>  
> @@ -53,6 +56,8 @@ static bool force_load;
>  module_param(force_load, bool, 0444);
>  MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
>  
> +static struct device *pmf_device;
> +
>  static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>  {
>  	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
> @@ -314,6 +319,70 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>  	return 0;
>  }
>  
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
> +	if (is_npu_metrics_supported(dev))
> +		return -EOPNOTSUPP;

Generally, we don't want to shadow error codes like this so please save it 
from is_npu_metrics_supported() and do return ret;

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

To confirm, so only this field is currently going to be used?

--
 i.

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
> +EXPORT_SYMBOL_GPL(amd_pmf_get_npu_data);
> +
>  static int amd_pmf_suspend_handler(struct device *dev)
>  {
>  	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> @@ -469,6 +538,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	mutex_init(&dev->update_mutex);
>  	mutex_init(&dev->cb_mutex);
>  
> +	err = devm_mutex_init(dev->dev, &dev->metrics_mutex);
> +	if (err)
> +		return err;
> +
>  	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
>  	amd_pmf_dbgfs_register(dev);
> @@ -477,6 +550,8 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
>  		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
>  
> +	pmf_device = dev->dev;
> +
>  	dev_info(dev->dev, "registered PMF device successfully\n");
>  
>  	return 0;
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index f07e9f4c660a..0354cc5dc79e 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -12,6 +12,7 @@
>  #define PMF_H
>  
>  #include <linux/acpi.h>
> +#include <linux/amd-pmf-io.h>
>  #include <linux/input.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
> @@ -412,6 +413,7 @@ struct amd_pmf_dev {
>  	struct apmf_sbios_req_v1 req1;
>  	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>  	bool cb_flag;			     /* To handle first custom BIOS input */
> +	struct mutex metrics_mutex;
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index 6fa510f419c0..55198d2875cc 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -61,5 +61,26 @@ enum laptop_placement {
>  	LP_UNDEFINED,
>  };
>  
> +/**
> + * struct amd_pmf_npu_metrics: Get NPU metrics data from PMF driver
> + * @npuclk_freq: NPU clock frequency [MHz]
> + * @npu_busy: NPU busy % [0-100]
> + * @npu_power: NPU power [mW]
> + * @mpnpuclk_freq: MPNPU [MHz]
> + * @npu_reads: NPU read bandwidth [MB/sec]
> + * @npu_writes: NPU write bandwidth [MB/sec]
> + */
> +struct amd_pmf_npu_metrics {
> +	u16 npuclk_freq;
> +	u16 npu_busy[8];
> +	u16 npu_power;
> +	u16 mpnpuclk_freq;
> +	u16 npu_reads;
> +	u16 npu_writes;
> +};
> +
>  int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
> +
> +/* AMD PMF and NPU interface */
> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info);
>  #endif
> 

