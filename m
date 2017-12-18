From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 1/2] platform/x86/thinkpad_acpi: Delete an error message for a
 failed memory allocation in three functions
Date: Mon, 18 Dec 2017 22:28:01 +0100
Message-ID: <d4096def-3e50-57df-2f3b-57f71d43371e@users.sourceforge.net>
References: <81459d11-693a-eb51-9173-9c189677f422@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:55367 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934812AbdLRV3H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Dec 2017 16:29:07 -0500
In-Reply-To: <81459d11-693a-eb51-9173-9c189677f422@users.sourceforge.net>
Content-Language: en-GB
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Dec 2017 22:08:49 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/platform/x86/thinkpad_acpi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 117be48ff4de..729144925880 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -816,10 +816,8 @@ static int __init register_tpacpi_subdriver(struct ibm_struct *ibm)
 	BUG_ON(!ibm->acpi);
 
 	ibm->acpi->driver = kzalloc(sizeof(struct acpi_driver), GFP_KERNEL);
-	if (!ibm->acpi->driver) {
-		pr_err("failed to allocate memory for ibm->acpi->driver\n");
+	if (!ibm->acpi->driver)
 		return -ENOMEM;
-	}
 
 	sprintf(ibm->acpi->driver->name, "%s_%s", TPACPI_NAME, ibm->name);
 	ibm->acpi->driver->ids = ibm->acpi->hid;
@@ -3639,7 +3637,6 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	hotkey_keycode_map = kmalloc(TPACPI_HOTKEY_MAP_SIZE,
 					GFP_KERNEL);
 	if (!hotkey_keycode_map) {
-		pr_err("failed to allocate memory for key map\n");
 		res = -ENOMEM;
 		goto err_exit;
 	}
@@ -5996,10 +5993,8 @@ static int __init led_init(struct ibm_init_struct *iibm)
 
 	tpacpi_leds = kzalloc(sizeof(*tpacpi_leds) * TPACPI_LED_NUMLEDS,
 			      GFP_KERNEL);
-	if (!tpacpi_leds) {
-		pr_err("Out of memory for LED data\n");
+	if (!tpacpi_leds)
 		return -ENOMEM;
-	}
 
 	for (i = 0; i < TPACPI_LED_NUMLEDS; i++) {
 		tpacpi_leds[i].led = -1;
-- 
2.15.1
