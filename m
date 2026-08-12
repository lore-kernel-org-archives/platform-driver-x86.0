Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430F9379C50
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563483; cv=none; b=ixXgOCyg+3KlJ2Km69Fc4ljpLciLLbtx6iuDdNT/+J2AzsErsnInUGmWkWLoL6mlzx1czS8Sfcbh69ZncYapEfURhuS/LCST3kKOpDFiwqVh6A/26+V9vx0+vLQ8DesEBWXc0Y0jSptVpPObL3hVIaOTI35l07E4BGs6xGWpeRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563483; c=relaxed/simple;
	bh=R/XMgeJJJqz20Lot1p5bev7hVRkd4M/VrKltmJJJq9Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XLjS4HG2OjWfJkrAcxYO870R3Ryry6kGxJy/rNCma3GGUcOjTHKMs6t2ThL8ebdU/gX1LlW21r7rysZJsF0DdNz0pdj1f7t+RHrCiUIV25sJkuxMy9TxCC6OgnWsk40jm3PThPcudBA3ikymONeMGA88d+3ZMcpdrIXfDFxD6Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpkCvs5S; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpkCvs5S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786563482; x=1818099482;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=R/XMgeJJJqz20Lot1p5bev7hVRkd4M/VrKltmJJJq9Y=;
  b=LpkCvs5StLL6nNbvfz9lCx3KcLHDqPWSm8i6Z1yNqTqbGoOpILu4MBUA
   vzym7T2Ss6ec9K82+ozrh1l65FE0Beq4ZbHw7GKpAcdolP9U4af+mWWS8
   KY95qUe22y5xPK7YxxbEgmMhUpDlhGgTtP+dquTWS+6peFLmnJAGONVDo
   3YTRVwIPSORhSMNbPfCOqexANxQdu4S1+KFJxATC1oN9+E/3rCFsp5BhD
   +gu2rfSAuGPiGnBtoguIIz31gM7vJmzo/EWV9vPi7fyLxriNnFoZSkvNE
   v1LruGIC8obHQhQ5otmUJC/EmG/OLJw5HwvhUlFoz+HRfcJz08O0wjiMA
   A==;
X-CSE-ConnectionGUID: re6mHi8vS0mUT2JK2m5NQg==
X-CSE-MsgGUID: N1WcL0zjT3qdZgG7qV2ctQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104515402"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="104515402"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:38:02 -0700
X-CSE-ConnectionGUID: CwjP1XGAQfS5esERqMoN9A==
X-CSE-MsgGUID: fspd06/VTMe8zcRhOiPpcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="263779947"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:38:01 -0700
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
Subject: [PATCH v2 07/10] drm/xe/vsec: Crescent Island PMT decode
Date: Wed, 12 Aug 2026 12:37:48 -0700
Message-ID: <20260812193742.2170188-19-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Crescent Island (CRI) has different index and offset values for
accessing the PMT data area.

Update the decode path to support the CRI device.

Update the data read callback so to support the CRI usage.

Define several magic numbers.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |   2 +
 drivers/gpu/drm/xe/xe_vsec.c         | 135 ++++++++++++++++++++++-----
 2 files changed, 114 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 180d450a6deb..3f1a70813a99 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -466,6 +466,8 @@ struct xe_device {
 	struct {
 		/** @pmt.lock: protect access for telemetry data */
 		struct mutex lock;
+		/** @pmt.base_offset: device specific base offset */
+		u64 base_offset;
 	} pmt;
 
 	/** @soc_remapper: SoC remapper object */
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 6345b0b4b26b..dc42b9492428 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -108,23 +108,47 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
 /*
  * The GUID will have the following bits to decode:
  *   [0:3]   - {Telemetry space iteration number (0,1,..)}
- *   [4:7]   - Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
+ *   [4:7]   - BMG Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
+ *   [4:5]   - CRI Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
+ *   [6:7]   - CRI Instance
  *   [8:11]  - SOC_SKU
  *   [12:27] – Device ID – changes for each down bin SKU’s
  *   [28:29] - Capability Type (Crashlog-0, Telemetry Aggregator-1, Watcher-2)
  *   [30:31] - Record-ID (0-PUNIT, 1-OOBMSM_0, 2-OOBMSM_1)
  */
 #define GUID_TELEM_ITERATION	GENMASK(3, 0)
-#define GUID_SEGMENT		GENMASK(7, 4)
 #define GUID_SOC_SKU		GENMASK(11, 8)
 #define GUID_DEVICE_ID		GENMASK(27, 12)
 #define GUID_CAP_TYPE		GENMASK(29, 28)
 #define GUID_RECORD_ID		GENMASK(31, 30)
 
-#define PUNIT_TELEMETRY_OFFSET		0x0200
-#define PUNIT_WATCHER_OFFSET		0x14A0
-#define OOBMSM_0_WATCHER_OFFSET		0x18D8
-#define OOBMSM_1_TELEMETRY_OFFSET	0x1000
+#define BMG_GUID_SEGMENT	GENMASK(7, 4)
+
+#define CRI_GUID_SEGMENT	GENMASK(5, 4)
+#define CRI_GUID_INSTANCE	GENMASK(7, 6)
+
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
+#define CRI_IDX_WATCHER_OOBMSM		0x03  /* PUNIT and OOBMSM share this index */
+#define CRI_IDX_CRASHLOG_OOBMSM		0x04
+
+#define CRI_PUNIT_TELEMETRY_OFFSET		0x0200
+#define CRI_PUNIT_WATCHER_OFFSET		0x08A0
+#define CRI_OOBMSM_WATCHER_OFFSET		0x0CF8
+#define CRI_OOBMSM_GFSP_TELEMETRY_OFFSET	0x1600
+#define CRI_PUNIT_CRASHLOG_OFFSET		0x0E60
 
 enum record_id {
 	PUNIT,
@@ -138,45 +162,92 @@ enum capability {
 	WATCHER,
 };
 
-static int xe_guid_decode(u32 guid, int *index, u32 *offset)
+static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
 {
 	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
 	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
-	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
-
-	if (device_id != BMG_DEVICE_ID)
-		return -ENODEV;
-
-	if (cap_type > WATCHER)
-		return -EINVAL;
 
 	*offset = 0;
 
 	if (cap_type == CRASHLOG) {
-		*index = record_id == PUNIT ? 2 : 4;
+		*index = record_id == PUNIT ? BMG_IDX_CRASHLOG_PUNIT : BMG_IDX_CRASHLOG_OOBMSM;
 		return 0;
 	}
 
 	switch (record_id) {
 	case PUNIT:
-		*index = 0;
+		*index = BMG_IDX_TELEM_PUNIT;
 		if (cap_type == TELEMETRY)
-			*offset = PUNIT_TELEMETRY_OFFSET;
+			*offset = BMG_PUNIT_TELEMETRY_OFFSET;
 		else
-			*offset = PUNIT_WATCHER_OFFSET;
+			*offset = BMG_PUNIT_WATCHER_OFFSET;
 		break;
 
 	case OOBMSM_0:
-		*index = 1;
+		*index = BMG_IDX_TELEM_OOBMSM;
 		if (cap_type == WATCHER)
-			*offset = OOBMSM_0_WATCHER_OFFSET;
+			*offset = BMG_OOBMSM_0_WATCHER_OFFSET;
 		break;
 
 	case OOBMSM_1:
-		*index = 1;
+		*index = BMG_IDX_TELEM_OOBMSM;
+		if (cap_type == TELEMETRY)
+			*offset = BMG_OOBMSM_1_TELEMETRY_OFFSET;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int cri_guid_decode(u32 guid, int *index, u32 *offset)
+{
+	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
+	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
+	u32 instance  = FIELD_GET(CRI_GUID_INSTANCE, guid);
+
+	*offset = 0;
+
+	if (cap_type == CRASHLOG) {
+		if (record_id == PUNIT) {
+			*index = CRI_IDX_CRASHLOG_PUNIT;
+			*offset = CRI_PUNIT_CRASHLOG_OFFSET;
+		} else {
+			*index = CRI_IDX_CRASHLOG_OOBMSM;
+		}
+		return 0;
+	}
+
+	switch (record_id) {
+	case PUNIT:
+		*index = CRI_IDX_TELEM_PUNIT;
 		if (cap_type == TELEMETRY)
-			*offset = OOBMSM_1_TELEMETRY_OFFSET;
+			*offset = CRI_PUNIT_TELEMETRY_OFFSET;
+		else
+			*offset = CRI_PUNIT_WATCHER_OFFSET;
+		break;
+
+	case OOBMSM_0:
+		*index = CRI_IDX_TELEM_OOBMSM;
+		switch (instance) {
+		case 0:
+			if (cap_type == WATCHER) {
+				*index = CRI_IDX_WATCHER_OOBMSM;
+				*offset = CRI_OOBMSM_WATCHER_OFFSET;
+			}
+			break;
+
+		case 1:
+			if (cap_type == TELEMETRY)
+				*offset = CRI_OOBMSM_GFSP_TELEMETRY_OFFSET;
+			break;
+
+		default:
+			return -EINVAL;
+		}
 		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -184,6 +255,23 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
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
 /*
  * xe_pmt_telem_read is a callback API.  I.e this can be accessed external to
  * XE driver (PMT driver scope).  Because of this, DRM hotplug needs to be
@@ -193,8 +281,8 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 		      u32 count)
 {
 	struct xe_device *xe = kdev_to_xe_device(dev);
-	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
 	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
+	void __iomem *telem_addr = xe->mmio.regs + xe->pmt.base_offset;
 	u32 mem_region;
 	u32 offset;
 	int ret = 0;
@@ -286,6 +374,7 @@ void xe_vsec_init(struct xe_device *xe)
 	case XE_VSEC_BMG:
 		if (!xe->soc_remapper.set_telem_region)
 			return;
+		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
 		info->priv_data = &xe_pmt_cb;
 		break;
 	default:
-- 
2.43.0

