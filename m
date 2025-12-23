Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D3C30EF72
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 12:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766493910; cv=none; b=ij23cXV0E+C5coLPNbIQN9ozsDQC24PACzMtndLyt6ADXBKroqHetFUzg0IUnfpDPzXAdSJd+a5PmasBPZnRf8Day6iHXQDzZgKppDtVSVWp7877Gk37M9h3PFa0z8xNS8EmZNL4xAIElMWDfdFsJVvy+pRpXNbqSzYsUnTGskc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766493910; c=relaxed/simple;
	bh=K4iZKV6Sumq97XEJ1kg03JoVRXPiTqSDK/Hm5dzNf4w=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=AF/nKu1HBwptp09i8KEnea1WlFkCFGQZ56LPinbVJ+w/7kwmw54qBuk6x6/Skjc5MYlWtFJrWyieogXK9CASjFz7JNDdDsYpVfoKpllvRCn8Zb0mPukrTE3a+i3xgtcXfM8G/xHYx9JqWNQ8tkIqlcmcQwsNPlh/1imuvx91eVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNKFgIOZ; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNKFgIOZ"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37a3340391cso38992901fa.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 04:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766493907; x=1767098707; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5719znsWU4nhuGJrAbQLtf94jfir7/Dv6FX2HBWtA0Y=;
        b=CNKFgIOZkoG54HSxc1EL6v+yeY/D/UU4nrVHIJ8RhwbRlF/ioqCkuAenAhMnfZWzaF
         mOWkCTFo7t7j2uFFG5FrVpvpVwb44OtFzuj/n4U0I/YrQlQeLcyR8uEGi+3iKf0YVhKN
         bYpIR2HS30YkY33MyTv0gB8D3HpWgvXDJmgDp+e9h0iQ360CKOlrl4iXBmxC29vevlxN
         gf9hMzDdU0ZgGymDcGraxsLLa8Hzc34odwwTCGtIZWSR/ccnMO91JtgvEVXqXdpFxErY
         TFM42FWTcc0eDyKzDXuF/bps+izd0dTPLYhZYFOOhqkmoPQeVONG1YV5H//i1hUq7Ipq
         /Oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766493907; x=1767098707;
        h=cc:to:subject:message-id:date:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5719znsWU4nhuGJrAbQLtf94jfir7/Dv6FX2HBWtA0Y=;
        b=swsd0HKyKfGqR8adFAv9b98b47zyoYGsrTzQ0JfOm6ND8MtxTpRlQfSct+tFv/1jHr
         Xo9AZPshB7/pNF9mjvlG+MF4KPySlvmQdLVkFgOZdVgVvO6LeuHG7nF1EYsgqubDTH9r
         CTCuhfI3q9RnEUGByWjiEeJnrwlg9Akdz1R5dofbkwTS+zHxMdca7aUiN+VlJ3nVwBHH
         g1beLXZM9oGlWx9/M9OrVtJ0uWuDg/8qel9hjnZLw5FzEKw9dIPfon24SgAThQZL1+mp
         4FZZxoQSr/jCuVyRwH2SQRXy2h4zrt690lHDSdbtoFamMB4xIk1dPBhLD+EPAl/hJY4m
         ozVA==
X-Gm-Message-State: AOJu0YySpHZH/AgWBQakfgn64pOVLzOYuhbeX75ZsRqpOQVEmTQPBnlI
	LlbLOQlcFJi7gfEUKF62zniSy4TNlqtc3zu3z8X3EZS+dvIKDGLMekHMJZPE3R2e9Aa7XjTXNwp
	anhifOBf99g7TNCzCpeWJ7+oDOKX2lgQE2eeZ
X-Gm-Gg: AY/fxX4czG8K/T+VjXxWf1w8JwCJvFF7e6ksS0AMZjAgMl3tnvqy89RVwA6nI4/oIib
	+jNk8QT9dHRH0sfvsCpigqL3pqa33GlKuXYG5cgoGBF02jpSoNGG221afHT3G/AFSdWqV3oj4bG
	dwUaCUuNV8DfdLbOW4tDRBgzc/RT9z2GbMEJCxumaPUfJu1BpcvnJxt8XKyB0ytvNMNDg5AEgad
	xxgMOb9B+Mw8Bh7ZahWZmLMUEwuESC7y7xlvGEpZFmphqDMry8zGi4tBb93mxkk/lLB+qs=
X-Google-Smtp-Source: AGHT+IF2lEbpbWAKaFHtJSxADIbTHZcQwu25zLGwccYDum+H8nSG1G44DzV0vgTfr06n7DtUi4pVo5Zh6u3LOc1BWKU=
X-Received: by 2002:a05:651c:2125:b0:37b:a4e2:4407 with SMTP id
 38308e7fff4ca-3812167ad49mr36012151fa.43.1766493906460; Tue, 23 Dec 2025
 04:45:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 12:45:05 +0000
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 12:45:05 +0000
From: Benjamin Philip <benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 23 Dec 2025 12:45:05 +0000
X-Gm-Features: AQt7F2oL9hoOl9VpeGbDK4aQJTlT9lGi-QjjCje2LUZzjoDEvq5trW6hGF7f4Ew
Message-ID: <CAMEXYWdoXFJM96gE=JLVtrP7YeAdWwO+NmDFqfsy_pk49PreYg@mail.gmail.com>
Subject: [PATCH] platform/x86: ideadpad-laptop: Clean up style warnings and checks
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Benjamin Philip <benjamin.philip495@gmail.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Ike Panhc <ikepanhc@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

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

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c
b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 5171a077f62c..3d8a8b4f3e86 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -219,38 +219,32 @@ MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for
bluetooth.");
 static bool allow_v4_dytc;
 module_param(allow_v4_dytc, bool, 0444);
 MODULE_PARM_DESC(allow_v4_dytc,
-	"Enable DYTC version 4 platform-profile support. "
-	"If you need this please report this to:
platform-driver-x86@vger.kernel.org");
+		 "Enable DYTC version 4 platform-profile support. If you need this
please report this to: platform-driver-x86@vger.kernel.org");

 static bool hw_rfkill_switch;
 module_param(hw_rfkill_switch, bool, 0444);
 MODULE_PARM_DESC(hw_rfkill_switch,
-	"Enable rfkill support for laptops with a hw on/off wifi switch/slider. "
-	"If you need this please report this to:
platform-driver-x86@vger.kernel.org");
+		 "Enable rfkill support for laptops with a hw on/off wifi
switch/slider. If you need this please report this to:
platform-driver-x86@vger.kernel.org");

 static bool set_fn_lock_led;
 module_param(set_fn_lock_led, bool, 0444);
 MODULE_PARM_DESC(set_fn_lock_led,
-	"Enable driver based updates of the fn-lock LED on fn-lock changes. "
-	"If you need this please report this to:
platform-driver-x86@vger.kernel.org");
+		 "Enable driver based updates of the fn-lock LED on fn-lock
changes. If you need this please report this to:
platform-driver-x86@vger.kernel.org");

 static bool ctrl_ps2_aux_port;
 module_param(ctrl_ps2_aux_port, bool, 0444);
 MODULE_PARM_DESC(ctrl_ps2_aux_port,
-	"Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. "
-	"If you need this please report this to:
platform-driver-x86@vger.kernel.org");
+		 "Enable driver based PS/2 aux port en-/dis-abling on touchpad
on/off toggle. If you need this please report this to:
platform-driver-x86@vger.kernel.org");

 static bool touchpad_ctrl_via_ec;
 module_param(touchpad_ctrl_via_ec, bool, 0444);
 MODULE_PARM_DESC(touchpad_ctrl_via_ec,
-	"Enable registering a 'touchpad' sysfs-attribute which can be used
to manually "
-	"tell the EC to enable/disable the touchpad. This may not work on
all models.");
+		 "Enable registering a 'touchpad' sysfs-attribute which can be used
to manually tell the EC to enable/disable the touchpad. This may not
work on all models.");

 static bool ymc_ec_trigger __read_mostly;
 module_param(ymc_ec_trigger, bool, 0444);
 MODULE_PARM_DESC(ymc_ec_trigger,
-	"Enable EC triggering work-around to force emitting tablet mode events. "
-	"If you need this please report this to:
platform-driver-x86@vger.kernel.org");
+		 "Enable EC triggering work-around to force emitting tablet mode
events. If you need this please report this to:
platform-driver-x86@vger.kernel.org");

 /*
  * shared data
@@ -1446,7 +1440,7 @@ static void ideapad_check_special_buttons(struct
ideapad_private *priv)
 		if (read_ec_data(priv->adev->handle, VPCCMD_R_SPECIAL_BUTTONS, &value))
 			return;

-	for_each_set_bit (bit, &value, 16) {
+	for_each_set_bit(bit, &value, 16) {
 		switch (bit) {
 		case 6:	/* Z570 */
 		case 0:	/* Z580 */
@@ -1706,11 +1700,10 @@ static int ideapad_kbd_bl_init(struct
ideapad_private *priv)
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
@@ -1752,7 +1745,7 @@ static enum led_brightness
ideapad_fn_lock_led_cdev_get(struct led_classdev *led
 }

 static int ideapad_fn_lock_led_cdev_set(struct led_classdev *led_cdev,
-	enum led_brightness brightness)
+					enum led_brightness brightness)
 {
 	struct ideapad_private *priv = container_of(led_cdev, struct
ideapad_private, fn_lock.led);

@@ -1928,7 +1921,7 @@ static void ideapad_acpi_notify(acpi_handle
handle, u32 event, void *data)

 	vpc1 = (vpc2 << 8) | vpc1;

-	for_each_set_bit (bit, &vpc1, 16) {
+	for_each_set_bit(bit, &vpc1, 16) {
 		switch (bit) {
 		case 13:
 		case 11:
@@ -2142,14 +2135,14 @@ static const enum power_supply_property
ideapad_power_supply_props[] = {
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

 static int ideapad_battery_add(struct power_supply *battery, struct
acpi_battery_hook *hook)
-- 
2.52.0
