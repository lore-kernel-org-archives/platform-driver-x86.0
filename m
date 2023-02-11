Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA788C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Sat, 11 Feb 2023 06:33:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjBKGdK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 11 Feb 2023 01:33:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjBKGdH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Feb 2023 01:33:07 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58CA87CC92;
        Fri, 10 Feb 2023 22:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676097180; x=1707633180;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7zxEPErl2IqErE1vJsd67hjtwPv08qOzrW4rXNoRggo=;
  b=kaiQLjDht2dP9QxcN3Kiv8EXlfTYuhBWgVYRPAVndMV7qJCgkZlFUHSC
   YivnsNo2wGTSuoC/iVM3R+BJg7THkJYtO4M1VtpOspdvuXCTth7sLlwJh
   Tc0o26o+wjBRFGLZzXgH8uobVnwa26b//BCTpIC98vcgpdmlU+hJ9EDlE
   +9dqdUOu5kVg1yF+VVoJLGF0WoaPGGOy/SuT/7WIYblSvU6nmwzFNAyVK
   J+8AXNA4Cx4hGSfUzA+TvzYDTvILDnChLqtXPDp00r1p3L9cPtmA5Jkvt
   LdQuZpdu3KtfJgEel1nyzf+e1vpoN/2ciSWlvHm0gSjr7uej2MMtuR5iw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="310223192"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="310223192"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 22:33:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="997171758"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="997171758"
Received: from spandruv-desk.jf.intel.com ([10.54.75.8])
  by fmsmga005.fm.intel.com with ESMTP; 10 Feb 2023 22:32:59 -0800
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 00/12] platform/x86: ISST: Use TPMI interface
Date:   Fri, 10 Feb 2023 22:32:45 -0800
Message-Id: <20230211063257.311746-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This series implements TPMI as Intel Speed Select Technology (Intel SST)
HW interface. TPMI has several advantages for Intel SST. This replaces
legacy mailbox and MMIO with architectural interface over TPMI.

This improves performance for HPC type applications. One single IOCTL command
replaces 10s of IOCTLs for mailboxes. This allowed to offer many more
performance levels and SST configurations.

Users use intel-speed-select utility to configure Intel SST.  User of
the tool still can use the same commands. The utility uses new IOCTLs
based on the new API version.

The TPMI documentation can be downloaded from:
https://github.com/intel/tpmi_power_management

This series depends on previously posted series:
- platform/x86/intel: Add TPMI support

Uses 6.2-rc1 as baseline, so the patchset needs to be rebased.

Srinivas Pandruvada (12):
  platform/x86: ISST: Fix kernel documentation warnings
  platform/x86: ISST: Add TPMI target
  platform/x86: ISST: Add IOCTL default callback
  platform/x86: ISST: Add API version of the target
  platform/x86: ISST: Add support for MSR 0x54
  platform/x86: ISST: Enumerate TPMI SST and create framework
  platform/x86: ISST: Parse SST MMIO and update instance
  platform/x86: ISST: Add SST-CP support via TPMI
  platform/x86: ISST: Add SST-PP support via TPMI
  platform/x86: ISST: Add SST-BF support via TPMI
  platform/x86: ISST: Add SST-TF support via TPMI
  platform/x86: ISST: Add suspend/resume callbacks

 .../x86/intel/speed_select_if/Kconfig         |    4 +
 .../x86/intel/speed_select_if/Makefile        |    2 +
 .../intel/speed_select_if/isst_if_common.c    |   73 +-
 .../intel/speed_select_if/isst_if_common.h    |    9 +-
 .../x86/intel/speed_select_if/isst_tpmi.c     |   74 +
 .../intel/speed_select_if/isst_tpmi_core.c    | 1438 +++++++++++++++++
 .../intel/speed_select_if/isst_tpmi_core.h    |   18 +
 include/uapi/linux/isst_if.h                  |  303 ++++
 8 files changed, 1918 insertions(+), 3 deletions(-)
 create mode 100644 drivers/platform/x86/intel/speed_select_if/isst_tpmi.c
 create mode 100644 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
 create mode 100644 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.h

-- 
2.39.1

