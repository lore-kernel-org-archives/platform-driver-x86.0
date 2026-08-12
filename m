Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283CE379989
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563482; cv=none; b=ilsvj1JoYlmXaCL7MlJGIGXmSiX/wCieIiHTBFwrwSpOG2aeuZCzrDi55zHXeHJ9Ngj4ENEluQcHI9/oezU3DxKGIIXTiQFAVn0isP053m4jPRPAe1HxAI0KzBknN/udNMrPA2KFsLCE6/SfTsVTCQRh2Tp/2HxzAo5mI9G+eXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563482; c=relaxed/simple;
	bh=rD+Y1t48ifLIw+TBZl9hOPk6vbUMvzLDbJ2K8OgIczs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TmOetVPnpdccV5nHwzrm5ayWgP2FuENLTmICkegC8EuVpcrEX2VE7/WtcYdD10lT/ij0fYumCdJFDJheL8O5TW/WGh8vuFYM/CL6pbhk8VvzoloF5XIpmdxWP9Oua6iutpCSIii/tG0ePc88BQDmfDipcIyMH5O5eks3Zsi/w5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4nwVHpg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4nwVHpg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786563480; x=1818099480;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rD+Y1t48ifLIw+TBZl9hOPk6vbUMvzLDbJ2K8OgIczs=;
  b=e4nwVHpgWCIa/PFGXPtlXsIYy5bI8mrSbYowX4z+RAMIEo34A/1CqV/U
   eqeIacEYIMo8IoPs00t0d6KakxnYKGT8ccjvMq2K0vwfqOj1xpT7pKapb
   0hMBZ4PkC8v8PjpHP9xM0YKSqyEWNQql48Q7EPq5/I+7Q8a8/T5alRP+I
   qWV6pvPWwfTAl7OHl3oQTyoNRuidVjm2U/BF3sV5KVBFBs+Lniqsuh8R5
   XajIDDWaFvxWHc2ceTHYGLjnsHaE4qvJPeoWRZkxabLKexfCHkRCuRhp5
   fcyddbiasx3C5AZtuUUEoFDMPeJXHCc6U6BqEokYYd0hksxLoOWX8G2zj
   A==;
X-CSE-ConnectionGUID: 5ItG4HuMSDmFaCM0tKrDsg==
X-CSE-MsgGUID: ni/oVwd0TeW1mFFT9xHxpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104515386"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="104515386"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:38:00 -0700
X-CSE-ConnectionGUID: 0hD0a4khRaSIcbXFI6taiw==
X-CSE-MsgGUID: YG8G1v2jRXqOAgFaP0/Hyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="263779935"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:37:59 -0700
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
Subject: [PATCH v2 05/10] drm/xe/vsec: Support possible hotplug exit
Date: Wed, 12 Aug 2026 12:37:46 -0700
Message-ID: <20260812193742.2170188-17-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
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

