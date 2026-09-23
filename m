Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0299543849A
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 18:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187095; cv=none; b=qBpHg8BUvl991YLl42uX60V5gOwy1vhDUs2mRHJ19jBsAvTMp6d2acjGrJ0vzVGQnRR+2mK02yzQRpLNOBxFfOX0n9NSqJEo/e+l+6rIRmzTFY7cD7zq2FbcUbUMNiaL+DC6qt1w6Bqk49IqQpz6Ay2PXfcxak1eVC/vUTWvPnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187095; c=relaxed/simple;
	bh=aSExY6XUYC0oEPjDcj/taKCl3VRcUT5EAxgzrFJNEf4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xxu+ZfVearTYADSdoRfkuoDs/KaKcLK2AjvNUOtTdt5/Lvw4YChqh/pkHZ80dO5AYAonaTg05gxbt8xAj6SLLGK6fthSRA3bGptzDOLW7JEYB2gq71q2rU8DWuPZXV29BaZI1Vg0laZb7QiqBUkdx/vaThF1+Ur1Ahc6+R9ZE1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+Y+abZc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+Y+abZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790187093; x=1821723093;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=aSExY6XUYC0oEPjDcj/taKCl3VRcUT5EAxgzrFJNEf4=;
  b=i+Y+abZcYIsV0gDXwL+L3JpfV8TabKxyz6vKGEw4HOGRWYb94/7y1BrB
   onhB1OH/FJq3ovbm3aPQBvNIw3azLtbl4PoUr1mq+hAGrX55Y2Cr+EOzc
   7XHJUGK+9dlZ8KATu4KkXhw6+AFq1g0lPKZ32xKDxXJLTTbMiFRTl2znY
   fzoP17S7VcWCzYCw7f6iHdp6+mEm71sUH6C98gOLWtvLuKVbyc474JH76
   K9ltLYVJgzuwAUd3h5d4Tcb83SKbhm0nAb8Wd9WGj8s6R9TlW1OR3yqFh
   Ir91hRbaiOKL9ij2eKXAi8XqS4TtIz+9N7lzVo0qlAi4+tCqyXbhKxD8j
   g==;
X-CSE-ConnectionGUID: u+dJd3hoR9GgOOa0+6RygQ==
X-CSE-MsgGUID: o8Hf2Z//R6+cNqpLNm8m0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93416021"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="93416021"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:11:25 -0700
X-CSE-ConnectionGUID: ULuSguwFTBqqRs3rDVESeg==
X-CSE-MsgGUID: F64Y/MY3ST+uuREbM9yTjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4980704"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:11:25 -0700
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
Subject: [PATCH v11 10/20] drm/xe/vsec: Support possible hotplug exit
Date: Wed, 23 Sep 2026 11:11:25 -0700
Message-ID: <20260923181115.2514193-32-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 082b25b017db..c0e06b2aeca6 100644
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
@@ -172,13 +179,17 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
 	u32 mem_region;
 	u32 offset;
-	int ret;
+	int ret = 0;
+	int idx;
 
 	xe_assert(xe, !IS_SRIOV_VF(xe));
 
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
-		return ret;
+		goto dev_exit;
 
 	telem_addr += offset + user_offset;
 
@@ -188,11 +199,14 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
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
@@ -204,7 +218,10 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
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

