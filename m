Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF678541E60;
	Tue, 13 Oct 2026 19:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919804; cv=none; b=M4KijVhBczVUDM2SmVq1YHf5lai6JZ3/AwLs93pp2Iy+VFHljH4CRosoZmaRZPjTWfrLgCOH1G01VtZikVOL8/Kppi3rH/7ZQY0MqdFYBZG9v1iGY9WjrT17/6mslZPMcz7eMqTAVqiSy5/hQsvJ6PAO8jIzlfajWQcgT+UqvNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919804; c=relaxed/simple;
	bh=+iCdBjG/0jxqiJt+dlbgWZCqV/vV6THx17hHV0RBLW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuoAO+4KqhkPrInmqh+obTIe5CO/Y6EZxeJNEbDGuXdtKzNMVzxpx2eMDM38x4gjYd4W8O5bHm5s0+60edyun/oUKz9jnvlp4f7tXjlm1rb5DswIrevXMSF2r57UfnTuje303ZqshrYoeQlDN8QqO+yfweWwaCHNbvMGF2VpNEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lzk+VY/y; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lzk+VY/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919801; x=1823455801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+iCdBjG/0jxqiJt+dlbgWZCqV/vV6THx17hHV0RBLW8=;
  b=lzk+VY/y29YYp0Bf5UhkAdGYhe6LwdWLu5IHkMk6/nEN0hyDoNmH5WOI
   h9mCo4D1wo6QVgPWaHi44s7Bl6izEZQoCRVz615wgBjSr8W5UdBL8Bj0a
   BcRuLq3dZnNzb9MxKBY/EwCoxscZunZZYABTnh7pIhxxkShltSrv+zEFV
   3R+JGTZ9wZgI3/AzxJonKlaQDLsTnxIUuSNkmaX91HVv0N25Zbmfk/SD9
   Z8Wn9nUBkVXjoCTYYHvnD0aAaYJrH2EOgb2UoI4CeM72vHLkerg631wjZ
   ECdIJsKFoOiYq5rh2VXP3wPZ84GbV9hzPJEwW42Rr3ZZRx0wPbMA+bk0D
   Q==;
X-CSE-ConnectionGUID: qFgLOmY+SV6kxxzLjDkILw==
X-CSE-MsgGUID: JJ+IKjVuRkCO1bMkwLMjxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544125"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544125"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
X-CSE-ConnectionGUID: piJXs02pSIOHvxz2u/H23w==
X-CSE-MsgGUID: RwmKwFUfSyOx5FaFZIrVRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167682"
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
Subject: [PATCH v5 09/20] platform/x86/intel/tpmi: Split out enumeration independent init and exit
Date: Tue, 13 Oct 2026 12:29:24 -0700
Message-ID: <20261013192935.2243291-10-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
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

