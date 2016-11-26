From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH] x86/intel_mid_thermal: Fix suspend handlers unused warning
Date: Sat, 26 Nov 2016 17:01:51 +0100
Message-ID: <20161126160151.25745-1-bp@alien8.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Borislav Petkov <bp@suse.de>

Fix:

  drivers/platform/x86/intel_mid_thermal.c:424:12: warning: ‘mid_thermal_resume’
  defined but not used [-Wunused-function]
   static int mid_thermal_resume(struct device *dev)
              ^
  drivers/platform/x86/intel_mid_thermal.c:436:12: warning: ‘mid_thermal_suspend’
  defined but not used [-Wunused-function]
   static int mid_thermal_suspend(struct device *dev)
              ^

which I see during randbuilds here.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
---
 drivers/platform/x86/intel_mid_thermal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/intel_mid_thermal.c b/drivers/platform/x86/intel_mid_thermal.c
index 9f713b832ba3..0df3c9d37509 100644
--- a/drivers/platform/x86/intel_mid_thermal.c
+++ b/drivers/platform/x86/intel_mid_thermal.c
@@ -415,6 +415,7 @@ static struct thermal_device_info *initialize_sensor(int index)
 	return td_info;
 }
 
+#ifdef CONFIG_PM_SLEEP
 /**
  * mid_thermal_resume - resume routine
  * @dev: device structure
@@ -442,6 +443,7 @@ static int mid_thermal_suspend(struct device *dev)
 	 */
 	return configure_adc(0);
 }
+#endif
 
 static SIMPLE_DEV_PM_OPS(mid_thermal_pm,
 			 mid_thermal_suspend, mid_thermal_resume);
-- 
2.10.0
