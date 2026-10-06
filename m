Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90F54A689D;
	Tue,  6 Oct 2026 18:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311462; cv=none; b=cu9fpec5jH3fZrIxQoxY4AI0VVl5bJ7k2WRrD5N+D09a+c/Xv20ri6r2HqtZfl7LSxiukbw1Ay/lTHZfNgPHAqUE8pZVCDXlWnEo+bzOqLaH+jiNh960QipETh542CYosc8lRO9ynzpm6d099rxw0iO4/Y89o9Zp5nH55CGu/EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311462; c=relaxed/simple;
	bh=meu63+OCcj7UxvE6xY3+jisH59b21xOu3ZKtLDkb1Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HqmGGt1s9504+EUwUdJoc+kksPIA2O+lgVsKD1Trh/L3pGWmGbrfYHv3NGm165q46avy3fl0PODq+A2NHXZj/JIQTV7ylk0zghmgG3EEDvwvctchhIpJpEwFzM/N/f1qcxeAwMbqTWpmWQc6AK81AV+vfHtm0/wo5/R9tfE/Ij0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4TBYFj3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4TBYFj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791311460; x=1822847460;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=meu63+OCcj7UxvE6xY3+jisH59b21xOu3ZKtLDkb1Bw=;
  b=H4TBYFj3DhpXAGggmfW2HJ2UpQbAwWoZCYle9AvOYvPSW3TEPRp/NV/7
   36HoHhNSF3XUV4FR9p9ZmvARANMv2tixomV0VYdPdHZya5Aq9bYxxmWD8
   GNcV7dr60FRIPoF2vQnOs3E9T/L361jP8XS8GYHz+7QlGEf5pTYSObP7F
   kZldbmSp4C7xNFO4utJVg05Qh5jXlI8pYuUj1dGaM+ETHMjUUSQqHTnwb
   CGzyiIHBndItUCOLQOjuxC55vQB1W0q/QUMXkEPhqes2li5h+hA59VD+C
   SSoRW9tqD1I0MRSheOnOD1itTjDueQSDvic6ObUgsIje/PnFj/nz1ksoD
   w==;
X-CSE-ConnectionGUID: UAlfG03RRDOApFxbdDW40g==
X-CSE-MsgGUID: Wva1gFP5RCqieslM0hBpTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102591602"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102591602"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:56 -0700
X-CSE-ConnectionGUID: NbUcEwJXRaeAC/tJpNPUUg==
X-CSE-MsgGUID: ODOCrMmnTIWwF7qBBAdtWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303500267"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:56 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/20] platform/x86/intel/tpmi: Do not assume TPMI is enumerated from PCI
Date: Tue,  6 Oct 2026 11:30:25 -0700
Message-ID: <20261006183037.1507007-9-sathyanarayanan.kuppuswamy@linux.intel.com>
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

