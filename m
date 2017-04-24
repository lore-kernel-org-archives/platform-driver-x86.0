From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 06/10] platform/x86: fujitsu-laptop: allocate struct fujitsu_bl in acpi_fujitsu_bl_add()
Date: Mon, 24 Apr 2017 15:33:30 +0200
Message-ID: <20170424133334.7064-7-kernel@kempniu.pl>
References: <20170424133334.7064-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170424133334.7064-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Only allocate memory for struct fujitsu_bl when the FUJ02B1 ACPI device
is present.  Use devm_kzalloc() for allocating memory to simplify
cleanup.

Until all backlight-related code is modified to only use device-specific
data, the pointer to the allocated memory still has to be stored in a
module-wide variable.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 536b601c7067..780e11b43d27 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -417,6 +417,7 @@ static int fujitsu_backlight_register(struct acpi_device *device)
 
 static int acpi_fujitsu_bl_add(struct acpi_device *device)
 {
+	struct fujitsu_bl *priv;
 	int state = 0;
 	int error;
 
@@ -426,10 +427,15 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	if (!device)
 		return -EINVAL;
 
+	priv = devm_kzalloc(&device->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	fujitsu_bl = priv;
 	fujitsu_bl->handle = device->handle;
 	sprintf(acpi_device_name(device), "%s", ACPI_FUJITSU_BL_DEVICE_NAME);
 	sprintf(acpi_device_class(device), "%s", ACPI_FUJITSU_CLASS);
-	device->driver_data = fujitsu_bl;
+	device->driver_data = priv;
 
 	error = acpi_fujitsu_bl_input_setup(device);
 	if (error)
@@ -1018,13 +1024,9 @@ static int __init fujitsu_init(void)
 	if (acpi_disabled)
 		return -ENODEV;
 
-	fujitsu_bl = kzalloc(sizeof(struct fujitsu_bl), GFP_KERNEL);
-	if (!fujitsu_bl)
-		return -ENOMEM;
-
 	ret = acpi_bus_register_driver(&acpi_fujitsu_bl_driver);
 	if (ret)
-		goto err_free_fujitsu_bl;
+		return ret;
 
 	/* Register platform stuff */
 
@@ -1054,8 +1056,6 @@ static int __init fujitsu_init(void)
 	platform_driver_unregister(&fujitsu_pf_driver);
 err_unregister_acpi:
 	acpi_bus_unregister_driver(&acpi_fujitsu_bl_driver);
-err_free_fujitsu_bl:
-	kfree(fujitsu_bl);
 
 	return ret;
 }
@@ -1070,8 +1070,6 @@ static void __exit fujitsu_cleanup(void)
 
 	acpi_bus_unregister_driver(&acpi_fujitsu_bl_driver);
 
-	kfree(fujitsu_bl);
-
 	pr_info("driver unloaded\n");
 }
 
-- 
2.12.2
