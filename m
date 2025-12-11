Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F086212FB9;
	Thu, 11 Dec 2025 18:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765477474; cv=none; b=GF1McDeKWlFMkpPGbDajeMdB+dvRenYFkPo7HSmhPkJ7b1lyP4aiIku+162MXff5t2YEStEp9dxkEOLlvBBXHYa7eiD2QxFRY22Uoz8n6kT9Nd+9wQhRwdXAUeD9Qnda/0gPyrfYbMgM2TjTKHJJZeH1fDiWD555ChItnLoNexA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765477474; c=relaxed/simple;
	bh=nC2Zi2GaTg9N0A0iDp6GVvPPxW+GzjB0W8YOl5S43Fw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Q/dmtWKsLDGm7uVx+3mSvIsIVs29bQxtSssRR/hk1Z8uKWuKWbKpJ8Z43ZdusuvG1VGJghWl+juKBuNzDrs09t//a7dksgvuVa7NseoouYynRrM1CYRMuJxXKcb3qCtH4s+2LNyA2RhLkBl/Yk4H/toKvlwQt4a/Dx58UYcwou0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jX9cXHsE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jX9cXHsE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765477472; x=1797013472;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nC2Zi2GaTg9N0A0iDp6GVvPPxW+GzjB0W8YOl5S43Fw=;
  b=jX9cXHsEAlpOF6W9pUkwkt55ejNk3+WbomRADKLt4UVkw84tmEIwdTAF
   BG8FnsMTc0ghr57+88DlTr/U8LeddqOyrJTDUt5IK2JWHLF4Q2JjSJfEF
   C4j4rzflTawC/1x7K9KIfZWxwxHVMdpDD5P41kxPJsLSqGBLlX+rxJi1W
   Pl4QZR4ZqTEdeSx7x4MRMSY4681rw7EdEZ/riBiO65iMficp/wRPMwPp2
   VIuLH/nwNv1cSlgFVn88jBS71966uKb2otQvCQT50JK43hI16wESpx8CB
   nijwq5uKwddS1XrA8HQTfUx4KjPh6C+UR/VTkL3eVnrCG7Avq/ZJ5o2t0
   w==;
X-CSE-ConnectionGUID: 9zZ3EfvgTHSKsCkp6FjDbg==
X-CSE-MsgGUID: B9OSJP7TSJ2m9PTQKPiL7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67515717"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67515717"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 10:24:32 -0800
X-CSE-ConnectionGUID: gIAmG4VwT5e8QFjhLqwdlQ==
X-CSE-MsgGUID: diuEVkxLSi+SVCoWM5mRTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197685765"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.219])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 10:24:26 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Dec 2025 20:24:23 +0200 (EET)
To: Lizhi Hou <lizhi.hou@amd.com>
cc: Hans de Goede <hansg@kernel.org>, ogabbay@kernel.org, 
    quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com, 
    LKML <linux-kernel@vger.kernel.org>, max.zhen@amd.com, 
    sonal.santan@amd.com, mario.limonciello@amd.com, 
    platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org, 
    Shyam-sundar.S-k@amd.com, VinitKumar.Shukla@amd.com
Subject: Re: [PATCH V2 2/2] accel/amdxdna: Add IOCTL to retrieve realtime
 NPU power estimate
In-Reply-To: <20251211175802.1760860-3-lizhi.hou@amd.com>
Message-ID: <9dd39a22-608b-12a8-ffa1-3937be62f47d@linux.intel.com>
References: <20251211175802.1760860-1-lizhi.hou@amd.com> <20251211175802.1760860-3-lizhi.hou@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 11 Dec 2025, Lizhi Hou wrote:

> The AMD PMF driver provides an interface to obtain realtime power
> estimates for the NPU. Expose this information to userspace through a
> new DRM_IOCTL_AMDXDNA_GET_INFO parameter, allowing applications to query
> the current NPU power level.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>  drivers/accel/amdxdna/aie2_pci.c        | 29 +++++++++++++++++++++++++
>  drivers/accel/amdxdna/aie2_pci.h        | 18 +++++++++++++++
>  drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 ++-
>  3 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 81a8e4137bfd..4a2c7addcd79 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>  #include <drm/gpu_scheduler.h>
> +#include <linux/amd-pmf-io.h>
>  #include <linux/cleanup.h>
>  #include <linux/errno.h>
>  #include <linux/firmware.h>
> @@ -777,6 +778,31 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
>  	return ret;
>  }
>  
> +static int aie2_get_sensors(struct amdxdna_client *client,
> +			    struct amdxdna_drm_get_info *args)
> +{
> +	struct amdxdna_drm_query_sensor sensor = { 0 };

= {} is enough to initialize to defaults.

> +	int ret;
> +
> +	if (args->buffer_size < sizeof(sensor))
> +		return -EINVAL;
> +
> +	ret = AIE2_GET_PMF_NPU_DATA(npu_power, sensor.input);
> +	if (ret)
> +		return ret;
> +	sensor.type = AMDXDNA_SENSOR_TYPE_POWER;
> +	sensor.unitm = -3;
> +	snprintf(sensor.label, sizeof(sensor.label), "Total Power");
> +	snprintf(sensor.units, sizeof(sensor.units), "mW");

scnprintf() x2

> +
> +	if (copy_to_user(u64_to_user_ptr(args->buffer), &sensor, sizeof(sensor)))
> +		return -EFAULT;
> +
> +	args->buffer_size = sizeof(sensor);
> +
> +	return 0;
> +}
> +
>  static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>  {
>  	struct amdxdna_drm_hwctx_entry *tmp __free(kfree) = NULL;
> @@ -980,6 +1006,9 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>  	case DRM_AMDXDNA_QUERY_CLOCK_METADATA:
>  		ret = aie2_get_clock_metadata(client, args);
>  		break;
> +	case DRM_AMDXDNA_QUERY_SENSORS:
> +		ret = aie2_get_sensors(client, args);
> +		break;
>  	case DRM_AMDXDNA_QUERY_HW_CONTEXTS:
>  		ret = aie2_get_hwctx_status(client, args);
>  		break;
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index c6b5cf4ae5c4..edf6f2e00dea 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -46,6 +46,24 @@
>  	pci_resource_len(NDEV2PDEV(_ndev), (_ndev)->xdna->dev_info->mbox_bar); \
>  })
>  
> +#if IS_ENABLED(CONFIG_AMD_PMF)
> +#define AIE2_GET_PMF_NPU_DATA(field, val) \
> +({ \
> +	struct amd_pmf_npu_metrics _npu_metrics; \
> +	int _ret; \
> +	_ret = amd_pmf_get_npu_data(&_npu_metrics); \
> +	val = _ret ? U32_MAX : _npu_metrics.field; \

#include needed for U32_MAX.

Unrelated to this patch, this files is also missing include for at least 
SZ_* (so likely works by chance) and types.h.

> +	(_ret); \
> +})

Please try to align the backslashed to right so that they don't mix up 
with the code.

Add an empty lines after variables declaration (with the backslash in 
the end obviously) so these almost looks like "normal" coding style.

> +#else
> +#define SENSOR_DEFAULT_npu_power	U32_MAX
> +#define AIE2_GET_PMF_NPU_DATA(field, val) \
> +({ \
> +	val = SENSOR_DEFAULT_##field; \
> +	(-EOPNOTSUPP); \
> +})
> +#endif
> +
>  enum aie2_smu_reg_idx {
>  	SMU_CMD_REG = 0,
>  	SMU_ARG_REG,
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 1973ab67721b..643ebd387074 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -32,9 +32,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>   * 0.4: Support getting resource information
>   * 0.5: Support getting telemetry data
>   * 0.6: Support preemption
> + * 0.7: Support getting power data
>   */
>  #define AMDXDNA_DRIVER_MAJOR		0
> -#define AMDXDNA_DRIVER_MINOR		6
> +#define AMDXDNA_DRIVER_MINOR		7
>  
>  /*
>   * Bind the driver base on (vendor_id, device_id) pair and later use the
> 

-- 
 i.

