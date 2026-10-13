Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7729555D87D
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 21:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928037; cv=none; b=dGcrRB9ul3+y+0oIM2GB37xEHMpowiGZOL8nbSdsJsNVMRNgG1wJPA+6wBR9AEtA/QciMFo9+u5fRq/rRrk2cYlBIDujQIODEnewyTUZJ0wiiF3ua+lr0V63LuqxsOufKLfqn8HydUkagM2SIs9RpAPoyUXQIUrYvZK1puZZuc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928037; c=relaxed/simple;
	bh=9UiFEENsHUpaPZ4wR6BzFYwjN1lMRTTULv+8zX+uZTU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNXW/pQK3KuvJvuO3nHtoWLZS+lMaLQLvfeyQf8Wpuq1xqKKARiCswfnPeWqxaiinLKC5hMwrlzydKgvLcCpDfsDmLwAW72KyxD/FKUbUEmuy1nTAKGGz3WmMR4/JDGg6wXPdWfkLBbch0KUXfBrR8YDgLJNxCCNinzb9KhxrNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkvRUNzh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkvRUNzh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791928037; x=1823464037;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9UiFEENsHUpaPZ4wR6BzFYwjN1lMRTTULv+8zX+uZTU=;
  b=ZkvRUNzhvxmdsDsq0bfSRA4OlYbKJpFP+WTKoiEapZxUrsJLzj/lYG3e
   wcSIb401ISm/dbuvjSJFnG/DHuDNo/vmOysMRjjV2jVFRP4bLDTssHjjS
   Tun2yFMcT0u16PcApC6D1IYeY/NcY2gxLRG7ohBCgJhMPXmfpfSUaPchE
   nyBX/OBAf6iP2nf3FeYQl3LTDST7A5dNpecvBsBVLcJJVDXCsLlp03GU8
   8Xx7yfDfLrZoy2kAfTdbJ7Zb6ggZ+yaX1ec1ANMayrogZ84KgEyVxhYjv
   xzPclI9UqZbdhITgFH3V3t9s0RRuUd8CLxIlQdkLzq8RTFCTKP5hpSCvl
   w==;
X-CSE-ConnectionGUID: hqyJEpV9RQyoXLYRD5QW5Q==
X-CSE-MsgGUID: 9QGsioNwSzmWY0T3s3jdKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="569437"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="569437"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 14:47:08 -0700
X-CSE-ConnectionGUID: D85O0HajT9yLt5jJ1g/eHA==
X-CSE-MsgGUID: jNyUOByJR/eQQW8pR8P/cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1629844"
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
Subject: [PATCH v12 08/21] drm/xe/vsec: Use correct pm state get
Date: Tue, 13 Oct 2026 14:47:01 -0700
Message-ID: <20261013214655.3502964-31-michael.j.ruhl@intel.com>
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

Crashlog needs to be collected at all times.  The current pm check
assumes telemetry only.

Update read path to enable device for crashlog instances.

Include check of the WATCHER CAP_TYPE for completeness.
WATCHER is a possible type and needs to be accounted for, but is not
supported.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Fixes: 2c402a801c19 ("platform/x86/intel/pmt: support BMG crashlog")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index d93c042cf25b..38081dacd307 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -145,6 +145,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 {
 	struct xe_device *xe = kdev_to_xe_device(dev);
 	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
+	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
 	u32 mem_region;
 	u32 offset;
 	int ret;
@@ -157,9 +158,18 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	telem_addr += offset + user_offset;
 
-	/* indicate that we are not at an appropriate power level */
-	if (!xe_pm_runtime_get_if_active(xe))
-		return -ENODATA;
+	/* Always allow crashlog. Telemetry, only when powered */
+	switch (cap_type) {
+	case CRASHLOG:
+		xe_pm_runtime_get(xe);
+		break;
+	case TELEMETRY:
+		if (!xe_pm_runtime_get_if_active(xe))
+			return -ENODATA;
+		break;
+	case WATCHER:
+		return -EINVAL;
+	}
 
 	scoped_guard(mutex, &xe->pmt.lock) {
 		/* set SoC re-mapper index register based on GUID memory region */
-- 
2.43.0

