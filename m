Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F71357D0F;
	Tue, 18 Aug 2026 20:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787085286; cv=none; b=CFH2iDATeirz4VeuQiQHON/ohualcNbyJe3bkO3iT+o1N6zhx+gvYc60eCOsGjBo4V08N0q0JzCVYK6qfTMglpgcq6PeA0EEy04ZLThEvG95ypfiutIbs2/hrf5wCsYPMPAfrEMFXG3WIxnyQ36YYj02eybWch4qbRnFpI/zeJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787085286; c=relaxed/simple;
	bh=pMaRx8yt07algRWha/aGPfmt1+i0bEg56U60UsXPoPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h2iCzicDZCV1OfI106Ye2Ok+gIiabvAGaXrSypDMgyc203s7bq14uHbR5j0Lx3nTQ0zLB2dNS5rEEJXmetFgqtAW+RreVIyuwDGwfbDekY1/cuYNlmGtdOAKKb4/L0Jboa1UkaWfGa87ayI29G4MzKmDoKZvGXxO/Y/+TKmKr3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2d8kG+m; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2d8kG+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787085283; x=1818621283;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pMaRx8yt07algRWha/aGPfmt1+i0bEg56U60UsXPoPo=;
  b=H2d8kG+m5n57IA4hgOTbYWWTCE9/FOVGsd80V9QnXzHiRNgCyUqAO0A9
   DNTqZAnI0ZCJKrTIO+SrRPTx/jyhwD2jUZSsg1e6LyWd86KFbdGgbbnqX
   iRD6WNOw+MnfRIqScXJnJwIZ40M96LQOQl2E1dI19rMSMt6IKUBs+Rl5g
   yAA0kubbRMZGU8LmPJ7eYuCK0AaqOIVzMr97OOApDja7OXZOpkgBe59KJ
   B3+QLdD3NAPP4pb9dSHFPK3qxrcrmZGicTaT1KCpsRvkxsu6tonEqQftW
   dbrK+zsf0T1C7PqxPNYZ1Dkr+pwUf2ecqLka+xeqwHIuCI+OFHYGbrlK2
   w==;
X-CSE-ConnectionGUID: yNwRQnu4S8mSV41lJ2NiSg==
X-CSE-MsgGUID: r3A22fiGQUqTMrgNKpMQeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87610131"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87610131"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 13:34:43 -0700
X-CSE-ConnectionGUID: bssNM6ahTMSUMSj3SlSZBg==
X-CSE-MsgGUID: dJrI6cmgRr2kuz14LNd38g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="269166526"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by orviesa004.jf.intel.com with ESMTP; 18 Aug 2026 13:34:43 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2] platform/x86: ISST: Avoid model check for recent servers
Date: Tue, 18 Aug 2026 13:34:27 -0700
Message-ID: <20260818203427.2738209-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To enable SST functions, a CPU model entry is required. This causes
unnecessary delays in deploying new servers on older kernels.

To avoid this, if no CPU model match is found, allow the SST common
driver to load, when all of the following conditions are met:

- Not running as a guest.
- The platform is identified as a server via ACPI PM profile.
- The CPU belongs to the Intel family 19 (decimal), which starts with
Diamond Rapids. All recent servers are capable of enumerating SST
features.
- MSR_PM_LOGICAL_ID (0x54) is present to retrieve the PM logical ID.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
Change log:
v2
Addressed Sashiko review comments
- Fix commit description for family and MSR 0x54
- Add isst prefix for isst_acpi_pm_profile_server()
- Add isst prefix to allowed_families definition
- Removed local data for id and ret


 .../intel/speed_select_if/isst_if_common.c    | 57 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
index 1c48bf6d5457..4c04f0bc9b47 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
@@ -7,6 +7,7 @@
  * Author: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/cpufeature.h>
 #include <linux/cpuhotplug.h>
 #include <linux/fs.h>
@@ -774,6 +775,54 @@ void isst_if_cdev_unregister(int device_type)
 }
 EXPORT_SYMBOL_GPL(isst_if_cdev_unregister);
 
+#ifdef CONFIG_ACPI
+
+static bool isst_acpi_pm_profile_server(void)
+{
+	if (acpi_gbl_FADT.preferred_profile == PM_ENTERPRISE_SERVER ||
+	    acpi_gbl_FADT.preferred_profile == PM_PERFORMANCE_SERVER)
+		return true;
+
+	return false;
+}
+
+#else
+
+static bool isst_acpi_pm_profile_server(void)
+{
+	return false;
+}
+
+#endif
+
+static const struct x86_cpu_id isst_allowed_families[] = {
+	X86_MATCH_VENDOR_FAM(INTEL, 19, NULL),
+	{}
+};
+
+static bool isst_features_allowed(void)
+{
+	u64 data;
+
+	/* For hypervisors, explicit model addition is required */
+	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
+		return false;
+
+	/* SST is a server only feature */
+	if (!isst_acpi_pm_profile_server())
+		return false;
+
+	/*
+	 * Family 19 and the checks above guarantee the SST enumeration
+	 * interfaces are present
+	 */
+	if (!x86_match_cpu(isst_allowed_families))
+		return false;
+
+	/* MSR_PM_LOGICAL_ID is required to get PM logical CPU ID */
+	return !rdmsrq_safe(MSR_PM_LOGICAL_ID, &data);
+}
+
 #define SST_HPM_SUPPORTED	0x01
 #define SST_MBOX_SUPPORTED	0x02
 
@@ -798,8 +847,13 @@ static int __init isst_if_common_init(void)
 	const struct x86_cpu_id *id;
 
 	id = x86_match_cpu(isst_cpu_ids);
-	if (!id)
+	if (!id) {
+		if (isst_features_allowed()) {
+			isst_hpm_support = true;
+			goto misc_reg;
+		}
 		return -ENODEV;
+	}
 
 	if (id->driver_data == SST_HPM_SUPPORTED) {
 		isst_hpm_support = true;
@@ -812,6 +866,7 @@ static int __init isst_if_common_init(void)
 			return -ENODEV;
 	}
 
+misc_reg:
 	return isst_misc_reg();
 }
 module_init(isst_if_common_init)
-- 
2.54.0

