From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 4/4] platform/x86: fujitsu-laptop: cleanup error labels in fujitsu_init()
Date: Fri, 13 Jan 2017 12:02:40 +0100
Message-ID: <20170113110240.622-5-kernel@kempniu.pl>
References: <20170113110240.622-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170113110240.622-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Error labels currently used in fujitsu_init() are really hard to follow:
some (fail_hotkey) indicate which operation has failed, others
(fail_sysfs_group) indicate where unrolling should start and the rest
(fail_platform_driver) is simply confusing.  Change them to follow the
pattern used throughout the rest of the module, i.e. make every label
indicate the first unrolling operation it leads to.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 6438bcce90d4..67bb14ed3723 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -1220,70 +1220,70 @@ static int __init fujitsu_init(void)
 
 	ret = acpi_bus_register_driver(&acpi_fujitsu_driver);
 	if (ret)
-		goto fail_acpi;
+		goto err_free_fujitsu;
 
 	/* Register platform stuff */
 
 	fujitsu->pf_device = platform_device_alloc("fujitsu-laptop", -1);
 	if (!fujitsu->pf_device) {
 		ret = -ENOMEM;
-		goto fail_platform_driver;
+		goto err_unregister_acpi;
 	}
 
 	ret = platform_device_add(fujitsu->pf_device);
 	if (ret)
-		goto fail_platform_device1;
+		goto err_put_platform_device;
 
 	ret =
 	    sysfs_create_group(&fujitsu->pf_device->dev.kobj,
 			       &fujitsupf_attribute_group);
 	if (ret)
-		goto fail_platform_device2;
+		goto err_del_platform_device;
 
 	/* Register backlight stuff */
 
 	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
 		ret = fujitsu_backlight_init();
 		if (ret)
-			goto fail_sysfs_group;
+			goto err_remove_sysfs_group;
 	}
 
 	ret = platform_driver_register(&fujitsupf_driver);
 	if (ret)
-		goto fail_backlight;
+		goto err_unregister_backlight;
 
 	/* Register hotkey driver */
 
 	fujitsu_hotkey = kzalloc(sizeof(struct fujitsu_hotkey_t), GFP_KERNEL);
 	if (!fujitsu_hotkey) {
 		ret = -ENOMEM;
-		goto fail_hotkey;
+		goto err_unregister_platform_driver;
 	}
 
 	ret = acpi_bus_register_driver(&acpi_fujitsu_hotkey_driver);
 	if (ret)
-		goto fail_hotkey1;
+		goto err_free_fujitsu_hotkey;
 
 	pr_info("driver " FUJITSU_DRIVER_VERSION " successfully loaded\n");
 
 	return 0;
 
-fail_hotkey1:
+err_free_fujitsu_hotkey:
 	kfree(fujitsu_hotkey);
-fail_hotkey:
+err_unregister_platform_driver:
 	platform_driver_unregister(&fujitsupf_driver);
-fail_backlight:
+err_unregister_backlight:
 	backlight_device_unregister(fujitsu->bl_device);
-fail_sysfs_group:
+err_remove_sysfs_group:
 	sysfs_remove_group(&fujitsu->pf_device->dev.kobj,
 			   &fujitsupf_attribute_group);
-fail_platform_device2:
+err_del_platform_device:
 	platform_device_del(fujitsu->pf_device);
-fail_platform_device1:
+err_put_platform_device:
 	platform_device_put(fujitsu->pf_device);
-fail_platform_driver:
+err_unregister_acpi:
 	acpi_bus_unregister_driver(&acpi_fujitsu_driver);
-fail_acpi:
+err_free_fujitsu:
 	kfree(fujitsu);
 
 	return ret;
-- 
2.11.0
