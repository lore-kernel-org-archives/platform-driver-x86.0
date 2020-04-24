From: Lee Jones <lee.jones@linaro.org>
Subject: [GIT PULL] Immutable branch between MFD, X86, USB and Watchdog due
 for the v5.7 merge window
Date: Fri, 24 Apr 2020 11:24:52 +0100
Message-ID: <20200424102452.GB8414@dell>
References: <20200416081552.68083-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200416081552.68083-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Enjoy!

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-x86-usb-watchdog-v5.7

for you to fetch changes up to 2f72d35ea75ee8bf8c9e63fb43d43d5bfb4ac8fd:

  MAINTAINERS: Update entry for Intel Broxton PMC driver (2020-04-24 11:18:51 +0100)

----------------------------------------------------------------
Immutable branch between MFD, X86, USB and Watchdog due for the v5.7 merge window

----------------------------------------------------------------
Heikki Krogerus (1):
      usb: typec: mux: Convert the Intel PMC Mux driver to use new SCU IPC API

Mika Westerberg (19):
      platform/x86: intel_scu_ipc: Split out SCU IPC functionality from the SCU driver
      platform/x86: intel_scu_ipc: Log more information if SCU IPC command fails
      platform/x86: intel_scu_ipc: Move legacy SCU IPC API to a separate header
      platform/x86: intel_scu_ipc: Introduce new SCU IPC API
      platform/x86: intel_mid_powerbtn: Convert to use new SCU IPC API
      watchdog: intel-mid_wdt: Convert to use new SCU IPC API
      platform/x86: intel_scu_ipcutil: Convert to use new SCU IPC API
      platform/x86: intel_scu_ipc: Add managed function to register SCU IPC
      platform/x86: intel_pmc_ipc: Start using SCU IPC
      mfd: intel_soc_pmic: Add SCU IPC member to struct intel_soc_pmic
      mfd: intel_soc_pmic_bxtwc: Convert to use new SCU IPC API
      mfd: intel_soc_pmic_mrfld: Convert to use new SCU IPC API
      platform/x86: intel_telemetry: Convert to use new SCU IPC API
      platform/x86: intel_pmc_ipc: Drop intel_pmc_ipc_command()
      x86/platform/intel-mid: Add empty stubs for intel_scu_devices_[create|destroy]()
      platform/x86: intel_pmc_ipc: Move PCI IDs to intel_scu_pcidrv.c
      platform/x86: intel_telemetry: Add telemetry_get_pltdata()
      platform/x86: intel_pmc_ipc: Convert to MFD
      MAINTAINERS: Update entry for Intel Broxton PMC driver

 .../ABI/obsolete/sysfs-driver-intel_pmc_bxt        |  22 +
 MAINTAINERS                                        |  23 +-
 arch/x86/Kconfig                                   |   2 +-
 arch/x86/include/asm/intel-mid.h                   |   9 +-
 arch/x86/include/asm/intel_pmc_ipc.h               |  59 --
 arch/x86/include/asm/intel_scu_ipc.h               | 114 +--
 arch/x86/include/asm/intel_scu_ipc_legacy.h        |  91 ++
 arch/x86/include/asm/intel_telemetry.h             |   6 +-
 drivers/mfd/Kconfig                                |  20 +-
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/intel_pmc_bxt.c                        | 468 ++++++++++
 drivers/mfd/intel_soc_pmic_bxtwc.c                 |  34 +-
 drivers/mfd/intel_soc_pmic_mrfld.c                 |  10 +-
 drivers/platform/x86/Kconfig                       |  46 +-
 drivers/platform/x86/Makefile                      |   2 +-
 drivers/platform/x86/intel_mid_powerbtn.c          |  15 +-
 drivers/platform/x86/intel_pmc_ipc.c               | 949 ---------------------
 drivers/platform/x86/intel_scu_ipc.c               | 447 +++++++---
 drivers/platform/x86/intel_scu_ipcutil.c           |  43 +-
 drivers/platform/x86/intel_scu_pcidrv.c            |  68 ++
 drivers/platform/x86/intel_telemetry_core.c        |  17 +-
 drivers/platform/x86/intel_telemetry_debugfs.c     |  15 +-
 drivers/platform/x86/intel_telemetry_pltdrv.c      |  97 ++-
 drivers/usb/typec/mux/Kconfig                      |   2 +-
 drivers/usb/typec/mux/intel_pmc_mux.c              |  12 +-
 drivers/usb/typec/tcpm/Kconfig                     |   2 +-
 drivers/watchdog/iTCO_wdt.c                        |  25 +-
 drivers/watchdog/intel-mid_wdt.c                   |  53 +-
 include/linux/mfd/intel_pmc_bxt.h                  |  53 ++
 include/linux/mfd/intel_soc_pmic.h                 |  15 +
 include/linux/platform_data/itco_wdt.h             |  11 +-
 31 files changed, 1411 insertions(+), 1320 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-driver-intel_pmc_bxt
 delete mode 100644 arch/x86/include/asm/intel_pmc_ipc.h
 create mode 100644 arch/x86/include/asm/intel_scu_ipc_legacy.h
 create mode 100644 drivers/mfd/intel_pmc_bxt.c
 delete mode 100644 drivers/platform/x86/intel_pmc_ipc.c
 create mode 100644 drivers/platform/x86/intel_scu_pcidrv.c
 create mode 100644 include/linux/mfd/intel_pmc_bxt.h

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
