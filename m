Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E703793D0
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563487; cv=none; b=bokWLP7s6pVgIRSzrfaFQB5WiOTBOzjWpqF5upMfTCzXJ+72Ym+PmlTzHNdeftm2kk9Lf6xzNF5K2QCEgQCEomvB70r53T2rMOp5sUJkxHYvHg1mTCWTEijQsmnBWIk+XwaiK2RCrp9SGrAKmSfxg7JpJiOary3PGssmCDh7+E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563487; c=relaxed/simple;
	bh=VBA2UHJ7nS/0wlmYvr0XuD4V840XUMfEHlwQ5KWJ1hg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=biSEVfik6UbG2WRTMnd5FSo/0i48MAwfz/vn+5y4M6/voX53yClvPTbTJPNqRjlXnOSXKCnqo6gDP5qkXS/hlVtRXt8JYdZFjI4vgrCsR/T1uGSZf73fW60x4W1gSjyzhH8azoHXnIi+yKzuv/SAbdabtS3wAuQjqYfD7RfJzec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAb02s7p; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAb02s7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786563486; x=1818099486;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=VBA2UHJ7nS/0wlmYvr0XuD4V840XUMfEHlwQ5KWJ1hg=;
  b=lAb02s7pLakuu+BGR+Vs6WEYaHNRC2vA5FzDyi7/FePtE1dUvaeuU0FZ
   aHz1rqOR6kb3ERuHZKbE+gzidAiWjgdYNalP5P6LLWge4eErOsEctfcyz
   j4xSkz/Tj1wC1Um5luhEmIMuv6xFR2TWNfS6eGefMCwahEXG4lu0GvRVr
   QqGAZEy2p7uQBz4VV0wsyd/gEVjoT3v/UI9B5VLfb+5YIkpGXdpXVlkEA
   9r4qEaaCDgkuN4triqiGX91BbzemepB3qDUNCdUPdTbx2PPgP2Tj0Pgyb
   1R0Wo0zYExj+fcg8+5WJOGTVSeJPTvhF9fiMHyelOynC5EY8eq1GBOHf6
   w==;
X-CSE-ConnectionGUID: oKDmA9uMRAeGJLoBo2/LEw==
X-CSE-MsgGUID: QjHcrBIpTF6YUAtD7rMbJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104515423"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="104515423"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:38:06 -0700
X-CSE-ConnectionGUID: QwhVREsiR/W0msCwfp+n+g==
X-CSE-MsgGUID: x1BP2Q6OTpy35VTsm+ZjiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="263779969"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:38:05 -0700
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
	james.ausmus@intel.com
Subject: [PATCH v2 10/10] drm/xe/vsec: Update PMT internal access for CRI
Date: Wed, 12 Aug 2026 12:37:51 -0700
Message-ID: <20260812193742.2170188-22-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xe access the PMT infrastructure directly. The current usage
is supported ONLY by BMG devices.

CRI has further requirements for access.

Add a new API to access the GUID based on the platform.
Use the API get the GUID for each device.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h |  4 +++-
 drivers/gpu/drm/xe/xe_debugfs.c  | 30 +++++++++++++-----------
 drivers/gpu/drm/xe/xe_hwmon.c    | 10 ++++++--
 drivers/gpu/drm/xe/xe_pcode.c    | 10 ++++++--
 drivers/gpu/drm/xe/xe_vsec.c     | 40 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h     |  1 +
 6 files changed, 77 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index fc9c9cb6a830..683bf401dc9d 100644
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
@@ -25,6 +25,8 @@
 #define CRI_DISCOVERY_OFFSET		(SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
 #define CRI_TELEMETRY_OFFSET		(SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
 
+#define CRI_PUNIT_TELEMETRY_GUID	XE_REG(CRI_DISCOVERY_OFFSET + 0x4)
+
 #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
 #define BMG_G2_RESIDENCY_OFFSET		(0x530)
 #define BMG_G6_RESIDENCY_OFFSET		(0x538)
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index eeceab4a9901..67903c854562 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -97,11 +97,16 @@ static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
 				   u32 offset, const char *name, struct drm_printer *p)
 {
 	u64 residency = 0;
+	u32 guid;
 	int ret;
 
-	ret = xe_pmt_telem_read(xe->drm.dev,
-				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
-				&residency, offset, sizeof(residency));
+	guid = xe_vsec_get_guid(xe);
+	if (!guid) {
+		drm_warn(&xe->drm, "PMT device is not powered\n");
+		return;
+	}
+
+	ret = xe_pmt_telem_read(xe->drm.dev, guid, &residency, offset, sizeof(residency));
 	if (ret != sizeof(residency)) {
 		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
 		return;
@@ -706,23 +711,22 @@ void xe_debugfs_register(struct xe_device *xe)
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
 
-	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
-		drm_debugfs_create_files(debugfs_residencies,
-					 ARRAY_SIZE(debugfs_residencies),
-					 root, minor);
-	}
-
 	/*
-	 * Pcode version read from PMT is currently only supported on CRI and BMG platforms in PF
-	 * mode, as both platforms support the necessary telemetry read mechanism and have a fixed
-	 * PUNIT_VERSION_OFFSET.
+	 * Residencies and Pcode version read from PMT is currently only supported on CRI and BMG
+	 * platforms in PF mode.  Both platforms support the necessary telemetry read mechanism
+	 * and have a fixed offses for the required data.
 	 * Attempting this access on other platforms must be verified before enabling support.
 	 */
 	if (!IS_SRIOV_VF(xe) &&
-	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE))
+	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE)) {
+		drm_debugfs_create_files(debugfs_residencies,
+					 ARRAY_SIZE(debugfs_residencies),
+					 root, minor);
+
 		drm_debugfs_create_files(pcode_info_debugfs,
 					 ARRAY_SIZE(pcode_info_debugfs),
 					 root, minor);
+	}
 
 	debugfs_create_file("forcewake_all", 0400, root, xe,
 			    &forcewake_all_fops);
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 49f7e0edcc4b..db48594fcc1f 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -517,9 +517,15 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 
 	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
 		u64 pmt_val;
+		u32 guid;
 
-		ret = xe_pmt_telem_read(hwmon->xe->drm.dev,
-					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+		guid = xe_vsec_get_guid(hwmon->xe);
+		if (!guid) {
+			drm_warn(&hwmon->xe->drm, "PMT device is not powered\n");
+			*energy = 0;
+			return;
+		}
+		ret = xe_pmt_telem_read(hwmon->xe->drm.dev, guid,
 					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
 		if (ret != sizeof(pmt_val)) {
 			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index ccc3bdeed6bb..1b93fda1f41a 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -368,11 +368,17 @@ ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
 int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
 {
 	int ret = 0;
+	u32 guid;
 
 	guard(xe_pm_runtime)(xe);
 
-	ret = xe_pmt_telem_read(xe->drm.dev,
-				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
+	guid = xe_vsec_get_guid(xe);
+	if (!guid) {
+		xe_warn(xe, "PMT device is not powered\n");
+		return -ENODATA;
+	}
+
+	ret = xe_pmt_telem_read(xe->drm.dev, guid,
 				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
 	if (ret != sizeof(*version)) {
 		xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index bed5103dac19..a56f988d13eb 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -565,6 +565,46 @@ static void vsec_disable_late_bind_work(void *arg)
 		xe_pm_runtime_put(xe);
 }
 
+u32 xe_vsec_get_guid(struct xe_device *xe)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	u32 guid;
+
+	/*
+	 * Both supported platforms (BMG, CRI) require the remapper callback to
+	 * access data. CRI needs it for the GUID.
+	 */
+	if (!xe->soc_remapper.set_telem_region)
+		return 0;
+
+	/* caller must ensure correct power state */
+	if (!xe_pm_runtime_get_if_active(xe))
+		return 0;
+
+	mutex_lock(&xe->pmt.lock);
+
+	switch (xe->info.platform) {
+	case XE_BATTLEMAGE:
+		guid = xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID);
+		break;
+
+	case XE_CRESCENTISLAND:
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+		guid = xe_mmio_read32(mmio, CRI_PUNIT_TELEMETRY_GUID);
+		break;
+
+	default:
+		guid = 0;
+		drm_err(&xe->drm, "Unsupported platform: %u\n", xe->info.platform);
+		break;
+	}
+
+	mutex_unlock(&xe->pmt.lock);
+	xe_pm_runtime_put(xe);
+
+	return guid;
+}
+
 /**
  * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
  * interface
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
index c4a1e2fc67d8..43c3e9f227c5 100644
--- a/drivers/gpu/drm/xe/xe_vsec.h
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -10,6 +10,7 @@ struct device;
 struct xe_device;
 
 int xe_vsec_init(struct xe_device *xe);
+u32 xe_vsec_get_guid(struct xe_device *xe);
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
 
 #endif
-- 
2.43.0

