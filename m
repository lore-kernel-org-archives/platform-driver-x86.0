From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v1 0/5] platform/x86: intel_telemetry: Fix counters and formatting
Date: Thu, 16 Nov 2017 15:48:12 +0530
Message-ID: <1510827497-25188-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

This patchset fixes https://bugzilla.kernel.org/show_bug.cgi?id=197833, and
other issues related to telemetry counters. It also cleans up formatting
and removes redundanant code.

It is rebased on top of the TESTING branch.

Souvik Kumar Chakravarty (5):
  platform/x86: intel_pmc_ipc: Fix register names
  platform/x86: intel_telemetry: Fix suspend stats
  platform/x86: intel_telemetry: Fix local variables
  platform/x86: intel_telemetry: Remove redundancies
  platform/x86: intel_telemetry: Improve S0ix logs

 arch/x86/include/asm/intel_pmc_ipc.h           |  10 ++-
 drivers/platform/x86/intel_pmc_ipc.c           |   4 +-
 drivers/platform/x86/intel_telemetry_debugfs.c | 101 +++++++++++++------------
 3 files changed, 59 insertions(+), 56 deletions(-)

-- 
2.7.4
