Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1Xd9sxq"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547F3199;
	Wed, 22 Nov 2023 20:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700712241; x=1732248241;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Z3p3UWIyAsUJ7mfjtSoREKDWtysTZ+Ybom6HJpBjVaw=;
  b=N1Xd9sxqLuJjTaYPlUcXWlPFspX6zH//E44UjIjJli2wlN1jwpzvE34M
   3JIuOLjyMvbvwAnhs5RxzFdtzynXFyRrrqV3HP/XdOUArzRC2yEkXdGpg
   BjBon/9Ooze6JDaFV19o6t0br8umDF59jX7BtGGaAKI0RPRd4lp82gKe4
   F6QtA1pxrfT745H5TTNh0e4me3uSmigyXSu8GBfJLi+sSNe0Bf/Ho+6RW
   60RZ88XEGDP5RrFqQkfZugd1rrlgiIpKCgis8u7k0te3ng33EdDcaqUx7
   oyeJFejhBs8D+938b4KkEgAPMWahAYcwWTGTDTl2PMFzt5L6rxVA+ts32
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="389347953"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="389347953"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="801925661"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="801925661"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:57 -0800
Received: from debox1-desk4.lan (snpatel1-mobl.amr.corp.intel.com [10.209.89.91])
	by linux.intel.com (Postfix) with ESMTP id 8BC45580CA4;
	Wed, 22 Nov 2023 20:03:57 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V5 18/20] platform/x86/intel/pmc: Read low power mode requirements for MTL-M and MTL-P
Date: Wed, 22 Nov 2023 20:03:53 -0800
Message-Id: <20231123040355.82139-19-david.e.box@linux.intel.com>
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

From: Xi Pardee <xi.pardee@intel.com>

Add support to read the low power mode requirements for Meteor Lake M and
Meteor Lake P.

Signed-off-by: Xi Pardee <xi.pardee@intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
V5 - no change

V4 - no change

V3 - directly return value from pmc_core_ssram_get_lpm_reqs()

V2 - fixed unused return value

 drivers/platform/x86/intel/pmc/mtl.c | 39 +++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
index d1d3d33fb4b8..7ceeae507f4c 100644
--- a/drivers/platform/x86/intel/pmc/mtl.c
+++ b/drivers/platform/x86/intel/pmc/mtl.c
@@ -11,6 +11,13 @@
 #include <linux/pci.h>
 #include "core.h"
 
+/* PMC SSRAM PMT Telemetry GUIDS */
+#define SOCP_LPM_REQ_GUID	0x2625030
+#define IOEM_LPM_REQ_GUID	0x4357464
+#define IOEP_LPM_REQ_GUID	0x5077612
+
+static const u8 MTL_LPM_REG_INDEX[] = {0, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 20};
+
 /*
  * Die Mapping to Product.
  * Product SOCDie IOEDie PCHDie
@@ -465,6 +472,7 @@ const struct pmc_reg_map mtl_socm_reg_map = {
 	.lpm_sts = mtl_socm_lpm_maps,
 	.lpm_status_offset = MTL_LPM_STATUS_OFFSET,
 	.lpm_live_status_offset = MTL_LPM_LIVE_STATUS_OFFSET,
+	.lpm_reg_index = MTL_LPM_REG_INDEX,
 };
 
 const struct pmc_bit_map mtl_ioep_pfear_map[] = {
@@ -782,6 +790,13 @@ const struct pmc_reg_map mtl_ioep_reg_map = {
 	.ltr_show_sts = mtl_ioep_ltr_show_map,
 	.ltr_ignore_offset = CNP_PMC_LTR_IGNORE_OFFSET,
 	.ltr_ignore_max = ADL_NUM_IP_IGN_ALLOWED,
+	.lpm_num_maps = ADL_LPM_NUM_MAPS,
+	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
+	.lpm_residency_offset = MTL_LPM_RESIDENCY_OFFSET,
+	.lpm_priority_offset = MTL_LPM_PRI_OFFSET,
+	.lpm_en_offset = MTL_LPM_EN_OFFSET,
+	.lpm_sts_latch_en_offset = MTL_LPM_STATUS_LATCH_EN_OFFSET,
+	.lpm_reg_index = MTL_LPM_REG_INDEX,
 };
 
 const struct pmc_bit_map mtl_ioem_pfear_map[] = {
@@ -922,6 +937,13 @@ const struct pmc_reg_map mtl_ioem_reg_map = {
 	.ltr_show_sts = mtl_ioep_ltr_show_map,
 	.ltr_ignore_offset = CNP_PMC_LTR_IGNORE_OFFSET,
 	.ltr_ignore_max = ADL_NUM_IP_IGN_ALLOWED,
+	.lpm_sts_latch_en_offset = MTL_LPM_STATUS_LATCH_EN_OFFSET,
+	.lpm_num_maps = ADL_LPM_NUM_MAPS,
+	.lpm_priority_offset = MTL_LPM_PRI_OFFSET,
+	.lpm_en_offset = MTL_LPM_EN_OFFSET,
+	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
+	.lpm_residency_offset = MTL_LPM_RESIDENCY_OFFSET,
+	.lpm_reg_index = MTL_LPM_REG_INDEX,
 };
 
 #define PMC_DEVID_SOCM	0x7e7f
@@ -929,16 +951,19 @@ const struct pmc_reg_map mtl_ioem_reg_map = {
 #define PMC_DEVID_IOEM	0x7ebf
 static struct pmc_info mtl_pmc_info_list[] = {
 	{
-		.devid = PMC_DEVID_SOCM,
-		.map = &mtl_socm_reg_map,
+		.guid	= SOCP_LPM_REQ_GUID,
+		.devid	= PMC_DEVID_SOCM,
+		.map	= &mtl_socm_reg_map,
 	},
 	{
-		.devid = PMC_DEVID_IOEP,
-		.map = &mtl_ioep_reg_map,
+		.guid	= IOEP_LPM_REQ_GUID,
+		.devid	= PMC_DEVID_IOEP,
+		.map	= &mtl_ioep_reg_map,
 	},
 	{
-		.devid = PMC_DEVID_IOEM,
-		.map = &mtl_ioem_reg_map
+		.guid	= IOEM_LPM_REQ_GUID,
+		.devid	= PMC_DEVID_IOEM,
+		.map	= &mtl_ioem_reg_map
 	},
 	{}
 };
@@ -1014,5 +1039,5 @@ int mtl_core_init(struct pmc_dev *pmcdev)
 	dev_dbg(&pmcdev->pdev->dev, "ignoring GBE LTR\n");
 	pmc_core_send_ltr_ignore(pmcdev, 3);
 
-	return 0;
+	return pmc_core_ssram_get_lpm_reqs(pmcdev);
 }
-- 
2.34.1

