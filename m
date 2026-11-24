Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486086;
	b=tQnilbG9a1PUL6Ky4KbaUDLwfq57IsF7nXKGKTd/CUgZJKdUFDPSfS+vMZRRbdLM4JIF
	 zZGJe+CDsBYILlQa2r/ntsRy2WOFjVCMfujuBSXOUugyBmU4YM6sjzZmFBs9sVn7ppJAz
	 NHb7QI8nC91sm3HArQJ42RaczMYBKOWL/SZugVxE1z3CXdRoqyBz1otV28L5epvNtlph1
	 bIpdFQ+CKfmUjhz/Vjtm+4QLKvBaHKs1CnpYSnKoglZIsQGdMajgHQI/tijVKKAIZv4RA
	 wN87PR/pbBlyBDWkfxSr4lNCfLVwWuit5F9udDxgcc89GMNX4pdB8DOnhtwbki8NzTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486086;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L5dNhoel+5N3v2PRslzo0AiRLixBSTJMpdtJV2H55jM=;
	b=rYZMbUVuQhmwau7sdnEpFFDDuk6SKJbbvqDsm/bxxirpS4gAJk+sWGhKYY/CGSvnfHdL
	 ew37VkZAqwvKJU/p5udo0cvADNYxtzEIX6m/P34NGevHo8tSObbHxXZnkhqhvlAxloBnZ
	 kQ6j1cT3Ea2VB543VgPZhqA7wUTr5P1p9zwkS7aScjLAmV9AblsTylHCZ1HhIK+mBOHRb
	 kRH/MSZaDOymzBfJvCovtb0lDXd1yEma/46j3Xv7sHbDOk/ZUUIGOLA2vqSbnfHdl7nLH
	 4fZcv4R/JBOadlD3zZcxvZp1C8hfXTrUKJoyAqNTB9nJGW1DXSL3QDP24wK9wZZX0eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="gqWyNX/e";
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02C3606A333
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 02:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E02C3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gqWyNX/e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795486087; x=1827022087;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=aSExY6XUYC0oEPjDcj/taKCl3VRcUT5EAxgzrFJNEf4=;
  b=gqWyNX/e7gM8hCg5WYMUFt0JqUXaU5X4rrsKmf740rMC7pCNQAP3LEg4
   Se1W/2xvq+2Slof+IbNFK69nFNGnzPIHBtBbjfJW9cwriiF5fno/cFmyA
   l6s2NFMiVBA9nEr5RZqqlblNhlnXccTs7mjQ9bDh8oOPjHNHJHTTRYWT8
   1haEYkrAI2rF0DXlPi2RLc8LtW0dkidqNLNyG+q3HnuzaYeUQwnHctU+G
   ZTUQBiudHvS+r7K0X36qY9rDetQ6zJjmM8OtmdJIy7b8Xpjq08hFGPUei
   Fxhx5NaMMGSNqEohbop1zPWSCVfELhGfiZ8Zqt/ZggFnwXRqayv2+0jIu
   w==;
X-CSE-ConnectionGUID: oOACxzIXQSqPmIY2gfwNGA==
X-CSE-MsgGUID: fhPX76hGSteinuWlXDbYBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4153519"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4153519"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:03 -0800
X-CSE-ConnectionGUID: aCf2peKySUqCIYfP+4DC3g==
X-CSE-MsgGUID: /nJ85rSqQCOslXpA9KU4Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11621427"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:01 -0800
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
Subject: [PATCH v23 08/19] drm/xe/vsec: Support possible hotplug exit
Date: Mon, 23 Nov 2026 18:08:00 -0800
Message-ID: <20261124020752.30551-29-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124020752.30551-21-michael.j.ruhl@intel.com>
References: <20261124020752.30551-21-michael.j.ruhl@intel.com>
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

