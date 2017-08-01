From: sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [RFC v1 0/6] PMC/PUNIT IPC driver cleanup
Date: Tue,  1 Aug 2017 11:13:48 -0700
Message-ID: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:33856 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751352AbdHASOR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 14:14:17 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: x86@kernel.org, mingo@redhat.com, qipeng.zha@intel.com, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, andy@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, sathyaosid@gmail.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Hi All,

Currently intel_pmc_ipc.c, intel_punit_ipc.c, intel_scu_ipc.c drivers implements the same IPC features.
This code duplication could be avoided if we implement the IPC driver as a single library and let custom
device drivers use API provided by generic driver. This patchset mainly addresses this issue.

For now, Since we don't have any good test platform for SCU, I am not planning to modify intel_scu_ipc.c.

This patch-set addresses following issues(except #4) in intel_pmc_ipc and intel_punit_ipc drivers.

1. Intel_pmc_ipc.c driver does not use any resource managed(devm_*) calls.
2. In Intel_pmc_ipc.c driver, dependent devices like PUNIT, Telemetry and iTCO are created manually and uses lot of redundant buffer code.
3. Code duplication related to IPC helper functions in both PMC and PUNIT IPC drivers.
4. Global variable is used to store the IPC device structure and it is used across all functions in intel_pmc_ipc.c and intel_punit_ipc.c.

Patch #1, #2 fixes the issue #1.

Patch #3 fixes the issue #2.

Patch #4, #5, #6 fixes the issue #3.

To fix issue #4 we might need to make changes to drivers that use IPC APIs. So I am not sure whether its worth the effort. Maintainers, let me know your inputs.

If we have to address it, then we might need to adapt to model similar to extcon framework.

ipc_dev = intel_ipc_get_dev("intel_pmc_ipc");

PMC IPC call would look like,

intel_pmc_ipc_command(ipc_dev, cmd, sub, in, inlen, out, outlen)

More info on adapted solution (for issue #1):
----------------------------------------------

A generic Intel IPC class driver has been implemented and all common IPC helper functions has been moved to this driver. It exposes APIs to create IPC device channel, send raw IPC comman and simple IPC commands. It also creates device attribute to send IPC command from user space.

API for creating a new IPC channel device is,

struct intel_ipc_dev *devm_intel_ipc_dev_create(struct device *dev, const char *devname, struct intel_ipc_dev_cfg *cfg, struct intel_ipc_dev_ops *ops)

The IPC channel drivers (PUNIT/PMC/SCU) when creating a new device can configure their device params like register mapping, irq, irq-mode, channel type, etc  using intel_ipc_dev_cfg and intel_ipc_dev_ops arguments. After a new IPC channel device is created, we can use the APIs provided by generic IPC device driver to implement the custom channel specific APIs.

For example, after using this new model, PMC ipc comand send routine will look like,

int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen, u32 *out, u32 outlen)
{
    // this function is implemented in generic Intel IPC class driver.
    return ipc_dev_raw_cmd(ipcdev.pmc_ipc_dev, f(cmd, sub), in, inlen, out, outlen, 0, 0);
}

I am still testing the driver in different products. But posted it to get some early comments. I also welcome any PMC/PUNIT driver users to check these patches in their product.



Kuppuswamy Sathyanarayanan (6):
  platform/x86: intel_pmc_ipc: Fix error handling in ipc_pci_probe()
  platform/x86: intel_pmc_ipc: Use devm_* calls in driver probe
  platform/x86: intel_pmc_ipc: Use MFD framework to create dependent
    devices
  platform: x86: Add generic Intel IPC driver
  platform/x86: intel_punit_ipc: Use generic intel ipc device calls
  platform/x86: intel_pmc_ipc: Use generic Intel IPC device calls

 arch/x86/include/asm/intel_ipc_dev.h   | 148 +++++++
 drivers/platform/x86/Kconfig           |   8 +
 drivers/platform/x86/Makefile          |   1 +
 drivers/platform/x86/intel_ipc_dev.c   | 433 ++++++++++++++++++++
 drivers/platform/x86/intel_pmc_ipc.c   | 715 ++++++++++++---------------------
 drivers/platform/x86/intel_punit_ipc.c | 234 ++++-------
 6 files changed, 930 insertions(+), 609 deletions(-)
 create mode 100644 arch/x86/include/asm/intel_ipc_dev.h
 create mode 100644 drivers/platform/x86/intel_ipc_dev.c

-- 
2.7.4
