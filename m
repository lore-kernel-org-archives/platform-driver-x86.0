From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v4 0/5] platform/x86: intel_pmc_core: Add Tiger Lake and
Date: Thu, 12 Dec 2019 10:38:42 -0800
Message-ID: <cover.1576105486.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: vishwanath.somayaji@intel.com, dvhart@infradead.org, linux-kernel@vger.kernel.org, mika.westerberg@intel.com, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Peter Zijlstra <peterz@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kan Liang <kan.liang@intel.com>, "David E . Box" <david.e.box@intel.com>, Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, Tony Luck <tony.luck@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

Patch 1: Cleans up termination lines
Patch 2: Refactor driver for ease of adding new SoCs
Patch 3: Add debugfs entry for PCH IPs only if platform supports
Patch 4: Add Tiger Lake legacy support to pmc_core
Patch 5: Add Elkhart Lake legacy support to pmc_core

All the information regarding the PCH IPs and names of IPs will be
available in Intel's Platform Controller Hub (PCH) External Design
Specification (EDS) document expected to be released in 2020 before
product launch.

Changes since v1:
1) Added a patch that fixes the naming inconsistency.
2) Fixed the prefix of all the patches.

Changes since v2:
1) Add Comet Lake legacy support to pmc_core up on Dell's request.

Changes since v3:
1) Removed both "SoC naming inconsistency" patch and "Add Comet Lake legacy
support to pmc_core" patch from this series and sent them as a series which
was made upstream.
2) Updated LTR IGNORE Max offset for Tiger Lake and Elkhart Lake by defining a
macro as they are platform specific.

Gayatri Kammela (5):
  platform/x86: intel_pmc_core: Clean up: Remove comma after the
    termination line
  platform/x86: intel_pmc_core: Create platform dependent pmc bitmap
    structs
  platform/x86: intel_pmc_core: Make debugfs entry for
    pch_ip_power_gating_status conditional
  platform/x86: intel_pmc_core: Add Tiger Lake (TGL) platform support to
    intel_pmc_core driver
  platform/x86: intel_pmc_core: Add Atom based Elkhart Lake (EHL)
    platform support to intel_pmc_core driver

 drivers/platform/x86/intel_pmc_core.c | 108 +++++++++++++++++++++-----
 drivers/platform/x86/intel_pmc_core.h |   4 +-
 2 files changed, 90 insertions(+), 22 deletions(-)

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kan Liang <kan.liang@intel.com>
Cc: David E. Box <david.e.box@intel.com>
Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>
-- 
2.17.1
