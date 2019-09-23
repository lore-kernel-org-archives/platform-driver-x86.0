From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 0/3] Auto configuration mode and error
Date: Mon, 23 Sep 2019 11:59:03 -0700
Message-ID: <20190923185906.76032-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com
Cc: prarit@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

These are some changes, which help users to use the base-freq and
turbo-freq features without going through multiple steps for
basic configuration. Also add some error when user is trying
to disable core-power feature while it is getting used.

None of these patches are urgent and can wait for kernel version v5.5.

Srinivas Pandruvada (3):
  tools/power/x86/intel-speed-select: Base-freq feature auto mode
  tools/power/x86/intel-speed-select: Turbo-freq feature auto mode
  tools/power/x86/intel-speed-select: Refuse to disable core-power when
    getting used

 .../x86/intel-speed-select/isst-config.c      | 275 +++++++++++++++++-
 .../power/x86/intel-speed-select/isst-core.c  |  21 ++
 2 files changed, 281 insertions(+), 15 deletions(-)

-- 
2.17.2
