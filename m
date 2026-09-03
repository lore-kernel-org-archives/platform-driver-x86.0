Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F21E50C2B1
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Sep 2026 20:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466264; cv=none; b=B9URrAEV8jOTSNHewFgw2+VL77UGII35cTEWuhkvgcEY7NGwG20XASEF9FygBjRgYQXvybzj/ScvlJlaTvecEi8/WTnptg+MwnFOFkY+cIt4VUYNLfzv492cF0gqiYAgaqdgRecSFg4U+bhWzVApNBeVScT5kHWYQLu8CYtK3Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466264; c=relaxed/simple;
	bh=EOFubrXObH5rTmOLnOJ9PxpERsaJyA0QlgO4N4BTf6Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNjHcEVrtk/xmVx2nxUlibNGFLQp6Yv9m7wzbYdP0oPZne+ODt5Q06LbEZl2s/ow/DinxnefqC0YUAyJqMGSo2DyOdAfR/j7rS2yUAmk2cPErB5IgPPxgVc25EOWWsCeTeyrrIrxfcbsIwst1hd7yp7TUcZNTQmTJ2xgZHe5J9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIXcdqfV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIXcdqfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788466258; x=1820002258;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EOFubrXObH5rTmOLnOJ9PxpERsaJyA0QlgO4N4BTf6Q=;
  b=PIXcdqfVM3S+omf8Wvl8AZ7WPRqR2Tp3xXaLkO8HSY6qPKUKWGNKR7x0
   MlXDdDS7vkJlrWont3vkpJGWjMcl+TPDmXK+wYm8iB4tWCXdvudCDQs7i
   1GTMhv/61G0yDFk4kesordicDH6whs9d/txuuY0a9xXZANfrLoaDXygEv
   WA8xDUvUGmuTNvJdFR9UfxjTgFlFJM8wkowhWyIybhsaHY6qHvaUi7mNl
   o8DwS7uRrsa663537+ia8sD6qphkeYmHvdOFJ6EZzT4GxJYkx7QGrBJ+Q
   9/4Oa2necLKx6PlzTyi0xJsYxAa2frhQDJ1T/XphDv5W9DeUBmYFGG0q8
   A==;
X-CSE-ConnectionGUID: 7fMUbLIiTEGmZzWT74o3IA==
X-CSE-MsgGUID: Ixqy6UDuRumMo5FHm/zG3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88994610"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88994610"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:10:37 -0700
X-CSE-ConnectionGUID: rzHObXbORqCUGTovA/2RHQ==
X-CSE-MsgGUID: nVVCpCJvT8O1qld5NfhZtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273348144"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:10:30 -0700
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
Subject: [PATCH v5 11/18] drm/xe/vsec: Support Crescent Island PMT
Date: Thu,  3 Sep 2026 13:10:13 -0700
Message-ID: <20260903201002.1064889-31-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
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
index 01df339ff62f..59140ac85e25 100644
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

