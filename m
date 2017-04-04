From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 04+/11] platform/x86: fujitsu-laptop: simplify set_lcd_level()
Date: Tue,  4 Apr 2017 11:39:03 +0200
Message-ID: <20170404093903.15675-1-kernel@kempniu.pl>
References: <20170404000102.GD17322@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170404000102.GD17322@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
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
Darren,

This is patch 04/11 with updated debug and commit messages.  Now that
you mentioned this issue, I think we should do the same for patch 2/3 in
the call_fext_func() cleanup series [1].  Would you like me to just send
an updated version of that specific patch (similarly to what I did in
this case) or rather send v2 of the entire call_fext_func() cleanup
series?

[1] https://www.spinics.net/lists/platform-driver-x86/msg11058.html

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
