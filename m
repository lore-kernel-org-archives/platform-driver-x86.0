From: Daniel Drake <drake@endlessm.com>
Subject: [PATCH] acer-wmi: Inform firmware that RF Button Driver is active
Date: Fri,  3 Feb 2017 14:23:07 -0600
Message-ID: <20170203202307.23586-1-drake@endlessm.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ua0-f169.google.com ([209.85.217.169]:34303 "EHLO
        mail-ua0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751226AbdBCUXS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Feb 2017 15:23:18 -0500
Received: by mail-ua0-f169.google.com with SMTP id 35so22164838uak.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Feb 2017 12:23:18 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jlee@suse.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux@endlessm.com, chiu@endless.com, Chris Chiu <chiu@endlessm.com>

From: Chris Chiu <chiu@endless.com>

The same method to activate LM(Launch Manager) can also be used to
activate the RF Button driver with different bit toggled in the same
lm_status. To express that many functions this byte field can achieve,
rename the lm_status to app_status. And also the app_mask is the bit
mask which specifically indicate which bits are going to be changed.

This solves a problem where the AR9565 wifi included in the
Acer Aspire ES1-421 is permanently hard blocked according to the rfkill
GPIO read by ath9k.

We also enable use of the Fn+F3 airplane mode hotkey on this laptop and
others such as the Acer TravelMate P238-M. This can happen either as a
scancode or via an EC/WMI event.

Signed-off-by: Chris Chiu <chiu@endlessm.com>
Signed-off-by: Daniel Drake <drake@endlessm.com>
---
 drivers/platform/x86/acer-wmi.c | 78 ++++++++++++++++++++++++++++++++---------
 1 file changed, 62 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index c29b9b6..ecdf6f1 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -128,6 +128,7 @@ static const struct key_entry acer_wmi_keymap[] __initconst = {
 	{KE_KEY, KEY_TOUCHPAD_OFF, {KEY_TOUCHPAD_OFF} },
 	{KE_IGNORE, 0x83, {KEY_TOUCHPAD_TOGGLE} },
 	{KE_KEY, 0x85, {KEY_TOUCHPAD_TOGGLE} },
+	{KE_KEY, 0x86, {KEY_WLAN} },
 	{KE_END, 0}
 };
 
@@ -150,15 +151,30 @@ struct event_return_value {
 #define ACER_WMID3_GDS_BLUETOOTH	(1<<11)	/* BT */
 #define ACER_WMID3_GDS_TOUCHPAD		(1<<1)	/* Touchpad */
 
-struct lm_input_params {
+/* Hotkey Customized Setting and Acer Application Status.
+ * Set Device Default Value and Report Acer Application Status.
+ * When Acer Application starts, it will run this method to inform
+ * BIOS/EC that Acer Application is on.
+ * App Status
+ *	Bit[0]: Launch Manager Status
+ *	Bit[1]: ePM Status
+ *	Bit[2]: Device Control Status
+ *	Bit[3]: Acer Power Button Utility Status
+ *	Bit[4]: RF Button Status
+ *	Bit[5]: ODD PM Status
+ *	Bit[6]: Device Default Value Control
+ *	Bit[7]: Hall Sensor Application Status
+ */
+struct set_function_input_params {
 	u8 function_num;        /* Function Number */
 	u16 commun_devices;     /* Communication type devices default status */
 	u16 devices;            /* Other type devices default status */
-	u8 lm_status;           /* Launch Manager Status */
-	u16 reserved;
+	u8 app_status;          /* Acer Device Status. LM, ePM, RF Button... */
+	u8 app_mask;		/* Bit mask to app_status */
+	u8 reserved;
 } __attribute__((packed));
 
-struct lm_return_value {
+struct set_function_return_value {
 	u8 error_code;          /* Error Code */
 	u8 ec_return_value;     /* EC Return Value */
 	u16 reserved;
@@ -1769,13 +1785,14 @@ static void acer_wmi_notify(u32 value, void *context)
 }
 
 static acpi_status __init
-wmid3_set_lm_mode(struct lm_input_params *params,
-		  struct lm_return_value *return_value)
+wmid3_set_function_mode(struct set_function_input_params *params,
+			struct set_function_return_value *return_value)
 {
 	acpi_status status;
 	union acpi_object *obj;
 
-	struct acpi_buffer input = { sizeof(struct lm_input_params), params };
+	struct acpi_buffer input = { sizeof(struct set_function_input_params),
+				     params };
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 
 	status = wmi_evaluate_method(WMID_GUID3, 0, 0x1, &input, &output);
@@ -1796,7 +1813,8 @@ wmid3_set_lm_mode(struct lm_input_params *params,
 		return AE_ERROR;
 	}
 
-	*return_value = *((struct lm_return_value *)obj->buffer.pointer);
+	*return_value = *((struct set_function_return_value *)
+			  obj->buffer.pointer);
 	kfree(obj);
 
 	return status;
@@ -1804,16 +1822,17 @@ wmid3_set_lm_mode(struct lm_input_params *params,
 
 static int __init acer_wmi_enable_ec_raw(void)
 {
-	struct lm_return_value return_value;
+	struct set_function_return_value return_value;
 	acpi_status status;
-	struct lm_input_params params = {
+	struct set_function_input_params params = {
 		.function_num = 0x1,
 		.commun_devices = 0xFFFF,
 		.devices = 0xFFFF,
-		.lm_status = 0x00,            /* Launch Manager Deactive */
+		.app_status = 0x00,		/* Launch Manager Deactive */
+		.app_mask = 0x01,
 	};
 
-	status = wmid3_set_lm_mode(&params, &return_value);
+	status = wmid3_set_function_mode(&params, &return_value);
 
 	if (return_value.error_code || return_value.ec_return_value)
 		pr_warn("Enabling EC raw mode failed: 0x%x - 0x%x\n",
@@ -1827,16 +1846,17 @@ static int __init acer_wmi_enable_ec_raw(void)
 
 static int __init acer_wmi_enable_lm(void)
 {
-	struct lm_return_value return_value;
+	struct set_function_return_value return_value;
 	acpi_status status;
-	struct lm_input_params params = {
+	struct set_function_input_params params = {
 		.function_num = 0x1,
 		.commun_devices = 0xFFFF,
 		.devices = 0xFFFF,
-		.lm_status = 0x01,            /* Launch Manager Active */
+		.app_status = 0x01,            /* Launch Manager Active */
+		.app_mask = 0x01,
 	};
 
-	status = wmid3_set_lm_mode(&params, &return_value);
+	status = wmid3_set_function_mode(&params, &return_value);
 
 	if (return_value.error_code || return_value.ec_return_value)
 		pr_warn("Enabling Launch Manager failed: 0x%x - 0x%x\n",
@@ -1846,6 +1866,28 @@ static int __init acer_wmi_enable_lm(void)
 	return status;
 }
 
+static int __init acer_wmi_enable_rf_button(void)
+{
+	struct set_function_return_value return_value;
+	acpi_status status;
+	struct set_function_input_params params = {
+		.function_num = 0x1,
+		.commun_devices = 0xFFFF,
+		.devices = 0xFFFF,
+		.app_status = 0x10,            /* RF Button Active */
+		.app_mask = 0x10,
+	};
+
+	status = wmid3_set_function_mode(&params, &return_value);
+
+	if (return_value.error_code || return_value.ec_return_value)
+		pr_warn("Enabling RF Button failed: 0x%x - 0x%x\n",
+			return_value.error_code,
+			return_value.ec_return_value);
+
+	return status;
+}
+
 #define ACER_WMID_ACCEL_HID	"BST0001"
 
 static acpi_status __init acer_wmi_get_handle_cb(acpi_handle ah, u32 level,
@@ -2229,6 +2271,10 @@ static int __init acer_wmi_init(void)
 		interface->capability &= ~ACER_CAP_BRIGHTNESS;
 
 	if (wmi_has_guid(WMID_GUID3)) {
+		if (ACPI_FAILURE(acer_wmi_enable_rf_button())) {
+			pr_err("Cannot enable RF Button Driver\n");
+			return -ENODEV;
+		}
 		if (ec_raw_mode) {
 			if (ACPI_FAILURE(acer_wmi_enable_ec_raw())) {
 				pr_err("Cannot enable EC raw mode\n");
-- 
2.9.3
