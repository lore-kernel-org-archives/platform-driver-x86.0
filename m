Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A7E1581E0
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jun 2024 12:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719319588; cv=none; b=u9BBxcRja0zqNS0bUDi0MPk4rIhQuGeESXGjz5aLMAEXyx6Hf94FhUa4M5EU8vzttvJiivRMW0QGEorhsCJ+qCazBYg8pIrin7Djt0z3PXAqKzmNXwQ43xtaRiXntVyCo6uezKr99kViiqGKhXKfMi6yarSqiY72rSbywZngVWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719319588; c=relaxed/simple;
	bh=2/V0+eg6RbZGazyrpMTfIkCUbzLzr9C9iNcfwfdec7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h4x9pcH3zV+Rtpb6KmjyCP92YOzQDJ9fyszCv2bJXJvLG1kBoxa/TcnheeQKVm0BseaNkiO0O/VHgqYKOQyptvHKMugBbGwZy14XrkjwaUt00rO89BcoAxyDV5SqDvDf90OmBgDeLNgbkzhuk9UfctgknDDs11wu1Ywfh/h8ofg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SaejKL68; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SaejKL68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719319586; x=1750855586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2/V0+eg6RbZGazyrpMTfIkCUbzLzr9C9iNcfwfdec7o=;
  b=SaejKL68JFkF5Srj3298zF06uGG+slpVp6MHl2X2u4bvHj4vFKyxhce9
   2BvIreiY7mXMsv8ooHrq1PT0J7q2Gd/9hAzlDZhbKZLUni0/OVrdEf5qW
   hTyzJMlB6sV2OcplvyhC6mcC8Uimm3YY/XQnA/yV2HVU6KTMTbfTTIrA5
   9X18L7m8T74fdyb41heZu1xdOfw+It07t1NwPuZ9+/uAGqVpqc8FXICcP
   Zqg4rVeNG1D6pkWEma/hkysP3Y3blTbAX3hJgzUzPTrk6ZqjzJ/sq8ZzU
   ZggbLygjqcLFzthIckJKad38VWFDgFudkuBCXjh5y9XzQEhGagATEpGUn
   Q==;
X-CSE-ConnectionGUID: bwrNev5UQFukb7y858WmiQ==
X-CSE-MsgGUID: kdiPq976T2y6gvhqSU7Lyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26955349"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="26955349"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 05:46:25 -0700
X-CSE-ConnectionGUID: i2d/NfzhTPyaAcyZXs2f8g==
X-CSE-MsgGUID: Xecy6owqTUq+VRjokrmzQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="48547093"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 05:46:23 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v3 6/6] drm/xe/vsec: Add support for DG2
Date: Tue, 25 Jun 2024 08:45:52 -0400
Message-ID: <20240625124554.3358460-7-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240625124554.3358460-1-michael.j.ruhl@intel.com>
References: <20240625124554.3358460-1-michael.j.ruhl@intel.com>
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
index a8afef731379..a0a154657816 100644
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
 
@@ -27,6 +37,20 @@
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
@@ -43,10 +67,16 @@ static struct intel_vsec_header *bmg_capabilities[] = {
 
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
@@ -166,6 +196,7 @@ struct pmt_callbacks xe_pmt_cb = {
 };
 
 static const int vsec_platforms[] = {
+	[XE_DG2] = XE_VSEC_DG2,
 	[XE_BATTLEMAGE] = XE_VSEC_BMG,
 };
 
@@ -177,6 +208,49 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
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
  * intel_vsec_init - Initialize resources and add intel_vsec auxiliary
  * interface
@@ -188,6 +262,7 @@ void xe_vsec_init(struct xe_device *xe)
 	struct device *dev = xe->drm.dev;
 	struct pci_dev *pdev = to_pci_dev(dev);
 	enum xe_vsec platform;
+	u32 ret;
 
 	platform = get_platform_info(xe);
 	if (platform == XE_VSEC_UNKNOWN)
@@ -198,6 +273,12 @@ void xe_vsec_init(struct xe_device *xe)
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

