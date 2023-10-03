Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14054E7545F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Oct 2023 18:49:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbjJCStY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Oct 2023 14:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbjJCStY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Oct 2023 14:49:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C8AA7;
        Tue,  3 Oct 2023 11:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696358961; x=1727894961;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N/RJTfe7SYfJ518p5ryXkyHp4nkxEBtVeFiQeBquE1g=;
  b=Tn7RvURlthbLFRiIOEK+kTDWqZJjYp9fG7vgQy5PKFKi9dJyMLNSnykp
   Otw6ZpMdm5O3+w61q9bWh2OXANrlMOSgXWoL49amBWiBvtlX5QyIe4czj
   JpOHCgbp/QkGm/hoMnWtS+F09DTp0etgHHDvT2Ti7yBlwv7LP6Bbhq0yc
   iW/WEYJiDoG6CoAGIVD1UfC/+JCTLU4rC/8wMYYyP9c+58Eb0Va8Ua4ry
   7XZ9Mx0aNzAK63zz4mQbQqwwxygSBc84eN1tG9gfNGtilYGTghNJdS2qd
   IdTbZ3cOqdZaPSEtU+cjBRt2/2A82I1GDtL6tHRVG/uXFEwqVFMtyfUJQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="363221949"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="363221949"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 11:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="700814540"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="700814540"
Received: from spandruv-desk.jf.intel.com ([10.54.75.14])
  by orsmga003.jf.intel.com with ESMTP; 03 Oct 2023 11:49:20 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org,
        ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 0/3] TPMI feature major/minor version check
Date:   Tue,  3 Oct 2023 11:49:13 -0700
Message-Id: <20231003184916.1860084-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Changes for core and feature drivers to check major minor version.

v2
- commit description changes
- Log level change

Srinivas Pandruvada (3):
  platform/x86/intel/tpmi: Add defines to get version information
  platform/x86: ISST: Ignore minor version change
  platform/x86/intel-uncore-freq: Process hardware version

 .../x86/intel/speed_select_if/isst_tpmi_core.c | 16 ++++++++++++----
 .../uncore-frequency/uncore-frequency-tpmi.c   | 18 ++++++++++++++----
 include/linux/intel_tpmi.h                     |  6 ++++++
 3 files changed, 32 insertions(+), 8 deletions(-)

-- 
2.41.0

