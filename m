Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD0B4AB1D7;
	Thu, 24 Sep 2026 18:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274241; cv=none; b=jFiY1IT5cgdYaRMiGVRrODQZcKY7nIh+XjeBE62LTcfJ1Kh7Q0YXSIjrh0oc0Nvo/OZPLqD0Y7W8XXz6kVHpPExt/Ii3WMLipCOUJpXbG9h0GGfCCuRmEHbn/OQsQZTZsiRpPTIgZ7PUkLAM/4fSqIxw/qG7J5YRWJlb84FDtDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274241; c=relaxed/simple;
	bh=Z+45j+E2SIXO1krqnxt+Ax1Palf6Th7eSTMIXrJXia8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PaXhVBuV4nA9gUz8EHnBqUHXGcpiZ8b8VoFctCDdbVzc7Ogun2Nzf0p+IIDS89/tk7LUrP1HDR2RQnNwgdP40W7lc5rOVXktxJ6JRbXM0Ywni6u+7K18Ednv6/ngIupQ8h2DgJN5BTV/hPqulIQoPZPgIu5ebYPYHzOJGIFR9v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExjfPcTl; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExjfPcTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274239; x=1821810239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z+45j+E2SIXO1krqnxt+Ax1Palf6Th7eSTMIXrJXia8=;
  b=ExjfPcTlFTbxJn018ONYXQ9IxlUCFSLskHlEI13Xer5STozM1in4Yjwl
   8baa5AYK/I+j3AbW2BcdMDbYrSBL4VJk9zs6lG/EakEVWe9XJmGWISw5A
   NCkhT30fZnJoSdrQSM+pqrh4JhT/GIG9stOrmeiRdvrbjB/KuK7QL67sK
   1VBcORq3T87DnukWeeS1RlnZ4t3tcH+Jyb5TwLCzL0a+DobESKn3kAOq9
   KduYfN1EPtQ2cHGHWQ/IB/ppgtfpO/A3w0i9sj5KIerllQ3FI6++u5HHi
   sJEkblredMzn9O6Imac7FonLqotjAyfKDfap292pTrGTMVzwpEkRgmF8J
   A==;
X-CSE-ConnectionGUID: zgYjd5QpR36YA1UMnQhS5Q==
X-CSE-MsgGUID: q0AqczjTStumh4ch00p9Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164255"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164255"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:44 -0700
X-CSE-ConnectionGUID: HPX2b6piQrKjN9XyrxZzgQ==
X-CSE-MsgGUID: 9NDvW2/2RXOK6d14qMPDaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229910"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/19] platform/x86/intel/tpmi: Use static strings for the feature device names
Date: Thu, 24 Sep 2026 11:23:23 -0700
Message-ID: <20260924182342.212709-2-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

