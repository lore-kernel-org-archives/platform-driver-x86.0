From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v1 0/6] PMC Driver cleanup
Date: Thu, 11 Jan 2018 16:40:30 +0530
Message-ID: <1515669036-3465-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch series aims to cleanup the PMC Core driver and convert it to a
module.

Subsequent patch series will add support for newer Intel SoC like Coffeelake
and Cannonlake, this series builds a foundation for them.

Rajneesh Bhardwaj (5):
  platform/x86: intel_pmc_core: Remove unused EXPORTED API
  platform/x86: intel_pmc_core: Remove unused variable
  platform/x86: intel_pmc_core: Fix kernel doc for pmc_dev
  platform/x86: intel_pmc_core: Fix file permission warnings
  platform/x86: intel_pmc_core: Update Kconfig

Srinivas Pandruvada (1):
  platform/x86: intel_pmc_core: Change driver to a module

 drivers/platform/x86/Kconfig          |  7 ++--
 drivers/platform/x86/intel_pmc_core.c | 65 +++++++++++------------------------
 drivers/platform/x86/intel_pmc_core.h | 15 ++++----
 3 files changed, 32 insertions(+), 55 deletions(-)

-- 
2.7.4
