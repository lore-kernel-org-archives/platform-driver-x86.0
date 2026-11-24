Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480750;
	b=hGdNF8LIzG+MTnD9/VnEGc0vGO881eQYh35Tn4XIsYQSIbr5nN2hjVqF7hxX9D0TwD3+
	 xyGlXXlXvnzbg8oUAogwSFB6f1l/J8rQ6NXdZFu3DWFpAtSd4qwlR6T6mU5op0NbUos1s
	 l+ERk1x/8Pkj2mEejQ7esBjnfPY9wgFWkejGMBHhTudESJ1v4awvH+bM5iAZbnrHgDmfA
	 qYytYg5MgMk4pqg/wosUCsyymXzNWk0Z/aGIUDcL2ievSdsXEi5PL9AteqtPAQa4GdG12
	 DzPRjsPZLKzNEOMdc5s23k0OlEDpddI6BQ+DNNzIHaIJf8ffRMOQSrXeFxQ4ztEvKDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480750;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L5dNhoel+5N3v2PRslzo0AiRLixBSTJMpdtJV2H55jM=;
	b=krDm6qjAGKE7im9Prjq686ledQWQ1l/qyhhdsOPolk+YTPVPgVt0J8VFo+ZSSEGu/JJM
	 KJ2nGtkQqfS2yGrAYkHSfwmtptnJI77kA/zDSqYELdZsUnTyWSF/tNkOoI/dVOq3kewhl
	 btonfkMbreJs8dXoGsNuYo5nUg2uUgXEetADdLmjDqfIATv1rGxo7d7UGl/NcJgJXn+kg
	 AZzDphwosH1jmvGcD/wu0aRWNKOA5r1Cc2x4v+C1KTw1LNBaV+9DSRlajOqZDvGW159Kw
	 kZwAedGsfXSqhk2PwRXzlslWrBicwHFJbxmVxhMRxDtQleN+bkhlTnSrO1qTGi7Q7hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bijGsJR3;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81189606A333
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81189606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bijGsJR3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795480749; x=1827016749;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=aSExY6XUYC0oEPjDcj/taKCl3VRcUT5EAxgzrFJNEf4=;
  b=bijGsJR39bIbynWwcBGItva8dW9OTZwO8ne9iyaquLoEWMai58VhJN2L
   XzQRuMaz72VV0qQS6JslhUquIqrLSYXOSJUhGDhDa3ano4vYjMdySpG8z
   qzpmjG/iZlIwwAWpI8UwAYogBfuSVosWsPOku+SnMKC4D77TyLJEyh84f
   oLsbPBmxNrd5hL2lEJBReDZVezSvfMRtORgotNcCw8jWsllU5AIEHEcTe
   3YAq/DqaiS6q6gyRvSUijTs47f164STQ9vnMftK2ySoh0espW60vH5Is9
   qFXLyB2Xb6jm1KuSz0B/vYp+u7ya1AoELTTNe28cVqmwa8Ios4JuQym65
   Q==;
X-CSE-ConnectionGUID: f9VN5MunQ/KKd9D1XiHVCA==
X-CSE-MsgGUID: CqEza2LmQEWNpmoFHUEo5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4332857"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4332857"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:05 -0800
X-CSE-ConnectionGUID: Q3aZIZ3gSe20e/1sLrg2gw==
X-CSE-MsgGUID: qGWMvlz1TbSxtd66RR3ufQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11805752"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:06 -0800
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
Subject: [PATCH v22 08/19] drm/xe/vsec: Support possible hotplug exit
Date: Mon, 23 Nov 2026 16:39:04 -0800
Message-ID: <20261124003856.4145635-29-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
References: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
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

