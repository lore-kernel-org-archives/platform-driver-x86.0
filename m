Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937363CB8FD
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 13:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024732; cv=none; b=BSBfVC8QGn67dO9fZx1UpmSzR9TmE0/ta2LORwOwhinee4JdtMvNgWFEiluD6dOm7ahJfBuycMiiBh+Cy5ASr4YFBBXMV5j58E68LXqhGGhisOBDY1Al2TANF4z3YZJcfNo3ME5yvKEGp3Yr4le8g2nNJ1OCfhD1iJ5hwGuRGrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024732; c=relaxed/simple;
	bh=LiFyH333vpKGNysDdq3/9ssCha4ZkPl21ex+06mTCxw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NsROG7f9EU90hfkonKYeDwBGE1ylkUS9qQHk3JAnNeC2kiyMZGj7coqiBJuFKP3OkZ3jU7aEmpg4QnnETE4xJw4hhCfcEOVMx34/fiK7Mwd7Gwm6OsSRnj9yEIMvDqfLITFs+W30QPBaieWCPkXcYNPZRx0KPW3fLZDAWosm7SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHI4qh6h; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHI4qh6h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786024722; x=1817560722;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LiFyH333vpKGNysDdq3/9ssCha4ZkPl21ex+06mTCxw=;
  b=gHI4qh6hdpwvg7LkdmmwokMJvQlz9dj5wpIngL6/JkP3+n/dtYpsl1X5
   vhWE7hgvqJgNc2emvl2mQhDg7D0X8Zfcti8OEVey4QUnGR8//ekvoISeS
   Qj/lADINavnOcIOs7FIZnLLSLiuscZryKqw9d3NPzHAkPpue7bF9Q0TKo
   thQFkyyDkOaMrANThlfpqTfCNpdFrsVqZ3ucegg342Zk8UXdHu95nRY+L
   omRmq8O6nC5wcthGbHMd+uNRAOQgVRbiKYp5ZX7okTU/NaqZNGpevDTvr
   cChaSUjSpPj/48NzuWzQKcc4SaiTX38UFy8C28AOIqp4pNH+Dmdpcc1i4
   A==;
X-CSE-ConnectionGUID: V36LMzZCSSqgnHvI14Sw5A==
X-CSE-MsgGUID: ni3MX/wjRi+irSBpTWdpVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="89141357"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="89141357"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:58:42 -0700
X-CSE-ConnectionGUID: cPUR11RLT8CzMyHYo/JoPA==
X-CSE-MsgGUID: SQ+TxcUmRfGI/xNHEskhTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="265594953"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:58:42 -0700
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
Subject: [PATCH 6/7] drm/xe/vsec: Crescent Island PMT callbacks
Date: Thu,  6 Aug 2026 06:58:26 -0700
Message-ID: <20260806135820.1422040-15-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
References: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
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
 drivers/gpu/drm/xe/xe_vsec.c | 85 ++++++++++++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 3849f99c1c91..b84ec9088de7 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -320,17 +320,90 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	return count;
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
+	void __iomem *disc_addr = xe->mmio.regs;
+	u32 inst;
+
+	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
+	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
+		return -EINVAL;
+
+	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
+		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
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
+static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
+{
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	void __iomem *disc_addr = xe->mmio.regs;
+	u32 inst;
+
+	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
+	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
+		return -EINVAL;
+
+	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
+		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
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
@@ -357,8 +430,14 @@ void xe_vsec_init(struct xe_device *xe)
 
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
2.43.0

