Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0070BC4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Aug 2021 03:36:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5E9560F11
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Aug 2021 03:36:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbhHKDhB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Aug 2021 23:37:01 -0400
Received: from mga14.intel.com ([192.55.52.115]:65268 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232741AbhHKDhA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Aug 2021 23:37:00 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="214776809"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="214776809"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 20:36:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="516288692"
Received: from spandruv-desk.jf.intel.com ([10.54.75.21])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Aug 2021 20:36:36 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        sfr@canb.auug.org.au,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2] platform/x86: ISST: Fix optimization with use of numa
Date:   Tue, 10 Aug 2021 20:36:33 -0700
Message-Id: <20210811033633.1204567-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

When numa is used to map CPU to PCI device, the optimized path to read
from cached data is not working and still calls _isst_if_get_pci_dev().

The reason is that when caching the mapping, numa information is not
available as it is read later. So move the assignment of
isst_cpu_info[cpu].numa_node before calling _isst_if_get_pci_dev().

Fixes: aa2ddd242572 ("platform/x86: ISST: Use numa node id for cpu pci dev mapping")
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
v2:
Fixed "Fixes tag" as suggested by Stephen Rothwell

Update:
	The fixes tag was wrong
This patch can wait for next merge window as these systems are not
shipped.

 drivers/platform/x86/intel_speed_select_if/isst_if_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
index 6f0cc679c8e5..8a4d52a9028d 100644
--- a/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel_speed_select_if/isst_if_common.c
@@ -379,6 +379,8 @@ static int isst_if_cpu_online(unsigned int cpu)
 	u64 data;
 	int ret;
 
+	isst_cpu_info[cpu].numa_node = cpu_to_node(cpu);
+
 	ret = rdmsrl_safe(MSR_CPU_BUS_NUMBER, &data);
 	if (ret) {
 		/* This is not a fatal error on MSR mailbox only I/F */
@@ -397,7 +399,6 @@ static int isst_if_cpu_online(unsigned int cpu)
 		return ret;
 	}
 	isst_cpu_info[cpu].punit_cpu_id = data;
-	isst_cpu_info[cpu].numa_node = cpu_to_node(cpu);
 
 	isst_restore_msr_local(cpu);
 
-- 
2.31.1

