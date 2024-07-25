Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85453199EA4
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jul 2024 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721910251; cv=none; b=RjmRDYVED4Yo9kFtoC/cLfIkbK0LW/sSvGYlduY3V8BOl4VEWk8AAXDxvAdFq6MJU41MqnPZul9/UwNcZHx+nlF2HZTtK/52iXtcgLCCbaYw/LbVSqwH7SrVetkiXMPEkccF73SPsVQp9MfdnfUcm5bIqNmy47on2+Ed7XZ0Z+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721910251; c=relaxed/simple;
	bh=XUWNHkmv+TsISdqsIsQpEgPp2TZNnrlFsNhDYj6IyN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b4Bo7/8N7LoFPs78FvxaguXD2DZrlOJYSHXNhqyK/q4FeBXdCgT5Y1MnwxjQgwuV7uJwoWTCg8e1vKzQu4MItSuKdIRIhcIT2w5RtxFNJQv+ZAyaS+CXaZnedWDZXgRMfWMV1OOtyGgJfQuP4KaiUTs3uSX7Mauk7mBicmR6Rro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lWmxMI7e; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWmxMI7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721910249; x=1753446249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XUWNHkmv+TsISdqsIsQpEgPp2TZNnrlFsNhDYj6IyN0=;
  b=lWmxMI7e5EYglyZc/pkiTLq9DEVQUveXje6sCOSpGe+ac4nJnZwC5Ve6
   +NboimQhLzAQkB7Ilt++sdC+yM/SBAlp41Zb5+yUDda8OU/EoDajwzlEQ
   3qnoIxzTcn6hm4GQI4TDn3kt6/Ri9hUf+KwiPPpi8DlkUkVVZlUZjDbtz
   u/396xGGVUnaeUiQ0GzKxPI5Ag0NA3hD9IxCpkg4BtxdzTFNhZH9E3rUZ
   0VkrmEOpq6TO1lrxVFz8yMQcedqFr/vYt0fYDS8WuOa5mTeJU6ftVMWV3
   IXJ711gqbl8Hd8IPZhvanLCBWsXbr/Qxq94POJ0APDvMwip36jlRWbHAs
   Q==;
X-CSE-ConnectionGUID: 1jLga9mhRK6e8rFD6BDd9g==
X-CSE-MsgGUID: 84Zbax4GTO2ih9tPCO8cSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19493178"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="19493178"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:24:09 -0700
X-CSE-ConnectionGUID: LGU4KJFMS/OaS1VpthuoAQ==
X-CSE-MsgGUID: 9AO7w79HTz+GTyubTuxEQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="53153617"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:24:09 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	andriy.shevchenko@linux.intel.com
Cc: michael.j.ruhl@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v9 4/6] drm/xe/vsec: Support BMG devices
Date: Thu, 25 Jul 2024 08:23:43 -0400
Message-ID: <20240725122346.4063913-5-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device.c       |   5 +
 drivers/gpu/drm/xe/xe_device_types.h |   6 +
 drivers/gpu/drm/xe/xe_vsec.c         | 222 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h         |  13 ++
 5 files changed, 247 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1ff9602a52f6..a3c044b46fed 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -112,6 +112,7 @@ xe-y += xe_bb.o \
 	xe_vm.o \
 	xe_vram.o \
 	xe_vram_freq.o \
+	xe_vsec.o \
 	xe_wait_user_fence.o \
 	xe_wa.o \
 	xe_wopcm.o
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1aba6f9eaa19..0bdfbe849e64 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -53,6 +53,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
+#include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
 #include "xe_wa.h"
 
@@ -370,6 +371,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 		goto err;
 	}
 
+	drmm_mutex_init(&xe->drm, &xe->pmt.lock);
+
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
 		goto err;
@@ -745,6 +748,8 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
+	xe_vsec_init(xe);
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_fini_display:
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5b7292a9a66d..2509d7428f2d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -458,6 +458,12 @@ struct xe_device {
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
index 000000000000..2c967aaa4072
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2022 - 2024 Intel Corporation
+ */
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/intel_vsec.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
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
+#define BMG_DEVICE_ID 0xE2F8
+
+#define GFX_BAR			0
+
+#define SG_REMAP_INDEX1		XE_REG(SOC_BASE + 0x08)
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
+/*
+ * The GUID will have the following bits to decode:
+ *
+ * X(4bits) - {Telemetry space iteration number (0,1,..)}
+ * X(4bits) - Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
+ * X(4bits) - SOC_SKU
+ * XXXX(16bits)– Device ID – changes for each down bin SKU’s
+ * X(2bits) - Capability Type (Crashlog-0, Telemetry Aggregator-1, Watcher-2)
+ * X(2bits) - Record-ID (0-PUNIT, 1-OOBMSM_0, 2-OOBMSM_1)
+ */
+#define GUID_TELEM_ITERATION	GENMASK(3, 0)
+#define GUID_SEGMENT		GENMASK(7, 4)
+#define GUID_SOC_SKU		GENMASK(11, 8)
+#define GUID_DEVICE_ID		GENMASK(27, 12)
+#define GUID_CAP_TYPE		GENMASK(29, 28)
+#define GUID_RECORD_ID		GENMASK(31, 30)
+
+#define PUNIT_TELEMETRY_OFFSET		0x0200
+#define PUNIT_WATCHER_OFFSET		0x14A0
+#define OOBMSM_0_WATCHER_OFFSET		0x18D8
+#define OOBMSM_1_TELEMETRY_OFFSET	0x1000
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
+static int guid_decode(u32 guid, int *index, u32 *offset)
+{
+	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
+	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
+	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
+
+	if (device_id != BMG_DEVICE_ID)
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
+			*offset = PUNIT_TELEMETRY_OFFSET;
+		else
+			*offset = PUNIT_WATCHER_OFFSET;
+		break;
+
+	case OOBMSM_0:
+		*index = 1;
+		if (cap_type == WATCHER)
+			*offset = OOBMSM_0_WATCHER_OFFSET;
+		break;
+
+	case OOBMSM_1:
+		*index = 1;
+		if (cap_type == TELEMETRY)
+			*offset = OOBMSM_1_TELEMETRY_OFFSET;
+		break;
+	}
+
+	return 0;
+}
+
+static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, u32 count)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
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
+		/* set SoC re-mapper index register based on GUID memory region */
+		xe_mmio_rmw32(xe->tiles[0].primary_gt, SG_REMAP_INDEX1, SG_REMAP_BITS,
+			      FIELD_PREP(SG_REMAP_BITS, mem_region));
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

