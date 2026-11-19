Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103697;
	b=Az2bKFfRhqhGOBAveoU7lS6rs2Gj/KRNcw8XrJKVpKB9pooZ2LTl9C0lRaFteJ+cn7ND
	 LAAlitz97tLsiTUEg3SEQo2av4J3vh4jK6dzeW6tdIsEr6zpqxz69r/S4DXtZcNGeeawd
	 i5Vt56qtuBawjfOshhVdP/nNR86zxoFexPGRtrrJfC20MvG/m6WAOk9tkV2I0SpPsjcLj
	 oiwILTVt6JDPjP5cBbFvl0xhjFjNJbyYpRti8azwUtIExuqtp5U70srx9Km+Mih6LNrQ8
	 Jnb27210GE5hPntlVBAadS+1G0vAwqAyIdhU0veOz1z+Z5LR0dlfAvt6x2sKm8ESuaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103697;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L5dNhoel+5N3v2PRslzo0AiRLixBSTJMpdtJV2H55jM=;
	b=KWEUoF5sn1W1xQNhRMGUbQ36CHrKV1ARIelOMulpv7tFbg+Cau7Ngej8+KE7VZ7N5xno
	 Ss7sT7Zu+uVoIquwnc9CDHStLBYbUicZE70+JYKM+Z7Ejz/iKPxAfVFtc7Dc3BaALeuZ7
	 ZwZXfGbyEqpwOiRjNh844dZeYvUmWUSiMULvuhuxTXrxHB4oU7MqF2Dsig5PkSlv0PTei
	 11vwGfZ0NpOp6yhYZEGozJKY2F6r+6EeqjpB3UBYI9OM05yaTvy9WWYfV8T1Z7P2InUf5
	 HurWYPJ2q7ULFF0ckEW1fHX92f+KJUbsHabCT3LLno3qZpUyFteY6DCWktScM+/uXMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FCLufhrt;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2656606A325
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 15:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2656606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FCLufhrt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795103697; x=1826639697;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=aSExY6XUYC0oEPjDcj/taKCl3VRcUT5EAxgzrFJNEf4=;
  b=FCLufhrt8muWPD27HTSyfjNWjS1mGXVAa0GC+48YAqirg9GRx+40BF5g
   iiyHnPZX29SmtyL8Eyjv175p5xS7E937DJTIZBIqZK7xH/s/WwcQBRigz
   u1y6dkDuoLGltoVqyeM2b/9j4X7FvAt39D0OQJrV3VqBvuRq2dcOcwuhx
   w287dNOI+VJMeflh0v6pAFXEBc3Uc2UzM6LKOl+YdAI7B/Q9KXFluOlnU
   E58Xuc4vwIfLKMu9aWm3BCgH8K807vCDl8ZWFqZxUbDLe6JJxF/2tGo3V
   shqabWuhAhaXaM/uNPOoK/n4YvxyFM20rWNJDDqZ2zXLmVqTexQmFWH68
   Q==;
X-CSE-ConnectionGUID: xlrvcFdrRsGMVgNodYaRXg==
X-CSE-MsgGUID: tU/1PUdpSuSOYohpzyK1ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3848980"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3848980"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:53 -0800
X-CSE-ConnectionGUID: PhYcTxIdR6uqqT674XKpIw==
X-CSE-MsgGUID: LdlGkyKVQ6i7x9w5HD/Ujg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10263404"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:52 -0800
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
Subject: [PATCH v19 08/19] drm/xe/vsec: Support possible hotplug exit
Date: Thu, 19 Nov 2026 07:54:46 -0800
Message-ID: <20261119155438.40762-29-michael.j.ruhl@intel.com>
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

