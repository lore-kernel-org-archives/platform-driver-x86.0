Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103701;
	b=MaPunXuoKUQnmMntEs+9iSt/pQlyLwbMr3CJ4vCiy0OWkoXArldM0H24SKeWHGnqJ5lO
	 rKvPbhB6p91tlVXXzA/Wj6XgxbUxOsCUp3uo8FfRA2BupxjpjRtWrpNr5IZpe3E+V0NhS
	 7OPXBkFewk7/kSU4DvMFtufxQLz1uuMs9n2Nb9IGh/ooR+bQGy7rJdelraFKe/rrGSKo9
	 lNvlLa9aVUMx3MiT9GF2SEwTBajC/Kvh5l3HvXapsJOcjBMa8ydkEqlkn34WPx5jxeacN
	 AlIMWhdIuSky8JCwtI/NdC4tvjjiEkGHG/l8NE4YaD/YhJYSelY+uQihpDf6gl09HEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103701;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jDBPooFSFKZUcgjVwncWxlD0QKCCXMYNURHv1Ii83D4=;
	b=zugGpXhBzItem11zHzpZkdyb9ZstL6QfL4tBLOMGZAKspsYL7bm82EPAzaCRffxcjN7/
	 eHuiTkiTS/agGr99CEOyscLbByifN5fyB0OmaZZI9wb0XjtjLrxT1Lrnjcsh67VQlTzuA
	 PAl2lIu5sLoa9+L7ymbXwu7NDnJRPriCz7fMfdAio9fR2F0zm+uM+7VlDVFqx6Trkuxy0
	 KmIMT8+lJc9mSR9t8Kz8hDlkboX7HlCfSSgKvCesRVGnr1SwrgLJqcRsRUdRF1jD11nPX
	 ePJQkN/8RlcdNiluxkWzBTP5BmoyH7yFH1BNbOZzEKwfnKBH8A/z6SWhvFeM0gD4c7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZEG0teiP;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F2E606A332
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 15:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1F2E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZEG0teiP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795103698; x=1826639698;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HJr26RJseNSDlSBUQV0Y7383YM8x2wnm9FzkyCr0dw8=;
  b=ZEG0teiPELWKfDyKAq7/BNe4GO1Zd18Q5Rmtfsdq6EKe/Tobqj3y2XAJ
   WS2lsBO/bbU+2O0lcyMvHSrXRmMQAFGrVqOVru94guzV5z0QRUSKsrTQk
   C3wxH2hiwytPzBzmfcUtLXy7mxVXUeP4OlzAZn7PSighhp/YrIByK1i6l
   LSfbOYj9WSJXn+gxNhzxTmN3MGwRbKenU6ZfMzx7IdKxxRuv0KUSp+YNl
   A6mokqSe+Jt35EZYHvb7CxeSavfG2q1+tz8T3MYaF33NpfTMOKdtbI2vB
   Cj4OUwwJ6XA4j0vUpHGDNxZLBljC8ASp9ZLfL7O0w67WVZyBHAjDc1I81
   g==;
X-CSE-ConnectionGUID: iHGx/8FuSjewtOl4KUKpQQ==
X-CSE-MsgGUID: BfJwAT11TOK20iiKY9IALg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3849010"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3849010"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:54 -0800
X-CSE-ConnectionGUID: 8crtHECLR8GXNdJ9j9tncQ==
X-CSE-MsgGUID: Bj9FC7FoQJKlWEcCclE6HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10263423"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:53 -0800
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
Subject: [PATCH v19 12/19] drm/xe/vsec: Support Crescent Island PMT
Date: Thu, 19 Nov 2026 07:54:50 -0800
Message-ID: <20261119155438.40762-33-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119155438.40762-21-michael.j.ruhl@intel.com>
References: <20261119155438.40762-21-michael.j.ruhl@intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
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

