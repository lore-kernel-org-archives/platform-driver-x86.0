Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103702;
	b=WC7UyvOZlyGN2IN+Vwq03kwL7DjzCSFZBBn9C9XIb/XCxlMQXAWFmrkbvxf/n3u+g4XI
	 wE69oe8ZMnK1XzegPzqmWu+9/WTndukkp4PDNC1FWxqOk8febNm/5VpemAn+ut5AaSjD7
	 7/+qGjEBUpbJHuS/l4Nx3MfzamPd2tKGAMfKTPYbPCFIEem/6Z4ojVJniRwXqr32PdLUs
	 4UArvCbRHet5iwyTl4P/NvCx+6SQt1DQmMsZWSDsvLobwZH1XaswjRKG5x8VS/IkBSF1f
	 iMtA575hl8fP6CiHCUYoUB8qEldvp6uDuRYKJQLqQYIx/3Wt2BFB0Z7AcaiywsVRESQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103702;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5OZAKiaoKuHGAA2Zz6WjYSkzDVO0sJV5+UMYeOMptMM=;
	b=jR9auyOCpyYyUf4nlzkleFh0TRgKp0pTs238xmJsy2oVU2efMjxhYWQey/rtf5Gm7LV+
	 aVeI8Y7NE1GjWAxLPN2rgl+AMRfqxog48dnrVGxIXSyAn2zH+ReNAjJyywZF1w2jyzho6
	 37Lz6ea07QPpomZ/Gf2S+PzClvlyfEyxeYVymctdL/iqd39074FIUt1p/B6gxyBvjWvyQ
	 WuHZinSKXR4U/bdIiBsHtKErYynYFyuw+KXpNX6t5+hbW0kmpiqwzsqfxZSrhCxv2O2EN
	 CffLaIBDL4jMBciYqtHMeq++gG9zehOhWCmKywH5aXHcGy1sTxvx+qujBhqmAfoIdMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ID8Tk6vK;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2785160A2600
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 15:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2785160A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ID8Tk6vK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795103701; x=1826639701;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=nR1ar/GJQ2HAol68SKO1fucyZSIC70D4KcT9LSE63JY=;
  b=ID8Tk6vKsGWgvES8OnnbPAgpA3n15L+eY2LOeH5LhV5QuGBmdXT6806q
   jdK287DGtGS/O6LyGUXIHUIliiuNxpg5Llfjf2grCSO6LvP8YQcfnE795
   fGBAlWE1ggrtUNXy9sZID0db33Srqgkzk8GQr9aYBEwLo4sekaNdqoYQo
   FSGEIaL8WbDFVmOVqU/sL2QdNIP1lyjxtR4mxW5IC2ppXcs78ln2gpOCw
   AkcC6WAjPvbxdfSyG0wm9bXR8yUUjnXQ+PowZzXbNmg8nttUcFbpTadgd
   Yh9rO5tmNjjBsnbmO/yiG89FlI1t6zAyz/ZF4XLDou+DGYd4AIk7QQ3jB
   g==;
X-CSE-ConnectionGUID: eor55FPnS0mPr0MdgAX4GQ==
X-CSE-MsgGUID: FI7SsYm6Qz245BYjlMGXPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3849054"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3849054"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:55 -0800
X-CSE-ConnectionGUID: cTnPcMJNQhG+p0XN8EkKCg==
X-CSE-MsgGUID: XqS/ImuBSl+D3mn7Hz83gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10263444"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:54 -0800
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
Subject: [PATCH v19 17/19] drm/xe/vsec: Update PMT internal access
Date: Thu, 19 Nov 2026 07:54:55 -0800
Message-ID: <20261119155438.40762-38-michael.j.ruhl@intel.com>
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
index 342182d5ecda..578ee973d159 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -5,6 +5,7 @@
 
 #include "xe_debugfs.h"
 
+#include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/debugfs.h>
 #include <linux/fault-inject.h>
@@ -21,7 +22,6 @@
 #include "xe_gt.h"
 #include "xe_gt_debugfs.h"
 #include "xe_hw_engine.h"
-#include "xe_mmio.h"
 #include "xe_pagefault.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
@@ -149,15 +149,20 @@ static void xe_fault_inject_debugfs_register(struct xe_device *xe,
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
@@ -296,13 +301,12 @@ static int pcode_info(struct seq_file *m, void *data)
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
@@ -316,7 +320,7 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 	};
 
 	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
-		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
+		read_residency_counter(xe, residencies[i].offset, residencies[i].name, &p);
 
 	return 0;
 }
@@ -324,13 +328,11 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
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
@@ -342,7 +344,7 @@ static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
 	};
 
 	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
-		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
+		read_residency_counter(xe, residencies[i].offset, residencies[i].name, &p);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index d9636eca0133..55e0f961df4c 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -603,9 +603,15 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 
 	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
 		u64 pmt_val;
+		u32 guid;
 
-		ret = xe_pmt_telem_read(hwmon->xe->drm.dev,
-					xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
+		ret = xe_vsec_get_guid(hwmon->xe, &guid);
+		if (ret) {
+			drm_warn(&hwmon->xe->drm, "PMT device is not available: %d\n", ret);
+			*energy = 0;
+			return ret;
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

