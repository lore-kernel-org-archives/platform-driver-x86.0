From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 0/5] tools/power/x86/intel-speed-select: New command and
Date: Sat, 14 Sep 2019 00:05:08 -0700
Message-ID: <20190914070513.19807-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.shevchenko@gmail.com, andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, prarit@redhat.com, darcari@redhat.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

This series contains some minor fixes, when firmware mask is including
invalid CPU in the perf-profile mask. Also add some commands to
better manage core-power feature.

Srinivas Pandruvada (4):
  tools/power/x86/intel-speed-select: Allow online/offline based on tdp
  tools/power/x86/intel-speed-select: Format get-assoc information
  tools/power/x86/intel-speed-select: Fix some debug prints
  tools/power/x86/intel-speed-select: Extend core-power command set

Youquan Song (1):
  tools/power/x86/intel-speed-select: Fix high priority core mask over
    count

 .../x86/intel-speed-select/isst-config.c      | 108 ++++++++++++++++--
 .../power/x86/intel-speed-select/isst-core.c  |  25 ++++
 .../x86/intel-speed-select/isst-display.c     |  51 +++++++++
 tools/power/x86/intel-speed-select/isst.h     |   9 +-
 4 files changed, 182 insertions(+), 11 deletions(-)

-- 
2.17.2
