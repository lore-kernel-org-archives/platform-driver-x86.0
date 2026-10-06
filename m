Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC2F4A4992;
	Tue,  6 Oct 2026 18:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311460; cv=none; b=IaNSL9GdAx9K3BrsxwJOFM2MiSJsk8xjUuGG/q7kiNmuGo2My9zJGcgG4jMOoM5C8BI5MmuZZuOJFbAWQxaWv4ghQHmbcCUPuzEdOXX6CpBd9l4QRMcXXNWGP9S1p/yS5BXK+EgCvgjLqeOeJKUV1JT/qpDpzpibgYZG4g2rTjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311460; c=relaxed/simple;
	bh=WyegeQCkEhqSGR+PqPySOEHhsVjJexyrZ8QpsMEGN2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bLkIJBpraQe74kBSe5ycJtzHVGmwcJ/BB51ngM6boYJ6pusqztkl2gnmj77W5BIaurEx4Io6yZgEv9mXjkIi89rjRB3dg5rwNlerE+rLsEX2NkGqG9/KK9fCD57WesLM5CQp4JTI3y1qNYSeQNWmZC38FwbpBveZpXCdNy1yB0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaY+lLtX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaY+lLtX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791311459; x=1822847459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WyegeQCkEhqSGR+PqPySOEHhsVjJexyrZ8QpsMEGN2U=;
  b=HaY+lLtXenFpQ1PhacswqqskFm/Aq9zCO2C/+WOqkwNfICqtgurYPKhr
   g42kBuJ46BDIU1NlnIERp+Yuhx/XckPuM/qTdfnecLtgIWgbfStVgyiBy
   qUdWDkfhHzRxWkjV0C39IYdozDOZHLzre2lRyI9iQ5PquQuZNuweJj/BC
   KNy3/0WsfQ8ZTF16GC5fhuG5gLXibrWQbBIajpuQ0BwgMxrJpcSb0MRCy
   VgUpIWIEb50Gu2o1Cg/uYrraz580jGRjSMyqK9LE2O5jt896ZcO3jsOcw
   6W//mZv04JR3VfKZyljng1vUv2I+ReQSE6KviTpORLqGIiaN+HItmzYjA
   A==;
X-CSE-ConnectionGUID: 1wfKAcmzS1y+ioeBooEQEQ==
X-CSE-MsgGUID: Dl5MiyPNS62vUCj8HoDkag==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102591594"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102591594"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:55 -0700
X-CSE-ConnectionGUID: 8xDPlBj3RUKYnx8S0vZyJw==
X-CSE-MsgGUID: U5rEZK4NQXmkuFTd40vdMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303500258"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:55 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/20] platform/x86/intel/tpmi: Keep the feature resources in intel_tpmi_info
Date: Tue,  6 Oct 2026 11:30:22 -0700
Message-ID: <20261006183037.1507007-6-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

