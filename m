Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56EF2C0282
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Jan 2026 18:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538279; cv=none; b=k5dE63KVUu43yfZuIHrYWVyJ7A7Ml/+1fUD3wDAUjQQ3vgoR3b3Vee9Bpk+hTwNZk9ZSFALpT8JJXaKksmNLaV4wetsu3QlMxHLZ23jsaDfV7LpQdb7Jl39fce+Jm8dUZ33ucfJX6ROZ52El4cnDYgmh4LWnJ8RD6CzdI1tzCks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538279; c=relaxed/simple;
	bh=PsbhGYlVO8+KFm8XbmsLWNvqJExbQNcFYzxgNTorr08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fovThgxF/Cx/4OFOQqpHO2RwzlHadYJBk9ZJ98JZz69xiBS4z8CQH94XOBM0tWgNCJt4DwpQHfM/s1RyAUIaoOwVI76aJICHCg8lLIC9i8hE6myBVgZeDN0c6dJDJFBF0Y68wMGBV5TgTYspVKCRB3OtfWfArg4+d4/UVO0J0d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/q4Bk4T; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/q4Bk4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769538278; x=1801074278;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PsbhGYlVO8+KFm8XbmsLWNvqJExbQNcFYzxgNTorr08=;
  b=P/q4Bk4T8BQTjwyKasGv4CsC9bSWWYPmdCh3afFw7kT1SwA5KVHjvgZW
   0lBR9mDa9Gj9e1FbcIl72OMqaq4HuL8RN3sjEOUW1wjmXtjq06QFzXzZH
   gWiHK2eIhrMUeYLXEPAZS4LzZwrAf4tOzBHNrulAKpCzDaBsp9h53yoIx
   SYrsugY51ioNaD3ETeKNqAlDawl6s6AOSUFa37Bx1KJwcZw13Nd+4CMhj
   ICyJkOwW05DZC9oNq65S0xGjjTpSbGxz9MPpZfBDaHyElbHgd+7na4Az0
   nrn2QBqCiQ+nkX+2oNfFIwq7RHRUb2M2FeRoVKbQYMS0QmTYMZntt+2B2
   g==;
X-CSE-ConnectionGUID: qfW128mkQHGOd07Ir6frOA==
X-CSE-MsgGUID: 2Y/osDHyQrG4JWZbNOMqfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70644439"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70644439"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 10:24:37 -0800
X-CSE-ConnectionGUID: P9tUXIIvSZOTXIfNPVrBzQ==
X-CSE-MsgGUID: HX44dUMAQjWzL+X7u3S0Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208491689"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.176])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 10:24:36 -0800
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
Subject: [PATCH 3/5] drm/xe/vsec: Support Crescent Island PMT
Date: Tue, 27 Jan 2026 13:24:22 -0500
Message-ID: <20260127182418.640701-10-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127182418.640701-7-michael.j.ruhl@intel.com>
References: <20260127182418.640701-7-michael.j.ruhl@intel.com>
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
 drivers/gpu/drm/xe/xe_vsec.c     | 43 ++++++++++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index 240d57993ea6..874f44b79780 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -18,6 +18,11 @@
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
index 44607f1eaa88..254f7ebca6eb 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -19,8 +19,16 @@
 
 #include "regs/xe_pmt.h"
 
-/* PMT GUID value for BMG devices.  NOTE: this is NOT a PCI id */
+/* PMT GUID value for BMG and CRI devices.  NOTE: this is NOT a PCI id */
 #define BMG_DEVICE_ID 0xE2F8
+#define CRI_DEVICE_ID 0xE2F9
+
+/*
+ * sizeof(Crashlog Type1 Version2) = 0x18 (24) bytes
+ * For BMG and CRI crashlogs are consecutive and start at 0x60.
+ */
+#define PUNIT_DISC_OFFSET 0x60
+#define OOBMSM_DISC_OFFSET (PUNIT_DISC_OFFSET + 0x18)
 
 static struct intel_vsec_header bmg_telemetry = {
 	.rev = 1,
@@ -39,7 +47,7 @@ static struct intel_vsec_header bmg_crashlog = {
 	.num_entries = 2,
 	.entry_size = 6,
 	.tbir = 0,
-	.offset = BMG_DISCOVERY_OFFSET + 0x60,
+	.offset = BMG_DISCOVERY_OFFSET + PUNIT_DISC_OFFSET,
 };
 
 static struct intel_vsec_header *bmg_capabilities[] = {
@@ -48,9 +56,36 @@ static struct intel_vsec_header *bmg_capabilities[] = {
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
+	.offset = CRI_DISCOVERY_OFFSET + PUNIT_DISC_OFFSET,
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
@@ -58,6 +93,10 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
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
2.52.0

