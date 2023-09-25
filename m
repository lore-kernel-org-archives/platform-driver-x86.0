Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C80CD54BF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Sep 2023 19:46:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233132AbjIYTqG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Sep 2023 15:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233259AbjIYTqF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2023 15:46:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6016F107;
        Mon, 25 Sep 2023 12:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695671157; x=1727207157;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hkRxZBkNuITPMQIKBMCM4J8K1fahC0QhZDOWIVj/QZ4=;
  b=j2CTMrQ+IVzgV2Nztim5/lFCPnq+OTDL5oyATdkZUVGK5dISErHFw9+y
   F65YfLRN7mmU70cHnNZy0b+UlGbqGZ8XXbA1+eaGytpCDYeEWW/xiVbUn
   12HY7L7luCVRAWXrCjwr+VSDvCyYKFWm9tzQVd9qtTVcfGiP5wb06yesD
   7Evr5HfE2JrDU9ocP+DGi+6R+aHSlmquOIIiS9tXbVwVMoEseOK05LVlx
   zPwnHnpjJIRCC3xgj8rZib+aEtRsAN8vhBY63AOodxMl9qQk9rwziu7Yz
   eYMJ14fHqjEy1oaOD/wyRyVdz2ZtW+D7ThKTOJgY0uXTGQ5q8T9wLdicY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380233030"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="380233030"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 12:45:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="814114292"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="814114292"
Received: from spandruv-desk.jf.intel.com ([10.54.75.14])
  by fmsmga008.fm.intel.com with ESMTP; 25 Sep 2023 12:45:56 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org,
        ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 0/3] Minor SST optimizations
Date:   Mon, 25 Sep 2023 12:45:52 -0700
Message-Id: <20230925194555.966743-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Contains some minor changes to use SST for non dynamic use cases
for display purpose and remove hardcoded size for map.

Srinivas Pandruvada (3):
  platform/x86: ISST: Use fuse enabled mask instead of allowed levels
  platform/x86: ISST: Allow level 0 to be not present
  platform/x86: intel_speed_select_if: Remove hardcoded map size

 drivers/platform/x86/intel/speed_select_if/isst_if_mmio.c  | 7 +++++--
 .../platform/x86/intel/speed_select_if/isst_tpmi_core.c    | 5 +----
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.41.0

