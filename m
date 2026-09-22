Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845903314C3;
	Tue, 22 Sep 2026 18:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101999; cv=none; b=L55fuFDdBPwaTQzBj4E+ru+TnGosDfTqGol93mXjnSMpiwaED7XSSW+7nqZekkh0Lp+5/FQV895h1BjSlSWMAgBV1TGql7gmTcZSbPJnOebdWUu7qyNGT5kfmGmjRAhFvn8nNLDMiNrV0+YvrePFRugQwk3vWRA0XJeZxmvKNmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101999; c=relaxed/simple;
	bh=Z+45j+E2SIXO1krqnxt+Ax1Palf6Th7eSTMIXrJXia8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k8M+G3zuY33NfFFHNVcYefUEXc2N8T5ZgMWzeKUuYW/kA+anVYBRQo54q/vsQnoH/f76c9q8PG9qso7Pw72u8RBGTVDKpRyKJp2JPlQZb+IkLzU0FjrifE5XpPjdR0sRgKdwDCb6KdOPcoH2xL7HdFVOo4N35iRpad9akPC2jJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRhe9Cix; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRhe9Cix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790101996; x=1821637996;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z+45j+E2SIXO1krqnxt+Ax1Palf6Th7eSTMIXrJXia8=;
  b=gRhe9CixpNDRin0tBJDfnsQkMC3FWnclhp6hnjrVsFQKyroNfJeO+0T2
   nKQ4JI5levHMNe8DJBz7rJYTrt+8IMG/U1eo7+AXWIMv4pXg/SsIpugBs
   7b744j8DUoBcMo5Ql4PJh9BvYOfo/wq819EtLEN2g6HOJrvYdkrGnku1L
   lBPNe26PZcFXK2OKeLcMW1IoP4dXldN8JHiRaSq4o5suFqC0zqo1fnhxM
   Y5HTJ+Rm4m2+gbobrq8tdCmOPSbwVO7FZYsyQFc+iPqJMXTn7mVeqB7Uy
   xQ/Y8+XhzWUrtgePzSL/Tu8WDg3YM8wQC4ADxolGPQEg8ZY7rF1IaChCQ
   w==;
X-CSE-ConnectionGUID: Le/twPKFRGiz3ESSeDAGdg==
X-CSE-MsgGUID: toHjARsYTkSLA7gAx80EKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94564883"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="94564883"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 11:33:14 -0700
X-CSE-ConnectionGUID: zKC5gF8ZQHWZmd9Y2RELuw==
X-CSE-MsgGUID: 7Rb0vajQSki81H/jpvUImg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="271827957"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 11:33:14 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/10] platform/x86/intel/tpmi: Use static strings for the feature device names
Date: Tue, 22 Sep 2026 11:33:02 -0700
Message-ID: <20260922183311.3783010-2-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922183311.3783010-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260922183311.3783010-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tpmi_create_device() builds the auxiliary device name in an on-stack
buffer and hands it to intel_vsec_add_aux(), which stores the pointer in
auxdev->name without copying the string. The auxiliary device outlives
tpmi_create_device(), so auxdev->name is left pointing into a stack frame
that has already been torn down.

Nothing dereferences auxdev->name after intel_vsec_add_aux() returns
today: auxiliary_device_init() only checks it for NULL and both
dev_set_name() calls copy into dev->kobj.name, while driver matching and
the modalias use dev_name() instead. So this is a latent problem rather
than a live one, but the auxiliary bus expects the name to outlive the
device, and the other intel_vsec_add_aux() caller already passes a string
literal.

Convert intel_tpmi_name() into a lookup of a static array of string
literals that already include the "tpmi-" prefix, and pass its return
value straight to intel_vsec_add_aux(). Using a static array instead of
a switch statement makes the lifetime of the returned strings obvious:
they are valid for as long as the module is loaded. The snprintf() along
with its on-stack buffer and length define are no longer needed.

The resulting device names are unchanged, so the feature drivers keep
matching on "intel_vsec.tpmi-<feature>" as before.

No functional change intended.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel/vsec_tpmi.c | 41 +++++++++++++-------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index 0153dd57838e..9b2bd0c8cbe2 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -47,6 +47,7 @@
  */
 
 #include <linux/align.h>
+#include <linux/array_size.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/debugfs.h>
@@ -579,33 +580,31 @@ static void tpmi_set_control_base(struct auxiliary_device *auxdev,
 	tpmi_info->tpmi_control_mem = mem;
 }
 
+/*
+ * The TPMI IDs are sparse, so the unused entries are left NULL and are
+ * rejected by the caller like any other unsupported feature.
+ */
+static const char * const intel_tpmi_names[] = {
+	[TPMI_ID_RAPL]		= "tpmi-rapl",
+	[TPMI_ID_PEM]		= "tpmi-pem",
+	[TPMI_ID_UNCORE]	= "tpmi-uncore",
+	[TPMI_ID_SST]		= "tpmi-sst",
+	[TPMI_ID_PLR]		= "tpmi-plr",
+};
+
 static const char *intel_tpmi_name(enum intel_tpmi_id id)
 {
-	switch (id) {
-	case TPMI_ID_RAPL:
-		return "rapl";
-	case TPMI_ID_PEM:
-		return "pem";
-	case TPMI_ID_UNCORE:
-		return "uncore";
-	case TPMI_ID_SST:
-		return "sst";
-	case TPMI_ID_PLR:
-		return "plr";
-	default:
+	if (id >= ARRAY_SIZE(intel_tpmi_names))
 		return NULL;
-	}
-}
 
-/* String Length for tpmi-"feature_name(upto 8 bytes)" */
-#define TPMI_FEATURE_NAME_LEN	14
+	return intel_tpmi_names[id];
+}
 
 static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 			      struct intel_tpmi_pm_feature *pfs,
 			      u64 pfs_start)
 {
 	struct intel_vsec_device *vsec_dev = tpmi_info->vsec_dev;
-	char feature_id_name[TPMI_FEATURE_NAME_LEN];
 	struct intel_vsec_device *feature_vsec_dev;
 	struct tpmi_feature_state feature_state;
 	struct resource *res, *tmp;
@@ -634,8 +633,6 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 	feature_vsec_dev->num_resources = pfs->pfs_header.num_entries;
 	res = feature_vsec_dev->resource;
 
-	snprintf(feature_id_name, sizeof(feature_id_name), "tpmi-%s", name);
-
 	for (i = 0, tmp = res; i < pfs->pfs_header.num_entries; i++, tmp++) {
 		u64 entry_size_bytes = pfs->pfs_header.entry_size * sizeof(u32);
 
@@ -654,9 +651,11 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 	 * delete is required on error or on module unload.
 	 * feature_vsec_dev and res memory are also freed as part of
 	 * device deletion.
+	 *
+	 * "name" must outlive the auxiliary device, as the auxiliary bus
+	 * stores the pointer rather than a copy of the string.
 	 */
-	return intel_vsec_add_aux(&vsec_dev->auxdev.dev,
-				  feature_vsec_dev, feature_id_name);
+	return intel_vsec_add_aux(&vsec_dev->auxdev.dev, feature_vsec_dev, name);
 }
 
 static int tpmi_create_devices(struct intel_tpmi_info *tpmi_info)
-- 
2.43.0

