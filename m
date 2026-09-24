Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81794AD4CF;
	Thu, 24 Sep 2026 18:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274243; cv=none; b=i2e/P6/OQAZShA0smva3YN0kj4Py0oE4MWN3ckEO6UdNCX3DHK0OO9aT8fKm9ldgjpKe8J7fc6B2v9aRHTVqR1kLflEaUM6u76mqOTegWEHzhzHlKq1x7AO0gOkhdJVpsrvbwBeyKEXgxiHKfNKGDPJHf6FwkeKif61KC2+fQEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274243; c=relaxed/simple;
	bh=43iCEcdNrqESVqvh7iTNwHAKsvTYeK4i01c/nab3iwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lSpdf4CnTRO7j7BK725G4fGBGlJHpAxmxTtvfgvZJqW+Sz3gL6Ls2gn/OPRZdGoOuRBIzeTvObhCJx/aUQNaZaUjQKHCAqlQuIlHaYK9rTUMBQfcIJubmGX0DbdRPxh+p4ASaYb/D3wEsiAFjxcKLxj+TdDV79g6w39jkuRmGYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2N/hsx5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2N/hsx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274241; x=1821810241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=43iCEcdNrqESVqvh7iTNwHAKsvTYeK4i01c/nab3iwQ=;
  b=A2N/hsx5g+j28qFaJ69GX5YxePwBDSvsd9/hFOzH+LaGah+KMwNM/Or4
   w6K9hSEX919r7MhLWU0Pf94RGNTG7EKChVCGxWKy7GqUcouqRK5iwYK50
   0wzvimLAdFLFVlGWzhX1sL+H1K9WziWzQqKf8aG6Vc+3A1a7B+DxjTDKU
   C5aFhB3C8YLsOAVfTr3koNfYDoTRWaCD1im9BLXh5kuFDJz5Gdngu9Yzw
   jr8rA4GA3sH9L/yZ4KhjFF4H7t0n9f4JRmAazWgA1pTDllMA992oPY7U9
   ZEEEjTBY0UFMoNi9tJD4kINXSkWlzmqi79Uyw6WLkimgGA1zrVgFUUP5F
   w==;
X-CSE-ConnectionGUID: wFelp5xlReG0qMPbsWKy5A==
X-CSE-MsgGUID: t6ch1NFmQYmlHAigiG5ZYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164257"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164257"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:44 -0700
X-CSE-ConnectionGUID: YNTA4zyNTYKfI6rcOHEyKw==
X-CSE-MsgGUID: pBtbo9XaSlaK/tSgQHUxBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229913"
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
Subject: [PATCH v2 02/19] platform/x86/intel/vsec: Pass a struct device to intel_vsec_set_mapping()
Date: Thu, 24 Sep 2026 11:23:24 -0700
Message-ID: <20260924182342.212709-3-sathyanarayanan.kuppuswamy@linux.intel.com>
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

intel_vsec_set_mapping() takes an intel_vsec_device pointer and only
reads the struct device out of it. A caller that has the device but no
intel_vsec_device would have to build one just to make this call.

Pass the struct device instead. TPMI is the only user of this interface
and it is being prepared for enumeration methods other than a PCI VSEC
capability, where no intel_vsec_device exists.

No functional change.

Co-developed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/platform/x86/intel/vsec.c      | 7 +++----
 drivers/platform/x86/intel/vsec_tpmi.c | 2 +-
 include/linux/intel_vsec.h             | 5 ++---
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 5ab2215fdd7f..f33eea6e6284 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -717,15 +717,14 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id
 	return intel_vsec_pci_init(pdev);
 }
 
-int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
-			   struct intel_vsec_device *vsec_dev)
+int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info, struct device *dev)
 {
 	struct vsec_priv *priv;
 
-	if (!dev_is_pci(vsec_dev->dev))
+	if (!dev_is_pci(dev))
 		return -ENODEV;
 
-	priv = pci_get_drvdata(to_pci_dev(vsec_dev->dev));
+	priv = pci_get_drvdata(to_pci_dev(dev));
 	if (!priv)
 		return -EINVAL;
 
diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index 9b2bd0c8cbe2..edeae3fd23a1 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -799,7 +799,7 @@ static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
 			if (ret)
 				return ret;
 
-			ret = intel_vsec_set_mapping(&tpmi_info->plat_info, vsec_dev);
+			ret = intel_vsec_set_mapping(&tpmi_info->plat_info, vsec_dev->dev);
 			if (ret)
 				return ret;
 		}
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 843cda8f8644..4d9c9776ca81 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -221,8 +221,7 @@ static inline struct intel_vsec_device *auxdev_to_ivdev(struct auxiliary_device
 #if IS_ENABLED(CONFIG_INTEL_VSEC)
 int intel_vsec_register(struct device *dev,
 			const struct intel_vsec_platform_info *info);
-int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
-			   struct intel_vsec_device *vsec_dev);
+int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info, struct device *dev);
 struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pdev);
 #else
 static inline int intel_vsec_register(struct device *dev,
@@ -231,7 +230,7 @@ static inline int intel_vsec_register(struct device *dev,
 	return -ENODEV;
 }
 static inline int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
-					 struct intel_vsec_device *vsec_dev)
+					 struct device *dev)
 {
 	return -ENODEV;
 }
-- 
2.43.0

