Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACD04A8A13;
	Thu, 24 Sep 2026 18:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274245; cv=none; b=l3wvi00fE+4MAksZE+CjNiZ2SrcSS2RY5NaCqikBKitM6pEkvCn91XI05A/EiClBRt5KrH42Zg2DQtmR8sWd+Xp6DOEJ7UhwV/+TKjA1D7wcUD+SbPMSH+zLMw9/ObsNcCQnijXhe/j9N60ck1TVQwpXxHu9Pf2F5T7SFQI0CxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274245; c=relaxed/simple;
	bh=yqnHQFFgG9HGV9s3Z+hWtHclzLx1oyNWvpKhmIRKOEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jmfy0ZdhdU9UCQ9YkDO7QSujxC1QDC3Ymg+V950WQx2jyMkETSBfA2tZ5a2owqOu+an72Ie8pwBKpKfJWVUa9/z6o6OEG/9uLmRfD3F1EIfHEfxPFzWyqGo3+pfkuIiHbGc3lcD7pw+Va9UIN2IEeKJ8FyFKhjUXA0tXzvb5ok8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edfWLORx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edfWLORx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274243; x=1821810243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yqnHQFFgG9HGV9s3Z+hWtHclzLx1oyNWvpKhmIRKOEY=;
  b=edfWLORxrXiCp/oOPVwtSd2HwL/YPp1Jp0Qdk1k43OwMehl9nJuwx8gX
   xw2WXnzd/xQv3tLb/N6ctsmUzahRMpK3FVr82QiW+IKrfDtzaGJ1N9tRQ
   2pw7ii3DTIvzyRHv7G23zDBfVlwNtHYFnwdlm4/sLVd8rheeL5QjCkUVW
   uS83nqPXiNTdaEN63PR1TSCQ7LwRsp+5JBVCKaRqVVBpboXfVNUgoetxs
   yitoaVRoLF42UPxUY08VR8bMIDu0JLSS6YNBqL2cOXT+sUUdGTpvyjPgf
   j/mRSgMvUwTiCT1/ewselPHqOHslub9OdGFR/jFPWuaEbA6hOV2+ZRaE2
   Q==;
X-CSE-ConnectionGUID: GZdqkzJ5T2aymNldpgezWw==
X-CSE-MsgGUID: u144ptZeTQKJ/d0k75Q0rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164266"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164266"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
X-CSE-ConnectionGUID: T1g1/z4TQ6m0OkbX2uIyaA==
X-CSE-MsgGUID: FUpmXLW+TBCBx5RVxPiGTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229925"
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
Subject: [PATCH v2 06/19] platform/x86/intel/tpmi: Describe a TPMI instance by its two devices
Date: Thu, 24 Sep 2026 11:23:28 -0700
Message-ID: <20260924182342.212709-7-sathyanarayanan.kuppuswamy@linux.intel.com>
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

