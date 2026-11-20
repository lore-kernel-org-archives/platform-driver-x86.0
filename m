Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208177;
	b=u2DoAfB8SqqncA6AFFmmCpepbNBE3Cch0GdKCFOOut89sDi6jwAP9f7Kv2n+YlRU+axS
	 42itL8kp+jSQnVAe6GEpipTeb7dZqPDHzZOUcitAvGS/A9DLHAg2pZn5kPyESljyktopE
	 4NkSpZQQxxhTnysVyu+bqqmMoEDLPOYu6qvLT8TAHzZDbl6o81YSqyINQcRP+29tQhnV3
	 kdDswEKWtM9/XidXQFyDQyMFVO5lkIUgQBrPoedF0SktnMaJYv4jvmyzkJbcA1bKey4v7
	 N6LTgk84fmdVW9CJH93L4WF/qPIBz9wVPyYclCU0/iYF1P4Pmbz9OOi2tHAQW30f4VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208177;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WvHxQRk9utY77GDOE065I8nlpbWcLdTa/69XIODw/dI=;
	b=5JIzZJNRDi3SYY8h9gEzfNzf39lP6eKBpad2cO4ZQHZBikdUivPtBi+ik9+oSnzJ/WID
	 Z2mjal3oinZ7TYXGcDecJXibOZz3KHnzp/lv3v5yRDc8X8xG22sxLi8WCQX4mAA2hSjBv
	 fbc0692s8qlQUIGGMj2E8H+NjCcau9XJ2AJg+bRGLUzC1728GZe8Xbj3sbt8kbPhm8wuB
	 jq3phlICWrkFjykoJNBqWD5VG1F3vfAaAmym+guXLrJqwZH4UL0m8wSNW063oKudR+jtV
	 sSMoQYBs4ZEVwnIiqFHwsO+1NrFsAwwDrdFPpiClyez0YjqDWnk4kusUdUB/ATq3jrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QrPG6if9;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183AC60A260B
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 20:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 183AC60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QrPG6if9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795208177; x=1826744177;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sPlh/mPp9UWrSAlbfQhCmRi9xOZZCIxLwIYrM/53FoE=;
  b=QrPG6if9JbJgYrG6obGyZYBkZ+wXGduIsX0t7YkTpo9/bhxm/HiFldks
   5Ea/eORiqCI2EpTIKt3GJRaUWd2YEso+XFyWtaHDmDh4KThMyQyfMfp3/
   d3GtizP4Yf/e6ej+cnI/RZLw1T82Jl8XD+6dUYqR1OZYQfe1krM7k4kxm
   ms4ReLB4oQdM0eh35BZYUtveTAJZ7vHtePqbgsyUHV5uwCdBUyoLH0SSV
   nsjSVKty2LFRRSN/K7miW6rJgXiN8hgiFpYpLzx+taBIhTJX8ugHSKK+d
   o+6As/CeUQGOp23SX3Qynw1eH5L0qtp15zV2qfQK7OeT4a2YJfSbB1SAi
   w==;
X-CSE-ConnectionGUID: 1MRVCXsNRECGkaYmmA21zw==
X-CSE-MsgGUID: S+CtKecjQGa7g6I8wEZctw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136412"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136412"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:51 -0800
X-CSE-ConnectionGUID: 71QV9IpZR3assxLaBurhLg==
X-CSE-MsgGUID: TEbi5FUAToiobetRvrSymw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10908731"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:48 -0800
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
Subject: [PATCH v21 14/19] drm/xe/vsec: Crescent Island PMT callbacks
Date: Fri, 20 Nov 2026 12:55:54 -0800
Message-ID: <20261120205540.1220643-35-michael.j.ruhl@intel.com>
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

CRI PMT support requires callbacks to access the discovery data and
control areas. Access is a common MMIO area that requires an index to
be set before access is allowed.

Introduce the necessary callbacks to get the discovery, status and
control information for CRI PMT usage.

Add the glue logic to register the CRI PMT functionality.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 184 ++++++++++++++++++++++++++++++++++-
 1 file changed, 180 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a814d7151eea..188eaf13d68f 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -4,6 +4,7 @@
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/errno.h>
+#include <linux/log2.h>
 #include <linux/intel_vsec.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -344,10 +345,15 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	}
 
 	scoped_guard(mutex, &xe->pmt.lock) {
+		u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
+
 		/* set SoC re-mapper index register based on GUID memory region */
 		xe->soc_remapper.set_telem_region(xe, mem_region);
 
 		memcpy_fromio(data, telem_addr, count);
+
+		if (device_id == CRI_DEVICE_ID)
+			xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
 	}
 
 	xe_pm_runtime_put(xe);
@@ -358,20 +364,184 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	return ret == 0 ? count : ret;
 }
 
-static struct pmt_callbacks xe_pmt_cb = {
+/**
+ * xe_pmt_discovery_read - Given a device and an index, read discovery data into a buffer
+ * @dev: valid Xe device
+ * @cap_id: PMT type
+ * @element: element to access
+ * @disc_data: buffer for discovery data
+ *
+ * This is a callback API.  I.e this can be accessed external to the XE driver
+ * (PMT driver scope).  Because of this, DRM hotplug needs to be verified
+ * (drm_dev_enter()).
+ *
+ * Runtime is required to be active.  Calling this out of that scope is not a
+ * correct use case (probe, late-bind probe).
+ *
+ * Return:
+ * * -ENODEV device is not available (hotplug)
+ * * -EINVAL for unsupported device or PMT feature
+ * * 0 on success
+ */
+static int xe_pmt_discovery_read(struct device *dev, unsigned long cap_id, u32 element,
+				 u32 *disc_data)
+{
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	void __iomem *disc_addr = xe->mmio.regs;
+	struct intel_vsec_header *headers;
+	int ret = 0;
+	u32 offset;
+	int idx;
+
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
+	if (!xe_pm_runtime_get_if_active(xe))
+		return -ENODATA;
+
+	if (xe->info.platform != XE_CRESCENTISLAND) {
+		ret = -EINVAL;
+		goto dev_exit;
+	}
+
+	switch (cap_id) {
+	case ilog2(VSEC_CAP_TELEMETRY):
+		headers = &cri_telemetry;
+		break;
+
+	case ilog2(VSEC_CAP_CRASHLOG):
+		headers = &cri_crashlog;
+		break;
+
+	default:
+		ret = -EINVAL;
+		goto dev_exit;
+	}
+
+	offset = element * (headers->entry_size * sizeof(u32));
+	disc_addr += headers->offset + offset;
+
+	scoped_guard(mutex, &xe->pmt.lock) {
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+		memcpy_fromio(disc_data, disc_addr, PMT_DISC_DWORDS * sizeof(u32));
+	}
+
+dev_exit:
+	xe_pm_runtime_put(xe);
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
+/**
+ * xe_pmt_read_reg() - read a crashlog register
+ * @dev: the xe device that registered the callback
+ * @guid: PMT guid of the crashlog instance
+ * @reg: data read from the PMT data structure
+ * @offset: which data to read from the PMT data structure
+ *
+ * Read the requested PMT register based on the pcie device and guid.  The
+ * supported struct is the Crashlog Type1 Version2.
+ *
+ * Currently this is for CRI only.
+ *
+ * Return:
+ * * -ENODEV device is not available (hotplug)
+ * * -EINVAL invalid guid
+ * * 0       success
+ */
+static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
+{
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	void __iomem *disc_addr = xe->mmio.regs + xe->pmt.base_offset;
+	int ret = 0;
+	u32 inst;
+	int idx;
+
+	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
+	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
+		return -EINVAL;
+
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
+	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
+		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
+	disc_addr += inst + offset;
+
+	xe_pm_runtime_get(xe);
+
+	scoped_guard(mutex, &xe->pmt.lock) {
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+
+		*reg = readl(disc_addr);
+	}
+
+	xe_pm_runtime_put(xe);
+
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
+static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
+{
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	void __iomem *disc_addr = xe->mmio.regs + xe->pmt.base_offset;
+	int ret = 0;
+	u32 inst;
+	int idx;
+
+	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
+	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
+		return -EINVAL;
+
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
+	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
+		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
+	disc_addr += inst + offset;
+
+	xe_pm_runtime_get(xe);
+
+	scoped_guard(mutex, &xe->pmt.lock) {
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+
+		writel(reg, disc_addr);
+	}
+
+	xe_pm_runtime_put(xe);
+
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
+static struct pmt_callbacks xe_bmg_pmt_cb = {
 	.read_telem = xe_pmt_telem_read,
 };
 
+static struct pmt_callbacks xe_cri_pmt_cb = {
+	.read_telem = xe_pmt_telem_read,
+	.read_discovery = xe_pmt_discovery_read,
+	.read_reg = xe_pmt_read_reg,
+	.write_reg = xe_pmt_write_reg,
+};
+
 static const int vsec_platforms[] = {
 	[XE_BATTLEMAGE] = XE_VSEC_BMG,
+	[XE_CRESCENTISLAND] = XE_VSEC_CRI,
 };
 
 static enum xe_vsec get_platform_info(struct xe_device *xe)
 {
-	if (xe->info.platform > XE_BATTLEMAGE)
+	if (xe->info.platform > XE_CRESCENTISLAND)
 		return XE_VSEC_UNKNOWN;
 
-	if (IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE)
+	if (IS_SRIOV_VF(xe) &&
+	    (xe->info.platform == XE_BATTLEMAGE ||
+	     xe->info.platform == XE_CRESCENTISLAND))
 		return XE_VSEC_UNKNOWN;
 
 	return vsec_platforms[xe->info.platform];
@@ -399,8 +569,14 @@ void xe_vsec_init(struct xe_device *xe)
 	switch (platform) {
 	case XE_VSEC_BMG:
 		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
-		info->priv_data = &xe_pmt_cb;
+		info->priv_data = &xe_bmg_pmt_cb;
 		break;
+
+	case XE_VSEC_CRI:
+		xe->pmt.base_offset = CRI_PMT_OFFSET;
+		info->priv_data = &xe_cri_pmt_cb;
+		break;
+
 	default:
 		break;
 	}
-- 
2.43.0

