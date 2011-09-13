From: Marco Chiappero <marco@absence.it>
Subject: [PATCH V2 RESEND 2/14] sony-laptop: use usigned data type when
 calling ACPI methods
Date: Tue, 13 Sep 2011 22:45:26 +0200
Message-ID: <1315946726.14415.127.camel@air.vesuvio.absence.it>
References: <1315585214.3613.51.camel@vesuvio>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from s1.powermailhost.com ([93.95.221.60]:38182 "EHLO
	s1.powermailhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755981Ab1IMUp2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Sep 2011 16:45:28 -0400
In-Reply-To: <1315585214.3613.51.camel@vesuvio>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Data exchanges with the SNC device should use unsigned data types: to
avoid any implicit cast, this patch removes any int usage in favor of
unsigned int or u32.


Signed-off-by: Marco Chiappero <marco@absence.it> 
--- 

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -689,7 +689,8 @@ static struct acpi_device *sony_nc_acpi_
 /*
  * acpi_evaluate_object wrappers
  */
-static int acpi_callgetfunc(acpi_handle handle, char *name, int *result)
+static int acpi_callgetfunc(acpi_handle handle, char *name,
+				unsigned int *result)
 {
 	struct acpi_buffer output;
 	union acpi_object out_obj;
@@ -709,8 +710,8 @@ static int acpi_callgetfunc(acpi_handle 
 	return -1;
 }
 
-static int acpi_callsetfunc(acpi_handle handle, char *name, int value,
-			    int *result)
+static int acpi_callsetfunc(acpi_handle handle, char *name, u32 value,
+				unsigned int *result)
 {
 	struct acpi_object_list params;
 	union acpi_object in_obj;
@@ -767,8 +768,7 @@ static ssize_t sony_nc_handles_show(stru
 
 static int sony_nc_handles_setup(struct platform_device *pd)
 {
-	int i;
-	int result;
+	unsigned int i, result;
 
 	handles = kzalloc(sizeof(*handles), GFP_KERNEL);
 	if (!handles)
@@ -830,7 +830,9 @@ static int sony_find_snc_handle(unsigned
 	return -1;
 }
 
-static int sony_call_snc_handle(unsigned int handle, int argument, int *result)
+/* call command method SN07, accepts a 32 bit integer, returns a integer */
+static int sony_call_snc_handle(unsigned int handle, unsigned int argument,
+				unsigned int *result)
 {
 	int ret = 0;
 	int offset = sony_find_snc_handle(handle);
@@ -838,6 +840,7 @@ static int sony_call_snc_handle(unsigned
 	if (offset < 0)
 		return -1;
 
+	/* max 32 bit wide argument, for wider input use SN06 */
 	ret = acpi_callsetfunc(sony_nc_acpi_handle, "SN07", offset | argument,
 			result);
 	dprintk("called SN07 with 0x%.4x (result: 0x%.4x)\n", offset | argument,
@@ -886,7 +889,7 @@ static int boolean_validate(const int di
 static ssize_t sony_nc_sysfs_show(struct device *dev, struct device_attribute *attr,
 			      char *buffer)
 {
-	int value;
+	unsigned int value;
 	struct sony_nc_value *item =
 	    container_of(attr, struct sony_nc_value, devattr);
 
@@ -906,7 +909,7 @@ static ssize_t sony_nc_sysfs_store(struc
 			       struct device_attribute *attr,
 			       const char *buffer, size_t count)
 {
-	int value;
+	unsigned long value;
 	struct sony_nc_value *item =
 	    container_of(attr, struct sony_nc_value, devattr);
 
@@ -951,7 +954,7 @@ static int sony_backlight_update_status(
 
 static int sony_backlight_get_brightness(struct backlight_device *bd)
 {
-	int value;
+	unsigned int value;
 
 	if (acpi_callgetfunc(sony_nc_acpi_handle, "GBRT", &value))
 		return 0;
@@ -961,7 +964,7 @@ static int sony_backlight_get_brightness
 
 static int sony_nc_get_brightness_ng(struct backlight_device *bd)
 {
-	int result;
+	unsigned int result;
 	struct sony_backlight_props *sdev =
 		(struct sony_backlight_props *)bl_get_data(bd);
 
@@ -972,7 +975,7 @@ static int sony_nc_get_brightness_ng(str
 
 static int sony_nc_update_status_ng(struct backlight_device *bd)
 {
-	int value, result;
+	unsigned int value, result;
 	struct sony_backlight_props *sdev =
 		(struct sony_backlight_props *)bl_get_data(bd);
 
@@ -1069,7 +1072,7 @@ static void sony_nc_notify(struct acpi_d
 
 	if (ev >= 0x90) {
 		/* New-style event */
-		int result;
+		unsigned int result;
 		int key_handle = 0;
 		ev -= 0x90;
 
@@ -1139,7 +1142,7 @@ static acpi_status sony_walk_callback(ac
  */
 static int sony_nc_function_setup(struct acpi_device *device)
 {
-	int result;
+	unsigned int result;
 
 	/* Enable all events */
 	acpi_callsetfunc(sony_nc_acpi_handle, "SN02", 0xffff, &result);
@@ -1206,8 +1209,8 @@ static void sony_nc_rfkill_cleanup(void)
 
 static int sony_nc_rfkill_set(void *data, bool blocked)
 {
-	int result;
-	int argument = sony_rfkill_address[(long) data] + 0x100;
+	unsigned int result;
+	unsigned int argument = sony_rfkill_address[(long) data] + 0x100;
 
 	if (!blocked)
 		argument |= 0xff0000;
@@ -1226,7 +1229,7 @@ static int sony_nc_setup_rfkill(struct a
 	struct rfkill *rfk;
 	enum rfkill_type type;
 	const char *name;
-	int result;
+	unsigned int result;
 	bool hwblock;
 
 	switch (nc_type) {
@@ -1271,14 +1274,14 @@ static int sony_nc_setup_rfkill(struct a
 static void sony_nc_rfkill_update(void)
 {
 	enum sony_nc_rfkill i;
-	int result;
+	unsigned int result;
 	bool hwblock;
 
 	sony_call_snc_handle(sony_rfkill_handle, 0x200, &result);
 	hwblock = !(result & 0x1);
 
 	for (i = 0; i < N_SONY_RFKILL; i++) {
-		int argument = sony_rfkill_address[i];
+		unsigned int argument = sony_rfkill_address[i];
 
 		if (!sony_rfkill_devices[i])
 			continue;
@@ -1390,7 +1393,7 @@ static struct kbd_backlight *kbdbl_handl
 
 static ssize_t __sony_nc_kbd_backlight_mode_set(u8 value)
 {
-	int result;
+	unsigned int result;
 
 	if (value > 1)
 		return -EINVAL;
@@ -1438,7 +1441,7 @@ static ssize_t sony_nc_kbd_backlight_mod
 
 static int __sony_nc_kbd_backlight_timeout_set(u8 value)
 {
-	int result;
+	unsigned int result;
 
 	if (value > 3)
 		return -EINVAL;
@@ -1482,7 +1485,7 @@ static ssize_t sony_nc_kbd_backlight_tim
 
 static int sony_nc_kbd_backlight_setup(struct platform_device *pd)
 {
-	int result;
+	unsigned int result;
 
 	if (sony_call_snc_handle(KBDBL_HANDLER, KBDBL_PRESENT, &result))
 		return 0;
@@ -1527,7 +1530,7 @@ outkzalloc:
 static int sony_nc_kbd_backlight_cleanup(struct platform_device *pd)
 {
 	if (kbdbl_handle) {
-		int result;
+		unsigned int result;
 
 		device_remove_file(&pd->dev, &kbdbl_handle->mode_attr);
 		device_remove_file(&pd->dev, &kbdbl_handle->timeout_attr);
@@ -1543,7 +1546,7 @@ static int sony_nc_kbd_backlight_cleanup
 
 static void sony_nc_kbd_backlight_resume(void)
 {
-	int ignore = 0;
+	unsigned int ignore = 0;
 
 	if (!kbdbl_handle)
 		return;
@@ -2659,7 +2662,7 @@ static long sonypi_misc_ioctl(struct fil
 	void __user *argp = (void __user *)arg;
 	u8 val8;
 	u16 val16;
-	int value;
+	unsigned int value;
 
 	mutex_lock(&spic_dev.lock);
 	switch (cmd) {
