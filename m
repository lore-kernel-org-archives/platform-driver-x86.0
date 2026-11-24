Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480752;
	b=jtxDFdJKmzOfBtUKiJKC9Du7EEuxB5UdDADNfsocBHiO6enPp4EK70/TPOPEhmwYk43w
	 mvwCaeTmlQXUDLX3eI2Wuq75yWxs8QPhXecKiXEyFM8sr6FS0bmfLX844VGlZMRexWI2H
	 ExIGRW9DjF52OY17r1vDpvXxrYBpKhlrcPcESSAD9UPgZB7hcAIaq2lQ6UQeO6EFGdmGc
	 U3/NXDJIm3SBvEj0VK5GuP3+Tmt7tqCUrYy8So4vPvXtCJOTr1lKZhJk6G56minKxXRdx
	 TfJC5DyVB3LlSnlvFj/7RCr9HjSYZc9aw+9rvdPVNrUMwLYBQiQajtaY9+MokTobKGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480752;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WmJZsPfbGtSbjrEFT05vhJI0vSnYGBfGiXNDUN3jAQ0=;
	b=EISmxzMKYotb/upS6efPhHLC49wP9F8B/mOaTSWNqhnoG1nAVyVTkdwPnh0htVO++22Q
	 R+4kTyys9zJebmEnvhwQSD5N0Zvt0WJFdL8oPwciHuJymqZeIW4633S/RQQLRLU9P+xPY
	 oIfgDnsF/UqovS4mz+D7qG/3PvckxADATwfJh68R4uZI6xbNGvYzfgrrdiWZemnYfPp03
	 UwX9Ol849ADf0rxmsfcGlQpywtrjnm2guKYuQDKopkzwlgBXYVMjr+V4v5e2hJNhI96Fn
	 Gko/6H9EE22FC4uwcZdtsXn0UreUzrIC5RfkWZTaQcw9GQXHRLqutd2amzVV0YP6MUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l2sANhAr;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C0C606A322
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C0C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l2sANhAr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795480751; x=1827016751;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=AVsyv8g1pKTDPoQKrq8p5wr4zPvowsliygXEf6Ey7/w=;
  b=l2sANhArlOBJvz3y0mZ0U3Tc1Qr/Osb+wGGvDpa3h40XR/A3Bmd9WQMF
   hKiT/IO266TgMPbdDjcbxMl6SsYe3AgGnnvX2rSi2kkkF3A0jYdZgjG6C
   70NIqe42TKQaCOiHaDdrn9K7UOn8RCS6r+MjI10YF2KjVNIAig9b5w157
   ae9R7ycDixngBmOc7nsk4v16gD4FIE8Ucdg4mI/wOIARaPVWeVMMLs3JP
   /LLNCxYGpUMoMNmzLxMGh040pqfLP+JrHxBiUyQ6LFCOZAgun3kdl2h4e
   yGVtSwJ/bXk62QQakJqH34U28MLbcRWCgK2sUE9uzPQtQ2E8P1VE/8qPl
   Q==;
X-CSE-ConnectionGUID: DRZEnxlURuOjkS83oXzuaw==
X-CSE-MsgGUID: Q8tAwkBRQ8ajVVgOXXhTmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4332916"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4332916"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:06 -0800
X-CSE-ConnectionGUID: mgk17Z9YS9ajJrP00q2FUQ==
X-CSE-MsgGUID: YgE7muH4TWK/UqvJ/pa8dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11805784"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:06 -0800
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
Subject: [PATCH v22 19/19] drm/xe/vsec: Support survivability mode for CRI
Date: Mon, 23 Nov 2026 16:39:15 -0800
Message-ID: <20261124003856.4145635-40-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
References: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
index 851d02d6ed25..21bd71608fa5 100644
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
@@ -617,6 +638,10 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
 	     xe->info.platform == XE_CRESCENTISLAND))
 		return XE_VSEC_UNKNOWN;
 
+	if (xe_survivability_mode_is_boot_enabled(xe) &&
+	    xe->info.platform == XE_CRESCENTISLAND)
+		return XE_VSEC_CRI_SURVIVABILITY;
+
 	return vsec_platforms[xe->info.platform];
 }
 
@@ -738,6 +763,13 @@ void xe_vsec_init(struct xe_device *xe)
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

