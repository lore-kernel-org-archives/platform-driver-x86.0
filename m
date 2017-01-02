From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 2/2] platform/x86: intel_mid_thermal: Fix module autoload
Date: Mon,  2 Jan 2017 12:20:56 -0300
Message-ID: <1483370456-30786-2-git-send-email-javier@osg.samsung.com>
References: <1483370456-30786-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483370456-30786-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

If the driver is built as a module, autoload won't work because the module
alias information is not filled. So user-space can't match the registered
device with the corresponding module.

Export the module alias information using the MODULE_DEVICE_TABLE() macro.

Before this patch:

$ modinfo drivers/platform/x86/intel_mid_thermal.ko | grep alias
$

After this patch:

$ modinfo drivers/platform/x86/intel_mid_thermal.ko | grep alias
alias:          platform:msic_thermal

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 drivers/platform/x86/intel_mid_thermal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel_mid_thermal.c b/drivers/platform/x86/intel_mid_thermal.c
index 05ac7203806d..008a76903cbf 100644
--- a/drivers/platform/x86/intel_mid_thermal.c
+++ b/drivers/platform/x86/intel_mid_thermal.c
@@ -551,6 +551,7 @@ static const struct platform_device_id therm_id_table[] = {
 	{ DRIVER_NAME, 1 },
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, therm_id_table);
 
 static struct platform_driver mid_thermal_driver = {
 	.driver = {
-- 
2.7.4
