From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 4/4] toshiba_acpi: Adapt functions to the changes made to HCI/SCI
Date: Tue, 23 Sep 2014 18:24:28 -0600
Message-ID: <1411518268-2773-5-git-send-email-coproscefalo@gmail.com>
References: <1411518268-2773-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411518268-2773-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

The previous patch changed the return type for the HCI/SCI
read/write functions.

This patch adapts the code for that change, as now the
"result" parameter is returned by those functions, instead
of the ACPI status call.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 77 ++++++++++++++++-------------=
--------
 1 file changed, 34 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86=
/toshiba_acpi.c
index 43385f7..582563d 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -459,7 +459,6 @@ static void toshiba_illumination_set(struct led_cla=
ssdev *cdev,
 	struct toshiba_acpi_dev *dev =3D container_of(cdev,
 			struct toshiba_acpi_dev, led_dev);
 	u32 state, result;
-	acpi_status status;
=20
 	/* First request : initialize communication. */
 	if (!sci_open(dev))
@@ -467,9 +466,9 @@ static void toshiba_illumination_set(struct led_cla=
ssdev *cdev,
=20
 	/* Switch the illumination on/off */
 	state =3D brightness ? 1 : 0;
-	status =3D sci_write(dev, SCI_ILLUMINATION, state, &result);
+	result =3D sci_write(dev, SCI_ILLUMINATION, state);
 	sci_close(dev);
-	if (ACPI_FAILURE(status)) {
+	if (result =3D=3D TOS_FAILURE) {
 		pr_err("ACPI call for illumination failed\n");
 		return;
 	} else if (result =3D=3D TOS_NOT_SUPPORTED) {
@@ -483,16 +482,15 @@ static enum led_brightness toshiba_illumination_g=
et(struct led_classdev *cdev)
 	struct toshiba_acpi_dev *dev =3D container_of(cdev,
 			struct toshiba_acpi_dev, led_dev);
 	u32 state, result;
-	acpi_status status;
=20
 	/*=C2=A0First request : initialize communication. */
 	if (!sci_open(dev))
 		return LED_OFF;
=20
 	/* Check the illumination */
-	status =3D sci_read(dev, SCI_ILLUMINATION, &state, &result);
+	result =3D sci_read(dev, SCI_ILLUMINATION, &state);
 	sci_close(dev);
-	if (ACPI_FAILURE(status) || result =3D=3D TOS_INPUT_DATA_ERROR) {
+	if (result =3D=3D TOS_FAILURE || result =3D=3D TOS_INPUT_DATA_ERROR) =
{
 		pr_err("ACPI call for illumination failed\n");
 		return LED_OFF;
 	} else if (result =3D=3D TOS_NOT_SUPPORTED) {
@@ -543,14 +541,13 @@ static int toshiba_kbd_illum_available(struct tos=
hiba_acpi_dev *dev)
 static int toshiba_kbd_illum_status_set(struct toshiba_acpi_dev *dev, =
u32 time)
 {
 	u32 result;
-	acpi_status status;
=20
 	if (!sci_open(dev))
 		return -EIO;
=20
-	status =3D sci_write(dev, SCI_KBD_ILLUM_STATUS, time, &result);
+	result =3D sci_write(dev, SCI_KBD_ILLUM_STATUS, time);
 	sci_close(dev);
-	if (ACPI_FAILURE(status) || result =3D=3D TOS_INPUT_DATA_ERROR) {
+	if (result =3D=3D TOS_FAILURE || result =3D=3D TOS_INPUT_DATA_ERROR) =
{
 		pr_err("ACPI call to set KBD backlight status failed\n");
 		return -EIO;
 	} else if (result =3D=3D TOS_NOT_SUPPORTED) {
@@ -564,14 +561,13 @@ static int toshiba_kbd_illum_status_set(struct to=
shiba_acpi_dev *dev, u32 time)
 static int toshiba_kbd_illum_status_get(struct toshiba_acpi_dev *dev, =
u32 *time)
 {
 	u32 result;
-	acpi_status status;
=20
 	if (!sci_open(dev))
 		return -EIO;
=20
-	status =3D sci_read(dev, SCI_KBD_ILLUM_STATUS, time, &result);
+	result =3D sci_read(dev, SCI_KBD_ILLUM_STATUS, time);
 	sci_close(dev);
-	if (ACPI_FAILURE(status) || result =3D=3D TOS_INPUT_DATA_ERROR) {
+	if (result =3D=3D TOS_FAILURE || result =3D=3D TOS_INPUT_DATA_ERROR) =
{
 		pr_err("ACPI call to get KBD backlight status failed\n");
 		return -EIO;
 	} else if (result =3D=3D TOS_NOT_SUPPORTED) {
@@ -587,11 +583,10 @@ static enum led_brightness toshiba_kbd_backlight_=
get(struct led_classdev *cdev)
 	struct toshiba_acpi_dev *dev =3D container_of(cdev,
 			struct toshiba_acpi_dev, kbd_led);
 	u32 state, result;
-	acpi_status status;
=20
 	/* Check the keyboard backlight state */
-	status =3D hci_read1(dev, HCI_KBD_ILLUMINATION, &state, &result);
-	if (ACPI_FAILURE(status) || result =3D=3D TOS_INPUT_DATA_ERROR) {
+	result =3D hci_read1(dev, HCI_KBD_ILLUMINATION, &state);
+	if (result =3D=3D TOS_FAILURE || result =3D=3D TOS_INPUT_DATA_ERROR) =
{
 		pr_err("ACPI call to get the keyboard backlight failed\n");
 		return LED_OFF;
 	} else if (result =3D=3D TOS_NOT_SUPPORTED) {
@@ -608,12 +603,11 @@ static void toshiba_kbd_backlight_set(struct led_=
classdev *cdev,
 	struct toshiba_acpi_dev *dev =3D container_of(cdev,
 			struct toshiba_acpi_dev, kbd_led);
 	u32 state, result;
-	acpi_status status;
=20
 	/* Set the keyboard backlight state */
 	state =3D brightness ? 1 : 0;
-	status =3D hci_write1(dev, HCI_KBD_ILLUMINATION, state, &result);
-	if (ACPI_FAILURE(status) || result =3D=3D TOS_INPUT_DATA_ERROR) {
+	result =3D hci_write1(dev, HCI_KBD_ILLUMINATION, state);
+	if (result =3D=3D TOS_FAILURE || result =3D=3D TOS_INPUT_DATA_ERROR) =
{
 		pr_err("ACPI call to set KBD Illumination mode failed\n");
 		return;
 	} else if (result =3D=3D TOS_NOT_SUPPORTED) {
@@ -626,14 +620,13 @@ static void toshiba_kbd_backlight_set(struct led_=
classdev *cdev,
 static int toshiba_touchpad_set(struct toshiba_acpi_dev *dev, u32 stat=
e)
 {
 	u32 result;
-	acpi_status status;
=20
 	if (!sci_open(dev))
 		return -EIO;
=20
-	status =3D sci_write(dev, SCI_TOUCHPAD, state, &result);
+	result =3D sci_write(dev, SCI_TOUCHPAD, state);
 	sci_close(dev);
-	if (ACPI_FAILURE(status)) {
+	if (result =3D=3D TOS_FAILURE) {
 		pr_err("ACPI call to set the touchpad failed\n");
 		return -EIO;
 	} else if (result =3D=3D TOS_NOT_SUPPORTED) {
@@ -646,14 +639,13 @@ static int toshiba_touchpad_set(struct toshiba_ac=
pi_dev *dev, u32 state)
 static int toshiba_touchpad_get(struct toshiba_acpi_dev *dev, u32 *sta=
te)
 {
 	u32 result;
-	acpi_status status;
=20
 	if (!sci_open(dev))
 		return -EIO;
=20
-	status =3D sci_read(dev, SCI_TOUCHPAD, state, &result);
+	result =3D sci_read(dev, SCI_TOUCHPAD, state);
 	sci_close(dev);
-	if (ACPI_FAILURE(status)) {
+	if (result =3D=3D TOS_FAILURE) {
 		pr_err("ACPI call to query the touchpad failed\n");
 		return -EIO;
 	} else if (result =3D=3D TOS_NOT_SUPPORTED) {
@@ -769,7 +761,7 @@ static u32 hci_get_bt_present(struct toshiba_acpi_d=
ev *dev, bool *present)
=20
 	value =3D 0;
 	value2 =3D 0;
-	hci_read2(dev, HCI_WIRELESS, &value, &value2, &hci_result);
+	hci_result =3D hci_read2(dev, HCI_WIRELESS, &value, &value2);
 	if (hci_result =3D=3D TOS_SUCCESS)
 		*present =3D (value & HCI_WIRELESS_BT_PRESENT) ? true : false;
=20
@@ -783,7 +775,7 @@ static u32 hci_get_radio_state(struct toshiba_acpi_=
dev *dev, bool *radio_state)
=20
 	value =3D 0;
 	value2 =3D 0x0001;
-	hci_read2(dev, HCI_WIRELESS, &value, &value2, &hci_result);
+	hci_result =3D hci_read2(dev, HCI_WIRELESS, &value, &value2);
=20
 	*radio_state =3D value & HCI_WIRELESS_KILL_SWITCH;
 	return hci_result;
@@ -810,8 +802,8 @@ static int bt_rfkill_set_block(void *data, bool blo=
cked)
 		goto out;
 	}
=20
-	hci_write2(dev, HCI_WIRELESS, value, HCI_WIRELESS_BT_POWER, &result1)=
;
-	hci_write2(dev, HCI_WIRELESS, value, HCI_WIRELESS_BT_ATTACH, &result2=
);
+	result1 =3D hci_write2(dev, HCI_WIRELESS, value, HCI_WIRELESS_BT_POWE=
R);
+	result2 =3D hci_write2(dev, HCI_WIRELESS, value, HCI_WIRELESS_BT_ATTA=
CH);
=20
 	if (result1 !=3D TOS_SUCCESS || result2 !=3D TOS_SUCCESS)
 		err =3D -EIO;
@@ -856,7 +848,7 @@ static int get_tr_backlight_status(struct toshiba_a=
cpi_dev *dev, bool *enabled)
 	u32 hci_result;
 	u32 status;
=20
-	hci_read1(dev, HCI_TR_BACKLIGHT, &status, &hci_result);
+	hci_result =3D hci_read1(dev, HCI_TR_BACKLIGHT, &status);
 	*enabled =3D !status;
 	return hci_result =3D=3D TOS_SUCCESS ? 0 : -EIO;
 }
@@ -866,7 +858,7 @@ static int set_tr_backlight_status(struct toshiba_a=
cpi_dev *dev, bool enable)
 	u32 hci_result;
 	u32 value =3D !enable;
=20
-	hci_write1(dev, HCI_TR_BACKLIGHT, value, &hci_result);
+	hci_result =3D hci_write1(dev, HCI_TR_BACKLIGHT, value);
 	return hci_result =3D=3D TOS_SUCCESS ? 0 : -EIO;
 }
=20
@@ -888,7 +880,7 @@ static int __get_lcd_brightness(struct toshiba_acpi=
_dev *dev)
 		brightness++;
 	}
=20
-	hci_read1(dev, HCI_LCD_BRIGHTNESS, &value, &hci_result);
+	hci_result =3D hci_read1(dev, HCI_LCD_BRIGHTNESS, &value);
 	if (hci_result =3D=3D TOS_SUCCESS)
 		return brightness + (value >> HCI_LCD_BRIGHTNESS_SHIFT);
=20
@@ -1003,7 +995,7 @@ static int get_video_status(struct toshiba_acpi_de=
v *dev, u32 *status)
 {
 	u32 hci_result;
=20
-	hci_read1(dev, HCI_VIDEO_OUT, status, &hci_result);
+	hci_result =3D hci_read1(dev, HCI_VIDEO_OUT, status);
 	return hci_result =3D=3D TOS_SUCCESS ? 0 : -EIO;
 }
=20
@@ -1107,7 +1099,7 @@ static int get_fan_status(struct toshiba_acpi_dev=
 *dev, u32 *status)
 {
 	u32 hci_result;
=20
-	hci_read1(dev, HCI_FAN, status, &hci_result);
+	hci_result =3D hci_read1(dev, HCI_FAN, status);
 	return hci_result =3D=3D TOS_SUCCESS ? 0 : -EIO;
 }
=20
@@ -1147,7 +1139,7 @@ static ssize_t fan_proc_write(struct file *file, =
const char __user *buf,
=20
 	if (sscanf(cmd, " force_on : %i", &value) =3D=3D 1 &&
 	    value >=3D 0 && value <=3D 1) {
-		hci_write1(dev, HCI_FAN, value, &hci_result);
+		hci_result =3D hci_write1(dev, HCI_FAN, value);
 		if (hci_result !=3D TOS_SUCCESS)
 			return -EIO;
 		else
@@ -1175,7 +1167,7 @@ static int keys_proc_show(struct seq_file *m, voi=
d *v)
 	u32 value;
=20
 	if (!dev->key_event_valid && dev->system_event_supported) {
-		hci_read1(dev, HCI_SYSTEM_EVENT, &value, &hci_result);
+		hci_result =3D hci_read1(dev, HCI_SYSTEM_EVENT, &value);
 		if (hci_result =3D=3D TOS_SUCCESS) {
 			dev->key_event_valid =3D 1;
 			dev->last_key_event =3D value;
@@ -1185,7 +1177,7 @@ static int keys_proc_show(struct seq_file *m, voi=
d *v)
 			/* This is a workaround for an unresolved issue on
 			 * some machines where system events sporadically
 			 * become disabled. */
-			hci_write1(dev, HCI_SYSTEM_EVENT, 1, &hci_result);
+			hci_result =3D hci_write1(dev, HCI_SYSTEM_EVENT, 1);
 			pr_notice("Re-enabled hotkeys\n");
 		} else {
 			pr_err("Error reading hotkey status\n");
@@ -1679,7 +1671,7 @@ static int toshiba_acpi_setup_keyboard(struct tos=
hiba_acpi_dev *dev)
 	if (acpi_has_method(dev->acpi_dev->handle, "INFO"))
 		dev->info_supported =3D 1;
 	else {
-		hci_write1(dev, HCI_SYSTEM_EVENT, 1, &hci_result);
+		hci_result =3D hci_write1(dev, HCI_SYSTEM_EVENT, 1);
 		if (hci_result =3D=3D TOS_SUCCESS)
 			dev->system_event_supported =3D 1;
 	}
@@ -1702,7 +1694,7 @@ static int toshiba_acpi_setup_keyboard(struct tos=
hiba_acpi_dev *dev)
 		goto err_remove_filter;
 	}
=20
-	hci_write1(dev, HCI_HOTKEY_EVENT, HCI_HOTKEY_ENABLE, &hci_result);
+	hci_result =3D hci_write1(dev, HCI_HOTKEY_EVENT, HCI_HOTKEY_ENABLE);
 	return 0;
=20
  err_remove_filter:
@@ -1963,7 +1955,7 @@ static void toshiba_acpi_notify(struct acpi_devic=
e *acpi_dev, u32 event)
 			toshiba_acpi_report_hotkey(dev, scancode);
 	} else if (dev->system_event_supported) {
 		do {
-			hci_read1(dev, HCI_SYSTEM_EVENT, &value, &hci_result);
+			hci_result =3D hci_read1(dev, HCI_SYSTEM_EVENT, &value);
 			switch (hci_result) {
 			case TOS_SUCCESS:
 				toshiba_acpi_report_hotkey(dev, (int)value);
@@ -1974,8 +1966,7 @@ static void toshiba_acpi_notify(struct acpi_devic=
e *acpi_dev, u32 event)
 				 * issue on some machines where system events
 				 * sporadically become disabled.
 				 */
-				hci_write1(dev, HCI_SYSTEM_EVENT, 1,
-					   &hci_result);
+				hci_result =3D hci_write1(dev, HCI_SYSTEM_EVENT, 1);
 				pr_notice("Re-enabled hotkeys\n");
 				/* fall through */
 			default:
@@ -1993,7 +1984,7 @@ static int toshiba_acpi_suspend(struct device *de=
vice)
 	u32 result;
=20
 	if (dev->hotkey_dev)
-		hci_write1(dev, HCI_HOTKEY_EVENT, HCI_HOTKEY_DISABLE, &result);
+		result =3D hci_write1(dev, HCI_HOTKEY_EVENT, HCI_HOTKEY_DISABLE);
=20
 	return 0;
 }
@@ -2010,7 +2001,7 @@ static int toshiba_acpi_resume(struct device *dev=
ice)
 		if (ACPI_FAILURE(status))
 			pr_info("Unable to re-enable hotkeys\n");
=20
-		hci_write1(dev, HCI_HOTKEY_EVENT, HCI_HOTKEY_ENABLE, &result);
+		result =3D hci_write1(dev, HCI_HOTKEY_EVENT, HCI_HOTKEY_ENABLE);
 	}
=20
 	return 0;
--=20
2.0.0
