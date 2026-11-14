Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679054;
	b=SdiA3doUgIisURUknjDTJq0VFJY/X1owuXDF5v5B7wawilkMa7Pm/kMCQZNJza2f7IOG
	 npSlzWqamFxil7USn7N1ax9XuGtMYFjsSLNG3fet2cozAWmZiq346V8VzXx/DsLS39Sou
	 0aIk9J1HjwXWqtfM0OKPmUsfABfqU1jXf+yPD8HLk7YR2oFbl0Q56QeBZ1/7KaDPL+iRI
	 vrelPitFYdDQREcIpGyq9qcsjPd/jIjsLeJPU3KYJ2Dbc18LBKSv6MO7qTIp69OxNllEv
	 iC0E1x8oloRYVY+kcUPCaretjpVt3GkzI75KIXMGUxZ+96vPtZU3wCs/RqF6OY+qLNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xexT32b++P63Qg/vKMFv1ENvmxzi9j6U24h8xqE2KiQ=;
	b=q4kI/R9NKApNHZb6BtmNQ/OqtEJDJz1UdFDacSicMaes8Dq4aozmYb0MHwKd07tjEgYl
	 Yg6eCWA0isXaJ8jzgnuiLzO7dlHKWxsEJk/NYL0HHYbzrs469lEfw+cyFiqTBi7zIIKpc
	 zZGw0vZR4jkcqlOBwkbrCtOk1s7Y+bzXwozTV+l5Zt09Telf/+zrWxY9d1AvfijlEvilM
	 vJspNDbFVSeuySf4Nyh59YntKihxaUYSqf30DGoifwu9gg85uHwBMvNOHPMbs4d326qDm
	 6En1XXU6A2I7j8r311OcRLLs9qAmFAvzCOf2Pm0zhLK67fNzK9jCA6syIOad8nAwVRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jVG2v7ra;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D387606A329
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 17:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D387606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jVG2v7ra
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3b1478f06e3so456115a91.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 09:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679054; x=1795283854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xexT32b++P63Qg/vKMFv1ENvmxzi9j6U24h8xqE2KiQ=;
        b=jVG2v7raC3Y6+wWxdvRPKDjCVPRy2RfvwFXYJcAbX4S3uywIgYcnzZPgcnnTX3WqXP
         YUaUEwwuCu0t6f/NCleCVMlJjZG5lluubrze4NLZotwZObd4QqsIN8rZYPS1BXpo5j+d
         Bea2MFi3/f/sunbMOpZU0AM5eCYKq8NjMTZjPMTByWT59kWdmqS9xC2WTK4f7eki7ONd
         u+K3L/KGEApmtArGw47jsEOtbLa+djBg9CpFGYjbty2AywlQYgJ0yYuihZXab+Z+najt
         xaZWiibUqreW8cj/ywsAbG139sL2S79gj9jYTpN800/NNaRqysugze/JKAj/CbedmUEC
         wbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679054; x=1795283854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xexT32b++P63Qg/vKMFv1ENvmxzi9j6U24h8xqE2KiQ=;
        b=NeCZG+QzpBZQ/kLaOSserOKDDuVrsgz8iueTvG0807p3dlMXTTNt2J8ogIn6uBo/Gf
         GcvR+yPsSCm8nU1u9f+EC4fw11uR0S5f2xLeCMHusi5EQyWYGs4zZBk3JnRcQLvGhTGg
         bJvtIuwR9TOrw18Uoq89s5Klykobw1ZbI7GH57T1dKH0f+qJsy5RKCdIlpzLZBHQJ0n4
         0WQG7WkLYD07IaHUgg2ZC0sDooXN/PpEtb0uOqbcyg1sJY23ZMCb7yYZLynAY1QuWMYZ
         RW5xYERdt4nQqiscbeIO5ho956TqF18URb+yCInnqf9HSCKlloO85wMxW95pO9dpTca2
         6+vA==
X-Forwarded-Encrypted: i=1; AL+hErGjRemMjVuX8GaZ19J+dbJveUsPCDARlbrvhyvuEEHMTPKGjE5OUuYww+Dh4KfdOyEruwqNZMufQY9pdK1C2MYcyf+v@vger.kernel.org
X-Gm-Message-State: APuU4Z9wtOJFrtDo1SW5bVMMC0IReGmZwYmln4kF/dEuUtpdp7P8l6Q8
	boEl0j/9P3kGMQsZxwplv+5QwnWPuy7svnkMP6wJyjzhmpE8Mlk9D47h
X-Gm-Gg: AYBFou3pw/PXXGolyfFWJX24b2wdQwBf1UQkvClgzzV7tI5visHMdjcXasry/qf5d0x
	oH8NkfVCqQYIpWdc/wZxpRoqyGKqEJZI1UKf8k7y1p+5L/0OqG1nZEf+G5YpvjWUcr991P3xuop
	BskxNiDaj+G2X/nIgrbwLbUJV+OuY6P5obVmOPWAyqF9WeM/pyPJCLLC5iV9ZVE7bjWh3g85zQa
	ZjLs9kKhebopUmXa5fOCwa3yrsZ0/E8rB7r/HDM9XlG1Rgpjn+IJ/dxjsO9FgvD8svY5lcqP9kR
	1yMLlwH4/3euc+RchatwhtBGhRmNmyWHAUIdmooNIJ9EC+sD2uHiP3GEpt/o9ANc5MWrRB+vNdA
	he0UFRy9gO+4feJGKilzJrFN2aBK5HUCSH6wGiGTOZJfmU+kKubOAra5XE2N1knIzr4V7iRDu+N
	FEh/+yvhv3JgGmN7ZBQkP3LFXcYtWoE1T77qoM7qyaUIkSls2MPCwj2Tl10F1YvzZehQf2LitA+
	MqVFl8rLvzQzBgbbG2FQVlQAPcC1/Q0W+AIxot3IdjNDWQO8i1y0wS7IfGysdFiMAqjSOo23ZSa
	nP6VUK4zMteOv3NNs/ZxFWMrSvMq5ZVOLplufWM2xx/AS3C+Cg==
X-Received: by 2002:a17:90b:54cb:b0:3b0:ce1c:e74f with SMTP id 98e67ed59e1d1-3b1b0a3a251mr5485220a91.27.1794679053536;
        Sat, 14 Nov 2026 09:57:33 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:57:33 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [PATCH v3 6/7] platform/x86: thinkpad_acpi: Add support for auto keyboard backlight
Date: Sun, 15 Nov 2026 01:48:13 +0800
Message-ID: <20261114174814.62153-7-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114174814.62153-1-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
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

Wire the EC keyboard backlight auto mode (level 3) up as a private
hardware control trigger, named "tpacpi-kbd-auto", on top of the LED
hw control trigger framework.  On machines that support auto mode
(MLCG bit 20) the trigger is registered and set as the LED's trigger
type.

Selecting the trigger switches the backlight to auto mode; the
offloaded state is derived from the cached EC level.  When Fn+Space
cycles into or out of auto mode, the driver notifies the trigger core,
so the trigger state shown in the trigger sysfs attribute follows
hardware-initiated transitions.  If the EC is already in auto mode at
driver initialization, the trigger is set as the default one.  Writing
a regular level through either sysfs or proc leaves auto mode, and the
trigger is dropped by the LED core.

Registering the trigger is allowed to fail; basic backlight control
keeps working in that case.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/Kconfig         |  1 +
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 95 +++++++++++++++++++--
 2 files changed, 89 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 516594993..77d159a3a 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -83,6 +83,7 @@ config THINKPAD_ACPI
 	select NVRAM
 	select NEW_LEDS
 	select LEDS_CLASS
+	select LEDS_TRIGGERS
 	select INPUT_SPARSEKMAP
 	help
 	  This is a driver for the IBM and Lenovo ThinkPad laptops. It adds
diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index f9e2d324d..f11e61417 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5106,7 +5106,12 @@ static struct ibm_struct video_driver_data = {
 /* EC level that selects the auto mode for the keyboard backlight */
 #define TPACPI_KBD_LIGHT_AUTO_LEVEL 3
 
-static enum led_brightness kbdlight_brightness;
+/*
+ * Cached EC level, including TPACPI_KBD_LIGHT_AUTO_LEVEL.  All state
+ * tracking compares EC levels; the auto mode is translated to a
+ * brightness value only when reporting to the LED core.
+ */
+static int kbdlight_brightness;
 static DEFINE_MUTEX(kbdlight_mutex);
 
 /*
@@ -5191,6 +5196,38 @@ static bool kbdlight_is_supported(void)
 	return status & BIT(9);
 }
 
+static struct led_hw_trigger_type kbdlight_auto_trigger_type;
+
+static enum led_brightness kbdlight_level_to_brightness(int level)
+{
+	/* Auto mode is not a brightness level; report it as off. */
+	if (level == TPACPI_KBD_LIGHT_AUTO_LEVEL)
+		return 0;
+
+	return level;
+}
+
+static int kbdlight_auto_trigger_activate(struct led_classdev *led_cdev)
+{
+	guard(mutex)(&kbdlight_mutex);
+
+	return kbdlight_set_level(TPACPI_KBD_LIGHT_AUTO_LEVEL);
+}
+
+static bool kbdlight_auto_trigger_hw_offloaded(struct led_classdev *led_cdev)
+{
+	guard(mutex)(&kbdlight_mutex);
+
+	return kbdlight_brightness == TPACPI_KBD_LIGHT_AUTO_LEVEL;
+}
+
+static struct led_trigger kbdlight_auto_trigger = {
+	.name		= "tpacpi-kbd-auto",
+	.trigger_type	= &kbdlight_auto_trigger_type,
+	.activate	= kbdlight_auto_trigger_activate,
+	.hw_offloaded	= kbdlight_auto_trigger_hw_offloaded,
+};
+
 static int kbdlight_set_level_and_update(int level);
 
 static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
@@ -5204,11 +5241,11 @@ static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
 	int level;
 
 	level = kbdlight_get_level();
-	/* Auto mode is not a brightness level; report it as off. */
-	if (level < 0 || level == TPACPI_KBD_LIGHT_AUTO_LEVEL)
+
+	if (level < 0)
 		return 0;
 
-	return level;
+	return kbdlight_level_to_brightness(level);
 }
 
 static struct tpacpi_led_classdev tpacpi_led_kbdlight = {
@@ -5235,9 +5272,37 @@ static int __init kbdlight_init(struct ibm_init_struct *iibm)
 		return -ENODEV;
 	}
 
-	kbdlight_brightness = kbdlight_sysfs_get(NULL);
+	kbdlight_brightness = kbdlight_get_level();
+	if (kbdlight_brightness < 0)
+		kbdlight_brightness = 0;
+
 	tp_features.kbdlight = 1;
 
+	if (tp_features.kbdlight_auto) {
+		rc = devm_led_trigger_register(&tpacpi_pdev->dev,
+					       &kbdlight_auto_trigger);
+		if (rc) {
+			/*
+			 * Auto-mode trigger unavailable; basic backlight
+			 * control keeps working.
+			 */
+			dev_warn(&tpacpi_pdev->dev,
+				 "auto-mode trigger unavailable\n");
+		} else {
+			struct led_classdev *led_cdev =
+				&tpacpi_led_kbdlight.led_classdev;
+
+			led_cdev->flags |= LED_TRIG_HW_CHANGED;
+			led_cdev->trigger_type = &kbdlight_auto_trigger_type;
+			led_cdev->hw_control_trigger =
+				kbdlight_auto_trigger.name;
+
+			if (kbdlight_brightness == TPACPI_KBD_LIGHT_AUTO_LEVEL)
+				led_cdev->default_trigger =
+					kbdlight_auto_trigger.name;
+		}
+	}
+
 	rc = led_classdev_register(&tpacpi_pdev->dev,
 				   &tpacpi_led_kbdlight.led_classdev);
 	if (rc < 0) {
@@ -5347,6 +5412,8 @@ static void kbdlight_resume(void)
 static void kbdlight_notify_level(int level)
 {
 	struct led_classdev *led_cdev = &tpacpi_led_kbdlight.led_classdev;
+	bool is_auto, was_auto;
+	int brightness;
 
 	/*
 	 * Check the brightness actually changed, setting the brightness
@@ -5355,15 +5422,29 @@ static void kbdlight_notify_level(int level)
 	if (level == kbdlight_brightness)
 		return;
 
+	is_auto = level == TPACPI_KBD_LIGHT_AUTO_LEVEL;
+	was_auto = kbdlight_brightness == TPACPI_KBD_LIGHT_AUTO_LEVEL;
+
+	if (is_auto != was_auto)
+		led_trigger_notify_hw_control_changed(led_cdev, is_auto);
+
 	kbdlight_brightness = level;
-	led_classdev_notify_brightness_hw_changed(led_cdev, level);
+	brightness = kbdlight_level_to_brightness(level);
+
+	led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
 }
 
 static void kbdlight_notify_change(void)
 {
+	int level;
+
 	guard(mutex)(&kbdlight_mutex);
 
-	kbdlight_notify_level(kbdlight_sysfs_get(NULL));
+	level = kbdlight_get_level();
+	if (level < 0)
+		return;
+
+	kbdlight_notify_level(level);
 }
 
 static struct ibm_struct kbdlight_driver_data = {
-- 
2.56.1

