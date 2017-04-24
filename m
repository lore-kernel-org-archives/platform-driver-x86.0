From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 04/10] platform/x86: fujitsu-laptop: rework backlight power synchronization
Date: Mon, 24 Apr 2017 15:33:28 +0200
Message-ID: <20170424133334.7064-5-kernel@kempniu.pl>
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

fujitsu-laptop registers two ACPI drivers: one for ACPI device FUJ02B1
enabling backlight control and another for ACPI device FUJ02E3 which
handles various other stuff (hotkeys, LEDs, etc.)  So far, these two
drivers have been entangled by calls to fext_backlight() (previously
known as call_fext_func()) in the backlight part of the module which use
module-wide data managed by the other part of the module and accesses to
the backlight device from within acpi_fujitsu_laptop_add().  This
entaglement can be solved by storing an independently fetched ACPI
handle to the FUJ02E3 device inside the data structure managed by the
backlight part of the module.

Add a field to struct fujitsu_bl for storing a handle to the FUJ02E3
ACPI device.  Make fext_backlight() calls use that handle instead of the
one from struct fujitsu_laptop.  Move backlight power synchronization
from acpi_fujitsu_laptop_add() to fujitsu_backlight_register().

This makes the bl_device field of struct fujitsu_bl redundant, so remove
it.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index ea3210ee83ec..5f6b34a97348 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -131,9 +131,9 @@
 /* Device controlling the backlight and associated keys */
 struct fujitsu_bl {
 	acpi_handle handle;
+	acpi_handle fext_handle;
 	struct input_dev *input;
 	char phys[32];
-	struct backlight_device *bl_device;
 	unsigned int max_brightness;
 	unsigned int brightness_level;
 };
@@ -290,10 +290,12 @@ static int bl_get_brightness(struct backlight_device *b)
 
 static int bl_update_status(struct backlight_device *b)
 {
-	if (b->props.power == FB_BLANK_POWERDOWN)
-		fext_backlight(fujitsu_laptop->handle, 0x1, 0x4, 0x3);
-	else
-		fext_backlight(fujitsu_laptop->handle, 0x1, 0x4, 0x0);
+	if (fujitsu_bl->fext_handle) {
+		if (b->props.power == FB_BLANK_POWERDOWN)
+			fext_backlight(fujitsu_bl->fext_handle, 0x1, 0x4, 0x3);
+		else
+			fext_backlight(fujitsu_bl->fext_handle, 0x1, 0x4, 0x0);
+	}
 
 	return set_lcd_level(b->props.brightness);
 }
@@ -397,6 +399,7 @@ static int fujitsu_backlight_register(struct acpi_device *device)
 		.type = BACKLIGHT_PLATFORM
 	};
 	struct backlight_device *bd;
+	acpi_status status;
 
 	bd = devm_backlight_device_register(&device->dev, "fujitsu-laptop",
 					    &device->dev, NULL,
@@ -404,7 +407,10 @@ static int fujitsu_backlight_register(struct acpi_device *device)
 	if (IS_ERR(bd))
 		return PTR_ERR(bd);
 
-	fujitsu_bl->bl_device = bd;
+	status = acpi_get_handle(NULL, "\\_SB.FEXT", &fujitsu_bl->fext_handle);
+	if (ACPI_SUCCESS(status) &&
+	    fext_backlight(fujitsu_bl->fext_handle, 0x2, 0x4, 0x0) == 3)
+		bd->props.power = FB_BLANK_POWERDOWN;
 
 	return 0;
 }
@@ -861,15 +867,6 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	pr_info("BTNI: [0x%x]\n", fext_buttons(fujitsu_laptop->handle,
 					       0x0, 0x0, 0x0));
 
-	/* Sync backlight power status */
-	if (fujitsu_bl->bl_device &&
-	    acpi_video_get_backlight_type() == acpi_backlight_vendor) {
-		if (fext_backlight(fujitsu_laptop->handle, 0x2, 0x4, 0x0) == 3)
-			fujitsu_bl->bl_device->props.power = FB_BLANK_POWERDOWN;
-		else
-			fujitsu_bl->bl_device->props.power = FB_BLANK_UNBLANK;
-	}
-
 	error = acpi_fujitsu_laptop_leds_register(device);
 	if (error)
 		goto err_free_fifo;
-- 
2.12.2
