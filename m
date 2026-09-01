Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10954A2078
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 19:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290886; cv=none; b=RQybI7bZ6wijLvgptJRpzlEMcIt7uzhElCrJSiwzKYhID5txIssz3nMbo35Mzg/N3rgc4UTMjBIHy+vU/nKieBOVhQl6e9XLf3afOmH5o2RloasCVaQQpotozq95zXtrbP6vHw26qL0unfKa2OPytkypj8qScgNkkWQQ3Yp6p4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290886; c=relaxed/simple;
	bh=cywkLwiw2vQiT9sQyCBam/BXcZXCfDfBnR1wd5wcn8w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pM51+y4M4UXxtWMRpvsNiFDAlhMS1Uss/g6k6lyhOHZ0pgHtHTq099UM4524CyD2O+w7c4NpYXZ6S4cAjtgc9YjbX6YTM+Bd+SF9OL1I73k07N8HJhXVq/HcKgj4XDG0llG0cKSCuqqurR9/6kj+beQGwEblshwzrM1VQBneZ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQUrV5fp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQUrV5fp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788290885; x=1819826885;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=cywkLwiw2vQiT9sQyCBam/BXcZXCfDfBnR1wd5wcn8w=;
  b=AQUrV5fp2MaLZK/vcIK2QMFejESCdtKRTP0uaQbEIJ+npJG6IH1Yuq8T
   sR/s6QZboMbhoph+q18MeVb/YCXXcv1PIsjps65cxn6N+2I5rXYZx3BBa
   QViZcX3B+yQ0Id3NOT+KGFV0oJ59cafnOrZLVnEoM5xiMCTQb8AzgsSKK
   8isDa9a/pJMsIjoOlT/aQE2LAXfzvFTflzt/2CdDYRbSI6BpC7mnAX2ee
   OH9BiqiLR4sMm/gFoWUXD1moGGQgjkRP9MujIi5+BcFY1lL+3jD8je79N
   0vMnimUvY1tiRazMCBJpGIZj2XXYq0Z/oh1xy86SHSKPMC0Xpt17UVLpV
   g==;
X-CSE-ConnectionGUID: 1mEedxDWRO++UeI25d2ckQ==
X-CSE-MsgGUID: v4TtHhTZTVy+2fbnLF9rPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88762546"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="88762546"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:28:04 -0700
X-CSE-ConnectionGUID: Y5mQx+nrQ6K55m3eNKyF1w==
X-CSE-MsgGUID: 3+AcrJ5nSAOcwu0b5nouvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="269776811"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:28:04 -0700
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
Subject: [PATCH v4 15/18] drm/xe/vsec: Support late bind fw information
Date: Tue,  1 Sep 2026 12:27:50 -0700
Message-ID: <20260901192736.626777-35-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192736.626777-20-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CRI FW is loaded on power on.  Because of this, access to
the FW cannot be done until it is running.

Update the XE PMT probe and access to check for late bind
devices, verify, and wait for the appropriate FW state
before probe or access.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h |   5 +
 drivers/gpu/drm/xe/xe_vsec.c         | 136 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vsec.h         |   2 +-
 4 files changed, 138 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 396d02eb2af8..0dffabed2e99 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1140,7 +1140,9 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
-	xe_vsec_init(xe);
+	err = xe_vsec_init(xe);
+	if (err)
+		goto err_unregister_display;
 
 	err = xe_sriov_init_late(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 3f1a70813a99..69e052ac5a82 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -7,6 +7,7 @@
 #define _XE_DEVICE_TYPES_H_
 
 #include <linux/pci.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
@@ -468,6 +469,10 @@ struct xe_device {
 		struct mutex lock;
 		/** @pmt.base_offset: device specific base offset */
 		u64 base_offset;
+		/** @pmt.work: support late-bind probe */
+		struct delayed_work work;
+		/** @pmt.retry_count: late-bind probe retry */
+		u32 retry_count;
 	} pmt;
 
 	/** @soc_remapper: SoC remapper object */
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index e58fea788ace..8284977377bd 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -3,6 +3,7 @@
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/intel_vsec.h>
 #include <linux/module.h>
@@ -18,6 +19,7 @@
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_pm.h"
+#include "xe_sysctrl.h"
 #include "xe_vsec.h"
 
 #include "regs/xe_pmt.h"
@@ -162,7 +164,15 @@ enum capability {
 	WATCHER,
 };
 
-static int xe_guid_decode(u32 guid, int *index, u32 *offset)
+/*
+ * Late bind will delay 100msec for up to 20 seconds
+ */
+#define VSEC_LATE_BIND_DELAY_MSEC	100
+#define VSEC_LATE_BIND_RETRY		200
+
+static void cri_late_bind_probe(struct xe_device *xe);
+
+static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
 {
 	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
 	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
@@ -270,6 +280,48 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	return -ENODEV;
 }
 
+static void cri_late_bind_probe_work(struct work_struct *work)
+{
+	struct xe_device *xe = container_of(work, struct xe_device, pmt.work.work);
+
+	if (xe_is_oobmsm_fw_ready(xe)) {
+		cri_late_bind_probe(xe);
+		xe_pm_runtime_put(xe);
+		return;
+	}
+
+	xe->pmt.retry_count++;
+
+	/* wait up to 20 seconds */
+	if (xe->pmt.retry_count == VSEC_LATE_BIND_RETRY) {
+		drm_warn(&xe->drm, "PMT probe: Late Binding failed to complete\n");
+		xe_pm_runtime_put(xe);
+		return;
+	}
+
+	if (!schedule_delayed_work(&xe->pmt.work, msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC)))
+		xe_pm_runtime_put(xe);
+}
+
+static bool wait_for_fw(struct xe_device *xe)
+{
+	int retries = VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
+
+	if (xe->info.platform != XE_CRESCENTISLAND)
+		return true;
+
+	while (retries--) {
+		if (xe_is_oobmsm_fw_ready(xe))
+			return true;
+
+		msleep(VSEC_LATE_BIND_DELAY_MSEC);
+	}
+
+	drm_warn(&xe->drm, "Late Binding failed to complete\n");
+
+	return false;
+}
+
 /*
  * xe_pmt_telem_read is a callback API.  I.e this can be accessed external to
  * XE driver (PMT driver scope).  Because of this, DRM hotplug needs to be
@@ -316,6 +368,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 		goto dev_exit;
 	}
 
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
+
 	mutex_lock(&xe->pmt.lock);
 
 	/* set SoC re-mapper index register based on GUID memory region */
@@ -325,6 +382,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	mutex_unlock(&xe->pmt.lock);
 
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 dev_exit:
@@ -367,6 +425,10 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
 	disc_addr += inst + offset;
 
 	xe_pm_runtime_get(xe);
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
 	mutex_lock(&xe->pmt.lock);
 
 	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
@@ -374,6 +436,8 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
 	memcpy_fromio(reg, disc_addr, sizeof(*reg));
 
 	mutex_unlock(&xe->pmt.lock);
+
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 dev_exit:
@@ -404,6 +468,10 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
 	disc_addr += inst + offset;
 
 	xe_pm_runtime_get(xe);
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
 	mutex_lock(&xe->pmt.lock);
 
 	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
@@ -411,6 +479,8 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
 	memcpy_toio(disc_addr, &reg, sizeof(reg));
 
 	mutex_unlock(&xe->pmt.lock);
+
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 dev_exit:
@@ -442,12 +512,44 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
 	return vsec_platforms[xe->info.platform];
 }
 
+static void cri_late_bind_probe(struct xe_device *xe)
+{
+	struct intel_vsec_platform_info *info;
+	struct device *dev = xe->drm.dev;
+	enum xe_vsec platform;
+
+	platform = get_platform_info(xe);
+	if (platform != XE_VSEC_CRI)
+		return;
+
+	info = &xe_vsec_info[platform];
+	if (!info->headers)
+		return;
+
+	info->priv_data = &xe_cri_pmt_cb;
+	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+
+	intel_vsec_register(dev, info);
+}
+
+static void vsec_disable_late_bind_work(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	/*
+	 * If the queued work is canceled, the runtime reference needs to be
+	 * released here.
+	 */
+	if (disable_delayed_work_sync(&xe->pmt.work))
+		xe_pm_runtime_put(xe);
+}
+
 /**
  * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
  * interface
  * @xe: valid xe instance
  */
-void xe_vsec_init(struct xe_device *xe)
+int xe_vsec_init(struct xe_device *xe)
 {
 	struct intel_vsec_platform_info *info;
 	struct device *dev = xe->drm.dev;
@@ -455,30 +557,45 @@ void xe_vsec_init(struct xe_device *xe)
 
 	platform = get_platform_info(xe);
 	if (platform == XE_VSEC_UNKNOWN)
-		return;
+		return 0;
 
 	info = &xe_vsec_info[platform];
 	if (!info->headers)
-		return;
+		return 0;
 
 	switch (platform) {
 	case XE_VSEC_BMG:
 		if (IS_SRIOV_VF(xe))
-			return;
+			return 0;
 		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
 		info->priv_data = &xe_bmg_pmt_cb;
 		break;
 
 	case XE_VSEC_CRI:
 		if (IS_SRIOV_VF(xe))
-			return;
+			return 0;
+
 		xe->pmt.base_offset = CRI_PMT_OFFSET;
+
+		xe->pmt.retry_count = 0;
+		INIT_DELAYED_WORK(&xe->pmt.work, cri_late_bind_probe_work);
+
+		xe_pm_runtime_get_noresume(xe);
+		if (!xe_is_oobmsm_fw_ready(xe)) {
+			schedule_delayed_work(&xe->pmt.work,
+					      msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
+			return devm_add_action_or_reset(xe->drm.dev,
+							vsec_disable_late_bind_work,
+							xe);
+		}
+
 		info->priv_data = &xe_cri_pmt_cb;
 		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
 		break;
 
 	default:
-		break;
+		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
+		return 0;
 	}
 
 	/*
@@ -486,5 +603,10 @@ void xe_vsec_init(struct xe_device *xe)
 	 * resources.
 	 */
 	intel_vsec_register(dev, info);
+
+	if (platform == XE_VSEC_CRI)
+		xe_pm_runtime_put(xe);
+
+	return 0;
 }
 MODULE_IMPORT_NS("INTEL_VSEC");
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
index a25b4e6e681b..c4a1e2fc67d8 100644
--- a/drivers/gpu/drm/xe/xe_vsec.h
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -9,7 +9,7 @@
 struct device;
 struct xe_device;
 
-void xe_vsec_init(struct xe_device *xe);
+int xe_vsec_init(struct xe_device *xe);
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
 
 #endif
-- 
2.43.0

