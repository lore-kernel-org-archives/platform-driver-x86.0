Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2684D51D502
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Sep 2026 18:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546316; cv=none; b=mhhlp1JeXcJ05F+S5UGwljzFG+RVWE67WUAmJSW1/fkrpDdjdob5I8lumOzchFj29fBC8ml9/wMA3BiaOzzM8TSiya2JODaxXu6Uv8B2wkgO8AlYOhEW4DaVpL+xv34a+wkJpAv79AiwPJlWfRfPH8v65udy3/10n2UQ0mpUqoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546316; c=relaxed/simple;
	bh=mcJnxzKILBaN4IA5yrlbPyEmxRSAOQzWZyg768KYkXc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=npbFJwIvLBaIJYMDRYkaldEZ6+y0cccOwYx9/I8D69Qc3uoPj5EsAhK3FvcU/sA4ld27B0msMk0/bT3axHh/HJ04jcah6rBbWKkautwwu9ljlvEyQKoRMMRtT0qHRZZ7xBUIECu21yZjDHoYsHWWp9tCs3/kSLr57fKxbScfLJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=llxKZVmh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llxKZVmh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788546314; x=1820082314;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=mcJnxzKILBaN4IA5yrlbPyEmxRSAOQzWZyg768KYkXc=;
  b=llxKZVmhdgqcOuuEWCh2sr2rHNzzed8LZIrzFVwznL59pDj5L8AaNkQS
   +b1ttrqJBdosFJ2F+M0o8CDvuxARSzHXz/kZSibXTbQ9xm7Dd0cjc0qOl
   OHCVqnPuewZbjS5lFZmo3LaVZYQETytVQ5R3hUml6tOG3gDA4mftxqO7B
   hFEpTepexHXfx6E0GHsZXpqopnF/uksVi+BJaTq2c8XBl7/f4S/aOAg8w
   7v7JuJJfvizsZSKMtfueZTHNqJnmggQnmxsExm0AMzMxbiydBgI9z2zuN
   +NJkFIjY4q/455OhKOxKiYhQtXamy0dtQq6ZhBCKRcQ8AlP6ph/gTe3Vw
   Q==;
X-CSE-ConnectionGUID: m5xSxVKqSvuNH6yGivUbUg==
X-CSE-MsgGUID: lVn2S4JMSAWMm4J0rujMAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88932259"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88932259"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:25:13 -0700
X-CSE-ConnectionGUID: rbVsvXJOTPGLYouzYC9FOQ==
X-CSE-MsgGUID: ufg76MYRRk6PmxT9oOEfhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="294992503"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:25:12 -0700
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
Subject: [PATCH v6 15/18] drm/xe/vsec: Support late bind fw information
Date: Fri,  4 Sep 2026 11:25:05 -0700
Message-ID: <20260904182451.1164868-35-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
References: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CRI FW is loaded on power on.  Because of this, access to the FW cannot
be done until it is running.

Update the XE PMT probe and access to check for late bind devices,
verify, and wait for the appropriate FW state before probe or access.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h |   5 +
 drivers/gpu/drm/xe/xe_vsec.c         | 134 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vsec.h         |   2 +-
 4 files changed, 137 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8583b2e9ecf4..e51e3cc4ea62 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1148,7 +1148,9 @@ int xe_device_probe(struct xe_device *xe)
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
index 7c3f9938701e..5c352af193cf 100644
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
@@ -173,6 +175,14 @@ enum capability {
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
@@ -281,6 +291,48 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
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
 /**
  * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a buffer
  * @dev: valid Xe device
@@ -339,6 +391,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 		goto dev_exit;
 	}
 
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
+
 	mutex_lock(&xe->pmt.lock);
 
 	/* set SoC re-mapper index register based on GUID memory region */
@@ -348,6 +405,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	mutex_unlock(&xe->pmt.lock);
 
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 dev_exit:
@@ -390,6 +448,10 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
 	disc_addr += inst + offset;
 
 	xe_pm_runtime_get(xe);
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
 	mutex_lock(&xe->pmt.lock);
 
 	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
@@ -397,6 +459,8 @@ static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
 	*reg = readl(disc_addr);
 
 	mutex_unlock(&xe->pmt.lock);
+
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 dev_exit:
@@ -427,6 +491,10 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
 	disc_addr += inst + offset;
 
 	xe_pm_runtime_get(xe);
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
 	mutex_lock(&xe->pmt.lock);
 
 	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
@@ -434,6 +502,8 @@ static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
 	writel(reg, disc_addr);
 
 	mutex_unlock(&xe->pmt.lock);
+
+runtime_exit:
 	xe_pm_runtime_put(xe);
 
 dev_exit:
@@ -465,12 +535,44 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
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
@@ -478,30 +580,45 @@ void xe_vsec_init(struct xe_device *xe)
 
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
@@ -509,5 +626,10 @@ void xe_vsec_init(struct xe_device *xe)
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

