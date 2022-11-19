Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258FBC4332F
	for <platform-driver-x86@archiver.kernel.org>; Sat, 19 Nov 2022 01:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbiKSBXg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 18 Nov 2022 20:23:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbiKSBW5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Nov 2022 20:22:57 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0973E53ECC;
        Fri, 18 Nov 2022 16:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668817435; x=1700353435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gLAOje8+qf/k9AwPKuFwEIgMMpE2A7PEtqaQD09hAq8=;
  b=APrjwxj43tL5ikMNH92H5XKs3StcsNvAYrc7CrSlV6OTC3odjksVgw0y
   BBCKiL0hgnLbeOY184Yb7+EGeqQfcMy1xtwM4Xfbm646dLitMgrxp8lde
   3f2yt3FhqpB6PLZza5e28jKgydKh7lmftWzlU2drSKXN0/sOWyO4vFmwk
   dbmtbf+cU+5U5KGJV+loK74d50QQ7yk+q5Crw2J1wt8JKAS9IMx/QPl2I
   h2Zt/t1PB9KTz4GVKvdAlWuGlpP1qqqTMS0uKzXGpgD+6J2EkNZ+TgK9s
   GZ2U5jehy8ruNVkH11WBvhWNY0/b1kw3SE70Te2TQz5QUGr9PQzfEuUWt
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="314418973"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; 
   d="scan'208";a="314418973"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2022 16:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="765349181"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; 
   d="scan'208";a="765349181"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga004.jf.intel.com with ESMTP; 18 Nov 2022 16:23:46 -0800
Received: from debox1-desk4.lan (unknown [10.252.138.169])
        by linux.intel.com (Postfix) with ESMTP id 758BA580DFA;
        Fri, 18 Nov 2022 16:23:46 -0800 (PST)
From:   "David E. Box" <david.e.box@linux.intel.com>
To:     david.e.box@linux.intel.com, hdegoede@redhat.com,
        markgross@kernel.org, andriy.shevchenko@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 6/9] tools/arch/x86: intel_sdsi: Add Intel On Demand text
Date:   Fri, 18 Nov 2022 16:23:40 -0800
Message-Id: <20221119002343.1281885-7-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221119002343.1281885-1-david.e.box@linux.intel.com>
References: <20221119002343.1281885-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Intel Software Defined Silicon (SDSi) is now officially known as Intel
On Demand. Change text in tool to indicate this.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---

V2 - No change

 tools/arch/x86/intel_sdsi/intel_sdsi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/arch/x86/intel_sdsi/intel_sdsi.c b/tools/arch/x86/intel_sdsi/intel_sdsi.c
index 9dd94014a672..3718bd0c05cb 100644
--- a/tools/arch/x86/intel_sdsi/intel_sdsi.c
+++ b/tools/arch/x86/intel_sdsi/intel_sdsi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * sdsi: Intel Software Defined Silicon tool for provisioning certificates
- * and activation payloads on supported cpus.
+ * sdsi: Intel On Demand (formerly Software Defined Silicon) tool for
+ * provisioning certificates and activation payloads on supported cpus.
  *
  * See https://github.com/intel/intel-sdsi/blob/master/os-interface.rst
  * for register descriptions.
@@ -150,7 +150,7 @@ static void sdsi_list_devices(void)
 	}
 
 	if (!found)
-		fprintf(stderr, "No sdsi devices found.\n");
+		fprintf(stderr, "No On Demand devices found.\n");
 }
 
 static int sdsi_update_registers(struct sdsi_dev *s)
@@ -206,7 +206,7 @@ static int sdsi_read_reg(struct sdsi_dev *s)
 	printf("\n");
 	printf("PPIN:                           0x%lx\n", s->regs.ppin);
 	printf("Enabled Features\n");
-	printf("    SDSi:                       %s\n", !!s->regs.en_features.sdsi ? "Enabled" : "Disabled");
+	printf("    On Demand:                  %s\n", !!s->regs.en_features.sdsi ? "Enabled" : "Disabled");
 	printf("Authorization Failure Count\n");
 	printf("    AKC Failure Count:          %d\n", s->regs.auth_fail_count.key_failure_count);
 	printf("    AKC Failure Threshold:      %d\n", s->regs.auth_fail_count.key_failure_threshold);
@@ -428,7 +428,7 @@ static int sdsi_provision_akc(struct sdsi_dev *s, char *bin_file)
 		return ret;
 
 	if (!s->regs.en_features.sdsi) {
-		fprintf(stderr, "SDSi feature is present but not enabled. Unable to provision");
+		fprintf(stderr, "On Demand feature is present but not enabled. Unable to provision");
 		return -1;
 	}
 
@@ -458,7 +458,7 @@ static int sdsi_provision_cap(struct sdsi_dev *s, char *bin_file)
 		return ret;
 
 	if (!s->regs.en_features.sdsi) {
-		fprintf(stderr, "SDSi feature is present but not enabled. Unable to provision");
+		fprintf(stderr, "On Demand feature is present but not enabled. Unable to provision");
 		return -1;
 	}
 
-- 
2.34.1

