Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A6B379C21
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563486; cv=none; b=FWvdRRQqtWAWAoTQVjzbAJt9o9InlceMIuRlhQ7S2KTp/QQvzD7GA9kW22RMc3sT8oGpGPGZGrNSpszcbBgEkEES99c5uQdk93T42y54WB/4XYDMhSYDAesMsUuMXdNhowX6EwmAXtajADkgzPcZ2HFiS/oFYL50/cdyy1WF5+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563486; c=relaxed/simple;
	bh=IOKiwFNjbHnbqCsb82mD1JMVgqjKGrZNaDwRxHQr+8c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZiXzqVFN6GQsqvuy3+MHsAmUnhl6pwD6sO7ZTqY7HIAXk28ajNeSd7eKy+uM9qcyJc1sWNsgCrdZFYxCjgbvarH7Y/13c0uvIrQG4r9kQA1uBbQiYb7VGU2hoIlKcn6N+b0XRFFDBy7gKdkOQjGLO2LEDC4gwN0kCZ9uLcCMF/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V64FoE33; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V64FoE33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786563485; x=1818099485;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=IOKiwFNjbHnbqCsb82mD1JMVgqjKGrZNaDwRxHQr+8c=;
  b=V64FoE33VG403Qhh4/1FzMTIrySTGyzzBZIwlvkB6pDRHxzKLnJPk2LC
   L5EnpQunQKXHSUMu1ZirMWFS6sqCXyn7KW8LvqqwLOqpZeoYoQeZvNMdJ
   HR77KFmWFqyONo2w3fY5sBoXNhZ4FyxZytFROZSxnNK9XbFwjLUyfFNvl
   grw5aAe1PpHkkf8WfDTOrEOsLeh+PCvfBmA6zSgsN8floxh8GJJBk4iP3
   ix9U9SHu+8PbVej1QsTS2asRtJMCW4XY2TOqEoLKyfERwsNB1+YGKGZTe
   Zz1a03I4Fg+T4JSlITtyPsSXuNd29+xu2o6U9VHD+gELLZaR9zj1c9E5U
   A==;
X-CSE-ConnectionGUID: C7Mwg+OQSMyQ7sPy6Si4HA==
X-CSE-MsgGUID: kvwRYxDVQmy9I7gJrK/o5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104515416"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="104515416"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:38:04 -0700
X-CSE-ConnectionGUID: DR4XfSPkT6avLkFzQin2LA==
X-CSE-MsgGUID: BOVt9lt0QM+zr+oXouWtgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="263779960"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:38:04 -0700
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
Subject: [PATCH v2 09/10] drm/xe/vsec: Support late bind fw information
Date: Wed, 12 Aug 2026 12:37:50 -0700
Message-ID: <20260812193742.2170188-21-michael.j.ruhl@intel.com>
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

CRI FW is loaded on power on.  Because of this, access to
the FW cannot be done until it is running.

Update the XE PMT probe and access to check for late bind
devices, verify, and wait for the appropriate FW state
before probe or access.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_vsec.c         | 142 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vsec.h         |   2 +-
 4 files changed, 144 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 71111ad32465..df6716a975fb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1139,7 +1139,9 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
-	xe_vsec_init(xe);
+	err = xe_vsec_init(xe);
+	if (err)
+		goto err_unregister_display;
 
 	err = xe_sriov_init_late(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 3f1a70813a99..5d9e6e66c665 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -468,6 +468,10 @@ struct xe_device {
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
index 578d59048b39..bed5103dac19 100644
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
@@ -17,6 +18,7 @@
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_pm.h"
+#include "xe_sysctrl.h"
 #include "xe_vsec.h"
 
 #include "regs/xe_pmt.h"
@@ -162,6 +164,14 @@ enum capability {
 	WATCHER,
 };
 
+/*
+ * Late bind will delay 100msec for up to 20 seconds
+ */
+#define VSEC_LATE_BIND_DELAY_MSEC	(100)
+#define VSEC_LATE_BIND_RETRY		(200)
+
+static void cri_late_bind_probe(struct xe_device *xe);
+
 static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
 {
 	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
@@ -272,6 +282,56 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	return -ENODEV;
 }
 
+#define WAITING_FOR_SYCTLR
+#ifdef WAITING_FOR_SYCTLR
+static bool xe_is_oobmsm_fw_ready(struct xe_device *xe)
+{
+	return true;
+}
+#endif
+
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
@@ -318,6 +378,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 		goto dev_exit;
 	}
 
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
+
 	mutex_lock(&xe->pmt.lock);
 
 	/* set SoC re-mapper index register based on GUID memory region */
@@ -327,6 +392,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	mutex_unlock(&xe->pmt.lock);
 
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 dev_exit:
@@ -374,6 +440,10 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
 	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
 
 	xe_pm_runtime_get(xe);
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
 	mutex_lock(&xe->pmt.lock);
 
 	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
@@ -381,6 +451,8 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
 	memcpy_fromio(reg, disc_addr, sizeof(*reg));
 
 	mutex_unlock(&xe->pmt.lock);
+
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 dev_exit:
@@ -416,6 +488,10 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
 	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
 
 	xe_pm_runtime_get(xe);
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
 	mutex_lock(&xe->pmt.lock);
 
 	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
@@ -425,6 +501,9 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
 	mutex_unlock(&xe->pmt.lock);
 	xe_pm_runtime_put(xe);
 
+runtime_exit:
+	xe_pm_runtime_put(xe);
+
 dev_exit:
 	drm_dev_exit(idx);
 
@@ -454,12 +533,44 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
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
+	 * If was work was cancelled while it was still pending, we need to
+	 * take care of releasing the runtime reference
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
@@ -467,30 +578,44 @@ void xe_vsec_init(struct xe_device *xe)
 
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
 		if (!xe->soc_remapper.set_telem_region)
-			return;
+			return 0;
 		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
 		info->priv_data = &xe_bmg_pmt_cb;
 		break;
 
 	case XE_VSEC_CRI:
 		if (!xe->soc_remapper.set_telem_region)
-			return;
+			return 0;
 		xe->pmt.base_offset = CRI_TELEMETRY_OFFSET;
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
@@ -498,5 +623,10 @@ void xe_vsec_init(struct xe_device *xe)
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

