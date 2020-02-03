From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 1/2] platform/x86: thinkpad_acpi: remove unused defines
Date: Mon,  3 Feb 2020 13:01:31 +0100
Message-ID: <20200203120132.102576-2-linux@weissschuh.net>
References: <20200131143650.4149-1-linux@weissschuh.net>
 <20200203120132.102576-1-linux@weissschuh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200203120132.102576-1-linux@weissschuh.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
List-Id: platform-driver-x86.vger.kernel.org

They were never used.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/thinkpad_acpi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index da794dcfdd92..2d3a99e3efb7 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9323,9 +9323,6 @@ static struct ibm_struct mute_led_driver_data = {
 #define GET_STOP	"BCSG"
 #define SET_STOP	"BCSS"
 
-#define START_ATTR "charge_start_threshold"
-#define STOP_ATTR  "charge_stop_threshold"
-
 enum {
 	BAT_ANY = 0,
 	BAT_PRIMARY = 1,
-- 
2.25.0
