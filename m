From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 08/25] thinkpad_acpi: don't use [delayed_]work_pending()
Date: Fri, 21 Dec 2012 17:56:58 -0800
Message-ID: <1356141435-17340-9-git-send-email-tj@kernel.org>
References: <1356141435-17340-1-git-send-email-tj@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1356141435-17340-1-git-send-email-tj@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

There's no need to test whether a (delayed) work item in pending
before queueing, flushing or cancelling it.  Most uses are unnecessary
and quite a few of them are buggy.

Remove unnecessary pending tests from thinkpad_acpi.  Only compile
tested.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: ibm-acpi-devel@lists.sourceforge.net
Cc: platform-driver-x86@vger.kernel.org
---
Please let me know how this patch should be routed.  I can take it
through the workqueue tree if necessary.

Thanks.

 drivers/platform/x86/thinkpad_acpi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 75dd651..8421d1e 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4877,8 +4877,7 @@ static int __init light_init(struct ibm_init_struct *iibm)
 static void light_exit(void)
 {
 	led_classdev_unregister(&tpacpi_led_thinklight.led_classdev);
-	if (work_pending(&tpacpi_led_thinklight.work))
-		flush_workqueue(tpacpi_wq);
+	flush_workqueue(tpacpi_wq);
 }
 
 static int light_read(struct seq_file *m)
-- 
1.8.0.2
