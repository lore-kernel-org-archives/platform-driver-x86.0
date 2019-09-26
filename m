From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v1 0/5] Add Tiger Lake/Elkhart Lake support to pmc_core driver
Date: Thu, 26 Sep 2019 12:25:58 -0700
Message-ID: <20190926192603.18647-1-gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: vishwanath.somayaji@intel.com, dvhart@infradead.org, linux-kernel@vger.kernel.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Peter Zijlstra <peterz@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kan Liang <kan.liang@intel.com>, "David E . Box" <david.e.box@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Tony Luck <tony.luck@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

Patch 1: Cleans up termination lines
Patch 2: Refactor driver for ease of adding new SoCs
Patch 3: Refactor debugfs entry for PCH IPs power gating status
Patch 4: Add Tiger Lake legacy support to pmc_core
Patch 5: Add Elkhart Lake legacy support to pmc_core

All the information regarding the PCH IPs and names of IPs will be available
in *future* Intel's Platform Controller Hub (PCH) External Design Specification
(EDS) document.

Gayatri Kammela (5):
  x86/intel_pmc_core: Clean up: Remove comma after the termination line
  x86/intel_pmc_core: Create platform dependent pmc bitmap structs
  x86/intel_pmc_core: Make debugfs entry for pch_ip_power_gating_status
    conditional
  platform/x86: Add Tiger Lake(TGL) platform support to intel_pmc_core
    driver
  platform/x86: Add Atom based Elkhart Lake(EHL) platform support to
    intel_pmc_core driver

 drivers/platform/x86/intel_pmc_core.c | 108 +++++++++++++++++++++-----
 drivers/platform/x86/intel_pmc_core.h |   2 +-
 2 files changed, 88 insertions(+), 22 deletions(-)

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kan Liang <kan.liang@intel.com>
Cc: David E. Box <david.e.box@intel.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Tony Luck <tony.luck@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
-- 
2.17.1
