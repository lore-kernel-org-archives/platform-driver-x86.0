From: Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] TPACPI: Make W510 microphone LED working
Date: Sun,  8 Apr 2012 05:07:10 +0200
Message-ID: <1333854430-12997-1-git-send-email-marek.vasut@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:62852 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752994Ab2DHDHT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 7 Apr 2012 23:07:19 -0400
Received: by wejx9 with SMTP id x9so2084079wej.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 07 Apr 2012 20:07:18 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi-devel@lists.sourceforge.net
Cc: ibm-acpi@hmh.eng.br, platform-driver-x86@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>

Signed-off-by: Marek Vasut <marek.vasut@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index d68c000..9cd366a 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5055,8 +5055,10 @@ static const char * const tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
 	"tpacpi::unknown_led2",
 	"tpacpi::unknown_led3",
 	"tpacpi::thinkvantage",
+	"tpacpi::unknown_led4",
+	"tpacpi::microphone",
 };
-#define TPACPI_SAFE_LEDS	0x1081U
+#define TPACPI_SAFE_LEDS	0x5081U
 
 static inline bool tpacpi_is_led_restricted(const unsigned int led)
 {
@@ -5274,6 +5276,8 @@ static const struct tpacpi_quirk led_useful_qtable[] __initconst = {
 
 	/* (1) - may have excess leds enabled on MSB */
 
+	TPACPI_Q_LNV('6', 'N', 0x43bf), /* W510 */
+
 	/* Defaults (order matters, keep last, don't reorder!) */
 	{ /* Lenovo */
 	  .vendor = PCI_VENDOR_ID_LENOVO,
-- 
1.7.9.1
