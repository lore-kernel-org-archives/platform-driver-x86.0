Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1813A4D37C2
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 20:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589597; cv=none; b=F7K6M4pZNbDYXyKFO/G8phsDrHuQmss/EPIBCEl67DG2uGFAkD7dp9FxaEJg5T9VY9BtSGXTXHJL4o52dr7/bUn0um8NXUxrAhqDOfByYBj9Nggbsps7iskPzPpHOKhC3jM34u+zmWRAsGVkRJLbuYg5IBHiCLlClY1xYTNhBIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589597; c=relaxed/simple;
	bh=yFc5pwFHvElzTLAMMbHvxa26C+uq8vM1k/lb9THxGBU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rv+R5sU+l6yeqsUfjGOvWQf1ijQBIbgiVOxPknzrHGKYlgjP82LYjWmXV16V4SRPfDAYT3hgwcVmAs1tCtowl2t0xWlnWmKBqjGKPrtW4UCkja6UWG7XO+R9kosh5RzF9kkuhfuJ/hb8gwsWVWLa+5EunB0oGk9KULGSSTPaGEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xw6PK32b; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xw6PK32b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789589594; x=1821125594;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=yFc5pwFHvElzTLAMMbHvxa26C+uq8vM1k/lb9THxGBU=;
  b=Xw6PK32bj4A/prYQuoebLZ6lX0A2pQLii7JplrXIObQBoWviE/I1/WSr
   zGrXATqbr8/tecqaSDjdky5RLci12DCBjB+v8LfkPKS7QLgGMGRGYNSEv
   fVoVJMKlpCf9XCfCIWbQUqj5Boj21wyB1vXQRFyyjCd094gXQPujgcknv
   F1GbS8jYNftJN3qfbJvzTwP5/IU6Oj8C3sbHCcZ0QXYSE0chLMvUiNx1J
   syy6JPuxUAiesFMYgDIjTBXjEmfX6y1B7WK9xbJckm41uDBauMe60O4Yx
   f8QjwKZVgBdMJSGVZz3dd7NJmBRUOKrNlti6FsYUbbulXQq40jJtOoQAM
   w==;
X-CSE-ConnectionGUID: xY6Il+5rT3KgVYWnAEYvXg==
X-CSE-MsgGUID: mL768J/1R9C0IWP/9K3Iwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100296224"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100296224"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:12:02 -0700
X-CSE-ConnectionGUID: LC9KwOF4Sk21kfI8gHq+aA==
X-CSE-MsgGUID: OrsPgTo6TTyWNvb8krtDhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277574053"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:12:03 -0700
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
Subject: [PATCH v9 19/20] drm/xe/vsec: Update PMT internal access
Date: Wed, 16 Sep 2026 13:11:57 -0700
Message-ID: <20260916201139.2374531-41-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current PMT internal access assumes BMG devices.

Use the new PMT GUID API to read the device specific guid.

Minor cleanup for a newly unused parameter (mmio).

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 26 ++++++++++++++------------
 drivers/gpu/drm/xe/xe_hwmon.c   | 10 ++++++++--
 drivers/gpu/drm/xe/xe_pcode.c   | 10 ++++++++--
 3 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 958fb717640a..c56f0e4a9b90 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -5,6 +5,7 @@
 
 #include "xe_debugfs.h"
 
+#include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/debugfs.h>
 #include <linux/fault-inject.h>
@@ -21,7 +22,6 @@
 #include "xe_gt_printk.h"
 #include "xe_guc_ads.h"
 #include "xe_hw_engine.h"
-#include "xe_mmio.h"
 #include "xe_pagefault.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
@@ -146,15 +146,20 @@ static void xe_fault_inject_debugfs_register(struct xe_device *xe,
 	}
 }
 
-static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
-				   u32 offset, const char *name, struct drm_printer *p)
+static void read_residency_counter(struct xe_device *xe, u32 offset, const char *name,
+				   struct drm_printer *p)
 {
 	u64 residency = 0;
+	u32 guid;
 	int ret;
 
-	ret = xe_pmt_telem_read(xe->drm.dev,
-				xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
-				&residency, offset, sizeof(residency));
+	ret = xe_vsec_get_guid(xe, &guid);
+	if (ret) {
+		drm_warn(&xe->drm, "PMT device is not available: %d\n", ret);
+		return;
+	}
+
+	ret = xe_pmt_telem_read(xe->drm.dev, guid, &residency, offset, sizeof(residency));
 	if (ret != sizeof(residency)) {
 		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
 		return;
@@ -293,13 +298,12 @@ static int pcode_info(struct seq_file *m, void *data)
 static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 {
 	struct xe_device *xe;
-	struct xe_mmio *mmio;
 	struct drm_printer p;
 
 	xe = node_to_xe(m->private);
 	p = drm_seq_file_printer(m);
 	guard(xe_pm_runtime)(xe);
-	mmio = xe_root_tile_mmio(xe);
+
 	static const struct {
 		u32 offset;
 		const char *name;
@@ -313,7 +317,7 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 	};
 
 	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
-		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
+		read_residency_counter(xe, residencies[i].offset, residencies[i].name, &p);
 
 	return 0;
 }
@@ -321,13 +325,11 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
 {
 	struct xe_device *xe;
-	struct xe_mmio *mmio;
 	struct drm_printer p;
 
 	xe = node_to_xe(m->private);
 	p = drm_seq_file_printer(m);
 	guard(xe_pm_runtime)(xe);
-	mmio = xe_root_tile_mmio(xe);
 
 	static const struct {
 		u32 offset;
@@ -339,7 +341,7 @@ static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
 	};
 
 	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
-		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
+		read_residency_counter(xe, residencies[i].offset, residencies[i].name, &p);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 2032066d5f49..57b2fbefa4c3 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -512,9 +512,15 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 
 	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
 		u64 pmt_val;
+		u32 guid;
 
-		ret = xe_pmt_telem_read(hwmon->xe->drm.dev,
-					xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
+		ret = xe_vsec_get_guid(hwmon->xe, &guid);
+		if (ret) {
+			drm_warn(&hwmon->xe->drm, "PMT device is not available: %d\n", ret);
+			*energy = 0;
+			return;
+		}
+		ret = xe_pmt_telem_read(hwmon->xe->drm.dev, guid,
 					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
 		if (ret != sizeof(pmt_val)) {
 			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 8c901e54f384..fa9f45d565cb 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -365,11 +365,17 @@ ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
 int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
 {
 	int ret = 0;
+	u32 guid;
 
 	guard(xe_pm_runtime)(xe);
 
-	ret = xe_pmt_telem_read(xe->drm.dev,
-				xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PUNIT_TELEMETRY_GUID),
+	ret = xe_vsec_get_guid(xe, &guid);
+	if (ret) {
+		xe_warn(xe, "PMT device is not available: %d\n", ret);
+		return ret;
+	}
+
+	ret = xe_pmt_telem_read(xe->drm.dev, guid,
 				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
 	if (ret != sizeof(*version)) {
 		xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
-- 
2.43.0

