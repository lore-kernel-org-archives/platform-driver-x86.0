Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37287577E42
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 15:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968887; cv=none; b=Tb/QQNDB7M7QPEOWoNH/Sgj0J7a0q85EPQWnx/5XrGbHm7UKAMMLgjEkhXNnS1SCVJZ70eYxYyInkPGB9/T/Nylt2Wu79zxSARiWPGsXy9mqbwuqfu4XD+LEZgbIgUCtpSi4lCGYte9VgOL8rvuCUdR5YWMwrEr5uWqyAvhyDX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968887; c=relaxed/simple;
	bh=oXCAtKEiEtOMprtrsCHAjbUyC7PKXiIXQ67zRM31t+s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhMdAEgu2xnffqXqD75/Hf5herdrhIB+dr6H04h0/EjCyrzVcJM8gFc1Suu3ptw8M98ZPBEwc5+uyJHt0FzeIKDMdDnRQ9DZIMUb7UUrMdmsw4rhwiyeLx4NoYPUNftp/faWzE4VCvLrRSBeIJH+fWHD7WGlD6kCZr5U6kzGrF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQJ7vcGh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQJ7vcGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788968886; x=1820504886;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oXCAtKEiEtOMprtrsCHAjbUyC7PKXiIXQ67zRM31t+s=;
  b=lQJ7vcGhqOBgE1O3U6eWgTRZ0yrzkAIth1ti94WzpQtlI744SDuqpqjp
   DzRhu4Mj6K6IL+5RElU6aMFKwokjignilExCD+EKuVZeU5Lm/q15rPJ/n
   5P7ftrS04LtWQayGGLLuk3aoAiVAKm3//4pHAQwILeyaswD3pa8QqUfrC
   jHOcuqHEJYarRrazbePgp3KGmnidcfuyOLtd1RploOzDyDnsx9AdlVsZu
   GJj2t8UhQ/JOuO/Br+UD7mdvjBFCky9te0wsm+Y78vdZ+d+36t+imAiwo
   tKPpXTOPunYjP/BuUYztZMQ4eirqiUCoE7H+fkxjywCDq/PpwoD7LQabN
   A==;
X-CSE-ConnectionGUID: wXaRiUh0TmqavA3C1uH2tg==
X-CSE-MsgGUID: WvGTv7qiRDitxSE6W5R/sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93091848"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="93091848"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:47:58 -0700
X-CSE-ConnectionGUID: DuGHYd1WSkWPNKUl1X+iGg==
X-CSE-MsgGUID: b/MXv3DtSsCvJA3QZySKXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="268102526"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 08:47:57 -0700
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
Subject: [PATCH v7 12/20] drm/xe/vsec: Support EAGAIN return value
Date: Wed,  9 Sep 2026 08:47:51 -0700
Message-ID: <20260909154739.1515514-34-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prep to support EAGAIN return values from pmt_telem_read().

Update call locations to reflect this new return value.

This is not an error, so no error will be logged.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 3 ++-
 drivers/gpu/drm/xe/xe_hwmon.c   | 4 +++-
 drivers/gpu/drm/xe/xe_pcode.c   | 3 ++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 80f62634fae5..a7021a1b025f 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -156,7 +156,8 @@ static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
 				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
 				&residency, offset, sizeof(residency));
 	if (ret != sizeof(residency)) {
-		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
+		if (ret != -EAGAIN)
+			drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5284cab6703d..ecd52a04175d 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -522,7 +522,9 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
 					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
 		if (ret != sizeof(pmt_val)) {
-			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
+			if (ret != -EAGAIN)
+				drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n",
+					 ret);
 			*energy = 0;
 			return;
 		}
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index d502205bb72a..8f9afa0d9440 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -372,7 +372,8 @@ int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
 				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
 				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
 	if (ret != sizeof(*version)) {
-		xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
+		if (ret != -EAGAIN)
+			xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
 		return ret;
 	}
 	xe_dbg(xe, "pcode version major %u minor %u engg %u\n", version->major,
-- 
2.43.0

