Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798492192F9
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 06:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785997172; cv=none; b=p5fEK/cCuQCdRD5ijheJ907vQx5vRXWOBR1aD6/JjBhAX865OHnPiFxibc83zuKGotuRPviwk0V/tdY0UJ7jxH+j6a0VwFyEhf5+Yu/DXm6UesGyB7oUgAnFQJiLKR5XU7Qk/Ve7jGcH3X2m2F9EEMeZem6hCcdawWXWfespc1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785997172; c=relaxed/simple;
	bh=rPYMNtFpW4fnWqOzNArxvN/JYK6ilLE3olGibsZNSXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TEeFkB4cziS4FI1c746RB+yFn0FKY+KA5+F4gB23zDA0kWc5nCeYUNM9r0wY4TUZLenVAc4ahTF7J8fy+guQLEJLCLt4XZcmZExt7CQ03AHVBHWkdOqeS52h4ygrl9qSl+CfeLi+wQ1U0EzZq+805p7exXoXXXVasPnWRHMJVhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5T49eqV; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5T49eqV"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1854174a91.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Aug 2026 23:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785997170; x=1786601970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQVjUVZztiP/u4Bq/VUn4gxKQ/LUo9/KMvQ5EsSjx5c=;
        b=R5T49eqVbcJHMpst5xdW0nnIotwbYVSzZxuQttMLpGHWKYPyVoPzgqzpVwJGxgXTnu
         L/baxBLtcGLMdpo3dj3rAdLMMOGY7pAPKI6XMMJe8hJVz/BuRTXvhBAcl609tgpwV1/B
         M6d9Zgxk8T8IKG9GNkuuAqUVNhVScxXLAf/p9CwyxRLsXZHnDtCk/PbMX7VbqXyUqQW4
         fThk+GaHk/JxaVbxwenRG/swumceC0plLkxXjOi6AZdiV0ewa2BrAgMkSRPgYOSf9YeU
         d2StnwXCkCxL9WciFV22zaRnKLy0iZoxcNnOvhf5QD4rSYx9t36xDcVDT4xAU8D/1agx
         vTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785997170; x=1786601970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQVjUVZztiP/u4Bq/VUn4gxKQ/LUo9/KMvQ5EsSjx5c=;
        b=CPbAHTg4POikJ9xPgd+xx4P1jU+aWIwKWkGdIwPgON93kkKGeq4J8/6CkOOhYzMwH1
         alSjiK7H+AhGPRl5abTO8wstAzd/czolXdrH+PRXbEfjgpZ1e+IyhWLP1aSd5h1hdmRw
         mKIAL00HSmH17yUtKNPiE/UolhJBRwgXB9hVcrg2+GZKzlBVIVMQNp9oHLTEy312rKZ8
         VXTBV8k3R5WTBhwOHjS/mBc/K3PeJ0O9+FEgMhG9Mdy0QVyUvBERKbKJoMQncBbsi19R
         az1rr4FInEsFJztqfqGrwnnodHKZEsVAkVK7j1/EwgvUofIUopwBuhosjS2sttq08Q22
         C8BA==
X-Forwarded-Encrypted: i=1; AHgh+RrIF9NQXXy/sZ+LqCYPbURvzJGu00fR1WYn+NjEzPwDbgDttwCkp+1D/IaoXaqwDoDZioRmVbswTe4BEbLQgvhM8BfR@vger.kernel.org
X-Gm-Message-State: AOJu0YyrqFKt56mq09VKyI44TDYPsihhRo4BXKnJ77otl7ktdRLCiA3T
	7FNqzArCzaMzGMNdVHh8rD8JWBId9l0yu1KENiF6Fau8dFaGwvoJ5jVj
X-Gm-Gg: AR+sD12wE0vruCv6jMjelYchv5D0wJMDfTHrtdcwRndfncBwcOCWWZvwxpa4dK6kKtX
	6Yo2/6qDN/acgezRQX6BytbwOBHYRz1vkAnHv7ewaOarE7W0/CVRNmh92P5C5ZZE3RbNc3KXbhI
	wNy1sRlYrwBjkhZR6BKsthQuKDOZenN/gIa1gYWBDqJlDgS9V2B1Jdq6eq1c8f2409jFYIyke00
	gUndwSqMdQlh9cAtsHpxQgDqE1384LPlxMAKaxU5WUJcOmk5LM3WC13rHOS4kqi92eTcy596I3Q
	cbNciSHRm1g2ut5Hh2lVnHfQzr9hw6GEnKeVS7n0lUQeLdAUBd9fMrCT+WoJcM2o9iJ3EwyON9p
	+NfJhRCBiH1EJh1MRBGD23AufN28eE2Q9Z5HA0a39g3scnp6JnN3VAiKO25A/34bxqIDZOcFFtY
	k5/Yy7zh4wUpsjXmQ15tcBCYWr8pFIt9ztMNy8ub0fBHfBYPYrkwc7a9corAE6Tnruhne3iEMZX
	gOHtEnEyXjHZElkxzXUDQP5SfjyHD31OC8mPdEjI8HEg7Rf2dA=
X-Received: by 2002:a17:90b:4d8c:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-3903c544f17mr10507240a91.6.1785997169680;
        Wed, 05 Aug 2026 23:19:29 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d081:36b2:965:e66f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca50acddsm21651689c88.3.2026.08.05.23.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:19:28 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nitin Joshi <nitjoshi@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] platform/x86: thinkpad_acpi: convert mutex_lock() to guard(mutex)
Date: Wed,  5 Aug 2026 23:19:22 -0700
Message-ID: <20260806061925.625482-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert straightforward mutex_lock() and mutex_unlock() usages for
hotkey_mutex, tpacpi_inputdev_send_mutex, kbdlight_mutex, lcdshadow_dev
lock, and dytc_mutex to guard(mutex) and scoped_guard(mutex) helpers
from linux/cleanup.h.

This improves code readability and ensures that mutexes are
automatically released when exiting their respective scopes.

Assisted-by: Antigravity:gemini-3.6-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 139 ++++++++------------
 1 file changed, 57 insertions(+), 82 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index f8e116e8a65d..beb85ea1103b 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -2164,7 +2164,7 @@ static int tpacpi_hotkey_driver_mask_set(const u32 mask)
 		return 0;
 	}
 
-	mutex_lock(&hotkey_mutex);
+	guard(mutex)(&hotkey_mutex);
 
 	HOTKEY_CONFIG_CRITICAL_START
 	hotkey_driver_mask = mask;
@@ -2177,8 +2177,6 @@ static int tpacpi_hotkey_driver_mask_set(const u32 mask)
 							~hotkey_source_mask);
 	hotkey_poll_setup(true);
 
-	mutex_unlock(&hotkey_mutex);
-
 	return rc;
 }
 
@@ -2202,15 +2200,12 @@ static void tpacpi_input_send_tabletsw(void)
 {
 	int state;
 
-	if (tp_features.hotkey_tablet &&
-	    !hotkey_get_tablet_mode(&state)) {
-		mutex_lock(&tpacpi_inputdev_send_mutex);
+	if (tp_features.hotkey_tablet && !hotkey_get_tablet_mode(&state)) {
+		guard(mutex)(&tpacpi_inputdev_send_mutex);
 
 		input_report_switch(tpacpi_inputdev,
 				    SW_TABLET_MODE, !!state);
 		input_sync(tpacpi_inputdev);
-
-		mutex_unlock(&tpacpi_inputdev_send_mutex);
 	}
 }
 
@@ -2235,7 +2230,6 @@ static int get_camera_shutter(void)
 
 static bool tpacpi_input_send_key(const u32 hkey, bool *send_acpi_ev)
 {
-	bool known_ev;
 	u32 scancode;
 
 	if (tpacpi_driver_event(hkey))
@@ -2278,11 +2272,8 @@ static bool tpacpi_input_send_key(const u32 hkey, bool *send_acpi_ev)
 		scancode = hkey;
 	}
 
-	mutex_lock(&tpacpi_inputdev_send_mutex);
-	known_ev = sparse_keymap_report_event(tpacpi_inputdev, scancode, 1, true);
-	mutex_unlock(&tpacpi_inputdev_send_mutex);
-
-	return known_ev;
+	guard(mutex)(&tpacpi_inputdev_send_mutex);
+	return sparse_keymap_report_event(tpacpi_inputdev, scancode, 1, true);
 }
 
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
@@ -2572,9 +2563,8 @@ static void hotkey_poll_setup(const bool may_warn)
 
 static void hotkey_poll_setup_safe(const bool may_warn)
 {
-	mutex_lock(&hotkey_mutex);
+	guard(mutex)(&hotkey_mutex);
 	hotkey_poll_setup(may_warn);
-	mutex_unlock(&hotkey_mutex);
 }
 
 static void hotkey_poll_set_freq(unsigned int freq)
@@ -3077,13 +3067,11 @@ static void tpacpi_send_radiosw_update(void)
 
 	/* Issue rfkill input event for WLSW switch */
 	if (!(wlsw < 0)) {
-		mutex_lock(&tpacpi_inputdev_send_mutex);
+		guard(mutex)(&tpacpi_inputdev_send_mutex);
 
 		input_report_switch(tpacpi_inputdev,
 				    SW_RFKILL_ALL, (wlsw > 0));
 		input_sync(tpacpi_inputdev);
-
-		mutex_unlock(&tpacpi_inputdev_send_mutex);
 	}
 
 	/*
@@ -3095,7 +3083,7 @@ static void tpacpi_send_radiosw_update(void)
 
 static void hotkey_exit(void)
 {
-	mutex_lock(&hotkey_mutex);
+	guard(mutex)(&hotkey_mutex);
 	hotkey_poll_stop_sync();
 	dbg_printk(TPACPI_DBG_EXIT | TPACPI_DBG_HKEY,
 		   "restoring original HKEY status and mask\n");
@@ -3105,8 +3093,6 @@ static void hotkey_exit(void)
 	      hotkey_mask_set(hotkey_orig_mask)) |
 	     hotkey_status_set(false)) != 0)
 		pr_err("failed to restore hot key mask to BIOS defaults\n");
-
-	mutex_unlock(&hotkey_mutex);
 }
 
 /*
@@ -3423,11 +3409,11 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	if (tp_features.hotkey_mask) {
 		/* hotkey_source_mask *must* be zero for
 		 * the first hotkey_mask_get to return hotkey_orig_mask */
-		mutex_lock(&hotkey_mutex);
-		res = hotkey_mask_get();
-		mutex_unlock(&hotkey_mutex);
-		if (res)
-			return res;
+		scoped_guard(mutex, &hotkey_mutex) {
+			res = hotkey_mask_get();
+			if (res)
+				return res;
+		}
 
 		hotkey_orig_mask = hotkey_acpi_mask;
 	} else {
@@ -3526,11 +3512,11 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		hotkey_exit();
 		return res;
 	}
-	mutex_lock(&hotkey_mutex);
-	res = hotkey_mask_set(((hotkey_all_mask & ~hotkey_reserved_mask)
-			       | hotkey_driver_mask)
-			      & ~hotkey_source_mask);
-	mutex_unlock(&hotkey_mutex);
+	scoped_guard(mutex, &hotkey_mutex) {
+		res = hotkey_mask_set(((hotkey_all_mask & ~hotkey_reserved_mask)
+				       | hotkey_driver_mask)
+				      & ~hotkey_source_mask);
+	}
 	if (res < 0 && res != -ENXIO) {
 		hotkey_exit();
 		return res;
@@ -3977,11 +3963,11 @@ static void hotkey_resume(void)
 {
 	tpacpi_disable_brightness_delay();
 
-	mutex_lock(&hotkey_mutex);
-	if (hotkey_status_set(true) < 0 ||
-	    hotkey_mask_set(hotkey_acpi_mask) < 0)
-		pr_err("error while attempting to reset the event firmware interface\n");
-	mutex_unlock(&hotkey_mutex);
+	scoped_guard(mutex, &hotkey_mutex) {
+		if (hotkey_status_set(true) < 0 ||
+		    hotkey_mask_set(hotkey_acpi_mask) < 0)
+			pr_err("error while attempting to reset the event firmware interface\n");
+	}
 
 	tpacpi_send_radiosw_update();
 	tpacpi_input_send_tabletsw();
@@ -5034,21 +5020,16 @@ static DEFINE_MUTEX(kbdlight_mutex);
 
 static int kbdlight_set_level(int level)
 {
-	int ret = 0;
-
 	if (!hkey_handle)
 		return -ENXIO;
 
-	mutex_lock(&kbdlight_mutex);
+	guard(mutex)(&kbdlight_mutex);
 
 	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
-		ret = -EIO;
-	else
-		kbdlight_brightness = level;
-
-	mutex_unlock(&kbdlight_mutex);
+		return -EIO;
 
-	return ret;
+	kbdlight_brightness = level;
+	return 0;
 }
 
 static int kbdlight_get_level(void)
@@ -10103,9 +10084,8 @@ static void lcdshadow_resume(void)
 	if (!lcdshadow_dev)
 		return;
 
-	mutex_lock(&lcdshadow_dev->lock);
+	guard(mutex)(&lcdshadow_dev->lock);
 	lcdshadow_set_sw_state(lcdshadow_dev, lcdshadow_dev->sw_state);
-	mutex_unlock(&lcdshadow_dev->lock);
 }
 
 static int lcdshadow_read(struct seq_file *m)
@@ -10137,9 +10117,8 @@ static int lcdshadow_write(char *buf)
 	if (state >= 2 || state < 0)
 		return -EINVAL;
 
-	mutex_lock(&lcdshadow_dev->lock);
-	res = lcdshadow_set_sw_state(lcdshadow_dev, state);
-	mutex_unlock(&lcdshadow_dev->lock);
+	scoped_guard(mutex, &lcdshadow_dev->lock)
+		res = lcdshadow_set_sw_state(lcdshadow_dev, state);
 
 	drm_privacy_screen_call_notifier_chain(lcdshadow_dev);
 
@@ -10603,26 +10582,26 @@ static const struct platform_profile_ops dytc_profile_ops = {
 static void dytc_profile_refresh(void)
 {
 	enum platform_profile_option profile;
-	int output = 0, err = 0;
+	int output = 0, err;
 	int perfmode, funcmode = 0;
 
-	mutex_lock(&dytc_mutex);
-	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
-		if (dytc_mmc_get_available)
-			err = dytc_command(DYTC_CMD_MMC_GET, &output);
-		else
-			err = dytc_cql_command(DYTC_CMD_GET, &output);
-		funcmode = DYTC_FUNCTION_MMC;
-	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
-		err = dytc_command(DYTC_CMD_GET, &output);
-		/* Check if we are PSC mode, or have AMT enabled */
-		funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
-	} else { /* Unknown profile mode */
-		err = -ENODEV;
+	scoped_guard(mutex, &dytc_mutex) {
+		if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
+			if (dytc_mmc_get_available)
+				err = dytc_command(DYTC_CMD_MMC_GET, &output);
+			else
+				err = dytc_cql_command(DYTC_CMD_GET, &output);
+			funcmode = DYTC_FUNCTION_MMC;
+		} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
+			err = dytc_command(DYTC_CMD_GET, &output);
+			/* Check if we are PSC mode, or have AMT enabled */
+			funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
+		} else { /* Unknown profile mode */
+			err = -ENODEV;
+		}
+		if (err)
+			return;
 	}
-	mutex_unlock(&dytc_mutex);
-	if (err)
-		return;
 
 	perfmode = (output >> DYTC_GET_MODE_BIT) & 0xF;
 	err = convert_dytc_to_profile(funcmode, perfmode, &profile);
@@ -11425,7 +11404,7 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		if (tp_features.kbdlight) {
 			enum led_brightness brightness;
 
-			mutex_lock(&kbdlight_mutex);
+			guard(mutex)(&kbdlight_mutex);
 
 			/*
 			 * Check the brightness actually changed, setting the brightness
@@ -11437,8 +11416,6 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 				led_classdev_notify_brightness_hw_changed(
 					&tpacpi_led_kbdlight.led_classdev, brightness);
 			}
-
-			mutex_unlock(&kbdlight_mutex);
 		}
 		/* Key events are suppressed by default hotkey_user_mask */
 		return false;
@@ -11460,11 +11437,11 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 			enum drm_privacy_screen_status old_hw_state;
 			bool changed;
 
-			mutex_lock(&lcdshadow_dev->lock);
-			old_hw_state = lcdshadow_dev->hw_state;
-			lcdshadow_get_hw_state(lcdshadow_dev);
-			changed = lcdshadow_dev->hw_state != old_hw_state;
-			mutex_unlock(&lcdshadow_dev->lock);
+			scoped_guard(mutex, &lcdshadow_dev->lock) {
+				old_hw_state = lcdshadow_dev->hw_state;
+				lcdshadow_get_hw_state(lcdshadow_dev);
+				changed = lcdshadow_dev->hw_state != old_hw_state;
+			}
 
 			if (changed)
 				drm_privacy_screen_call_notifier_chain(lcdshadow_dev);
@@ -11485,12 +11462,10 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 			pr_err("Error retrieving camera shutter state after shutter event\n");
 			return true;
 		}
-		mutex_lock(&tpacpi_inputdev_send_mutex);
-
-		input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, camera_shutter_state);
-		input_sync(tpacpi_inputdev);
-
-		mutex_unlock(&tpacpi_inputdev_send_mutex);
+		scoped_guard(mutex, &tpacpi_inputdev_send_mutex) {
+			input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, camera_shutter_state);
+			input_sync(tpacpi_inputdev);
+		}
 		return true;
 	case TP_HKEY_EV_DOUBLETAP_TOGGLE:
 		/* Toggle kernel-level doubletap event filtering */
-- 
2.55.0.679.g6767b8d81c-goog

