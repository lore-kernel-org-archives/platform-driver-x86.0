Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C45C46CA1
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Oct 2023 23:16:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbjJRXQc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Oct 2023 19:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbjJRXQ2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Oct 2023 19:16:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A478118;
        Wed, 18 Oct 2023 16:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697670986; x=1729206986;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=3kIeeePd9Sa8P17qqM631pQDAW3Hx4V3pJa7j4Rsss8=;
  b=VjjNvP8GcQINPd7vVl31j021SH+UYMaVJORkiOyVFjgMdhMGKIVP+4yO
   YFpRfU2NLqjrUWKG3UuDTLqyHOP5wC7CgflbrAeKJR6mbRVdbt3RGeQJ+
   MR1kxeAJHyEuKnisizAI/h8+jF+KYoF332W0r7WaoXDJzM38f1EB6Pmn+
   2dNE1bG1/Zseurjw2tpli8HcCCPFQ+oO12WOWoGG8DpuzscAHhkrKvRh3
   Oi2t5su9mK54uPv52KrTZC7nRVz96nbDzyBFYfb1EqxtgKIjnx3J/nBYE
   lZv/EUDNw/UK+BMU2j87wdkawkY7SFCiHkG3RlgOGKFPx1vVssorwRjo7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="452605953"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="452605953"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 16:16:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="756782168"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="756782168"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 16:16:24 -0700
Received: from debox1-desk4.lan (unknown [10.209.71.91])
        by linux.intel.com (Postfix) with ESMTP id D2492580DAE;
        Wed, 18 Oct 2023 16:16:24 -0700 (PDT)
From:   "David E. Box" <david.e.box@linux.intel.com>
To:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ilpo.jarvinen@linux.intel.com, rajvi.jingar@linux.intel.com
Subject: [PATCH V4 02/17] platform/x86/intel/vsec: remove platform_info from vsec device structure
Date:   Wed, 18 Oct 2023 16:16:09 -0700
Message-Id: <20231018231624.1044633-3-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018231624.1044633-1-david.e.box@linux.intel.com>
References: <20231018231624.1044633-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In preparation for exporting an API to register Intel Vendor Specific
Extended Capabilities (VSEC) from other drivers, remove the pointer to
platform_info from intel_vsec_device. This prevents a potential page fault
when auxiliary drivers probe and attempt to dereference this pointer to
access the needed quirks field. Instead, just add the quirks to
intel_vsec_device.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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
index e82a009be630..b14eba545770 100644
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
index 8900cb95afd3..d3fefba3e623 100644
--- a/drivers/platform/x86/intel/vsec.h
+++ b/drivers/platform/x86/intel/vsec.h
@@ -79,10 +79,10 @@ struct intel_vsec_device {
 	struct pci_dev *pcidev;
 	struct resource *resource;
 	struct ida *ida;
-	struct intel_vsec_platform_info *info;
 	int num_resources;
 	void *priv_data;
 	size_t priv_data_size;
+	unsigned long quirks;
 };
 
 int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
-- 
2.34.1

