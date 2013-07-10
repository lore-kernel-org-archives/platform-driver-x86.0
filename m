From: Shuah Khan <shuah.kh@samsung.com>
Subject: [PATCH 2/4] rtc: convert rtc-cmos to dev_pm_ops from legacy pm_ops
Date: Tue,  9 Jul 2013 22:09:53 -0600
Message-ID: <1373429393-3907-1-git-send-email-shuah.kh@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rafael.j.wysocki@intel.com, bhelgaas@google.com, a.zummo@towertech.it, key@linux.vnet.ibm.com, mail@srajiv.net, tpmdd@selhorst.net, tpmdd@sirrix.com, matthew.garrett@nebula.com
Cc: Shuah Khan <shuah.kh@samsung.com>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, tpmdd-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, shuahkhan@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

Convert drivers/rtc/rtc-cmos to use dev_pm_ops instead of legacy pm_ops.
This patch depends on pnp driver bus ops change to invoke pnp_driver
dev_pm_ops.

Signed-off-by: Shuah Khan <shuah.kh@samsung.com>
---
 drivers/rtc/rtc-cmos.c |   24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index be06d71..24e733c 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -1018,23 +1018,6 @@ static void __exit cmos_pnp_remove(struct pnp_dev *pnp)
 	cmos_do_remove(&pnp->dev);
 }
 
-#ifdef	CONFIG_PM
-
-static int cmos_pnp_suspend(struct pnp_dev *pnp, pm_message_t mesg)
-{
-	return cmos_suspend(&pnp->dev);
-}
-
-static int cmos_pnp_resume(struct pnp_dev *pnp)
-{
-	return cmos_resume(&pnp->dev);
-}
-
-#else
-#define	cmos_pnp_suspend	NULL
-#define	cmos_pnp_resume		NULL
-#endif
-
 static void cmos_pnp_shutdown(struct pnp_dev *pnp)
 {
 	if (system_state == SYSTEM_POWER_OFF && !cmos_poweroff(&pnp->dev))
@@ -1060,8 +1043,11 @@ static struct pnp_driver cmos_pnp_driver = {
 
 	/* flag ensures resume() gets called, and stops syslog spam */
 	.flags		= PNP_DRIVER_RES_DO_NOT_CHANGE,
-	.suspend	= cmos_pnp_suspend,
-	.resume		= cmos_pnp_resume,
+#ifdef CONFIG_PM_SLEEP
+	.driver		= {
+			.pm = &cmos_pm_ops,
+	},
+#endif
 };
 
 #endif	/* CONFIG_PNP */
-- 
1.7.10.4
