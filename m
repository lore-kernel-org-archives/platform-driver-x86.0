Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFC855D88A
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 21:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928153; cv=none; b=U9NxbGfLurczoSCibm24Hf64L8IoZY/5xBowPNeS/1UyqbX7UC2wOOp8wHLGA5A9eptVwMo55hx2lMsTZ/R2rm/aNIRVoQR9LLw4KurJqkuM6S4yZbE55HLCJt7DHasVhKMCpQFKpMADFbJHs94CK0kPlwXHUrxk1NeVyCTAA3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928153; c=relaxed/simple;
	bh=HJr26RJseNSDlSBUQV0Y7383YM8x2wnm9FzkyCr0dw8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZZACUOFWoeewRtWulqTUGTZAI6VcacBWIyEfDiXY0P1J0Hn9cWeuDxr5KKM7qg0CZiWbYHWz/LrZLsYAblXAgVXBagbyvsX0h0SEcJrH6GsbHp3I7P2w2vxiSuVskZ2E58Uxuk3a6r9nOg76q0BuX4W2un0toNP6BNmLTh9Bn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PA5fvPSI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PA5fvPSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791928152; x=1823464152;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HJr26RJseNSDlSBUQV0Y7383YM8x2wnm9FzkyCr0dw8=;
  b=PA5fvPSIo6emenpSVc3HSweJ6a8c7go/ncVvJNp17ITd6xd6zkq+uysK
   YweuQE6rCLx4f+YB4Q7PvfOCrg+/U8wXXZXDGYpznAUhGNZrC3Xttfgnq
   OkM5RhJTFeOrOO2LLamDE6w5Rd/iXLLiwAnWWupzl2S/Di//5o8dfTbkj
   CYTIsfCErRHAV7NLYYh+PSJ3ze8LAFh5lowhd/K/xzDHrxD2Vww4V2pvf
   OjTb4bpghtGnqmRr+iYs88gQvHAg9HMkt/8C3MrLUUsLhD7Ix5Poex9+p
   2GADhlv5f7vG6V5I1gkYdCZCYUCXSEFhGBiausQ4E1Orw3PbxV72/F0l1
   A==;
X-CSE-ConnectionGUID: 9pQ1byUzR1eq9l3p03XROg==
X-CSE-MsgGUID: Amrx108lRGajTFEIdkT2ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="565949"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="565949"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 14:47:08 -0700
X-CSE-ConnectionGUID: jshV0YK6Sma6uyCCnnREJg==
X-CSE-MsgGUID: a1o2mGXsQtKQLKu4+r7mbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1629861"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 14:47:08 -0700
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
Subject: [PATCH v12 14/21] drm/xe/vsec: Support Crescent Island PMT
Date: Tue, 13 Oct 2026 14:47:07 -0700
Message-ID: <20261013214655.3502964-37-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
References: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Crescent Island (CRI) supports PMT telemetry and crashlog.

Add Crescent Island (CRI) discovery structure (DVSEC) information to
allow for Xe registration.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h |  8 +++--
 drivers/gpu/drm/xe/xe_vsec.c     | 51 +++++++++++++++++++++++++++++---
 2 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index a62ab05c6b4c..2f6658395587 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -17,8 +17,12 @@
 
 #define PUNIT_VERSION_OFFSET		0xA0
 
-#define BMG_TELEMETRY_BASE_OFFSET	0xE0000
-#define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
+#define XE_PMT_BASE_OFFSET		0xE0000
+
+#define BMG_TELEMETRY_OFFSET		(SOC_BASE + XE_PMT_BASE_OFFSET)
+
+/* for CRI discovery and telemetry are in an indexed window */
+#define CRI_PMT_OFFSET			(SOC_BASE + XE_PMT_BASE_OFFSET)
 
 #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
 #define BMG_G2_RESIDENCY_OFFSET		(0x530)
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 04aec1e5c15c..4ecc2d9f3f38 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/sizes.h>
 #include <linux/types.h>
 
 #include <drm/drm_drv.h>
@@ -32,12 +33,23 @@
  * PMT usage.
  */
 
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
-	.length = 0x10,
+	.length = SZ_16,
 	.id = VSEC_ID_TELEMETRY,
 	.num_entries = 2,
 	.entry_size = 4,
@@ -47,12 +59,12 @@ static struct intel_vsec_header bmg_telemetry = {
 
 static struct intel_vsec_header bmg_crashlog = {
 	.rev = 1,
-	.length = 0x10,
+	.length = SZ_16,
 	.id = VSEC_ID_CRASHLOG,
 	.num_entries = 2,
 	.entry_size = 6,
 	.tbir = 0,
-	.offset = BMG_DISCOVERY_OFFSET + 0x60,
+	.offset = BMG_DISCOVERY_OFFSET + BMG_CRASHLOG_PUNIT_DISC_OFFSET,
 };
 
 static struct intel_vsec_header *bmg_capabilities[] = {
@@ -61,9 +73,36 @@ static struct intel_vsec_header *bmg_capabilities[] = {
 	NULL
 };
 
+static struct intel_vsec_header cri_telemetry = {
+	.rev = 1,
+	.length = SZ_16,
+	.id = VSEC_ID_TELEMETRY,
+	.num_entries = 3,
+	.entry_size = 4,
+	.tbir = 0,
+	.offset = CRI_PMT_OFFSET,
+};
+
+static struct intel_vsec_header cri_crashlog = {
+	.rev = 1,
+	.length = SZ_16,
+	.id = VSEC_ID_CRASHLOG,
+	.num_entries = 2,
+	.entry_size = 6,
+	.tbir = 0,
+	.offset = CRI_PMT_OFFSET + CRI_CRASHLOG_PUNIT_DISC_OFFSET,
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
@@ -71,6 +110,10 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
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

