Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E40D20607F
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 16:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731429058; cv=none; b=eLoKEdBxiV9qJJpH6ctAunot7zkLNUOnBYvQ26oXXOlsH10fuCW78AUOyFBVSERFU0ZhZXbf114penwBaWtdYJ+sDkNV4co2cFBIAa4ZggP/kOJtSsH5CvulUf2cQ0kPXr2keALl1dlxohZPuwCoBRlM6fADuj6F6kc4Ous7Jdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731429058; c=relaxed/simple;
	bh=K34sCfVHWzdyjpBYegF9TwFwUvrY3CgIl8YaEibjQqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HQTNfWymx8qLj9Llr/lh7tH7Kp3LBg5ty5lTvW4y0/pHCNlMf7EkLi5BIDUcINgSl2zFKzvFnk+AqY5IcMJDSu/dfX5Id59q9nBpU2hzb4dxV9jCmu0fi4MC/+H3wQyjwbrYPckXugFApu1WuY4ktK1eMKo+Z9JrFbCSFghcg5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+h/kx7F; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+h/kx7F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731429056; x=1762965056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K34sCfVHWzdyjpBYegF9TwFwUvrY3CgIl8YaEibjQqU=;
  b=T+h/kx7F8w1XDHvc5/gTdd6ieNMG2BNml0jxAdW3CWSrBtSZB76YMyDH
   ETOSz5WVC8m3jB6ZXho2Pz+HD4UgtRQbVSz7Pa/JMO8msFxjVMzmQiGxH
   VQVcr/GEiXiIEqD9D3bBpi9DV1q51FhZJFklv6+bPn0h3HzH2ybhROm31
   /cWw/ccSOARKZNeLCg/tGWJ04wWcj93GExvE5E4nimQjryg2cX4Tk6NjW
   6sJTcxbVaaeuXnyB82tRaJQvo7V/vxlaRBw0Rh9i0uXvLU/ZpalNuEgTu
   GqjnSZcZ/2lzxtsQBUTxNolO3Lc7Sl5pDmdLR+08PTIjKImwKOJdNfwPW
   g==;
X-CSE-ConnectionGUID: 2B6YkmwwT5OwCkwcJK/Vgw==
X-CSE-MsgGUID: 0ICh5IwlRPiGAZK+INzH1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31446464"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31446464"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 08:30:56 -0800
X-CSE-ConnectionGUID: +oeRyrNXT1e1Ec+mSODlsg==
X-CSE-MsgGUID: kZLInpyTQ865qVbT4POXlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="92495845"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 08:30:54 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	rodrigo.vivi@intel.com,
	lucas.demarchi@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v2 2/2] drm/xe/vsec: Support BMG devices
Date: Tue, 12 Nov 2024 11:30:35 -0500
Message-ID: <20241112163035.2282499-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Battlemage (BMG) discrete graphics card supports the
Platform, Monitoring Technology (PMT) feature directly
on the primary PCI device.

Utilize the PMT callback API to add support for the BMG
devices.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h     |  19 +++
 drivers/gpu/drm/xe/xe_device.c       |   7 +
 drivers/gpu/drm/xe/xe_device_types.h |   6 +
 drivers/gpu/drm/xe/xe_vsec.c         | 232 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h         |  11 ++
 6 files changed, 276 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_pmt.h
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a93e6fcc0ad9..7730e0596299 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -111,6 +111,7 @@ xe-y += xe_bb.o \
 	xe_vm.o \
 	xe_vram.o \
 	xe_vram_freq.o \
+	xe_vsec.o \
 	xe_wait_user_fence.o \
 	xe_wa.o \
 	xe_wopcm.o
diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
new file mode 100644
index 000000000000..f45abcd96ba8
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+#ifndef _XE_PMT_H_
+#define _XE_PMT_H_
+
+#define SOC_BASE			0x280000
+
+#define BMG_PMT_BASE_OFFSET		0xDB000
+#define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
+
+#define BMG_TELEMETRY_BASE_OFFSET	0xE0000
+#define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
+
+#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
+#define   SG_REMAP_BITS			REG_GENMASK(31, 24)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0e2dd691bdae..51da1ea4d39b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -55,6 +55,7 @@
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
 #include "xe_vram.h"
+#include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
 #include "xe_wa.h"
 
@@ -365,6 +366,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 		goto err;
 	}
 
+	err = drmm_mutex_init(&xe->drm, &xe->pmt.lock);
+	if (err)
+		goto err;
+
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
 		goto err;
@@ -759,6 +764,8 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
+	xe_vsec_init(xe);
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_fini_display:
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bccca63c8a48..13164ea2bddb 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -483,6 +483,12 @@ struct xe_device {
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
index 000000000000..4c2d5c6e293a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright © 2024 Intel Corporation */
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/errno.h>
+#include <linux/intel_vsec.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/types.h>
+
+#include "xe_device.h"
+#include "xe_device_types.h"
+#include "xe_drv.h"
+#include "xe_mmio.h"
+#include "xe_platform_types.h"
+#include "xe_pm.h"
+#include "xe_vsec.h"
+
+#include "regs/xe_pmt.h"
+
+/* PMT GUID value for BMG devices.  NOTE: this is NOT a PCI id */
+#define BMG_DEVICE_ID 0xE2F8
+
+static struct intel_vsec_header bmg_telemetry = {
+	.length = 0x10,
+	.id = VSEC_ID_TELEMETRY,
+	.num_entries = 2,
+	.entry_size = 4,
+	.tbir = 0,
+	.offset = BMG_DISCOVERY_OFFSET,
+};
+
+static struct intel_vsec_header bmg_punit_crashlog = {
+	.length = 0x10,
+	.id = VSEC_ID_CRASHLOG,
+	.num_entries = 1,
+	.entry_size = 4,
+	.tbir = 0,
+	.offset = BMG_DISCOVERY_OFFSET + 0x60,
+};
+
+static struct intel_vsec_header bmg_oobmsm_crashlog = {
+	.length = 0x10,
+	.id = VSEC_ID_CRASHLOG,
+	.num_entries = 1,
+	.entry_size = 4,
+	.tbir = 0,
+	.offset = BMG_DISCOVERY_OFFSET + 0x78,
+};
+
+static struct intel_vsec_header *bmg_capabilities[] = {
+	&bmg_telemetry,
+	&bmg_punit_crashlog,
+	&bmg_oobmsm_crashlog,
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
+		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
+		.headers = bmg_capabilities,
+	},
+	{ }
+};
+
+/*
+ * The GUID will have the following bits to decode:
+ *   [0:3]   - {Telemetry space iteration number (0,1,..)}
+ *   [4:7]   - Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
+ *   [8:11]  - SOC_SKU
+ *   [12:27] – Device ID – changes for each down bin SKU’s
+ *   [28:29] - Capability Type (Crashlog-0, Telemetry Aggregator-1, Watcher-2)
+ *   [30:31] - Record-ID (0-PUNIT, 1-OOBMSM_0, 2-OOBMSM_1)
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
+	OOBMSM_1,
+};
+
+enum capability {
+	CRASHLOG,
+	TELEMETRY,
+	WATCHER,
+};
+
+static int xe_guid_decode(u32 guid, int *index, u32 *offset)
+{
+	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
+	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
+	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
+
+	if (device_id != BMG_DEVICE_ID)
+		return -ENODEV;
+
+	if (cap_type > WATCHER)
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
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset, u32 count)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
+	u32 mem_region;
+	u32 offset;
+	int ret;
+
+	ret = xe_guid_decode(guid, &mem_region, &offset);
+	if (ret)
+		return ret;
+
+	telem_addr += offset + user_offset;
+
+	guard(mutex)(&xe->pmt.lock);
+
+	/* indicate that we are not at an appropriate power level */
+	if (!xe_pm_runtime_get_if_active(xe))
+		return -ENODATA;
+
+	/* set SoC re-mapper index register based on GUID memory region */
+	xe_mmio_rmw32(xe_root_tile_mmio(xe), SG_REMAP_INDEX1, SG_REMAP_BITS,
+		      REG_FIELD_PREP(SG_REMAP_BITS, mem_region));
+
+	memcpy_fromio(data, telem_addr, count);
+	xe_pm_runtime_put(xe);
+
+	return count;
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
index 000000000000..5777c53faec2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright © 2024 Intel Corporation */
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

