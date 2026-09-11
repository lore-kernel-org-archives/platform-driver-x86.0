Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B79959B678
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 20:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157536; cv=none; b=sw3CIAfoDJgJk0swlcNe2iNxwlX1N/Pp6LAWQWkT2Jew4eAeZ8tbED6IOByhE2Q6mA9J34XD/9DhYLYURu1sjK/sS3C3GaFBUKasOp8+cq+AdEtteEet/TfmUoWk3YMJRhdn3WlWIxVQh9jNnBF8gJvzbTxC1WYEKvI87ngGkIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157536; c=relaxed/simple;
	bh=Y05JvbiBoc6hnW2yndM8nHg4xST78/jI1JnLeTfb6qQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=laAFizjGH+im8ij6bi5gAx3/nDe34gBUa2Cd3kFmqh/87m1YlfeuaJY0vwbMwYLPzWi5jJc0LXBeVbCBlk0xSZ67o3SOyknyiq4Vk0VmKV5SLTCLYL4oyJUXD/wsY4LnE4vOaZXVIVEl21OvFr9rODA9j7Dm6LfBWbpWRWfEvCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4yurcAq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4yurcAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789157533; x=1820693533;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Y05JvbiBoc6hnW2yndM8nHg4xST78/jI1JnLeTfb6qQ=;
  b=R4yurcAqRiIWOrxCblHydrbgS5WyI8mhHtMdExOLT8M7XZyAKY+GZafX
   01RIns5kxqKwUXfWdZpIdhvexsRBIWMDhPpVwBc3LWPUwgWGnBVDcxdrH
   iGJ8vCzcZz1lIdYBG8dXk2fXRY+rqOfEaSxk1Z5V1YiJlKZacY6PuAYNo
   QF1OCTz2jt/5VWZMeluIyqr6FqScu0fDytkcnvUknPsoMv8JbNtwYmi2Q
   UT1oinHi0LB+6MvcYLPS7/uedKaJ1FkamiGXNuhjQVXChP3godndVf1La
   BPnHtcjl1nRsZBGzl/QLVPUE+vqpRU8Fpg1aY7NTrVNNG4pVhKXafos7Z
   g==;
X-CSE-ConnectionGUID: uKPMV8Y7Tw2u63zKlvZlNA==
X-CSE-MsgGUID: 2h0CAH+BSU+bKqaj75w5wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115162399"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="115162399"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
X-CSE-ConnectionGUID: MWDOYoHcRuW0X85DZr1JiQ==
X-CSE-MsgGUID: yLjiKK0yQ16azWasc1bRSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="277272097"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
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
Subject: [PATCH v8 10/20] drm/xe/vsec: Support possible hotplug exit
Date: Fri, 11 Sep 2026 13:11:58 -0700
Message-ID: <20260911201148.1610547-32-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
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
 drivers/gpu/drm/xe/xe_vsec.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index c0252f5b508f..3bea89f2a5c5 100644
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
  * * -EINVAL for VF and PMT WATCHER requests
  * * count   number of bytes read on success
  */
@@ -171,14 +178,20 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
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
 
 	mutex_lock(&xe->pmt.lock);
@@ -206,7 +222,10 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
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

