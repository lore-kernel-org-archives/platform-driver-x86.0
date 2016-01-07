From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v3 5/5] platform:x86: Makefile/Kconfig/MAINTAINERS changes for Intel Telemetry
Date: Thu,  7 Jan 2016 14:38:45 +0530
Message-ID: <1452157725-10778-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, srinidhi.kasagar@intel.com, qipeng.zha@intel.com, rajeev.d.muralidhar@intel.com, sukumar.ghorai@intel.com, ong.hock.yu@intel.com, aubrey.li@intel.com, david.ginat@intel.com, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Makefile, Kconfig & MAINTAINERS changes for compiling Telemetry.
It depends on PUNIT and PMC IPC drivers.

Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
---
 MAINTAINERS                   |    9 +++++++++
 drivers/platform/x86/Kconfig  |   11 +++++++++++
 drivers/platform/x86/Makefile |    3 +++
 3 files changed, 23 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46c1393..72d8245 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5693,6 +5693,15 @@ F:	drivers/platform/x86/intel_punit_ipc.c
 F:	arch/x86/include/asm/intel_pmc_ipc.h
 F:	arch/x86/include/asm/intel_punit_ipc.h
 
+INTEL TELEMETRY DRIVER
+M:	Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/intel_telemetry_core.c
+F:	drivers/platform/x86/intel_telemetry_pltdrv.c
+F:	drivers/platform/x86/intel_telemetry_debugfs.c
+F:	arch/x86/include/asm/intel_telemetry.h
+
 IOC3 ETHERNET DRIVER
 M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-mips@linux-mips.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 148ff88..4c1d55d 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -950,4 +950,15 @@ config INTEL_PUNIT_IPC
 	---help---
 	  This driver provides support for Intel P-Unit Mailbox IPC mechanism,
 	  which is used to bridge the communications between kernel and P-Unit.
+
+config INTEL_TELEMETRY
+	tristate "Intel SoC Telemetry Driver"
+	default n
+	depends on INTEL_PMC_IPC && INTEL_PUNIT_IPC && X86_64
+	---help---
+	  This driver provides interfaces to configure and use
+	  telemetry for INTEL SoC from APL onwards. It is also
+	  used to get various SoC events and parameters
+	  directly via debugfs files. Various tools may use
+	  this interface for SoC state monitoring.
 endif # X86_PLATFORM_DEVICES
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 5ee5425..17538b0 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -63,3 +63,6 @@ obj-$(CONFIG_ALIENWARE_WMI)	+= alienware-wmi.o
 obj-$(CONFIG_INTEL_PMC_IPC)	+= intel_pmc_ipc.o
 obj-$(CONFIG_SURFACE_PRO3_BUTTON)	+= surfacepro3_button.o
 obj-$(CONFIG_INTEL_PUNIT_IPC)  += intel_punit_ipc.o
+obj-$(CONFIG_INTEL_TELEMETRY)	+= intel_telemetry_core.o \
+				   intel_telemetry_pltdrv.o \
+				   intel_telemetry_debugfs.o
-- 
1.7.9.5
