From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v2 0/4] platform/x86: intel_telemetry: Fix logs and formatting
Date: Tue, 21 Nov 2017 20:06:20 +0530
Message-ID: <1511274984-6165-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:21621 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751899AbdKUGaT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2017 01:30:19 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

This patchset fixes https://bugzilla.kernel.org/show_bug.cgi?id=197833, and
other issues related to telemetry counters. It also cleans up formatting
and removes redundant code.

It is rebased on top of the TESTING branch.

Code-Review comments have been incorporated.

Souvik Kumar Chakravarty (4):
  platform/x86: intel_pmc_ipc: Add readq API for GCR
  platform/x86: intel_telemetry: Fix suspend stats
  platform/x86: intel_telemetry: Improve S0ix logs
  platform/x86: intel_telemetry: Remove redundancies

 arch/x86/include/asm/intel_pmc_ipc.h           | 10 ++-
 drivers/platform/x86/intel_pmc_ipc.c           | 37 +++++++++--
 drivers/platform/x86/intel_telemetry_debugfs.c | 87 +++++++++++---------------
 3 files changed, 78 insertions(+), 56 deletions(-)

-- 
2.7.4
