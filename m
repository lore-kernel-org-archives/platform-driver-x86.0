From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH] drivers/platform/x86: Lenovo IdeaPad Z570 support
Date: Mon, 04 Jun 2012 14:56:46 +0300
Message-ID: <1338811006.17357.3.camel@lenovo-ideapad-z570.gentooroot.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:49692 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752492Ab2FDL45 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jun 2012 07:56:57 -0400
Received: by bkcji2 with SMTP id ji2so3491781bkc.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jun 2012 04:56:56 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: ike.pan@canonical.com

The patch adds support for Lenovo IdeaPad Z570 laptop. It makes all special
keys working, adds possibility to control fan like Windows does and controls
Touchpad Disabled LED.
Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
--- linux/drivers/platform/x86/ideapad-laptop.c
+++ linux/drivers/platform/x86/ideapad-laptop.c
@@ -62,9 +62,12 @@ enum {
 	VPCCMD_W_CAMERA,
 	VPCCMD_R_3G,
 	VPCCMD_W_3G,
-	VPCCMD_R_ODD, /* 0x21 */
-	VPCCMD_R_RF = 0x23,
-	VPCCMD_W_RF,
+	VPCCMD_R_ODD,
+	VPCCMD_W_FAN,
+	VPCCMD_R_RF,
+	VPCCMD_W_RF, /* 0x24 */
+	VPCCMD_R_FAN = 0x2B,
+	VPCCMD_R_SPECIAL_BUTTONS = 0x31,
 	VPCCMD_W_BL_POWER = 0x33,
 };
 
@@ -363,8 +366,47 @@ static ssize_t store_ideapad_cam(struct
 
 static DEVICE_ATTR(camera_power, 0644, show_ideapad_cam, store_ideapad_cam);
 
+static ssize_t show_ideapad_fan(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	unsigned long result;
+
+	if (read_ec_data(ideapad_handle, VPCCMD_R_FAN, &result))
+		return sprintf(buf, "-1\n");
+	return sprintf(buf, "%lu\n", result);
+}
+
+static ssize_t store_ideapad_fan(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	int ret, state;
+
+	if (!count)
+		return 0;
+	if (sscanf(buf, "%i", &state) != 1)
+		return -EINVAL;
+	/* WARNING: these fan states are not speed
+	 * so it isn't cooling_device interface
+	 * 0 = super silent mode
+	 * 1 = standard mode
+	 * 2 = dust cleaning
+	 * 4 = efficient thermal dissipation mode
+	 */
+	if (state < 0 || state > 4 || state == 3)
+		return -EINVAL;
+	ret = write_ec_cmd(ideapad_handle, VPCCMD_W_FAN, state);
+	if (ret < 0)
+		return ret;
+	return count;
+}
+
+static DEVICE_ATTR(fan_mode, 0644, show_ideapad_fan, store_ideapad_fan);
+
 static struct attribute *ideapad_attributes[] = {
 	&dev_attr_camera_power.attr,
+	&dev_attr_fan_mode.attr,
 	NULL
 };
 
@@ -379,6 +421,10 @@ static mode_t ideapad_is_visible(struct
 	if (attr == &dev_attr_camera_power.attr)
 		supported = test_bit(CFG_CAMERA_BIT, &(priv->cfg));
 	else
+	if (attr == &dev_attr_fan_mode.attr) {
+		unsigned long value;
+		supported = !read_ec_data(ideapad_handle, VPCCMD_R_FAN, &value);
+	} else
 		supported = true;
 
 	return supported ? attr->mode : 0;
@@ -519,9 +565,15 @@ static void ideapad_platform_exit(struct
  */
 static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY, 6,  { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, 7,  { KEY_CAMERA } },
+	{ KE_KEY, 11, { KEY_F16 } },
 	{ KE_KEY, 13, { KEY_WLAN } },
 	{ KE_KEY, 16, { KEY_PROG1 } },
 	{ KE_KEY, 17, { KEY_PROG2 } },
+	{ KE_KEY, 64, { KEY_PROG3 } },
+	{ KE_KEY, 65, { KEY_PROG4 } },
+	{ KE_KEY, 66, { KEY_TOUCHPAD_OFF } },
+	{ KE_KEY, 67, { KEY_TOUCHPAD_ON } },
 	{ KE_END, 0 },
 };
 
@@ -767,6 +819,26 @@ static int __devexit ideapad_acpi_remove
 	return 0;
 }
 
+static void ideapad_check_special_buttons(struct ideapad_private *priv,
+					  unsigned long state)
+{
+	unsigned long bit;
+	for (bit = 0; bit < 16; bit++) {
+		if (test_bit(bit, &state)) {
+			switch (bit) {
+			case 6:
+				/* Thermal Management button */
+				ideapad_input_report(priv, 65);
+				break;
+			case 1:
+				/* OneKey Theater button */
+				ideapad_input_report(priv, 64);
+				break;
+			}
+		}
+	}
+}
+
 static void ideapad_acpi_notify(struct acpi_device *adevice, u32 event)
 {
 	struct ideapad_private *priv = dev_get_drvdata(&adevice->dev);
@@ -785,6 +857,24 @@ static void ideapad_acpi_notify(struct a
 			case 9:
 				ideapad_sync_rfk_state(priv);
 				break;
+			case 5:
+				{
+				unsigned long value;
+				/* DO NOT DELETE: Without reading from EC
+				 * touchpad LED doesn't switch state */
+				if (!read_ec_data(handle, VPCCMD_R_TOUCHPAD,
+						  &value)) {
+					/* WARNING: IdeaPad doesn't really turn
+					 * off touchpad - it only switches the
+					 * LED state. Userspace should turn
+					 * touchpad off and on. We send
+					 * KEY_TOUCHPAD_OFF and KEY_TOUCHPAD_ON
+					 * to not to get out of sync with LED */
+					ideapad_input_report(priv,
+							     value ? 67 : 66);
+				}
+				}
+				break;
 			case 4:
 				ideapad_backlight_notify_brightness(priv);
 				break;
@@ -794,6 +884,14 @@ static void ideapad_acpi_notify(struct a
 			case 2:
 				ideapad_backlight_notify_power(priv);
 				break;
+			case 0:
+				{
+				unsigned long value;
+				read_ec_data(handle, VPCCMD_R_SPECIAL_BUTTONS,
+					     &value);
+				ideapad_check_special_buttons(priv, value);
+				}
+				break;
 			default:
 				ideapad_input_report(priv, vpc_bit);
 			}
--- linux/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
+++ linux/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
@@ -5,4 +5,14 @@ Contact:	"Ike Panhc <ike.pan@canonical.c
 Description:
 		Control the power of camera module. 1 means on, 0 means off.
 
-
+What:		/sys/devices/platform/ideapad/fan_mode
+Date:		June 2012
+KernelVersion:	3.5
+Contact:	"Ike Panhc <ike.pan@canonical.com>"
+Description:
+		Change fan mode
+		There are four available modes:
+		    * 0 -> Super Silent Mode
+		    * 1 -> Standard Mode
+		    * 2 -> Dust Cleaning
+		    * 4 -> Efficient Thermal Dissipation Mode
