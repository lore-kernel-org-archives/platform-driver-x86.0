From: Dhaval Shah <dhaval.shah@softnautics.com>
Subject: [PATCH 2/3] platform/x86: dell-laptop: Missing a blank line after declarations
Date: Wed, 13 Dec 2017 13:43:08 +0530
Message-ID: <20171213081309.22851-3-dhaval.shah@softnautics.com>
References: <20171213081309.22851-1-dhaval.shah@softnautics.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ma1ind01on0119.outbound.protection.outlook.com ([104.47.100.119]:59014
        "EHLO IND01-MA1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750880AbdLMIOe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Dec 2017 03:14:34 -0500
In-Reply-To: <20171213081309.22851-1-dhaval.shah@softnautics.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org, pali.rohar@gmail.com, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Dhaval Shah <dhaval.shah@softnautics.com>

Resolved Missing a blank line after declarations checkpatch warnings.
Issue found by checkpatch.

Signed-off-by: Dhaval Shah <dhaval.shah@softnautics.com>
---
 drivers/platform/x86/dell-laptop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 9b0855236e3d..bf4e73a02b39 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -466,6 +466,7 @@ static void dell_rfkill_update_sw_state(struct rfkill *rfkill, int radio,
 	if (status & BIT(0)) {
 		/* Has hw-switch, sync sw_state to BIOS */
 		int block = rfkill_blocked(rfkill);
+
 		dell_set_arguments(1 | (radio << 8) | (block << 16), 0, 0, 0);
 		dell_send_request(CLASS_INFO, SELECT_RFKILL);
 	} else {
@@ -899,6 +900,7 @@ static void touchpad_led_on(void)
 {
 	int command = 0x97;
 	char data = 1;
+
 	i8042_command(&data, command | 1 << 12);
 }
 
@@ -906,6 +908,7 @@ static void touchpad_led_off(void)
 {
 	int command = 0x97;
 	char data = 2;
+
 	i8042_command(&data, command | 1 << 12);
 }
 
@@ -2130,6 +2133,7 @@ static int __init dell_init(void)
 
 	if (max_intensity) {
 		struct backlight_properties props;
+
 		memset(&props, 0, sizeof(struct backlight_properties));
 		props.type = BACKLIGHT_PLATFORM;
 		props.max_brightness = max_intensity;
-- 
2.11.0
