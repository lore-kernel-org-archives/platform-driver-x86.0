Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486087;
	b=LjHjtVyf8frZcnQA77k3pZNyJOIxaNJ/M1FzAdwZ1wY/8tk2+faQlP1r8BJCnH+L3ans
	 HT3ZzD6a1tinCkzIfFAGIpXCcS6YkJyvCjC//VOPx7ZZCkOlhKKy7ObWGcoBAdHe3wgEl
	 0+pFB/q4v7J/vrCGU2r45PbTgkddktRTmRgOAeBQcspmS6SlVOtUWktOF8MMQryfMDpFb
	 nu6Hm18GPzm0WbyyYNyJy4fmnONiNxivlEK6mfioyNwWOAJfwNY56jPGHHedJLQeyKz2l
	 sqzKNw6kFfZH4IigPLAPDnJccV0moGdy0J5/8tdJ0Jz7Wj8/J5qad36eUpSQCqZ8bLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486087;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jDBPooFSFKZUcgjVwncWxlD0QKCCXMYNURHv1Ii83D4=;
	b=Mis3a3EO4fUgLNsa8MYdtnDy3t6GIuFuTLymNda//d6LFagv+DI4aei6yN+7zARFHCT0
	 lpE8qqVp9v872G9rmDve+GP2eZDsSZicCcTElDNvYR5VdAjIbGK7gKoObdMXfkZu5eXcO
	 HLE4zlXrUybz4kSBl8tGPT2Db/qe7yvxEgod29mm99vZQnMlK7275r1XCM58iEWmU4vGU
	 sd6H4BN53tSqM1MixXpvVceh6O0UED77FpDwXd7muMPy2AOHCV6LhA/f5EPxIul+UJWVx
	 L+lp7emYm0AX0HnVlLwVeYXWOSXo5P/3/w9IDNya5V6GJLNq0YwI05+uLTglenEhL2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mjGwhlfb;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC3E606A327
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 02:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CC3E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mjGwhlfb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795486088; x=1827022088;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HJr26RJseNSDlSBUQV0Y7383YM8x2wnm9FzkyCr0dw8=;
  b=mjGwhlfbEFHqUeJoMkO9wkfekqVEzrNixaxKkTz6EgZZ2Bpa8Aq27hcH
   w0sX3/OhVre4YDf8q27ni75vvtDGzYjkQ3xN2yu0K2HH7ExdbP6IHvYo6
   iA9TVm+yeti+EaGlL5ikqtzVwBusvaeDYuh/x0fs7RiideSB+TXdJjkqW
   vR+QBPSWodzwqy3ddF6X57kARKrAgCNPyFPfjK5CvfwuZuF8q8WzwIEa/
   i42xMCvog9amcTyheK0rnTgIyTcHCryYUHNld6kKGZMlcaEZXXwdXolUv
   BEmejf9sMTRBFCol0pElI98HdEdQ7mOul+u6E38dIAqOEKINDAa27ni/s
   Q==;
X-CSE-ConnectionGUID: Hd8XG11DTNu2Gkue+kViKA==
X-CSE-MsgGUID: NYwCGTd2R5maj+STJuNYRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4153542"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4153542"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:03 -0800
X-CSE-ConnectionGUID: 0tlskiPfRb+tkWCX+Odnlg==
X-CSE-MsgGUID: zVNLVxEDQOOhIQaniwrHPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11621439"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:02 -0800
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
Subject: [PATCH v23 12/19] drm/xe/vsec: Support Crescent Island PMT
Date: Mon, 23 Nov 2026 18:08:04 -0800
Message-ID: <20261124020752.30551-33-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124020752.30551-21-michael.j.ruhl@intel.com>
References: <20261124020752.30551-21-michael.j.ruhl@intel.com>
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

