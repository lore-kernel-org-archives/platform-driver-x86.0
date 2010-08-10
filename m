From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 5/5] thinkpad-acpi: Add KEY_CAMERA (Fn-F6) for Lenovo keyboards
Date: Mon,  9 Aug 2010 23:48:22 -0300
Message-ID: <1281408502-7757-6-git-send-email-hmh@hmh.eng.br>
References: <1281408502-7757-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:60546 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755267Ab0HJCsa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Aug 2010 22:48:30 -0400
In-Reply-To: <1281408502-7757-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Jens Taprogge <jens.taprogge@taprogge.org>

From: Jens Taprogge <jens.taprogge@taprogge.org>

On the T410s and most likely other current models, Fn-F6 is labeled as
Camera/Headphone key.  Report key presses as KEY_CAMERA.

Signed-off-by: Jens Taprogge <jens.taprogge@taprogge.org>
Acked-by: Jerone Young <jerone.young@canonical.com>
Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0c08f6f..b4fe7c5 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3173,7 +3173,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	[TPACPI_KEYMAP_LENOVO_GENERIC] = {
 		/* Scan Codes 0x00 to 0x0B: ACPI HKEY FN+F1..F12 */
 		KEY_FN_F1,	KEY_COFFEE,	KEY_BATTERY,	KEY_SLEEP,
-		KEY_WLAN,	KEY_FN_F6, KEY_SWITCHVIDEOMODE, KEY_FN_F8,
+		KEY_WLAN,	KEY_CAMERA, KEY_SWITCHVIDEOMODE, KEY_FN_F8,
 		KEY_FN_F9,	KEY_FN_F10,	KEY_FN_F11,	KEY_SUSPEND,
 
 		/* Scan codes 0x0C to 0x1F: Other ACPI HKEY hot keys */
-- 
1.7.1
