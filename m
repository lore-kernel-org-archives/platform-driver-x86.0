Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398F745D1B9
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787588620; cv=none; b=Nykm0DgyhHw1CHSy0f35cIbwdfkyDJ3VF6spXigjt85pTvqCHUd+nBxlELA2g4rvevFBzJxYeoyfs3wVHoLX7pYIiwMuoxI/4ByPRpbpqlRGs/o80Vzfy3yUl0RQmpqrnL0XCvHIeEV4wKjR8CN0gq9/i2cOa4Wetffs2TmQesY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787588620; c=relaxed/simple;
	bh=rD+Y1t48ifLIw+TBZl9hOPk6vbUMvzLDbJ2K8OgIczs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ucsV/vKnh1S6iN4Mj5rfBgjTSZJai4NjqsTxeYZvp6i6gZjgBhDc1kxeCWVZR1IfArdKl1AS08uJyjlcJDUWhG1L27tiVxcYqwgKJwy4bx+UAUfCTVRWOK9A3N7fZoovX4Idqb58mpiYeeaZZrC6a4gD1vCIzBOSguyTHdqiCzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RKO7fz42; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RKO7fz42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787588619; x=1819124619;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rD+Y1t48ifLIw+TBZl9hOPk6vbUMvzLDbJ2K8OgIczs=;
  b=RKO7fz42futXogCsH+YjBGnD4BVTjyNOVa8LUjI0FDmBMT2RR6WW1jLO
   BEmZpf+MR3ilqqfo7xkHNTspj8fdxVO3UyqE7UfhJ2lbjN8Gu1C+qWXX3
   /YClTSnbWYJdp5Vk2UaM/UvLlmyD3d2cC/Ir/sqIjxhY1C+XK+MQsJies
   rJZD2HT19kvZogF+4Z537MtCBbN8cdud0QAS41IDN3DioI1eVKSDBSyBN
   NVgX2tgV48UXS6i4cWE0nT780bKUT5q0X8ZK8GBgii04RraV2iIblrT2F
   IqhSnmK2Zh5YPk8X1iTawDOQfsjs4IOYZGgymJhLhiHCpoZOrxuS2d09i
   Q==;
X-CSE-ConnectionGUID: wUw6xigrRvG918wrC46SkQ==
X-CSE-MsgGUID: lsHLwI3uSEui+Img82DE5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91858079"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="91858079"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:23:38 -0700
X-CSE-ConnectionGUID: ltqfpg9gQZmFbcOpLbDxtw==
X-CSE-MsgGUID: o4m/bEPrSWSAXSCYFeA15w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="267088139"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:23:39 -0700
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
Subject: [PATCH v3 05/10] drm/xe/vsec: Support possible hotplug exit
Date: Mon, 24 Aug 2026 09:23:21 -0700
Message-ID: <20260824162317.2450380-17-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DRM has an API that will verify that a device is valid in
the hotplug context.

Verify device is valid before access in the VSEC callback
API.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 8d99a3770b5a..8abe11e6312f 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -10,6 +10,8 @@
 #include <linux/pci.h>
 #include <linux/types.h>
 
+#include <drm/drm_drv.h>
+
 #include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_mmio.h"
@@ -140,6 +142,11 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	return 0;
 }
 
+/*
+ * xe_pmt_telem_read is a callback API.  I.e this can be accessed external to
+ * XE driver (PMT driver scope).  Because of this, DRM hotplug needs to be
+ * verified (drm_dev_enter()).
+ */
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
 		      u32 count)
 {
@@ -148,14 +155,20 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
 	u32 mem_region;
 	u32 offset;
-	int ret;
+	int ret = 0;
+	int idx;
 
-	if (!xe->soc_remapper.set_telem_region)
+	if (!drm_dev_enter(&xe->drm, &idx))
 		return -ENODEV;
 
+	if (!xe->soc_remapper.set_telem_region) {
+		ret = -EINVAL;
+		goto dev_exit;
+	}
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
-		return ret;
+		goto dev_exit;
 
 	telem_addr += offset + user_offset;
 
@@ -165,11 +178,14 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 		xe_pm_runtime_get(xe);
 		break;
 	case TELEMETRY:
-		if (!xe_pm_runtime_get_if_active(xe))
-			return -ENODATA;
+		if (!xe_pm_runtime_get_if_active(xe)) {
+			ret = -ENODATA;
+			goto dev_exit;
+		}
 		break;
 	case WATCHER:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto dev_exit;
 	}
 
 	mutex_lock(&xe->pmt.lock);
@@ -183,7 +199,10 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	xe_pm_runtime_put(xe);
 
-	return count;
+dev_exit:
+	drm_dev_exit(idx);
+
+	return ret == 0 ? count : ret;
 }
 
 static struct pmt_callbacks xe_pmt_cb = {
-- 
2.43.0

