From: sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [RFC v2 0/6] PMC/PUNIT IPC driver cleanup
Date: Sat,  2 Sep 2017 18:24:43 -0700
Message-ID: <1504401889-113524-1-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: souvik.k.chakravarty@intel.com, x86@kernel.org, mingo@redhat.com, qipeng.zha@intel.com, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, lee.jones@linaro.org, andy@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, sathyaosid@gmail.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Hi All,

Currently intel_pmc_ipc.c, intel_punit_ipc.c, intel_scu_ipc.c drivers implements the same IPC features.
This code duplication could be avoided if we implement the IPC driver as a generic library and let custom
device drivers use API provided by generic driver. This patchset mainly addresses this issue.

Along with above code duplication issue, This patch-set also addresses following issues in intel_pmc_ipc and
intel_punit_ipc drivers. 

1. Intel_pmc_ipc.c driver does not use any resource managed(devm_*) calls.
2. In Intel_pmc_ipc.c driver, dependent devices like PUNIT, Telemetry and iTCO are created manually and uses lot of redundant buffer code.
3. Global variable is used to store the IPC device structure and it is used across all functions in intel_pmc_ipc.c and intel_punit_ipc.c.

TODO: Cleanup patch for intel_scu_ipc.c will be submitted in next version. I submitted this intermediate version, to get the review comments
for other patches.

More info on adapted solution:
------------------------------

A generic Intel IPC class driver has been implemented and all common IPC helper functions has been moved to this driver. It exposes APIs to create IPC device channel, send raw IPC command and simple IPC commands. It also creates device attribute to send IPC command from user space.

API for creating a new IPC channel device is,

struct intel_ipc_dev *devm_intel_ipc_dev_create(struct device *dev, const char *devname, struct intel_ipc_dev_cfg *cfg, struct intel_ipc_dev_ops *ops)

The IPC channel drivers (PUNIT/PMC/SCU) when creating a new device can configure their device params like register mapping, irq, irq-mode, channel type,etc  using intel_ipc_dev_cfg and intel_ipc_dev_ops arguments. After a new IPC channel device is created, IPC users can use the generic APIs to make IPC calls.

For example, after using this new model, IPC call to PMC device will look like,

pmc_ipc_dev = intel_ipc_dev_get(INTEL_PMC_IPC_DEV);
ipc_dev_raw_cmd(pmc_ipc_dev, cmd, PMC_PARAM_LEN, (u32 *)ipc_in, 1, NULL, 0, 0, 0);

I am still testing the driver in different products. But posted it to get some early comments. I also welcome any PMC/PUNIT driver users to check these patches in their product.

Changes since v1:
 * Merged devm_* changes in pmc_plat_probe and pmc_pci_probe functions into a
   single patch.
 * Addressed Andy's comment about keeping the library generic by not implementing
   the low level reg access calls in intel_ipc_dev.c. This version will start using
   the regmap pointer provided by channel drivers instead of fixed memory map.
 * Removed custom IPC APIs in intel_pmc_ipc.c and intel_punit_ipc.c.
 * Cleaned up IPC driver users to use APIs provided by generic library (intel_ipc_dev.c).

Kuppuswamy Sathyanarayanan (6):
  platform/x86: intel_pmc_ipc: Use devm_* calls in driver probe function
  platform/x86: intel_pmc_ipc: Use MFD framework to create dependent
    devices
  platform/x86: intel_pmc_ipc: Use regmap calls for GCR updates
  platform: x86: Add generic Intel IPC driver
  platform/x86: intel_punit_ipc: Use generic intel ipc device calls
  platform/x86: intel_pmc_ipc: Use generic Intel IPC device calls

 arch/x86/include/asm/intel_pmc_ipc.h            |  37 +-
 arch/x86/include/asm/intel_punit_ipc.h          | 125 ++--
 drivers/mfd/intel_soc_pmic_bxtwc.c              |  24 +-
 drivers/platform/x86/Kconfig                    |  10 +
 drivers/platform/x86/Makefile                   |   1 +
 drivers/platform/x86/intel_ipc_dev.c            | 473 ++++++++++++
 drivers/platform/x86/intel_pmc_ipc.c            | 927 +++++++++---------------
 drivers/platform/x86/intel_punit_ipc.c          | 293 +++-----
 drivers/platform/x86/intel_telemetry_pltdrv.c   | 202 +++---
 include/linux/mfd/intel_soc_pmic.h              |   2 +
 include/linux/platform_data/x86/intel_ipc_dev.h | 175 +++++
 11 files changed, 1284 insertions(+), 985 deletions(-)
 create mode 100644 drivers/platform/x86/intel_ipc_dev.c
 create mode 100644 include/linux/platform_data/x86/intel_ipc_dev.h

-- 
2.7.4
