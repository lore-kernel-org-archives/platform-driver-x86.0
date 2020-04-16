From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v9 20/20] MAINTAINERS: Update entry for Intel Broxton PMC driver
Date: Thu, 16 Apr 2020 11:15:52 +0300
Message-ID: <20200416081552.68083-21-mika.westerberg@linux.intel.com>
References: <20200416081552.68083-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200416081552.68083-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The driver lives now under MFD so split the current entry into two parts
and add me as co-maintainer of the Intel Broxton PMC driver. While there
correct formatting of Zha Qipeng's email address.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db31497..9d5694a59bec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8495,6 +8495,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/intel_atomisp2_pm.c
 
+INTEL BROXTON PMC DRIVER
+M:	Mika Westerberg <mika.westerberg@linux.intel.com>
+M:	Zha Qipeng <qipeng.zha@intel.com>
+S:	Maintained
+F:	drivers/mfd/intel_pmc_bxt.c
+F:	include/linux/mfd/intel_pmc_bxt.h
+
 INTEL C600 SERIES SAS CONTROLLER DRIVER
 M:	Intel SCU Linux support <intel-linux-scu@intel.com>
 M:	Artur Paszkiewicz <artur.paszkiewicz@intel.com>
@@ -8702,6 +8709,13 @@ F:	include/uapi/linux/mic_common.h
 F:	include/uapi/linux/mic_ioctl.h
 F:	include/uapi/linux/scif_ioctl.h
 
+INTEL P-Unit IPC DRIVER
+M:	Zha Qipeng <qipeng.zha@intel.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	arch/x86/include/asm/intel_punit_ipc.h
+F:	drivers/platform/x86/intel_punit_ipc.c
+
 INTEL PMC CORE DRIVER
 M:	Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
 M:	Vishwanath Somayaji <vishwanath.somayaji@intel.com>
@@ -8709,15 +8723,6 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/intel_pmc_core*
 
-INTEL PMC/P-Unit IPC DRIVER
-M:	Zha Qipeng<qipeng.zha@intel.com>
-L:	platform-driver-x86@vger.kernel.org
-S:	Maintained
-F:	arch/x86/include/asm/intel_pmc_ipc.h
-F:	arch/x86/include/asm/intel_punit_ipc.h
-F:	drivers/platform/x86/intel_pmc_ipc.c
-F:	drivers/platform/x86/intel_punit_ipc.c
-
 INTEL PMIC GPIO DRIVERS
 M:	Andy Shevchenko <andy@kernel.org>
 S:	Maintained
-- 
2.25.1
