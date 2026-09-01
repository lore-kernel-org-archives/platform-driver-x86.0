Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E8B4A206C
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 19:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290881; cv=none; b=Z4ZA7F5RLzFKZMrwGqXj1OsUQyzr7gedh3tlSZ+GCwzP5pu7OGmQwOqc4qSEYq1su8GOCK/BZF1PgwzUZS8AvAALNkFlxgIH6GaHD4gS4jq4hJWbnZhBCzINoMKaIPz3OX4Hxq/4S9vjCK059w95B6Fez2/25LHZCLZv/GtaCg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290881; c=relaxed/simple;
	bh=bk/D2mfyyuMnySQ0PMLS0AQgmbI/bQcqnPRgb2w6IS0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/HRsJgRooY9uPg2F07NF1rkGYRxK0qBLLmK73T57AhBm4TRhQlk1L/OVvoHh7ZW9EwJ84w4GI+jAcvHY93Mp5FaZhxYTpkOZo/1tOpXq5QudJocHXSD0Z9YF40vrwdUeNbhBKmHZtJrZmyGOUq15M5iU6zFLukgtnxj9MwVCnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kr30h5TJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kr30h5TJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788290880; x=1819826880;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bk/D2mfyyuMnySQ0PMLS0AQgmbI/bQcqnPRgb2w6IS0=;
  b=Kr30h5TJY5NSjgZSSivjF/BAvOO9G0Yt8MDOGRu3BBdTTMQFO+ezun2o
   jEaAo5IzSVkU3a/hKjHCe8WKzCka1BIKqeMouXH/eIshYUZ/fIM7XXbmP
   s8jMTez3kl1KzhmKYsQYIkduuE0gyYj5CvSbAyd0T/jVk/2hPsghzpaY4
   LkJT+MNt9ZvudHpzC4Jct5dB4zjVHh6Ff+r7kse6YpWy+Rk+2eCxnoy/Z
   QYadsnz2oVQqj/xba5Jpaz019uj++JMr7sNqzwb6AZYE3czjG2ggoxVZy
   u6wcn2GOS67wMTUf33GMM05zs6DRPu3c6FsqOtqt0BrTaggS/B9hogtNy
   w==;
X-CSE-ConnectionGUID: Gkm/fAWKS9OTSo/S5H3e4w==
X-CSE-MsgGUID: gXaS8Rv2SKyQFCtGdgcMnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88762514"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="88762514"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:59 -0700
X-CSE-ConnectionGUID: c4VRWyyRR+Wfk5Y0Y3nx3w==
X-CSE-MsgGUID: bNj1hJDQT5KVua9Onqsbvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="269776759"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:59 -0700
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
Subject: [PATCH v4 10/18] drm/xe/vsec: Support possible hotplug exit
Date: Tue,  1 Sep 2026 12:27:45 -0700
Message-ID: <20260901192736.626777-30-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192736.626777-20-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
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
 drivers/gpu/drm/xe/xe_vsec.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 468a221378fa..c6299629dc27 100644
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

