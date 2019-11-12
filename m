From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v2 0/6] x86/intel_pmc_core: Add Tiger Lake and Elkhart Lake
Date: Mon, 11 Nov 2019 20:06:25 -0800
Message-ID: <cover.1573529092.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: vishwanath.somayaji@intel.com, dvhart@infradead.org, linux-kernel@vger.kernel.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Peter Zijlstra <peterz@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kan Liang <kan.liang@intel.com>, "David E . Box" <david.e.box@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Tony Luck <tony.luck@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

Patch 1: Fix SoC naming inconsistency
Patch 2: Cleans up termination lines
Patch 3: Refactor driver for ease of adding new SoCs
Patch 4: Add debugfs entry for PCH IPs only if platform supports
Patch 5: Add Tiger Lake legacy support to pmc_core
Patch 6: Add Elkhart Lake legacy support to pmc_core

All the information regarding the PCH IPs and names of IPs will be
available in Intel's Platform Controller Hub (PCH) External Design
Specification (EDS) document expected to be released in 2020 before
product launch.

Changes since v1:
1)Added a patch that fixes the naming inconsistency.
2)Fixed the prefix of all the patches.

Gayatri Kammela (6):
  x86/intel_pmc_core: Fix the SoC naming inconsistency
  x86/intel_pmc_core: Clean up: Remove comma after the termination line
  x86/intel_pmc_core: Create platform dependent pmc bitmap structs
  x86/intel_pmc_core: Make debugfs entry for pch_ip_power_gating_status
    conditional
  platform/x86: Add Tiger Lake (TGL) platform support to intel_pmc_core
    driver
  platform/x86: Add Atom based Elkhart Lake (EHL) platform support to
    intel_pmc_core driver

 drivers/platform/x86/intel_pmc_core.c | 118 ++++++++++++++++++++------
 drivers/platform/x86/intel_pmc_core.h |   2 +-
 2 files changed, 93 insertions(+), 27 deletions(-)

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kan Liang <kan.liang@intel.com>
Cc: David E. Box <david.e.box@intel.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Tony Luck <tony.luck@intel.com>

-- 
2.17.1
