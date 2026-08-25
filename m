Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C458438F941
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787652113; cv=none; b=N0ROM7NPq4Q83KDnkqGm0zbpp9aDVxW07Unm0FjZmHUQMqI736y4alk4I7yTHVznCS68ntqMR3OtEMhCeuWkZSOcclKH1ytMEvEBjW6k2/T/GNIofPefc5ieQA6m56lcplT27smcp+5xyG473Zl6Lw6iByYK4Ph1Zjk51luvbsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787652113; c=relaxed/simple;
	bh=YxaGARli0gtpIXtPCgC64XiFHNRJ2TaYmCCJ15DOB10=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=k5odVdlQfoLmDX7/SU28vYIkFqq9aQWeVby93PKDeiUaDfFNZMypdgjWPy+a4mLlj23lSA4kTYjXjKg49qcdeaA7K/EXezB2kVnR7u74FWh5Kf/Wc0Vdut1v/bfZQP0acALf30k3pgMaqN8E96rdWexNSXQ0zogRIY5mHd2+xLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eb0Xgqgv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eb0Xgqgv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787652112; x=1819188112;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YxaGARli0gtpIXtPCgC64XiFHNRJ2TaYmCCJ15DOB10=;
  b=Eb0XgqgvDEba8SQ9a8IE4JPSyKaYSEUxVdFsscTtzmz5wF0Fg74UN97Q
   e1B3KAuaL+6FGaX5B3SZQaHW2AreC6rGNr4uj8cNPyla6QiWtPvGtSweP
   suGOh3vH5hebInOQeyzyLeBkB1c2WfTPP4L3MvSnX+9k4Gqg2B3ID/oME
   4jPeFdyp7SGTTBLojVbzc+7SuZ/X0iq1y6rPf5/548TRRkerlvMYyBHcv
   vR+W7Nhb5U7gZO7qMsbZO4fV6YsCFQNATEJgHxdaWozoV2Wb9kANDug4x
   CnpJ1JVngGKmbVHDGRe31huTumkE7fgH8B78O91Mf1g+abcJREqKKbc+b
   A==;
X-CSE-ConnectionGUID: fJDNx631S5CbuyFvPZtZyw==
X-CSE-MsgGUID: L1l0Q1/FRaW+EBAhfN1fvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88243466"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="88243466"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 03:01:51 -0700
X-CSE-ConnectionGUID: kmOFvwqaSqqU1anoxu+fiw==
X-CSE-MsgGUID: P5MZKd8oSBCpzQM2qI1m5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="305479649"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 03:01:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 25 Aug 2026 13:01:43 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
    anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
    matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v3 09/10] drm/xe/vsec: Support late bind fw information
In-Reply-To: <20260824162317.2450380-21-michael.j.ruhl@intel.com>
Message-ID: <2ddf97e4-ce07-e435-bb5a-605ddcdcdeef@linux.intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com> <20260824162317.2450380-21-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Aug 2026, Michael J. Ruhl wrote:

> CRI FW is loaded on power on.  Because of this, access to
> the FW cannot be done until it is running.
> 
> Update the XE PMT probe and access to check for late bind
> devices, verify, and wait for the appropriate FW state
> before probe or access.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |   4 +-
>  drivers/gpu/drm/xe/xe_device_types.h |   4 +
>  drivers/gpu/drm/xe/xe_vsec.c         | 141 +++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_vsec.h         |   2 +-
>  4 files changed, 143 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 74d566693dfd..bf02f881095f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1140,7 +1140,9 @@ int xe_device_probe(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_sanitize_freq(gt);
>  
> -	xe_vsec_init(xe);
> +	err = xe_vsec_init(xe);
> +	if (err)
> +		goto err_unregister_display;
>  
>  	err = xe_sriov_init_late(xe);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 3f1a70813a99..5d9e6e66c665 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -468,6 +468,10 @@ struct xe_device {
>  		struct mutex lock;
>  		/** @pmt.base_offset: device specific base offset */
>  		u64 base_offset;
> +		/** @pmt.work: support late-bind probe */
> +		struct delayed_work work;

Not sure if xe driver has some strange policy on headers due to their 
love for local headers... but if there isn't, this one doesn't have a 
direct include in this file.

> +		/** @pmt.retry_count: late-bind probe retry */
> +		u32 retry_count;
>  	} pmt;
>  
>  	/** @soc_remapper: SoC remapper object */
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 578d59048b39..edc20c24137e 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -3,6 +3,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/cleanup.h>
> +#include <linux/delay.h>
>  #include <linux/errno.h>
>  #include <linux/intel_vsec.h>
>  #include <linux/module.h>
> @@ -17,6 +18,7 @@
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
>  #include "xe_pm.h"
> +#include "xe_sysctrl.h"
>  #include "xe_vsec.h"
>  
>  #include "regs/xe_pmt.h"
> @@ -162,6 +164,14 @@ enum capability {
>  	WATCHER,
>  };
>  
> +/*
> + * Late bind will delay 100msec for up to 20 seconds
> + */
> +#define VSEC_LATE_BIND_DELAY_MSEC	(100)
> +#define VSEC_LATE_BIND_RETRY		(200)

Remove the parenthesis?

> +
> +static void cri_late_bind_probe(struct xe_device *xe);
> +
>  static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
>  {
>  	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
> @@ -272,6 +282,56 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>  	return -ENODEV;
>  }
>  
> +#define WAITING_FOR_SYCTLR
> +#ifdef WAITING_FOR_SYCTLR

It seems Rodrigo also noted this. Looks debug leftover or something along 
those lines to me.

> +static bool xe_is_oobmsm_fw_ready(struct xe_device *xe)
> +{
> +	return true;

Returning unconditionally true causes some dead code below on the caller 
side.

> +}
> +#endif
> +
> +static void cri_late_bind_probe_work(struct work_struct *work)
> +{
> +	struct xe_device *xe = container_of(work, struct xe_device, pmt.work.work);
> +
> +	if (xe_is_oobmsm_fw_ready(xe)) {
> +		cri_late_bind_probe(xe);
> +		xe_pm_runtime_put(xe);
> +		return;
> +	}
> +	xe->pmt.retry_count++;
> +
> +	/* wait up to 20 seconds */
> +	if (xe->pmt.retry_count == VSEC_LATE_BIND_RETRY) {
> +		drm_warn(&xe->drm, "PMT probe: Late Binding failed to complete\n");
> +		xe_pm_runtime_put(xe);
> +		return;
> +	}
> +
> +	if (!schedule_delayed_work(&xe->pmt.work, msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC)))
> +		xe_pm_runtime_put(xe);
> +}
> +
> +static bool wait_for_fw(struct xe_device *xe)
> +{
> +	int retries = VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
> +
> +	if (xe->info.platform != XE_CRESCENTISLAND)
> +		return true;
> +
> +	while (retries--) {
> +		if (xe_is_oobmsm_fw_ready(xe))
> +			return true;
> +
> +		msleep(VSEC_LATE_BIND_DELAY_MSEC);
> +	}
> +
> +	drm_warn(&xe->drm, "Late Binding failed to complete\n");
> +
> +	return false;
> +}
> +
>  /*
>   * xe_pmt_telem_read is a callback API.  I.e this can be accessed external to
>   * XE driver (PMT driver scope).  Because of this, DRM hotplug needs to be
> @@ -318,6 +378,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  		goto dev_exit;
>  	}
>  
> +	if (!wait_for_fw(xe)) {
> +		ret = -ENODATA;
> +		goto runtime_exit;
> +	}
> +
>  	mutex_lock(&xe->pmt.lock);
>  
>  	/* set SoC re-mapper index register based on GUID memory region */
> @@ -327,6 +392,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
>  
>  	mutex_unlock(&xe->pmt.lock);
>  
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
>  
>  dev_exit:
> @@ -374,6 +440,10 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
>  	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
>  
>  	xe_pm_runtime_get(xe);
> +	if (!wait_for_fw(xe)) {
> +		ret = -ENODATA;
> +		goto runtime_exit;
> +	}
>  	mutex_lock(&xe->pmt.lock);
>  
>  	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> @@ -381,6 +451,8 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
>  	memcpy_fromio(reg, disc_addr, sizeof(*reg));
>  
>  	mutex_unlock(&xe->pmt.lock);
> +
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
>  
>  dev_exit:
> @@ -416,6 +488,10 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
>  	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
>  
>  	xe_pm_runtime_get(xe);
> +	if (!wait_for_fw(xe)) {
> +		ret = -ENODATA;
> +		goto runtime_exit;
> +	}
>  	mutex_lock(&xe->pmt.lock);
>  
>  	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> @@ -423,6 +499,8 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
>  	memcpy_toio(disc_addr, &reg, sizeof(reg));
>  
>  	mutex_unlock(&xe->pmt.lock);
> +
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
>  
>  dev_exit:
> @@ -454,12 +532,44 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
>  	return vsec_platforms[xe->info.platform];
>  }
>  
> +static void cri_late_bind_probe(struct xe_device *xe)
> +{
> +	struct intel_vsec_platform_info *info;
> +	struct device *dev = xe->drm.dev;
> +	enum xe_vsec platform;
> +
> +	platform = get_platform_info(xe);
> +	if (platform != XE_VSEC_CRI)
> +		return;
> +
> +	info = &xe_vsec_info[platform];
> +	if (!info->headers)
> +		return;
> +
> +	info->priv_data = &xe_cri_pmt_cb;
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	intel_vsec_register(dev, info);
> +}
> +
> +static void vsec_disable_late_bind_work(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	/*
> +	 * If was work was cancelled while it was still pending, we need to

Fix grammar.

> +	 * take care of releasing the runtime reference

Add .

> +	 */
> +	if (disable_delayed_work_sync(&xe->pmt.work))
> +		xe_pm_runtime_put(xe);
> +}
> +
>  /**
>   * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>   * interface
>   * @xe: valid xe instance
>   */
> -void xe_vsec_init(struct xe_device *xe)
> +int xe_vsec_init(struct xe_device *xe)
>  {
>  	struct intel_vsec_platform_info *info;
>  	struct device *dev = xe->drm.dev;
> @@ -467,30 +577,44 @@ void xe_vsec_init(struct xe_device *xe)
>  
>  	platform = get_platform_info(xe);
>  	if (platform == XE_VSEC_UNKNOWN)
> -		return;
> +		return 0;
>  
>  	info = &xe_vsec_info[platform];
>  	if (!info->headers)
> -		return;
> +		return 0;
>  
>  	switch (platform) {
>  	case XE_VSEC_BMG:
>  		if (!xe->soc_remapper.set_telem_region)
> -			return;
> +			return 0;
>  		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
>  		info->priv_data = &xe_bmg_pmt_cb;
>  		break;
>  
>  	case XE_VSEC_CRI:
>  		if (!xe->soc_remapper.set_telem_region)
> -			return;
> +			return 0;
>  		xe->pmt.base_offset = CRI_TELEMETRY_OFFSET;
> +
> +		xe->pmt.retry_count = 0;
> +		INIT_DELAYED_WORK(&xe->pmt.work, cri_late_bind_probe_work);
> +
> +		xe_pm_runtime_get_noresume(xe);
> +		if (!xe_is_oobmsm_fw_ready(xe)) {
> +			schedule_delayed_work(&xe->pmt.work,
> +					      msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
> +			return devm_add_action_or_reset(xe->drm.dev,
> +							vsec_disable_late_bind_work,
> +							xe);
> +		}
> +
>  		info->priv_data = &xe_cri_pmt_cb;
>  		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
>  		break;
>  
>  	default:
> -		break;
> +		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
> +		return 0;
>  	}
>  
>  	/*
> @@ -498,5 +622,10 @@ void xe_vsec_init(struct xe_device *xe)
>  	 * resources.
>  	 */
>  	intel_vsec_register(dev, info);
> +
> +	if (platform == XE_VSEC_CRI)
> +		xe_pm_runtime_put(xe);
> +
> +	return 0;
>  }
>  MODULE_IMPORT_NS("INTEL_VSEC");
> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
> index a25b4e6e681b..c4a1e2fc67d8 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.h
> +++ b/drivers/gpu/drm/xe/xe_vsec.h
> @@ -9,7 +9,7 @@
>  struct device;
>  struct xe_device;
>  
> -void xe_vsec_init(struct xe_device *xe);
> +int xe_vsec_init(struct xe_device *xe);
>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
>  
>  #endif
> 

-- 
 i.

