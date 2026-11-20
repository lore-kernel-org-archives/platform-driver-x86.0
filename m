Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141185;
	b=Gu7uVE2uKgeT8YbIv7f8wsr5l3JOYPoQ5lnUn7aqbDEf4PsNP2y2FbCdNPDnf4iv6ybs
	 WXgM9BKEleRQYGSLxFg342LEIJWVaMnLyNiE66WfNvxRoDhGeqg5ZFoueQ374vbCwfMcj
	 BUuPd/evva/4AP0yifMAYceSHzkJZY8GPu2/GuRzBUQs+P4g43tC73F+uOCU3lztt21/p
	 x+NELQmmLe+jem26aRneebLkZ1J6+h3MX8dSVHy8Xgvdl36aX6E58u3dzyxJP9/EjsoJz
	 8SIbAfAEfyjygF89h7rMIKGokQsVBJN21oT/g1AVsf6RY2nQrndOvmPAJ3OO9JD7hBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141185;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yzmrwzYS7dV3aOhrOjjG4hDT4PSPUDedyuRpM8nsd8o=;
	b=232/j/CSofWpWNbSjOOI4Em82gl9YqdxoxYhx5vtBjNVc6/uvKdxuksNdd+5PkyPcIju
	 IsBSxvl9GykiO91G3KVOSjawh5zNqZeZh37LBy51bdDoFeGE5ZCK8M878P06TUaUgH3zv
	 e6Ln4AGK3n6FeheUFF6H4Zxp4pVL7hUQNiJC/1DuIzLqpia9zzHPm7NvAXtoLKaKQMW1y
	 ysKjIlDEO2kZUppdCDdXBG5h5x/WCJ8B+jD6aMrsAB4eTiv+xoAbCm49j8y0M07u5jZS5
	 k10uIK4gTLkLqu9O9ss0dTvLqgbFQR0qvMm2/7lMnCtNMIz1L8QhxTtMbU+exmn850Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q16IyquR;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D7D606A330
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 02:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3D7D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q16IyquR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795141185; x=1826677185;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=prgSxi1FX+nYoYm0BCX8xny5QzKp079AhJ6Rq9zOB9k=;
  b=Q16IyquRtLQIeRTUc2aifgGTP9L2JTUr3vKwg4Dz/ARdRLJ8HO9Q0Mtz
   AhVHkj6oHaQNT0YSiw8vr+LbVhdo2aXM5Ljx2Kj7klCnLjqK3EIhzqx7l
   NK3VW/46v2X3bS93nxcIKV1AyT7JvFopA/HEfqN/31HB+L0sRgSYq0N7A
   5uNjphFeB6Aub8mXq10xKc5dP8vEATReetz6Csq2D2f+jDAvOD65LTQLU
   8DqhOtBxmXLfcF3Gf0eFUL+qORgTY0P5rbViryZ8Z3bfa6PNt4zooe/nD
   ZdH0BzKHqsFtKIQYHlD00OxIcXzR02h5mIjRfXWORZnUp9TVLP+EqbsSX
   w==;
X-CSE-ConnectionGUID: +n8fp7C6StiB4egtIPPiTw==
X-CSE-MsgGUID: 8/F4EzjSQhm7Y06jIokl4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3898400"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3898400"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:43 -0800
X-CSE-ConnectionGUID: R3WVWrprSXG9HO6EBcz1ig==
X-CSE-MsgGUID: X19bZr1eT9eSuAeW4Q8KKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10487100"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:43 -0800
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
Subject: [PATCH v20 03/19] drm/xe/vsec: VSEC requires soc-remapper
Date: Thu, 19 Nov 2026 18:19:33 -0800
Message-ID: <20261120021929.473553-24-michael.j.ruhl@intel.com>
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

Survivability mode includes xe_vsec_init().  VSEC requires
the soc remapper to be initialized.

Add the correct init to allow correct VSEC behavior.

Fixes: 32eab46a6160 ("drm/xe/soc_remapper: Use SoC remapper helper from VSEC code")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 91a0680e449b..10f9de4eb03b 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -21,6 +21,7 @@
 #include "xe_nvm.h"
 #include "xe_pcode_api.h"
 #include "xe_printk.h"
+#include "xe_soc_remapper.h"
 #include "xe_vsec.h"
 #include "xe_wedge.h"
 
@@ -354,6 +355,7 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
 
 	xe_heci_gsc_init(xe);
 
+	xe_soc_remapper_init(xe);
 	xe_vsec_init(xe);
 
 	if (survivability->fdo_mode) {
-- 
2.43.0

