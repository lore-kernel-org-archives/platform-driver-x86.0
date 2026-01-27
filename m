Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835BD2C0282
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Jan 2026 18:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538284; cv=none; b=k2KBeyq6zBxCfnrwCqNae3dVfmdK0dBX8tMpkGp1VoKmPCoBh/ebe3ExazPZ++QnA4/oPSqHdQLnnI3nQZEDncq4HbmjDGD8wbV2qmUsdC0PJd2euvT8E3/OCcfT6iiJWswZF0c6O/0UJcJhtmLjWeM1JOly5nx9VGcw1DB3V+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538284; c=relaxed/simple;
	bh=YuZaUIH2rfg515A8RZR2pteX/JrL1zgJ7kaXD9PGLgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mS44H31tEjXorlknZs6tlovaECJkrAbB6MOqVry6Grl7kMkFOd4fC74NBSaRoJ2gOJb67vjNcqxVJppubGw22mWVtPsr3eUNtR8+Zwzhrm/YTV4KSMXIxV0T5BdJQVUKyK78itdgcIGrJIEDRpH2icSy2XSMGZsPXy264ckRW7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+hGtHt+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+hGtHt+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769538282; x=1801074282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YuZaUIH2rfg515A8RZR2pteX/JrL1zgJ7kaXD9PGLgs=;
  b=X+hGtHt+OBaW26qNaTbgc7MxDLcLZuxsFx0yLPVa+JVQS09jte8YV7RM
   bWMqwH7pthwN+HyuYxJlj6m+l71O7R9vIWHjfPC49m4DewQnwzDxxbmoS
   X5kxsA3bcKxMSccSjaJbJumWbBHEtD1HL9vQKMgJA6AjxjyB0/bq8kbyt
   ywngzq41izv2QKvZyMbvuMoLER4/viOZeIDF9DYUYrapy/iPUD6nQ+Ssa
   Sdi5HLleNuodqkwxrPxc6LEX1tZUFOJ2VclE3uRhRsSib+7+qWp44A2nB
   Tcfizc/qcSSi4iPZu79CLvY+J+zBwEmpvxoXlkTVaIvCQcjH+ptMRs/qH
   w==;
X-CSE-ConnectionGUID: FC4nekmBRdmC/cBPN5ZHfQ==
X-CSE-MsgGUID: QnTEDNgGQdWnChVVakWv/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70644452"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70644452"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 10:24:42 -0800
X-CSE-ConnectionGUID: 5CbSRKhhQ82veS5/UO3+yQ==
X-CSE-MsgGUID: EXtDJGymQUiMDYbp5xoggg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208491711"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.176])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 10:24:41 -0800
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
	david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 5/5] drm/xe/vsec: Crescent Island PMT callbacks
Date: Tue, 27 Jan 2026 13:24:24 -0500
Message-ID: <20260127182418.640701-12-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127182418.640701-7-michael.j.ruhl@intel.com>
References: <20260127182418.640701-7-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CRI PMT support requires callbacks to access the discovery status
and control areas.  Access is a common MMIO area that requires an
index to be set before access is allowed.

Introduce the necessary callbacks to get the status and control
information for CRI PMT usage.

Add the glue logic to register the CRI PMT functionality.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 84 ++++++++++++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 4bddc22d86c7..c5b0c16f23be 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -300,17 +300,89 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
 	return count;
 }
 
-static struct pmt_callbacks xe_pmt_cb = {
+/**
+ * xe_pmt_read_reg() - read a crashlog register
+ * @pdev: the pcie device that register the callback
+ * @guid: PMT guid of the crashlog instance
+ * @reg: data read from the PMT data structure
+ * @offset: which data to read from the PMT data structure
+ *
+ * Read the requested PMT register based on the pcie device and guid.  The
+ * supported struct is the Crashlog Type1 Version2.
+ *
+ * Currently this is for CRI only.
+ *
+ */
+static int xe_pmt_read_reg(struct pci_dev *pdev, u32 guid, u32 *reg, u32 offset)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	void __iomem *disc_addr = xe->mmio.regs;
+	u32 inst;
+
+	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
+	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
+		return -EINVAL;
+
+	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ? PUNIT_DISC_OFFSET : OOBMSM_DISC_OFFSET;
+	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
+
+	guard(mutex)(&xe->pmt.lock);
+
+	xe_pm_runtime_get(xe);
+
+	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+
+	memcpy_fromio(reg, disc_addr, sizeof(*reg));
+
+	xe_pm_runtime_put(xe);
+
+	return 0;
+}
+
+static int xe_pmt_write_reg(struct pci_dev *pdev, u32 guid, u32 reg, u32 offset)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	void __iomem *disc_addr = xe->mmio.regs;
+	u32 inst;
+
+	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
+	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
+		return -EINVAL;
+
+	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ? PUNIT_DISC_OFFSET : OOBMSM_DISC_OFFSET;
+	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
+
+	guard(mutex)(&xe->pmt.lock);
+
+	xe_pm_runtime_get(xe);
+
+	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+
+	memcpy_toio(disc_addr, &reg, sizeof(reg));
+
+	xe_pm_runtime_put(xe);
+
+	return 0;
+}
+
+static struct pmt_callbacks xe_bmg_pmt_cb = {
+	.read_telem = xe_pmt_telem_read,
+};
+
+static struct pmt_callbacks xe_cri_pmt_cb = {
 	.read_telem = xe_pmt_telem_read,
+	.read_reg = xe_pmt_read_reg,
+	.write_reg = xe_pmt_write_reg,
 };
 
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
@@ -338,8 +410,14 @@ void xe_vsec_init(struct xe_device *xe)
 
 	switch (platform) {
 	case XE_VSEC_BMG:
-		info->priv_data = &xe_pmt_cb;
+		info->priv_data = &xe_bmg_pmt_cb;
 		break;
+
+	case XE_VSEC_CRI:
+		info->priv_data = &xe_cri_pmt_cb;
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+		break;
+
 	default:
 		break;
 	}
-- 
2.52.0

