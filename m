From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v5 18/18] MAINTAINERS: Update entry for Intel Broxton PMC driver
Date: Tue, 11 Feb 2020 16:26:03 +0300
Message-ID: <20200211132603.73509-19-mika.westerberg@linux.intel.com>
References: <20200211132603.73509-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200211132603.73509-1-mika.westerberg@linux.intel.com>
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
 MAINTAINERS | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4d4e3241bf99..241f17bb309e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8371,6 +8371,13 @@ L:	platform-driver-x86@vger.kernel.org
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
@@ -8586,13 +8593,11 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/intel_pmc_core*
 
-INTEL PMC/P-Unit IPC DRIVER
-M:	Zha Qipeng<qipeng.zha@intel.com>
+INTEL P-Unit IPC DRIVER
+M:	Zha Qipeng <qipeng.zha@intel.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	arch/x86/include/asm/intel_pmc_ipc.h
 F:	arch/x86/include/asm/intel_punit_ipc.h
-F:	drivers/platform/x86/intel_pmc_ipc.c
 F:	drivers/platform/x86/intel_punit_ipc.c
 
 INTEL PMIC GPIO DRIVERS
-- 
2.25.0
