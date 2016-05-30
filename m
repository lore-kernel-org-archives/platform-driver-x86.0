From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] ideapad_laptop: add an event for mic mute hotkey
Date: Mon, 30 May 2016 15:26:48 +0800
Message-ID: <1464593208-13190-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:51911 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932500AbcE3H1A (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 30 May 2016 03:27:00 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ike.pan@canonical.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com

Newer ideapad supports new mic new hotkey, and it is implemented
via ACPI interface.  This patch conver the mic mute event to
a keycode KEY_MICMUTE

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/ideapad-laptop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 4a23fbc..aa87a42 100644
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
@@ -809,6 +810,9 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 				break;
 			case 13:
 			case 11:
+			case 8:
+				ideapad_input_report(priv, vpc_bit);
+				break;
 			case 7:
 			case 6:
 				ideapad_input_report(priv, vpc_bit);
-- 
2.7.4
