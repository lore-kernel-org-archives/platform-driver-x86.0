Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tx0dKP7K"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90457BD;
	Wed, 29 Nov 2023 14:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701296499; x=1732832499;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=pE3sub0j+/JrDbkd6ddVl6W0ILnvFOW3qKEc09tjz0w=;
  b=Tx0dKP7KkB2ZOvlefKh5ECao2OxG5NQHQ33TYcjMt6qkgg2NqePv0yxl
   lhPyDtlznobP8cEXbR6aDJ2zH2W5ABSfYk4PoP7sfduM+oYKK5CiNImrc
   J6xCkhPTKPxFpWE4YRa8kTFnptJk7Eic2ilQ5x9OW/SX1eXpTMzD+O2Ud
   exmmsQQWTExcSyRdFdGlX8+GNr0FdfMK05m3I8Yuo/rz87BL2Y+MLA/Ea
   007q4Zvr7tZzlPgLzDbI3aDULObl26h80JusamsDM3rYme6eEMb24Tj4D
   oMQeZI+0xr91UhT8ZJlWYhGwRf0rhm9RUSs7EJeb0NF/70wO2mXObvcsQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11937002"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="11937002"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798070413"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="798070413"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 14:21:33 -0800
Received: from debox1-desk4.lan (unknown [10.209.108.167])
	by linux.intel.com (Postfix) with ESMTP id 2FA445807E2;
	Wed, 29 Nov 2023 14:21:33 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V6 04/20] platform/x86/intel/vsec: remove platform_info from vsec device structure
Date: Wed, 29 Nov 2023 14:21:16 -0800
Message-Id: <20231129222132.2331261-5-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129222132.2331261-1-david.e.box@linux.intel.com>
References: <20231129222132.2331261-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for exporting an API to register Intel Vendor Specific
Extended Capabilities (VSEC) from other drivers, remove the pointer to
platform_info from intel_vsec_device. This prevents a potential page fault
when auxiliary drivers probe and attempt to dereference this pointer to
access the needed quirks field. Instead, just add the quirks to
intel_vsec_device.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
V6 - No change

V5 - No change

V4 - No change

V3 - No change

V2 - New patch splitting previous PATCH 1

 drivers/platform/x86/intel/pmt/class.c | 2 +-
 drivers/platform/x86/intel/vsec.c      | 2 +-
 drivers/platform/x86/intel/vsec.h      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index f32a233470de..2ad91d2fd954 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -31,7 +31,7 @@ bool intel_pmt_is_early_client_hw(struct device *dev)
 	 * differences from the server platforms (which use the Out Of Band
 	 * Management Services Module OOBMSM).
 	 */
-	return !!(ivdev->info->quirks & VSEC_QUIRK_EARLY_HW);
+	return !!(ivdev->quirks & VSEC_QUIRK_EARLY_HW);
 }
 EXPORT_SYMBOL_NS_GPL(intel_pmt_is_early_client_hw, INTEL_PMT);
 
diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index c83e2c549fc7..ba352af65dde 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -193,7 +193,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
 	intel_vsec_dev->pcidev = pdev;
 	intel_vsec_dev->resource = res;
 	intel_vsec_dev->num_resources = header->num_entries;
-	intel_vsec_dev->info = info;
+	intel_vsec_dev->quirks = info->quirks;
 
 	if (header->id == VSEC_ID_SDSI)
 		intel_vsec_dev->ida = &intel_vsec_sdsi_ida;
diff --git a/drivers/platform/x86/intel/vsec.h b/drivers/platform/x86/intel/vsec.h
index c242c07ea69c..8b9fad170503 100644
--- a/drivers/platform/x86/intel/vsec.h
+++ b/drivers/platform/x86/intel/vsec.h
@@ -79,11 +79,11 @@ struct intel_vsec_device {
 	struct pci_dev *pcidev;
 	struct resource *resource;
 	struct ida *ida;
-	struct intel_vsec_platform_info *info;
 	int num_resources;
 	int id; /* xa */
 	void *priv_data;
 	size_t priv_data_size;
+	unsigned long quirks;
 };
 
 int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
-- 
2.34.1

