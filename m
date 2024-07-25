Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131E71993B2
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jul 2024 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721910157; cv=none; b=Yiz03ZKM7ygeZSPdsFEmlqxSlvARQkUrLi/Aku1TTzwVHMg0EITr0Zq1UPgqzm70HnZ0+B6zQYj6ik2Vok+9pI4QM1XTTorzL8Ek7dwPTE16p5YAcQrT69vC6R67doeX8v/KJCYZCZBDoQ5JUy3//vN1+CeAavHQ4bOdMNXUe6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721910157; c=relaxed/simple;
	bh=RQeVynFNJWMZiA1NUXjXMcUUg9YXZPZ7nQ4bUpE84eE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oo7406yQk93VgD+BHi2CTgs3G89IXB083P5FmlUnujmsE6mTevXB8Mu3atjSLA6XUXv01rsMPIGWAgmhD/9MutyQy3mrHyJA3SjDnaXsWxy5qpwAnTzBoB+hwWSS2YMjqvYN0XzYAZxIu5h0A//Sbd4+J7XuA73BwTUrhtvR3Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pmphp59I; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pmphp59I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721910156; x=1753446156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RQeVynFNJWMZiA1NUXjXMcUUg9YXZPZ7nQ4bUpE84eE=;
  b=Pmphp59IzE7XpSyA2sc0EpZbQ521QRq6sH8WaaZVUI1hArwYi5yS0D7u
   isjj6N4/nT5Ce2fWhSA/SH5vKxcLlD0M/v4qEiv1zv831Oq+xgDQ6WFUo
   prDfJ+Gw38JhWgREuDZgPsdy2h51DW46Qpq9vUBNietlcwS3TSEwe8agR
   RrXU+4ILkZ+Vrrk07xjavimWKewgBXTA5pQvThOtp+JYq3LpQMdCrKXc1
   tCOlw6WtVyaNs3iB+b6eGR1z/vIyJh6lwOO4eyxyU7ZDsVS3IH5CtszXs
   nbQ79v2iI9+knmogW6g/9tEKbHGRAJN6bHIT3uz3PYeS9lt6j7Z4xCSuo
   w==;
X-CSE-ConnectionGUID: kJ9vXvbvT/2gGtzUJmmJAQ==
X-CSE-MsgGUID: xG5wHfLESbaNSw1HdFwUYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="31060762"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="31060762"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:22:36 -0700
X-CSE-ConnectionGUID: jMkLR8JqSauY6H2aa5zXOg==
X-CSE-MsgGUID: I5xnvHm6QxuLAXskwXW/wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="52786205"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:22:35 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	andriy.shevchenko@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v8 6/6] drm/xe/vsec: Add support for DG2
Date: Thu, 25 Jul 2024 08:22:13 -0400
Message-ID: <20240725122214.4063886-7-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240725122214.4063886-1-michael.j.ruhl@intel.com>
References: <20240725122214.4063886-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PMT (DVSEC) offset information is based on the PCI BAR
for the telemetry (PCI) endpoint (also known as the P2SB).
However the DG2 endpoint is not completely functional,
and is disabled.

In order to allow access to the DG2 PMT features it is
necessary to inform the VSEC driver of the correct offset
via the base_adjust value.

This odjustment is the difference between the telemetry
offset (read from the PMT register) and the fixed offset in
the Xe SOC space.  Calculate the offset, and pass it to the
VSEC driver on header registration.

Update xe_vsec.c to include DG2 header information.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 78 ++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 2fb71257aa02..b1c870cec879 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -19,6 +19,16 @@
 
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
 
@@ -32,6 +42,20 @@
 #define SG_REMAP_INDEX1		XE_REG(SOC_BASE + 0x08)
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
@@ -48,10 +72,16 @@ static struct intel_vsec_header *bmg_capabilities[] = {
 
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
@@ -174,6 +204,7 @@ struct pmt_callbacks xe_pmt_cb = {
 };
 
 static const int vsec_platforms[] = {
+	[XE_DG2] = XE_VSEC_DG2,
 	[XE_BATTLEMAGE] = XE_VSEC_BMG,
 };
 
@@ -185,6 +216,46 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
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
+	addr = pci_resource_start(pdev, GFX_BAR) + info->headers[0]->offset;
+	base = ioremap_wc(addr, 16);
+	if (!base)
+		return -ENOMEM;
+
+	telem_offset = readl(base + TELEM_BASE_OFFSET);
+
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
@@ -196,6 +267,7 @@ void xe_vsec_init(struct xe_device *xe)
 	struct device *dev = xe->drm.dev;
 	struct pci_dev *pdev = to_pci_dev(dev);
 	enum xe_vsec platform;
+	u32 ret;
 
 	platform = get_platform_info(xe);
 	if (platform == XE_VSEC_UNKNOWN)
@@ -206,6 +278,12 @@ void xe_vsec_init(struct xe_device *xe)
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

