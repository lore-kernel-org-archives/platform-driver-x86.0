Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B37E3AE718;
	Thu, 15 Jan 2026 15:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768490357; cv=none; b=R7y8Z2ENnHlKO7zs60X2Zspbd9WV1tX7Sm98GW6cURSddskE0mg8j06R2Vdwl7MnHezIV21Amd+f9INZukObaXQ/ALDshRLe3iDRrArXRpeKw7otB4Qv0lEVtePwR17oNxy+03boro+6EM4trFIO7ocpFq6a+RWe7vgNv2pYgjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768490357; c=relaxed/simple;
	bh=anZHwFt3bfoptT9P+wK8SHhBzDK1pu4qs7Wv3PmREqo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GzdZh0OfRCrz6VjMT4vKTm95mSbg7SLlDvJG4hyPPvTneuAxIfObklgKHUb27ul0UcLTuJIj5XrSrL0ekKJnCujjXInGwCSxi5UsQxeMK0p/TO+6KT33jtOJcsbiUC9GkrPbAl/nlpdGWGYJh+87ff4uXr/xwdqcQKpNnnztoQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8U74tFq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8U74tFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768490351; x=1800026351;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=anZHwFt3bfoptT9P+wK8SHhBzDK1pu4qs7Wv3PmREqo=;
  b=P8U74tFqEZd4Cg5uvAnMM4w8co70JPuKRQNvgQprXMcJyc22Tuz8wwFf
   OAXBpYp/oGUCEv1k6z+M2KqjXeXUwsWU5P/6agw5GaxaeGnEgbOR9KJf4
   DBsnZ/qBwOP6RwDETvXD3P1R3UDnJkWHtDHGd/ixbVAVein/73SVlbZFg
   X9hdZ2mY8+KuOOOZil+5mXS+QyYqQLK16Tf+vkEKhYUMTGyc9hh7FN7at
   DJtVynxZRx1odq+o5ryTYsSp4M6XwEIwa/z/Y9ZNxJKpkiOpCnfhdaTwR
   5L+3cZulSElW6Tiv2OfO1mL01h22PuLLHLID4ruTAIWnnGBpFE2X3gSTE
   Q==;
X-CSE-ConnectionGUID: 0yYassowSk2LLgTCStPC2g==
X-CSE-MsgGUID: /VVIfYz/Ra6A2TzjJ115YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69004318"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69004318"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 07:19:03 -0800
X-CSE-ConnectionGUID: 0gx1KXggSiKkeSSC8xRO7Q==
X-CSE-MsgGUID: 6BBFtCJbSNmuQH84VEeb1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209486267"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.248])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 07:18:58 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Jan 2026 17:18:54 +0200 (EET)
To: Lizhi Hou <lizhi.hou@amd.com>
cc: ogabbay@kernel.org, quic_jhugo@quicinc.com, 
    maciej.falkowski@linux.intel.com, Hans de Goede <hansg@kernel.org>, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
    max.zhen@amd.com, sonal.santan@amd.com, mario.limonciello@amd.com, 
    platform-driver-x86@vger.kernel.org, VinitKumar.Shukla@amd.com, 
    Patil Rajesh Reddy <Patil.Reddy@amd.com>
Subject: Re: [PATCH V3 1/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
In-Reply-To: <20260105172956.3732123-2-lizhi.hou@amd.com>
Message-ID: <4d365fb4-08f5-0b2f-62df-b8f46b792953@linux.intel.com>
References: <20260105172956.3732123-1-lizhi.hou@amd.com> <20260105172956.3732123-2-lizhi.hou@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Jan 2026, Lizhi Hou wrote:

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
> [lizhi: save return value of is_npu_metrics_supported() and return it]
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 76 +++++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h  |  2 +
>  include/linux/amd-pmf-io.h          | 21 ++++++++
>  3 files changed, 99 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 8fc293c9c538..d180a39e03bf 100644
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
> @@ -314,6 +319,71 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
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
> +EXPORT_SYMBOL_GPL(amd_pmf_get_npu_data);

One more thing, the export should be namespaced.

And since I'll be applying only this patch and not do an IB, can you also 
rebase it on top for the for-next branch.

-- 
 i.

