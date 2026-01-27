Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA152C0282
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Jan 2026 18:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538276; cv=none; b=rJT6+DYhHzs+DJ8rf8dlJ3/ezlYzVIroMh0vVLnEd03W2vebw7x6Gs5+r5IlzF8K4xRjg2HuNz2tdOAh23YDAHSYT19F+p2A2a2qI5mP+NU9GzOGShDMci78gd9S7L9qdbIFsID7Ui1wGVJqS92czWfTRlilnGD6Kt0LaIUwhF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538276; c=relaxed/simple;
	bh=ep35alxvesdDViN0x8Lr5FGAwZhxYvWsQZV9r0/Xef0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7gXA6iPUvaLMvJracyF6fob0bMyLgFckEgnoxcP9J04218yIhWBx0guEaS8XTRIcE/n9dNq/c8ErXTfVU/S8EHrfyXdiIsN2+a8fpoRgpUZEuuhAOgDsg8th06XYefw4cMZ0D2oDdBaS2s6sqWlDOcuP0KwqkF/P/jjniui/XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZtdoXFU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZtdoXFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769538275; x=1801074275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ep35alxvesdDViN0x8Lr5FGAwZhxYvWsQZV9r0/Xef0=;
  b=NZtdoXFUCqffQfv0ZsmgmlD8Rso05oRKGcAblh5BDSZI11iuYoRIyif2
   /QuikLeWOcVHS+C47rHLRUcL3UFGT5+wHtF9gAq+H0m+YYr1GVTUE+cgN
   PeJU7XsHHNUoMCYpf/9FEg6iRY6JltKoy7eBdKJWUJ3gqkJNnQFJb2YX5
   s12ddXCEBumhrxfroQ82yPZFdbaWLd/v3ob1I9zv2KKYz1iM87aAtSX5O
   wLQp4Yljb7Z3xulIX+7J5f3BztlbJlktRmkE/zCoPttY9zr2+Z7NvZRjy
   QqYlPVytlFKtRYFQDyC1PfBxfuGLqFgAm8syJuXgAUIXnqRjJf1G7OGFW
   w==;
X-CSE-ConnectionGUID: OYrgXcNsTNiZRVmgn0OuLg==
X-CSE-MsgGUID: mY/lUvGQSAeNzpl9PBoSlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70644431"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70644431"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 10:24:35 -0800
X-CSE-ConnectionGUID: JdFPvOzYROGx1w1+hBPHEg==
X-CSE-MsgGUID: Y2XWIcX+TiKGdqSkNfy0rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208491670"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.176])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 10:24:33 -0800
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
Subject: [PATCH 2/5] drm/xe/vsec: Use correct pm state get
Date: Tue, 27 Jan 2026 13:24:21 -0500
Message-ID: <20260127182418.640701-9-michael.j.ruhl@intel.com>
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

Crashlog needs to be collected at all times.  The current pm
check assumes telemetry only.

Update read path to enable device for crashlog instances.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 4ebb4dbe1c9b..44607f1eaa88 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -145,6 +145,7 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
+	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
 	u32 mem_region;
 	u32 offset;
 	int ret;
@@ -160,9 +161,18 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
 	if (!xe->soc_remapper.set_telem_region)
 		return -ENODEV;
 
-	/* indicate that we are not at an appropriate power level */
-	if (!xe_pm_runtime_get_if_active(xe))
-		return -ENODATA;
+	/* make sure that we are not at an inappropriate power level */
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
 
 	/* set SoC re-mapper index register based on GUID memory region */
 	xe->soc_remapper.set_telem_region(xe, mem_region);
-- 
2.52.0

