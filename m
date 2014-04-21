From: Konrad Zapalowicz <bergo.torino@gmail.com>
Subject: [PATCH 04/11] driver: thinkpad_acpi: replace seq_printf with seq_puts
Date: Mon, 21 Apr 2014 21:10:49 +0200
Message-ID: <1398107456-31080-5-git-send-email-bergo.torino@gmail.com>
References: <1398107456-31080-1-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-2-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-3-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-4-git-send-email-bergo.torino@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:56157 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753959AbaDUTLK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Apr 2014 15:11:10 -0400
Received: by mail-ee0-f54.google.com with SMTP id d49so3830471eek.41
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2014 12:11:09 -0700 (PDT)
In-Reply-To: <1398107456-31080-4-git-send-email-bergo.torino@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Konrad Zapalowicz <bergo.torino@gmail.com>

This commit fixes the "Prefer seq_puts to seq_printf" checkpath warning
plus it also fixes a few occurences of this issue not noticed by the
script.

Signed-off-by: Konrad Zapalowicz <bergo.torino@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 84 ++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 7e1bc89..33fa7fc 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1370,7 +1370,7 @@ static ssize_t tpacpi_rfk_sysfs_enable_store(const enum tpacpi_rfk_id id,
 static int tpacpi_rfk_procfs_read(const enum tpacpi_rfk_id id, struct seq_file *m)
 {
 	if (id >= TPACPI_RFK_SW_MAX)
-		seq_printf(m, "status:\t\tnot supported\n");
+		seq_puts(m, "status:\t\tnot supported\n");
 	else {
 		int status;
 
@@ -1387,7 +1387,7 @@ static int tpacpi_rfk_procfs_read(const enum tpacpi_rfk_id id, struct seq_file *
 		seq_printf(m, "status:\t\t%s\n",
 				(status == TPACPI_RFK_RADIO_ON) ?
 					"enabled" : "disabled");
-		seq_printf(m, "commands:\tenable, disable\n");
+		seq_puts(m, "commands:\tenable, disable\n");
 	}
 
 	return 0;
@@ -3888,7 +3888,7 @@ static int hotkey_read(struct seq_file *m)
 	int res, status;
 
 	if (!tp_features.hotkey) {
-		seq_printf(m, "status:\t\tnot supported\n");
+		seq_puts(m, "status:\t\tnot supported\n");
 		return 0;
 	}
 
@@ -3904,10 +3904,10 @@ static int hotkey_read(struct seq_file *m)
 	seq_printf(m, "status:\t\t%s\n", enabled(status, 0));
 	if (hotkey_all_mask) {
 		seq_printf(m, "mask:\t\t0x%08x\n", hotkey_user_mask);
-		seq_printf(m, "commands:\tenable, disable, reset, <mask>\n");
+		seq_puts(m, "commands:\tenable, disable, reset, <mask>\n");
 	} else {
-		seq_printf(m, "mask:\t\tnot supported\n");
-		seq_printf(m, "commands:\tenable, disable, reset\n");
+		seq_puts(m, "mask:\t\tnot supported\n");
+		seq_puts(m, "commands:\tenable, disable, reset\n");
 	}
 
 	return 0;
@@ -4754,7 +4754,7 @@ static int video_read(struct seq_file *m)
 	int status, autosw;
 
 	if (video_supported == TPACPI_VIDEO_NONE) {
-		seq_printf(m, "status:\t\tnot supported\n");
+		seq_puts(m, "status:\t\tnot supported\n");
 		return 0;
 	}
 
@@ -4770,18 +4770,18 @@ static int video_read(struct seq_file *m)
 	if (autosw < 0)
 		return autosw;
 
-	seq_printf(m, "status:\t\tsupported\n");
+	seq_puts(m, "status:\t\tsupported\n");
 	seq_printf(m, "lcd:\t\t%s\n", enabled(status, 0));
 	seq_printf(m, "crt:\t\t%s\n", enabled(status, 1));
 	if (video_supported == TPACPI_VIDEO_NEW)
 		seq_printf(m, "dvi:\t\t%s\n", enabled(status, 3));
 	seq_printf(m, "auto:\t\t%s\n", enabled(autosw, 0));
-	seq_printf(m, "commands:\tlcd_enable, lcd_disable\n");
-	seq_printf(m, "commands:\tcrt_enable, crt_disable\n");
+	seq_puts(m, "commands:\tlcd_enable, lcd_disable\n");
+	seq_puts(m, "commands:\tcrt_enable, crt_disable\n");
 	if (video_supported == TPACPI_VIDEO_NEW)
-		seq_printf(m, "commands:\tdvi_enable, dvi_disable\n");
-	seq_printf(m, "commands:\tauto_enable, auto_disable\n");
-	seq_printf(m, "commands:\tvideo_switch, expand_toggle\n");
+		seq_puts(m, "commands:\tdvi_enable, dvi_disable\n");
+	seq_puts(m, "commands:\tauto_enable, auto_disable\n");
+	seq_puts(m, "commands:\tvideo_switch, expand_toggle\n");
 
 	return 0;
 }
@@ -4985,16 +4985,16 @@ static int light_read(struct seq_file *m)
 	int status;
 
 	if (!tp_features.light) {
-		seq_printf(m, "status:\t\tnot supported\n");
+		seq_puts(m, "status:\t\tnot supported\n");
 	} else if (!tp_features.light_status) {
-		seq_printf(m, "status:\t\tunknown\n");
-		seq_printf(m, "commands:\ton, off\n");
+		seq_puts(m, "status:\t\tunknown\n");
+		seq_puts(m, "commands:\ton, off\n");
 	} else {
 		status = light_get_status();
 		if (status < 0)
 			return status;
 		seq_printf(m, "status:\t\t%s\n", onoff(status, 0));
-		seq_printf(m, "commands:\ton, off\n");
+		seq_puts(m, "commands:\ton, off\n");
 	}
 
 	return 0;
@@ -5080,10 +5080,10 @@ static int cmos_read(struct seq_file *m)
 	/* cmos not supported on 570, 600e/x, 770e, 770x, A21e, A2xm/p,
 	   R30, R31, T20-22, X20-21 */
 	if (!cmos_handle)
-		seq_printf(m, "status:\t\tnot supported\n");
+		seq_puts(m, "status:\t\tnot supported\n");
 	else {
-		seq_printf(m, "status:\t\tsupported\n");
-		seq_printf(m, "commands:\t<cmd> (<cmd> is 0-21)\n");
+		seq_puts(m, "status:\t\tsupported\n");
+		seq_puts(m, "commands:\t<cmd> (<cmd> is 0-21)\n");
 	}
 
 	return 0;
@@ -5482,10 +5482,10 @@ static int __init led_init(struct ibm_init_struct *iibm)
 static int led_read(struct seq_file *m)
 {
 	if (!led_supported) {
-		seq_printf(m, "status:\t\tnot supported\n");
+		seq_puts(m, "status:\t\tnot supported\n");
 		return 0;
 	}
-	seq_printf(m, "status:\t\tsupported\n");
+	seq_puts(m, "status:\t\tsupported\n");
 
 	if (led_supported == TPACPI_LED_570) {
 		/* 570 */
@@ -5499,7 +5499,7 @@ static int led_read(struct seq_file *m)
 		}
 	}
 
-	seq_printf(m, "commands:\t"
+	seq_puts(m, "commands:\t"
 		       "<led> on, <led> off, <led> blink (<led> is 0-15)\n");
 
 	return 0;
@@ -5582,10 +5582,10 @@ static int __init beep_init(struct ibm_init_struct *iibm)
 static int beep_read(struct seq_file *m)
 {
 	if (!beep_handle)
-		seq_printf(m, "status:\t\tnot supported\n");
+		seq_puts(m, "status:\t\tnot supported\n");
 	else {
-		seq_printf(m, "status:\t\tsupported\n");
-		seq_printf(m, "commands:\t<cmd> (<cmd> is 0-17)\n");
+		seq_puts(m, "status:\t\tsupported\n");
+		seq_puts(m, "commands:\t<cmd> (<cmd> is 0-17)\n");
 	}
 
 	return 0;
@@ -5956,14 +5956,14 @@ static int thermal_read(struct seq_file *m)
 	if (unlikely(n < 0))
 		return n;
 
-	seq_printf(m, "temperatures:\t");
+	seq_puts(m, "temperatures:\t");
 
 	if (n > 0) {
 		for (i = 0; i < (n - 1); i++)
 			seq_printf(m, "%d ", t.temp[i] / 1000);
 		seq_printf(m, "%d\n", t.temp[i] / 1000);
 	} else
-		seq_printf(m, "not supported\n");
+		seq_puts(m, "not supported\n");
 
 	return 0;
 }
@@ -6479,10 +6479,10 @@ static int brightness_read(struct seq_file *m)
 
 	level = brightness_get(NULL);
 	if (level < 0) {
-		seq_printf(m, "level:\t\tunreadable\n");
+		seq_puts(m, "level:\t\tunreadable\n");
 	} else {
 		seq_printf(m, "level:\t\t%d\n", level);
-		seq_printf(m, "commands:\tup, down\n");
+		seq_puts(m, "commands:\tup, down\n");
 		seq_printf(m, "commands:\tlevel <level> (<level> is 0-%d)\n",
 			       bright_maxlvl);
 	}
@@ -7109,10 +7109,10 @@ static int volume_read(struct seq_file *m)
 	u8 status;
 
 	if (volume_get_status(&status) < 0) {
-		seq_printf(m, "level:\t\tunreadable\n");
+		seq_puts(m, "level:\t\tunreadable\n");
 	} else {
 		if (tp_features.mixer_no_level_control)
-			seq_printf(m, "level:\t\tunsupported\n");
+			seq_puts(m, "level:\t\tunsupported\n");
 		else
 			seq_printf(m, "level:\t\t%d\n",
 					status & TP_EC_AUDIO_LVL_MSK);
@@ -7121,9 +7121,9 @@ static int volume_read(struct seq_file *m)
 				onoff(status, TP_EC_AUDIO_MUTESW));
 
 		if (volume_control_allowed) {
-			seq_printf(m, "commands:\tunmute, mute\n");
+			seq_puts(m, "commands:\tunmute, mute\n");
 			if (!tp_features.mixer_no_level_control) {
-				seq_printf(m,
+				seq_puts(m,
 					       "commands:\tup, down\n");
 				seq_printf(m,
 					       "commands:\tlevel <level>"
@@ -8336,40 +8336,40 @@ static int fan_read(struct seq_file *m)
 
 		if (status & TP_EC_FAN_FULLSPEED)
 			/* Disengaged mode takes precedence */
-			seq_printf(m, "level:\t\tdisengaged\n");
+			seq_puts(m, "level:\t\tdisengaged\n");
 		else if (status & TP_EC_FAN_AUTO)
-			seq_printf(m, "level:\t\tauto\n");
+			seq_puts(m, "level:\t\tauto\n");
 		else
 			seq_printf(m, "level:\t\t%d\n", status);
 		break;
 
 	case TPACPI_FAN_NONE:
 	default:
-		seq_printf(m, "status:\t\tnot supported\n");
+		seq_puts(m, "status:\t\tnot supported\n");
 	}
 
 	if (fan_control_commands & TPACPI_FAN_CMD_LEVEL) {
-		seq_printf(m, "commands:\tlevel <level>");
+		seq_puts(m, "commands:\tlevel <level>");
 
 		switch (fan_control_access_mode) {
 		case TPACPI_FAN_WR_ACPI_SFAN:
-			seq_printf(m, " (<level> is 0-7)\n");
+			seq_puts(m, " (<level> is 0-7)\n");
 			break;
 
 		default:
-			seq_printf(m, " (<level> is 0-7, "
+			seq_puts(m, " (<level> is 0-7, "
 				       "auto, disengaged, full-speed)\n");
 			break;
 		}
 	}
 
 	if (fan_control_commands & TPACPI_FAN_CMD_ENABLE)
-		seq_printf(m, "commands:\tenable, disable\n"
+		seq_puts(m, "commands:\tenable, disable\n"
 			       "commands:\twatchdog <timeout> (<timeout> "
 			       "is 0 (off), 1-120 (seconds))\n");
 
 	if (fan_control_commands & TPACPI_FAN_CMD_SPEED)
-		seq_printf(m, "commands:\tspeed <speed>"
+		seq_puts(m, "commands:\tspeed <speed>"
 			       " (<speed> is 0-65535)\n");
 
 	return 0;
-- 
1.8.1.2
