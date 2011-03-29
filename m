From: Joe Perches <joe@perches.com>
Subject: [PATCH 15/23] msi-laptop: pr_<level> neatening
Date: Tue, 29 Mar 2011 15:21:46 -0700
Message-ID: <d4a53369c7b28b2c673661325b75c6eb23f61505.1301436234.git.joe@perches.com>
References: <cover.1301436234.git.joe@perches.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1301436234.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>, "Lee, Chun-Yi" <jlee@novell.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Just making it a bit more like other logging message uses.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/platform/x86/msi-laptop.c |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 23fb2af..f89c0b6 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -447,7 +447,7 @@ static struct platform_device *msipf_device;
 
 static int dmi_check_cb(const struct dmi_system_id *id)
 {
-	pr_info("Identified laptop model '%s'.\n", id->ident);
+	pr_info("Identified laptop model '%s'\n", id->ident);
 	return 1;
 }
 
@@ -875,8 +875,7 @@ static int __init msi_init(void)
 	/* Register backlight stuff */
 
 	if (acpi_video_backlight_support()) {
-		pr_info("Brightness ignored, must be controlled "
-		       "by ACPI video driver\n");
+		pr_info("Brightness ignored, must be controlled by ACPI video driver\n");
 	} else {
 		struct backlight_properties props;
 		memset(&props, 0, sizeof(struct backlight_properties));
@@ -930,7 +929,7 @@ static int __init msi_init(void)
 	if (auto_brightness != 2)
 		set_auto_brightness(auto_brightness);
 
-	pr_info("driver "MSI_DRIVER_VERSION" successfully loaded.\n");
+	pr_info("driver " MSI_DRIVER_VERSION " successfully loaded\n");
 
 	return 0;
 
@@ -978,7 +977,7 @@ static void __exit msi_cleanup(void)
 	if (auto_brightness != 2)
 		set_auto_brightness(1);
 
-	pr_info("driver unloaded.\n");
+	pr_info("driver unloaded\n");
 }
 
 module_init(msi_init);
-- 
1.7.4.2.g597a6.dirty
