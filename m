Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208179;
	b=uzwv+hidVn5fEJcBy7YDhKKbukzNt9EcbuufPqhWiGKDS6vlgL/1yFMDWOx0dNo01AAt
	 io3fJbf9ULIoc0YKe6sxas3PfyJTHa7MJbEc00D88pW1LQhx2Q6Y0pjxZDr4o1tlvHUDV
	 RutnXj767Je1IQD+P3Yps9jCsmOuYDZUxVrdFMCX0+NEzNTUIiIRmvzZf47CpbB3Le9b3
	 Zcp+f0Sg/4F1IdQaM3RTfsU/jZN4xBpxFvvm66l+w+l2JoXNJB8X3ylgWQqZiJq2mVLJD
	 l/VJjwKwA3EiYFtjchkh6Ncpjdr8kArpjS0PPUCRriXIU3k6Hmd80o7ZLEYGv6v/+cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208179;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M+1keKxbRJ5gQXdqYd3RQ6BqHApqscwIa7FjjER3x14=;
	b=KZ0GxbcaW3EGQT6Sxdl3OMYvPp99oxzSYvxxp9mMhUJAG+fE5M+xuBW1+EEObmT+puwG
	 tZOqM6twNxL0vV0Iq4dGXPWuEi1ql+qlHkfrP6rhu4D9wnVg7lWL0d2vaRANxbb/GBhJz
	 qCsRzLgVpEQtAkzwsh7pnW1F5LK/UNdlLSjall/R/R0CJZSqxk70zBRN0Vk4htmm7RRj7
	 4LaSZJJfgDfAdRCw0mxrllo94YU4ZcvRWAJzaMy9CdUjNrPNZpDijbq1zQqf0ttAm+VQe
	 BPvANpKFECv36ig7okA3f+BnaPjdVFeRK9oNnyn8AcHz/GmoGKwbphWrI+dEzbqZ7rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XAz1yWbu;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064E960A260F
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 20:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064E960A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XAz1yWbu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795208178; x=1826744178;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NOHOd62rM2YffZCVbd0bVmaCokG1ibq/N2INmQVMSfE=;
  b=XAz1yWbusdxe7q1vDsbqG2mJslyIYi1WoY2h2/l772sKSm8X0LHquwWP
   7juRrPSGyOHpHPOowjuTCnfKRP0PaNupJZbk+Erjlxyc6+DWG2MYeTRIs
   jHv4TNGDUp8K5hiEDPgUmDZ34BQDBNp9MzrvsCknnymbjxG8o0FKKzjSm
   asHvVg0Y92TWstg0v1yYVc0yTXUIWYrm+SYwlBdxeUa6BVncuI4XQuIjh
   O1dEr6lWalRZcHMCmzknWNmRTwqVlDNiq4Ysq7eGBA9b8+YhDDMZ93MhO
   jitcTLAf2jcM9/9d+O7njiB3OX2ujw+ggD+n8abM7W9RkyNNSHgQSFWsg
   w==;
X-CSE-ConnectionGUID: Vqm8QApgTFO3kSDgXYcSXQ==
X-CSE-MsgGUID: yEzpR+kXS1qwIuavOz0wVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136422"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136422"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:51 -0800
X-CSE-ConnectionGUID: ohwnjgpFR9OmYFgr6sxkGA==
X-CSE-MsgGUID: Bk/QzYDvTumTOM+6KyIW+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10908736"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:49 -0800
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
Subject: [PATCH v21 16/19] drm/xe/vsec: Add PMT GUID internal access
Date: Fri, 20 Nov 2026 12:55:56 -0800
Message-ID: <20261120205540.1220643-37-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
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
 drivers/gpu/drm/xe/regs/xe_pmt.h     |  4 +-
 drivers/gpu/drm/xe/xe_debugfs.c      |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_hwmon.c        |  2 +-
 drivers/gpu/drm/xe/xe_pcode.c        |  2 +-
 drivers/gpu/drm/xe/xe_vsec.c         | 59 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h         |  1 +
 7 files changed, 68 insertions(+), 4 deletions(-)

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
index 1a74a7106462..342182d5ecda 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -156,7 +156,7 @@ static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
 	int ret;
 
 	ret = xe_pmt_telem_read(xe->drm.dev,
-				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+				xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
 				&residency, offset, sizeof(residency));
 	if (ret != sizeof(residency)) {
 		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index d1bdd3a872a8..be6feaff4baa 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -492,6 +492,8 @@ struct xe_device {
 		struct delayed_work work;
 		/** @pmt.retry_count: late-bind probe retry */
 		u32 retry_count;
+		/** @pmt.punit_guid_cache: cache of the PUNIT GUID */
+		u32 punit_guid_cache;
 	} pmt;
 
 	/** @soc_remapper: SoC remapper object */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 9cbb65891aa4..55ff56a39599 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -605,7 +605,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
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
index 26ed4e85614f..851d02d6ed25 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -639,6 +639,65 @@ static void cri_late_bind_probe(struct xe_device *xe)
 	intel_vsec_register(dev, info);
 }
 
+/**
+ * xe_vsec_get_guid - Get and cache the PUNIT guid value
+ * @xe: valid xe device
+ * @guid: returned guid
+ *
+ * Return:
+ * * -ENODATA device is not active
+ * * -EINVAL unsupported platform
+ * * 0 success
+ */
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
+		goto unlock;
+	}
+
+	/* the GUID is static, read once and cache for all requests */
+	if (*guid) {
+		xe->pmt.punit_guid_cache = *guid;
+	} else {
+		drm_err(&xe->drm, "Invalid GUID: 0x%x\n", *guid);
+		ret = -EINVAL;
+	}
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
index e925dba4158b..88e6f6a9e4dd 100644
--- a/drivers/gpu/drm/xe/xe_vsec.h
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -11,6 +11,7 @@ struct xe_device;
 
 void xe_vsec_init(struct xe_device *xe);
 void xe_vsec_remove(struct xe_device *xe);
+int xe_vsec_get_guid(struct xe_device *xe, u32 *guid);
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
 
 #endif
-- 
2.43.0

