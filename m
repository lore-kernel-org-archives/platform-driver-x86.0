Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B074119F7;
	Wed, 29 Jul 2026 18:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785348320; cv=none; b=uMq45vjA1HqAU9qt6B03u2bW9IZtSw6Ni+J3LcDTsaRiD+1kuX7ffNfD9W2KT7jqzV8hoGfcetyIOPZDCQ6n+NwiRV90d7KMcyG+3IM1Znokokv8pl53zotnAiL7AuHD7K2NLtZW5JxK9jwgBjamhD/L/+dSiUaqm3RmjcBUGtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785348320; c=relaxed/simple;
	bh=ji/VdwiV5MB56OWUOmLFJCBZFqZZSOWA0p2ret/jjUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LGbA7g2r7aJUXKOpX+cwnbXVS/nuebQZzCSfs4jYcVXzhKcOcYEC20f6kvikRod5U/G0riMEXaZD3JihoMdEE86vjcbckJUfc7O3iS3eRb7Pi46gPtt6RoemPAG4iUqjdbcC1ojUkRgvOsbzMCWLEmJyJN78bDLEts6DUSPDjyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4rMHHPt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4rMHHPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785348316; x=1816884316;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ji/VdwiV5MB56OWUOmLFJCBZFqZZSOWA0p2ret/jjUM=;
  b=N4rMHHPtt1ynMHSiQER7kXrCpO30Nnm7+uIqwju8Y3rqU6k952VJduqp
   gJiBqCOL88hfbCaprppKxanPne3qZ1g1JTujSnhYW8JVU7L6k/NfvKKgE
   Y9ofHK2BLg64zwbIeyuAK89JfQx43vMfKQIFotjQ02rWp9n8DUwi59MDU
   3b2Dr+/s4LcJx7nwC2SLVbRebrTAqsDMaG28mijX4+98H4TFnJFZg6J0K
   FMrIYv21M3mxQftLISh3TPVLJGCQ4J3GO9mjoB1qsqiPsxe/zeSx5xg0g
   ngShpQuVju1Fbo2HsnK+SrM1nSEikXPY3aYh5jIbbFbi8JQ709wH88tiP
   A==;
X-CSE-ConnectionGUID: de1un0TlTfCCOq7IZP8ORQ==
X-CSE-MsgGUID: spvovQQRQAO9t54Mozw09A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85087573"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="85087573"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 11:05:13 -0700
X-CSE-ConnectionGUID: Iz2MrHwJQyW8HVe2qARQGw==
X-CSE-MsgGUID: BVlLvQwtQCiqRGCTGla6mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="258837130"
Received: from spandruv-desk.jf.intel.com ([10.54.55.20])
  by orviesa010.jf.intel.com with ESMTP; 29 Jul 2026 11:05:14 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] platform/x86: ISST: Avoid model check for recent servers
Date: Wed, 29 Jul 2026 11:05:12 -0700
Message-ID: <20260729180512.2048114-1-srinivas.pandruvada@linux.intel.com>
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

- Not running as a guest
- The platform is identified as a server via ACPI PM profile
- The CPU belongs to Intel family 0x19
- MSR 0x54 is present to retrieve the PM logical ID

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../intel/speed_select_if/isst_if_common.c    | 61 ++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
index 1c48bf6d5457..8b87dec2a4cd 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
@@ -7,6 +7,7 @@
  * Author: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/cpufeature.h>
 #include <linux/cpuhotplug.h>
 #include <linux/fs.h>
@@ -774,6 +775,58 @@ void isst_if_cdev_unregister(int device_type)
 }
 EXPORT_SYMBOL_GPL(isst_if_cdev_unregister);
 
+#ifdef CONFIG_ACPI
+
+static bool acpi_pm_profile_server(void)
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
+static bool acpi_pm_profile_server(void)
+{
+	return false;
+}
+
+#endif
+
+static const struct x86_cpu_id sst_allowed_families[] = {
+	X86_MATCH_VENDOR_FAM(INTEL, 19, NULL),
+	{}
+};
+
+static bool isst_features_allowed(void)
+{
+	const struct x86_cpu_id *id;
+	u64 data;
+	int ret;
+
+	/* For hypervisors, explicit model addition is required */
+	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
+		return false;
+
+	/* SST is server only feature */
+	if (!acpi_pm_profile_server())
+		return false;
+
+	/* Match for family 19 only */
+	id = x86_match_cpu(sst_allowed_families);
+	if (!id)
+		return false;
+
+	/* Check for presence of MSR 0x54 */
+	ret = rdmsrq_safe(MSR_PM_LOGICAL_ID, &data);
+	if (ret)
+		return false;
+
+	return true;
+}
+
 #define SST_HPM_SUPPORTED	0x01
 #define SST_MBOX_SUPPORTED	0x02
 
@@ -798,8 +851,13 @@ static int __init isst_if_common_init(void)
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
@@ -812,6 +870,7 @@ static int __init isst_if_common_init(void)
 			return -ENODEV;
 	}
 
+misc_reg:
 	return isst_misc_reg();
 }
 module_init(isst_if_common_init)
-- 
2.54.0

