Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C465B345EA9;
	Fri, 16 Oct 2026 01:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792115521; cv=none; b=ejoj2vvztAJL0FYNhvmoQ4vxto43sBJs4dcj4fgKfhXFs6lJdO8IzNx4JHHlenEDNc5bPxAZLhHe8i9h1aDDpTaV9Tz+fJVXykU8a3Y0f6drwvVXPLigpaMQtG+/o/O5orUyy49mHrfzf4pCREZK55OV1rP/K41Oy731Gq8wIE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792115521; c=relaxed/simple;
	bh=ZT0I/kFBxVwxCCueKs5V2RHNnh1kbf7ID6w/rJbNKmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QDvDgJRLChqtseqlm1Ols2cSiW6kykfn9lWdzyd0RzPqY5gz+60ctUhnl0YN5ZpQ/PebMiv136YjLpY8p+okkbwGQ5vIg2Di1Y2Cc9ykklGzKjno+oGNkugRjzwi8E6gudJZ4vQc090zFjppZydXMEDXmmS/tzyQ93X3edhBsbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bogusta.com; spf=pass smtp.mailfrom=bogusta.com; dkim=pass (2048-bit key) header.d=bogusta.com header.i=@bogusta.com header.b=PnFjcZKl; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bogusta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bogusta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bogusta.com header.i=@bogusta.com header.b="PnFjcZKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bogusta.com;
	s=protonmail3; t=1792115515; x=1792374715;
	bh=AenpXWAYrKA7cxjqocTZK68lgeROxEPztY5XibpKiXY=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PnFjcZKlyeUPwE4iFpfAS1CumHb4lYRtmhpo5t4pDcA+wpv5//+1HsPMW38R+EsG9
	 8fmDuBQGZesSUY8x3tMla125ks32pOr/9XMtOy1BBlPWkMY8JzadiveCg0K65isjmu
	 eF6BE9fF/OYnkTMjk1plp4GGBqKgF6A+EjBuhL779XXtB4K66ByLJ4qOpF3wrRyQ1d
	 8Vp2uKv7gUp//QeJRWZbxtFa20aQCsCvg8C3XMX0xYKpiqjiIYDvbi7ipHJ6dRjfx2
	 BsZFw+bP0gqygzPynhfN7ZRQ4Re9DUZKC5FVJeVpfPwoBgta9q34ilSDrK/UGryKvw
	 tTLfnGOdUREuQ==
X-Pm-Submission-Id: 4j5Sbp4tBPz1DDXm
From: Alex Bogusta <alex@bogusta.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Antheas Kapenekakis <lkml@antheas.dev>
Cc: Alex Bogusta <alex@bogusta.com>,
	Denis Benato <benato.denis96@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-wmi: Clamp keyboard backlight level from hotkeys
Date: Thu, 15 Oct 2026 21:51:16 -0400
Message-ID: <20261016015117.32174-1-alex@bogusta.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pressing the keyboard backlight down key at level 0 drives the cached
level negative, so the backlight then needs one extra up press per
extra down press before it turns back on. brightness_hw_changed also
reports out-of-range values: 4 after pressing up at the maximum level,
and ENODATA or values like 4294967294 below 0.

kbd_led_set_by_kbd() stores the new level without clamping it, and
kbd_led_update_all() skips do_kbd_led_set() for negative levels and
notifies userspace with the unclamped value. The level is computed in
enum led_brightness, which is unsigned, so the subtraction at level 0
wraps around.

Compute the level as int and clamp it in kbd_led_set_by_kbd(), which
covers every hotkey path.

Fixes: fac55d29581f ("platform/x86: asus-wmi: Add support for multiple kbd led handlers")
Signed-off-by: Alex Bogusta <alex@bogusta.com>
---
 drivers/platform/x86/asus-wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 9fb3fe4b161c..599a73862903 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1949,10 +1949,10 @@ static int kbd_led_set(struct led_classdev *led_cdev, enum led_brightness value)
 	return 0;
 }
 
-static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
+static void kbd_led_set_by_kbd(struct asus_wmi *asus, int value)
 {
 	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
-		asus->kbd_led_wk = value;
+		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
 		asus->kbd_led_notify = true;
 	}
 	queue_work(asus->led_workqueue, &asus->kbd_led_work);
@@ -4668,9 +4668,9 @@ static int asus_wmi_get_event_code(union acpi_object *obj)
 
 static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 {
-	enum led_brightness led_value;
 	unsigned int key_value = 1;
 	bool autorelease = 1;
+	int led_value;
 
 	if (asus->driver->key_filter) {
 		asus->driver->key_filter(asus->driver, &code, &key_value,

base-commit: 98f039265e580291d5e76a11b2072541fbb1c393
-- 
2.56.0

