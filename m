Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF17851D500
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Sep 2026 18:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546315; cv=none; b=hxXW0AMglMWUwbST0q8791iER/5eImLA9a7Soq5iRNrDukEa1h6Ktgn9WoObYvp0A7NjcwxuEhKVAn8+PNaeLNc0OxbRp/p0//OEhWWFOfJcENbieb4sNxO7Jgpo6nQfQjvyJr7/MqKfPaXJkeZCsfUxlnhTS55uian2GJ+1el0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546315; c=relaxed/simple;
	bh=fjwkr/Z1pN/MIxYMNdUFZMoD8uLMGgib/nglvMWQxBI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJbFvkMeXF4zI835XfTdT7Ys/74WluK23RWs/9vRdausbqnCWKPjuKwbcV8bxdBRi9lGvPoW6tYOaE41id1wLILeGMGhSX7fZVTRsnbVw/NWli2VRNSGsnS2wlPelRaPrFSoAt1SY35ndRyH5w64ybAiWcbd8uxJGoklLja1mlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hafttxLo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hafttxLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788546314; x=1820082314;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fjwkr/Z1pN/MIxYMNdUFZMoD8uLMGgib/nglvMWQxBI=;
  b=hafttxLoHTf19CsvCOD2fM+QThqo6hmWw4xRCqEpp3IKrgjjEmm0tF0a
   7JW3dfITWeAuFUC3WiAtgkAV/XjtFeZ/4zlKTvo9causFMHALocU0Dx7V
   2Ej+yDY2n7VTuKTPNU5ucxy9PWoHCIBt2bzQgMIBoEgjy3yQ6qqR+a2za
   mIpyzbukUwYawqzEiW7rEkdBmeQc/MuPRGmn/K+dEaJLe+ruH43bPLkeC
   e7qFenHTG7Pba4yKTODFKHpjQne9YUsEprXGh7sT5ynzCe09yh6GywUHC
   +fKFN9OAK5iSnMFuaWKSNxGU+8ajims1pbuzL3QV3dT9H6RumHB4Eaeqi
   w==;
X-CSE-ConnectionGUID: cFi8RpD6TWu6PVDXp3wCDA==
X-CSE-MsgGUID: I3UfOQp+SlaaFwQkgo66pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88932251"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88932251"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:25:12 -0700
X-CSE-ConnectionGUID: a8fjFz2wQ7yDcUAUjh9sVA==
X-CSE-MsgGUID: UScnAdHyTQGYeohOHv2C5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="294992500"
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
Subject: [PATCH v6 14/18] drm/xe/vsec: Crescent Island PMT callbacks
Date: Fri,  4 Sep 2026 11:25:04 -0700
Message-ID: <20260904182451.1164868-34-michael.j.ruhl@intel.com>
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

CRI PMT support requires callbacks to access the discovery status and
control areas. Access is a common MMIO area that requires an index to
be set before access is allowed.

Introduce the necessary callbacks to get the status and control
information for CRI PMT usage.

Add the glue logic to register the CRI PMT functionality.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 108 ++++++++++++++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 22c4efb02132..7c3f9938701e 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -356,17 +356,110 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	return ret == 0 ? count : ret;
 }
 
-static struct pmt_callbacks xe_pmt_cb = {
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
+ */
+static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
+{
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	void __iomem *disc_addr = xe->mmio.regs + xe->pmt.base_offset;
+	int ret = 0;
+	u32 inst;
+	int idx;
+
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
+	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
+	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG) {
+		ret = -EINVAL;
+		goto dev_exit;
+	}
+
+	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
+		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
+	disc_addr += inst + offset;
+
+	xe_pm_runtime_get(xe);
+	mutex_lock(&xe->pmt.lock);
+
+	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+
+	*reg = readl(disc_addr);
+
+	mutex_unlock(&xe->pmt.lock);
+	xe_pm_runtime_put(xe);
+
+dev_exit:
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
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
+	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
+	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG) {
+		ret = -EINVAL;
+		goto dev_exit;
+	}
+
+	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
+		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
+	disc_addr += inst + offset;
+
+	xe_pm_runtime_get(xe);
+	mutex_lock(&xe->pmt.lock);
+
+	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+
+	writel(reg, disc_addr);
+
+	mutex_unlock(&xe->pmt.lock);
+	xe_pm_runtime_put(xe);
+
+dev_exit:
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
 
 	return vsec_platforms[xe->info.platform];
@@ -396,8 +489,17 @@ void xe_vsec_init(struct xe_device *xe)
 		if (IS_SRIOV_VF(xe))
 			return;
 		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
-		info->priv_data = &xe_pmt_cb;
+		info->priv_data = &xe_bmg_pmt_cb;
 		break;
+
+	case XE_VSEC_CRI:
+		if (IS_SRIOV_VF(xe))
+			return;
+		xe->pmt.base_offset = CRI_PMT_OFFSET;
+		info->priv_data = &xe_cri_pmt_cb;
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+		break;
+
 	default:
 		break;
 	}
-- 
2.43.0

