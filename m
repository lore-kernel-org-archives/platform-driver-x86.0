Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020645;
	b=RX2CnpeYVq0Xm88lXrMIUPawHA65uQUy1TDSIq7FK0sh2fX5tIBQJwvpHFYcCW5xVn9z
	 R0J15KnVvGpLAWzNlQBmuui/xQv+tKWom7CcQXad91iTsGXVA4/TF837FYXB44fDf/wCB
	 PLic1FmgtXwsawX0lRxZFiAlsg5ccis5WrN0PMvYSqHr72hev2bnNdIe8cY/A7AwFRqrj
	 EESBXXiDiAsaNpi+5NG2laq0dtm9L55fttLq+sfDQfEGWihoIIP8hn/tRuX07tuQ9zyjA
	 Y/QgDuKbZAS0PjkAUyva0EbxNbbUxEDq9Jr+3w3E4yz3wyTDG/gghknLnQQ9mJrFWiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dp3CEUIWG4ZlM/vo6FzdszxeLdRIwkhm0EFu7Z420cM=;
	b=TeyY7pq3EQTlPU8CgrWIc9YpGVKKFQPEujXfqFCvMUvAxKkYjArOBCqpDnZhuPPlQxmP
	 HeksIiqo7GzrS2iIBgTcGouUaUXWZWlfRbLL84P0O4/c5E69htDtLZ6mEgkCOqcVgqcnF
	 6mpluKcggCt7JiqB/p5VB6ToTVHaK4wSX6jUaO918MF5pmcBZ4KQ+d+yjHfIXN1rGoAeT
	 7FixLDJ/g1TmSrW1ze/swiJ7eSobiDuqDVnbzgxv/l33Kf4slR1QO2QfTLaY5f672R9le
	 wPDJvFxMCg3gHJWWmVhRCIEN62Mtp940dPS5/PkRSLh3aG/jD/NqZv1cDmuOoqY3kKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U937B17l;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B592F606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 13:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B592F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U937B17l
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2637958f8f.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 06:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793020643; x=1793625443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dp3CEUIWG4ZlM/vo6FzdszxeLdRIwkhm0EFu7Z420cM=;
        b=U937B17l2G0UPyJWQ74V63C09xXgltUEQfce5Rva5x7lDzrKGKGQB/uGp37018gJCv
         fHvO5uO1VrzVNdWquKhthcvIlLa2GZ2huThF8EMjJr4RPttRAo73sqlZyt3/pIGLdZBZ
         MQicrTeX/y2g37Pr8GswMAox6xYcfnsAhGJqwj3nyK/eZY/Q+styhQTc3+rsgAkeHJf3
         EKZmnVGhjfwEkvSPyQQv9LIo6+RXNvjittyPp5gPEsCdaIwTzPTq9OXOjWMzIHZ3Lm8z
         aLdRTxpcSsHkQiwb2eJWcPQ2eT1aDh/mgtywP3oHHU6y+HOLg4Fs65GJyPzUHDkl+yqv
         nVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020643; x=1793625443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dp3CEUIWG4ZlM/vo6FzdszxeLdRIwkhm0EFu7Z420cM=;
        b=esuOT3UmThFftr1enu4vuOZFJ2PT631lRkVSGYlEV/R5MtkLCdeeQDun+6GgcVWZXl
         qOhG1iySUlXz5NvC0rsPcdRFI43S7DgbQD6rMOPHsg24tnx/e0DO285k2Qym12RU1efc
         JBzwJt2zVtU3EVafPEThtsBhkr44js/XSl8WbVOGvkXc6lCj4pz7tAUwapWkuK+HIQGm
         RqcRZZaQZPGyVOpuQAEFv/mRz8rb+Q7Ju0ND593u204v610Ni7uoRuaoLnpFLlpEKkRG
         XnCr3OKU2RyphmUIO8fClbpRg//m5wtLxRocmkLIsndgcLlfSqKNb6RIIFtqA53/wjjx
         VyEA==
X-Gm-Message-State: AFq9FYLZYahQGH1/h13BDf/H6AXVv5g+oLZpjn2Gc7hl+VQEfgTfZ//n
	LkSNGMuJlAcmSewmiaXMccI8I1hzZV0/UHIHWhE+pqfkowGXksrIfG1r
X-Gm-Gg: AYBFou0BXUQrYJthXZ7bs1r0jbxr6oXbtP22IC8cPqW+dHdKiAFxrHVpOOGCxCQBx6/
	rZ3/2T9iuwxcyvRHdulcE8Bth/gZDGIUH1k3DJIRyEaHhGqj7zjupR4nu6yk7jJRD/bhKtvkY+c
	yBl18bRVTDhZQ4Xv6lzq6OD6e5oqK4E6k7ICPHEMRH8uWNnq4n6Xf86RblQR32S+GcugS+9Nmi9
	tLCMHENTGzYgPItVqd1Hh3qeiDryllv7jrMxGou/pkfBhnoKNltzDMLL8kYEaSBfl0nh4J1XRwu
	/49qbROyoH+XSQ3T702JPlrmkz7rSXfQZrejX4N+9Ypux8z/4cTnrfiyJeMRjkyKoXnBPthZwfE
	qjYwNOtjoz7XIB88R9lfLV+LNzPrAxELXt1Mn3euYN5WTCW+SkjVF1JMN6O16MVFTHnOdUwpfkd
	HqlHbjlvNm01Iaw6qVxeGRMn2F5vCiJmlK2QzPv4BhmUlLKrDlNVek9FzXT7GS5qYUKHWstomWs
	g8/jil/hk4GbxFfcG6dWKXpZXmc9ZeJcDjjhnqFr8SceM3uGA0ey6X1G4Q8Hs7UodpNrxBVtsKB
	DLfYCdRx+XsrQwG16Y2z6XY43OQJ+0SCflSaw47Ufw==
X-Received: by 2002:a05:6000:40dc:b0:48e:1b11:7ee5 with SMTP id ffacd0b85a97d-48e3eb9a1d5mr12249321f8f.11.1793020642797;
        Mon, 26 Oct 2026 06:17:22 -0700 (PDT)
Received: from matebook.galaxus.box (adsl-84-226-215-1.adslplus.ch. [84.226.215.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f37csm13485709f8f.8.2026.10.26.06.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:17:21 -0700 (PDT)
From: Cian Ruane <cian.ruane1@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cian Ruane <cian.ruane1@gmail.com>
Subject: [PATCH v2] platform/x86: huawei-wmi: Add keyboard backlight support
Date: Mon, 26 Oct 2026 14:17:20 +0100
Message-ID: <20261026131720.9885-1-cian.ruane1@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HWMI interface of the HUAWEI MateBook X Pro 2020 (MACHC-WAX9)
exposes the keyboard backlight through the \GLIV and \SLIV methods of
the WMAA dispatcher (MFID 2, SFID 6/7), with the level in byte 2 of the
buffer. The EC stores the level doubled, so the three levels off/low/
high are represented as 0, 2 and 4.

Register a "platform::kbd_backlight" LED class device with a maximum
brightness of 2 so that userspace, e.g. UPower, can control it.

Changes made with the Fn+F3 hotkey are handled by the EC itself and
are not reported to the OS on this model: no EC query or WMI event is
generated. LED_BRIGHT_HW_CHANGED is therefore not set.

The level encoding has only been verified on this model, so enable the
feature through a DMI quirk.

Add a HWMI_BUF_SIZE define for the size of the HWMI result buffer and
use it for the existing battery threshold and Fn-lock buffers as well.

Tested on: HUAWEI MACHC-WAX9 (MateBook X Pro 2020), BIOS 1.05 and 1.26,
Ubuntu 24.04 (kernel 6.8.0-147-generic, with this patch backported).

Signed-off-by: Cian Ruane <cian.ruane1@gmail.com>
---
Changes in v2:
- Use named defines for the HWMI buffer size and the level byte offsets
  instead of literals, and use HWMI_BUF_SIZE for the existing battery
  and Fn-lock buffers too (Ilpo)

v1: https://lore.kernel.org/r/20261025233910.9907-1-cian.ruane1@gmail.com

 drivers/platform/x86/huawei-wmi.c | 75 +++++++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 96ee9a97c..59b3f7d9d 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -31,6 +31,9 @@
 #define WMI0_EXPENSIVE_GUID "39142400-C6A3-40fa-BADB-8A2652834100"
 #define WMI0_EVENT_GUID "59142400-C6A3-40fa-BADB-8A2652834100"
 
+/* Size of the buffer returned by HWMI, byte 0 is the return status */
+#define HWMI_BUF_SIZE			0x100
+
 /* HWMI commands */
 
 enum {
@@ -39,8 +42,17 @@ enum {
 	FN_LOCK_GET			= 0x00000604, /* \GFRS */
 	FN_LOCK_SET			= 0x00000704, /* \SFRS */
 	MICMUTE_LED_SET			= 0x00000b04, /* \SMLS */
+	KBD_BACKLIGHT_GET		= 0x00000602, /* \GLIV */
+	KBD_BACKLIGHT_SET		= 0x00000702, /* \SLIV */
 };
 
+/* The EC stores the keyboard backlight level doubled: off/low/high = 0/2/4. */
+#define KBD_BACKLIGHT_MAX		2
+#define KBD_BACKLIGHT_STEP		2
+/* Level byte in the \GLIV result (KBLL) and in the \SLIV argument (SOCP) */
+#define KBD_BACKLIGHT_GET_LEVEL_OFFSET	2
+#define KBD_BACKLIGHT_SET_LEVEL_OFFSET	2
+
 union hwmi_arg {
 	u64 cmd;
 	u8 args[8];
@@ -50,6 +62,7 @@ struct quirk_entry {
 	bool battery_reset;
 	bool ec_micmute;
 	bool report_brightness;
+	bool kbd_backlight;
 };
 
 static struct quirk_entry *quirks;
@@ -65,6 +78,7 @@ struct huawei_wmi {
 
 	struct huawei_wmi_debug debug;
 	struct led_classdev cdev;
+	struct led_classdev kbd_cdev;
 	struct device *dev;
 
 	struct mutex wmi_lock;
@@ -126,6 +140,10 @@ static struct quirk_entry quirk_matebook_x = {
 	.report_brightness = true,
 };
 
+static struct quirk_entry quirk_kbd_backlight = {
+	.kbd_backlight = true,
+};
+
 static const struct dmi_system_id huawei_quirks[] = {
 	{
 		.callback = dmi_matched,
@@ -145,6 +163,15 @@ static const struct dmi_system_id huawei_quirks[] = {
 		},
 		.driver_data = &quirk_matebook_x
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Huawei MACHC-WAX9",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HUAWEI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MACHC-WAX9"),
+		},
+		.driver_data = &quirk_kbd_backlight
+	},
 	{  }
 };
 
@@ -322,11 +349,52 @@ static void huawei_wmi_leds_setup(struct device *dev)
 	devm_led_classdev_register(dev, &huawei->cdev);
 }
 
+/* Keyboard backlight */
+
+static enum led_brightness huawei_wmi_kbd_backlight_get(struct led_classdev *led_cdev)
+{
+	u8 ret[HWMI_BUF_SIZE];
+
+	if (huawei_wmi_cmd(KBD_BACKLIGHT_GET, ret, sizeof(ret)))
+		return 0;
+
+	return ret[KBD_BACKLIGHT_GET_LEVEL_OFFSET] / KBD_BACKLIGHT_STEP;
+}
+
+static int huawei_wmi_kbd_backlight_set(struct led_classdev *led_cdev,
+					enum led_brightness brightness)
+{
+	union hwmi_arg arg;
+
+	arg.cmd = KBD_BACKLIGHT_SET;
+	arg.args[KBD_BACKLIGHT_SET_LEVEL_OFFSET] = brightness * KBD_BACKLIGHT_STEP;
+
+	return huawei_wmi_cmd(arg.cmd, NULL, 0);
+}
+
+static void huawei_wmi_kbd_backlight_setup(struct device *dev)
+{
+	struct huawei_wmi *huawei = dev_get_drvdata(dev);
+
+	if (!quirks || !quirks->kbd_backlight)
+		return;
+
+	if (huawei_wmi_cmd(KBD_BACKLIGHT_GET, NULL, 0))
+		return;
+
+	huawei->kbd_cdev.name = "platform::kbd_backlight";
+	huawei->kbd_cdev.max_brightness = KBD_BACKLIGHT_MAX;
+	huawei->kbd_cdev.brightness_get = &huawei_wmi_kbd_backlight_get;
+	huawei->kbd_cdev.brightness_set_blocking = &huawei_wmi_kbd_backlight_set;
+
+	devm_led_classdev_register(dev, &huawei->kbd_cdev);
+}
+
 /* Battery protection */
 
 static int huawei_wmi_battery_get(int *start, int *end)
 {
-	u8 ret[0x100];
+	u8 ret[HWMI_BUF_SIZE];
 	int err, i;
 
 	err = huawei_wmi_cmd(BATTERY_THRESH_GET, ret, sizeof(ret));
@@ -619,7 +687,7 @@ static int huawei_acpi_fn_lock_set(int on)
 
 static int huawei_wmi_fn_lock_get(int *on)
 {
-	u8 ret[0x100] = { 0 };
+	u8 ret[HWMI_BUF_SIZE] = { 0 };
 	int err, i;
 
 	/* Newer models: use direct ACPI \GFRS method */
@@ -627,7 +695,7 @@ static int huawei_wmi_fn_lock_get(int *on)
 		return huawei_acpi_fn_lock_get(on);
 
 	/* WMI fallback */
-	err = huawei_wmi_cmd(FN_LOCK_GET, ret, 0x100);
+	err = huawei_wmi_cmd(FN_LOCK_GET, ret, sizeof(ret));
 	if (err)
 		return err;
 
@@ -915,6 +983,7 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 		mutex_init(&huawei_wmi->wmi_lock);
 
 		huawei_wmi_leds_setup(&pdev->dev);
+		huawei_wmi_kbd_backlight_setup(&pdev->dev);
 		huawei_wmi_fn_lock_setup(&pdev->dev);
 		huawei_wmi_battery_setup(&pdev->dev);
 		huawei_wmi_debugfs_setup(&pdev->dev);

base-commit: 9d3475065167197742b0882aff21cf8e78393277
-- 
2.43.0

