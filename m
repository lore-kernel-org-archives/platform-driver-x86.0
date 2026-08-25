Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CDE3ECBC7
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 10:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653016; cv=none; b=iTiJ7AB79QVDs2fwRV/OtE+KziyH901ZMP7D95tjXHs54udarxwfgHeGXn6fxtMJIPntPUyN4tv5FciZwx35yb5q9DyHcPLFAZUQKWa0K4Csrv+txgMs8S4kDy5xN/1u6Rd479d/qmOBEdpo1G7fpKWQ1JovYFPR4E1Bfoxcs04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653016; c=relaxed/simple;
	bh=XAwUQtfJQEbqhGkWmBovnG/CsIP97JrfFkszBCiBlfQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sZaHI7UdSQSpxN3jchf++sb+HVAxr+yrxEDTNGOoJ7wPFv9vQdMWB/OeXsFdeJbDWYJrW7AIX3tk7KzMJ34IDuYSwoqVUCcGPS0OPxkk41aM8vTarr0BjVEZZAqaY9NRbg2yCBhc0u2wVkHAHaE+klqwk5kaVZPEXxUN2TUUByw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGUZEhC4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGUZEhC4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787653014; x=1819189014;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XAwUQtfJQEbqhGkWmBovnG/CsIP97JrfFkszBCiBlfQ=;
  b=nGUZEhC4SeTFFDSpW0NgeCz2CFnnQvoXcPU1+HHkuRs5iTOfMwj9eGUU
   bE/+qRU98jTlDUEmt4XZLou978asBskQgWXglzBhKlx5Zc+clP0EaP0EO
   wFbXB4uqk1HpHOSuW4G/6u8ZnL0IAdtzeAzZcyKAH11wY6ksk4gfHJPzw
   5jHrL6JCRKiCV0GatRGi/8iS1fVEt8MSU+zERT2ir+uuydM5SFc5AhL9h
   FJ/UhYCLHnj00s4KGXQY6w1u9K7FAcx80afcwUuBwBkfnJ/nrQvP6gQA2
   zCE9J+1Y+lfMxi1ZfCEeyKed4P945rm3EZA10/WPoZq92chQU/luM2qll
   w==;
X-CSE-ConnectionGUID: BihL8A72TnOwcmLbqo8iCQ==
X-CSE-MsgGUID: mKmFxi6tRC+oKRhnMYHKQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98452142"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="98452142"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 03:16:54 -0700
X-CSE-ConnectionGUID: BE6TfPomTdS9DFWUGXV1tg==
X-CSE-MsgGUID: HXrV9viPRYG2LTXjNkDisA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="265940104"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 03:16:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 25 Aug 2026 13:16:46 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
    anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
    matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v3 10/10] drm/xe/vsec: Update PMT internal access for
 CRI
In-Reply-To: <20260824162317.2450380-22-michael.j.ruhl@intel.com>
Message-ID: <c55e12ed-ed2b-ca35-c44a-7a115bec3d03@linux.intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com> <20260824162317.2450380-22-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Aug 2026, Michael J. Ruhl wrote:

> Xe access the PMT infrastructure directly. The current usage
> is supported ONLY by BMG devices.
> 
> CRI has further requirements for access.
> 
> Add a new API to access the GUID based on the platform.
> Use the API get the GUID for each device.
> 
> Minor cleanup for a newly unused parameter (mmio).
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_pmt.h     |  4 ++-
>  drivers/gpu/drm/xe/xe_debugfs.c      | 44 ++++++++++++-------------
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_hwmon.c        | 10 ++++--
>  drivers/gpu/drm/xe/xe_pcode.c        | 10 ++++--
>  drivers/gpu/drm/xe/xe_vsec.c         | 48 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vsec.h         |  1 +
>  7 files changed, 92 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index fc9c9cb6a830..683bf401dc9d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -10,7 +10,7 @@
>  #define BMG_PMT_BASE_OFFSET		0xDB000
>  #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
>  
> -#define PUNIT_TELEMETRY_GUID		XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
> +#define BMG_PUNIT_TELEMETRY_GUID	XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
>  #define BMG_ENERGY_STATUS_PMT_OFFSET	(0x30)
>  #define	ENERGY_PKG			REG_GENMASK64(31, 0)
>  #define	ENERGY_CARD			REG_GENMASK64(63, 32)
> @@ -25,6 +25,8 @@
>  #define CRI_DISCOVERY_OFFSET		(SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
>  #define CRI_TELEMETRY_OFFSET		(SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
>  
> +#define CRI_PUNIT_TELEMETRY_GUID	XE_REG(CRI_DISCOVERY_OFFSET + 0x4)
> +
>  #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
>  #define BMG_G2_RESIDENCY_OFFSET		(0x530)
>  #define BMG_G6_RESIDENCY_OFFSET		(0x538)
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 28135f84e286..12476549164d 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -21,7 +21,6 @@
>  #include "xe_gt_printk.h"
>  #include "xe_guc_ads.h"
>  #include "xe_hw_engine.h"
> -#include "xe_mmio.h"
>  #include "xe_pagefault.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
> @@ -97,15 +96,20 @@ static void xe_fault_inject_debugfs_register(struct xe_device *xe,
>  	}
>  }
>  
> -static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
> -				   u32 offset, const char *name, struct drm_printer *p)
> +static void read_residency_counter(struct xe_device *xe, u32 offset, const char *name,
> +				   struct drm_printer *p)
>  {
>  	u64 residency = 0;
> +	u32 guid;
>  	int ret;
>  
> -	ret = xe_pmt_telem_read(xe->drm.dev,
> -				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> -				&residency, offset, sizeof(residency));
> +	guid = xe_vsec_get_guid(xe);
> +	if (!guid) {
> +		drm_warn(&xe->drm, "PMT device is not powered\n");
> +		return;
> +	}
> +
> +	ret = xe_pmt_telem_read(xe->drm.dev, guid, &residency, offset, sizeof(residency));
>  	if (ret != sizeof(residency)) {
>  		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
>  		return;
> @@ -244,13 +248,12 @@ static int pcode_info(struct seq_file *m, void *data)
>  static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>  {
>  	struct xe_device *xe;
> -	struct xe_mmio *mmio;
>  	struct drm_printer p;
>  
>  	xe = node_to_xe(m->private);
>  	p = drm_seq_file_printer(m);
>  	guard(xe_pm_runtime)(xe);
> -	mmio = xe_root_tile_mmio(xe);
> +
>  	static const struct {
>  		u32 offset;
>  		const char *name;
> @@ -264,7 +267,7 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>  	};
>  
>  	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
> -		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
> +		read_residency_counter(xe, residencies[i].offset, residencies[i].name, &p);
>  
>  	return 0;
>  }
> @@ -272,13 +275,11 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>  static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
>  {
>  	struct xe_device *xe;
> -	struct xe_mmio *mmio;
>  	struct drm_printer p;
>  
>  	xe = node_to_xe(m->private);
>  	p = drm_seq_file_printer(m);
>  	guard(xe_pm_runtime)(xe);
> -	mmio = xe_root_tile_mmio(xe);
>  
>  	static const struct {
>  		u32 offset;
> @@ -290,7 +291,7 @@ static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
>  	};
>  
>  	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
> -		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
> +		read_residency_counter(xe, residencies[i].offset, residencies[i].name, &p);
>  
>  	return 0;
>  }
> @@ -710,23 +711,22 @@ void xe_debugfs_register(struct xe_device *xe)
>  				 ARRAY_SIZE(debugfs_list),
>  				 root, minor);
>  
> -	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
> -		drm_debugfs_create_files(debugfs_residencies,
> -					 ARRAY_SIZE(debugfs_residencies),
> -					 root, minor);
> -	}
> -
>  	/*
> -	 * Pcode version read from PMT is currently only supported on CRI and BMG platforms in PF
> -	 * mode, as both platforms support the necessary telemetry read mechanism and have a fixed
> -	 * PUNIT_VERSION_OFFSET.
> +	 * Residencies and Pcode version read from PMT is currently only supported on CRI and BMG
> +	 * platforms in PF mode.  Both platforms support the necessary telemetry read mechanism
> +	 * and have a fixed offsets for the required data.
>  	 * Attempting this access on other platforms must be verified before enabling support.
>  	 */
>  	if (!IS_SRIOV_VF(xe) &&
> -	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE))
> +	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE)) {
> +		drm_debugfs_create_files(debugfs_residencies,
> +					 ARRAY_SIZE(debugfs_residencies),

ARRAY_SIZE() has also own include which is missing from this file (looks 
it's already used in this file and if there's no special include policy in 
xe, it would be time to finally add the include).

> +					 root, minor);
> +
>  		drm_debugfs_create_files(pcode_info_debugfs,
>  					 ARRAY_SIZE(pcode_info_debugfs),
>  					 root, minor);
> +	}
>  
>  	debugfs_create_file("forcewake_all", 0400, root, xe,
>  			    &forcewake_all_fops);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5d9e6e66c665..7acc57f6d4fd 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -472,6 +472,8 @@ struct xe_device {
>  		struct delayed_work work;
>  		/** @pmt.retry_count: late-bind probe retry */
>  		u32 retry_count;
> +		/** @pmt.punit_guid_cache: cache of the PUINT GUID */
> +		u32 punit_guid_cache;
>  	} pmt;
>  
>  	/** @soc_remapper: SoC remapper object */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5284cab6703d..c4b44eb4b220 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -517,9 +517,15 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>  
>  	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
>  		u64 pmt_val;
> +		u32 guid;
>  
> -		ret = xe_pmt_telem_read(hwmon->xe->drm.dev,
> -					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +		guid = xe_vsec_get_guid(hwmon->xe);
> +		if (!guid) {
> +			drm_warn(&hwmon->xe->drm, "PMT device is not powered\n");
> +			*energy = 0;
> +			return;
> +		}
> +		ret = xe_pmt_telem_read(hwmon->xe->drm.dev, guid,
>  					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
>  		if (ret != sizeof(pmt_val)) {
>  			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index e1b8062541a9..7831dd597794 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -366,11 +366,17 @@ ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
>  int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
>  {
>  	int ret = 0;
> +	u32 guid;
>  
>  	guard(xe_pm_runtime)(xe);
>  
> -	ret = xe_pmt_telem_read(xe->drm.dev,
> -				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
> +	guid = xe_vsec_get_guid(xe);
> +	if (!guid) {
> +		xe_warn(xe, "PMT device is not powered\n");
> +		return -ENODATA;
> +	}
> +
> +	ret = xe_pmt_telem_read(xe->drm.dev, guid,
>  				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
>  	if (ret != sizeof(*version)) {
>  		xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index edc20c24137e..5ebb4ee9ef08 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -564,6 +564,54 @@ static void vsec_disable_late_bind_work(void *arg)
>  		xe_pm_runtime_put(xe);
>  }
>  
> +u32 xe_vsec_get_guid(struct xe_device *xe)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	u32 guid;
> +
> +	/*
> +	 * Both supported platforms (BMG, CRI) require the remapper callback to
> +	 * access data. CRI needs it for the GUID.
> +	 */
> +	if (!xe->soc_remapper.set_telem_region)
> +		return 0;
> +
> +	/* caller must ensure correct power state */
> +	if (!xe_pm_runtime_get_if_active(xe))

The comments sounds like it's a coding error somewhere if we're not 
active at this point, which would be easier to catch if there would be 
WARN_ON_ONCE() instead of silently hiding the problem.

(I don't know much about xe, so please keep it in mind when considering 
my comments on xe side code.)

-- 
 i.

> +		return 0;
> +
> +	mutex_lock(&xe->pmt.lock);
> +
> +	if (xe->pmt.punit_guid_cache) {
> +		guid = xe->pmt.punit_guid_cache;
> +		goto unlock;
> +	}
> +
> +	switch (xe->info.platform) {
> +	case XE_BATTLEMAGE:
> +		guid = xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID);
> +		break;
> +
> +	case XE_CRESCENTISLAND:
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		guid = xe_mmio_read32(mmio, CRI_PUNIT_TELEMETRY_GUID);
> +		break;
> +
> +	default:
> +		guid = 0;
> +		drm_err(&xe->drm, "Unsupported platform: %u\n", xe->info.platform);
> +		break;
> +	}
> +
> +	xe->pmt.punit_guid_cache = guid;
> +
> +unlock:
> +	mutex_unlock(&xe->pmt.lock);
> +	xe_pm_runtime_put(xe);
> +
> +	return guid;
> +}
> +
>  /**
>   * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>   * interface
> diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
> index c4a1e2fc67d8..43c3e9f227c5 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.h
> +++ b/drivers/gpu/drm/xe/xe_vsec.h
> @@ -10,6 +10,7 @@ struct device;
>  struct xe_device;
>  
>  int xe_vsec_init(struct xe_device *xe);
> +u32 xe_vsec_get_guid(struct xe_device *xe);
>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
>  
>  #endif
> 
