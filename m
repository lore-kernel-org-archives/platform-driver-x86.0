From: Xavier Naveira <xnaveira@gmail.com>
Subject: [PATCH] thinkpad_acpi: unhandled hkey event
Date: Sat, 31 Jan 2015 19:52:03 +0100
Message-ID: <1422730323-14473-1-git-send-email-xnaveira@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:41481 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752865AbbAaSwQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 31 Jan 2015 13:52:16 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Xavier Naveira <xnaveira@gmail.com>

Pressing Fn+Esc in a Lenovo Thinkpad x240 to lock the Fn keys generates
an unhandled hkey event

Signed-off-by: Xavier Naveira <xnaveira@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index c3d11fa..e61c43b 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -196,6 +196,7 @@ enum tpacpi_hkey_event_t {
 	/* Key-related user-interface events */
 	TP_HKEY_EV_KEY_NUMLOCK		= 0x6000, /* NumLock key pressed */
 	TP_HKEY_EV_KEY_FN		= 0x6005, /* Fn key pressed? E420 */
+	TP_HKEY_EV_KEY_FN_ESC           = 0x6060, /* Fn+Esc key pressed X240 */
 
 	/* Thermal events */
 	TP_HKEY_EV_ALARM_BAT_HOT	= 0x6011, /* battery too hot */
@@ -3717,6 +3718,12 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 		*send_acpi_ev = false;
 		*ignore_acpi_ev = true;
 		return true;
+	case TP_HKEY_EV_KEY_FN_ESC:
+		/* key press events, we just ignore them as long as the EC
+		 * is still reporting them in the normal keyboard stream */
+		*send_acpi_ev = false;
+		*ignore_acpi_ev = true;
+		return true;
 
 	default:
 		pr_warn("unknown possible thermal alarm or keyboard event received\n");
-- 
2.1.0
