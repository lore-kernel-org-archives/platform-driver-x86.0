From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH][V2] ideapad_laptop: add an event for mic mute hotkey
Date: Mon,  6 Jun 2016 09:46:11 +0800
Message-ID: <1465177571-22820-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:56034 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751770AbcFFBqR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Jun 2016 21:46:17 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ike.pan@canonical.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com

Newer ideapad supports new mic new hotkey, and it is implemented
via ACPI interface.  This patch conver the mic mute event to
a keycode KEY_MICMUTE

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/ideapad-laptop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 4a23fbc..d1a091b 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -567,6 +567,7 @@ static void ideapad_sysfs_exit(struct ideapad_private *priv)
 static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY, 6,  { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, 7,  { KEY_CAMERA } },
+	{ KE_KEY, 8,  { KEY_MICMUTE } },
 	{ KE_KEY, 11, { KEY_F16 } },
 	{ KE_KEY, 13, { KEY_WLAN } },
 	{ KE_KEY, 16, { KEY_PROG1 } },
@@ -809,6 +810,7 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 				break;
 			case 13:
 			case 11:
+			case 8:
 			case 7:
 			case 6:
 				ideapad_input_report(priv, vpc_bit);
-- 
2.7.4
