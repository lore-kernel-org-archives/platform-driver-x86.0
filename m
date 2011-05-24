From: Andy Lutomirski <luto@MIT.EDU>
Subject: [PATCH] thinkpad-acpi: Enable microphone mute LED
Date: Tue, 24 May 2011 15:41:02 -0400
Message-ID: <8dc2b2140c2794291811cd38f51f9dc7596f482c.1306266017.git.luto@mit.edu>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from DMZ-MAILSEC-SCANNER-6.MIT.EDU ([18.7.68.35]:58048 "EHLO
	dmz-mailsec-scanner-6.mit.edu" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752334Ab1EXTlI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 May 2011 15:41:08 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Andy Lutomirski <luto@mit.edu>

I don't know exactly which models have this LED or how to identify
them in the quirk table, so I just enabled it for all unquirked
Lenovo models.

Signed-off-by: Andy Lutomirski <luto@mit.edu>
---
 drivers/platform/x86/thinkpad_acpi.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 2797a97..40723a6 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5074,8 +5074,10 @@ static const char * const tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
 	"tpacpi::unknown_led2",
 	"tpacpi::unknown_led3",
 	"tpacpi::thinkvantage",
+	"tpacpi::unknown_led4",
+	"tpacpi::micmute",
 };
-#define TPACPI_SAFE_LEDS	0x1081U
+#define TPACPI_SAFE_LEDS	0x5081U
 
 static inline bool tpacpi_is_led_restricted(const unsigned int led)
 {
@@ -5297,7 +5299,7 @@ static const struct tpacpi_quirk led_useful_qtable[] __initconst = {
 	{ /* Lenovo */
 	  .vendor = PCI_VENDOR_ID_LENOVO,
 	  .bios = TPACPI_MATCH_ANY, .ec = TPACPI_MATCH_ANY,
-	  .quirks = 0x1fffU,
+	  .quirks = 0x5fffU,
 	},
 	{ /* IBM ThinkPads with no EC version string */
 	  .vendor = PCI_VENDOR_ID_IBM,
-- 
1.7.5.1
