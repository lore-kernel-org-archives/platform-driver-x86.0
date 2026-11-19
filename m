Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103700;
	b=ab1NfhvXlinw6w+pfIFzQ/vRFlK+0GyM6XplEyDj50cVf/rr76urluFzkZjU9yxPTQnJ
	 fo/+TNgHh0fCc8B4BWsB1L3nANAe/fFV9LuI/tS2QJNC1OA5dx/C1sSO2IZsdjlugZi32
	 pcsrAtVdxa88piULB+nSE6K8fMZV8sesWoVbQJcQUzCH40G+Aj0D03ZNI6eG5AZ7A0WeI
	 0ea3Zk8JKpWmCinohbWM8CopBohiZRk8LWtlUpbQ9rpjxmD6L1qsE8RDMIpXVEBq3icec
	 hLySsblVFmYkkqGUuvWPCVGIgPlla8qD05NuF7EPTD27DREcyG92JCZ+mfnV4XOJR0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103700;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M7HGb6lcY+VbvEtmBpss5XnqNam43vEeFVOkucu+MWw=;
	b=vRkZSqJ8XNm8FTo2jQm0JKRudjR8vQn0UuCRyD0ML74PgmwkJ0IEpRRI9n+JaHy++98M
	 Gvc3GidtEYfv2JqhfX6gbO6b03BnqGfBnf/7Nbllf4EBB1V6zxbRV3O1/kymeS7YHw753
	 uaoK1JGRuEuJ7JAd3MFKZ5bm85UTpqcA7OGgIdAwY5VYPgWJ5W03c6Nix8w3L97YpEZRz
	 0SaWx7+v6Ln9p9d6hKcp0xLUz2YHMbnGff7tu9oy6RyiZ3/qKXHeek4GSPsu6rXtjIGY7
	 yQPssbkcF0MP3tzjg/fQADsnv0DuIvmtASAYLg3WrW/1+1bUXjSY0DGUvCXiI2uYkyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LVoQkTl2;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE450606A333
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 15:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE450606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LVoQkTl2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795103699; x=1826639699;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=hv7b7abru+NltWhhEL1A4PVUIn/KpoF35i3m9Mfjdbg=;
  b=LVoQkTl2KNp+X/BY0YzNvn14xejs6M4FCrNk0Sjco9Ie44/TrZK8l439
   cATgOw/Mg+rkFbTHztSn9qFIRTiEjxXlJu5JJVK6LDEvj2MZQOUoDpFkV
   lelzf6tpIDsuLo5HxCwu74cKCP7N/tP+U9VrNLmKBtar8jyRJVvHICL//
   bC/9g1bEyRTtD521y50H29M8x7eguzzEnLqrNj5grwCj/MWHVAgY7dQGC
   5zUeO82tUGipX/Box6TpCJm/HmB6zRirWCCpPKRvATXC60jGBLFZE9Ann
   /6Ab6ZqJI6Wgil0G8bXXWYgRvC7T16XDNLX1gMAvv4ZI317jVazcpizZ2
   A==;
X-CSE-ConnectionGUID: 73jo9pKBToqEomvapj9cLA==
X-CSE-MsgGUID: YDrB1sEBTXeaE+YY2phA0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3849035"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3849035"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:55 -0800
X-CSE-ConnectionGUID: 0HjrSY7vSX6/BNTOZcfhQw==
X-CSE-MsgGUID: K5t/6b5jTOydThCYYMQ9MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10263431"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:53 -0800
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
Subject: [PATCH v19 14/19] drm/xe/vsec: Crescent Island PMT callbacks
Date: Thu, 19 Nov 2026 07:54:52 -0800
Message-ID: <20261119155438.40762-35-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119155438.40762-21-michael.j.ruhl@intel.com>
References: <20261119155438.40762-21-michael.j.ruhl@intel.com>
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
 drivers/gpu/drm/xe/xe_vsec.c | 178 ++++++++++++++++++++++++++++++++++-
 1 file changed, 174 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a814d7151eea..58eb85fb6a9f 100644
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
@@ -358,20 +364,178 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	return ret == 0 ? count : ret;
 }
 
-static struct pmt_callbacks xe_pmt_cb = {
+/**
+ * xe_pmt_discovery_read - Given a device and an index, read discovery data into a buffer
+ * @dev: valid Xe device
+ * @cap_id: PMT type
+ * @element: element to access
+ * @disc_data: buffer for discovery data
+ * @count: bytes to read
+ *
+ * This is a callback API.  I.e this can be accessed external to the XE driver
+ * (PMT driver scope).  Because of this, DRM hotplug needs to be verified
+ * (drm_dev_enter()).
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
@@ -399,8 +563,14 @@ void xe_vsec_init(struct xe_device *xe)
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

