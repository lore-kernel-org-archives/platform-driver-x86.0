Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348D04334BC
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 18:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187103; cv=none; b=RvDp+XCbjvtwlrIhMMa5fdYQ4HhRTipMPht9EHd6AZFKT+PPee7r1WwYoF3rBlt2z9+fnoY+76vCstCSu1ABTY57pvQtrgwCEJZrIYBzlAF651WdE7hHJcZBMOykHlWGpfKd7yox2+kmpIt04aCDJdI73S69+1ZP7rhkhGzXiK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187103; c=relaxed/simple;
	bh=y38fbeqok2jDGfM/h3Q1Ct+bFzkT3W9nbH5O7kQngaQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifxLOpUmlINTKSaICAocEOsBYnuABamJSlzVxtb5/mroXd7+jscTBz+Zyr7mCE45+uxcSitYN+EplWx8l4bgrw3D3YIII7ljhC9HRM034f/O0wPJM4RbrVEUsbugO2tjgATYUlI7081tgRvC4hkC5Jxvo56D0gwJOZAySmzc50c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvzD7hdf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvzD7hdf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790187100; x=1821723100;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=y38fbeqok2jDGfM/h3Q1Ct+bFzkT3W9nbH5O7kQngaQ=;
  b=TvzD7hdfBsqGeoE9w+Vzsz0lFCgGiuEekatV9dzdSifH2elMGM8M0PHE
   Gpf91H6DLvNBbLgFp6fKEogBaC80UL4jXB5/Vb3W+POUhT1m3DubW1qsc
   2BFiBgCeO2LlsjPjTRlpSdufNz+hb1gjnbHpaYro4+spqT2VlRhqsIrI7
   8MxogFmYtgxpJM7nR9O6UARoiR4ICjEavs9ZT6yEXautG2NuFToxbkbnP
   Ep/7+5akFdCJKjbqPBgEV+I/BANbo9RhgZbQlc0wwHGUFiCP6uV9Nt57G
   Px4ANEJIs38F5yDRkNij45KwbH2v2AvgfQzR8BdzxtiVQZc4TZ2HWD6vU
   Q==;
X-CSE-ConnectionGUID: DfcPDM0OT4C70odDmPkfIg==
X-CSE-MsgGUID: V7sWVXxsRpGbbl/SAgXq+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93416061"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="93416061"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:11:25 -0700
X-CSE-ConnectionGUID: xRpPtEB1SSSUBX10V0JyVw==
X-CSE-MsgGUID: ph6jZVe0T9+fbZRyiXYuHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4980730"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:11:26 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com,
	anoop.c.vijay@intel.com,
	badal.nilawar@intel.com,
	matthew.d.roper@intel.com,
	james.ausmus@intel.com,
	karthik.poosa@intel.com
Subject: [PATCH v11 18/20] drm/xe/vsec: Add PMT GUID internal access
Date: Wed, 23 Sep 2026 11:11:33 -0700
Message-ID: <20260923181115.2514193-40-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xe accesses the PMT infrastructure directly. The current usage is
supported ONLY by BMG devices.

CRI has further requirements for access.

Add the platform id to the GUID register define and use that for the
register access.

Add an API to allow access the GUID based on the platform.

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h     |  4 ++-
 drivers/gpu/drm/xe/xe_debugfs.c      |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_hwmon.c        |  2 +-
 drivers/gpu/drm/xe/xe_pcode.c        |  2 +-
 drivers/gpu/drm/xe/xe_vsec.c         | 45 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h         |  1 +
 7 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index 2f6658395587..fb5b5a8648ba 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -10,7 +10,7 @@
 #define BMG_PMT_BASE_OFFSET		0xDB000
 #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
 
-#define PUNIT_TELEMETRY_GUID		XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
+#define BMG_PUNIT_TELEMETRY_GUID	XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
 #define BMG_ENERGY_STATUS_PMT_OFFSET	(0x30)
 #define	ENERGY_PKG			REG_GENMASK64(31, 0)
 #define	ENERGY_CARD			REG_GENMASK64(63, 32)
@@ -24,6 +24,8 @@
 /* for CRI discovery and telemetry are in an indexed window */
 #define CRI_PMT_OFFSET			(SOC_BASE + XE_PMT_BASE_OFFSET)
 
+#define CRI_PUNIT_TELEMETRY_GUID	XE_REG(CRI_PMT_OFFSET + 0x4)
+
 #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
 #define BMG_G2_RESIDENCY_OFFSET		(0x530)
 #define BMG_G6_RESIDENCY_OFFSET		(0x538)
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 80f62634fae5..958fb717640a 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -153,7 +153,7 @@ static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
 	int ret;
 
 	ret = xe_pmt_telem_read(xe->drm.dev,
-				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+				xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
 				&residency, offset, sizeof(residency));
 	if (ret != sizeof(residency)) {
 		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8f5cc5d65419..ad6b4a5375ca 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -493,6 +493,8 @@ struct xe_device {
 		struct delayed_work work;
 		/** @pmt.retry_count: late-bind probe retry */
 		u32 retry_count;
+		/** @pmt.punit_guid_cache: cache of the PUINT GUID */
+		u32 punit_guid_cache;
 	} pmt;
 
 	/** @soc_remapper: SoC remapper object */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5edeac961ec3..2032066d5f49 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -514,7 +514,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 		u64 pmt_val;
 
 		ret = xe_pmt_telem_read(hwmon->xe->drm.dev,
-					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+					xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
 					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
 		if (ret != sizeof(pmt_val)) {
 			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 266deecbb100..8c901e54f384 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -369,7 +369,7 @@ int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
 	guard(xe_pm_runtime)(xe);
 
 	ret = xe_pmt_telem_read(xe->drm.dev,
-				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
+				xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PUNIT_TELEMETRY_GUID),
 				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
 	if (ret != sizeof(*version)) {
 		xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 5384fef5e5ac..1ed904ec1496 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -579,6 +579,51 @@ static void vsec_disable_late_bind_work(void *arg)
 		xe_pm_runtime_put(xe);
 }
 
+int xe_vsec_get_guid(struct xe_device *xe, u32 *guid)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	int ret = 0;
+
+	xe_assert(xe, !IS_SRIOV_VF(xe));
+
+	if (!xe_pm_runtime_get_if_active(xe))
+		return -ENODATA;
+
+	mutex_lock(&xe->pmt.lock);
+
+	if (xe->pmt.punit_guid_cache) {
+		*guid = xe->pmt.punit_guid_cache;
+		goto unlock;
+	}
+
+	switch (xe->info.platform) {
+	case XE_BATTLEMAGE:
+		*guid = xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID);
+		break;
+
+	case XE_CRESCENTISLAND:
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+		*guid = xe_mmio_read32(mmio, CRI_PUNIT_TELEMETRY_GUID);
+		break;
+
+	default:
+		*guid = 0;
+		drm_err(&xe->drm, "Unsupported platform: %u\n", xe->info.platform);
+		ret = -EINVAL;
+		break;
+	}
+
+	/* the GUID is static, read once and cache for all requests */
+	if (*guid)
+		xe->pmt.punit_guid_cache = *guid;
+
+unlock:
+	mutex_unlock(&xe->pmt.lock);
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
 /**
  * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
  * interface
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
index c4a1e2fc67d8..50187fdc1207 100644
--- a/drivers/gpu/drm/xe/xe_vsec.h
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -10,6 +10,7 @@ struct device;
 struct xe_device;
 
 int xe_vsec_init(struct xe_device *xe);
+int xe_vsec_get_guid(struct xe_device *xe, u32 *guid);
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
 
 #endif
-- 
2.43.0

