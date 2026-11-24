Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486089;
	b=l1UNKYEm4o07B0A+ujDGd8qSTlq2ZFy4/RCRJJh5LfRRsEsa/gyVc9PZWhsQGgMdgsZT
	 9yrJD4RtP2bnNfhoPeoCB0/j5dpZfYtcikaaLCn2BzbkGGwZBMt3mzQs2tLe046S4nDjI
	 hI8W0empaBxt+9W9CujLsLskCj8GT1f3lU1zBVS5Yh82urINDbFy5xLN1eEo7Qn8yPqPi
	 e4y/aBjxnDeCuHNgwmpJfUpv7pkEi33M65Jlaf6hCL3dUN/Nho0ZdrR+qT+FjuVlnr5Qb
	 jGNPrFrpLaTp0ZTrpYQsxoRmNwLfIX9YC/5D9CXmhKW3YH0RMqb0JaGhMblz4tKAklQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486089;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P7MkId06VOa3HXN141ztn2g+6yYnLLfs9okVqNm/uVM=;
	b=zpJ/EzKaNurgu5RBBxwy3DIWkKr8m1RsSY4CpofoASGvfLIfXMIuJhYLA+dP6b9vYt6l
	 AZldFsYn4EQnPX+R8mBk/0cQbWOdxMdGQWGKY7+Mc4rRI4BTvbxryGT7Uwz3em8JvwcYH
	 OMFgxb7TbKfyT7GpFnwzkr9ZAiwkAvggAMbaNoekPCD0DI2WtOosWqIFm4wMdjHwlzX1E
	 4NyCfaecbCZC9wasx4f/h7Vkpa2eULCyHZeScMpo9JRMxOdLt3in3ExRZuTGODaQVPtnt
	 uJSwZZQkTS2nVXEKm+fMQ2TFC2mk5fdrNZqzOB3i4w0EQRuG+taN1wg1OnsVeSBdV/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Ne/pmyuR";
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3494606A326
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 02:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3494606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ne/pmyuR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795486089; x=1827022089;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sqBPcTUIPaDZyuJ2z1p7urz7i4C+pnjj0SHUcuwMULc=;
  b=Ne/pmyuRk0zYZUxTQc1x+5aGvbabvbqN6YFWLW8g6EZ0TznuuNRExrvQ
   QjB4Md8OKQDLtIgW6Sh+rV+OqbJl7HNgEWmKu9ayJURzavw6rJt2GNdmC
   Ygjzu2joYDAWTABrKNyhr5RosXSD/bd2Zydb62j2fqFYvaHiZzZck6o4s
   XQNylndJuuHRkIamU6yAgaCphiMoFcAGSF/hF/USVCeCErHGkotgGBzEc
   6mpJakGHHKdP9XtwEeQfcKqshiXvgOYuiT8PUQwHGVmLugdNtNCNrg7BD
   esvZKWj0IpBnY0i3ZMkQJkgc+AFqtOWL9Jfu6nFHZq/xySnYF0crq7DJW
   A==;
X-CSE-ConnectionGUID: fVHu1yJGQlitlwtJfyPtKA==
X-CSE-MsgGUID: ewLYTft3Rde9NaFarGiqOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4153552"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4153552"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:03 -0800
X-CSE-ConnectionGUID: C5Rj3SzaQRapLtzyc7vVkg==
X-CSE-MsgGUID: m0dP1MpJTdG4Aif8twwoxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11621445"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:02 -0800
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
Subject: [PATCH v23 14/19] drm/xe/vsec: Crescent Island PMT callbacks
Date: Mon, 23 Nov 2026 18:08:06 -0800
Message-ID: <20261124020752.30551-35-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124020752.30551-21-michael.j.ruhl@intel.com>
References: <20261124020752.30551-21-michael.j.ruhl@intel.com>
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
 drivers/gpu/drm/xe/xe_vsec.c | 188 ++++++++++++++++++++++++++++++++++-
 1 file changed, 184 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a814d7151eea..77fbb1257e09 100644
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
@@ -358,20 +364,188 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
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
+ * * -ENODATA incorrect power state
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
+	if (xe->info.platform != XE_CRESCENTISLAND) {
+		ret = -EINVAL;
+		goto dev_exit;
+	}
+
+	if (!xe_pm_runtime_get_if_active(xe)) {
+		ret = -ENODATA;
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
+		goto runtime_exit;
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
+runtime_exit:
+	xe_pm_runtime_put(xe);
+dev_exit:
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
@@ -399,8 +573,14 @@ void xe_vsec_init(struct xe_device *xe)
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

