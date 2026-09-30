Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D72A51CF5D;
	Wed, 30 Sep 2026 17:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789383; cv=none; b=OBkf/WUYEhdQzM78lYIX69gXXuT+sXabC+c13XruvqQjheeWpHc2HKX2BQah2OdI/DI2ie53bpgpWkKZ/2eAF38tqNUXVj8LKlKc6hswKXoOGirJxeIN/DGOtry+ymzP89wRw0srTHsTxhosPidvw/kI9I+R0kblUFNw7iqbWbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789383; c=relaxed/simple;
	bh=5+J9lJ3AvqQV2FjVBib/zG4wwMZuAyNQEHlOEjfss7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jQ3bSRu2ev0TeQuog7YariTLKKLzz963QUAVyplPP5tDBtmzotWgMaK/fVw3R4VODX+g0pymmNFXxHhH9IG7fN2n22ZSoOlXBEEzAGn46m1354cwamFW+QEZv+6yMKUne0sjFlg88nxV+F5uYJJ6YsiK1JIiCkK2P7KTa/mSOtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GcR2ZJqd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GcR2ZJqd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789382; x=1822325382;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5+J9lJ3AvqQV2FjVBib/zG4wwMZuAyNQEHlOEjfss7c=;
  b=GcR2ZJqdqQY4yPET7l+bVVIG60S8sfafJbjxy4WF79BEx+jkmY9Kt4F0
   fEbznSGr62X4SEXCjUgHZAGK7wm6t6svK5bmjl8/HdozuqthRgGz7sBcX
   1pjppCqoH+tG2i59ZJW9/Lfyim4CIDC6cGnGi1Zdofgc39IM8bFmuO/hO
   W81j6kGpqrDl9Pu8Y9G/LVLbtyJhRzIGWPxqn+/BICNJ5sRGA/3uS73sw
   y9FCrZttTbCP73ZJCN6bCve7VuPkGw9rXaLgVEWVoNqJxYpoiJz9wOJg6
   IIFfp09EfEJG6brL9Ssh7tJuDW7BDAYzO/pifgmrDya/ncy6XltgVRf4e
   A==;
X-CSE-ConnectionGUID: 3ig37M6kRk2FRj5dqcu/Dw==
X-CSE-MsgGUID: LJtwF5ScQVW+7jXOg32cPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91632059"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91632059"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:34 -0700
X-CSE-ConnectionGUID: b4NJVgy5RueEbepihhoxPg==
X-CSE-MsgGUID: FwEU+Be5T32FrixLOBtMig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="278959401"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:34 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/20] platform/x86/intel/tpmi: Keep the feature resources in intel_tpmi_info
Date: Wed, 30 Sep 2026 10:29:02 -0700
Message-ID: <20260930172918.743656-6-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PFS walk and tpmi_create_devices() go back to the intel_vsec_device
for the MMIO resource array and its count, although the count is already
cached in intel_tpmi_info.

Cache the resource array as well and use it everywhere. The array
belongs to the enumerating device and outlives the TPMI instance, so
holding a pointer to it is safe. Fewer places need an intel_vsec_device,
which enumeration methods other than PCI VSEC do not have.

No functional change.

Co-developed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/platform/x86/intel/vsec_tpmi.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index d254dc6a4d0d..b462fd0319e5 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -110,6 +110,7 @@ struct intel_tpmi_pm_feature {
  * @plat_info:		Stores platform info which can be used by the client drivers
  * @tpmi_control_mem:	Memory mapped IO for getting control information
  * @dbgfs_dir:		debugfs entry pointer
+ * @resource:		Array of feature_count MMIO resources, one per PFS entry
  *
  * Stores the information for all TPMI devices enumerated from a single PCI device.
  */
@@ -121,6 +122,7 @@ struct intel_tpmi_info {
 	struct oobmsm_plat_info plat_info;
 	void __iomem *tpmi_control_mem;
 	struct dentry *dbgfs_dir;
+	struct resource *resource;
 };
 
 /**
@@ -656,10 +658,9 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 
 static int tpmi_create_devices(struct intel_tpmi_info *tpmi_info)
 {
-	struct intel_vsec_device *vsec_dev = tpmi_info->vsec_dev;
 	int ret, i;
 
-	for (i = 0; i < vsec_dev->num_resources; i++) {
+	for (i = 0; i < tpmi_info->feature_count; i++) {
 		ret = tpmi_create_device(tpmi_info, &tpmi_info->tpmi_features[i],
 					 tpmi_info->pfs_start);
 		/*
@@ -748,15 +749,16 @@ static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
 
 	tpmi_info->vsec_dev = vsec_dev;
 	tpmi_info->feature_count = vsec_dev->num_resources;
+	tpmi_info->resource = vsec_dev->resource;
 	tpmi_info->plat_info.bus_number = pci_dev->bus->number;
 
-	tpmi_info->tpmi_features = devm_kcalloc(&auxdev->dev, vsec_dev->num_resources,
+	tpmi_info->tpmi_features = devm_kcalloc(&auxdev->dev, tpmi_info->feature_count,
 						sizeof(*tpmi_info->tpmi_features),
 						GFP_KERNEL);
 	if (!tpmi_info->tpmi_features)
 		return -ENOMEM;
 
-	for (i = 0; i < vsec_dev->num_resources; i++) {
+	for (i = 0; i < tpmi_info->feature_count; i++) {
 		struct intel_tpmi_pm_feature *pfs;
 		struct resource *res;
 		u64 res_start;
@@ -764,7 +766,7 @@ static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
 
 		pfs = &tpmi_info->tpmi_features[i];
 
-		res = &vsec_dev->resource[i];
+		res = &tpmi_info->resource[i];
 		if (!res)
 			continue;
 
-- 
2.43.0

