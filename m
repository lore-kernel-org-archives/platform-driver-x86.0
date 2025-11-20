Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8A619FA93;
	Thu, 20 Nov 2025 21:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763675568; cv=none; b=UciFDkGyDchTm38KqqcmDTOcO1ho7twaMXNBEF5yJPKuzmC0eRFj0tXg3YL+kxirUMsCYC5vJ49NIc5w1yjXu5tdvRQwDDpPCI5+pAwgzLOUVLuDzpYn3TUyIxjRBCMASn2Wj2fBfCQPekPgncMu276EwS4UvhqkKSts0QIEVhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763675568; c=relaxed/simple;
	bh=cpni/QUtXYM3InMhiUp7ZIbg/PTeYfzIiKAhca0+jjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGstYW3JomqIMTs1FHW9Q7V6+LxjuUQ8uNxjD9cB4vaDCPUdnkOGL1+sD6jQlgyfACZlmVWul1s+ApqLt6Aw6GazoqKwzvDQ8uGEX0wZSuuvGt7b2InPYRL91H2wYHk8BNNYUC6AAU1yPkTIUNQFra22xfbZFpO8c0rR9eF0oBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=P1OaxrT+; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="P1OaxrT+"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 5408B2FC0057;
	Thu, 20 Nov 2025 22:52:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763675563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WFj2Yh9gc9ZAC9AuYfshk/m1iRa/BwiDjIu2B5wj0Bo=;
	b=P1OaxrT+Jika1mjcrifdi+y4g85yhObOTEOo91EksLMRhsbnWJeBr0A1FM2aAQmMHOQqNJ
	H6T9D1BNKhZdNnvcYxtC2DT6+J+kV0zVDiksDbxeyUAAievzWEAEJdbYEJdq7rlXkY7jUD
	gVp97N7/luIbcmR82C7MgisyORd9BpY=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v3 1/2] platform/x86/uniwill: Handle more WMI events required for TUXEDO devices
Date: Thu, 20 Nov 2025 22:49:41 +0100
Message-ID: <20251120215240.436835-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251120215240.436835-1-wse@tuxedocomputers.com>
References: <20251120215240.436835-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle more WMI events that are triggered on TUXEDO devices.

Testing the TUXEDO InfinityBook Pro 15 Gen9 Intel, the Stellaris 16 Gen5
Intel, the Stellaris 16 Gen5 AMD and going through the out of tree
tuxedo-drivers dkms package I identified more WMI events that are used by
Uniwill.

This patch binds them to their respective function, or marks them as
KE_IGNORE when they are send in addition to other actions, to make clear
that they don't need special handling. This also avoids warnings in dmesg.

The events with descriptions from memory:

UNIWILL_OSD_RADIOON and UNIWILL_OSD_RADIOOFF - Sent in addition to the
already handled UNIWILL_OSD_RFKILL on some devices.

UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE - Physical button on some devices. Bind
it to a button so userspace can receive the keypress and to stuff with it.

UNIWILL_OSD_MUTE - Sent in addition to an already handled keypress.

UNIWILL_OSD_KB_LED_LEVEL0 - UNIWILL_OSD_KB_LED_LEVEL4 - Some devices sent
these instead of UNIWILL_OSD_KBDILLUMTOGGLE.

UNIWILL_OSD_WEBCAM_TOGGLE - Sent in addition to deactivating the Webcam on
firmware level.

UNIWILL_OSD_DC_ADAPTER_CHANGED - No special handling required here atm, but
will be for the charging priority feature.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 21 ++++++++++++++++++++-
 drivers/platform/x86/uniwill/uniwill-wmi.h  |  2 ++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 014960d16211b..e0d356dfc74c7 100644
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
 
@@ -1247,6 +1260,12 @@ static int uniwill_notifier_call(struct notifier_block *nb, unsigned long action
 		}
 		mutex_unlock(&data->battery_lock);
 
+		return NOTIFY_OK;
+	case UNIWILL_OSD_DC_ADAPTER_CHANGED:
+		/* noop for the time being, will change once charging priority
+		 * gets implemented.
+		 */
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

