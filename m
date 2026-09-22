Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E511485508;
	Tue, 22 Sep 2026 18:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102003; cv=none; b=VlV//na3/KMgD6wtgjFsdGtnU7qp/tba4SUWI/AqXBeH5/R2802ncp2JiuNMqivDOntGunaFAHcAZtCAjvxbDCyagHmZmUJCGV9YChR2fU35N/KTFCvcEBKnrxjBrOK0fOLlWakAlmdg5vviFtlRfC43eKHwehYcSvUFAfMq3GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102003; c=relaxed/simple;
	bh=yqnHQFFgG9HGV9s3Z+hWtHclzLx1oyNWvpKhmIRKOEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZE7CltqxB5wycL+J62yN6MezFhSmu2eIvIKmVBcHl0cWkob9Y8c0nUc/PgE8/dc3KfAFFrRFGe9JsR2bG6ERqmK6/cCgyrpCoHkxXPxiUrG4f3Y/snlHG9bsDIk4GwZVGLMS8m5sG6JNdBlUbmBxFc8GHBGfVyiJaTSBiNKZ9DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gp3cOVJR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gp3cOVJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790102000; x=1821638000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yqnHQFFgG9HGV9s3Z+hWtHclzLx1oyNWvpKhmIRKOEY=;
  b=Gp3cOVJRZXCLY4iHIDiGa8Rk83ok30blcRI/za5RsG+c7ERE7ak/WCDn
   WONIjutriBMJ63AAIE3v1yw57ZBDQKy8eTH8X1on6chDlrnHexaB89xcT
   UIqwfvAPmPpFWMatq296jdubcdLk2A+0KbFxdwPdUZnrgE52lOA/55j7Z
   IrKnsuEbxO+gXWvF+8ukNsX7/EHrI6+i2glt5YyKBJZZtSUfLxn6YoQyG
   ZCj09pEMBTZkroXdt6lVkC8QqJ4LgWqcHeIrMm7gPMbufvBqdWEZ42twc
   8gy/y05qmsAisj7hsuI8RrIIUErevrJWPJYLe+COmfOrJ/n7rytK55V8H
   A==;
X-CSE-ConnectionGUID: fXitUszeSyqwgjpoq5OX3g==
X-CSE-MsgGUID: 1Qyfrw6iQQefgNN9xknXmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94564895"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="94564895"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 11:33:16 -0700
X-CSE-ConnectionGUID: eIT8MmkoRJyTtX8HEuGUeA==
X-CSE-MsgGUID: sr9/g0XASNKbnTMXCY7ESw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="271827982"
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
Subject: [PATCH v1 06/10] platform/x86/intel/tpmi: Describe a TPMI instance by its two devices
Date: Tue, 22 Sep 2026 11:33:07 -0700
Message-ID: <20260922183311.3783010-7-sathyanarayanan.kuppuswamy@linux.intel.com>
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

The intel_vsec_device pointer in intel_tpmi_info is by now only used to
reach two devices, the device the TPMI driver is bound to and the device
TPMI was enumerated from. Store those two directly and call them tpmi_dev
and parent.

The devm allocations, the driver data and the TPMI feature devices all
hang off tpmi_dev. The parent device names the debugfs directory, is
recorded in every TPMI feature device so that the enumerating bus can
find those devices again during PCI error recovery, and is the device
intel_vsec_set_mapping() registers the mapping for.

Both are assigned once during init and used everywhere below it, so
intel_tpmi_info no longer refers to an intel_vsec_device. tpmi_to_dev()
went away with its only user.

There is no functional change, tpmi_dev is &auxdev->dev and parent is
vsec_dev->dev, which is what the affected call sites used before.

Co-developed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/platform/x86/intel/vsec_tpmi.c | 29 ++++++++++++++++----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index b462fd0319e5..f3cd8aa30af0 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -104,25 +104,33 @@ struct intel_tpmi_pm_feature {
 /**
  * struct intel_tpmi_info - TPMI information for all IDs in an instance
  * @tpmi_features:	Pointer to a list of TPMI feature instances
- * @vsec_dev:		Pointer to intel_vsec_device structure for this TPMI device
  * @feature_count:	Number of TPMI of TPMI instances pointed by tpmi_features
  * @pfs_start:		Start of PFS offset for the TPMI instances in this device
  * @plat_info:		Stores platform info which can be used by the client drivers
  * @tpmi_control_mem:	Memory mapped IO for getting control information
  * @dbgfs_dir:		debugfs entry pointer
  * @resource:		Array of feature_count MMIO resources, one per PFS entry
+ * @tpmi_dev:		Device this TPMI instance is bound to. It backs the devm
+ *			allocations, holds this structure as its driver data and
+ *			the TPMI feature devices are created under it.
+ * @parent:		Device this TPMI instance was enumerated from. It names
+ *			the debugfs directory and becomes intel_vsec_device::dev
+ *			of every TPMI feature device, so that the enumerating bus
+ *			can find them again, for example during PCI error
+ *			recovery.
  *
  * Stores the information for all TPMI devices enumerated from a single PCI device.
  */
 struct intel_tpmi_info {
 	struct intel_tpmi_pm_feature *tpmi_features;
-	struct intel_vsec_device *vsec_dev;
 	int feature_count;
 	u64 pfs_start;
 	struct oobmsm_plat_info plat_info;
 	void __iomem *tpmi_control_mem;
 	struct dentry *dbgfs_dir;
 	struct resource *resource;
+	struct device *tpmi_dev;
+	struct device *parent;
 };
 
 /**
@@ -534,14 +542,12 @@ static const struct file_operations mem_write_ops = {
 	.release        = single_release,
 };
 
-#define tpmi_to_dev(info)	((info)->vsec_dev->dev)
-
 static void tpmi_dbgfs_register(struct intel_tpmi_info *tpmi_info)
 {
 	char name[64];
 	int i;
 
-	snprintf(name, sizeof(name), "tpmi-%s", dev_name(tpmi_to_dev(tpmi_info)));
+	snprintf(name, sizeof(name), "tpmi-%s", dev_name(tpmi_info->parent));
 	tpmi_info->dbgfs_dir = debugfs_create_dir(name, NULL);
 
 	debugfs_create_file("pfs_dump", 0444, tpmi_info->dbgfs_dir, tpmi_info, &tpmi_pfs_dbg_fops);
@@ -570,7 +576,7 @@ static void tpmi_set_control_base(struct auxiliary_device *auxdev,
 	if (!size)
 		return;
 
-	mem = devm_ioremap(&auxdev->dev, pfs->vsec_offset, size);
+	mem = devm_ioremap(tpmi_info->tpmi_dev, pfs->vsec_offset, size);
 	if (!mem)
 		return;
 
@@ -602,7 +608,6 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 			      struct intel_tpmi_pm_feature *pfs,
 			      u64 pfs_start)
 {
-	struct intel_vsec_device *vsec_dev = tpmi_info->vsec_dev;
 	struct intel_vsec_device *feature_vsec_dev;
 	struct tpmi_feature_state feature_state;
 	struct resource *res, *tmp;
@@ -639,7 +644,7 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 		tmp->flags = IORESOURCE_MEM;
 	}
 
-	feature_vsec_dev->dev = vsec_dev->dev;
+	feature_vsec_dev->dev = tpmi_info->parent;
 	feature_vsec_dev->priv_data = &tpmi_info->plat_info;
 	feature_vsec_dev->priv_data_size = sizeof(tpmi_info->plat_info);
 	feature_vsec_dev->ida = &intel_vsec_tpmi_ida;
@@ -653,7 +658,7 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 	 * "name" must outlive the auxiliary device, as the auxiliary bus
 	 * stores the pointer rather than a copy of the string.
 	 */
-	return intel_vsec_add_aux(&vsec_dev->auxdev.dev, feature_vsec_dev, name);
+	return intel_vsec_add_aux(tpmi_info->tpmi_dev, feature_vsec_dev, name);
 }
 
 static int tpmi_create_devices(struct intel_tpmi_info *tpmi_info)
@@ -747,7 +752,8 @@ static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
 	if (!tpmi_info)
 		return -ENOMEM;
 
-	tpmi_info->vsec_dev = vsec_dev;
+	tpmi_info->tpmi_dev = &auxdev->dev;
+	tpmi_info->parent = vsec_dev->dev;
 	tpmi_info->feature_count = vsec_dev->num_resources;
 	tpmi_info->resource = vsec_dev->resource;
 	tpmi_info->plat_info.bus_number = pci_dev->bus->number;
@@ -796,7 +802,8 @@ static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
 			if (ret)
 				return ret;
 
-			ret = intel_vsec_set_mapping(&tpmi_info->plat_info, vsec_dev->dev);
+			ret = intel_vsec_set_mapping(&tpmi_info->plat_info,
+						     tpmi_info->parent);
 			if (ret)
 				return ret;
 		}
-- 
2.43.0

