From: Shuah Khan <shuah.kh@samsung.com>
Subject: [PATCH 4/4] platform: Convert apple-gmux driver to dev_pm_ops from legacy pm_ops
Date: Tue,  9 Jul 2013 22:10:34 -0600
Message-ID: <1373429434-3981-1-git-send-email-shuah.kh@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rafael.j.wysocki@intel.com, bhelgaas@google.com, a.zummo@towertech.it, key@linux.vnet.ibm.com, mail@srajiv.net, tpmdd@selhorst.net, tpmdd@sirrix.com, matthew.garrett@nebula.com
Cc: Shuah Khan <shuah.kh@samsung.com>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, tpmdd-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, shuahkhan@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

Convert drivers/platform/x86/apple-gmux to use dev_pm_ops instead of
legacy pm_ops. This patch depends on pnp driver bus ops change to invoke
pnp_driver dev_pm_ops.

Signed-off-by: Shuah Khan <shuah.kh@samsung.com>
---
 drivers/platform/x86/apple-gmux.c |   18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index f74bfcb..8eea2ef 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -393,17 +393,21 @@ static void gmux_notify_handler(acpi_handle device, u32 value, void *context)
 		complete(&gmux_data->powerchange_done);
 }
 
-static int gmux_suspend(struct pnp_dev *pnp, pm_message_t state)
+static int gmux_suspend(struct device *dev)
 {
+	struct pnp_dev *pnp = to_pnp_dev(dev);
 	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
+
 	gmux_data->resume_client_id = gmux_active_client(gmux_data);
 	gmux_disable_interrupts(gmux_data);
 	return 0;
 }
 
-static int gmux_resume(struct pnp_dev *pnp)
+static int gmux_resume(struct device *dev)
 {
+	struct pnp_dev *pnp = to_pnp_dev(dev);
 	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
+
 	gmux_enable_interrupts(gmux_data);
 	gmux_switchto(gmux_data->resume_client_id);
 	if (gmux_data->power_state == VGA_SWITCHEROO_OFF)
@@ -605,13 +609,19 @@ static const struct pnp_device_id gmux_device_ids[] = {
 	{"", 0}
 };
 
+static const struct dev_pm_ops gmux_dev_pm_ops = {
+	.suspend = gmux_suspend,
+	.resume = gmux_resume,
+};
+
 static struct pnp_driver gmux_pnp_driver = {
 	.name		= "apple-gmux",
 	.probe		= gmux_probe,
 	.remove		= gmux_remove,
 	.id_table	= gmux_device_ids,
-	.suspend	= gmux_suspend,
-	.resume		= gmux_resume
+	.driver		= {
+			.pm = &gmux_dev_pm_ops,
+	},
 };
 
 static int __init apple_gmux_init(void)
-- 
1.7.10.4
