From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 0/6]  Add CascadeLake-N Support
Date: Mon,  7 Oct 2019 12:30:54 -0700
Message-ID: <20191007193100.36934-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, prarit@redhat.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Add support for SST-BF on CascadeLake-N support.  The CascadeLake-N
processor only support SST-BF and not other SST functionality.

v3:
Fix crash due to geline
Fix display to perf-profile info and base-freq info command
Fix output for coremask
Fix base frequency CPU list. This should be displayed for a package
Auto mode support for base-freq enable/disable
One of the patch for config only change folded to next one where it is
used.

The patch 1 has nothing to do with the CLX-N. It saves some bytes in the
size.

v2: Updated with comments from Srinivas (use common clx_n_* function names,
common is_clx_n_platform() function call to identify CascadeLake-N)


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

 .../x86/intel-speed-select/isst-config.c      | 523 ++++++++++++------
 .../x86/intel-speed-select/isst-display.c     |  14 +-
 tools/power/x86/intel-speed-select/isst.h     |   3 +
 3 files changed, 383 insertions(+), 157 deletions(-)

-- 
2.17.2
