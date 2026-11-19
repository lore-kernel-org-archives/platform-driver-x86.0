Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103702;
	b=AFMOG4CXiUrI6P4lczr0uraeCaLgTy4L5WBoJYQUom/G198z+G0f90CTDP1+/sRj7MBb
	 ExQUrvmWn9/N2kZwZ39Ale2D4mmgOpTt3unlqpCLa/Q2xOx8wdUT+B8aEWD37Mu36ePsp
	 Nqik/2EHJqoSG/gXcBR3yYk8MPsJ8rKVr+UoWQUC5d1SycF85/DLfqYln05nxXk/BNUGK
	 HJZp8gKELHlR3lIt9UU+fo9IXAZQshG4o/5FimbOzPauKAp/5pYNcZy3dkRr3IOJQXjpp
	 zSsepfKtKaPhMUnuLWQmXkjP4hL0LnkjSBKQUkecuZjjIPC4WnYCXXgToZHnOiNcofw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103702;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=neb1V/Pbh+9OFbqZiyI7s65PNhjVuUxlQUvhsuWOlug=;
	b=nDyF0cqAHta8gfXLIOuETDJvHiKRrMq1t3nr0A+72xebBR7FvXh8n9dAbJntjQNoWpru
	 6koIiBmnk5CD5e/qQ+mYeqmp0QeLGWxbJUf3EOqkFh9EeDlESCI1/trYRdXh/REPTYNTZ
	 WUnfaMtE1QFj4gLDCBTFd8nzUxvlUHVce+bcJe5y3tisTvnQRZ4/orHhNkkKCCkw80g8N
	 iwZwPvDC/oCNGDjtHKYWqEKoxDoF0MqliSIToW+n+gdUb5GEsqTYPlDYmBgLf6Y63kG2W
	 oCahWfymBnXz/5P2E4wdDlQqaJWrDwxpn5uI9um6YbbnK0/lHhK1oLTqg63IJmqO31w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z0RhQBGD;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3397606A335
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 15:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3397606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z0RhQBGD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795103702; x=1826639702;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=pma3HRejTpDtg8x69XcXhxq0y60jc+VbzYLGw3yZa7Q=;
  b=Z0RhQBGDhuvl4pvaGWyuguoa7piH+Lch3Fl/UROotoA3FO/7Kc8D6BgP
   NGvBjtDQNibF+1hPqUQIOWSPRyS9cpJFRaED3W74ktWqRwGPWh/oM5GC6
   SkZ8b5aEiqIZuIjblKm2g7Z6GVLr0gaUv19pv9iKEPzMIRoF8VsRi84qU
   0qloUyUBFh+dwU1UfySzoA+tkj9cWIH5ptYAI3ttwRNzEXQiQS0Yhduxv
   3zEefdzYr8yqlpQP4THAmYDHA8n1xTG4TE7j/nbGNJT2Fotssnzs6xhHi
   MgfyOMm2HvYb3Inx1euFda4TPbrBiUI0DdEAvNNF0sIGiTyXW4ccRCKM3
   Q==;
X-CSE-ConnectionGUID: doa0RE10RQKEnM6Gh70DRg==
X-CSE-MsgGUID: zqHZQ+5QRw6jtzPpcUElgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3849066"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3849066"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:56 -0800
X-CSE-ConnectionGUID: uXzOVQjWT9+bFOgweA208w==
X-CSE-MsgGUID: 5dCipG3OR1awoo3opkj5sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10263454"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:55 -0800
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
Subject: [PATCH v19 19/19] drm/xe/vsec: Support survivability mode for CRI
Date: Thu, 19 Nov 2026 07:54:57 -0800
Message-ID: <20261119155438.40762-40-michael.j.ruhl@intel.com>
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

For survivability mode, CRI can only support access to the
PUNIT CRASHLOG PMT function.

Create a special config to support survivability mode.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_vsec.c         | 34 +++++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index be6feaff4baa..ae5426717eb4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -494,6 +494,8 @@ struct xe_device {
 		u32 retry_count;
 		/** @pmt.punit_guid_cache: cache of the PUNIT GUID */
 		u32 punit_guid_cache;
+		/** @pmt.survivability_mode: cache of survivability mode state */
+		bool survivability_mode;
 	} pmt;
 
 	/** @soc_remapper: SoC remapper object */
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 8d3f46531295..fed57deb2801 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -20,6 +20,7 @@
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_pm.h"
+#include "xe_survivability_mode.h"
 #include "xe_sysctrl.h"
 #include "xe_vsec.h"
 
@@ -102,10 +103,26 @@ static struct intel_vsec_header *cri_capabilities[] = {
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
@@ -117,6 +134,10 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
 		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
 		.headers = cri_capabilities,
 	},
+	[XE_VSEC_CRI_SURVIVABILITY] = {
+		.caps = VSEC_CAP_CRASHLOG,
+		.headers = cri_survivability_capabilities,
+	},
 	{ }
 };
 
@@ -320,7 +341,7 @@ static bool wait_for_fw(struct xe_device *xe)
 {
 	int retries = VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
 
-	if (xe->info.platform != XE_CRESCENTISLAND)
+	if (xe->info.platform != XE_CRESCENTISLAND || xe->pmt.survivability_mode)
 		return true;
 
 	while (retries--) {
@@ -611,6 +632,10 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
 	     xe->info.platform == XE_CRESCENTISLAND))
 		return XE_VSEC_UNKNOWN;
 
+	if (xe_survivability_mode_is_boot_enabled(xe) &&
+	    xe->info.platform == XE_CRESCENTISLAND)
+		return XE_VSEC_CRI_SURVIVABILITY;
+
 	return vsec_platforms[xe->info.platform];
 }
 
@@ -732,6 +757,13 @@ void xe_vsec_init(struct xe_device *xe)
 		}
 		break;
 
+	case XE_VSEC_CRI_SURVIVABILITY:
+		xe->pmt.base_offset = CRI_PMT_OFFSET;
+		xe->pmt.survivability_mode = true;
+		info->priv_data = &xe_cri_pmt_cb;
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+		break;
+
 	default:
 		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
 		return;
-- 
2.43.0

