From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 3/5] platform/x86: fujitsu-laptop: add and remove platform device in separate functions
Date: Tue, 14 Mar 2017 11:26:29 +0100
Message-ID: <20170314102631.8203-4-kernel@kempniu.pl>
References: <20170314102631.8203-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170314102631.8203-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Platform device handling adds a lot of complexity to fujitsu_init(),
which hinders its readability.  Extract code responsible for adding and
removing the platform device to separate functions.  Adjust whitespace
to make checkpatch happy.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 66 +++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 9719c821d64f..421402a19bb9 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -765,6 +765,40 @@ static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 
 /* ACPI device for hotkey handling */
 
+static int fujitsu_laptop_platform_add(void)
+{
+	int ret;
+
+	fujitsu_bl->pf_device = platform_device_alloc("fujitsu-laptop", -1);
+	if (!fujitsu_bl->pf_device)
+		return -ENOMEM;
+
+	ret = platform_device_add(fujitsu_bl->pf_device);
+	if (ret)
+		goto err_put_platform_device;
+
+	ret = sysfs_create_group(&fujitsu_bl->pf_device->dev.kobj,
+				 &fujitsu_pf_attribute_group);
+	if (ret)
+		goto err_del_platform_device;
+
+	return 0;
+
+err_del_platform_device:
+	platform_device_del(fujitsu_bl->pf_device);
+err_put_platform_device:
+	platform_device_put(fujitsu_bl->pf_device);
+
+	return ret;
+}
+
+static void fujitsu_laptop_platform_remove(void)
+{
+	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
+			   &fujitsu_pf_attribute_group);
+	platform_device_unregister(fujitsu_bl->pf_device);
+}
+
 static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 {
 	int result = 0;
@@ -1146,25 +1180,13 @@ static int __init fujitsu_init(void)
 
 	/* Register platform stuff */
 
-	fujitsu_bl->pf_device = platform_device_alloc("fujitsu-laptop", -1);
-	if (!fujitsu_bl->pf_device) {
-		ret = -ENOMEM;
-		goto err_unregister_acpi;
-	}
-
-	ret = platform_device_add(fujitsu_bl->pf_device);
-	if (ret)
-		goto err_put_platform_device;
-
-	ret =
-	    sysfs_create_group(&fujitsu_bl->pf_device->dev.kobj,
-			       &fujitsu_pf_attribute_group);
+	ret = fujitsu_laptop_platform_add();
 	if (ret)
-		goto err_del_platform_device;
+		goto err_unregister_acpi;
 
 	ret = platform_driver_register(&fujitsu_pf_driver);
 	if (ret)
-		goto err_remove_sysfs_group;
+		goto err_remove_platform_device;
 
 	/* Register laptop driver */
 
@@ -1186,13 +1208,8 @@ static int __init fujitsu_init(void)
 	kfree(fujitsu_laptop);
 err_unregister_platform_driver:
 	platform_driver_unregister(&fujitsu_pf_driver);
-err_remove_sysfs_group:
-	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
-			   &fujitsu_pf_attribute_group);
-err_del_platform_device:
-	platform_device_del(fujitsu_bl->pf_device);
-err_put_platform_device:
-	platform_device_put(fujitsu_bl->pf_device);
+err_remove_platform_device:
+	fujitsu_laptop_platform_remove();
 err_unregister_acpi:
 	acpi_bus_unregister_driver(&acpi_fujitsu_bl_driver);
 err_free_fujitsu_bl:
@@ -1209,10 +1226,7 @@ static void __exit fujitsu_cleanup(void)
 
 	platform_driver_unregister(&fujitsu_pf_driver);
 
-	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
-			   &fujitsu_pf_attribute_group);
-
-	platform_device_unregister(fujitsu_bl->pf_device);
+	fujitsu_laptop_platform_remove();
 
 	acpi_bus_unregister_driver(&acpi_fujitsu_bl_driver);
 
-- 
2.12.0
