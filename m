From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 04/11] platform/x86: fujitsu-laptop: simplify set_lcd_level()
Date: Wed,  5 Apr 2017 08:49:03 +0200
Message-ID: <20170405064910.3162-5-kernel@kempniu.pl>
References: <20170405064910.3162-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170405064910.3162-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

acpi_execute_simple_method() takes a method parameter which tells it to
look for the given method underneath the given handle, so calling
acpi_get_handle() beforehand is redundant.  Replace the call to
acpi_get_handle() with a call to acpi_execute_simple_method(), thus
eliminating the need for a local variable storing the handle.  Update
debug message to reflect this change.  Also do not assign a default
value to status as it has no influence on execution flow.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 2f563aa00592..6d4a2a36716b 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -358,8 +358,7 @@ static enum led_brightness eco_led_get(struct led_classdev *cdev)
 
 static int set_lcd_level(int level)
 {
-	acpi_status status = AE_OK;
-	acpi_handle handle = NULL;
+	acpi_status status;
 	char *method;
 
 	switch (use_alt_lcd_levels) {
@@ -377,16 +376,14 @@ static int set_lcd_level(int level)
 	if (level < 0 || level >= fujitsu_bl->max_brightness)
 		return -EINVAL;
 
-	status = acpi_get_handle(fujitsu_bl->acpi_handle, method, &handle);
+	status = acpi_execute_simple_method(fujitsu_bl->acpi_handle, method,
+					    level);
 	if (ACPI_FAILURE(status)) {
-		vdbg_printk(FUJLAPTOP_DBG_ERROR, "%s not present\n", method);
+		vdbg_printk(FUJLAPTOP_DBG_ERROR, "Failed to evaluate %s\n",
+			    method);
 		return -ENODEV;
 	}
 
-	status = acpi_execute_simple_method(handle, NULL, level);
-	if (ACPI_FAILURE(status))
-		return -ENODEV;
-
 	return 0;
 }
 
-- 
2.12.2
