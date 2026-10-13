Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF65253F6AE;
	Tue, 13 Oct 2026 19:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919792; cv=none; b=pi/psj/m95gHVVeaUpujZ/NP04J0PX2CaU1L3ZF3e94NI9C4OFTJTCPS9cZ5mZ2eXfQAulXhJKgUSNDOYzu4EWp7ElqR/Oia3QJEvuz1hTxZUTgZiYPyj3YA8xROLmGuFrUrqiM1YVZSlal8L4BL4qxF5aTs4Rpe6qwFlmjzm5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919792; c=relaxed/simple;
	bh=R6dsZrhu9NgBwhhSFSnog9rmIHrIC0UuWb7KJIsDK+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bq247vmvt3UdGt8RUOQjWbr2+SZ9V0Jtd//go4LpPG6cgy161RB+nRtcardQekGHqHFFkDV9ROFPHLfU+fFJzRZg+uNSEzPKpE/goRE/p8A9C6a/0SlDptn/93fijtlzBKB4+S2rLv158hImhyokPRATdW2GBp4dXYUJ1Trm2i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVyJOQm5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVyJOQm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919789; x=1823455789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R6dsZrhu9NgBwhhSFSnog9rmIHrIC0UuWb7KJIsDK+E=;
  b=QVyJOQm54i/xE2EelrZ//cUcbBJesdiYMNwGyUDACNld69FUXZ3sDXPz
   GgfmNgJBHPvngdOtmxSkuXZp+1jQnOpcfLxavUSMUr1IttbRNKE1xiLqF
   JGqRoL72fG98dS6x8UlxfqVQKxksoYHPMW9Fj8YDti0tsCNEAOha8pBeb
   p8XXRhW33LJcBqaFoR4gay4+C0SUblDeQCWX9d3ILVl4XupaQ+hB6A8m5
   Q1fan18mO/8gX7ZLAnDDLx8vWbN1JYXQSRNGl2Dfn8ZbHUGQrelAiVL4O
   KQamdpYilpEUvYeRd07pAdMYUPutKWbJuI6UahCk6yL8/s4NjqESDm0pv
   Q==;
X-CSE-ConnectionGUID: HJAqYcsHQd264fD9LsNxHg==
X-CSE-MsgGUID: zKjHCdCkQzq2mYosCfjrdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544108"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544108"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:48 -0700
X-CSE-ConnectionGUID: 4g/LgQhVSK+VGBq5ekVu0w==
X-CSE-MsgGUID: 9qaBn0yoRfmMgR1GFv6ntA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167655"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:48 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/20] platform/x86/intel/tpmi: Use static strings for the feature device names
Date: Tue, 13 Oct 2026 12:29:16 -0700
Message-ID: <20261013192935.2243291-2-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
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

