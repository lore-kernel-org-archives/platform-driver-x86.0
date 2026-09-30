Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143C151993C;
	Wed, 30 Sep 2026 17:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789386; cv=none; b=lMmiuLYkCLdaIKcEwkz1crtJja4RqIThQ5aJTjJk5ubCFL73FFIEHjpCy1G6P+COyJ7MzJTuICkP+c63Mt1j1Cbeasj+eYZm8kx+p/sRQxDahwH7+gPqt319MeqDfjjHuSHR0oVTsJ8TD2+gG9aVY8LFD5p0QbsfcVPT+SXmspI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789386; c=relaxed/simple;
	bh=yuNyo/2MR7p6Nj40k7IruL1gpNaVM6knfhPXm5uIzDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGr/P/OQpCklKh7p3txsvq7uKlNZwdYWT+m4nNEOblgWfGnM0943EbU+GXM8fQ5JhM72JBkEpa/I/r16wJYVcKqd30i4PKlK6OWnbogbyORGPfPoqUM0c0Bk0cBfaDykutxZZYlHTAAvr+JrFN1tpo4u6Mbw51RLrWLMWcCeD00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDp2qh2C; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDp2qh2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789384; x=1822325384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yuNyo/2MR7p6Nj40k7IruL1gpNaVM6knfhPXm5uIzDo=;
  b=iDp2qh2CS1b6kNoASoSn8BAznoOxC6kcbAO9D9ITRCXWVlmZ46zW0gPZ
   qt0/o6fCwEnAlfn3un9xKgb5Luj/dKyF5krIIz1suHYEMPsOQaQZiJkOK
   3zZrwCBLUdljwrL5kEdQUyNNjc52KIfU0D6G4c+2fHLF/AoHHqYYW6HfT
   xbuJvwOOWR0a9tpIMYMBv9sc/FGHAbFCL58/gO1ptg6sZz0CB6apgoG8K
   2sX8Xa85Q54SefXl7r53V0Oisgt22T1HmmtxIdS9sEQL7oOAadRMqhByW
   sBJWqqeGgP7+ZBBKpJ08kPkcIvWoCWvfTxFlv8BXKqbCDzkFtfyhZgLHS
   Q==;
X-CSE-ConnectionGUID: c6fLRbeCR8WiY+SnnhFb6w==
X-CSE-MsgGUID: FTooDprDTbanaQ6ibP8SJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91632068"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91632068"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:35 -0700
X-CSE-ConnectionGUID: nR+pWslXSKynkfq8ZXKMdg==
X-CSE-MsgGUID: zVfdTh9RQ1Kvwo8A/cbuEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="278959414"
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
Subject: [PATCH v3 09/20] platform/x86/intel/tpmi: Split out enumeration independent init and exit
Date: Wed, 30 Sep 2026 10:29:06 -0700
Message-ID: <20260930172918.743656-10-sathyanarayanan.kuppuswamy@linux.intel.com>
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

Once the two devices and the MMIO resources are known, the rest of what
the init path does is independent of how the TPMI instance was found.
Turn that part into intel_tpmi_init(), taking them as arguments, and add
intel_tpmi_deinit() for what removal has to undo. The auxiliary bus and
intel_vsec_device handling stays in tpmi_probe() and tpmi_remove().

intel_tpmi_info is allocated by the caller instead of by
intel_tpmi_init(), so that an enumeration method can embed it in its own
state and get back to that with container_of().

The TPMI_CORE_INIT and TPMI_CORE_EXIT notifications now pass the struct
device of the TPMI instance instead of its auxiliary device, so that the
generic code does not have to know about the auxiliary bus. No in tree
notifier callback looks at that argument and one that needs the
auxiliary device can use to_auxiliary_dev().

The driver data is set with dev_set_drvdata() on the same device that
auxiliary_set_drvdata() used, so tpmi_remove() still finds it.

No functional change.

Co-developed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/platform/x86/intel/vsec_tpmi.c | 48 +++++++++++++++-----------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index f96b94ba29f8..3274a24152ed 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -739,23 +739,18 @@ static int tpmi_fetch_pfs_header(struct intel_tpmi_pm_feature *pfs, u64 start, i
 
 #define TPMI_CAP_OFFSET_UNIT	1024
 
-static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
+static int intel_tpmi_init(struct intel_tpmi_info *tpmi_info, struct device *tpmi_dev,
+			   struct device *parent, struct resource *resource,
+			   int feature_count)
 {
-	struct intel_vsec_device *vsec_dev = auxdev_to_ivdev(auxdev);
-	struct pci_dev *pci_dev = dev_is_pci(vsec_dev->dev) ?
-				  to_pci_dev(vsec_dev->dev) : NULL;
-	struct intel_tpmi_info *tpmi_info;
+	struct pci_dev *pci_dev = dev_is_pci(parent) ? to_pci_dev(parent) : NULL;
 	u64 pfs_start = 0;
 	int ret, i;
 
-	tpmi_info = devm_kzalloc(&auxdev->dev, sizeof(*tpmi_info), GFP_KERNEL);
-	if (!tpmi_info)
-		return -ENOMEM;
-
-	tpmi_info->tpmi_dev = &auxdev->dev;
-	tpmi_info->parent = vsec_dev->dev;
-	tpmi_info->feature_count = vsec_dev->num_resources;
-	tpmi_info->resource = vsec_dev->resource;
+	tpmi_info->tpmi_dev = tpmi_dev;
+	tpmi_info->parent = parent;
+	tpmi_info->feature_count = feature_count;
+	tpmi_info->resource = resource;
 
 	/*
 	 * Seed the bus number from the enumerating device. It is only a
@@ -765,7 +760,7 @@ static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
 	if (pci_dev)
 		tpmi_info->plat_info.bus_number = pci_dev->bus->number;
 
-	tpmi_info->tpmi_features = devm_kcalloc(&auxdev->dev, tpmi_info->feature_count,
+	tpmi_info->tpmi_features = devm_kcalloc(tpmi_info->tpmi_dev, tpmi_info->feature_count,
 						sizeof(*tpmi_info->tpmi_features),
 						GFP_KERNEL);
 	if (!tpmi_info->tpmi_features)
@@ -827,7 +822,7 @@ static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
 
 	tpmi_info->pfs_start = pfs_start;
 
-	auxiliary_set_drvdata(auxdev, tpmi_info);
+	dev_set_drvdata(tpmi_info->tpmi_dev, tpmi_info);
 
 	/*
 	 * Allow debugfs when security policy allows. Everything this debugfs
@@ -844,24 +839,37 @@ static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
 		return ret;
 	}
 
-	blocking_notifier_call_chain(&tpmi_notify_list, TPMI_CORE_INIT, auxdev);
+	blocking_notifier_call_chain(&tpmi_notify_list, TPMI_CORE_INIT, tpmi_info->tpmi_dev);
 
 	return 0;
 }
 
+static void intel_tpmi_deinit(struct intel_tpmi_info *tpmi_info)
+{
+	blocking_notifier_call_chain(&tpmi_notify_list, TPMI_CORE_EXIT, tpmi_info->tpmi_dev);
+
+	debugfs_remove_recursive(tpmi_info->dbgfs_dir);
+}
+
 static int tpmi_probe(struct auxiliary_device *auxdev,
 		      const struct auxiliary_device_id *id)
 {
-	return intel_vsec_tpmi_init(auxdev);
+	struct intel_vsec_device *vsec_dev = auxdev_to_ivdev(auxdev);
+	struct intel_tpmi_info *tpmi_info;
+
+	tpmi_info = devm_kzalloc(&auxdev->dev, sizeof(*tpmi_info), GFP_KERNEL);
+	if (!tpmi_info)
+		return -ENOMEM;
+
+	return intel_tpmi_init(tpmi_info, &auxdev->dev, vsec_dev->dev,
+			       vsec_dev->resource, vsec_dev->num_resources);
 }
 
 static void tpmi_remove(struct auxiliary_device *auxdev)
 {
 	struct intel_tpmi_info *tpmi_info = auxiliary_get_drvdata(auxdev);
 
-	blocking_notifier_call_chain(&tpmi_notify_list, TPMI_CORE_EXIT, auxdev);
-
-	debugfs_remove_recursive(tpmi_info->dbgfs_dir);
+	intel_tpmi_deinit(tpmi_info);
 }
 
 static const struct auxiliary_device_id tpmi_id_table[] = {
-- 
2.43.0

