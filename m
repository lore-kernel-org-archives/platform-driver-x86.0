Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E67F16132B
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jul 2024 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719843478; cv=none; b=hGganpiKADpnFThQ//+9VYp+dSGT695Z4yCkkQZv458BTHyhgar8Vzp+15TPOI2ETq6wQ2x7ZFZyj/X82VuvI0xqEf2pBs1QadW2hHSwCxirCFPW3z2xq2YMA0XliD6kuE/h4KbDExR79dGRIpODQ2yeVMZCjcSLRgCKFEqK0mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719843478; c=relaxed/simple;
	bh=G+xFkXgVDRaidcaqwLq5nuLfh2O9tzzVG8N/zRGSvmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8ydJlxrFrsOECcXQPLlbvj6w1i7yz8Zml+uKDaDV44/RRhcWi3U/OCyB1UiB22QNNM4jYlJfrZXSrIT60sMjKh2A7o59PtdLWLOm2NniFa2Seecsbgme1QPNLQph/e84OZqzIiiGsvts0OwlYuaEQf1bLx/X8MbJh7F4XmzB2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjfUU2GZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjfUU2GZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719843478; x=1751379478;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G+xFkXgVDRaidcaqwLq5nuLfh2O9tzzVG8N/zRGSvmo=;
  b=jjfUU2GZih8Lgm6HngY6G+YZwsy7A62qQUS7ZsXXhFph8JdS3W1hzpUO
   F1BVVJrRkVVRvqDI7n5wugXtt667M/5AFoORcIecFfB8PEUcDqV72zy75
   HuGPzZcZxKoTSA0yoEcWFwvfMtY8YD9C8/ZwoM/L3bDX9+dZ8GIoS5GRS
   qQ13Dw4y3pSfb3a2SkfLxrOMGa7H5tfgFasi71CGiKgLWAb3m6MXtQcHT
   Wx8q59pyjcbiQrjVF6pyxg4HItp3v0IjQna3lncNfGuh1jLz8ohuAqyhj
   uuJ1/kcL1llfahsDS5lTsZEsBxN+V7wSMvdJNihf/9mSQbdyBEIP93/3f
   w==;
X-CSE-ConnectionGUID: BO0FNMPbSAKnaVgK+c7xBA==
X-CSE-MsgGUID: s/mrEIGTShO8HLpmhfE2EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="27566480"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; 
   d="scan'208";a="27566480"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 07:17:54 -0700
X-CSE-ConnectionGUID: FnjPYmMzTtCZnHV+Y+nAFw==
X-CSE-MsgGUID: oeEeMOHNT5alK/y96vmg8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; 
   d="scan'208";a="49880794"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 07:17:52 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v5 6/6] drm/xe/vsec: Add support for DG2
Date: Mon,  1 Jul 2024 10:17:27 -0400
Message-ID: <20240701141730.3585133-7-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240701141730.3585133-1-michael.j.ruhl@intel.com>
References: <20240701141730.3585133-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DG2 needs to adjust the discovery offset WRT the GT BAR not the
P2SB bar so add the base_adjust value to allow for the difference
to be used.

Update xe_vsec.c to include DG2 header information.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index dfd42153bc76..68befc410ff3 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -15,6 +15,16 @@
 
 #define SOC_BASE		0x280000
 
+/* from drivers/platform/x86/intel/pmt/telemetry.c */
+#define TELEM_BASE_OFFSET	0x8
+
+#define DG2_PMT_BASE		0xE8000
+#define DG2_DISCOVERY_START	0x6000
+#define DG2_TELEM_START		0x4000
+
+#define DG2_DISCOVERY_OFFSET	(SOC_BASE + DG2_PMT_BASE + DG2_DISCOVERY_START)
+#define DG2_TELEM_OFFSET	(SOC_BASE + DG2_PMT_BASE + DG2_TELEM_START)
+
 #define BMG_PMT_BASE		0xDB000
 #define BMG_DISCOVERY_OFFSET	(SOC_BASE + BMG_PMT_BASE)
 
@@ -29,6 +39,20 @@
 #define SG_REMAP_ACCESS(_mem)	((_mem) << 24)
 #define SG_REMAP_BITS		GENMASK(31, 24)
 
+static struct intel_vsec_header dg2_telemetry = {
+	.length = 0x10,
+	.id = VSEC_ID_TELEMETRY,
+	.num_entries = 1,
+	.entry_size = 3,
+	.tbir = GFX_BAR,
+	.offset = DG2_DISCOVERY_OFFSET,
+};
+
+static struct intel_vsec_header *dg2_capabilities[] = {
+	&dg2_telemetry,
+	NULL
+};
+
 static struct intel_vsec_header bmg_telemetry = {
 	.length = 0x10,
 	.id = VSEC_ID_TELEMETRY,
@@ -45,10 +69,16 @@ static struct intel_vsec_header *bmg_capabilities[] = {
 
 enum xe_vsec {
 	XE_VSEC_UNKNOWN = 0,
+	XE_VSEC_DG2,
 	XE_VSEC_BMG,
 };
 
 static struct intel_vsec_platform_info xe_vsec_info[] = {
+	[XE_VSEC_DG2] = {
+		.caps = VSEC_CAP_TELEMETRY,
+		.headers = dg2_capabilities,
+		.quirks = VSEC_QUIRK_EARLY_HW,
+	},
 	[XE_VSEC_BMG] = {
 		.caps = VSEC_CAP_TELEMETRY,
 		.headers = bmg_capabilities,
@@ -173,6 +203,7 @@ struct pmt_callbacks xe_pmt_cb = {
 };
 
 static const int vsec_platforms[] = {
+	[XE_DG2] = XE_VSEC_DG2,
 	[XE_BATTLEMAGE] = XE_VSEC_BMG,
 };
 
@@ -184,6 +215,49 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
 	return vsec_platforms[xe->info.platform];
 }
 
+/*
+ * Access the DG2 PMT MMIO discovery table
+ *
+ * The intel_vsec driver does not typically access the discovery table.
+ * Instead, it creates a memory resource for the table and passes it
+ * to the PMT telemetry driver. Each discovery table contains 3 items,
+ *    - GUID
+ *    - Telemetry size
+ *    - Telemetry offset (offset from P2SB BAR, not GT)
+ *
+ * For DG2 we know what the telemetry offset is, but we still need to
+ * use the discovery table to pass the GUID and the size. So figure
+ * out the difference between the P2SB offset and the GT offset and
+ * save this so that the telemetry driver can use it to adjust the
+ * value.
+ */
+static int dg2_adjust_offset(struct pci_dev *pdev, struct device *dev,
+			     struct intel_vsec_platform_info *info)
+{
+	void __iomem *base;
+	u32 telem_offset;
+	u64 addr;
+
+	/* compile check to verify that quirk has P2SB quirk added */
+
+	addr = pci_resource_start(pdev, GFX_BAR) + info->headers[0]->offset;
+	base = ioremap_wc(addr, 16);
+	if (!base)
+		return -ENOMEM;
+
+	telem_offset = readl(base + TELEM_BASE_OFFSET);
+
+	/* Use the base_addr + P2SB quirk to pass this info */
+	if (telem_offset < DG2_TELEM_OFFSET)
+		info->base_adjust = -(DG2_TELEM_OFFSET - telem_offset);
+	else
+		info->base_adjust = -(telem_offset - DG2_TELEM_OFFSET);
+
+	iounmap(base);
+
+	return 0;
+}
+
 /**
  * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
  * interface
@@ -195,6 +269,7 @@ void xe_vsec_init(struct xe_device *xe)
 	struct device *dev = xe->drm.dev;
 	struct pci_dev *pdev = to_pci_dev(dev);
 	enum xe_vsec platform;
+	u32 ret;
 
 	platform = get_platform_info(xe);
 	if (platform == XE_VSEC_UNKNOWN)
@@ -205,6 +280,12 @@ void xe_vsec_init(struct xe_device *xe)
 		return;
 
 	switch (platform) {
+	case XE_VSEC_DG2:
+		ret = dg2_adjust_offset(pdev, dev, info);
+		if (ret)
+			return;
+		break;
+
 	case XE_VSEC_BMG:
 		info->priv_data = &xe_pmt_cb;
 		break;
-- 
2.44.0

