Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3ED0CD54BE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Sep 2023 19:43:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbjIYTny (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Sep 2023 15:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjIYTny (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2023 15:43:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1279F101;
        Mon, 25 Sep 2023 12:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695671028; x=1727207028;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XkjuLZiSGrby+fTWxdq1JvkiN8Vdx6a22Cnx7/pQz1U=;
  b=XCPjVmZ2USd2NBRF7/haDeN+Wzo3j7NuARqBLT/hLUGFzS1wN39Bt4Q8
   N3+nITciB7oSjPpGvAoiwZeIJYvkUrQYfOvBYAp2Mc9RhZrIUCTF5lKiu
   5QM51Z/aYahsMIZF45mxXi5tc6AO/NwqDnZh8UPQkAFGInbYpZRp0VyZd
   FUIxP+4rOVSxQmlm4XKmlqn99OQqGzBqNynZjLz5u36kqRWag0oK/tgXs
   TmMOL0Nw3kL+oKwAUvBZYlXMrQ6ccrpJPIPxqXDZbhjK9ASaaaDhXaQiJ
   OHtYlnUOuDcOpjeI/akoQIcKwPHY0kJajKFg0bqfvT1QRttqeYgyKTDob
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360743055"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="360743055"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 12:43:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="872194748"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="872194748"
Received: from spandruv-desk.jf.intel.com ([10.54.75.14])
  by orsmga004.jf.intel.com with ESMTP; 25 Sep 2023 12:43:39 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org,
        ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 0/3] TPMI feature major/minor version check
Date:   Mon, 25 Sep 2023 12:43:35 -0700
Message-Id: <20230925194338.966639-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Changes for core and feature drivers to check major minor version.

Srinivas Pandruvada (3):
  platform/x86/intel/tpmi: Add defines to get version information
  platform/x86: ISST : Check major minor version
  platform/x86/intel-uncore-freq: Check major minor version

 .../x86/intel/speed_select_if/isst_tpmi_core.c  | 16 ++++++++++++----
 .../uncore-frequency/uncore-frequency-tpmi.c    | 17 +++++++++++++----
 include/linux/intel_tpmi.h                      |  6 ++++++
 3 files changed, 31 insertions(+), 8 deletions(-)

-- 
2.41.0

