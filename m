From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] platform/x86: intel_pmc_ipc: Remove unused iTCO_version variable
Date: Tue,  3 Jan 2017 06:46:14 -0800
Message-ID: <1483454774-906-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Zha Qipeng <qipeng.zha@intel.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
List-Id: platform-driver-x86.vger.kernel.org

iTCO_version was there since the driver was introduced but never used.
Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/platform/x86/intel_pmc_ipc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 0bf51d574fa9..59a86121105b 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -97,8 +97,6 @@
 #define TCO_PMC_OFFSET			0x8
 #define TCO_PMC_SIZE			0x4
 
-static const int iTCO_version = 3;
-
 static struct intel_pmc_ipc_dev {
 	struct device *dev;
 	void __iomem *ipc_base;
-- 
2.7.4
