Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F60C4167B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 18:17:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C47D2389F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 18:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgLGSR0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 13:17:26 -0500
Received: from mga09.intel.com ([134.134.136.24]:55724 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726069AbgLGSRZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 13:17:25 -0500
IronPort-SDR: 8KTx/zqd0OqJTiVLRIXyT0pDh98IpS6xIG1AUxvJypTpVu5dAXKJoe6wN63rXcC67Hwglqn1oU
 4vX24xfMcnIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173896491"
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="173896491"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 10:15:39 -0800
IronPort-SDR: WHgQHeezmhi77mzSfwN6sTIIbD/P2QVYy3HJdRLtGO6Ny0pxPhNF8CmemGgbqvgjfgJkE0wl8C
 OW3PT0N3QGfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="539892863"
Received: from spandruv-desk.jf.intel.com ([10.54.75.21])
  by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2020 10:15:38 -0800
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 0/3] Intel Speed Select interface changes for 5.11
Date:   Mon,  7 Dec 2020 10:15:28 -0800
Message-Id: <20201207181531.1718148-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

v2
Fix sparse warnings reported by LKP.

Srinivas Pandruvada (3):
  platform/x86: ISST: Check for unaligned mmio address
  platform/x86: ISST: Allow configurable offset range
  platform/x86: ISST: Change PCI device macros

 .../intel_speed_select_if/isst_if_common.h    |  8 +--
 .../intel_speed_select_if/isst_if_mbox_pci.c  |  4 +-
 .../x86/intel_speed_select_if/isst_if_mmio.c  | 49 ++++++++++++++-----
 3 files changed, 42 insertions(+), 19 deletions(-)

-- 
2.25.4

