Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F09C77B7A
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Jun 2023 23:21:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236671AbjFBXVs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 2 Jun 2023 19:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236529AbjFBXVr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Jun 2023 19:21:47 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1911BE42;
        Fri,  2 Jun 2023 16:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685748107; x=1717284107;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fsVknyo+YJ2O89L4WdIV6WoO7IVwiIgXQ8fTtfWuOdw=;
  b=D/llnO5hJXfoEqFnWUsw3duu4UsSP+5wy+3wdz6PDbTDo+Q4cbh2vo4O
   pwkhHUI4uCB3wgxVlfue+fC6a+zpEX9iUvsG2cJLyp6OkgfPcbAW8UzOc
   /5y4NnyP6XuQXdrLPxvTFsKos8oVu/cdHIkLXjgI3LTjiTTgCwgrZyqjB
   2+g/+7Mu2eJxxE8igu+cjdWtK8lxY5WBivdtbfZL2EqHcdKaYhmO2DktY
   rE76Rcldu7oU7Ur3/spwR9yoBMHHU2D15oRYZ/EAjtzQsCgfbZaGj1zuH
   Dh8BJn1wcIMWVIvWY8xy4mcmuojHHcpzrpYhj8Bhg7r9FalkCUOrXztyR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="442370912"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="442370912"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 16:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="882229222"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="882229222"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga005.jf.intel.com with ESMTP; 02 Jun 2023 16:21:42 -0700
Received: from debox1-desk4.intel.com (unknown [10.212.214.169])
        by linux.intel.com (Postfix) with ESMTP id CBB73580D5F;
        Fri,  2 Jun 2023 16:21:42 -0700 (PDT)
From:   "David E. Box" <david.e.box@linux.intel.com>
To:     irenic.rajneesh@gmail.com, david.e.box@linux.intel.com,
        hdegoede@redhat.com, markgross@kernel.org,
        ilpo.jarvinen@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform/x86/intel/pmc/mtl: Put devices in D3 during resume
Date:   Fri,  2 Jun 2023 16:21:42 -0700
Message-Id: <20230602232142.278155-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602232142.278155-1-david.e.box@linux.intel.com>
References: <20230602232142.278155-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

An earlier commit placed some driverless devices in D3 during boot so that
they don't block package cstate entry. Also place these devices in D3 after
resume from suspend.

Fixes: 336ba968d3e3 ("platform/x86/intel/pmc/mtl: Put GNA/IPU/VPU devices in D3")
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/pmc/mtl.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
index e8cc156412ce..d87c4597c6d4 100644
--- a/drivers/platform/x86/intel/pmc/mtl.c
+++ b/drivers/platform/x86/intel/pmc/mtl.c
@@ -68,11 +68,8 @@ static void mtl_set_device_d3(unsigned int device)
 	}
 }
 
-void mtl_core_init(struct pmc_dev *pmcdev)
+static void mtl_fixup(void)
 {
-	pmcdev->map = &mtl_reg_map;
-	pmcdev->core_configure = mtl_core_configure;
-
 	/*
 	 * Set power state of select devices that do not have drivers to D3
 	 * so that they do not block Package C entry.
@@ -81,3 +78,13 @@ void mtl_core_init(struct pmc_dev *pmcdev)
 	mtl_set_device_d3(MTL_IPU_PCI_DEV);
 	mtl_set_device_d3(MTL_VPU_PCI_DEV);
 }
+
+void mtl_core_init(struct pmc_dev *pmcdev)
+{
+	pmcdev->map = &mtl_reg_map;
+	pmcdev->core_configure = mtl_core_configure;
+
+	mtl_fixup();
+
+	pmcdev->resume_fixup = mtl_fixup;
+}
-- 
2.34.1

