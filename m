From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 0/5] Intel Speed Select Core Power Support
Date: Tue, 14 Jan 2020 11:22:12 -0800
Message-ID: <20200114192217.580364-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com, prarit@redhat.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

This series add core-power or SST-CP support. Also fixes some display
issue with SST-TF.

Srinivas Pandruvada (5):
  platform/x86: ISST: Allow additional core-power mailbox commands
  tools/power/x86/intel-speed-select: Add support for core-power
    discovery
  tools/power/x86/intel-speed-select: Fix result display for turbo-freq
    auto mode
  tools/power/x86/intel-speed-select: Change the order for clos disable
  tools/power/x86/intel-speed-select: Update version

 .../intel_speed_select_if/isst_if_common.c    |  3 +
 .../x86/intel-speed-select/isst-config.c      | 34 ++++++------
 .../power/x86/intel-speed-select/isst-core.c  | 55 +++++++++++++++++++
 .../x86/intel-speed-select/isst-display.c     | 27 ++++++---
 tools/power/x86/intel-speed-select/isst.h     |  6 ++
 5 files changed, 100 insertions(+), 25 deletions(-)

-- 
2.24.1
