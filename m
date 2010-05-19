From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 12/14] thinkpad-acpi: don't depend on led_path for led firmware type (v2)
Date: Wed, 19 May 2010 00:26:22 -0300
Message-ID: <1274239584-17743-13-git-send-email-hmh@hmh.eng.br>
References: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:43975 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756255Ab0ESD0h (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 May 2010 23:26:37 -0400
In-Reply-To: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Don't depend on the contents of led_path to know which LED interface
the firmware wants.

This removes the only user of *_path for the thinkpad-acpi ACPI
handlers, which will simplify future code.

Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c |   47 ++++++++++++++++++++-------------
 1 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index a39f159..29ad273 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5009,11 +5009,7 @@ enum {	/* For TPACPI_LED_OLD */
 
 static enum led_access_mode led_supported;
 
-TPACPI_HANDLE(led, ec, "SLED",	/* 570 */
-	   "SYSL",		/* 600e/x, 770e, 770x, A21e, A2xm/p, */
-				/* T20-22, X20-21 */
-	   "LED",		/* all others */
-	   );			/* R30, R31 */
+static acpi_handle led_handle;
 
 #define TPACPI_LED_NUMLEDS 16
 static struct tpacpi_led_classdev *tpacpi_leds;
@@ -5273,6 +5269,32 @@ static const struct tpacpi_quirk led_useful_qtable[] __initconst = {
 #undef TPACPI_LEDQ_IBM
 #undef TPACPI_LEDQ_LNV
 
+static enum led_access_mode __init led_init_detect_mode(void)
+{
+	acpi_status status;
+
+	if (tpacpi_is_ibm()) {
+		/* 570 */
+		status = acpi_get_handle(ec_handle, "SLED", &led_handle);
+		if (ACPI_SUCCESS(status))
+			return TPACPI_LED_570;
+
+		/* 600e/x, 770e, 770x, A21e, A2xm/p, T20-22, X20-21 */
+		status = acpi_get_handle(ec_handle, "SYSL", &led_handle);
+		if (ACPI_SUCCESS(status))
+			return TPACPI_LED_OLD;
+	}
+
+	/* most others */
+	status = acpi_get_handle(ec_handle, "LED", &led_handle);
+	if (ACPI_SUCCESS(status))
+		return TPACPI_LED_NEW;
+
+	/* R30, R31, and unknown firmwares */
+	led_handle = NULL;
+	return TPACPI_LED_NONE;
+}
+
 static int __init led_init(struct ibm_init_struct *iibm)
 {
 	unsigned int i;
@@ -5281,20 +5303,7 @@ static int __init led_init(struct ibm_init_struct *iibm)
 
 	vdbg_printk(TPACPI_DBG_INIT, "initializing LED subdriver\n");
 
-	TPACPI_ACPIHANDLE_INIT(led);
-
-	if (!led_handle)
-		/* led not supported on R30, R31 */
-		led_supported = TPACPI_LED_NONE;
-	else if (tpacpi_is_ibm() && strlencmp(led_path, "SLED") == 0)
-		/* 570 */
-		led_supported = TPACPI_LED_570;
-	else if (tpacpi_is_ibm() && strlencmp(led_path, "SYSL") == 0)
-		/* 600e/x, 770e, 770x, A21e, A2xm/p, T20-22, X20-21 */
-		led_supported = TPACPI_LED_OLD;
-	else
-		/* all others */
-		led_supported = TPACPI_LED_NEW;
+	led_supported = led_init_detect_mode();
 
 	vdbg_printk(TPACPI_DBG_INIT, "LED commands are %s, mode %d\n",
 		str_supported(led_supported), led_supported);
-- 
1.7.1

