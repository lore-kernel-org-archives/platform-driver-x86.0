From: Konrad Zapalowicz <bergo.torino@gmail.com>
Subject: [PATCH 01/11] driver: thinkpad_acpi: add spaces around ?
Date: Mon, 21 Apr 2014 21:10:46 +0200
Message-ID: <1398107456-31080-2-git-send-email-bergo.torino@gmail.com>
References: <1398107456-31080-1-git-send-email-bergo.torino@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:33500 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753499AbaDUTLG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Apr 2014 15:11:06 -0400
Received: by mail-ee0-f53.google.com with SMTP id b57so3815839eek.26
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2014 12:11:04 -0700 (PDT)
In-Reply-To: <1398107456-31080-1-git-send-email-bergo.torino@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Konrad Zapalowicz <bergo.torino@gmail.com>

This commit fixes the "spaces required around that '?' (ctx:VxW)"
checkpatch errors in ./drivers/platform/x86/thinkpad_acpi.c file

Signed-off-by: Konrad Zapalowicz <bergo.torino@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 42 ++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 15e61c1..a306975 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3438,7 +3438,7 @@ err_exit:
 	delete_attr_set(hotkey_dev_attributes, &tpacpi_pdev->dev.kobj);
 	hotkey_dev_attributes = NULL;
 
-	return (res < 0)? res : 1;
+	return (res < 0) ? res : 1;
 }
 
 /* Thinkpad X1 Carbon support 5 modes including Home mode, Web browser
@@ -4574,7 +4574,7 @@ static int __init video_init(struct ibm_init_struct *iibm)
 		str_supported(video_supported != TPACPI_VIDEO_NONE),
 		video_supported);
 
-	return (video_supported != TPACPI_VIDEO_NONE)? 0 : 1;
+	return (video_supported != TPACPI_VIDEO_NONE) ? 0 : 1;
 }
 
 static void video_exit(void)
@@ -4667,7 +4667,7 @@ static int video_outputsw_set(int status)
 		return -ENOSYS;
 	}
 
-	return (res)? 0 : -EIO;
+	return (res) ? 0 : -EIO;
 }
 
 static int video_autosw_get(void)
@@ -4693,7 +4693,7 @@ static int video_autosw_get(void)
 
 static int video_autosw_set(int enable)
 {
-	if (!acpi_evalf(vid_handle, NULL, "_DOS", "vd", (enable)? 1 : 0))
+	if (!acpi_evalf(vid_handle, NULL, "_DOS", "vd", (enable) ? 1 : 0))
 		return -EIO;
 	return 0;
 }
@@ -4728,20 +4728,20 @@ static int video_outputsw_cycle(void)
 		return -EIO;
 	}
 
-	return (res)? 0 : -EIO;
+	return (res) ? 0 : -EIO;
 }
 
 static int video_expand_toggle(void)
 {
 	switch (video_supported) {
 	case TPACPI_VIDEO_570:
-		return acpi_evalf(ec_handle, NULL, "_Q17", "v")?
+		return acpi_evalf(ec_handle, NULL, "_Q17", "v") ?
 			0 : -EIO;
 	case TPACPI_VIDEO_770:
-		return acpi_evalf(vid_handle, NULL, "VEXP", "v")?
+		return acpi_evalf(vid_handle, NULL, "VEXP", "v") ?
 			0 : -EIO;
 	case TPACPI_VIDEO_NEW:
-		return acpi_evalf(NULL, NULL, "\\VEXP", "v")?
+		return acpi_evalf(NULL, NULL, "\\VEXP", "v") ?
 			0 : -EIO;
 	default:
 		return -ENOSYS;
@@ -4885,14 +4885,14 @@ static int light_set_status(int status)
 	if (tp_features.light) {
 		if (cmos_handle) {
 			rc = acpi_evalf(cmos_handle, NULL, NULL, "vd",
-					(status)?
+					(status) ?
 						TP_CMOS_THINKLIGHT_ON :
 						TP_CMOS_THINKLIGHT_OFF);
 		} else {
 			rc = acpi_evalf(lght_handle, NULL, NULL, "vd",
-					(status)? 1 : 0);
+					(status) ? 1 : 0);
 		}
-		return (rc)? 0 : -EIO;
+		return (rc) ? 0 : -EIO;
 	}
 
 	return -ENXIO;
@@ -4921,7 +4921,7 @@ static void light_sysfs_set(struct led_classdev *led_cdev,
 
 static enum led_brightness light_sysfs_get(struct led_classdev *led_cdev)
 {
-	return (light_get_status() == 1)? LED_FULL : LED_OFF;
+	return (light_get_status() == 1) ? LED_FULL : LED_OFF;
 }
 
 static struct tpacpi_led_classdev tpacpi_led_thinklight = {
@@ -5043,7 +5043,7 @@ static ssize_t cmos_command_store(struct device *dev,
 		return -EINVAL;
 
 	res = issue_thinkpad_cmos_command(cmos_cmd);
-	return (res)? res : count;
+	return (res) ? res : count;
 }
 
 static struct device_attribute dev_attr_cmos_command =
@@ -5067,7 +5067,7 @@ static int __init cmos_init(struct ibm_init_struct *iibm)
 	if (res)
 		return res;
 
-	return (cmos_handle)? 0 : 1;
+	return (cmos_handle) ? 0 : 1;
 }
 
 static void cmos_exit(void)
@@ -5177,9 +5177,9 @@ static int led_get_status(const unsigned int led)
 		if (!acpi_evalf(ec_handle,
 				&status, "GLED", "dd", 1 << led))
 			return -EIO;
-		led_s = (status == 0)?
+		led_s = (status == 0) ?
 				TPACPI_LED_OFF :
-				((status == 1)?
+				((status == 1) ?
 					TPACPI_LED_ON :
 					TPACPI_LED_BLINK);
 		tpacpi_led_state_cache[led] = led_s;
@@ -5576,7 +5576,7 @@ static int __init beep_init(struct ibm_init_struct *iibm)
 
 	tp_features.beep_needs_two_args = !!(quirks & TPACPI_BEEP_Q1);
 
-	return (beep_handle)? 0 : 1;
+	return (beep_handle) ? 0 : 1;
 }
 
 static int beep_read(struct seq_file *m)
@@ -6525,7 +6525,7 @@ static int brightness_write(char *buf)
 	if (!rc && ibm_backlight_device)
 		backlight_force_update(ibm_backlight_device,
 					BACKLIGHT_UPDATE_SYSFS);
-	return (rc == -EINTR)? -ERESTARTSYS : rc;
+	return (rc == -EINTR) ? -ERESTARTSYS : rc;
 }
 
 static struct ibm_struct brightness_driver_data = {
@@ -7982,7 +7982,7 @@ static ssize_t fan_pwm1_store(struct device *dev,
 	}
 
 	mutex_unlock(&fan_mutex);
-	return (rc)? rc : count;
+	return (rc) ? rc : count;
 }
 
 static struct device_attribute dev_attr_fan_pwm1 =
@@ -8660,7 +8660,7 @@ static const char * __init str_supported(int is_supported)
 {
 	static char text_unsupported[] __initdata = "not supported";
 
-	return (is_supported)? &text_unsupported[4] : &text_unsupported[0];
+	return (is_supported) ? &text_unsupported[4] : &text_unsupported[0];
 }
 #endif /* CONFIG_THINKPAD_ACPI_DEBUG */
 
@@ -8781,7 +8781,7 @@ err_out:
 		ibm->name, ret);
 
 	ibm_exit(ibm);
-	return (ret < 0)? ret : 0;
+	return (ret < 0) ? ret : 0;
 }
 
 /* Probing */
-- 
1.8.1.2
