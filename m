Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42582463B81
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 16:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787588621; cv=none; b=qe5euhPTx4Rl6VW02dvEPHrbirH9MMe1RYjGz+RA0r3/CcBPrcc4LvcN1D7bu7XWLnvfX6o1Z2ZuJR5qSpo+6gW0KYoJkCNFdOPIyjcyi3//yQ7XrPqBDNbWDTpEG8kYbLvGDnuV7J0JSgStwX4LBsdkCKhPyjRIwAceXzy2ZlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787588621; c=relaxed/simple;
	bh=7mBpdsqTVvs6qHVqrYbe5yAm8m9z+Ap0/P4P3ZWbqZI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eb7W+78UiE9wtOxQgNi+AKZGqPHiaB/Gwcr/F6DGq5JsBgSUgXDRuL/oGV2QUgGC7V9QbYi0F0B0FLnDxGHZaEUZynYaTXiGdeH69w7qyLmgfPSivPNVIBpsFiTn+SnAc4Nby98l4uwh3dr32t4yvHnLaYFF1gDdxJcbSoJ6uqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KulxBL7q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KulxBL7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787588620; x=1819124620;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=7mBpdsqTVvs6qHVqrYbe5yAm8m9z+Ap0/P4P3ZWbqZI=;
  b=KulxBL7qD//fI6YnRJsB/1a+rx7U6CEmQzFsEy78UCAEZ8zHCuWVg9B7
   +NARXrw/WQU0UZ7bdkaFujcKw30gC6ZflngcxNjFylqm91En0FPGREH+j
   HXlPmbgIsCw4OH5y569mDNRHWh8ToRB5mtKl1A5qnHowcWd/2Cr+lKH0x
   rN+hxEosHBi6cgT3uKOzlkvF6pLIoOdyD/CIJgvPM1reK0xHzbU6MVceJ
   BOGgBNUW98LLStpWop58nxHwTr4QdfGVoqB/oeOXFFE/SbXfIroYGwgq6
   XIUtHiQOX4WfGKiVvuAuEBFtVk2dtjQWYTtta5O4ZRDE60Bqybrz/X+iC
   g==;
X-CSE-ConnectionGUID: CttIuBoGQNuW8D9weXxhbQ==
X-CSE-MsgGUID: +nIwC9KURsauVkXhIEBbxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91858085"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="91858085"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:23:40 -0700
X-CSE-ConnectionGUID: hMofIUrJRwGSPFtvYP99Tg==
X-CSE-MsgGUID: doMjDeVEQNqPi+1/xdSJ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="267088142"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:23:40 -0700
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
Subject: [PATCH v3 06/10] drm/xe/vsec: Support Crescent Island PMT
Date: Mon, 24 Aug 2026 09:23:22 -0700
Message-ID: <20260824162317.2450380-18-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
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
index 8abe11e6312f..6345b0b4b26b 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -21,8 +21,19 @@
 
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
@@ -41,7 +52,7 @@ static struct intel_vsec_header bmg_crashlog = {
 	.num_entries = 2,
 	.entry_size = 6,
 	.tbir = 0,
-	.offset = BMG_DISCOVERY_OFFSET + 0x60,
+	.offset = BMG_DISCOVERY_OFFSET + BMG_CRASHLOG_PUNIT_DISC_OFFSET,
 };
 
 static struct intel_vsec_header *bmg_capabilities[] = {
@@ -50,9 +61,36 @@ static struct intel_vsec_header *bmg_capabilities[] = {
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
@@ -60,6 +98,10 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
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

