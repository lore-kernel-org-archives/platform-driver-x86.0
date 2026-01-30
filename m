Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF772FB622
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Jan 2026 13:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769780224; cv=none; b=GC3ED+RvaeGesnUayhXRmQ5nbjF6NfCA30fbwtyCs4F/Owd3YVusKgoeign6h1UaSE1X9mQOyMTP4d6cGDHW6a/raOSIjYFMsTf2ILMhyPdWVZCncFm72GoAK6EJ1pceIoW3dyohuuZrAjAWBZ8aqvzQe/jQ76ge0sskzitACes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769780224; c=relaxed/simple;
	bh=UM62ax1nBy6AaLM1JiRsgze1L6LTaypaUhTyT7hi0bE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CdowklIru2yQG5JEDnODi1WWj2ToZVi+UiVl+8g3xUqJxXOMV8/AUYXNV5XicmuLnq29ao+qYCFlMfByY5eF04Utw71QRLif1/td0w9RMV8onBljsUSxQfadIuTU2A6n1p9BtyrP+vf+13p/ZEFYl6xPkz3KhLNEKOtH9+9Q0jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvVL6XGZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvVL6XGZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769780224; x=1801316224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UM62ax1nBy6AaLM1JiRsgze1L6LTaypaUhTyT7hi0bE=;
  b=jvVL6XGZqI78LAUnTYHwH8OZrJDPXsbzYWz+gTsU9QnicKaCUldJTaTA
   wa9XAiXeLadsdcO/idSMDIlQDSSKcpi1GkwSibP00ZSG4BQl9kTmxdjfr
   DcFDuyG4qzRHI0SFxeRRreHaOiEpwh5hDCDrxRn3l/YKesYfIbZLAIaOo
   drjBVrG3VUk78m1QOYOSdI/O0wm8o18w5OowI/1G9y2W5yrZWqfkVArlk
   hggIhgaXPTOERZi3aOX6a+f+y9v4D/IekrPHZBJQ8+hI6ya46tfb1QHcQ
   vOJx/Leqerc6fM8ppuk9BEy6MB+EyVQeTjSjtiDDSUUaZKnsKivA10/eb
   Q==;
X-CSE-ConnectionGUID: qdMra2BCQKOJ4tKnD+9a4g==
X-CSE-MsgGUID: Ipzk1AtyTsSKIV6WzE6ouw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71194403"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="71194403"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 05:37:03 -0800
X-CSE-ConnectionGUID: uuNqmfQ5T+uZNnys09v/rg==
X-CSE-MsgGUID: 23LJwWmST26eJpa8ePX24g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="207983252"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.170])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 05:37:02 -0800
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
Subject: [PATCH v2 4/5] drm/xe/vsec: Crescent Island PMT decode
Date: Fri, 30 Jan 2026 08:36:44 -0500
Message-ID: <20260130133639.765378-11-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130133639.765378-7-michael.j.ruhl@intel.com>
References: <20260130133639.765378-7-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Crescent Island (CRI) has different index and offset values for
accessing the PMT data area.

Update the decode path to support the CRI device.

Update the data read callback so to support the CRI usage.

Define several magic numbers.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 113 +++++++++++++++++++++++++++++------
 1 file changed, 95 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 254f7ebca6eb..c43b0d554ead 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -116,10 +116,27 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
 #define GUID_CAP_TYPE		GENMASK(29, 28)
 #define GUID_RECORD_ID		GENMASK(31, 30)
 
-#define PUNIT_TELEMETRY_OFFSET		0x0200
-#define PUNIT_WATCHER_OFFSET		0x14A0
-#define OOBMSM_0_WATCHER_OFFSET		0x18D8
-#define OOBMSM_1_TELEMETRY_OFFSET	0x1000
+#define BMG_IDX_TELEM_PUNIT		0x00
+#define BMG_IDX_TELEM_OOBMSM		0x01
+#define BMG_IDX_CRASHLOG_PUNIT		0x02
+#define BMG_IDX_CRASHLOG_OOBMSM		0x04
+
+#define BMG_PUNIT_TELEMETRY_OFFSET	0x0200
+#define BMG_PUNIT_WATCHER_OFFSET	0x14A0
+#define BMG_OOBMSM_0_WATCHER_OFFSET	0x18D8
+#define BMG_OOBMSM_1_TELEMETRY_OFFSET	0x1000
+
+#define CRI_IDX_TELEM_DISCOVERY		0x00
+#define CRI_IDX_TELEM_PUNIT		0x01
+#define CRI_IDX_TELEM_OOBMSM		0x02
+#define CRI_IDX_CRASHLOG_PUNIT		0x03
+#define CRI_IDX_CRASHLOG_OOBMSM		0x04
+
+#define CRI_PUNIT_TELEMETRY_OFFSET	0x0200
+#define CRI_PUNIT_WATCHER_OFFSET	0x00A0
+#define CRI_OOBMSM_0_WATCHER_OFFSET	0x04F8
+#define CRI_OOBMSM_1_TELEMETRY_OFFSET	0x1800
+#define CRI_PUNIT_CRASHLOG_OFFSET	0x0660
 
 enum record_id {
 	PUNIT,
@@ -133,44 +150,81 @@ enum capability {
 	WATCHER,
 };
 
-static int xe_guid_decode(u32 guid, int *index, u32 *offset)
+static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
 {
 	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
 	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
-	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
 
-	if (device_id != BMG_DEVICE_ID)
-		return -ENODEV;
+	*offset = 0;
 
-	if (cap_type > WATCHER)
+	if (cap_type == CRASHLOG) {
+		*index = record_id == PUNIT ? BMG_IDX_CRASHLOG_PUNIT : BMG_IDX_CRASHLOG_OOBMSM;
+		return 0;
+	}
+
+	switch (record_id) {
+	case PUNIT:
+		*index = BMG_IDX_TELEM_PUNIT;
+		if (cap_type == TELEMETRY)
+			*offset = BMG_PUNIT_TELEMETRY_OFFSET;
+		else
+			*offset = BMG_PUNIT_WATCHER_OFFSET;
+		break;
+
+	case OOBMSM_0:
+		*index = BMG_IDX_TELEM_OOBMSM;
+		if (cap_type == WATCHER)
+			*offset = BMG_OOBMSM_0_WATCHER_OFFSET;
+		break;
+
+	case OOBMSM_1:
+		*index = BMG_IDX_TELEM_OOBMSM;
+		if (cap_type == TELEMETRY)
+			*offset = BMG_OOBMSM_1_TELEMETRY_OFFSET;
+		break;
+	default:
 		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int cri_guid_decode(u32 guid, int *index, u32 *offset)
+{
+	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
+	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
 
 	*offset = 0;
 
 	if (cap_type == CRASHLOG) {
-		*index = record_id == PUNIT ? 2 : 4;
+		if (record_id == PUNIT) {
+			*index = CRI_IDX_CRASHLOG_PUNIT;
+			*offset = CRI_PUNIT_CRASHLOG_OFFSET;
+		} else {
+			*index = CRI_IDX_CRASHLOG_OOBMSM;
+		}
 		return 0;
 	}
 
 	switch (record_id) {
 	case PUNIT:
-		*index = 0;
+		*index = CRI_IDX_TELEM_PUNIT;
 		if (cap_type == TELEMETRY)
-			*offset = PUNIT_TELEMETRY_OFFSET;
+			*offset = CRI_PUNIT_TELEMETRY_OFFSET;
 		else
-			*offset = PUNIT_WATCHER_OFFSET;
+			*offset = CRI_PUNIT_WATCHER_OFFSET;
 		break;
 
 	case OOBMSM_0:
-		*index = 1;
+		*index = CRI_IDX_TELEM_OOBMSM;
 		if (cap_type == WATCHER)
-			*offset = OOBMSM_0_WATCHER_OFFSET;
+			*offset = CRI_OOBMSM_0_WATCHER_OFFSET;
 		break;
 
 	case OOBMSM_1:
-		*index = 1;
+		*index = CRI_IDX_TELEM_OOBMSM;
 		if (cap_type == TELEMETRY)
-			*offset = OOBMSM_1_TELEMETRY_OFFSET;
+			*offset = CRI_OOBMSM_1_TELEMETRY_OFFSET;
 		break;
 	default:
 		return -EINVAL;
@@ -179,12 +233,30 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	return 0;
 }
 
+static int xe_guid_decode(u32 guid, int *index, u32 *offset)
+{
+	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
+	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
+
+	if (cap_type > WATCHER)
+		return -EINVAL;
+
+	if (device_id == BMG_DEVICE_ID)
+		return bmg_guid_decode(guid, index, offset);
+
+	if (device_id == CRI_DEVICE_ID)
+		return cri_guid_decode(guid, index, offset);
+
+	return -ENODEV;
+}
+
 int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_offset,
 		      u32 count)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
-	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
 	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
+	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
+	void __iomem *telem_addr = xe->mmio.regs;
 	u32 mem_region;
 	u32 offset;
 	int ret;
@@ -193,6 +265,11 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
 	if (ret)
 		return ret;
 
+	if (device_id == BMG_DEVICE_ID)
+		telem_addr += BMG_TELEMETRY_OFFSET;
+	else
+		telem_addr += CRI_TELEMETRY_OFFSET;
+
 	telem_addr += offset + user_offset;
 
 	guard(mutex)(&xe->pmt.lock);
-- 
2.52.0

