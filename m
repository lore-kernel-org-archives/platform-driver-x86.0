Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B25359C984
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 20:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157552; cv=none; b=Izo8bgmku+cPDCU+kDkTEBV5abtG9ow8EwCWjx66oLt1nAvAGLkOcIKi+Cq7IQyopQJfqCMdQItJf094B5XassUZEWioJzS1MvVpVDhw3iSrE8KnzwSef78aZkQyRFhNH6a65Iz05wI3GJldBbPV/zPlKTTbm2LGuymJCpa8AQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157552; c=relaxed/simple;
	bh=sKM43aVfLAv0gyA3UI5/EyolAr1agVZSK+qWtf3bx+g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDJ7ftRW6lebnlo97My1uKOFXUTYW0/7I1Pv259B2IHpZKdDCdAN8WmTZQ2NTLTChWn17EeFqQka8m4ObJ2x3pHk06iyeCqwINPpNHeDiIfpPKaDWIlQXpHGG6Wrr9soD54foqok/BON+ZdiiW479OFZqn4GafoFruz+RTVYYMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZsOnT7iR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZsOnT7iR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789157544; x=1820693544;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sKM43aVfLAv0gyA3UI5/EyolAr1agVZSK+qWtf3bx+g=;
  b=ZsOnT7iRqT2JkLA5Tg36HArb8GQjkcyi4BlOLVNSu+y+nLpJMUsmCCVc
   sOy3BK2DR8pjTbtHJSEIOrE5dGXvb5VPzTY+VwruYM+0ng4xmOFIBaqQa
   5ykZE0dvEYK1n/mAfX7M6OYMa8uNQ1N/2VTYWS15dA4lKPo7tdqDzFvTd
   ObXlcSjiLFJd7x7+XAZVEDTiVHkUW9irbhq6niNoD1JKlEAnoCuN1Qwbw
   +cj3WItA+47OYMhWiBhs3WrbkxquJFdiOcgF5VOXtZLFE7/E4rWeUHXEK
   LV0yqud4W1ZKHvNAU+rp7bbhp5DJ+x8TwReXpSMfdIN2DHKGVlE7GVAE5
   A==;
X-CSE-ConnectionGUID: bDT98cdJRLONPFiHF3fXeQ==
X-CSE-MsgGUID: g5/WbWeeSW602Xq5ipsF6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115162429"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="115162429"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
X-CSE-ConnectionGUID: mtV29LdfRua6cjAQqOQTHg==
X-CSE-MsgGUID: Q1ZZZ6jmR6a4hOmql/oQVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="277272115"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
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
Subject: [PATCH v8 16/20] drm/xe/vsec: Crescent Island PMT callbacks
Date: Fri, 11 Sep 2026 13:12:04 -0700
Message-ID: <20260911201148.1610547-38-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
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
index 9f00ae58b921..cb3d9142346c 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -362,17 +362,110 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
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
@@ -402,8 +495,17 @@ void xe_vsec_init(struct xe_device *xe)
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

