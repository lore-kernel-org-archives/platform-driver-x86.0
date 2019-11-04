From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 00/10] tools/power/x86/intel-speed-select: New version
Date: Mon,  4 Nov 2019 03:02:36 -0800
Message-ID: <20191104110246.70465-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, prarit@redhat.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

This adds support for the new version of Intel(R) Speed select
implementation. Also some fixes for CLX-N platform.

Srinivas Pandruvada (10):
  tools/power/x86/intel-speed-select: Extend command set for
    perf-profile
  tools/power/x86/intel-speed-select: Change display of "avx" to "avx2"
  tools/power/x86/intel-speed-select: Correct CLX-N frequency units
  tools/power/x86/intel-speed-select: Auto mode for CLX
  tools/power/x86/intel-speed-select: Use mailbox for CLOS_PM_QOS_CONFIG
  tools/power/x86/intel-speed-select: Make CLOS frequency in MHz
  tools/power/x86/intel-speed-select: Use Frequency weight for CLOS
  tools/power/x86/intel-speed-select: Support platform with limited
    Intel(R) Speed Select
  tools/power/x86/intel-speed-select: Use core count for base-freq mask
  tools/power/x86/intel-speed-select: Increment version

 .../x86/intel-speed-select/isst-config.c      | 178 ++++++++++++++----
 .../power/x86/intel-speed-select/isst-core.c  | 146 ++++++++++++--
 .../x86/intel-speed-select/isst-display.c     | 139 +++++++++-----
 tools/power/x86/intel-speed-select/isst.h     |   2 +
 4 files changed, 366 insertions(+), 99 deletions(-)

-- 
2.17.2
