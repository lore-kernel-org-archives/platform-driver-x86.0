Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19AEEB64DA
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Jun 2023 19:33:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjFOTdZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Jun 2023 15:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjFOTdY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Jun 2023 15:33:24 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21BB2951;
        Thu, 15 Jun 2023 12:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686857603; x=1718393603;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mLqcWJWoexRHei6/aIZxWlYH6hmP7LHDW9VcM+zztrk=;
  b=c+0FGs4Svem0HV8musr5QNX3Nqb8QSwiK8e/9BZCRHVu2l1fJcbtF7LZ
   AzJ+ASOPD6V7frAALumAj/Adw1pll1Lo0vBUdi8pCnq+40YcwhCUv0ZP+
   /iKh1z8LyMLawUYdQDaz12T5v0b5b8WhlPrdNWSosSbV5QDB9RZLIsgqO
   L75G6uLS4wpFn0vjVM/9r2gJB2rgP0dWAJzdRjqc+M9nOfFhUQqukMq2c
   cs27kKxW8KgO1WDkNfiZZI9MOWIBCPJv2FVSUWa7DNLm+FAuO/wivGHBE
   W9BweFZmJ+kN5XPzfv6NSwBww4+p3OvU0wHyOOCQsIDmoxjXMWFnnjDqf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="359019789"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="359019789"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 12:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825414308"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="825414308"
Received: from spandruv-desk.jf.intel.com ([10.54.75.8])
  by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2023 12:33:22 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 0/2] TPMI debugfs suport
Date:   Thu, 15 Jun 2023 12:33:00 -0700
Message-Id: <20230615193302.2507338-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The first patch provides interface to read feature status. This is
generic patch to be used by other feature drivers.
The second patch patch add support for debugfs. Debugfs also display
feature status using the first patch.

Srinivas Pandruvada (2):
  platform/x86/intel/tpmi: Read feature control status
  platform/x86/intel/tpmi: Add debugfs interface

 drivers/platform/x86/intel/tpmi.c | 392 +++++++++++++++++++++++++++++-
 include/linux/intel_tpmi.h        |   2 +
 2 files changed, 387 insertions(+), 7 deletions(-)

-- 
2.38.1

