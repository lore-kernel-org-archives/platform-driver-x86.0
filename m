From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [RESEND][PATCH 00/10] intel-speed-select tool updates targetted for 5.5
Date: Thu, 10 Oct 2019 13:29:35 -0700
Message-ID: <20191010202945.73616-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com
Cc: prarit@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

There are no new patches in this series. This is just for clean apply on
5.4-rc1 for Andriy.

This is combination of two series of patches sent on 07th Oct, 2019.
Those two series were:
- [PATCH v2 0/3] tools/power/x86/intel-speed-select: Auto mode
- [PATCH v3 0/6]  Add CascadeLake-N Support



Prarit Bhargava (6):
  tools/power/x86/intel-speed-select: Add int argument to command
    functions
  tools/power/x86/intel-speed-select: Make process_command generic
  tools/power/x86/intel-speed-select: Add check for CascadeLake-N models
  tools/power/x86/intel-speed-select: Implement CascadeLake-N help and
    command functions structures
  tools/power/x86/intel-speed-select: Implement 'perf-profile info' on
    CascadeLake-N
  tools/power/x86/intel-speed-select: Implement base-freq commands on
    CascadeLake-N

Srinivas Pandruvada (4):
  tools/power/x86/intel-speed-select: Remove warning for unused result
  tools/power/x86/intel-speed-select: Base-freq feature auto mode
  tools/power/x86/intel-speed-select: Turbo-freq feature auto mode
  tools/power/x86/intel-speed-select: Refuse to disable core-power when
    getting used

 .../x86/intel-speed-select/isst-config.c      | 878 ++++++++++++++----
 .../power/x86/intel-speed-select/isst-core.c  |  21 +
 .../x86/intel-speed-select/isst-display.c     |  14 +-
 tools/power/x86/intel-speed-select/isst.h     |   3 +
 4 files changed, 738 insertions(+), 178 deletions(-)

-- 
2.17.2
