Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5A0522EEF
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 21:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928157; cv=none; b=XNm6oWgNkUxlCTdtU+Vt5DyGiykicvm8r4+fgaKynWeZQ9nAHKz7PzNTRgAXFo1q/FH0uq7RdKQQ3qu6R5RPRoO0BX4G55PQLzQNvqIMYjtT274NGGeLc2M+MIF9qswkP4bkioG/AVCVFdeVunUy8L3O6joOroObckwp7qg59bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928157; c=relaxed/simple;
	bh=sG9hbtg6PtyroAevBi3xrSeAC6v6yYDTeZenK1u91Xs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwqAvjpWB+WooPiFR4j12OcUzjveLznGnuAp8uFTCxRgDSAhm6Yn0TwgiiueCjUW21KqndxDRMttBD/OIrQRC7SWeyD7PmFQ6FXmc6XrYT9X2GmDR8Afi9GsQ9A8RUPWvYdH81Kc4UYIau7kJy4TskPezblNiYR8M4lxCtiNOBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5giSWpo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5giSWpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791928156; x=1823464156;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sG9hbtg6PtyroAevBi3xrSeAC6v6yYDTeZenK1u91Xs=;
  b=Q5giSWpocmD8zHl/p6M4KVgykKWfSkutApgJkPa6ZiZrR4dPKW9/Ps/y
   SAadQUyznM+EFjGZ/okl38EIIDCMLGCOkVsS8wpXkJ7jrCfSCxObAds+c
   ALJdAsW1V4qiLPCK51vMkWjg/gQEUAwuuFlDNK1z2zEQooNUpocaehtqd
   7Rf+uw9ScM/M1FsHIp48mDZzjVe3UJdNWjUEqHY03T7gWhH4VJp5xAf22
   YOEFh6R4DpzMouPaTukJ2TKub/Hg5T1u1D/FYGj7l3e9SLyLFEt/NDdEL
   wvOAI8Ywm9K6jS91mz12WAQX2OffzXhnp5oCOTy+y+fXnmdvvS9CB57+J
   w==;
X-CSE-ConnectionGUID: VkR0GiuLQ36FfyxR3uGwxw==
X-CSE-MsgGUID: 5OQ2ZNicS7Sn3f6+misgXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="565960"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="565960"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 14:47:08 -0700
X-CSE-ConnectionGUID: fwT3Wc9DQkinXHvYvBY/Ug==
X-CSE-MsgGUID: klXhgP4gQhiZ35RFNiXSUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1629882"
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
Subject: [PATCH v12 21/21] drm/xe/vsec: Support survivability mode for CRI
Date: Tue, 13 Oct 2026 14:47:14 -0700
Message-ID: <20261013214655.3502964-44-michael.j.ruhl@intel.com>
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

For survivability mode, CRI can only support access to the
PUNIT CRASHLOG PMT function.

Create a special config to support survivability mode.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c |  2 ++
 drivers/gpu/drm/xe/xe_vsec.c               | 34 +++++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 45d44ebe288b..f08e76d02054 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -19,6 +19,7 @@
 #include "xe_nvm.h"
 #include "xe_pcode_api.h"
 #include "xe_printk.h"
+#include "xe_soc_remapper.h"
 #include "xe_vsec.h"
 
 /**
@@ -351,6 +352,7 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
 
 	xe_heci_gsc_init(xe);
 
+	xe_soc_remapper_init(xe);
 	xe_vsec_init(xe);
 
 	if (survivability->fdo_mode) {
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 1ed904ec1496..6d4ef9cb9f60 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -101,10 +101,26 @@ static struct intel_vsec_header *cri_capabilities[] = {
 	NULL
 };
 
+static struct intel_vsec_header cri_survivability_crashlog = {
+	.rev = 1,
+	.length = SZ_16,
+	.id = VSEC_ID_CRASHLOG,
+	.num_entries = 1,
+	.entry_size = 6,
+	.tbir = 0,
+	.offset = CRI_PMT_OFFSET + CRI_CRASHLOG_PUNIT_DISC_OFFSET,
+};
+
+static struct intel_vsec_header *cri_survivability_capabilities[] = {
+	&cri_survivability_crashlog,
+	NULL
+};
+
 enum xe_vsec {
 	XE_VSEC_UNKNOWN = 0,
 	XE_VSEC_BMG,
 	XE_VSEC_CRI,
+	XE_VSEC_CRI_SURVIVABILITY,
 };
 
 static struct intel_vsec_platform_info xe_vsec_info[] = {
@@ -116,6 +132,10 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
 		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
 		.headers = cri_capabilities,
 	},
+	[XE_VSEC_CRI_SURVIVABILITY] = {
+		.caps = VSEC_CAP_CRASHLOG,
+		.headers = cri_survivability_capabilities,
+	},
 	{ }
 };
 
@@ -316,9 +336,10 @@ static void cri_late_bind_probe_work(struct work_struct *work)
 
 static bool wait_for_fw(struct xe_device *xe)
 {
+	struct xe_survivability *survivability = &xe->survivability;
 	int retries = VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
 
-	if (xe->info.platform != XE_CRESCENTISLAND)
+	if (xe->info.platform != XE_CRESCENTISLAND || survivability->mode)
 		return true;
 
 	while (retries--) {
@@ -534,6 +555,8 @@ static const int vsec_platforms[] = {
 
 static enum xe_vsec get_platform_info(struct xe_device *xe)
 {
+	struct xe_survivability *survivability = &xe->survivability;
+
 	if (xe->info.platform > XE_CRESCENTISLAND)
 		return XE_VSEC_UNKNOWN;
 
@@ -542,6 +565,9 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
 	     xe->info.platform == XE_CRESCENTISLAND))
 		return XE_VSEC_UNKNOWN;
 
+	if (survivability->mode && xe->info.platform == XE_CRESCENTISLAND)
+		return XE_VSEC_CRI_SURVIVABILITY;
+
 	return vsec_platforms[xe->info.platform];
 }
 
@@ -668,6 +694,12 @@ int xe_vsec_init(struct xe_device *xe)
 		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
 		break;
 
+	case XE_VSEC_CRI_SURVIVABILITY:
+		xe->pmt.base_offset = CRI_PMT_OFFSET;
+		info->priv_data = &xe_cri_pmt_cb;
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+		break;
+
 	default:
 		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
 		return 0;
-- 
2.43.0

