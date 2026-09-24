Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001914ADD92;
	Thu, 24 Sep 2026 18:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274244; cv=none; b=majvqHkEi25reJcvj8iCXdGRdQBc20e2hkKwEiexxnOC1Z+N11BrIf1xTxU5qLTl4pNeLygSj5+SEGMLCoToA9ZG45z0C2wAmTGDqmfNeDXNIB5VaDokuRfuRwjhcoABwq6fYPtSIbyo8sdk9KsWgeUS0b10jnJumDX4n933PyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274244; c=relaxed/simple;
	bh=5+J9lJ3AvqQV2FjVBib/zG4wwMZuAyNQEHlOEjfss7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lC1UD5ZUF60tz6aI6CD9GB6xc2tm2htLjVPGhgyLAS6uJNW4X5oe4Ki5XLAuDv1ySP6cgHqH9WVLUBlqemdty2jN0LK2jNNCpkbZjdtTT7PUAAzOFUXzRSZBzjRRwYoUkQfK1LUZd6s4s4wSVTXB0owgo+N9cIEyAG7Fp0BiCsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iulflwCP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iulflwCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274242; x=1821810242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5+J9lJ3AvqQV2FjVBib/zG4wwMZuAyNQEHlOEjfss7c=;
  b=iulflwCPZ7PtWJr4lHgXvLwLIYBO8x6hmB4uRGFX94RCVIcCYG8CPDXH
   kj04YDGtucdxwoyWOcEUuDpEFB5+N/VX6HUEiAkjdm7cgRfF+ZKG31X57
   GPp16lcAWB3eeiXTxg1xH56ChGv+hwUdrAEkQrcfCMztvK9a7WBEhZ6CN
   9PLu/M00DP32ir5HEByV+gFGvVHezYakJP8NNDiUP0M4ZBHRJpEuYkqAL
   ZKK6c0He8I3mlxFkmQVscLb1uSGqzMCdv1YokAAbpsAIoeOvecQsozj72
   OCiRHu+KbsrLCAIO9LDPKHWAK20t9bSZsAvdnMX5l3ErWFp27iG5d3zdw
   Q==;
X-CSE-ConnectionGUID: GrcIx9bxT0+AhLS2U93sLQ==
X-CSE-MsgGUID: V/h0IUd6S1G5CIqATjh55w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164264"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164264"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
X-CSE-ConnectionGUID: WRFWyfTFTsq666XoDPunEg==
X-CSE-MsgGUID: a6YzgEDfQxKGXVF2Rwf3gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229922"
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
Subject: [PATCH v2 05/19] platform/x86/intel/tpmi: Keep the feature resources in intel_tpmi_info
Date: Thu, 24 Sep 2026 11:23:27 -0700
Message-ID: <20260924182342.212709-6-sathyanarayanan.kuppuswamy@linux.intel.com>
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

