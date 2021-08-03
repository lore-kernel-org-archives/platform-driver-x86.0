Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12389C4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 19:25:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E925D60F93
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 19:24:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239660AbhHCTZK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Aug 2021 15:25:10 -0400
Received: from mga17.intel.com ([192.55.52.151]:13264 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239646AbhHCTZK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Aug 2021 15:25:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="194044825"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; 
   d="scan'208";a="194044825"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2021 12:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; 
   d="scan'208";a="521373627"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2021 12:24:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D3C00169; Tue,  3 Aug 2021 22:25:26 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mark Gross <mgross@linux.intel.com>
Subject: [PATCH v2 1/1] platform/surface: aggregator: Use y instead of objs in Makefile
Date:   Tue,  3 Aug 2021 22:25:24 +0300
Message-Id: <20210803192524.67031-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The 'objs' is for user space tools, for the kernel modules
we should use 'y'.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
---
v2: fixed typo, annihilated ifeq, added Rb tag (Maximilian)
 drivers/platform/surface/aggregator/Makefile | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/surface/aggregator/Makefile b/drivers/platform/surface/aggregator/Makefile
index c8498c41e758..c0d550eda5cd 100644
--- a/drivers/platform/surface/aggregator/Makefile
+++ b/drivers/platform/surface/aggregator/Makefile
@@ -6,12 +6,9 @@ CFLAGS_core.o = -I$(src)
 
 obj-$(CONFIG_SURFACE_AGGREGATOR) += surface_aggregator.o
 
-surface_aggregator-objs := core.o
-surface_aggregator-objs += ssh_parser.o
-surface_aggregator-objs += ssh_packet_layer.o
-surface_aggregator-objs += ssh_request_layer.o
-surface_aggregator-objs += controller.o
-
-ifeq ($(CONFIG_SURFACE_AGGREGATOR_BUS),y)
-surface_aggregator-objs += bus.o
-endif
+surface_aggregator-y := core.o
+surface_aggregator-y += ssh_parser.o
+surface_aggregator-y += ssh_packet_layer.o
+surface_aggregator-y += ssh_request_layer.o
+surface_aggregator-$(CONFIG_SURFACE_AGGREGATOR_BUS) += bus.o
+surface_aggregator-y += controller.o
-- 
2.30.2

