From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 02/10] platform/x86: fujitsu-laptop: shorten names of acpi_handle fields
Date: Mon, 24 Apr 2017 15:33:26 +0200
Message-ID: <20170424133334.7064-3-kernel@kempniu.pl>
References: <20170424133334.7064-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34600 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1171112AbdDXNdl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Apr 2017 09:33:41 -0400
Received: by mail-lf0-f66.google.com with SMTP id x72so16553860lfb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Apr 2017 06:33:40 -0700 (PDT)
In-Reply-To: <20170424133334.7064-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

As both struct fujitsu_bl and struct fujitsu_laptop represent data
associated with ACPI devices, drop the "acpi_" prefix from the names of
the relevant fields of these structures to save some horizontal space.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 3f232967af04..3695e8075aa6 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -130,7 +130,7 @@
 
 /* Device controlling the backlight and associated keys */
 struct fujitsu_bl {
-	acpi_handle acpi_handle;
+	acpi_handle handle;
 	struct input_dev *input;
 	char phys[32];
 	struct backlight_device *bl_device;
@@ -144,7 +144,7 @@ static bool disable_brightness_adjust;
 
 /* Device used to access hotkeys and other features on the laptop */
 struct fujitsu_laptop {
-	acpi_handle acpi_handle;
+	acpi_handle handle;
 	struct acpi_device *dev;
 	struct input_dev *input;
 	char phys[32];
@@ -175,7 +175,7 @@ static int call_fext_func(int func, int op, int feature, int state)
 	unsigned long long value;
 	acpi_status status;
 
-	status = acpi_evaluate_integer(fujitsu_laptop->acpi_handle, "FUNC",
+	status = acpi_evaluate_integer(fujitsu_laptop->handle, "FUNC",
 				       &arg_list, &value);
 	if (ACPI_FAILURE(status)) {
 		vdbg_printk(FUJLAPTOP_DBG_ERROR, "Failed to evaluate FUNC\n");
@@ -216,7 +216,7 @@ static int set_lcd_level(int level)
 
 	switch (use_alt_lcd_levels) {
 	case -1:
-		if (acpi_has_method(fujitsu_bl->acpi_handle, "SBL2"))
+		if (acpi_has_method(fujitsu_bl->handle, "SBL2"))
 			method = "SBL2";
 		else
 			method = "SBLL";
@@ -235,8 +235,7 @@ static int set_lcd_level(int level)
 	if (level < 0 || level >= fujitsu_bl->max_brightness)
 		return -EINVAL;
 
-	status = acpi_execute_simple_method(fujitsu_bl->acpi_handle, method,
-					    level);
+	status = acpi_execute_simple_method(fujitsu_bl->handle, method, level);
 	if (ACPI_FAILURE(status)) {
 		vdbg_printk(FUJLAPTOP_DBG_ERROR, "Failed to evaluate %s\n",
 			    method);
@@ -255,7 +254,7 @@ static int get_lcd_level(void)
 
 	vdbg_printk(FUJLAPTOP_DBG_TRACE, "get lcd level via GBLL\n");
 
-	status = acpi_evaluate_integer(fujitsu_bl->acpi_handle, "GBLL", NULL,
+	status = acpi_evaluate_integer(fujitsu_bl->handle, "GBLL", NULL,
 				       &state);
 	if (ACPI_FAILURE(status))
 		return 0;
@@ -272,7 +271,7 @@ static int get_max_brightness(void)
 
 	vdbg_printk(FUJLAPTOP_DBG_TRACE, "get max lcd level via RBLL\n");
 
-	status = acpi_evaluate_integer(fujitsu_bl->acpi_handle, "RBLL", NULL,
+	status = acpi_evaluate_integer(fujitsu_bl->handle, "RBLL", NULL,
 				       &state);
 	if (ACPI_FAILURE(status))
 		return -1;
@@ -421,7 +420,7 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	if (!device)
 		return -EINVAL;
 
-	fujitsu_bl->acpi_handle = device->handle;
+	fujitsu_bl->handle = device->handle;
 	sprintf(acpi_device_name(device), "%s", ACPI_FUJITSU_BL_DEVICE_NAME);
 	sprintf(acpi_device_class(device), "%s", ACPI_FUJITSU_CLASS);
 	device->driver_data = fujitsu_bl;
@@ -430,7 +429,7 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	if (error)
 		return error;
 
-	error = acpi_bus_update_power(fujitsu_bl->acpi_handle, &state);
+	error = acpi_bus_update_power(fujitsu_bl->handle, &state);
 	if (error) {
 		pr_err("Error reading power state\n");
 		return error;
@@ -791,7 +790,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	if (!device)
 		return -EINVAL;
 
-	fujitsu_laptop->acpi_handle = device->handle;
+	fujitsu_laptop->handle = device->handle;
 	sprintf(acpi_device_name(device), "%s",
 		ACPI_FUJITSU_LAPTOP_DEVICE_NAME);
 	sprintf(acpi_device_class(device), "%s", ACPI_FUJITSU_CLASS);
@@ -810,7 +809,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	if (error)
 		goto err_free_fifo;
 
-	error = acpi_bus_update_power(fujitsu_laptop->acpi_handle, &state);
+	error = acpi_bus_update_power(fujitsu_laptop->handle, &state);
 	if (error) {
 		pr_err("Error reading power state\n");
 		goto err_free_fifo;
-- 
2.12.2
