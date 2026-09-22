Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA89C490C07;
	Tue, 22 Sep 2026 18:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102000; cv=none; b=Q39Y5cr/QvRJXzjBmyq8AApAuZWrvqgV0jbZKg04Dt41kCyUVuPoMGkUrkR8KGnZEJyj4aAtUTA2CJTbjqnIZa2kDn/46y6S24CWchEdJO59bgP7X+GjvoxT2lQ+ivuRBH7OSsJpWp7tUFFFVK3SX7CDseIlo/sY3Y/7kbnVcj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102000; c=relaxed/simple;
	bh=5+J9lJ3AvqQV2FjVBib/zG4wwMZuAyNQEHlOEjfss7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tJv/Z00Tb18eNYsJY/xRLf1iL/XjyrqvuDwN551wbVWWRlVJQri6jrYi0W/LH1c0/Wbiu0dRD/O+Hw4NaemVVONcqj/827I+PVpTX5z8wrDwwoe2Qbw8BcCcsicckaOEb8LnO5WM+4HvfxULTG9tQYYb1HaBvcYndkrnzCz4HlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YAPUl133; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YAPUl133"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790101999; x=1821637999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5+J9lJ3AvqQV2FjVBib/zG4wwMZuAyNQEHlOEjfss7c=;
  b=YAPUl133QZGy9if9XMhplmVp/fk54B5swgaqP/GpxmRVoqE4d8gMiWMn
   TvMg6g7Ea8wcQ0PI20Bh1b/fxrvsG5TA6gFsHkps+VaR/hT5mBLEwWfk5
   JoVO6FQwhQ/DNehtwGKniKjr9CcCx/uAW+uxX4mnKSN9cMUVElHow4/7A
   H/+wXqSVk0+xz8ybkFFsXd/weyJWQAMs2muJWm2johfEXRBeNL/W2rcQZ
   r3K9z1YxahL5S44T+tWofFfCVpjHO0UrNl82fC99F1ti4i/MZb2wcGLYG
   hmlHf//MziQ1H8zflrXsmuGpgGTIA5VdJSXuvcDyxCzGHIQN0NsWv4yB+
   g==;
X-CSE-ConnectionGUID: 49H2twEdSQuG8QDhqfKLdQ==
X-CSE-MsgGUID: a/C99d6uSGOERqxyuoLNRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94564893"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="94564893"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 11:33:15 -0700
X-CSE-ConnectionGUID: cGSl0ieZRoKiRVP+XqRoDQ==
X-CSE-MsgGUID: JtvMqAmYSv2E4gPteQMYdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="271827978"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 11:33:15 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 05/10] platform/x86/intel/tpmi: Keep the feature resources in intel_tpmi_info
Date: Tue, 22 Sep 2026 11:33:06 -0700
Message-ID: <20260922183311.3783010-6-sathyanarayanan.kuppuswamy@linux.intel.com>
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

