From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v4 4/4] platform/x86: fujitsu-laptop: cleanup error labels in fujitsu_init()
Date: Fri, 10 Mar 2017 11:50:36 +0100
Message-ID: <20170310105036.26899-5-kernel@kempniu.pl>
References: <20170310105036.26899-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:36343 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935142AbdCJKur (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Mar 2017 05:50:47 -0500
Received: by mail-lf0-f67.google.com with SMTP id g70so6544540lfh.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2017 02:50:46 -0800 (PST)
In-Reply-To: <20170310105036.26899-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Error labels currently used in fujitsu_init() are really hard to follow:
some (fail_laptop) indicate which operation has failed, others
(fail_sysfs_group) indicate where unrolling should start and the rest
(fail_platform_driver) is simply confusing.  Change them to follow the
pattern used throughout the rest of the module, i.e. make every label
indicate the first unrolling operation it leads to.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index dad7b448f2cd..75d5f758af59 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -1244,60 +1244,60 @@ static int __init fujitsu_init(void)
 
 	ret = acpi_bus_register_driver(&acpi_fujitsu_bl_driver);
 	if (ret)
-		goto fail_acpi;
+		goto err_free_fujitsu_bl;
 
 	/* Register platform stuff */
 
 	fujitsu_bl->pf_device = platform_device_alloc("fujitsu-laptop", -1);
 	if (!fujitsu_bl->pf_device) {
 		ret = -ENOMEM;
-		goto fail_platform_driver;
+		goto err_unregister_acpi;
 	}
 
 	ret = platform_device_add(fujitsu_bl->pf_device);
 	if (ret)
-		goto fail_platform_device1;
+		goto err_put_platform_device;
 
 	ret =
 	    sysfs_create_group(&fujitsu_bl->pf_device->dev.kobj,
 			       &fujitsu_pf_attribute_group);
 	if (ret)
-		goto fail_platform_device2;
+		goto err_del_platform_device;
 
 	ret = platform_driver_register(&fujitsu_pf_driver);
 	if (ret)
-		goto fail_sysfs_group;
+		goto err_remove_sysfs_group;
 
 	/* Register laptop driver */
 
 	fujitsu_laptop = kzalloc(sizeof(struct fujitsu_laptop), GFP_KERNEL);
 	if (!fujitsu_laptop) {
 		ret = -ENOMEM;
-		goto fail_laptop;
+		goto err_unregister_platform_driver;
 	}
 
 	ret = acpi_bus_register_driver(&acpi_fujitsu_laptop_driver);
 	if (ret)
-		goto fail_laptop1;
+		goto err_free_fujitsu_laptop;
 
 	pr_info("driver " FUJITSU_DRIVER_VERSION " successfully loaded\n");
 
 	return 0;
 
-fail_laptop1:
+err_free_fujitsu_laptop:
 	kfree(fujitsu_laptop);
-fail_laptop:
+err_unregister_platform_driver:
 	platform_driver_unregister(&fujitsu_pf_driver);
-fail_sysfs_group:
+err_remove_sysfs_group:
 	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
 			   &fujitsu_pf_attribute_group);
-fail_platform_device2:
+err_del_platform_device:
 	platform_device_del(fujitsu_bl->pf_device);
-fail_platform_device1:
+err_put_platform_device:
 	platform_device_put(fujitsu_bl->pf_device);
-fail_platform_driver:
+err_unregister_acpi:
 	acpi_bus_unregister_driver(&acpi_fujitsu_bl_driver);
-fail_acpi:
+err_free_fujitsu_bl:
 	kfree(fujitsu_bl);
 
 	return ret;
-- 
2.12.0
