Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B386853FD3C;
	Tue, 13 Oct 2026 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919802; cv=none; b=c61fORPhzLy4DHa9q4OOCNgHwrFIpoVyPjAi3KoWl0vnwoe2WXsSLF6Cs/m/7fhgVy6U/UEdDCoMeQHBJkeTvIZkfe8gEwr7DcYPDPz+A0NZHUSF2sjcix4BHH5qIBo/wIWKBmPAd74SZEbV60424OnwBOhlGF9Wkj9+E7eHMxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919802; c=relaxed/simple;
	bh=WyegeQCkEhqSGR+PqPySOEHhsVjJexyrZ8QpsMEGN2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Efz8slOJBY/WkGi3PjQZBj2NoHXPNj206aHWmAthSpCEaX485qx8AUOVXpuzmV5xvvEV9gIvPAlZM64c6yy1q2fucANbPsgExh5c2gxRXkuTKfRUcmTr+ln3YRH7kfkgO+jA0l7YT/Lg73fW/Ncr1kReu+aX/vqkOM/n6pyv4MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=naIwRLAU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="naIwRLAU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919796; x=1823455796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WyegeQCkEhqSGR+PqPySOEHhsVjJexyrZ8QpsMEGN2U=;
  b=naIwRLAULMSQofog3zNvtcUGtcsyjiDa1WacfOK2D7ghmxFp26hknzAE
   COKDFHn6gW58JjWxMqLuCI8Qe9USlWZionL38KaEO0zRStAI3TmJiYkrQ
   vfUn3W0jT5N3VBBqMzLQqBUsHHReK+B8MlC1NfO405zBckSOTP8vLjTg5
   15YCVfuM7PPQCCJtaGTTGQsRY9B8SsHhHyNYHwcJI1OsB4BVo9j99ckq8
   aDhH/0/PVTILxGCO6Je0bhLrbGMUXQX+lr/Zs6uxn9GSU0NVGFo0n2NG7
   laklSLsEJSHIftw0vCMEmLu9kFagmcU78vROALh2EWp5Cz9v0PDMjwI/z
   Q==;
X-CSE-ConnectionGUID: Il/YNDYBR6yRUW5UKGae2A==
X-CSE-MsgGUID: t87cyYOsQzK1ftfDyN8P0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544117"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544117"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:48 -0700
X-CSE-ConnectionGUID: 9Ru/8ky3TeKeepszR4D2dw==
X-CSE-MsgGUID: Prn92MRpQ8+Yhn0vK6OzLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167668"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 05/20] platform/x86/intel/tpmi: Keep the feature resources in intel_tpmi_info
Date: Tue, 13 Oct 2026 12:29:20 -0700
Message-ID: <20261013192935.2243291-6-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
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

