Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063B94B0E58
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 20:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589592; cv=none; b=ZQn8IzZ6rthJGN7ku1Uw6jYBKp3UOiYuggIEni1AXg6hVlH91+otY3wta/xYWrOkveSF4E4OnNbGNEVAQiqvUE5DAgQlDrjMJfA8pf0p7KlNMXfwdWIFpUGSGeDXKHD71Pvy0JQh6QZZI7PBcnsANyl9SQ1UCKWLFoWOdLppVGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589592; c=relaxed/simple;
	bh=AYAbMMQGIt8Z+pcGH3wEn5HT+fnGmH3mR6QGbt6hO5I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGMueJwkgzKY/vhvOU81hVyMKKXgqmyw9GsXRHdk/eAXIus371Y2PYDnDt0iVNy8dYIs42D3GN5Z3x3i7M1GtPSU74AthvMKq1JBFYdS7PEKs1BeIljbHg9n5rtSkxar4MxwJGdlpSvKwZ3liaWsakVvLAfZdHlgskFg7/huMHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJjSYLVh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJjSYLVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789589586; x=1821125586;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=AYAbMMQGIt8Z+pcGH3wEn5HT+fnGmH3mR6QGbt6hO5I=;
  b=gJjSYLVh/h3y5s1rxC//m7J6g7OAVLtsR4L7L5mpClgsIoHR+85ZuA+A
   OlnaBPD4S+LHiohRcdf+STM6qRUvNGeCpOsisY0Ddakp7mCy89R0K8tB1
   oKA2ALXlBSe0INCKv/+Bsg+qcVKguQ7LiGoOj8QQliuOamKfYc9t58AxP
   KIbht3TzYDaruWxYYWmQhBn2kp+L4Z+BQ7lWPRadrbg/SAH/HNubCGRvm
   QFVEGpSJLTPD8eDN4h8UvKStbvVVcdcghjSrDCmLE/o2OdnApY3L4jgXJ
   gVkty2r7UDdb1OU4+ZQLstac7pRYpa2mqY6EUtb3YzlHBgfLBo8uQrCvE
   A==;
X-CSE-ConnectionGUID: kXpmPnEoTb6cv7Y0/LoMsQ==
X-CSE-MsgGUID: Jrpjt9KcQgmROJ0r5hoozQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100296219"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100296219"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:12:02 -0700
X-CSE-ConnectionGUID: j99OCrP/TZaZUOLHAwLEWQ==
X-CSE-MsgGUID: S+OGJ7WuR4GjmOLz+ejOhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277574050"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:12:03 -0700
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
Subject: [PATCH v9 18/20] drm/xe/vsec: Add PMT GUID internal access
Date: Wed, 16 Sep 2026 13:11:56 -0700
Message-ID: <20260916201139.2374531-40-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
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
 drivers/gpu/drm/xe/xe_vsec.c         | 46 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h         |  1 +
 7 files changed, 55 insertions(+), 4 deletions(-)

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
index f905ef51df65..dd2965e7a162 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -578,6 +578,52 @@ static void vsec_disable_late_bind_work(void *arg)
 		xe_pm_runtime_put(xe);
 }
 
+int xe_vsec_get_guid(struct xe_device *xe, u32 *guid)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	int ret = 0;
+
+	if (IS_SRIOV_VF(xe))
+		return -EINVAL;
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

