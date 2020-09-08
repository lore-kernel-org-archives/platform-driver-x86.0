From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 3/4] platform/x86: thinkpad_acpi: Add
 support for new hotkeys found on X1C8 / T14
Date: Tue,  8 Sep 2020 15:51:46 +0200
Message-ID: <20200908135147.4044-4-hdegoede@redhat.com>
References: <20200908135147.4044-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20200908135147.4044-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, linux-input-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Pearson <mpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

New Lenovo Thinkpad models, e.g. the X1 Carbon 8th gen and the new T14 gen1
models have 3 new symbols / shortcuts on their F9-F11 keys (and the
thinkpad_acpi driver receives 3 new hkey events for these):

F9:  Has a symbol resembling a rectangular speech balloon, the manual says
     the hotkey functions shows or hides the notification center
F10: Has a symbol of a telephone horn which has been picked up from the
     receiver, the manual says: "Answer incoming calls"
F11: Has a symbol of a telephone horn which is resting on the receiver,
     the manual says: "Decline incoming calls"

And these Thinkpad models also send a new 0x1316 hkey events when the
Fn + right Shift key-combo is pressed.

This commit adds support for these 4 new hkey events.

Acked-by: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- Map 0x1316 to KEY_FN_RIGHT_SHIFT instead of to KEY_UNKNOWN (now that we
  know what it does)
---
 drivers/platform/x86/thinkpad_acpi.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 9c4df41687a3..4b701e9a0392 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1913,6 +1913,10 @@ enum {	/* hot key scan codes (derived from ACPI DSDT) */
 	TP_ACPI_HOTKEYSCAN_CALCULATOR,
 	TP_ACPI_HOTKEYSCAN_BLUETOOTH,
 	TP_ACPI_HOTKEYSCAN_KEYBOARD,
+	TP_ACPI_HOTKEYSCAN_FN_RIGHT_SHIFT, /* Used by "Lenovo Quick Clean" */
+	TP_ACPI_HOTKEYSCAN_NOTIFICATION_CENTER,
+	TP_ACPI_HOTKEYSCAN_PICKUP_PHONE,
+	TP_ACPI_HOTKEYSCAN_HANGUP_PHONE,
 
 	/* Hotkey keymap size */
 	TPACPI_HOTKEY_MAP_LEN
@@ -3429,11 +3433,15 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
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
+		KEY_FN_RIGHT_SHIFT,		/* Fn + right Shift */
+		KEY_NOTIFICATION_CENTER,	/* Notification Center */
+		KEY_PICKUP_PHONE,		/* Answer incoming call */
+		KEY_HANGUP_PHONE,		/* Decline incoming call */
 		},
 	};
 
-- 
2.28.0
