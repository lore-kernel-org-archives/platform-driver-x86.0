From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v2 0/4] platform/x86: intel_pmc_core: Add bug fixes or code
Date: Thu, 27 Feb 2020 15:29:12 -0800
Message-ID: <cover.1582845395.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Chen Zhou <chenzhou10@huawei.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Box <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

This patch series consists of bug fixes and code optimization for the
series https://patchwork.kernel.org/patch/11365325/

Patch 1: Relocate both pmc_core_slps0_display() and pmc_core_lpm_display()
Patch 2: Make pmc_core_lpm_display() generic
Patch 3: Remove the duplicate if() condition to create debugfs entry
Patch 4: Add back slp_s0_offset attribute back to tgl_reg_map

Changes since v1:
1) Changed the order of the patches i.e., patch 2 in v1 is made first in
   the order for v2.
2) Fixed the warnings reported by kbuild test robot.

Gayatri Kammela (4):
  platform/x86: intel_pmc_core: fix: Relocate pmc_core_slps0_display()
    and pmc_core_lpm_display() to outside of CONFIG_DEBUG_FS
  platform/x86: intel_pmc_core: fix: Make pmc_core_lpm_display() generic
    for platforms that support sub-states
  platform/x86: intel_pmc_core: fix: Remove the duplicate if() to create
    debugfs entry for substate_live_status_registers
  platform/x86: intel_pmc_core: fix: Add slp_s0_offset attribute back to
    tgl_reg_map

 drivers/platform/x86/intel_pmc_core.c | 140 ++++++++++++++------------
 1 file changed, 75 insertions(+), 65 deletions(-)

base-commit: 7adb1e8aeeb5d4d88012568b2049599c1a247cf2

Cc: Chen Zhou <chenzhou10@huawei.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Box <david.e.box@intel.com>
-- 
2.17.1
