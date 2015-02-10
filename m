From: Xavier Naveira <xnaveira@gmail.com>
Subject: [PATCH v2] thinkpad_acpi: unhandled hkey event
Date: Tue, 10 Feb 2015 08:45:18 +0100
Message-ID: <1423554318-5489-1-git-send-email-xnaveira@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:41070 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752484AbbBJHpc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 Feb 2015 02:45:32 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: ibm-acpi@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Xavier Naveira <xnaveira@gmail.com>

Pressing Fn+Esc in a Lenovo Thinkpad x240 to lock the Fn keys generates
an unhandled hkey event

Signed-off-by: Xavier Naveira <xnaveira@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index cf0f893..ce63610 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -196,6 +196,7 @@ enum tpacpi_hkey_event_t {
 	/* Key-related user-interface events */
 	TP_HKEY_EV_KEY_NUMLOCK		= 0x6000, /* NumLock key pressed */
 	TP_HKEY_EV_KEY_FN		= 0x6005, /* Fn key pressed? E420 */
+	TP_HKEY_EV_KEY_FN_ESC           = 0x6060, /* Fn+Esc key pressed X240 */
 
 	/* Thermal events */
 	TP_HKEY_EV_ALARM_BAT_HOT	= 0x6011, /* battery too hot */
@@ -3714,6 +3715,7 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 
 	case TP_HKEY_EV_KEY_NUMLOCK:
 	case TP_HKEY_EV_KEY_FN:
+	case TP_HKEY_EV_KEY_FN_ESC:
 		/* key press events, we just ignore them as long as the EC
 		 * is still reporting them in the normal keyboard stream */
 		*send_acpi_ev = false;
-- 
2.1.0
