Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6891DC43214
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 16:38:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52744610A0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 16:38:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbhHSQis (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Aug 2021 12:38:48 -0400
Received: from mga17.intel.com ([192.55.52.151]:5089 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230440AbhHSQin (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Aug 2021 12:38:43 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="196853741"
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; 
   d="scan'208";a="196853741"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2021 09:38:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; 
   d="scan'208";a="522506764"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2021 09:38:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 860B7B2E; Thu, 19 Aug 2021 19:37:53 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Dell.Client.Kernel@dell.com
Cc:     Mark Gross <mgross@linux.intel.com>,
        Alex Hung <alex.hung@canonical.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        David E Box <david.e.box@intel.com>,
        Zha Qipeng <qipeng.zha@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "David E. Box" <david.e.box@linux.intel.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v4 21/21] platform/x86/intel: scu: Fix doc of intel_scu_ipc_dev_command_with_size()
Date:   Thu, 19 Aug 2021 19:37:35 +0300
Message-Id: <20210819163735.81803-22-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210819163735.81803-1-andriy.shevchenko@linux.intel.com>
References: <20210819163735.81803-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The kernel doc validator complains:

.../ipc.c:478: warning: expecting prototype for intel_scu_ipc_command_with_size(). Prototype was for intel_scu_ipc_dev_command_with_size() instead

Fix the prototype name in the kernel documentation.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel/scu/ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/scu/ipc.c b/drivers/platform/x86/intel/scu/ipc.c
index 9171a46a9e3f..bfa0cc20750d 100644
--- a/drivers/platform/x86/intel/scu/ipc.c
+++ b/drivers/platform/x86/intel/scu/ipc.c
@@ -457,7 +457,7 @@ int intel_scu_ipc_dev_simple_command(struct intel_scu_ipc_dev *scu, int cmd,
 EXPORT_SYMBOL(intel_scu_ipc_dev_simple_command);
 
 /**
- * intel_scu_ipc_command_with_size() - Command with data
+ * intel_scu_ipc_dev_command_with_size() - Command with data
  * @scu: Optional SCU IPC instance
  * @cmd: Command
  * @sub: Sub type
-- 
2.32.0

