From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v3 0/5] platform/x86: intel_pmc_core: Add bug fixes or code
Date: Sun,  1 Mar 2020 12:44:21 -0800
Message-ID: <cover.1583093898.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Chen Zhou <chenzhou10@huawei.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Box <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

This patch series consists of bug fixes and code optimization for the
series https://patchwork.kernel.org/patch/11365325/

Patch 1: Relocate both pmc_core_slps0_display() and pmc_core_lpm_display()
Patch 2: Remove the duplicate if() condition to create debugfs entry
Patch 3: Add back slp_s0_offset attribute back to tgl_reg_map
Patch 4: Make pmc_core_substate_res_show() generic
Patch 5: Make pmc_core_lpm_display() generic

Changes since v1:
1) Changed the order of the patches i.e., patch 2 in v1 is made first in
   the order for v2.
2) Fixed the warnings reported by kbuild test robot.

Changes since v2:
1) Add "Make pmc_core_substate_res_show() generic" patch to v3.
2) Fixed the memory leak issue in pmc_core_lpm_display().
3) Moved patch 2 in v2 to the last in the series in v3.

Gayatri Kammela (5):
  platform/x86: intel_pmc_core: fix: Relocate pmc_core_slps0_display()
    and pmc_core_lpm_display() to outside of CONFIG_DEBUG_FS
  platform/x86: intel_pmc_core: fix: Remove the duplicate if() to create
    debugfs entry for substate_live_status_registers
  platform/x86: intel_pmc_core: fix: Add slp_s0_offset attribute back to
    tgl_reg_map
  platform/x86: intel_pmc_core: Make pmc_core_substate_res_show()
    generic
  platform/x86: intel_pmc_core: fix: Make pmc_core_lpm_display() generic
    for platforms that support sub-states

 drivers/platform/x86/intel_pmc_core.c | 148 +++++++++++++++-----------
 drivers/platform/x86/intel_pmc_core.h |   3 +-
 2 files changed, 85 insertions(+), 66 deletions(-)

base-commit: 7adb1e8aeeb5d4d88012568b2049599c1a247cf2

Cc: Chen Zhou <chenzhou10@huawei.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Box <david.e.box@intel.com>
-- 
2.17.1
