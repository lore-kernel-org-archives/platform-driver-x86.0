Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C82A197A7E
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jul 2024 19:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720639383; cv=none; b=PKM4d/wdcQLN1tT/H5mvZhivDdjuYmkMhtW5SMT40Nj6gK8nboABw7N2oVBr/0dNn4kTkpy4nvMRJYKJLbJ6vCb3DRwbeqS31hDSjXqRKJD2FTjrKuFgfL8ZHQ7XRFnrzelPo2juEvbvMhPekXKyPHYnykuSRqIXXKoxI+cBwDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720639383; c=relaxed/simple;
	bh=vQMlu2JX7aBOg755rKRCgbFQKIcIXoIZ5bVE9/qNpos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8tptN1DeYAe92Agg2wJI9P+3cTauvmVZlbOBL4cmAD4INOs4cikeSVj1WToLUXwPywqnZDGWHx3iZ5qPc5rFUcziPnaeqTerMCW+KcApaI670OS5vtlKBe7IJnsTXFbO4KV+O5qEgleszXHzakZXDmxy9795SeObX+rsQw6LDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfv5F2us; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfv5F2us"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720639381; x=1752175381;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vQMlu2JX7aBOg755rKRCgbFQKIcIXoIZ5bVE9/qNpos=;
  b=jfv5F2usT0wAF+XpyT5wv9njdGz1y2lpazQ5jnL6MyLR9fzlFTwKFTN8
   8GLK4x2W8bMzcdTP9PAypSyvqKWfdD7Z9FgEbaJ/gwClZf8kQf4GZNH2d
   +0+EScKvbfCb7F7re+4WRFT32184l3AHsptygPmCtg9KepZUdghFU1gI+
   XQls5cMotyb2sZFpr2QgGYNoKxiX23BJcycDAYbMi8xIHyvCcpfjQ6bcM
   vkGFsiCUfn71UD4HIBg5DvJRGdqUe1osP9XUhClb5Q2gAXdPquEEtsTZG
   r6R3hFAKVGrdHhNcSBJ61ucVOi1CRjgY99Rm2rW0f5hVlGU0PClNWH4XW
   Q==;
X-CSE-ConnectionGUID: 4fMvmi+zQFWKu2YHKUOBrg==
X-CSE-MsgGUID: NuDvqPnBQPSc5VAG7XS/Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17856442"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="17856442"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 12:23:00 -0700
X-CSE-ConnectionGUID: f7AWA+9eSyuniKMgNWA8cw==
X-CSE-MsgGUID: xanat6NjTfG6+PBCkdqxFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="53483004"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 12:23:00 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v6 1/6] platform/x86/intel/vsec.h: Move to include/linux
Date: Wed, 10 Jul 2024 15:22:42 -0400
Message-ID: <20240710192249.3915396-2-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240710192249.3915396-1-michael.j.ruhl@intel.com>
References: <20240710192249.3915396-1-michael.j.ruhl@intel.com>
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

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 MAINTAINERS                                   |  1 +
 drivers/platform/x86/intel/pmc/core_ssram.c   |  2 +-
 drivers/platform/x86/intel/pmt/class.c        |  2 +-
 drivers/platform/x86/intel/pmt/class.h        |  2 +-
 drivers/platform/x86/intel/pmt/crashlog.c     |  2 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  2 +-
 drivers/platform/x86/intel/sdsi.c             |  3 +-
 drivers/platform/x86/intel/tpmi.c             |  3 +-
 drivers/platform/x86/intel/vsec.c             |  7 ++--
 .../vsec.h => include/linux/intel_vsec.h      | 32 +++++++++++++++++--
 10 files changed, 40 insertions(+), 16 deletions(-)
 rename drivers/platform/x86/intel/vsec.h => include/linux/intel_vsec.h (71%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 782fb49059e7..832ab1a0011e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11426,6 +11426,7 @@ INTEL VENDOR SPECIFIC EXTENDED CAPABILITIES DRIVER
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
similarity index 71%
rename from drivers/platform/x86/intel/vsec.h
rename to include/linux/intel_vsec.h
index e23e76129691..1a287541a2f9 100644
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
@@ -67,7 +67,14 @@ enum intel_vsec_quirks {
 	VSEC_QUIRK_EARLY_HW     = BIT(4),
 };
 
-/* Platform specific data */
+/**
+ * struct intel_vsec_platform_info - Platform specific data
+ * @parent:    parent device in the auxbus chain
+ * @headers:   list of headers to define the PMT client devices to create
+ * @caps:      bitmask of PMT capabilities for the given headers
+ * @quirks:    bitmask of VSEC device quirks
+ * @base_addr: allow a base address to be specified (rather than derived)
+ */
 struct intel_vsec_platform_info {
 	struct device *parent;
 	struct intel_vsec_header **headers;
@@ -76,6 +83,18 @@ struct intel_vsec_platform_info {
 	u64 base_addr;
 };
 
+/**
+ * struct intel_sec_device - Auxbus specific device information
+ * @auxdev:        auxbus device struct for auxbus access
+ * @pcidev:        pci device associated with the device
+ * @resource:      any resources shared by the parent
+ * @ida:           id reference
+ * @num_resources: number of resources
+ * @id:            xarrray id
+ * @priv_data:     any private data needed
+ * @quirks:        specified quirks
+ * @base_addr:     base address of entries (if specified)
+ */
 struct intel_vsec_device {
 	struct auxiliary_device auxdev;
 	struct pci_dev *pcidev;
@@ -103,6 +122,13 @@ static inline struct intel_vsec_device *auxdev_to_ivdev(struct auxiliary_device
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

