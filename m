From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 1/1] toshiba_acpi: Reorder toshiba_acpi_alt_keymap entries
Date: Wed, 22 Jul 2015 19:37:46 -0600
Message-ID: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:35366 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753196AbbGWBiA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jul 2015 21:38:00 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch simply reorders the entries found in the new keymap by
ascending order, this is simply a cosmetic change, no functionality
was modified.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 649786d..b550be2 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -251,16 +251,16 @@ static const struct key_entry toshiba_acpi_keymap[] = {
 };
 
 static const struct key_entry toshiba_acpi_alt_keymap[] = {
-	{ KE_KEY, 0x157, { KEY_MUTE } },
 	{ KE_KEY, 0x102, { KEY_ZOOMOUT } },
 	{ KE_KEY, 0x103, { KEY_ZOOMIN } },
 	{ KE_KEY, 0x12c, { KEY_KBDILLUMTOGGLE } },
 	{ KE_KEY, 0x139, { KEY_ZOOMRESET } },
-	{ KE_KEY, 0x13e, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, 0x13c, { KEY_BRIGHTNESSDOWN } },
 	{ KE_KEY, 0x13d, { KEY_BRIGHTNESSUP } },
-	{ KE_KEY, 0x158, { KEY_WLAN } },
+	{ KE_KEY, 0x13e, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, 0x13f, { KEY_TOUCHPAD_TOGGLE } },
+	{ KE_KEY, 0x157, { KEY_MUTE } },
+	{ KE_KEY, 0x158, { KEY_WLAN } },
 	{ KE_END, 0 },
 };
 
-- 
2.4.5
