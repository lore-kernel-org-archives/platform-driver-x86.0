From: Joe Perches <joe@perches.com>
Subject: [PATCH 27/35] drivers/platform: Convert remaining uses of pr_warning to pr_warn
Date: Thu, 16 Feb 2017 23:11:40 -0800
Message-ID: <1368dcea67d973983430fd8e328d1da7658dbb0f.1487314667.git.joe@perches.com>
References: <cover.1487314666.git.joe@perches.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1487314666.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

To enable eventual removal of pr_warning

This makes pr_warn use consistent for drivers/platform

Prior to this patch, there were 7 uses of pr_warning and
108 uses of pr_warn in drivers/platform

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/platform/x86/asus-laptop.c    |  2 +-
 drivers/platform/x86/eeepc-laptop.c   |  2 +-
 drivers/platform/x86/intel_oaktrail.c | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 28551f5a2e07..7f248f84f49a 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1163,7 +1163,7 @@ static void asus_als_switch(struct asus_laptop *asus, int value)
 		ret = write_acpi_int(asus->handle, METHOD_ALS_CONTROL, value);
 	}
 	if (ret)
-		pr_warning("Error setting light sensor switch\n");
+		pr_warn("Error setting light sensor switch\n");
 
 	asus->light_switch = value;
 }
diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index 8cdf315f9730..09f93eb49230 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -585,7 +585,7 @@ static void eeepc_rfkill_hotplug(struct eeepc_laptop *eeepc, acpi_handle handle)
 
 	port = acpi_get_pci_dev(handle);
 	if (!port) {
-		pr_warning("Unable to find port\n");
+		pr_warn("Unable to find port\n");
 		goto out_unlock;
 	}
 
diff --git a/drivers/platform/x86/intel_oaktrail.c b/drivers/platform/x86/intel_oaktrail.c
index 6aa33c4a809f..133b2f04643d 100644
--- a/drivers/platform/x86/intel_oaktrail.c
+++ b/drivers/platform/x86/intel_oaktrail.c
@@ -257,7 +257,7 @@ static int oaktrail_backlight_init(void)
 
 	if (IS_ERR(bd)) {
 		oaktrail_bl_device = NULL;
-		pr_warning("Unable to register backlight device\n");
+		pr_warn("Unable to register backlight device\n");
 		return PTR_ERR(bd);
 	}
 
@@ -327,20 +327,20 @@ static int __init oaktrail_init(void)
 
 	ret = platform_driver_register(&oaktrail_driver);
 	if (ret) {
-		pr_warning("Unable to register platform driver\n");
+		pr_warn("Unable to register platform driver\n");
 		goto err_driver_reg;
 	}
 
 	oaktrail_device = platform_device_alloc(DRIVER_NAME, -1);
 	if (!oaktrail_device) {
-		pr_warning("Unable to allocate platform device\n");
+		pr_warn("Unable to allocate platform device\n");
 		ret = -ENOMEM;
 		goto err_device_alloc;
 	}
 
 	ret = platform_device_add(oaktrail_device);
 	if (ret) {
-		pr_warning("Unable to add platform device\n");
+		pr_warn("Unable to add platform device\n");
 		goto err_device_add;
 	}
 
@@ -352,7 +352,7 @@ static int __init oaktrail_init(void)
 
 	ret = oaktrail_rfkill_init();
 	if (ret) {
-		pr_warning("Setup rfkill failed\n");
+		pr_warn("Setup rfkill failed\n");
 		goto err_rfkill;
 	}
 
-- 
2.10.0.rc2.1.g053435c
