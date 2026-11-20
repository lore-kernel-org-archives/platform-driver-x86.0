Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141188;
	b=mpWSNB2YKGoOtwj2jKjggZlWYcO96dt8552hU9vB3pGvZqxJ6MHkYlQFBuPm5qqM+fhM
	 Wlj6MFWlhmniRzvMYt9gYSKyOlAB48b0KDXd2oE/d48I6JZSveSoC4bRP3UTeK43z/u8r
	 k5SCPiCAsRLy3cvCgkD0GEn7a0AiMKkcJ/A6Qs/kAe6QuWUF+RZV4m5cUX4jZ+C0maeKH
	 dOrcBXRbaJ8FdalErStyHT+XK75cTz1E2riQpW2gvkEVSvl8E2mGEVOueN8e6oTMP0qeN
	 BEg5n1JhV57qAnt/INsy1z4NlZiT0c+ZDaooaQZPJ3oJzG047KmUVOtZe0yp/YZ+y+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141188;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yeL/mknrAlcgqUNfBfUorWTn9czD5hUKYQaoSBaI6JA=;
	b=dZlrSVA11n+YdcCW2jo0p+/v5ZHHXJH9A2WaSjtSzrTsejbbpYiaLrb5THWSS5AAnLvS
	 i5VgZL9NMoSE9jpQMkv81SB6t4BRIPN5DrlRv5ZpDMBHxageDetik1F8YuC+vGXnXklen
	 RpiVtet2leqd69z2cdnQl3k8Y4jEQca5MhByu0M/OcDE5v7jmtZFb52YfEK0ARUuLx2bI
	 0UIfndWB6QvnQcrQmeNVZtlPXQB03yN80XYNniWrXzBFp3DW0+8mXfXRVRFX5SmFHDYoS
	 pdCgRU5jCKZFnqePNcBd4TeHeyKz5//8NayFnlQRI284G66Y9HM0GmnAxJ/euwIILWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=liu1UePs;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA48B606A336
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 02:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA48B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=liu1UePs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795141188; x=1826677188;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/kBGMrssRh2yTUhQm/sPJ/df6e/awn0xoRhGx8CJ7SQ=;
  b=liu1UePsQkd2BR4NYeRduCvEHhYYOARgbCIzdPxY1UmtbTE+xYv+6b7V
   J034wRQbI8qSvQyOYwjnchKlBVTGyYCn9l236742P4Ddpnu/RAp0l5KIB
   /9HCq+8RAgGMLKP4wPpmdoIK56ugG2B3h8zdOGpfsAJ23OORPVjZtiaIG
   k3KjHOlasYp+D2oz99wTowau3EwmhIBPAmFkZ6j22HZ487yhzb/ViJG7n
   0gUHOetCO7gWAfXH5XN34GQjnBeFS89YUQgtTMcYpB57fArzdNtmgFwRL
   Cb77oQLoXXO8LsxsdKcTTTlFIcINNacqcp6XUyUvKAmAJCPNAxmY5J9tE
   A==;
X-CSE-ConnectionGUID: YiFLucQoRJ6j01jm7epJDw==
X-CSE-MsgGUID: /llWevW8TSylzjmdXq1A6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3898484"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3898484"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:47 -0800
X-CSE-ConnectionGUID: tUjkffEvQ9CJaIX00YvhIA==
X-CSE-MsgGUID: dfonmF9BSG+ewwPjXhTICQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10487167"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:47 -0800
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
Subject: [PATCH v20 19/19] drm/xe/vsec: Support survivability mode for CRI
Date: Thu, 19 Nov 2026 18:19:49 -0800
Message-ID: <20261120021929.473553-40-michael.j.ruhl@intel.com>
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
index dacd9d271a6b..a8715057ab2f 100644
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
@@ -612,6 +633,10 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
 	     xe->info.platform == XE_CRESCENTISLAND))
 		return XE_VSEC_UNKNOWN;
 
+	if (xe_survivability_mode_is_boot_enabled(xe) &&
+	    xe->info.platform == XE_CRESCENTISLAND)
+		return XE_VSEC_CRI_SURVIVABILITY;
+
 	return vsec_platforms[xe->info.platform];
 }
 
@@ -733,6 +758,13 @@ void xe_vsec_init(struct xe_device *xe)
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

