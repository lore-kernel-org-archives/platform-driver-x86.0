From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 00/27] tools/power/x86/intel-speed-select: Enhancements
Date: Thu,  5 Mar 2020 14:45:11 -0800
Message-ID: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

These are not urgent fixes, but improves usability based on user
feedback. This series addresses:
- Check validaity of user options for a command
- Print helpful errors
- Improves help
- Enhance existing options like --info
- Fixes issues with json keys
- Take care of handling offline CPUs


Srinivas Pandruvada (27):
  tools/power/x86/intel-speed-select: Warn for invalid package id
  tools/power/x86/intel-speed-select: Make target CPU optional for
    core-power info
  tools/power/x86/intel-speed-select: Enhance core-power info command
  tools/power/x86/intel-speed-select: Use more verbiage for clos
    information
  tools/power/x86/intel-speed-select: Special handling for CPU 0
    online/offline
  tools/power/x86/intel-speed-select: Max CPU count calculation when
    CPU0 is offline
  tools/power/x86/intel-speed-select: Store topology information
  tools/power/x86/intel-speed-select: Helpful warning for missing kernel
    interface
  tools/power/x86/intel-speed-select: Enhance help
  tools/power/x86/intel-speed-select: Enhance --info option
  tools/power/x86/intel-speed-select: Add an API for error/information
    print
  tools/power/x86/intel-speed-select: Improve error display for
    perf-profile feature
  tools/power/x86/intel-speed-select: Check feature status first
  tools/power/x86/intel-speed-select: Display error for invalid priority
    type
  tools/power/x86/intel-speed-select: Enhance help for core-power assoc
  tools/power/x86/intel-speed-select: Improve output of perf-profile
    commands
  tools/power/x86/intel-speed-select: Improve error display for
    base-freq feature
  tools/power/x86/intel-speed-select: Improve error display for
    turbo-freq feature
  tools/power/x86/intel-speed-select: Kernel interface error handling
  tools/power/x86/intel-speed-select: Improve core-power result and
    error display
  tools/power/x86/intel-speed-select: Show error for invalid CPUs in the
    options
  tools/power/x86/intel-speed-select: Improve CLX commands
  tools/power/x86/intel-speed-select: Fix avx options for turbo-freq
    feature
  tools/power/x86/intel-speed-select: Print friendly warning for bad
    command line
  tools/power/x86/intel-speed-select: Add display for enabled cpus count
  tools/power/x86/intel-speed-select: Avoid duplicate Package strings
    for json
  tools/power/x86/intel-speed-select: Update version

 .../x86/intel-speed-select/isst-config.c      | 574 ++++++++++++++----
 .../power/x86/intel-speed-select/isst-core.c  | 117 +++-
 .../x86/intel-speed-select/isst-display.c     | 274 ++++++---
 tools/power/x86/intel-speed-select/isst.h     |  12 +-
 4 files changed, 752 insertions(+), 225 deletions(-)

-- 
2.24.1
