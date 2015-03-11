From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch 2/2] thinkpad_acpi: off by one in
 adaptive_keyboard_hotkey_notify_hotkey()
Date: Wed, 11 Mar 2015 12:36:07 +0300
Message-ID: <20150311093607.GB3564@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Bastien Nocera <hadess@hadess.net>
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This should be >= instead of > because otherwise we read one element
past the end of the hotkey_keycode_map[] array.

The hotkey_keycode_map[] array has TPACPI_HOTKEY_MAP_LEN elements.

Fixes: 6a68d8557084 ('thinkpad_acpi: Add support for more adaptive kbd buttons')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 024861d..7769575 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3656,8 +3656,9 @@ static bool adaptive_keyboard_hotkey_notify_hotkey(unsigned int scancode)
 		return true;
 
 	default:
-		if (scancode < FIRST_ADAPTIVE_KEY || scancode > FIRST_ADAPTIVE_KEY +
-				TPACPI_HOTKEY_MAP_LEN - ADAPTIVE_KEY_OFFSET) {
+		if (scancode < FIRST_ADAPTIVE_KEY ||
+		    scancode >= FIRST_ADAPTIVE_KEY + TPACPI_HOTKEY_MAP_LEN -
+				ADAPTIVE_KEY_OFFSET) {
 			pr_info("Unhandled adaptive keyboard key: 0x%x\n",
 					scancode);
 			return false;
