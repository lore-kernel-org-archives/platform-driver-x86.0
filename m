From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Mark expected switch
 fall-throughs
Date: Wed, 24 Apr 2019 13:15:44 -0500
Message-ID: <20190424181543.GA31200@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: platform-driver-x86.vger.kernel.org

In preparation to enabling -Wimplicit-fallthrough, mark switch
cases where we are expecting to fall through.

This patch fixes the following warnings:

drivers/platform/x86/thinkpad_acpi.c: In function ‘thermal_get_sensor’:
drivers/platform/x86/thinkpad_acpi.c:6316:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
   if (idx >= 8 && idx <= 15) {
      ^
drivers/platform/x86/thinkpad_acpi.c:6322:2: note: here
  case TPACPI_THERMAL_TPEC_8:
  ^~~~
drivers/platform/x86/thinkpad_acpi.c: In function ‘hotkey_notify’:
drivers/platform/x86/thinkpad_acpi.c:4208:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
    if (tp_features.hotkey_wlsw &&
       ^
drivers/platform/x86/thinkpad_acpi.c:4216:3: note: here
   default:
   ^~~~~~~

Warning level 3 was used: -Wimplicit-fallthrough=3

Notice that, in this particular case, the code comments are modified
in accordance with what GCC is expecting to find.

This patch is part of the ongoing efforts to enable
-Wimplicit-fallthrough.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 57d9ae9d8e56..826e9a276818 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4212,7 +4212,7 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
 				known_ev = true;
 				break;
 			}
-			/* fallthrough to default */
+			/* fallthrough - to default */
 		default:
 			known_ev = false;
 		}
@@ -6317,8 +6317,8 @@ static int thermal_get_sensor(int idx, s32 *value)
 			t = TP_EC_THERMAL_TMP8;
 			idx -= 8;
 		}
-		/* fallthrough */
 #endif
+		/* fallthrough */
 	case TPACPI_THERMAL_TPEC_8:
 		if (idx <= 7) {
 			if (!acpi_ec_read(t + idx, &tmp))
-- 
2.21.0
