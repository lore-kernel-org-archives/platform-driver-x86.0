Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6452C541E78;
	Tue, 13 Oct 2026 19:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919812; cv=none; b=aeUkKSBBX4Wa+fsLpfYtWW9r6qARrwyKugnYYvKRwme3uVup+I5lGPISikS5RgEIYOQCP/GBWW/kqKAVIVSOtu9jKuxk7mYjmzyKEOVNoDUGvC+WbhGMJYalJow4YuWPqf20Ot+ZUefUDo4AolQXUGjpHFQiTB22VklbYPoUQ04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919812; c=relaxed/simple;
	bh=meu63+OCcj7UxvE6xY3+jisH59b21xOu3ZKtLDkb1Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EqwVa5Yw+5wN8ViyD263FIMDium/goUbnHvRsk5JvW6hajpqKCvRir/DsKl0kbdCFxJ21arCeGTsAQ9VdFadUyEsRnDQV/F+Z2rGf69rzOfhTKodNX5EWMfK/YHXoIPku7P6TLrD+L94ombtIU8lciJs9KFRqj2DgCx32Z5poYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaxLcDIo; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaxLcDIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919800; x=1823455800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=meu63+OCcj7UxvE6xY3+jisH59b21xOu3ZKtLDkb1Bw=;
  b=ZaxLcDIoUMpoEqg2+hlcKKkwVnO5Pap3VfPO3sAGrO5abUIYF6NgcBXJ
   gjpAcGXnCgAIsNihzYjx2kB72P1mRPsHSjYXzyrMzR91emkH6AjFrV6Fu
   iuqw3GXwn+yhOfqUm1AfnUFQ1vIFN4SuEmTuC0LIuyeDJOmFURpgJ6ioV
   9YxmIvsTFbZ57bAsbkhYncRzFYUtxVbkk9vsV35Hq7vJliAuyyYKmccMK
   qKJvL+OMVTR4LjFO+cu9ZzJB4uUs7j/RlNQ7E0PtTAY9Z/E5udfyo7Luk
   KVLqI34ctDymXZP+yMCpNRTGhev+CVzThKuYhAhH9QFXNX23N1GrN+amW
   A==;
X-CSE-ConnectionGUID: Jjji8flIQbyECHWj+jDycQ==
X-CSE-MsgGUID: dxkeQFOCTlqgPIlHFyKXgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544124"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544124"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
X-CSE-ConnectionGUID: bfxS4C4ZRV2ULOnt1pxErw==
X-CSE-MsgGUID: bqzn7iFwTS2tgkBcHmTyPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167679"
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
Subject: [PATCH v5 08/20] platform/x86/intel/tpmi: Do not assume TPMI is enumerated from PCI
Date: Tue, 13 Oct 2026 12:29:23 -0700
Message-ID: <20261013192935.2243291-9-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
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

