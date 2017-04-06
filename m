From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] hp-wireless: add Xiaomi's hardware id to the supported list
Date: Thu,  6 Apr 2017 17:32:16 +0100
Message-ID: <1491496336-19639-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:59658 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751662AbdDFQcb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2017 12:32:31 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com

The airplane mode button on Xiaomi's new laptops are the same as HP
laptops.

This is tested on Xiaomi Notebook Air 13.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/hp-wireless.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp-wireless.c b/drivers/platform/x86/hp-wireless.c
index 988eedb..1d4df3d 100644
--- a/drivers/platform/x86/hp-wireless.c
+++ b/drivers/platform/x86/hp-wireless.c
@@ -1,7 +1,7 @@
 /*
- *  hp-wireless button for Windows 8
+ *  Airplane mode button for HP & Xiaomi laptops
  *
- *  Copyright (C) 2014 Alex Hung <alex.hung@canonical.com>
+ *  Copyright (C) 2014-2017 Alex Hung <alex.hung@canonical.com>
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
@@ -29,11 +29,13 @@
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Alex Hung");
 MODULE_ALIAS("acpi*:HPQ6001:*");
+MODULE_ALIAS("acpi*:WSTADEF:*");
 
 static struct input_dev *hpwl_input_dev;
 
 static const struct acpi_device_id hpwl_ids[] = {
 	{"HPQ6001", 0},
+	{"WSTADEF", 0},
 	{"", 0},
 };
 
@@ -112,7 +114,7 @@ static int __init hpwl_init(void)
 {
 	int err;
 
-	pr_info("Initializing HPQ6001 module\n");
+	pr_info("Initializing HPQ6001/WSTADEF module\n");
 	err = acpi_bus_register_driver(&hpwl_driver);
 	if (err)
 		pr_err("Unable to register HP wireless control driver.\n");
@@ -122,7 +124,7 @@ static int __init hpwl_init(void)
 
 static void __exit hpwl_exit(void)
 {
-	pr_info("Exiting HPQ6001 module\n");
+	pr_info("Exiting HPQ6001/WSTADEF module\n");
 	acpi_bus_unregister_driver(&hpwl_driver);
 }
 
-- 
2.7.4
