Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3C3X4Uj"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C18D53;
	Wed, 22 Nov 2023 20:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700712241; x=1732248241;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ilib+HKkR16/IbKWtlF3aubqsDmVX+0287LGL6KHb8w=;
  b=B3C3X4UjXwdMzrGKT8NYyrAxXkmEfEJByAUMcfsa4AR/htLUVx4QYkyB
   Mr0xYcFKNTG5HjrJb5WnpvLl5cRfWT7tJrFxFOt/G77MBLLl6GIAilV0+
   q0HEmXUY1B+VMGpQ8H92ivjihaQA34YpK8U22zM/mnGmd0WD5GP3h5P6c
   b+kZkQkC8Hx4lOi6KQvdwr8vRovtagj4W0DUosMTg+NQnyGY9WkNxI4Eg
   28mkAi/+qqfWCHnhIJWF2JBxyzTxfeYuBZ9vMsQQUJcg6uGJACdk9+2xw
   TsiJFV8TBHq46AhYenma6dfzm9Ko1NMb3u4Z9TzfgJbHK36+1DkKoY+Pu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="389347954"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="389347954"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="801925663"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="801925663"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:57 -0800
Received: from debox1-desk4.lan (snpatel1-mobl.amr.corp.intel.com [10.209.89.91])
	by linux.intel.com (Postfix) with ESMTP id C475F580CA4;
	Wed, 22 Nov 2023 20:03:57 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V5 20/20] platform/x86/intel/pmc: Show Die C6 counter on Meteor Lake
Date: Wed, 22 Nov 2023 20:03:55 -0800
Message-Id: <20231123040355.82139-21-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123040355.82139-1-david.e.box@linux.intel.com>
References: <20231123040355.82139-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Expose the Die C6 counter on Meteor Lake.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
V5 - no change

V4 - no change

V3 - Split PATCH V2 13. Separates implementation (previous patch)
     from platform specific use (this patch)

 drivers/platform/x86/intel/pmc/mtl.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
index 7ceeae507f4c..38c2f946ec23 100644
--- a/drivers/platform/x86/intel/pmc/mtl.c
+++ b/drivers/platform/x86/intel/pmc/mtl.c
@@ -10,12 +10,17 @@
 
 #include <linux/pci.h>
 #include "core.h"
+#include "../pmt/telemetry.h"
 
 /* PMC SSRAM PMT Telemetry GUIDS */
 #define SOCP_LPM_REQ_GUID	0x2625030
 #define IOEM_LPM_REQ_GUID	0x4357464
 #define IOEP_LPM_REQ_GUID	0x5077612
 
+/* Die C6 from PUNIT telemetry */
+#define MTL_PMT_DMU_DIE_C6_OFFSET	15
+#define MTL_PMT_DMU_GUID		0x1A067102
+
 static const u8 MTL_LPM_REG_INDEX[] = {0, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 20};
 
 /*
@@ -968,6 +973,32 @@ static struct pmc_info mtl_pmc_info_list[] = {
 	{}
 };
 
+static void mtl_punit_pmt_init(struct pmc_dev *pmcdev)
+{
+	struct telem_endpoint *ep;
+	struct pci_dev *pcidev;
+
+	pcidev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(10, 0));
+	if (!pcidev) {
+		dev_err(&pmcdev->pdev->dev, "PUNIT PMT device not found.\n");
+		return;
+	}
+
+	ep = pmt_telem_find_and_register_endpoint(pcidev, MTL_PMT_DMU_GUID, 0);
+	if (IS_ERR(ep)) {
+		dev_err(&pmcdev->pdev->dev,
+			"pmc_core: couldn't get DMU telem endpoint, %ld\n",
+			PTR_ERR(ep));
+		return;
+	}
+
+	pci_dev_put(pcidev);
+	pmcdev->punit_ep = ep;
+
+	pmcdev->has_die_c6 = true;
+	pmcdev->die_c6_offset = MTL_PMT_DMU_DIE_C6_OFFSET;
+}
+
 #define MTL_GNA_PCI_DEV	0x7e4c
 #define MTL_IPU_PCI_DEV	0x7d19
 #define MTL_VPU_PCI_DEV	0x7d1d
@@ -1032,6 +1063,7 @@ int mtl_core_init(struct pmc_dev *pmcdev)
 	}
 
 	pmc_core_get_low_power_modes(pmcdev);
+	mtl_punit_pmt_init(pmcdev);
 
 	/* Due to a hardware limitation, the GBE LTR blocks PC10
 	 * when a cable is attached. Tell the PMC to ignore it.
-- 
2.34.1

