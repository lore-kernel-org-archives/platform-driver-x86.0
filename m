Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838FAC4363C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 03:51:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DB3B208C7
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 03:51:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgJGDvH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Oct 2020 23:51:07 -0400
Received: from mga18.intel.com ([134.134.136.126]:11774 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726919AbgJGDvH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Oct 2020 23:51:07 -0400
IronPort-SDR: sKiShkzW6O+Jk63OXOnW396K7N+GEkcRo4hggebY35UM6Nywvcs45bpj2DbkrjRKv0p57wNios
 9+4xWvnvMxfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="152575797"
X-IronPort-AV: E=Sophos;i="5.77,345,1596524400"; 
   d="scan'208";a="152575797"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2020 20:51:07 -0700
IronPort-SDR: wIFl3pE5EnAmfSGqGYM/3x6lioo0E8UGeARQYaSWmMIsMDuOx5XQDAgzNqBDvtbWMOQQE7Xyfn
 /KfWJcqV/uag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,345,1596524400"; 
   d="scan'208";a="297442070"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga008.fm.intel.com with ESMTP; 06 Oct 2020 20:51:06 -0700
Received: from debox1-desk2.jf.intel.com (debox1-desk2.jf.intel.com [10.54.75.16])
        by linux.intel.com (Postfix) with ESMTP id A71D2580782;
        Tue,  6 Oct 2020 20:51:06 -0700 (PDT)
From:   "David E. Box" <david.e.box@linux.intel.com>
To:     irenic.rajneesh@gmail.com, david.e.box@intel.com,
        dvhart@infradead.org, andy@infradead.org, gayatri.kammela@intel.com
Cc:     "David E. Box" <david.e.box@linux.intel.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/4] pmc_core: Add RocketLake and other changes
Date:   Tue,  6 Oct 2020 20:51:04 -0700
Message-Id: <20201007035108.31078-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add RocketLake platform support and other driver maintainance.

Gayatri Kammela (4):
  platform/x86: intel_pmc_core: Clean up: Remove the duplicate comments
    and reorganize
  platform/x86: intel_pmc_core: Add Intel RocketLake (RKL) support
  platform/x86: intel_pmc_core: fix: Replace dev_dbg macro with
    dev_info()
  MAINTAINERS: Update maintainers for pmc_core driver

 MAINTAINERS                           |  4 +--
 drivers/platform/x86/intel_pmc_core.c | 39 ++++++++++++++++-----------
 2 files changed, 26 insertions(+), 17 deletions(-)

-- 
2.20.1

