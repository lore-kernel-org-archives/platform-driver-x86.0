From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v3 0/4] platform/x86: intel_telemetry: Fix logs and formatting
Date: Fri, 24 Nov 2017 19:04:40 +0530
Message-ID: <1511530484-29845-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:18383 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750715AbdKXF2c (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Nov 2017 00:28:32 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

This patchset fixes https://bugzilla.kernel.org/show_bug.cgi?id=197833, and
other issues related to telemetry counters. It also cleans up formatting
and removes redundant code.

It is rebased on top of the TESTING branch.

Changes since v2:
 * Changes in GCR read API name and adding back static qualifier to account
   for case of missing logs during suspend/resume 

Changes since v1:
 * Code-Review comments have been incorporated.

Souvik Kumar Chakravarty (4):
  platform/x86: intel_pmc_ipc: Add read64 API
  platform/x86: intel_telemetry: Fix suspend stats
  platform/x86: intel_telemetry: Improve S0ix logs
  platform/x86: intel_telemetry: Remove redundancies

 arch/x86/include/asm/intel_pmc_ipc.h           |  6 ++
 drivers/platform/x86/intel_pmc_ipc.c           | 33 +++++++++-
 drivers/platform/x86/intel_telemetry_debugfs.c | 83 +++++++++++---------------
 3 files changed, 72 insertions(+), 50 deletions(-)

-- 
2.7.4
