Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9E93B8407
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 13:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024725; cv=none; b=SLKtySx1gtgDS9Z4Mpji0COOqzW9/wxx47xoWC/TweqQdsNulvbpXCDoX+2vnRmdli4ux613JcfRK0PVEUhuF4ons6hBtrbCO1Vv3m4U1A1g3XRFP8HqkG0CMU3e7Cfxavb0dLxCv/fq3BI28gBsbZNAxIvnB8SBtiukI1v4+qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024725; c=relaxed/simple;
	bh=KMgO4T3Bqx/vUJldNL29yA6g0/tFs1MsDlhwIP6/Ll0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jxcxVMKjtN1XQEqLkLmlTkSgz5R5v1BiOlMdS3Vc3b/T0SEHMxWWeg++WgENy9a1VHHcNRxGdARoFrEaN+SmHl2FsJgDtV7COkGUwgt4zdorU8QCbQSL/gak5zffjeUYN/ph2eOe+ikeh71wWPWccSfKugSOCg1BSU+bq0WcZmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/+3XjvI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/+3XjvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786024721; x=1817560721;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=KMgO4T3Bqx/vUJldNL29yA6g0/tFs1MsDlhwIP6/Ll0=;
  b=L/+3XjvIvah8cr0KQKNOM/maVRdVK/yItsSxuSDR7PWKMA1w9tDSfonj
   s8XzIi9WHa0VagYg6jlmD6g3GjXBrUf+vYTNvCf+jeCH4Yra9GldxWK5i
   EikyHzkubMrWyIcjF5K+GHoeC0bN/oaW2xnI8tY9+Ft2escF9b3x++F21
   hX3eIyhlM1DM/G1Cqc0Pxmrdh6h7FcskIT4wks6BMHFscnW1VLncmagQW
   Ttt6WfJfjyXmE2Mto5fbWUKHiM8VfpKkuW4XlF2/sk6kgZcjw6LVvLhnj
   7jztq86weWZfJJnJBUlAFU3ZiUyPgWYd4sBROErmt5LdfMjABV78cmTdH
   Q==;
X-CSE-ConnectionGUID: RsLJxDAxToGaKwtai2CcJQ==
X-CSE-MsgGUID: LCX0EUsUSfyuwu+ttv9URA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="89141352"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="89141352"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:58:41 -0700
X-CSE-ConnectionGUID: Loiu0XN7SCKW3I3Tc0IrNw==
X-CSE-MsgGUID: oWtN6weAQeylQQ5n9xJFZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="265594948"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:58:41 -0700
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
Subject: [PATCH 5/7] drm/xe/vsec: Crescent Island PMT decode
Date: Thu,  6 Aug 2026 06:58:25 -0700
Message-ID: <20260806135820.1422040-14-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
References: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
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
 drivers/gpu/drm/xe/xe_vsec.c | 141 +++++++++++++++++++++++++++++------
 1 file changed, 118 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 338815963ac7..3849f99c1c91 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -106,23 +106,47 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
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
@@ -136,44 +160,37 @@ enum capability {
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
 		if (cap_type == TELEMETRY)
-			*offset = OOBMSM_1_TELEMETRY_OFFSET;
+			*offset = BMG_OOBMSM_1_TELEMETRY_OFFSET;
 		break;
 	default:
 		return -EINVAL;
@@ -182,12 +199,84 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	return 0;
 }
 
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
+		if (cap_type == TELEMETRY)
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
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
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
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
 		      u32 count)
 {
 	struct xe_device *xe = kdev_to_xe_device(dev);
-	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
 	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
+	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
+	void __iomem *telem_addr = xe->mmio.regs;
 	u32 mem_region;
 	u32 offset;
 	int ret;
@@ -196,6 +285,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	if (ret)
 		return ret;
 
+	if (device_id == BMG_DEVICE_ID)
+		telem_addr += BMG_TELEMETRY_OFFSET;
+	else
+		telem_addr += CRI_TELEMETRY_OFFSET;
+
 	telem_addr += offset + user_offset;
 
 	guard(mutex)(&xe->pmt.lock);
@@ -220,6 +314,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	xe->soc_remapper.set_telem_region(xe, mem_region);
 
 	memcpy_fromio(data, telem_addr, count);
+
 	xe_pm_runtime_put(xe);
 
 	return count;
-- 
2.43.0

