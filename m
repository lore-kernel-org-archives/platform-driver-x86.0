From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 0/3] tools/power/x86/intel-speed-select: Auto mode
Date: Mon,  7 Oct 2019 10:29:56 -0700
Message-ID: <20191007172959.25912-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, prarit@redhat.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

v2
The sequence should be opposite than what was submitted in v1.
First enable core-power than enable turbo-freq and base-freq
for the auto mode. Firmware may give error if the core-power
feature is not enabled first.

Also need to set the core_power property of thread siblings.
Othewise it will be reset if user forgot to add those siblings
as part of command line CPUs.

Srinivas Pandruvada (3):
  tools/power/x86/intel-speed-select: Base-freq feature auto mode
  tools/power/x86/intel-speed-select: Turbo-freq feature auto mode
  tools/power/x86/intel-speed-select: Refuse to disable core-power when
    getting used

 .../x86/intel-speed-select/isst-config.c      | 384 ++++++++++++++++--
 .../power/x86/intel-speed-select/isst-core.c  |  21 +
 2 files changed, 368 insertions(+), 37 deletions(-)

-- 
2.17.2
