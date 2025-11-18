Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2E4328619;
	Tue, 18 Nov 2025 15:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763478530; cv=none; b=McH8rf88k6EVv1MkqIA87Msu8eAK+mgqrQ2gN+CUuCUBFCtdDcMlPTAlfjhAqGPvDA5tYW+Whpi44RCB436NDq18cePC6sKRYEqbaWxDWCsBBnbvYD8vgD3Q0L1uGy8RUav+wTs2bic90/Rbnd3Xd12ZukQ170eP0ZOcGU+bI4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763478530; c=relaxed/simple;
	bh=kSHcarLFc5fwr/irPR+Wm9cLX+blz6H8BKym2rWXwfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAUAKzaQFntriLVWKa+hBUTCaHIpLvp2lHAZ9ZFqG0kJWjDYxaZrBVsjlb+iwgiTVaTh82BFT31h+akxPwDOph+Pv2ehvdwVvi79SN8zZip/64KJfJVfo6F3Q9fXAM93mvzc1VjjebH65VhnfeqFBssSrY0QvqyKaOexawdGdQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=upnwtvyR; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="upnwtvyR"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 8B6372FC005B;
	Tue, 18 Nov 2025 16:08:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763478525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TWb+36S1MZEfS+LSh3SuJrzHsdrxddsqe3rDjMAEq+4=;
	b=upnwtvyR4juul2/j9Dy7i6BD3MaNzutS1VG9D6HdvI7R5bwyPS5tZ4OeLUAdyQ1s3nF5XX
	+b8SxIAvWPD6Cj/vxVnDoONIX9eb5Bb9Z93L96762+hcv7qoKzdKl/BqHn6BjQPaQiG27g
	vCNTt0jVuKPVSTcouOgIH1xFWlIZiVM=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v2 1/2] platform/x86/uniwill: Handle more WMI events required for TUXEDO devices
Date: Tue, 18 Nov 2025 16:02:28 +0100
Message-ID: <20251118150839.55336-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118150839.55336-1-wse@tuxedocomputers.com>
References: <20251118150839.55336-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle some more WMI events that are triggered on TUXEDO devices.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 19 ++++++++++++++++++-
 drivers/platform/x86/uniwill/uniwill-wmi.h  |  2 ++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 014960d16211b..4efb5a909f717 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -371,9 +371,11 @@ static const struct key_entry uniwill_keymap[] = {
 
 	/* Reported in manual mode when toggling the airplane mode status */
 	{ KE_KEY,       UNIWILL_OSD_RFKILL,                     { KEY_RFKILL }},
+	{ KE_IGNORE,    UNIWILL_OSD_RADIOON,                    { KEY_UNKNOWN }},
+	{ KE_IGNORE,    UNIWILL_OSD_RADIOOFF,                   { KEY_UNKNOWN }},
 
 	/* Reported when user wants to cycle the platform profile */
-	{ KE_IGNORE,    UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_UNKNOWN }},
+	{ KE_KEY,       UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_F14 }},
 
 	/* Reported when the user wants to adjust the brightness of the keyboard */
 	{ KE_KEY,       UNIWILL_OSD_KBDILLUMDOWN,               { KEY_KBDILLUMDOWN }},
@@ -382,11 +384,19 @@ static const struct key_entry uniwill_keymap[] = {
 	/* Reported when the user wants to toggle the microphone mute status */
 	{ KE_KEY,       UNIWILL_OSD_MIC_MUTE,                   { KEY_MICMUTE }},
 
+	/* Reported when the user wants to toggle the mute status */
+	{ KE_IGNORE,    UNIWILL_OSD_MUTE,                       { KEY_MUTE }},
+
 	/* Reported when the user locks/unlocks the Fn key */
 	{ KE_IGNORE,    UNIWILL_OSD_FN_LOCK,                    { KEY_FN_ESC }},
 
 	/* Reported when the user wants to toggle the brightness of the keyboard */
 	{ KE_KEY,       UNIWILL_OSD_KBDILLUMTOGGLE,             { KEY_KBDILLUMTOGGLE }},
+	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL0,              { KEY_KBDILLUMTOGGLE }},
+	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL1,              { KEY_KBDILLUMTOGGLE }},
+	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL2,              { KEY_KBDILLUMTOGGLE }},
+	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL3,              { KEY_KBDILLUMTOGGLE }},
+	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL4,              { KEY_KBDILLUMTOGGLE }},
 
 	/* FIXME: find out the exact meaning of those events */
 	{ KE_IGNORE,    UNIWILL_OSD_BAT_CHARGE_FULL_24_H,       { KEY_UNKNOWN }},
@@ -395,6 +405,9 @@ static const struct key_entry uniwill_keymap[] = {
 	/* Reported when the user wants to toggle the benchmark mode status */
 	{ KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,      { KEY_UNKNOWN }},
 
+	/* Reported when the user wants to toggle the webcam */
+	{ KE_IGNORE,    UNIWILL_OSD_WEBCAM_TOGGLE,              { KEY_UNKNOWN }},
+
 	{ KE_END }
 };
 
@@ -1247,6 +1260,10 @@ static int uniwill_notifier_call(struct notifier_block *nb, unsigned long action
 		}
 		mutex_unlock(&data->battery_lock);
 
+		return NOTIFY_OK;
+	case UNIWILL_OSD_DC_ADAPTER_CHANGED:
+		// noop for the time being
+
 		return NOTIFY_OK;
 	default:
 		mutex_lock(&data->input_lock);
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platform/x86/uniwill/uniwill-wmi.h
index 2bf69f2d80381..48783b2e9ffb9 100644
--- a/drivers/platform/x86/uniwill/uniwill-wmi.h
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
@@ -113,6 +113,8 @@
 
 #define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE	0xC0
 
+#define UNIWILL_OSD_WEBCAM_TOGGLE		0xCF
+
 #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED	0xF0
 
 struct device;
-- 
2.43.0

