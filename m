Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A5642AA0
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Jun 2024 21:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718918473; cv=none; b=NqEFnDhoVs36zgyITTYSKMQL2PEenZCpyDc7Wzi9CihgCf0lkDIENW1f5Uw1HNSXIu4UHY1AJsSyRx5C4RoPVtIwZaUmxz7+MXAPsAQAwp6TtqeWYosPjp8+QvDBL11db0P11JW31WtK4qVqbWDDiTGXCrakDQDFrMiCj/whjOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718918473; c=relaxed/simple;
	bh=5bN6GDW+jIUWREsZGg3CxhpxdC0DWE0q3FMsuWgUuHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bTp5/ZHL1yv8uE+Ae8MxhnD62/Nn9DnQ0znTJ3x+JpSEodFkkyTODY0L7HJIs7hRmEloi9DsHJXgDB2hGObqMCSK/wRidtH43GEavNwXLVnrxGnQ8vrb0PymvoLPpXfG9/20IKYwY4rpCmafBlH3bm7mGeDyhhgQcs2T6zSjkbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcFabWxI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcFabWxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718918472; x=1750454472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5bN6GDW+jIUWREsZGg3CxhpxdC0DWE0q3FMsuWgUuHk=;
  b=LcFabWxIKWlWUNKcWyZ/pnI3U5B+IQlTfZXoPRA2RJn4Ku4fYbesxdYC
   aFpSUxMJ9Jk34cJ5ANZytSKXwCUDxgSD5dggenTVBe/vDl/w/KuPPkR9Y
   c+iPSJdXlK46QUQ6ZeavBY07E/lK9hEwk0Hfcesl7PwDz65s2R/ZQ0mOY
   es4BdAGrVr+mLpg9r3TQKI1L3t27UbXnLpXRHRhnX26OlGvMgVKmGcWjV
   vESfHt5T0RpZUg/E/KL9r55Wo6NNXFeZ4WJTBqn3grmV/qz9RNYrID5+P
   FqpC0zhYpeL/FOZonw1MnnKe01rZxf/eG0OyjIerx8EWSX1eDUHwizhEQ
   Q==;
X-CSE-ConnectionGUID: GEhRBH6TSlODN+U55UiL0Q==
X-CSE-MsgGUID: Wkre7xtYRUKCUgK5p7xDyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19811214"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="19811214"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 14:21:11 -0700
X-CSE-ConnectionGUID: yl3bNE3NQ6mnKMukQw7fAw==
X-CSE-MsgGUID: YinZY4reRmKC25Wi9uxW3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="79883662"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 14:21:10 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	pavel.e.popov@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v2 1/6] platform/x86/intel/vsec.h: Move to include/linux
Date: Thu, 20 Jun 2024 17:20:45 -0400
Message-ID: <20240620212055.3314064-2-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240620212055.3314064-1-michael.j.ruhl@intel.com>
References: <20240620212055.3314064-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "David E. Box" <david.e.box@linux.intel.com>

Some drivers outside of PDX86 need access to the vsec header. Move it to
include/linux to make it easier to include.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 MAINTAINERS                                           |  1 +
 drivers/platform/x86/intel/pmc/core_ssram.c           |  2 +-
 drivers/platform/x86/intel/pmt/class.c                |  2 +-
 drivers/platform/x86/intel/pmt/class.h                |  2 +-
 drivers/platform/x86/intel/pmt/crashlog.c             |  2 +-
 drivers/platform/x86/intel/pmt/telemetry.c            |  2 +-
 drivers/platform/x86/intel/sdsi.c                     |  3 +--
 drivers/platform/x86/intel/tpmi.c                     |  3 +--
 drivers/platform/x86/intel/vsec.c                     |  7 +++----
 .../x86/intel/vsec.h => include/linux/intel_vsec.h    | 11 +++++++++--
 10 files changed, 20 insertions(+), 15 deletions(-)
 rename drivers/platform/x86/intel/vsec.h => include/linux/intel_vsec.h (92%)

diff --git a/MAINTAINERS b/MAINTAINERS
index d0738dd0a625..693bb4ac14a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11413,6 +11413,7 @@ INTEL VENDOR SPECIFIC EXTENDED CAPABILITIES DRIVER
 M:	David E. Box <david.e.box@linux.intel.com>
 S:	Supported
 F:	drivers/platform/x86/intel/vsec.*
+F:	include/linux/intel_vsec.h
 
 INTEL VIRTUAL BUTTON DRIVER
 M:	AceLan Kao <acelan.kao@canonical.com>
diff --git a/drivers/platform/x86/intel/pmc/core_ssram.c b/drivers/platform/x86/intel/pmc/core_ssram.c
index 1bde86c54eb9..baddaaec25ee 100644
--- a/drivers/platform/x86/intel/pmc/core_ssram.c
+++ b/drivers/platform/x86/intel/pmc/core_ssram.c
@@ -9,11 +9,11 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/intel_vsec.h>
 #include <linux/pci.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 
 #include "core.h"
-#include "../vsec.h"
 #include "../pmt/telemetry.h"
 
 #define SSRAM_HDR_SIZE		0x100
diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 4b53940a64e2..d7939b28e937 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -9,12 +9,12 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/intel_vsec.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/pci.h>
 
-#include "../vsec.h"
 #include "class.h"
 
 #define PMT_XA_START		1
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index d23c63b73ab7..d6f9ccaf28c8 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -2,13 +2,13 @@
 #ifndef _INTEL_PMT_CLASS_H
 #define _INTEL_PMT_CLASS_H
 
+#include <linux/intel_vsec.h>
 #include <linux/xarray.h>
 #include <linux/types.h>
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/io.h>
 
-#include "../vsec.h"
 #include "telemetry.h"
 
 /* PMT access types */
diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 4014c02cafdb..9079d5dffc03 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/intel_vsec.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -16,7 +17,6 @@
 #include <linux/uaccess.h>
 #include <linux/overflow.h>
 
-#include "../vsec.h"
 #include "class.h"
 
 /* Crashlog discovery header types */
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index 09258564dfc4..3478f891ea0b 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/intel_vsec.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -16,7 +17,6 @@
 #include <linux/uaccess.h>
 #include <linux/overflow.h>
 
-#include "../vsec.h"
 #include "class.h"
 
 #define TELEM_SIZE_OFFSET	0x0
diff --git a/drivers/platform/x86/intel/sdsi.c b/drivers/platform/x86/intel/sdsi.c
index 277e4f4b20ac..9d137621f0e6 100644
--- a/drivers/platform/x86/intel/sdsi.c
+++ b/drivers/platform/x86/intel/sdsi.c
@@ -12,6 +12,7 @@
 #include <linux/bits.h>
 #include <linux/bitfield.h>
 #include <linux/device.h>
+#include <linux/intel_vsec.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -22,8 +23,6 @@
 #include <linux/types.h>
 #include <linux/uaccess.h>
 
-#include "vsec.h"
-
 #define ACCESS_TYPE_BARID		2
 #define ACCESS_TYPE_LOCAL		3
 
diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
index 6c0cbccd80bb..b9fa1cbfdcf7 100644
--- a/drivers/platform/x86/intel/tpmi.c
+++ b/drivers/platform/x86/intel/tpmi.c
@@ -51,6 +51,7 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/intel_tpmi.h>
+#include <linux/intel_vsec.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -59,8 +60,6 @@
 #include <linux/sizes.h>
 #include <linux/string_helpers.h>
 
-#include "vsec.h"
-
 /**
  * struct intel_tpmi_pfs_entry - TPMI PM Feature Structure (PFS) entry
  * @tpmi_id:	TPMI feature identifier (what the feature is and its data format).
diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 0fdfaf3a4f5c..2b46807f868b 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -17,14 +17,13 @@
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
-#include <linux/kernel.h>
 #include <linux/idr.h>
+#include <linux/intel_vsec.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/types.h>
 
-#include "vsec.h"
-
 #define PMT_XA_START			0
 #define PMT_XA_MAX			INT_MAX
 #define PMT_XA_LIMIT			XA_LIMIT(PMT_XA_START, PMT_XA_MAX)
@@ -341,7 +340,7 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
 void intel_vsec_register(struct pci_dev *pdev,
 			 struct intel_vsec_platform_info *info)
 {
-	if (!pdev || !info)
+	if (!pdev || !info || !info->headers)
 		return;
 
 	intel_vsec_walk_header(pdev, info);
diff --git a/drivers/platform/x86/intel/vsec.h b/include/linux/intel_vsec.h
similarity index 92%
rename from drivers/platform/x86/intel/vsec.h
rename to include/linux/intel_vsec.h
index e23e76129691..ff7998cadab4 100644
--- a/drivers/platform/x86/intel/vsec.h
+++ b/include/linux/intel_vsec.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _VSEC_H
-#define _VSEC_H
+#ifndef _INTEL_VSEC_H
+#define _INTEL_VSEC_H
 
 #include <linux/auxiliary_bus.h>
 #include <linux/bits.h>
@@ -103,6 +103,13 @@ static inline struct intel_vsec_device *auxdev_to_ivdev(struct auxiliary_device
 	return container_of(auxdev, struct intel_vsec_device, auxdev);
 }
 
+#if IS_ENABLED(CONFIG_INTEL_VSEC)
 void intel_vsec_register(struct pci_dev *pdev,
 			 struct intel_vsec_platform_info *info);
+#else
+static inline void intel_vsec_register(struct pci_dev *pdev,
+				       struct intel_vsec_platform_info *info)
+{
+}
+#endif
 #endif
-- 
2.44.0

