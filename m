From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/3] platform/x86: thinkpad_acpi: Add support for new hotkeys found on X1C8 / T14
Date: Fri, 17 Jul 2020 13:41:54 +0200
Message-ID: <20200717114155.56222-3-hdegoede@redhat.com>
References: <20200717114155.56222-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200717114155.56222-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org, Marco Trevisan <marco.trevisan@canonical.com>, Mark Pearson <mpearson@lenovo.com>, Christian Kellner <ckellner@redhat.com>, Benjamin Berg <bberg@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

New Lenovo Thinkpad models, e.g. the X1 Carbon 8th gen and the new T14 gen1
models have 3 new symbols / shortcuts on their F9-F11 keys (and the
thinkpad_acpi driver receives 3 new hkey events for these):

F9:  Has a symbol resembling a rectangular speech baloon, the manual says
     the hotkey functions shows or hides the notification center
F10: Has a symbol of a telephone horn which has been picked up from the
     receiver, the manual says: "Answer incoming calls"
F11: Has a symbol of a telephone horn which is resting on the receiver,
     the manual says: "Decline incoming calls"

This commit adds support for these 3 new hotkeys.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 7dd84cb4fcef..7fc44b6f8370 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1915,6 +1915,10 @@ enum {	/* hot key scan codes (derived from ACPI DSDT) */
 	TP_ACPI_HOTKEYSCAN_CALCULATOR,
 	TP_ACPI_HOTKEYSCAN_BLUETOOTH,
 	TP_ACPI_HOTKEYSCAN_KEYBOARD,
+	TP_ACPI_HOTKEYSCAN_1316, /* 0x1316 scancode is unknown */
+	TP_ACPI_HOTKEYSCAN_NOTIFICATION_CENTER,
+	TP_ACPI_HOTKEYSCAN_PICKUP_PHONE,
+	TP_ACPI_HOTKEYSCAN_HANGUP_PHONE,
 
 	/* Hotkey keymap size */
 	TPACPI_HOTKEY_MAP_LEN
@@ -3431,11 +3435,15 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
 		KEY_UNKNOWN,
 
-		KEY_BOOKMARKS,       /* Favorite app, 0x311 */
-		KEY_RESERVED,        /* Clipping tool */
-		KEY_CALC,            /* Calculator (above numpad, P52) */
-		KEY_BLUETOOTH,       /* Bluetooth */
-		KEY_KEYBOARD         /* Keyboard, 0x315 */
+		KEY_BOOKMARKS,			/* Favorite app, 0x311 */
+		KEY_RESERVED,			/* Clipping tool */
+		KEY_CALC,			/* Calculator (above numpad, P52) */
+		KEY_BLUETOOTH,			/* Bluetooth */
+		KEY_KEYBOARD,			/* Keyboard, 0x315 */
+		KEY_UNKNOWN,			/* 0x316, unknown */
+		KEY_NOTIFICATION_CENTER,	/* Notification Center */
+		KEY_PICKUP_PHONE,		/* Answer incoming call */
+		KEY_HANGUP_PHONE,		/* Decline incoming call */
 		},
 	};
 
-- 
2.26.2
