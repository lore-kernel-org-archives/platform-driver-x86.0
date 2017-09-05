From: sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: [RFC v3 0/7] PMC/PUNIT IPC driver cleanup
Date: Mon,  4 Sep 2017 22:37:20 -0700
Message-ID: <cover.1504588701.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, souvik.k.chakravarty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

Hi All,

Currently intel_pmc_ipc.c, intel_punit_ipc.c, intel_scu_ipc.c drivers implements the same IPC features.
This code duplication could be avoided if we implement the IPC driver as a generic library and let custom
device drivers use API provided by generic driver. This patchset mainly addresses this issue.

Along with above code duplication issue, This patchset also addresses following issues in intel_pmc_ipc and
intel_punit_ipc drivers. 

1. Intel_pmc_ipc.c driver does not use any resource managed (devm_*) calls.
2. In Intel_pmc_ipc.c driver, dependent devices like PUNIT, Telemetry and iTCO are created manually and uses lot of redundant buffer code.
3. Global variable is used to store the IPC device structure and it is used across all functions in intel_pmc_ipc.c and intel_punit_ipc.c.

More info on Intel IPC device library:
-------------------------------------

A generic Intel IPC class driver has been implemented and all common IPC helper functions has been moved to this driver. It exposes APIs to create IPC device channel, send raw IPC command and simple IPC commands. It also creates device attribute to send IPC command from user space.

API for creating a new IPC channel device is,

struct intel_ipc_dev *devm_intel_ipc_dev_create(struct device *dev, const char *devname, struct intel_ipc_dev_cfg *cfg, struct intel_ipc_dev_ops *ops)

The IPC channel drivers (PUNIT/PMC/SCU) when creating a new device can configure their device params like register mapping, irq, irq-mode, channel type,etc  using intel_ipc_dev_cfg and intel_ipc_dev_ops arguments. After a new IPC channel device is created, IPC users can use the generic APIs to make IPC calls.

For example, after using this new model, IPC call to PMC device will look like,

pmc_ipc_dev = intel_ipc_dev_get(INTEL_PMC_IPC_DEV);
ipc_dev_raw_cmd(pmc_ipc_dev, cmd, PMC_PARAM_LEN, (u32 *)ipc_in, 1, NULL, 0, 0, 0);

I am still testing the driver in different products. But posted it to get some early comments. I also welcome any PMC/PUNIT driver users to check these patches in their product.

Changes since v2:
 * Refactored intel_scu_ipc.c to use generic IPC device APIs.
 * Fixed intel_pmc_ipc.c to use pcim_* device managed functions.

Changes since v1:
 * Merged devm_* changes in pmc_plat_probe and pmc_pci_probe functions into a
   single patch.
 * Addressed Andy's comment about keeping the library generic by not implementing
   the low level reg access calls in intel_ipc_dev.c. This version will start using
   the regmap pointer provided by channel drivers instead of fixed memory map.
 * Removed custom IPC APIs in intel_pmc_ipc.c and intel_punit_ipc.c.
 * Cleaned up IPC driver users to use APIs provided by generic library (intel_ipc_dev.c).

Kuppuswamy Sathyanarayanan (7):
  platform/x86: intel_pmc_ipc: Use devm_* calls in driver probe function
  platform/x86: intel_pmc_ipc: Use MFD framework to create dependent
    devices
  platform/x86: intel_pmc_ipc: Use regmap calls for GCR updates
  platform: x86: Add generic Intel IPC driver
  platform/x86: intel_punit_ipc: Use generic intel ipc device calls
  platform/x86: intel_pmc_ipc: Use generic Intel IPC device calls
  platform/x86: intel_scu_ipc: Use generic Intel IPC device calls

 arch/x86/include/asm/intel_pmc_ipc.h            |  37 +-
 arch/x86/include/asm/intel_punit_ipc.h          | 125 ++--
 arch/x86/include/asm/intel_scu_ipc.h            |  23 +-
 arch/x86/platform/intel-mid/intel-mid.c         |  12 +-
 drivers/mfd/intel_soc_pmic_bxtwc.c              |  18 +-
 drivers/platform/x86/Kconfig                    |  11 +
 drivers/platform/x86/Makefile                   |   1 +
 drivers/platform/x86/intel_ipc_dev.c            | 539 ++++++++++++++
 drivers/platform/x86/intel_pmc_ipc.c            | 948 +++++++++---------------
 drivers/platform/x86/intel_punit_ipc.c          | 297 +++-----
 drivers/platform/x86/intel_scu_ipc.c            | 483 +++++-------
 drivers/platform/x86/intel_telemetry_pltdrv.c   | 210 +++---
 drivers/rtc/rtc-mrst.c                          |  15 +-
 drivers/watchdog/intel-mid_wdt.c                |  12 +-
 drivers/watchdog/intel_scu_watchdog.c           |  17 +-
 include/linux/mfd/intel_soc_pmic.h              |   2 +
 include/linux/platform_data/x86/intel_ipc_dev.h | 187 +++++
 17 files changed, 1617 insertions(+), 1320 deletions(-)
 create mode 100644 drivers/platform/x86/intel_ipc_dev.c
 create mode 100644 include/linux/platform_data/x86/intel_ipc_dev.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
