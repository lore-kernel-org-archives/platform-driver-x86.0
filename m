Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141186;
	b=p6irongiPOm/OjmG7by1jOyIjRHbplSzeyz4rXuhiydL1y7kJd2pe7ITBLNlzL92ar5Q
	 4qGiWRG3T/E14W7ylcWNcK9rvL0ramhYeg7l71Z9Fnf4wllIr5vd0CE5gd329nRERw325
	 HOnZQbLgejaLFpjBIP7hL42Ik8mRmRpBYir2dDSPAGNPKXQXx9Hq8iQU1Pu6aykHezd0J
	 3U1I9KAZoEaL2bg78tH+XJpkA1Qt5XQY1GbV0AqFl6Ex6h8qPBZYLjJjswe3Fwxl1JZG6
	 UinJdvKUhJv6NjJZlq1vY+8kH/lSmk+3DtqDfQyvP4gOCiFSI2zah1N1mRhAxT1wavA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141186;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r5cBsYojwyQ4WNXhnc5nkRN/6qnZAnMtznjuFiFxe9c=;
	b=0JYmOJZv3scBEXOL2+iuNEFZwnhuj1dGE+BCl9lTQKbqj3k7+VIQyoz7flUnkTEL5Fl4
	 CQn2+2HWyrZYpnGg0z9DR5wWtFMYm5C9qAVyifbdfO7SFjvef0vZyCHHIL1QlXo4LWmkE
	 PB/cSrQ3ehJFkPtpzBvjdrGEWMk/hSOYrkISSHEpiT+eSG1dENi3SNhMLOS2aXsNM+J7a
	 d3RcT0qsxtpE72IFicZB/QGCs8l3V3Sy8kq0+ewNCSGxhk6MH37om5szuuPdBtMJkOHrw
	 hHldJQ9cFtNhBlPWNpQT/92r3S1qaCSxbRtUpipqf1l5X2CGTzMJsD5GxjKEhp4yptA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e8BVCGwY;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC41606A32C
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 02:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFC41606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e8BVCGwY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795141186; x=1826677186;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SzFtP7KiHpKfUrdzDx0Fg2pryg9lqzh6+ydCVewHnlg=;
  b=e8BVCGwY8W3e2mak7j80xYndbtwrvxefjlE7tRU+Mf4c4KHk9XrlFX5X
   7yF2FQ/Kr1bCpK4ojpZiwyCDynrmEX8FDngF35t1jygCcO+jZVA06a+8R
   /Ap7DTJG4AnVdFjAZ7ET2g1q/otseXcG+nHriQ014Hgf8DmGlv7xdtSA/
   2JFll86/il0gytSV3RCz3sSuCrGFrLe8LsKghEusj2AvJLp6FELukUVWH
   y4O71ogU0kmcKnZkadU5em/2J48Av/ArSLjlUValxCYPvtzKFwZSCShs2
   MqZ73S/8GMmOBdPJRddncJ0FtVfQB9VjHmok1FmCb7ffKozHAsMwMhomt
   w==;
X-CSE-ConnectionGUID: C6ym/aZzTv+2NG1oUlq8vQ==
X-CSE-MsgGUID: 8mtqBYgFQDyrE/og8SfGvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3898425"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3898425"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:44 -0800
X-CSE-ConnectionGUID: YBRAVrVLSWe5WNWWJweg1Q==
X-CSE-MsgGUID: LCAd9hJOTD2enrjkrycmDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10487117"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:44 -0800
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
Subject: [PATCH v20 08/19] drm/xe/vsec: Support possible hotplug exit
Date: Thu, 19 Nov 2026 18:19:38 -0800
Message-ID: <20261120021929.473553-29-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120021929.473553-21-michael.j.ruhl@intel.com>
References: <20261120021929.473553-21-michael.j.ruhl@intel.com>
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

DRM has an API that will verify that a device is valid in the hotplug
context.

Verify device is valid before access in the VSEC callback API.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 082b25b017db..6a28e58959be 100644
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
@@ -159,7 +161,12 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
  * @user_offset: a user offset relative to the beginning of the data to read
  * @count: bytes to read
  *
+ * This is a callback API.  I.e this can be accessed external to the XE driver
+ * (PMT driver scope).  Because of this, DRM hotplug needs to be verified
+ * (drm_dev_enter()).
+ *
  * Return:
+ * * -ENODEV device is not available (hotplug)
  * * -ENODATA for incorrect power state
  * * -EINVAL for unsupported PMT feature
  * * count   number of bytes read on success
@@ -172,13 +179,19 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
 	u32 mem_region;
 	u32 offset;
-	int ret;
+	int ret = 0;
+	int idx;
 
 	xe_assert(xe, !IS_SRIOV_VF(xe));
 
+	if (!drm_dev_enter(&xe->drm, &idx)) {
+		memset(data, 0, count);
+		return count;
+	}
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
-		return ret;
+		goto dev_exit;
 
 	telem_addr += offset + user_offset;
 
@@ -188,11 +201,14 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
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
 
 	scoped_guard(mutex, &xe->pmt.lock) {
@@ -204,7 +220,10 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
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

