Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AABD353A60;
	Fri, 24 Jul 2026 23:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784934073; cv=none; b=Dlh77L9Jx0E8li0NmZv2YjyfIO4F0+qAw9/nSiz+iNra4GZUgHR3heGNc6hI7dUAo4aeFbfdBQfHPELmTqXHN2uuzFRaMxQwZJbixUpGOId1JbVQsW9OtcEIRqTC4X0OPOeNc0PyOU1TW1fz6jA+uirlLZj9a5ghIHmwArqGvDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784934073; c=relaxed/simple;
	bh=XSHYcFqztNvce91XB5eoX5dukiXA+VeOkTAWgNpAeMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F6izPapmo2zgbr4fpj7zWu/uSR0CQFX+AdGXjA8LrGPlm4SPb4yRoirGLJC4Swk0CaokfyadcDs+vEbyIsImN260rHd2PBrw2PN7ZBnpg8gp/scsdR2alxe3rRoWEDQfQjrZ6P+6P7WmrJ08aSRfdSwUaJACYR38q7wDhTJnLWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=OzIWYYZY; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="OzIWYYZY"
Received: from wsembach-tuxedo.buero.augsburg.tuxedo.de (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 6205B2FC005D;
	Sat, 25 Jul 2026 01:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1784934062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DbewdLCm24mYmFqp5dW6m9l8v20wWUy80Hssmigru/w=;
	b=OzIWYYZY5C0PgBviHQJMi/uA2Ty9i9+KBxLaOCC5Mfqz4urmuxucasQuTsmoGEvvXfA5QD
	HI0tn2FPpfTGLkJR7Q92juEjhCauC+MJPwhiIRhDOGtoR4UcUSJYD8df973hxLfXUZ0LE4
	4z3WXzXckhvswURzUFXuRkdUp+Zr02U=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: uniwill-laptop: Fix brightness notify for 3 level keyboards
Date: Sat, 25 Jul 2026 01:00:22 +0200
Message-ID: <20260724230056.708736-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The devices with 3 brightness level keyboards seem to send
UNIWILL_OSD_KB_LED_LEVEL0, UNIWILL_OSD_KB_LED_LEVEL2, and
UNIWILL_OSD_KB_LED_LEVEL4 and not UNIWILL_OSD_KB_LED_LEVEL0,
UNIWILL_OSD_KB_LED_LEVEL1, and UNIWILL_OSD_KB_LED_LEVEL2 so this patch does
not return the brightness based on one of these events, but the brightness
read from hardware.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 22 +++------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 7a2eeaec4c961..d9a33be4f4a37 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1626,7 +1626,7 @@ static int uniwill_led_init(struct uniwill_data *data)
 							 &init_data);
 }
 
-static int uniwill_notify_kbd_led(struct uniwill_data *data, int brightness)
+static int uniwill_notify_kbd_led(struct uniwill_data *data)
 {
 	struct led_classdev *led_cdev;
 	int ret;
@@ -1643,7 +1643,7 @@ static int uniwill_notify_kbd_led(struct uniwill_data *data, int brightness)
 	if (ret < 0)
 		return ret;
 
-	led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
+	led_classdev_notify_brightness_hw_changed(led_cdev, led_cdev->brightness);
 
 	return 0;
 }
@@ -2215,30 +2215,14 @@ static int uniwill_notifier_call(struct notifier_block *nb, unsigned long action
 
 		return NOTIFY_OK;
 	case UNIWILL_OSD_KB_LED_LEVEL0:
-		if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
-			return NOTIFY_DONE;
-
-		return notifier_from_errno(uniwill_notify_kbd_led(data, 0));
 	case UNIWILL_OSD_KB_LED_LEVEL1:
-		if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
-			return NOTIFY_DONE;
-
-		return notifier_from_errno(uniwill_notify_kbd_led(data, 1));
 	case UNIWILL_OSD_KB_LED_LEVEL2:
-		if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
-			return NOTIFY_DONE;
-
-		return notifier_from_errno(uniwill_notify_kbd_led(data, 2));
 	case UNIWILL_OSD_KB_LED_LEVEL3:
-		if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
-			return NOTIFY_DONE;
-
-		return notifier_from_errno(uniwill_notify_kbd_led(data, 3));
 	case UNIWILL_OSD_KB_LED_LEVEL4:
 		if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
 			return NOTIFY_DONE;
 
-		return notifier_from_errno(uniwill_notify_kbd_led(data, 4));
+		return notifier_from_errno(uniwill_notify_kbd_led(data));
 	default:
 		mutex_lock(&data->input_lock);
 		sparse_keymap_report_event(data->input_device, action, 1, true);

base-commit: caf8342512c3056005f475d350eeca089c3c6623
-- 
2.43.0

