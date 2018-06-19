From: Benjamin Berg <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] platform/x86: thinkpad_acpi: Add support
 for calculator hotkey
Date: Tue, 19 Jun 2018 17:51:52 +0200
Message-ID: <20180619155152.4984-1-bberg@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Christian Kellner <ckellner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Benjamin Berg <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

The P52 has a keyboard which features a calculator key above the numpad.
Add support for this the calculator key (0x1313).

Signed-off-by: Benjamin Berg <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index cae9b0595692..6c979fe44ea7 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1928,7 +1928,7 @@ enum {	/* hot key scan codes (derived from ACPI DSDT) */
 	/* first new observed key (star, favorites) is 0x1311 */
 	TP_ACPI_HOTKEYSCAN_STAR = 69,
 	TP_ACPI_HOTKEYSCAN_CLIPPING_TOOL2,
-	TP_ACPI_HOTKEYSCAN_UNK25,
+	TP_ACPI_HOTKEYSCAN_CALCULATOR,
 	TP_ACPI_HOTKEYSCAN_BLUETOOTH,
 	TP_ACPI_HOTKEYSCAN_KEYBOARD,
 
@@ -3449,7 +3449,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 
 		KEY_FAVORITES,       /* Favorite app, 0x311 */
 		KEY_RESERVED,        /* Clipping tool */
-		KEY_RESERVED,
+		KEY_CALC,            /* Calculator (above numpad), 0x313 */
 		KEY_BLUETOOTH,       /* Bluetooth */
 		KEY_KEYBOARD         /* Keyboard, 0x315 */
 		},
-- 
2.17.1


------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
