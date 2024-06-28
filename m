Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B261C2314
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Jun 2024 15:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587434; cv=none; b=W6uNtRc7jVTbrEuOexJcx9OtBYz2G/drjwjBxvjpeUCnfA/AAPDTYPrULCAisqZZJEkdvVR1C2LTFIqyrvx5AE7ifupEobQSYy4j1Bngj6amb8LY0LzaFdSzNld7LlAtb/TTdNvVyCyUXddve5f0UEg7q55TtQAaPmvo3xWF/lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587434; c=relaxed/simple;
	bh=x81i09PBMcVOiSOP9NKPVAuNFzM/iEpE5ATlbAX2gTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tdvo2jdklYTF1+lIAX1gLjLiClGQF0gPpBX4NgSybpxN4SVAA9szTEeZLXe91ejKsTAWtIBlXFrKhZ4onxZsCAKxI/cJQyqNfLPW57bZxvrqlqCmWUop+8pIxRJDo2p3+T1v/f2HD8uH969ZcXjhaZumk8oxL0Ew5ZGmVgtfuZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pakf9JhW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pakf9JhW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719587432; x=1751123432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x81i09PBMcVOiSOP9NKPVAuNFzM/iEpE5ATlbAX2gTE=;
  b=Pakf9JhWdi2HuZmcWC1eK6QGEXs5GlCtGY1XLbuOyZSy5bjY6cjOrYec
   DYGU1SVnz3lA+5IKUl9CPEQdcppH9bN1s1CX/CJUuFtaY8TLl55iZ3Msk
   R8L27vl4v+X2GgyLHU3zyEeBW6H0KLj0pU2ZrEGgYU6ToT++rie06ycSB
   F+/Cp6Q6in6bEIqo6gl6+3uH2TBntGoRfTtnpgqMbRgIfQWn4B6Nt6+eD
   nRH5Ofm+GHHM2rfk6LpEn4SLxup9c+r2UUOfuNmiElMGcZKvy3l5SauFa
   BeyRMGayhCMVMIegRgSkx8cDV/3ZeSEIjkbdaNolFq8MpGGk456x21oQz
   A==;
X-CSE-ConnectionGUID: JNyVvLcMQryT2N2Fu9wYOg==
X-CSE-MsgGUID: GzN1h71SRVGJJZgHnrhj8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27460840"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="27460840"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:10:31 -0700
X-CSE-ConnectionGUID: BtPmuanvRjmI3HSsuWatxA==
X-CSE-MsgGUID: nQMLXGdNSme9edyBvdhGRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44848118"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:10:30 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v4 1/6] platform/x86/intel/vsec.h: Move to include/linux
Date: Fri, 28 Jun 2024 11:09:39 -0400
Message-ID: <20240628150945.3363575-2-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240628150945.3363575-1-michael.j.ruhl@intel.com>
References: <20240628150945.3363575-1-michael.j.ruhl@intel.com>
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
index cd970e09de1b..7bd3b7acd0e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11420,6 +11420,7 @@ INTEL VENDOR SPECIFIC EXTENDED CAPABILITIES DRIVER
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

