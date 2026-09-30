Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5596751CF7C;
	Wed, 30 Sep 2026 17:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789384; cv=none; b=F/SbOr2SU3B8kP50NupyfOSqCF9jHsTbs5dvQ5QL2tsILyRTrFiKiRLdWIGmIj6dBDrqfYUwwjtF0z++JODdTmx0jz2RoaOc0f+gCbfUA+XC9g77S9cp04jyU7Vcb/5tcsCcjKQi7XxGTG2RVJ8RHrGSeB4TcTmexDmZe6gU1WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789384; c=relaxed/simple;
	bh=XNY5cqhovtfO0VevlMS7pV1QbAxZrJbMrLg0DPVdyog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o9Hg5eeoMzIjSFiZY+0PP5UYCX45UA18emppCzJIVRGCYJdj6URDdxPisFUZeQmD8dalRWXmnONDTNfi6EQMOqZeoxDof7bzQdgRw9GiLJ4ekFvtiec16ANyWreM4exOszlvvLGUsCthg3Gt4eLvscmTYbRTlSDQEGHU3N1aIrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGYJIlBb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGYJIlBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789383; x=1822325383;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XNY5cqhovtfO0VevlMS7pV1QbAxZrJbMrLg0DPVdyog=;
  b=fGYJIlBbhlb4bJ/xrJO3s+4R31aAc9l9WAQtI+CdvqlYwd/B67XDKc8R
   PrMUQPNFAaGj8acP+iMnxbCFYBGe9Nhw3Tx64xvdCC0HYkBdoHDXWAa7w
   TjHTMNiNq7cn3mwURzBY+FqVKkVXKOAqdSfaPMXRbeOLPG3ZjxscBHy4S
   8eQw+NmdwO+9jz5erC8HcpCjvOB1VT72DY6oh7WymRJ1n6Z/HeTAgLYKa
   kMrRetQOxvP7v62RfWtK9q9oTX+/AXeJF6dcch/tVGvHNsEdRNQg9d8eD
   Pusc7Y/9FkjPuMaYnzjNO5ixqhw7OBPOzzMHEp+0HGNRXFTDF1Cs2cO6C
   A==;
X-CSE-ConnectionGUID: nWzqh1CeTi+TOWQ+Ow2J/g==
X-CSE-MsgGUID: s72fzVnxQ2SEr0DTjkX75A==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91632066"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91632066"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:35 -0700
X-CSE-ConnectionGUID: Tocx2r6GQuWvlaYmzCKPGQ==
X-CSE-MsgGUID: WKXlXTcNTy67dqwsDbWshA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="278959411"
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
Subject: [PATCH v3 08/20] platform/x86/intel/tpmi: Do not assume TPMI is enumerated from PCI
Date: Wed, 30 Sep 2026 10:29:05 -0700
Message-ID: <20260930172918.743656-9-sathyanarayanan.kuppuswamy@linux.intel.com>
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

