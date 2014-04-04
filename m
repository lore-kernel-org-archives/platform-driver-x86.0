From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH 1/1] alienware-wmi: cover some scenarios where memory allocations would fail
Date: Fri,  4 Apr 2014 14:40:20 -0500
Message-ID: <1396640420-9777-2-git-send-email-mario_limonciello@dell.com>
References: <1396640420-9777-1-git-send-email-mario_limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1396640420-9777-1-git-send-email-mario_limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.garrett@nebula.com
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Intel test builder caught a few instances that should test if kzalloc failed to
allocate memory as well as a scenario that platform_driver wasn't properly
initialized.

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/alienware-wmi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index 3e17e99..541f951 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -368,12 +368,20 @@ static int alienware_zone_init(struct platform_device *dev)
 	zone_dev_attrs =
 	    kzalloc(sizeof(struct device_attribute) * (quirks->num_zones + 1),
 		    GFP_KERNEL);
+	if (!zone_dev_attrs)
+		return -ENOMEM;
+
 	zone_attrs =
 	    kzalloc(sizeof(struct attribute *) * (quirks->num_zones + 2),
 		    GFP_KERNEL);
+	if (!zone_attrs)
+		return -ENOMEM;
+
 	zone_data =
 	    kzalloc(sizeof(struct platform_zone) * (quirks->num_zones),
 		    GFP_KERNEL);
+	if (!zone_data)
+		return -ENOMEM;
 
 	for (i = 0; i < quirks->num_zones; i++) {
 		sprintf(buffer, "zone%02X", i);
@@ -546,9 +554,9 @@ module_init(alienware_wmi_init);
 
 static void __exit alienware_wmi_exit(void)
 {
-	alienware_zone_exit(platform_device);
-	remove_hdmi(platform_device);
 	if (platform_device) {
+		alienware_zone_exit(platform_device);
+		remove_hdmi(platform_device);
 		platform_device_unregister(platform_device);
 		platform_driver_unregister(&platform_driver);
 	}
-- 
1.9.1
