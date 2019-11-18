From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v1 0/2] platform/x86: intel_pmc_core: Add Comet Lake
Date: Mon, 18 Nov 2019 11:05:39 -0800
Message-ID: <cover.1574102528.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: vishwanath.somayaji@intel.com, dvhart@infradead.org, linux-kernel@vger.kernel.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Mario Limonciello <mario.limonciello@dell.com>, Peter Zijlstra <peterz@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kan Liang <kan.liang@intel.com>, "David E . Box" <david.e.box@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Tony Luck <tony.luck@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

Patch 1: Fix SoC naming inconsistency
Patch 2: Add Comet Lake legacy support to pmc_core

Gayatri Kammela (2):
  platform/x86: intel_pmc_core: Fix the SoC naming inconsistency
  platform/x86: intel_pmc_core: Add Comet Lake (CML) platform support to
     intel_pmc_core driver

 drivers/platform/x86/intel_pmc_core.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

Cc: Mario Limonciello <mario.limonciello@dell.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kan Liang <kan.liang@intel.com>
Cc: David E. Box <david.e.box@intel.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Tony Luck <tony.luck@intel.com>

-- 
2.17.1
