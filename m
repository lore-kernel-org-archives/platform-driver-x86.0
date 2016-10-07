From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v1 0/6] PMC Core driver new features
Date: Fri,  7 Oct 2016 16:01:11 +0530
Message-ID: <1475836277-4788-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch series adds few new features to the Intel PMC Core driver
applicable for Skylake & Kabylake SoCs with Sunrise Point LP PCH. These new
features enhance the low power debug capabilities on Intel platforms. These
debug features can be used for platform power optimization. Please refer to
the commit messages of the individual patches and the 7th Generation Intel
Processor Families I/O for U/Y Platforms datasheet for more documentation.

New debug features:

1. PCH IP Power Gating Status
2. ModPhy Core Lanes Power Gating Status
3. ModPhy PLL (Common Lanes) clock Gating Status
4. LTR Ignore feature
5. Support for Kabylake SoC

Rajneesh Bhardwaj (6):
  intel_pmc_core: Fix PWRMBASE mask and mmio reg len
  intel_pmc_core: Add PCH IP Power Gating Status
  intel_pmc_core: ModPhy core lanes pg status
  intel_pmc_core: Add MPHY PLL clock gating status
  intel_pmc_core: Add LTR IGNORE debug feature
  intel_pmc_core: Add KBL CPUID support

 drivers/platform/x86/intel_pmc_core.c | 386 +++++++++++++++++++++++++++++++++-
 drivers/platform/x86/intel_pmc_core.h | 110 +++++++++-
 2 files changed, 490 insertions(+), 6 deletions(-)

-- 
1.9.1
