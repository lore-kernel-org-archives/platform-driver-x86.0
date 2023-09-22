Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A19BCE7A81
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Sep 2023 23:30:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbjIVXaT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 22 Sep 2023 19:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbjIVXaT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Sep 2023 19:30:19 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C881A1;
        Fri, 22 Sep 2023 16:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695425413; x=1726961413;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FgznEb/ZjEtrj+bbsNzpou8xTksYrm7CNJN/7B5bxvQ=;
  b=ejUnw9t2KKKYhx3bsIks2d0Do8vR38XYsZydow/8AOL4HsYXbSn/A4n+
   G3/zo2iJDvJw2DU2YR5XfXS8DDrw+Pdt6R1xJq2+e+yh0gf+4n3OiumZF
   8ADqkFxqZpNH5kVXm8EVGY42mbAtC0AVeoFoYFgyDh/iXjvab6hu4j8aV
   CTNNQCJboE46WzzQECiyxX7ZvaK0hxA7IP/U3CMXTo931sSn1UydWLqMK
   GkRltSG0egAemT2uHmfr4aqv9A5mLqwpuppZ419qaYFTD77NBsVD2Rome
   lVA1KAC5awI/plSbNHtkb8oir1jo4HUsw0R/joap6J7CjhCXKkgGWrtjW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="411896913"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="411896913"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 16:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="921350821"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="921350821"
Received: from jithujos.sc.intel.com ([172.25.103.66])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 16:30:10 -0700
From:   Jithu Joseph <jithu.joseph@intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        rostedt@goodmis.org, jithu.joseph@intel.com, ashok.raj@intel.com,
        tony.luck@intel.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, patches@lists.linux.dev,
        ravi.v.shankar@intel.com, pengfei.xu@intel.com,
        ilpo.jarvinen@linux.intel.com
Subject: [PATCH v2 0/9] IFS support for GNR and SRF
Date:   Fri, 22 Sep 2023 16:25:57 -0700
Message-Id: <20230922232606.1928026-1-jithu.joseph@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230913183348.1349409-1-jithu.joseph@intel.com>
References: <20230913183348.1349409-1-jithu.joseph@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Changes in v2
   Ilpo Jarvinen
    - Use GENMASK_ULL() / FIELD_GET() for bitops (patch 01)
    - Avoid mixing u8 type and bitfields in certain MSR structure
       scenarios (patch03 also suggested by Dave Hansen)
    - Expand bitfield structures to use consistent genx naming (patch 04)
    - Replace goto with do / while (patch 03)
    - general formatting (multiple patches)
        - remove un-necessary parenthesis
        - reformat commit message to use whole allowed 72 columns
        - alignment changes
    Other change
     - fold v1 04/10 and 05/10 into v2 patch 04/09 to satisfy build
        constraints due to consistent genx naming
v1 submission:
Link: https://lore.kernel.org/lkml/20230913183348.1349409-1-jithu.joseph@intel.com/

This series adds In Field Scan(IFS) support for newer CPUs like Granite
Rapids(GNR) and Sierra Forest(SRF).

There are changes in the IFS image loading and test flow to support
these new CPUs.

Note to reviewers:
 - patch 01/09 adds a bit mask to arch/x86/.../msr-index.h,
  hence x86 maintainers are cc-d.
 - patch 04/09 modifies an existing tracepoint, cc Steven Rostedt
 - Rest are localized to IFS driver

Jithu Joseph (9):
  platform/x86/intel/ifs: Store IFS generation number
  platform/x86/intel/ifs: Refactor image loading code
  platform/x86/intel/ifs: Gen2 scan image loading
  platform/x86/intel/ifs: Gen2 Scan test support
  platform/x86/intel/ifs: Validate image size
  platform/x86/intel/ifs: Metadata validation for start_chunk
  platform/x86/intel/ifs: Add new CPU support
  platform/x86/intel/ifs: Add new error code
  platform/x86/intel/ifs: ARRAY BIST for Sierra Forest

 arch/x86/include/asm/msr-index.h         |   1 +
 drivers/platform/x86/intel/ifs/ifs.h     |  61 ++++++++-
 include/trace/events/intel_ifs.h         |  16 +--
 drivers/platform/x86/intel/ifs/core.c    |  15 ++-
 drivers/platform/x86/intel/ifs/load.c    | 158 +++++++++++++++++++++--
 drivers/platform/x86/intel/ifs/runtest.c |  69 ++++++++--
 6 files changed, 280 insertions(+), 40 deletions(-)


base-commit: ce9ecca0238b140b88f43859b211c9fdfd8e5b70
-- 
2.25.1

