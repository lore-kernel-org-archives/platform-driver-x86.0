Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141187;
	b=Rh13sd0TUTivPKEY432qvObYaJ+UW7XjlTcUUuFIlRfmCyHe7jzY/fAIodE+6JkQvr/+
	 o1EPrW6CFFx1zZ8uOLDhHPScUao3AcDpuglmyE/qf5GCvDJy+3cFSpI04lwg6Eohe8cqa
	 oZh1oGpzN6Zye28uOI5O8MlpKyTt7HYQg7mBLlHQSaWLCpG9A9d2B4AHsUWlR6moA0L89
	 y+3w9BaTfcKtFrfaYUoqvLnsTvLcesc9mPP5i/hxanPMutMoaHo90AJdzG9L/saVyqX6b
	 YVvThJ2RGrJcSpfoSh9Z+u6fPj5sut+pi4kRWLZ+J/uHYGefQyjFgTuytahJq0HIcrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141187;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2MqwHm7uxwlR0+eAzLhsZzfXvQemLhqDvaKmW/eyhhc=;
	b=ip1I4ySBvR+S3fOmWLOktyCUZPLtcyUGhxJ3Zlwy1mqpUmWQIWPYgXk4TUr8E5qQ4B74
	 t04k6iQTvo4y6NklNL/RHawFvdmlkDcAEQ1T0jaOw43EQooJ2RXuPtm3fYRNRmAymWWmv
	 20ISBrXZRhtl9YTycT/OjRcEyIkb1gE6Hlq8gfr7doiQfS//+GZ7cog2fx6N5+CuvnbNM
	 ATPxyX7P5rAozfTUW84u7iEIfiL4MFTFePCBR1gPtxKKgxFk4ImtW69CuSUoWAS6Xu1Y1
	 1L+0WI94lRvTA4CXAcsSr4hBt/n/+Aa60+BfVhLmerEE3wDpdxGEbnkeZeETXrseP3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ncXoDEHI;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAA8606A332
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 02:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FAA8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ncXoDEHI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795141187; x=1826677187;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LHVr5on/tW5JVifb40XGw+g1KvFKoMExHdPXswmh71M=;
  b=ncXoDEHI8o8Iqf8L+WUpnkZTna4sa48ZQeqZvGDGmG0/aHPmDfQ6QeTT
   QYygUC5ML9XHodmKEmlLteKhOdQYKNuCLKn11+8g1O36Hsc4MLwKeA5vA
   vKseKvY9efSsjnzqSTIDC9f37g9H0HBjCRpj86LWiA5upVR9ayIbcYjTv
   F7SquAXJVEy5wTb2aBOpMY3gK1A8YZXjiEQs+RZg+/xRQkvEjlAsmGzfI
   Qv7ISWKwAFsYDZChvXuoKr0QRBrne8jUjKcGfTpz9ASnxNYg95BEuLPMJ
   0e9lYB6GvFAz8LLs+j3S2MIgwYqvn67iEl01sNNRDESjaGlxILYUgP2YA
   A==;
X-CSE-ConnectionGUID: nol9I11NTvW+ITN18l0Fqw==
X-CSE-MsgGUID: 5gYU32a8QiqE0ixDxgj8Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3898464"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3898464"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:46 -0800
X-CSE-ConnectionGUID: 3wzJRh+BSmaRgJwxxje7lQ==
X-CSE-MsgGUID: hxsumsgiQvmGQkORrJ0bFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10487150"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:46 -0800
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
Subject: [PATCH v20 15/19] drm/xe/vsec: Support late bind fw information
Date: Thu, 19 Nov 2026 18:19:45 -0800
Message-ID: <20261120021929.473553-36-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120021929.473553-21-michael.j.ruhl@intel.com>
References: <20261120021929.473553-21-michael.j.ruhl@intel.com>
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

CRI FW is loaded on power on.  Because of this, access to the FW cannot
be done until it is running.

Update the XE PMT probe and access to check for late bind devices,
verify, and wait for the appropriate FW state before probe or access.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   3 +
 drivers/gpu/drm/xe/xe_device_types.h |   5 ++
 drivers/gpu/drm/xe/xe_vsec.c         | 122 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vsec.h         |   1 +
 4 files changed, 126 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ba1f49a56794..90e96a602091 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1113,6 +1113,7 @@ int xe_device_probe(struct xe_device *xe)
 	return 0;
 
 err_unregister_display:
+	xe_vsec_remove(xe);
 	xe_display_unregister(xe);
 	drm_dev_unregister(&xe->drm);
 
@@ -1121,6 +1122,8 @@ int xe_device_probe(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
+	xe_vsec_remove(xe);
+
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 28b1669a14d8..d1bdd3a872a8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -7,6 +7,7 @@
 #define _XE_DEVICE_TYPES_H_
 
 #include <linux/pci.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
@@ -487,6 +488,10 @@ struct xe_device {
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
index 4c54f44d89ad..b6add588c093 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -3,6 +3,7 @@
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/log2.h>
 #include <linux/intel_vsec.h>
@@ -19,6 +20,7 @@
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_pm.h"
+#include "xe_sysctrl.h"
 #include "xe_vsec.h"
 
 #include "regs/xe_pmt.h"
@@ -174,6 +176,14 @@ enum capability {
 	WATCHER,
 };
 
+/*
+ * Late bind will delay 100msec for up to 20 seconds
+ */
+#define VSEC_LATE_BIND_DELAY_MSEC	100
+#define VSEC_LATE_BIND_RETRY		200
+
+static void cri_late_bind_probe(struct xe_device *xe);
+
 static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
 {
 	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
@@ -282,6 +292,53 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	return -ENODEV;
 }
 
+static void cri_late_bind_probe_work(struct work_struct *work)
+{
+	struct xe_device *xe = container_of(work, struct xe_device, pmt.work.work);
+
+	if (xe_sysctrl_is_oobmsm_fw_ready(xe)) {
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
+	if (!queue_delayed_work(system_freezable_wq, &xe->pmt.work,
+				msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC)))
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
+		if (xe_sysctrl_is_oobmsm_fw_ready(xe))
+			return true;
+
+		msleep(VSEC_LATE_BIND_DELAY_MSEC);
+		if (signal_pending(current)) {
+			drm_warn(&xe->drm, "Late Binding interrupted\n");
+			return false;
+		}
+	}
+
+	drm_warn(&xe->drm, "Late Binding failed to complete\n");
+
+	return false;
+}
+
 /**
  * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a buffer
  * @dev: valid Xe device
@@ -346,6 +403,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 		goto dev_exit;
 	}
 
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
+
 	scoped_guard(mutex, &xe->pmt.lock) {
 		u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
 
@@ -358,6 +420,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 			xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
 	}
 
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 dev_exit:
@@ -465,6 +528,10 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
 	disc_addr += inst + offset;
 
 	xe_pm_runtime_get(xe);
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
 
 	scoped_guard(mutex, &xe->pmt.lock) {
 		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
@@ -472,6 +539,7 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
 		*reg = readl(disc_addr);
 	}
 
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 	drm_dev_exit(idx);
@@ -499,6 +567,10 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
 	disc_addr += inst + offset;
 
 	xe_pm_runtime_get(xe);
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
 
 	scoped_guard(mutex, &xe->pmt.lock) {
 		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
@@ -506,6 +578,7 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
 		writel(reg, disc_addr);
 	}
 
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 	drm_dev_exit(idx);
@@ -542,6 +615,25 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
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
+
+	intel_vsec_register(dev, info);
+}
+
 /**
  * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
  * interface
@@ -570,16 +662,36 @@ void xe_vsec_init(struct xe_device *xe)
 	case XE_VSEC_CRI:
 		xe->pmt.base_offset = CRI_PMT_OFFSET;
 		info->priv_data = &xe_cri_pmt_cb;
+
+		xe->pmt.retry_count = 0;
+		INIT_DELAYED_WORK(&xe->pmt.work, cri_late_bind_probe_work);
+
+		if (!xe_sysctrl_is_oobmsm_fw_ready(xe)) {
+			xe_pm_runtime_get_noresume(xe);
+			queue_delayed_work(system_freezable_wq, &xe->pmt.work,
+					   msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
+			return;
+		}
 		break;
 
 	default:
-		break;
+		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
+		return;
 	}
 
-	/*
-	 * Register a VSEC. Cleanup is handled using device managed
-	 * resources.
-	 */
 	intel_vsec_register(dev, info);
 }
+
+/**
+ * xe_vsec_remove - cleanup any outstanding resources
+ * @xe: valid xe instance
+ */
+void xe_vsec_remove(struct xe_device *xe)
+{
+	/* Cleanup on Crescent Isle */
+	if (xe->info.platform == XE_CRESCENTISLAND &&
+	    xe->pmt.base_offset == CRI_PMT_OFFSET &&
+	    disable_delayed_work_sync(&xe->pmt.work))
+		xe_pm_runtime_put(xe);
+}
 MODULE_IMPORT_NS("INTEL_VSEC");
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
index a25b4e6e681b..e925dba4158b 100644
--- a/drivers/gpu/drm/xe/xe_vsec.h
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -10,6 +10,7 @@ struct device;
 struct xe_device;
 
 void xe_vsec_init(struct xe_device *xe);
+void xe_vsec_remove(struct xe_device *xe);
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
 
 #endif
-- 
2.43.0

