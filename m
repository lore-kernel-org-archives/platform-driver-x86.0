Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141187;
	b=aLXaDRJ3jNs09/d4rXjBR5+ba5o4TFUgvephiuBRbLtBCr5F7doLHq/IljlkecqMEByw
	 NEbGz313tMsjFmaDv4TGDlqS/hDm2EGHpUVqpdf9R82Y5SftmY0cuPa3CZAEipXBOOwRG
	 H0oyzj1KOcDN84M7jBV/Onxx8WSFb2hYXLa3ek3ukGpJ0Z591d9TMSZXPLNnAiqr0opAj
	 Q6LGedFaA5J9vMUI5NKdpvKm2OMqA+Jdnxlw9VBTZD0OAIoJumKPJJiCc201m9Z0E3ueD
	 JOwJAAj2ir4TPaMIluY666o54WnwIZ3iJ3pqRw0fJhyID28XDqcwSdNj8CpQwxPd23Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141187;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Niadsma2lyiDqBkXyBvM7jPNLyujSfpIiwJKfy2bj+s=;
	b=nWsTrqZ1qgB2FPvHH66gOiduY5fWO4B4xLgx3YL5K9+XEK1TEigh2wLGMiMVAImr82Yl
	 WcyQ10a6CvBTx/rF+Qi7I0wCIFhKUBVjEA4TSY12u/X63o/b289qAVllpTNa0gfS/2p5c
	 UiDaKAWIyQ+/4LuWMcEOFlSXAQ2+7wEUvIXhTn0eM4OiDUKGYPth/zxyzAf1A/dMDKShD
	 UUYNZbA3Ceo5wi/aavtOGnybepiSLlKCluhAhMk9kdI58wJkSnP6EA9fl6oQrK0GLC48j
	 ag7K3Kjmp7/2tED02ZNHk72dRDEdsDnSw6SGp9bNZIA8ucfebUMuvIjbVeIhmL5NxQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZdRzTrz3;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E84606A336
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 02:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E84606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZdRzTrz3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795141187; x=1826677187;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2IR2UrwP6dIP7Oe8h/hoiHa+ATwar3VYGa/Px7QZ0bw=;
  b=ZdRzTrz39IXk22bBIMOrn8Hteqephnrgmovmp6UAZ9hCg8kiRBB8tLEC
   ZFw44yvigdlczjY/61oMwvjvIIcpbc9bESo8olP0Hz8lPVYBCKsIwZTWu
   nF+2gjwbbx0WSMpaGnNSxDBtffJghC+C4vP0uf37exlp2Du9fWqENWrTM
   le6sYLsIAaPjQH+vFBfSpm6yGM4SW7Id8EhBL2ISgh+w/0UXZfFxuPQyp
   RD9xIbLuBtGyy3gUTzsoGCrjJizkjgW4FUKIZOWHm/hU0v9D50szidkmA
   8P32N9CP+XMboriABJuFBZsOPioDHx0zeEjcHctlQ7EuN9Sq+Stvud9ri
   Q==;
X-CSE-ConnectionGUID: RaSFFHs9TD+dPMsCptg53Q==
X-CSE-MsgGUID: SL2BbRyJSeeeB/giH6PfJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3898448"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3898448"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:45 -0800
X-CSE-ConnectionGUID: jsnCipBkTt2kPTpSg9ox0g==
X-CSE-MsgGUID: gDgZjwG7QT2Nl2xy+kni9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10487134"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:45 -0800
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
Subject: [PATCH v20 12/19] drm/xe/vsec: Support Crescent Island PMT
Date: Thu, 19 Nov 2026 18:19:42 -0800
Message-ID: <20261120021929.473553-33-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120021929.473553-21-michael.j.ruhl@intel.com>
References: <20261120021929.473553-21-michael.j.ruhl@intel.com>
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
index bd272891caeb..efcd5ce0d3ad 100644
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

