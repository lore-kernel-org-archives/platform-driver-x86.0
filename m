From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 1/4] platform/x86: fujitsu-laptop: simplify acpi_bus_register_driver() error handling
Date: Fri, 13 Jan 2017 12:02:37 +0100
Message-ID: <20170113110240.622-2-kernel@kempniu.pl>
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

A separate variable is not needed to handle error codes returned by
acpi_bus_register_driver().  If the latter fails, just use the value it
returned as the value returned by fujitsu_init().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index b725a907a91f..9f62d9e1b0de 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -1176,7 +1176,7 @@ MODULE_DEVICE_TABLE(acpi, fujitsu_ids);
 
 static int __init fujitsu_init(void)
 {
-	int ret, result, max_brightness;
+	int ret, max_brightness;
 
 	if (acpi_disabled)
 		return -ENODEV;
@@ -1191,11 +1191,9 @@ static int __init fujitsu_init(void)
 	fujitsu->keycode5 = KEY_RFKILL;
 	dmi_check_system(fujitsu_dmi_table);
 
-	result = acpi_bus_register_driver(&acpi_fujitsu_driver);
-	if (result < 0) {
-		ret = -ENODEV;
+	ret = acpi_bus_register_driver(&acpi_fujitsu_driver);
+	if (ret)
 		goto fail_acpi;
-	}
 
 	/* Register platform stuff */
 
@@ -1248,11 +1246,9 @@ static int __init fujitsu_init(void)
 		goto fail_hotkey;
 	}
 
-	result = acpi_bus_register_driver(&acpi_fujitsu_hotkey_driver);
-	if (result < 0) {
-		ret = -ENODEV;
+	ret = acpi_bus_register_driver(&acpi_fujitsu_hotkey_driver);
+	if (ret)
 		goto fail_hotkey1;
-	}
 
 	/* Sync backlight power status (needs FUJ02E3 device, hence deferred) */
 	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
-- 
2.11.0
