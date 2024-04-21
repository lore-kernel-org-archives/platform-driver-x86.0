Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458073D66
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714342; cv=none; b=Vkbstft4kE5n5yGCFlZ3kg4EBQheJWzDXyOYioUiMV9ouI0U2lLXJaTwMLgov5SEwIJrvIZuZ3fowJbyQytP7nRNzCw2ggL9qdE7ojHVHl7vVgCDYFmCrMK8SN49IXjEzW0ZsMyM/lrxxoXHRpTka1OUqO2enXcAUJOjThC3h/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714342; c=relaxed/simple;
	bh=nrx7tzZtMQ8lY4Vh0wEzhi5M/T34DmhMxsxfxtFbzRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rURTKwiZ29D0FlGN4711QdhbvpvIJ6dikbWbCOgnTXUs6BDVcPOkg+9SMlhj0y2h4pmLPV0JaiGFUjxs39SjmIJiCA7Ey6pNCagfE48twU1brS3zBhArNnQWgV4/M/oGLw6RCkexlwIj7Q5/sxztFEBnnB3mY4r56++cF2Jaxco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g3/w8/Bn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g3/w8/Bn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fuG5/FiMeJxxWLVKewZftLA5M7sA1AJN6R27AAxM6lk=;
	b=g3/w8/BnRmgHDZXiJedDcQRX/LHtBRE0weGUtOklHWeGK2StSHE8pAmH2xaLTBLqx9kXpj
	nQi3vVQ+Nh865fjqsws7sfK1dueNFfrA6mDIpf4Tc1JBNb0elYPhZ0GlEN9S2Jfqxz54bL
	8i8iSNEUrh0VIn3TsF+frXoCTElYJPw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-GNHxUrG_MAWYizY2M7oFFw-1; Sun, 21 Apr 2024 11:45:36 -0400
X-MC-Unique: GNHxUrG_MAWYizY2M7oFFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E0E01011351;
	Sun, 21 Apr 2024 15:45:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4265D40357A7;
	Sun, 21 Apr 2024 15:45:35 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Nitin Joshi <njoshi1@lenovo.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 07/24] platform/x86: thinkpad_acpi: Make tpacpi_driver_event() return if it handled the event
Date: Sun, 21 Apr 2024 17:45:03 +0200
Message-ID: <20240421154520.37089-8-hdegoede@redhat.com>
In-Reply-To: <20240421154520.37089-1-hdegoede@redhat.com>
References: <20240421154520.37089-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

tpacpi_driver_event() already only responds to hkey events which it knows
about. Make it return a bool and return true when it has handled the event.

This avoids the need to list TP_HKEY_EV_foo values to which it responds
both in its caller and in the function itself.

Instead callers can now call it unconditionally and check the return value.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 115 ++++++++++++++-------------
 1 file changed, 61 insertions(+), 54 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index c009885c8820..0bbc462d604c 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1918,7 +1918,7 @@ static u32 hotkey_acpi_mask;		/* events enabled in firmware */
 
 static u16 *hotkey_keycode_map;
 
-static void tpacpi_driver_event(const unsigned int hkey_event);
+static bool tpacpi_driver_event(const unsigned int hkey_event);
 static void hotkey_driver_event(const unsigned int scancode);
 static void hotkey_poll_setup(const bool may_warn);
 
@@ -3726,13 +3726,8 @@ static bool adaptive_keyboard_hotkey_notify_hotkey(const u32 hkey)
 
 static bool hotkey_notify_extended_hotkey(const u32 hkey)
 {
-	switch (hkey) {
-	case TP_HKEY_EV_PRIVACYGUARD_TOGGLE:
-	case TP_HKEY_EV_AMT_TOGGLE:
-	case TP_HKEY_EV_PROFILE_TOGGLE:
-		tpacpi_driver_event(hkey);
+	if (tpacpi_driver_event(hkey))
 		return true;
-	}
 
 	if (hkey >= TP_HKEY_EV_EXTENDED_KEY_START &&
 	    hkey <= TP_HKEY_EV_EXTENDED_KEY_END) {
@@ -11081,72 +11076,84 @@ static struct platform_driver tpacpi_hwmon_pdriver = {
  * HKEY event callout for other subdrivers go here
  * (yes, it is ugly, but it is quick, safe, and gets the job done
  */
-static void tpacpi_driver_event(const unsigned int hkey_event)
+static bool tpacpi_driver_event(const unsigned int hkey_event)
 {
-	if (ibm_backlight_device) {
-		switch (hkey_event) {
-		case TP_HKEY_EV_BRGHT_UP:
-		case TP_HKEY_EV_BRGHT_DOWN:
+	switch (hkey_event) {
+	case TP_HKEY_EV_BRGHT_UP:
+	case TP_HKEY_EV_BRGHT_DOWN:
+		if (ibm_backlight_device)
 			tpacpi_brightness_notify_change();
-		}
-	}
-	if (alsa_card) {
-		switch (hkey_event) {
-		case TP_HKEY_EV_VOL_UP:
-		case TP_HKEY_EV_VOL_DOWN:
-		case TP_HKEY_EV_VOL_MUTE:
-			volume_alsa_notify_change();
-		}
-	}
-	if (tp_features.kbdlight && hkey_event == TP_HKEY_EV_KBD_LIGHT) {
-		enum led_brightness brightness;
-
-		mutex_lock(&kbdlight_mutex);
-
 		/*
-		 * Check the brightness actually changed, setting the brightness
-		 * through kbdlight_set_level() also triggers this event.
+		 * Key press events are suppressed by default hotkey_user_mask
+		 * and should still be reported if explicitly requested.
 		 */
-		brightness = kbdlight_sysfs_get(NULL);
-		if (kbdlight_brightness != brightness) {
-			kbdlight_brightness = brightness;
-			led_classdev_notify_brightness_hw_changed(
-				&tpacpi_led_kbdlight.led_classdev, brightness);
+		return false;
+	case TP_HKEY_EV_VOL_UP:
+	case TP_HKEY_EV_VOL_DOWN:
+	case TP_HKEY_EV_VOL_MUTE:
+		if (alsa_card)
+			volume_alsa_notify_change();
+
+		/* Key events are suppressed by default hotkey_user_mask */
+		return false;
+	case TP_HKEY_EV_KBD_LIGHT:
+		if (tp_features.kbdlight) {
+			enum led_brightness brightness;
+
+			mutex_lock(&kbdlight_mutex);
+
+			/*
+			 * Check the brightness actually changed, setting the brightness
+			 * through kbdlight_set_level() also triggers this event.
+			 */
+			brightness = kbdlight_sysfs_get(NULL);
+			if (kbdlight_brightness != brightness) {
+				kbdlight_brightness = brightness;
+				led_classdev_notify_brightness_hw_changed(
+					&tpacpi_led_kbdlight.led_classdev, brightness);
+			}
+
+			mutex_unlock(&kbdlight_mutex);
 		}
-
-		mutex_unlock(&kbdlight_mutex);
-	}
-
-	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED) {
+		/* Key events are suppressed by default hotkey_user_mask */
+		return false;
+	case TP_HKEY_EV_THM_CSM_COMPLETED:
 		lapsensor_refresh();
 		/* If we are already accessing DYTC then skip dytc update */
 		if (!atomic_add_unless(&dytc_ignore_event, -1, 0))
 			dytc_profile_refresh();
-	}
 
-	if (lcdshadow_dev && hkey_event == TP_HKEY_EV_PRIVACYGUARD_TOGGLE) {
-		enum drm_privacy_screen_status old_hw_state;
-		bool changed;
+		return true;
+	case TP_HKEY_EV_PRIVACYGUARD_TOGGLE:
+		if (lcdshadow_dev) {
+			enum drm_privacy_screen_status old_hw_state;
+			bool changed;
 
-		mutex_lock(&lcdshadow_dev->lock);
-		old_hw_state = lcdshadow_dev->hw_state;
-		lcdshadow_get_hw_state(lcdshadow_dev);
-		changed = lcdshadow_dev->hw_state != old_hw_state;
-		mutex_unlock(&lcdshadow_dev->lock);
+			mutex_lock(&lcdshadow_dev->lock);
+			old_hw_state = lcdshadow_dev->hw_state;
+			lcdshadow_get_hw_state(lcdshadow_dev);
+			changed = lcdshadow_dev->hw_state != old_hw_state;
+			mutex_unlock(&lcdshadow_dev->lock);
 
-		if (changed)
-			drm_privacy_screen_call_notifier_chain(lcdshadow_dev);
-	}
-	if (hkey_event == TP_HKEY_EV_AMT_TOGGLE) {
+			if (changed)
+				drm_privacy_screen_call_notifier_chain(lcdshadow_dev);
+		}
+		return true;
+	case TP_HKEY_EV_AMT_TOGGLE:
 		/* If we're enabling AMT we need to force balanced mode */
 		if (!dytc_amt_active)
 			/* This will also set AMT mode enabled */
 			dytc_profile_set(NULL, PLATFORM_PROFILE_BALANCED);
 		else
 			dytc_control_amt(!dytc_amt_active);
-	}
-	if (hkey_event == TP_HKEY_EV_PROFILE_TOGGLE)
+
+		return true;
+	case TP_HKEY_EV_PROFILE_TOGGLE:
 		platform_profile_cycle();
+		return true;
+	}
+
+	return false;
 }
 
 static void hotkey_driver_event(const unsigned int scancode)
-- 
2.44.0

