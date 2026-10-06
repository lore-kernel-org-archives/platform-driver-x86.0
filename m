Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307D4385D86;
	Tue,  6 Oct 2026 18:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311458; cv=none; b=U8UWD+fmGs6qLoCcrc7wJn8d8SMg4FV022ZPMOrVoBjRkxCnIT003K6kBfWtFc05jVTH9mLSGCY11XkFXtWZMr57Udx64WW/oEL+J3YL7Ik8TYIwPDkaDYu52/77FBG7jSj8xvq8ZsMF1uW1D0CRzGzOyKTs4LKj60IM0m3m8fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311458; c=relaxed/simple;
	bh=nBwY46Hr8XhQplLC+jYrfeYsbLTCkXFa9xpKWrHXq7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PnnQLxZtYfmoC2JV0ErI5MbXRwH1a3WJZHV4sV3c0QpJDyjje/R6LDDkapsuusBB5BPD/k2zl9Ovoz4yf9B1O51LpBlJZQDRFjp3M+bcrnUEaUUCAlh2d8NCngxyCJ2AV8SDNhbcLihFtigFn8P6R5jKTflc8pd8rAly6Rs++a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOoRjAFH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOoRjAFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791311457; x=1822847457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nBwY46Hr8XhQplLC+jYrfeYsbLTCkXFa9xpKWrHXq7E=;
  b=QOoRjAFHrongIFwcGANKYLaJmEtYn+Qq1TWEd8L4Dlhidp7Qo+/4QGux
   sNM5HHOkjNOBQSW86kpnPcZ+0j4v+OMFdBK9GXM4Wr87sIjc6JCRcGs+2
   XZ5ur72NzBkbAlY7VBAKOMRpT8ENEWDLsutsDIKhf0wVXgsxPSaefOBjU
   TmHNzHH+//2/gz+A9LqCMJXRJCxs7ttvTq7Sbwn2/kOhezGGHAICX6ohC
   t0yA0C1Jd9Ns27IejNdMErdPlBFwmNrKDcWVfRahkOeXvboE2PKNAd3lP
   2oKu8MGw+2hJdvdzEWCZWnfBi1Vkxi4fZuxx+6buj29LJiejllNLZLP4g
   Q==;
X-CSE-ConnectionGUID: E0NyMxmpSjubRjWpRPYYEQ==
X-CSE-MsgGUID: vr8MUKr4TBG9EAFNTk0CYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102591588"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102591588"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:54 -0700
X-CSE-ConnectionGUID: yRY53pcPR6yRkZTlPeWrfw==
X-CSE-MsgGUID: 5OSPGAUsT1K3dz0NZ5M5UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303500249"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:54 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/20] platform/x86/intel/vsec: Pass a struct device to intel_vsec_set_mapping()
Date: Tue,  6 Oct 2026 11:30:19 -0700
Message-ID: <20261006183037.1507007-3-sathyanarayanan.kuppuswamy@linux.intel.com>
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

intel_vsec_set_mapping() takes an intel_vsec_device pointer and only
reads the struct device out of it. A caller that has the device but no
intel_vsec_device would have to build one just to make this call.

Pass the struct device instead. TPMI is the only user of this interface
and it is being prepared for enumeration methods other than a PCI VSEC
capability, where no intel_vsec_device exists.

No functional change.

Co-developed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
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

