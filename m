Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777272F28FC;
	Mon,  2 Feb 2026 20:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.82.102.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770065621; cv=none; b=jem3cVSRNSzPmGJj0ulDZYK11/d4nfZ5QpTEUY0EIgvGb9OwHIzNGR++qf5JOd5jaq170417pnoB2d3J92hJgi6yfh/bUOX5LKoUrd9dMU4FYfHc8UJ8QvWWW7MWoNBtX2bw3aCm/PvWBIkVyCXWwcn5BoaJAd+ktQFP3SmxImk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770065621; c=relaxed/simple;
	bh=CZmlQ5RCkV0nXxD8ve/EO5NhocVczHS8O8ble86/FWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gRsc6j/Z2pZjK6bGycOrseaezb6hgw9l7S3VRoB3TnAV2EaPEBK4NPDycByq3Q8XbdEo8t72ftdcxh91iqhgxxFXqQH5CZ2015VhVjlKULmC1NuUQPnMI3pXZLlpHGNuq6sHtQx5VY3vmBTuCWcd+IoINwgydfnhx07+aK1noDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytemap.space; spf=pass smtp.mailfrom=bytemap.space; dkim=pass (1024-bit key) header.d=bytemap.space header.i=@bytemap.space header.b=ldDgaUgC; arc=none smtp.client-ip=35.82.102.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytemap.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytemap.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bytemap.space header.i=@bytemap.space header.b="ldDgaUgC"
Received: from voidwalker (unknown [98.51.32.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: coby@bytemap.space)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id D657E4763E2;
	Mon,  2 Feb 2026 20:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bytemap.space;
	s=default; t=1770065614;
	bh=5xizIiHcm3BueXy1rzDz/CJHUMqEBM8Hny30+pOXHBw=;
	h=From:To:Cc:Subject:Date;
	b=ldDgaUgCseoivfMubEgnxEKzwTG26rcJ/ZtKNMWgBxMls7WfbocUvSFUW9tynvJOR
	 pBWCcO81P5qylFhQQMiOn0WiQLuu+PlF/rgJOBF7BQ8HFPxyfoPMKu+Zh1ybxtY9UV
	 EbQFhqNRmP5m0kQSSDOPGnEKjtB7Z5Yt3Ht1WQp0=
From: Coby McKinney <coby@bytemap.space>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Coby McKinney <coby@bytemap.space>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	ibm-acpi-devel@lists.sourceforge.net (open list:THINKPAD ACPI EXTRAS DRIVER),
	platform-driver-x86@vger.kernel.org (open list:THINKPAD ACPI EXTRAS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] platform/x86: thinkpad_acpi: use seq_puts() instead of seq_printf()
Date: Mon,  2 Feb 2026 12:52:11 -0800
Message-ID: <20260202205214.18898-1-coby@bytemap.space>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl reported warnings where seq_printf() was used for simple
strings with no format specifiers.

Replace these instances with seq_puts() to avoid the overhead of runtime
string parsing and to conform to kernel coding standards.

Signed-off-by: Coby McKinney <coby@bytemap.space>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 86 ++++++++++-----------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 6b0e4b4c485e..ffe71cbf3cb8 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -1315,7 +1315,7 @@ static ssize_t tpacpi_rfk_sysfs_enable_store(const enum tpacpi_rfk_id id,
 static int tpacpi_rfk_procfs_read(const enum tpacpi_rfk_id id, struct seq_file *m)
 {
 	if (id >= TPACPI_RFK_SW_MAX)
-		seq_printf(m, "status:\t\tnot supported\n");
+		seq_puts(m, "status:\t\tnot supported\n");
 	else {
 		int status;
 
@@ -1330,7 +1330,7 @@ static int tpacpi_rfk_procfs_read(const enum tpacpi_rfk_id id, struct seq_file *
 		}
 
 		seq_printf(m, "status:\t\t%s\n", str_enabled_disabled(status == TPACPI_RFK_RADIO_ON));
-		seq_printf(m, "commands:\tenable, disable\n");
+		seq_puts(m, "commands:\tenable, disable\n");
 	}
 
 	return 0;
@@ -4017,7 +4017,7 @@ static int hotkey_read(struct seq_file *m)
 	int res, status;
 
 	if (!tp_features.hotkey) {
-		seq_printf(m, "status:\t\tnot supported\n");
+		seq_puts(m, "status:\t\tnot supported\n");
 		return 0;
 	}
 
@@ -4033,10 +4033,10 @@ static int hotkey_read(struct seq_file *m)
 	seq_printf(m, "status:\t\t%s\n", str_enabled_disabled(status & BIT(0)));
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
@@ -4933,7 +4933,7 @@ static int video_read(struct seq_file *m)
 	int status, autosw;
 
 	if (video_supported == TPACPI_VIDEO_NONE) {
-		seq_printf(m, "status:\t\tnot supported\n");
+		seq_puts(m, "status:\t\tnot supported\n");
 		return 0;
 	}
 
@@ -4949,18 +4949,18 @@ static int video_read(struct seq_file *m)
 	if (autosw < 0)
 		return autosw;
 
-	seq_printf(m, "status:\t\tsupported\n");
+	seq_puts(m, "status:\t\tsupported\n");
 	seq_printf(m, "lcd:\t\t%s\n", str_enabled_disabled(status & BIT(0)));
 	seq_printf(m, "crt:\t\t%s\n", str_enabled_disabled(status & BIT(1)));
 	if (video_supported == TPACPI_VIDEO_NEW)
 		seq_printf(m, "dvi:\t\t%s\n", str_enabled_disabled(status & BIT(3)));
 	seq_printf(m, "auto:\t\t%s\n", str_enabled_disabled(autosw & BIT(0)));
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
@@ -5204,14 +5204,14 @@ static int kbdlight_read(struct seq_file *m)
 	int level;
 
 	if (!tp_features.kbdlight) {
-		seq_printf(m, "status:\t\tnot supported\n");
+		seq_puts(m, "status:\t\tnot supported\n");
 	} else {
 		level = kbdlight_get_level();
 		if (level < 0)
 			seq_printf(m, "status:\t\terror %d\n", level);
 		else
 			seq_printf(m, "status:\t\t%d\n", level);
-		seq_printf(m, "commands:\t0, 1, 2\n");
+		seq_puts(m, "commands:\t0, 1, 2\n");
 	}
 
 	return 0;
@@ -5378,16 +5378,16 @@ static int light_read(struct seq_file *m)
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
 		seq_printf(m, "status:\t\t%s\n", str_on_off(status & BIT(0)));
-		seq_printf(m, "commands:\ton, off\n");
+		seq_puts(m, "commands:\ton, off\n");
 	}
 
 	return 0;
@@ -5477,10 +5477,10 @@ static int cmos_read(struct seq_file *m)
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
@@ -5847,10 +5847,10 @@ static int __init led_init(struct ibm_init_struct *iibm)
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
@@ -5863,7 +5863,7 @@ static int led_read(struct seq_file *m)
 		}
 	}
 
-	seq_printf(m, "commands:\t<led> on, <led> off, <led> blink (<led> is 0-15)\n");
+	seq_puts(m, "commands:\t<led> on, <led> off, <led> blink (<led> is 0-15)\n");
 
 	return 0;
 }
@@ -5947,10 +5947,10 @@ static int __init beep_init(struct ibm_init_struct *iibm)
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
@@ -6399,14 +6399,14 @@ static int thermal_read(struct seq_file *m)
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
@@ -6919,10 +6919,10 @@ static int brightness_read(struct seq_file *m)
 
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
@@ -7638,10 +7638,10 @@ static int volume_read(struct seq_file *m)
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
@@ -7649,9 +7649,9 @@ static int volume_read(struct seq_file *m)
 		seq_printf(m, "mute:\t\t%s\n", str_on_off(status & BIT(TP_EC_AUDIO_MUTESW)));
 
 		if (volume_control_allowed) {
-			seq_printf(m, "commands:\tunmute, mute\n");
+			seq_puts(m, "commands:\tunmute, mute\n");
 			if (!tp_features.mixer_no_level_control) {
-				seq_printf(m, "commands:\tup, down\n");
+				seq_puts(m, "commands:\tup, down\n");
 				seq_printf(m, "commands:\tlevel <level> (<level> is 0-%d)\n",
 					      TP_EC_VOLUME_MAX);
 			}
@@ -9157,9 +9157,9 @@ static int fan_read(struct seq_file *m)
 		} else if (fan_status_access_mode == TPACPI_FAN_RD_TPEC) {
 			if (status & TP_EC_FAN_FULLSPEED)
 				/* Disengaged mode takes precedence */
-				seq_printf(m, "level:\t\tdisengaged\n");
+				seq_puts(m, "level:\t\tdisengaged\n");
 			else if (status & TP_EC_FAN_AUTO)
-				seq_printf(m, "level:\t\tauto\n");
+				seq_puts(m, "level:\t\tauto\n");
 			else
 				seq_printf(m, "level:\t\t%d\n", status);
 		}
@@ -9167,19 +9167,19 @@ static int fan_read(struct seq_file *m)
 
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
-			seq_printf(m, " (<level> is 0-7, auto, disengaged, full-speed)\n");
+			seq_puts(m, " (<level> is 0-7, auto, disengaged, full-speed)\n");
 			break;
 		}
 	}
@@ -9189,7 +9189,7 @@ static int fan_read(struct seq_file *m)
 			       "commands:\twatchdog <timeout> (<timeout> is 0 (off), 1-120 (seconds))\n");
 
 	if (fan_control_commands & TPACPI_FAN_CMD_SPEED)
-		seq_printf(m, "commands:\tspeed <speed> (<speed> is 0-65535)\n");
+		seq_puts(m, "commands:\tspeed <speed> (<speed> is 0-65535)\n");
 
 	return 0;
 }
-- 
2.52.0

