Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F2B1F3B8A
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Jan 2026 18:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767725359; cv=none; b=LSqGmCIwJ9XKSlthbV+Bo5tzJ596FTWVPjfSzkv808OzEFF0Z9morSfOb4DdfPSRcEuKV3HOegPxCqbaUA0hgqY9EB977G65UFL/rLX2zelR/uhHc2KCUWen+4gspIAOoTDTqGIJjC/cRn9JTdqmuab4HW6Azm8ONEmbCovI93Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767725359; c=relaxed/simple;
	bh=5g3j89AUcF3T4UnNYwh5mMiuDq6umcey1lO/UCuvFK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b10N1zIL5BO2FXwc7p8TDMLDZ1F40/d1Ogv6u7zwwlUvvLDXFedCAmdOebs8pEv5dQTf1ReQy1vmJ1g+HLPGsp35dFlVLhTM6JWHe6Rr7KfeTWrWEGm1wSzr6avNqwCbOMmWU7ZL00ch3nmGw+eMMh4v7ZIWaZIXeJgiJO0xOFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrmqo0h+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrmqo0h+"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29f2676bb21so13308115ad.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jan 2026 10:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767725357; x=1768330157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=733RHFZ8ODQc+M++uI2DUUGF6a1KumSXZE3mvD2jPyA=;
        b=hrmqo0h+OODTA4ISTh5WlF57FqGgm3fRlMWHdjUlUFZ7s+YX3NlneofUrAooj/zBJR
         tpn6s/Qrn5nNTw5g8u+xvromLCBnUvePdDBs8dgX8nYcqbajJntirpE+PiMpF/kLx46S
         aJQ+vc7lb+SIe+143Jbvjr1Ty0B2/I43SUngpEZjRzslgXUjnxXRHdYZITxSqPxWEoOj
         hBrzYJPupZ1jUAtW3+B+qdbpD6HtVccOHZj6EzFenuFwlVo0q6qIm3B3KPbTJmANSlN2
         lrcIZ6IelcgXbELJAGWv5jUAKpJwTEPd6A0/JUYTQc2KMT+KYBiqbQsO+xnK95qCA4LS
         wqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767725357; x=1768330157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=733RHFZ8ODQc+M++uI2DUUGF6a1KumSXZE3mvD2jPyA=;
        b=F4cHikl5luivv6rpZBf51ogDQe/eiZIdu/tnLewlANHq997P/ZwOCPmUU3X+vZs7Bt
         cHmb4WqN4PVrsH4ROpCZVLdqXUIBFDSMmkwH06y70CGzsSwlHMy2SEFIRmKwi9RV9Pmn
         2NEmqdxHUlWiQOFo7kQu1gUEH2LMILW4Mr2eWixRu024SBmyz11BMdtFrhc5LUGL+Gmt
         0NPD4a5cxQSyYYxOeYl/pziV38tKZvZq3GOfv6hDHWm43jR00tp8NlSbVrqJD+XHHRYG
         31WPmhuRs2VpS1V2AQ71mAXxAIMi0mJeCAXPnkqQDp0wWCisl7sclYOOnwVVMAB4SHwk
         MGKw==
X-Gm-Message-State: AOJu0YzG8u2+rVlcXywb8q2dvxpr35RV3iy8pZu+OUVMK81qakSqpmPs
	zlHqhlVszGOX4wtrQo793mwLKWDvjVKZvZCkw4C6QpOI2eZqpkd4s5QLmKOeng==
X-Gm-Gg: AY/fxX7CDzln+Il1ihSRfGbFG2DCnwTkNmzPUmfyW7Ze8ECh0J8AgawPXPbbIRxwLG4
	29MN3qAy1FL/zc3gPjPfp9XehrDMIgRnHEyfiIO4gCawGZ5XWSpXXRfIZRnWw/5/EaQi16GEZxj
	fRYfjurUFTLlOWMNjCC2GU2wklfkL1bPq/wsM3bP4m5z+yC2FcmyIi19Qx5tzO/VMB+wgSOhDkr
	BnZICi6Prifdzy1OfBiGepGHKF/Hm//H1dXOo23DyEdkHJ0ncgxjstqA9JQMojk76R7o5BvnEGG
	SK68RwgCgWFDs8xi1CBp2JyHsykqUHVz/EM7JEP5uWb5y8Wc4eZpXTkj43SpvkmkAe+EY8JIM8X
	8+WnX42/LT8REaF5DVk848yhdfGXBkoPzZzBYx99O79+v/oUIKUK3OFgmOvnNus9XS0d02PbDsu
	KFiCIwuiMk65cYMYYci+Q=
X-Google-Smtp-Source: AGHT+IEZnzxUxsnXeYsThUBXX71XgFJFWd9uzBZPLOJ3v1OT9t20gvIeFP9qUPod4j7iuJYpgam/eQ==
X-Received: by 2002:a17:903:1aac:b0:26c:2e56:ec27 with SMTP id d9443c01a7336-2a3e2d8badfmr35741505ad.19.1767725356801;
        Tue, 06 Jan 2026 10:49:16 -0800 (PST)
Received: from rivendell ([122.171.17.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c49037sm29157905ad.36.2026.01.06.10.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:49:16 -0800 (PST)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Benjamin Philip <benjamin.philip495@gmail.com>,
	Ike Panhc <ikepanhc@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH RESEND] platform/x86: ideadpad-laptop: Clean up style warnings and checks
Date: Wed,  7 Jan 2026 00:18:29 +0530
Message-ID: <20260106184830.34426-1-benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit makes some style changes to clean up the following
checkpatch warnings and checks at various places in ideapad.c:

- WARNING: quoted string split across lines
- WARNING: space prohibited between function name and open parenthesis '('
- WARNING: braces {} are not necessary for any arm of this statement
- CHECK: Alignment should match open parenthesis

We exceed the 80 column limit to fix the quoted string warning since
strings in question are user visible. See coding style, part 2 for
details.

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 39 ++++++++------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 5171a077f62c..3d8a8b4f3e86 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -219,38 +219,32 @@ MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for bluetooth.");
 static bool allow_v4_dytc;
 module_param(allow_v4_dytc, bool, 0444);
 MODULE_PARM_DESC(allow_v4_dytc,
-	"Enable DYTC version 4 platform-profile support. "
-	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
+		 "Enable DYTC version 4 platform-profile support. If you need this please report this to: platform-driver-x86@vger.kernel.org");
 
 static bool hw_rfkill_switch;
 module_param(hw_rfkill_switch, bool, 0444);
 MODULE_PARM_DESC(hw_rfkill_switch,
-	"Enable rfkill support for laptops with a hw on/off wifi switch/slider. "
-	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
+		 "Enable rfkill support for laptops with a hw on/off wifi switch/slider. If you need this please report this to: platform-driver-x86@vger.kernel.org");
 
 static bool set_fn_lock_led;
 module_param(set_fn_lock_led, bool, 0444);
 MODULE_PARM_DESC(set_fn_lock_led,
-	"Enable driver based updates of the fn-lock LED on fn-lock changes. "
-	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
+		 "Enable driver based updates of the fn-lock LED on fn-lock changes. If you need this please report this to: platform-driver-x86@vger.kernel.org");
 
 static bool ctrl_ps2_aux_port;
 module_param(ctrl_ps2_aux_port, bool, 0444);
 MODULE_PARM_DESC(ctrl_ps2_aux_port,
-	"Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. "
-	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
+		 "Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. If you need this please report this to: platform-driver-x86@vger.kernel.org");
 
 static bool touchpad_ctrl_via_ec;
 module_param(touchpad_ctrl_via_ec, bool, 0444);
 MODULE_PARM_DESC(touchpad_ctrl_via_ec,
-	"Enable registering a 'touchpad' sysfs-attribute which can be used to manually "
-	"tell the EC to enable/disable the touchpad. This may not work on all models.");
+		 "Enable registering a 'touchpad' sysfs-attribute which can be used to manually tell the EC to enable/disable the touchpad. This may not work on all models.");
 
 static bool ymc_ec_trigger __read_mostly;
 module_param(ymc_ec_trigger, bool, 0444);
 MODULE_PARM_DESC(ymc_ec_trigger,
-	"Enable EC triggering work-around to force emitting tablet mode events. "
-	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
+		 "Enable EC triggering work-around to force emitting tablet mode events. If you need this please report this to: platform-driver-x86@vger.kernel.org");
 
 /*
  * shared data
@@ -1446,7 +1440,7 @@ static void ideapad_check_special_buttons(struct ideapad_private *priv)
 		if (read_ec_data(priv->adev->handle, VPCCMD_R_SPECIAL_BUTTONS, &value))
 			return;
 
-	for_each_set_bit (bit, &value, 16) {
+	for_each_set_bit(bit, &value, 16) {
 		switch (bit) {
 		case 6:	/* Z570 */
 		case 0:	/* Z580 */
@@ -1706,11 +1700,10 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (WARN_ON(priv->kbd_bl.initialized))
 		return -EEXIST;
 
-	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type)) {
+	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type))
 		priv->kbd_bl.led.max_brightness = 2;
-	} else {
+	else
 		priv->kbd_bl.led.max_brightness = 1;
-	}
 
 	brightness = ideapad_kbd_bl_brightness_get(priv);
 	if (brightness < 0)
@@ -1752,7 +1745,7 @@ static enum led_brightness ideapad_fn_lock_led_cdev_get(struct led_classdev *led
 }
 
 static int ideapad_fn_lock_led_cdev_set(struct led_classdev *led_cdev,
-	enum led_brightness brightness)
+					enum led_brightness brightness)
 {
 	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, fn_lock.led);
 
@@ -1928,7 +1921,7 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 
 	vpc1 = (vpc2 << 8) | vpc1;
 
-	for_each_set_bit (bit, &vpc1, 16) {
+	for_each_set_bit(bit, &vpc1, 16) {
 		switch (bit) {
 		case 13:
 		case 11:
@@ -2142,14 +2135,14 @@ static const enum power_supply_property ideapad_power_supply_props[] = {
 	}
 
 DEFINE_IDEAPAD_POWER_SUPPLY_EXTENSION(ideapad_battery_ext_v1,
-	(BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
-	 BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
+				      (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
+				       BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
 );
 
 DEFINE_IDEAPAD_POWER_SUPPLY_EXTENSION(ideapad_battery_ext_v2,
-	(BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
-	 BIT(POWER_SUPPLY_CHARGE_TYPE_FAST) |
-	 BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
+				      (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
+				       BIT(POWER_SUPPLY_CHARGE_TYPE_FAST) |
+				       BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
 );
 
 static int ideapad_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
-- 
2.52.0

