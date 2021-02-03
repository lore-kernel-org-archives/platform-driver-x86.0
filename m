Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000ECC433E6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 11:44:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A69E464F6A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 11:44:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234296AbhBCLo0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 06:44:26 -0500
Received: from mga18.intel.com ([134.134.136.126]:57325 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234341AbhBCLoF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 06:44:05 -0500
IronPort-SDR: C5N8G6nu8goJwZjKBIheowCX05IZKFlhpi7rKY+FTKA8eCP9EOAXyFM3G9ojEHhRU3RM254dfT
 c7Qi6P0aAYcg==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="168707862"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="168707862"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 03:43:22 -0800
IronPort-SDR: 9NUmA56BVYzeX+0KIHeE4hMfoDxXuKSioCRPQplXwWEcX0BqJOdvEGUfTxbTQJyH1WfZCXVdEX
 gPi/a0t+pZ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="480315604"
Received: from powerlab.fi.intel.com (HELO powerlab.backendnet) ([10.237.71.25])
  by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2021 03:43:20 -0800
From:   Artem Bityutskiy <dedekind1@gmail.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/intel-uncore-freq: Add Sapphire Rapids server support
Date:   Wed,  3 Feb 2021 13:43:20 +0200
Message-Id: <20210203114320.1398801-1-dedekind1@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Sapphire Rapids uncore frequency control is the same as Skylake and Ice Lake.
Add the Sapphire Rapids CPU model number to the match array.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
 drivers/platform/x86/intel-uncore-frequency.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel-uncore-frequency.c b/drivers/platform/x86/intel-uncore-frequency.c
index 12d5ab7e1f5d..3ee4c5c8a64f 100644
--- a/drivers/platform/x86/intel-uncore-frequency.c
+++ b/drivers/platform/x86/intel-uncore-frequency.c
@@ -377,6 +377,7 @@ static const struct x86_cpu_id intel_uncore_cpu_ids[] = {
 	X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE_X,	NULL),
 	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_X,	NULL),
 	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_D,	NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(SAPPHIRERAPIDS_X, NULL),
 	{}
 };
 
-- 
2.26.2

