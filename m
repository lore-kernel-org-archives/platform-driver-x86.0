Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2865E53FD2A;
	Tue, 13 Oct 2026 19:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919795; cv=none; b=LZzXoKsW19WisCSKnB7tKso5Laqg7dhBKfEWtCjMihMzz0Ld4N+/xqkaL/vjJ79kMFKoxj4QLUzpUv2aldzJLVMHWJ5CX+JIt++L27ir4lnjXqUy6yJpAf8/2KAbptM/P6kuJTqsYdjEr1TCLBMgly+cy0ifX3g8zY+4cSW43Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919795; c=relaxed/simple;
	bh=nBwY46Hr8XhQplLC+jYrfeYsbLTCkXFa9xpKWrHXq7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQFWXehL5IUCkLALLIa3rzdoOYQWPBiIz9VW23+Hs/nbFYlcLccJeRmiomziu/nP7Gusv9TrMrNOwqLAZTwHEzwID+MHfnZEk5K9TO1y04//7RcjpiFIXXz+9KAkyPSVGTqp0UJmSk6WY79eGc9Hs3CHq+yNixDXsaL0pAl8aeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DU6igb52; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DU6igb52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919793; x=1823455793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nBwY46Hr8XhQplLC+jYrfeYsbLTCkXFa9xpKWrHXq7E=;
  b=DU6igb52yb5lKze9jd56h+Z3fc0NXX9b4mJ6dF4Xj6zOT8fvoLIx2TjF
   oAU+ANTQN3rXuJbAf8/c813YPOiU2dWg8ZgnEiiXLfJyJbekzza0mbJZs
   rT1NmVg5bGs2hYqSW/sruaUOrCylqTOd7o2/ECVOtwcILp2A8Vgp9rt0T
   3kvbF+DUVK0Ambtf37RRttC896dKswwHBNREZygAQYVrTBBeM/zFyR97p
   QIEQvVDGmXRi8zjflCYmzLDAHsM7N4vFca98t3qNExs2JqOJ0CLEFfFhK
   au+lHsG2RoGXLco7GaSjjDTcIhVxlmVYOdw4CPLvw4ju8rWB4nN2UG+FY
   Q==;
X-CSE-ConnectionGUID: wzDKcjxBR8e/sU83BjVoWQ==
X-CSE-MsgGUID: jJuuS7dgTs2++SSK4Xo4cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544111"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544111"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:48 -0700
X-CSE-ConnectionGUID: UMg0eDvaQGyvEjfp2tXx6w==
X-CSE-MsgGUID: pHuNue/tTMyY1jxXtK5DKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167658"
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
Subject: [PATCH v5 02/20] platform/x86/intel/vsec: Pass a struct device to intel_vsec_set_mapping()
Date: Tue, 13 Oct 2026 12:29:17 -0700
Message-ID: <20261013192935.2243291-3-sathyanarayanan.kuppuswamy@linux.intel.com>
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

