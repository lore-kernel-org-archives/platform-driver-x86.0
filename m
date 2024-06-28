Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC041C2331
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Jun 2024 15:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587440; cv=none; b=hm3s+DH0hJem8MAz3JhlcMrYMkmgkgsnFxEjfO3alHV8qZ2xSoEEBbYqlL1dCnjMG+gfRhKj2FxVnmaZHp5lvAbC25YcV2ZbSeXDaaC5i82x9rc/YJRJyNqouK3JKme6Q0yDP+P9vW1v81NRCrEgeQpQ+QDF12unjoq0pCOlf+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587440; c=relaxed/simple;
	bh=FTymvErby3W/rq88oQmQ5K92IMH9O8oXQ2BPB+qFxrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dMAzeZvabgXcU4xuoW4U5MkJkDBFWcbix7kmSYLR7Lgb87bNONGtrE3Q1tcWzg/Dqb3uDBJxTrAL0E5g2smW0o8IIrlpqBukNHv+3VTfsx/e0N6ed0eZ4ojeReX90amhkCYeKx7NSFR7L6BJH5cjuNJeF3UU89rGpgi+xi258q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6TJ+bjX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6TJ+bjX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719587439; x=1751123439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FTymvErby3W/rq88oQmQ5K92IMH9O8oXQ2BPB+qFxrM=;
  b=j6TJ+bjXsHCrEOZUtcBuuy1GJ6o156kRd7dWxNre8389sTHuoOsuAA8B
   wWeZ8FcyX/7mVFZGfwmnPqfgd7aH4cK+R+z0R/FXjVDA/XuPOetdhUGCY
   AfY2yqOGpgzqMX0OvSddvp/goP3VX3BZKXYi3KCo6Si01FGDBUb1w3aL3
   jjL6RuQlu1BuyAl/W3bWFrvtI1fpZNrVLabmomB5P8XnD2O9veFb64mId
   SpLQ2c2553Irq4Rceh2wUzryGfrl0rToVSjb36W+BkMxr0ymVpzmdT1An
   Yjv7CETulOyLc6gJYFzWy5kUPDp5MRXqqGsKZSiMjClMJS6/LvnBHgU5i
   A==;
X-CSE-ConnectionGUID: BKs1PRzZRv2MFofxd4EPAA==
X-CSE-MsgGUID: 1lzqw2coQsKYrfaObIcnLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27460873"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="27460873"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:10:39 -0700
X-CSE-ConnectionGUID: ossWUiStRDOJU0j+6ddkbQ==
X-CSE-MsgGUID: L12R+Jy0QA+REZ+PgTtkUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44848144"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:10:37 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v4 4/6] drm/xe/vsec: Support BMG devices
Date: Fri, 28 Jun 2024 11:09:42 -0400
Message-ID: <20240628150945.3363575-5-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240628150945.3363575-1-michael.j.ruhl@intel.com>
References: <20240628150945.3363575-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Utilize the PMT callback API to add support for the BMG
devices.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device.c       |   5 +
 drivers/gpu/drm/xe/xe_device_types.h |   6 +
 drivers/gpu/drm/xe/xe_vsec.c         | 214 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h         |  13 ++
 5 files changed, 239 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b1e03bfe4a68..5860d6db1598 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -129,6 +129,7 @@ xe-y += xe_bb.o \
 	xe_vm.o \
 	xe_vram.o \
 	xe_vram_freq.o \
+	xe_vsec.o \
 	xe_wait_user_fence.o \
 	xe_wa.o \
 	xe_wopcm.o
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cfda7cb5df2c..05a666c7bbb7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -53,6 +53,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
+#include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
@@ -317,6 +318,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 		goto err;
 	}
 
+	drmm_mutex_init(&xe->drm, &xe->pmt.lock);
+
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
 		goto err;
@@ -692,6 +695,8 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
+	xe_vsec_init(xe);
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_fini_display:
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c37be471d11c..11513d8f3a8b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -451,6 +451,12 @@ struct xe_device {
 		struct mutex lock;
 	} d3cold;
 
+	/** @pmt: Support the PMT driver callback interface */
+	struct {
+		/** @pmt.lock: protect access for telemetry data */
+		struct mutex lock;
+	} pmt;
+
 	/**
 	 * @pm_callback_task: Track the active task that is running in either
 	 * the runtime_suspend or runtime_resume callbacks.
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
new file mode 100644
index 000000000000..7db1624a335f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2022 - 2024 Intel Corporation
+ */
+#include <linux/intel_vsec.h>
+#include <linux/pci.h>
+
+#include "xe_device.h"
+#include "xe_device_types.h"
+#include "xe_drv.h"
+#include "xe_mmio.h"
+#include "xe_platform_types.h"
+#include "xe_pm.h"
+#include "xe_vsec.h"
+
+#define SOC_BASE		0x280000
+
+#define BMG_PMT_BASE		0xDB000
+#define BMG_DISCOVERY_OFFSET	(SOC_BASE + BMG_PMT_BASE)
+
+#define BMG_TELEMETRY_BASE	0xE0000
+#define BMG_TELEMETRY_OFFSET	(SOC_BASE + BMG_TELEMETRY_BASE)
+
+#define GFX_BAR			0
+
+#define SG_REMAP_INDEX1		XE_REG(SOC_BASE + 0x08)
+#define SG_REMAP_ACCESS(_mem)	((_mem) << 24)
+#define SG_REMAP_BITS		GENMASK(31, 24)
+
+static struct intel_vsec_header bmg_telemetry = {
+	.length = 0x10,
+	.id = VSEC_ID_TELEMETRY,
+	.num_entries = 2,
+	.entry_size = 4,
+	.tbir = GFX_BAR,
+	.offset = BMG_DISCOVERY_OFFSET,
+};
+
+static struct intel_vsec_header *bmg_capabilities[] = {
+	&bmg_telemetry,
+	NULL
+};
+
+enum xe_vsec {
+	XE_VSEC_UNKNOWN = 0,
+	XE_VSEC_BMG,
+};
+
+static struct intel_vsec_platform_info xe_vsec_info[] = {
+	[XE_VSEC_BMG] = {
+		.caps = VSEC_CAP_TELEMETRY,
+		.headers = bmg_capabilities,
+	},
+	{ }
+};
+
+/* GUID Decode information */
+#define GUID_TELEM_ITERATION GENMASK(3, 0)
+#define GUID_SEGMENT GENMASK(7, 4)
+#define GUID_SOC_SKU GENMASK(11, 8)
+#define GUID_DEVICE_ID GENMASK(27, 12)
+#define GUID_CAP_TYPE GENMASK(29, 28)
+#define GUID_RECORD_ID GENMASK(31, 30)
+
+enum record_id {
+	PUNIT,
+	OOBMSM_0,
+	OOBMSM_1
+};
+
+enum capability {
+	CRASHLOG,
+	TELEMETRY,
+	WATCHER
+};
+
+/*
+ * The GUID will have the following bits to decode (high bits first):
+ *
+ * X(2bits) - Record-ID (0-PUNIT, 1-OOBMSM_0, 2-OOBMSM_1)
+ * X(2bits) - Capability Type (Crashlog-0, Telemetry Aggregator-1, Watcher-2)
+ * XXXX(16bits)– Device ID – changes for each down bin SKU’s (0xE2F8 for BMG)
+ * X(4bits) - SOC_SKU (SKU_INDEPENDENT-0, X3-1, X2-2, G31-3),
+ * X(4bits) - Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
+ * X(4bits) - {Telemetry space iteration number (0,1,..)}
+ *
+ */
+static int guid_decode(u32 guid, int *index, u32 *offset)
+{
+	u32 record_id = (guid & GUID_RECORD_ID) >> 30;
+	u32 cap_type  = (guid & GUID_CAP_TYPE) >> 28;
+	u32 device_id = (guid & GUID_DEVICE_ID) >> 12;
+
+	if (device_id != 0xE2F8)
+		return -ENODEV;
+
+	if (record_id > OOBMSM_1 || cap_type > WATCHER)
+		return -EINVAL;
+
+	*offset = 0;
+
+	if (cap_type == CRASHLOG) {
+		*index = record_id == PUNIT ? 2 : 4;
+		return 0;
+	}
+
+	switch (record_id) {
+	case PUNIT:
+		*index = 0;
+		if (cap_type == TELEMETRY)
+			*offset = 0x0200;
+		else /* if (cap_type == WATCHER) */
+			*offset = 0x14A0;
+		break;
+
+	case OOBMSM_0:
+		*index = 1;
+		if (cap_type == WATCHER)
+			*offset = 0x18D8;
+		break;
+
+	case OOBMSM_1:
+		*index = 1;
+		if (cap_type == TELEMETRY)
+			*offset = 0x1000;
+		break;
+	}
+
+	return 0;
+}
+
+static int xe_pmt_telem_read(void *args, u32 guid, u64 *data, u32 count)
+{
+	struct xe_device *xe = pdev_to_xe_device((struct pci_dev *)args);
+	void __iomem *telem_addr = xe->tiles[0].mmio.regs + BMG_TELEMETRY_OFFSET;
+	u32 mem_region;
+	u32 offset;
+	int ret;
+
+	ret = guid_decode(guid, &mem_region, &offset);
+	if (ret)
+		return ret;
+
+	telem_addr += offset;
+
+	mutex_lock(&xe->pmt.lock);
+
+	/* indicate that we are not at an appropriate power level */
+	ret = -ENODATA;
+	if (xe_pm_runtime_get_if_active(xe) > 0) {
+		/* set SoC re-mapper index register based on guid memory region */
+		xe_mmio_rmw32(xe->tiles[0].primary_gt, SG_REMAP_INDEX1, SG_REMAP_BITS,
+			      SG_REMAP_ACCESS(mem_region));
+
+		memcpy_fromio(data, telem_addr, count);
+		ret = count;
+		xe_pm_runtime_put(xe);
+	}
+	mutex_unlock(&xe->pmt.lock);
+
+	return ret;
+}
+
+struct pmt_callbacks xe_pmt_cb = {
+	.read_telem = xe_pmt_telem_read,
+};
+
+static const int vsec_platforms[] = {
+	[XE_BATTLEMAGE] = XE_VSEC_BMG,
+};
+
+static enum xe_vsec get_platform_info(struct xe_device *xe)
+{
+	if (xe->info.platform > XE_BATTLEMAGE)
+		return XE_VSEC_UNKNOWN;
+
+	return vsec_platforms[xe->info.platform];
+}
+
+/**
+ * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
+ * interface
+ * @xe: valid xe instance
+ */
+void xe_vsec_init(struct xe_device *xe)
+{
+	struct intel_vsec_platform_info *info;
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	enum xe_vsec platform;
+
+	platform = get_platform_info(xe);
+	if (platform == XE_VSEC_UNKNOWN)
+		return;
+
+	info = &xe_vsec_info[platform];
+	if (!info->headers)
+		return;
+
+	switch (platform) {
+	case XE_VSEC_BMG:
+		info->priv_data = &xe_pmt_cb;
+		break;
+	default:
+		break;
+	}
+
+	/*
+	 * Register a VSEC. Cleanup is handled using device managed
+	 * resources.
+	 */
+	intel_vsec_register(pdev, info);
+}
+MODULE_IMPORT_NS(INTEL_VSEC);
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
new file mode 100644
index 000000000000..3fd29a21cad6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright © 2022 - 2024 Intel Corporation
+ */
+
+#ifndef _XE_VSEC_H_
+#define _XE_VSEC_H_
+
+struct xe_device;
+
+void xe_vsec_init(struct xe_device *xe);
+
+#endif
-- 
2.44.0

