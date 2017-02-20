From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCHv2 2/2] platform/x86: asus-wmi: Remove quirk_no_rfkill
Date: Mon, 20 Feb 2017 14:50:23 -0500
Message-ID: <20170220195023.17775-3-jprvita@endlessm.com>
References: <20170220195023.17775-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:36586 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751454AbdBTTuz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2017 14:50:55 -0500
In-Reply-To: <20170220195023.17775-1-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

With the detection introduced in the previou patche, we don't need these
static DMI-based quirks anymore.

This reverts the following commits:
56a37a72002b "asus-wmi: Add quirk_no_rfkill_wapf4 for the Asus X456UA"
a961a285b479 "asus-wmi: Add quirk_no_rfkill_wapf4 for the Asus X456UF"
6b7ff2af5286 "asus-wmi: Add quirk_no_rfkill for the Asus Z550MA"
02db9ff7af18 "asus-wmi: Add quirk_no_rfkill for the Asus U303LB"
2d735244b798 "asus-wmi: Add quirk_no_rfkill for the Asus N552VW"
a977e59c0c67 "asus-wmi: Create quirk for airplane_mode LED"

Signed-off-by: João Paulo Rechi Vita <jprvita@endlessm.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 49 ++------------------------------------
 drivers/platform/x86/asus-wmi.c    |  5 +---
 drivers/platform/x86/asus-wmi.h    |  1 -
 3 files changed, 3 insertions(+), 52 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 5be4783e40d4..dea98ffb6f60 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -103,15 +103,6 @@ static struct quirk_entry quirk_asus_x200ca = {
 	.wapf = 2,
 };
 
-static struct quirk_entry quirk_no_rfkill = {
-	.no_rfkill = true,
-};
-
-static struct quirk_entry quirk_no_rfkill_wapf4 = {
-	.wapf = 4,
-	.no_rfkill = true,
-};
-
 static struct quirk_entry quirk_asus_ux303ub = {
 	.wmi_backlight_native = true,
 };
@@ -194,7 +185,7 @@ static const struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X456UA"),
 		},
-		.driver_data = &quirk_no_rfkill_wapf4,
+		.driver_data = &quirk_asus_wapf4,
 	},
 	{
 		.callback = dmi_matched,
@@ -203,7 +194,7 @@ static const struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X456UF"),
 		},
-		.driver_data = &quirk_no_rfkill_wapf4,
+		.driver_data = &quirk_asus_wapf4,
 	},
 	{
 		.callback = dmi_matched,
@@ -369,42 +360,6 @@ static const struct dmi_system_id asus_quirks[] = {
 	},
 	{
 		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. X555UB",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "X555UB"),
-		},
-		.driver_data = &quirk_no_rfkill,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. N552VW",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "N552VW"),
-		},
-		.driver_data = &quirk_no_rfkill,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. U303LB",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "U303LB"),
-		},
-		.driver_data = &quirk_no_rfkill,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. Z550MA",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Z550MA"),
-		},
-		.driver_data = &quirk_no_rfkill,
-	},
-	{
-		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. UX303UB",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 8499d3ae4257..8fe5890bf539 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -2111,10 +2111,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (result & (ASUS_WMI_DSTS_PRESENCE_BIT | ASUS_WMI_DSTS_USER_BIT))
 		asus->driver->wlan_ctrl_by_user = 1;
 
-	if (asus->driver->wlan_ctrl_by_user && ashs_present())
-		asus->driver->quirks->no_rfkill = 1;
-
-	if (!asus->driver->quirks->no_rfkill) {
+	if (!(asus->driver->wlan_ctrl_by_user && ashs_present())) {
 		err = asus_wmi_rfkill_init(asus);
 		if (err)
 			goto fail_rfkill;
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index fdff626c3b51..c9589d9342bb 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -39,7 +39,6 @@ struct key_entry;
 struct asus_wmi;
 
 struct quirk_entry {
-	bool no_rfkill;
 	bool hotplug_wireless;
 	bool scalar_panel_brightness;
 	bool store_backlight_power;
-- 
2.11.0
