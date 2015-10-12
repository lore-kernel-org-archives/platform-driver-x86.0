From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v2 4/4] platform:x86: Makefile/Kconfig/MAINTAINERS changes for Intel Telemetry
Date: Mon, 12 Oct 2015 15:03:21 +0530
Message-ID: <1444642401-6647-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:45254 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751308AbbJLJ3q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Oct 2015 05:29:46 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, srinidhi.kasagar@intel.com, qipeng.zha@intel.com, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

Makefile, Kconfig & MAINTAINERS changes for compiling Telemetry.
It depends on PUNIT and PMC IPC drivers.

Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

---
Changes in v2:
* Change bool to tristate in Kconfig to enable support as module
* Remove PUNIT_IPC specific additions. These will be merged separately
  by Qipeng's PUNIT_IPC patch.
---
 MAINTAINERS                   |    9 +++++++++
 drivers/platform/x86/Kconfig  |   11 +++++++++++
 drivers/platform/x86/Makefile |    3 +++
 3 files changed, 23 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4d8c8e1..a7f3c1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5548,6 +5548,15 @@ S:	Maintained
 F:	drivers/platform/x86/intel_pmc_ipc.c
 F:	arch/x86/include/asm/intel_pmc_ipc.h
 
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
index 6dc13e4..eb8f024 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -919,4 +919,15 @@ config INTEL_PMC_IPC
 	The PMC is an ARC processor which defines IPC commands for communication
 	with other entities in the CPU.
 
+config INTEL_TELEMETRY
+	tristate "Intel SoC Telemetry Driver"
+	default n
+        depends on INTEL_PMC_IPC && INTEL_PUNIT_IPC && X86_64
+	---help---
+	  This driver provides interfaces to configure and use
+	  telemetry for INTEL SoC from APL onwards. It is also
+	  used to get various SoC events and parameters
+	  directly via debugfs files. Various tools may use
+	  this interface for SoC state monitoring.
+
 endif # X86_PLATFORM_DEVICES
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index dda95a9..34f6ebf 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -60,3 +60,6 @@ obj-$(CONFIG_INTEL_SMARTCONNECT)	+= intel-smartconnect.o
 obj-$(CONFIG_PVPANIC)           += pvpanic.o
 obj-$(CONFIG_ALIENWARE_WMI)	+= alienware-wmi.o
 obj-$(CONFIG_INTEL_PMC_IPC)	+= intel_pmc_ipc.o
+obj-$(CONFIG_INTEL_TELEMETRY)	+= intel_telemetry_core.o \
+				   intel_telemetry_pltdrv.o \
+				   intel_telemetry_debugfs.o
-- 
1.7.9.5
