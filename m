Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68673B4E8F
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 13:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024722; cv=none; b=b2QHskm3ONxmU6uI0bz63FeuvIOLqnZleK0Me1QINPEoZOknPaPfO1c/JgezBAa9jFyVW8PNTsYNcWlfCzHN74q2bSFuCSX7wrcvWYncvWwiIEBjhxzuzDayVvqywRYKQLnEEPYxpXVU9M5dmZClD/b5Q18t32aPG5ZeqVESt9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024722; c=relaxed/simple;
	bh=g+A8cf5TIND/rZCJNshzel4iagXv/AJizlXU9u5HWbc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MXPzBEqJ7I++JINlifz4CGCEUuAf88vQDclH4Rh8za1ria4OChprsJ/K5DwIWpeR50WrgQmiEsePR287qZhXxKJKYtx5Tu/vMA+cN2D0dUzOTmIIoeCoxTj8rYdJnGs8SMa4u5qASAwhOg5N1CSiW7Na0BKz4FYPVrNwJjYfSVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njh2/S6r; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njh2/S6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786024721; x=1817560721;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=g+A8cf5TIND/rZCJNshzel4iagXv/AJizlXU9u5HWbc=;
  b=njh2/S6r2Jz36e0kIrePxv6foJ24A09ajZbdudBuxn2r+CPjmzmikOpx
   ek+rKLcWQyZAJDdhAYT/VeNrxryg5QVkIYbyYpjx5EohrTRu5/RI/5ecN
   LbKBqQmJn9dvcopYPA9tDO9238Rx5INPjN6kQcxym4MtPwTuXzReryu+5
   7uyHGomBeFv5IduuWJseNmktwpiUCBq1Ko1Yy4rMWBqkiyl1CEynhlfLC
   4ESMag7L0q8HHffUK+tP/naTy7sCUfu+jYP4h69LP1vJfL/nM8n3k20Dy
   00bdHwpvcWN4x21YU/ULNOPof3faplAPVWui3xtUqjR89pfu4F6P5OeD4
   w==;
X-CSE-ConnectionGUID: FN4xq/AkQNGYrTX7+7EzsA==
X-CSE-MsgGUID: Xh1lE0XaRYuXNgdqL6wjEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="89141344"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="89141344"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:58:40 -0700
X-CSE-ConnectionGUID: Me1Z0eZ4Q9+7jRNG87AgCA==
X-CSE-MsgGUID: Z9U6eO3NSYuszHeY0/bCWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="265594942"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:58:40 -0700
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
Subject: [PATCH 4/7] drm/xe/vsec: Support Crescent Island PMT
Date: Thu,  6 Aug 2026 06:58:24 -0700
Message-ID: <20260806135820.1422040-13-michael.j.ruhl@intel.com>
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

Crescent Island (CRI) supports PMT telemetry and crashlog.

Add Crescent Island (CRI) discovery structure (DVSEC)
information to allow for Xe registration.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h |  5 ++++
 drivers/gpu/drm/xe/xe_vsec.c     | 46 ++++++++++++++++++++++++++++++--
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index a62ab05c6b4c..fc9c9cb6a830 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -20,6 +20,11 @@
 #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
 #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
 
+#define CRI_TELEMETRY_BASE_OFFSET	0xE0000
+/* for CRI discovery and telemetry are in an indexed window */
+#define CRI_DISCOVERY_OFFSET		(SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
+#define CRI_TELEMETRY_OFFSET		(SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
+
 #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
 #define BMG_G2_RESIDENCY_OFFSET		(0x530)
 #define BMG_G6_RESIDENCY_OFFSET		(0x538)
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index f9b519f2b91f..338815963ac7 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -19,8 +19,19 @@
 
 #include "regs/xe_pmt.h"
 
-/* PMT GUID value for BMG devices.  NOTE: this is NOT a PCI id */
+/* PMT GUID value for BMG and CRI devices.  NOTE: this is NOT a PCI id */
 #define BMG_DEVICE_ID 0xE2F8
+#define CRI_DEVICE_ID 0xE2FA
+
+/*
+ * sizeof(Crashlog Type1 Version2) = 0x18 (24) bytes
+ * For BMG and CRI PUNIT and OOBMSMS crashlogs are consecutive.
+ */
+#define BMG_CRASHLOG_PUNIT_DISC_OFFSET (0x60)
+#define BMG_CRASHLOG_OOBMSM_DISC_OFFSET (BMG_CRASHLOG_PUNIT_DISC_OFFSET + 0x18)
+
+#define CRI_CRASHLOG_PUNIT_DISC_OFFSET (0x80)
+#define CRI_CRASHLOG_OOBMSM_DISC_OFFSET (CRI_CRASHLOG_PUNIT_DISC_OFFSET + 0x18)
 
 static struct intel_vsec_header bmg_telemetry = {
 	.rev = 1,
@@ -39,7 +50,7 @@ static struct intel_vsec_header bmg_crashlog = {
 	.num_entries = 2,
 	.entry_size = 6,
 	.tbir = 0,
-	.offset = BMG_DISCOVERY_OFFSET + 0x60,
+	.offset = BMG_DISCOVERY_OFFSET + BMG_CRASHLOG_PUNIT_DISC_OFFSET,
 };
 
 static struct intel_vsec_header *bmg_capabilities[] = {
@@ -48,9 +59,36 @@ static struct intel_vsec_header *bmg_capabilities[] = {
 	NULL
 };
 
+static struct intel_vsec_header cri_telemetry = {
+	.rev = 1,
+	.length = 0x10,
+	.id = VSEC_ID_TELEMETRY,
+	.num_entries = 3,
+	.entry_size = 4,
+	.tbir = 0,
+	.offset = CRI_DISCOVERY_OFFSET,
+};
+
+static struct intel_vsec_header cri_crashlog = {
+	.rev = 1,
+	.length = 0x10,
+	.id = VSEC_ID_CRASHLOG,
+	.num_entries = 2,
+	.entry_size = 6,
+	.tbir = 0,
+	.offset = CRI_DISCOVERY_OFFSET + CRI_CRASHLOG_PUNIT_DISC_OFFSET,
+};
+
+static struct intel_vsec_header *cri_capabilities[] = {
+	&cri_telemetry,
+	&cri_crashlog,
+	NULL
+};
+
 enum xe_vsec {
 	XE_VSEC_UNKNOWN = 0,
 	XE_VSEC_BMG,
+	XE_VSEC_CRI,
 };
 
 static struct intel_vsec_platform_info xe_vsec_info[] = {
@@ -58,6 +96,10 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
 		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
 		.headers = bmg_capabilities,
 	},
+	[XE_VSEC_CRI] = {
+		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
+		.headers = cri_capabilities,
+	},
 	{ }
 };
 
-- 
2.43.0

