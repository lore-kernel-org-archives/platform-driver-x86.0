Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD19511183
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Sep 2026 20:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466268; cv=none; b=mgKJkb3odIFroQU0Ag3VU52VCRquYqrmnixVS1/G6OTI2AvEEd5oepiK9G4LAMD+RWslxvsSqTi+Jn9KO6QEguSHiNKmy1q8bpbSICgIIo2jgMe42UTEmQ/VrJy1ZqakLOhZ4yKMMmNLGGOGJ5mT4c7sBcI/MLN7k86cpcUR2PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466268; c=relaxed/simple;
	bh=HEd0LHkEx+g52+4a2PN5/rQN4+0C7GjLIHWe7dYQU30=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k36mY+I5e5mZBpWm+SDnrkPIjuBsSR7UYKaT3tAOWgtjiYIRIT3Ht8K7esVRO2zoXtigjEmHKb9wvjjY002957KAz2IKPt+psAs+na/OG++4HSu81HRvHyCscm+NhOysLPwKaqJTnf0J91h/EddrUUWdsIqMKGWGt7+lDpeOBzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcvVWGl8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcvVWGl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788466261; x=1820002261;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HEd0LHkEx+g52+4a2PN5/rQN4+0C7GjLIHWe7dYQU30=;
  b=bcvVWGl8leLqdj9jZjJbdoEXkqdreBBX/eiu+JRcbw2NWZbmsf0KWPib
   NiyPhIQrn1cfN7lbg/JorjH8d8F1zSnzCTDVaCl3yXd9lz+BDjBtAKdgu
   F+IuICBC1D0MrjQtYp2DEU1S8eRkAyORM5TbzZDz5lN0O2kse9TffndEg
   3YX86OUhD4VqzDzV12qeMnDXIBMkL7hl8eitM4+Bp4Jr8pz0xwR/GKuiz
   Znn0ccV862oMJ2vvlMX2C8Jx2K6vySXeBkP/y+40FPhJYwFQUhnP6uFFZ
   luEY6BxP65VnNDFR2Aygs846WM7iw8vdSnOGD6fn5B2Z5RBAzWVqaMl74
   g==;
X-CSE-ConnectionGUID: 9LpgLf04RcmeYzWaein+qw==
X-CSE-MsgGUID: zvV7h7IwQ7my8rEQv9m1Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88994615"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88994615"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:10:37 -0700
X-CSE-ConnectionGUID: Dgsp46IXRa6gNVp/fnuoFQ==
X-CSE-MsgGUID: JsYU21vORJabhAwykXDMCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="273348141"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 13:10:29 -0700
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
Subject: [PATCH v5 10/18] drm/xe/vsec: Support possible hotplug exit
Date: Thu,  3 Sep 2026 13:10:12 -0700
Message-ID: <20260903201002.1064889-30-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DRM has an API that will verify that a device is valid in the hotplug
context.

Verify device is valid before access in the VSEC callback API.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 39 +++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 5223bfe50ede..01df339ff62f 100644
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
@@ -159,8 +161,13 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
  * @user_offset: a user offset relative to the beginning of the data to read
  * @count: bytes to read
  *
- * Returns -EINVAL for VF and PMT WATCHER requests
- *         count   number of bytes read on success
+ * This is a callback API.  I.e this can be accessed external to the XE driver
+ * (PMT driver scope).  Because of this, DRM hotplug needs to be verified
+ * (drm_dev_enter()).
+ *
+ * Returns	-ENODEV device is not available (hotplug)
+ *		-EINVAL for VF and PMT WATCHER requests
+ *		count   number of bytes read on success
  */
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
 		      u32 count)
@@ -170,14 +177,20 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
 	u32 mem_region;
 	u32 offset;
-	int ret;
+	int ret = 0;
+	int idx;
 
-	if (IS_SRIOV_VF(xe))
-		return -EINVAL;
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
+	if (IS_SRIOV_VF(xe)) {
+		ret = -EINVAL;
+		goto dev_exit;
+	}
 
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
-		return ret;
+		goto dev_exit;
 
 	telem_addr += offset + user_offset;
 
@@ -187,11 +200,14 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
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
@@ -205,7 +221,10 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
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

