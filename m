From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 23/37] platform/x86: intel_pmc_ipc: Get rid of unnecessary includes
Date: Mon, 23 Dec 2019 17:17:02 +0300
Message-ID: <20191223141716.13727-24-mika.westerberg@linux.intel.com>
References: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, x86@kernel.org
Cc: Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

There is no point including headers that are not needed in the driver so
drop them.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 83b106f66fa6..8527327d88c7 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -12,23 +12,13 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/atomic.h>
-#include <linux/bitops.h>
 #include <linux/delay.h>
-#include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
-#include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/notifier.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
-#include <linux/pm.h>
-#include <linux/pm_qos.h>
-#include <linux/sched.h>
-#include <linux/spinlock.h>
-#include <linux/suspend.h>
 
 #include <asm/intel_pmc_ipc.h>
 
-- 
2.24.0
