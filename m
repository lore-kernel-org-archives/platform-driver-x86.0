Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFC24B1263;
	Thu, 24 Sep 2026 18:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274248; cv=none; b=RNx1w1tHz5B2Xpe5pfjC0zWUQkJkPeNHd6oMfr2lYiaxlEdXt8w8xArQoQSgWJ3csipkfMFISzXfZzARzFBuDV8eckShp9oX2jmJH/FIv0IqgmGyi/Zu2xWfPUoUFSTzi+5tBAbMIyPNAvT+7eOpP3zYLQCD4EcJBlkbuHrSimU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274248; c=relaxed/simple;
	bh=XNY5cqhovtfO0VevlMS7pV1QbAxZrJbMrLg0DPVdyog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bKwy4F1liOI+2Atugm3iafCM+1dkgu+/G1CCgMDGbcpkisNn6VsxbVir0t7hsWsliPNknq7PrK0ou9N12N5bLNH3z71tKh6rc9xr97Tq1n77J9RuT6Xr8AL51/I9TljyeZ+O+anZMhZOdbhbZZEktFi+P9r10fqtWY3f+Z16ytg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4VihhHe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4VihhHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274247; x=1821810247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XNY5cqhovtfO0VevlMS7pV1QbAxZrJbMrLg0DPVdyog=;
  b=O4VihhHeEMKvQGktfwZgiFPGSI53SyIYfjnbTJDgoKCQmJ7pPpm1abgD
   EA+BiQf4XPZqb7P40VY1hZ2yoDRGSZj0kDzI2fiyJfyisqSGUtTKuBkXN
   fVYv2eqweEEx5If/OJTETuau3T0Mb8AlMDVo7/ZfVNRRXuoktkCEh2wp+
   JXwv13zy3pT0cA7b5BpGpAUFZSf43YI9hiKBk/E90VU2ya8ra8xwIVbwG
   SlRjhJ/3Dcyi+J+ru/eGxUHLHiAwFFS241ZhF8b367g/3zTun6U5VoP0q
   TRmUBaV3znfjYLHpiAJDyStu7Rpw2werg1jfCwGlCOC3mVTy09jjp0igz
   Q==;
X-CSE-ConnectionGUID: 13XuDT2BTC6MN1R7BiT3VA==
X-CSE-MsgGUID: WFdgvz9nShWWeO6w02FX0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164270"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164270"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
X-CSE-ConnectionGUID: 74kF1PV3S4WDzhmP81GGWA==
X-CSE-MsgGUID: vkKbZTxhSWSy6pOTSNoayA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229931"
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
Subject: [PATCH v2 08/19] platform/x86/intel/tpmi: Do not assume TPMI is enumerated from PCI
Date: Thu, 24 Sep 2026 11:23:30 -0700
Message-ID: <20260924182342.212709-9-sathyanarayanan.kuppuswamy@linux.intel.com>
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

The init path converts the enumerating device into a pci_dev without
checking and always registers the OOBMSM package to PCI device mapping.
That works today because TPMI is only enumerated from a PCI VSEC
capability, but ACPI based enumeration is being worked on and the device
it enumerates from is not a PCI device.

Do both only for a PCI device. The bus number read from the pci_dev is a
fallback that tpmi_process_info() overwrites with the value reported by
the TPMI_INFO feature, so there is nothing to do without a pci_dev. The
mapping stored by intel_vsec_set_mapping() is looked up by pci_dev and
cannot be consumed by another enumeration method, and calling it anyway
would fail the probe with -ENODEV.

While here, stop describing intel_tpmi_info as holding the TPMI devices
of one PCI device.

No functional change for PCI enumerated TPMI.

Co-developed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/platform/x86/intel/vsec_tpmi.c | 28 +++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index f1dfe2b23c9c..f96b94ba29f8 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -119,7 +119,7 @@ struct intel_tpmi_pm_feature {
  *			can find them again, for example during PCI error
  *			recovery.
  *
- * Stores the information for all TPMI devices enumerated from a single PCI device.
+ * Stores the information for all TPMI devices of one TPMI instance.
  */
 struct intel_tpmi_info {
 	struct intel_tpmi_pm_feature *tpmi_features;
@@ -742,7 +742,8 @@ static int tpmi_fetch_pfs_header(struct intel_tpmi_pm_feature *pfs, u64 start, i
 static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
 {
 	struct intel_vsec_device *vsec_dev = auxdev_to_ivdev(auxdev);
-	struct pci_dev *pci_dev = to_pci_dev(vsec_dev->dev);
+	struct pci_dev *pci_dev = dev_is_pci(vsec_dev->dev) ?
+				  to_pci_dev(vsec_dev->dev) : NULL;
 	struct intel_tpmi_info *tpmi_info;
 	u64 pfs_start = 0;
 	int ret, i;
@@ -755,7 +756,14 @@ static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
 	tpmi_info->parent = vsec_dev->dev;
 	tpmi_info->feature_count = vsec_dev->num_resources;
 	tpmi_info->resource = vsec_dev->resource;
-	tpmi_info->plat_info.bus_number = pci_dev->bus->number;
+
+	/*
+	 * Seed the bus number from the enumerating device. It is only a
+	 * fallback, tpmi_process_info() replaces it with the value the
+	 * TPMI_INFO feature reports.
+	 */
+	if (pci_dev)
+		tpmi_info->plat_info.bus_number = pci_dev->bus->number;
 
 	tpmi_info->tpmi_features = devm_kcalloc(&auxdev->dev, tpmi_info->feature_count,
 						sizeof(*tpmi_info->tpmi_features),
@@ -801,10 +809,16 @@ static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
 			if (ret)
 				return ret;
 
-			ret = intel_vsec_set_mapping(&tpmi_info->plat_info,
-						     tpmi_info->parent);
-			if (ret)
-				return ret;
+			/*
+			 * The mapping is looked up by pci_dev, so it is only
+			 * meaningful for PCI enumerated TPMI instances.
+			 */
+			if (pci_dev) {
+				ret = intel_vsec_set_mapping(&tpmi_info->plat_info,
+							     &pci_dev->dev);
+				if (ret)
+					return ret;
+			}
 		}
 
 		if (pfs->pfs_header.tpmi_id == TPMI_CONTROL_ID)
-- 
2.43.0

