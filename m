From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 6/8] Revert "asus-wmi: Create quirk for airplane_mode LED"
Date: Thu, 26 Jan 2017 10:30:11 -0500
Message-ID: <20170126153013.12753-7-jprvita@endlessm.com>
References: <20170126153013.12753-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:34414 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752804AbdAZPbQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Jan 2017 10:31:16 -0500
In-Reply-To: <20170126153013.12753-1-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

This reverts commit a977e59c0c67c9d492bb16677ce66d67cae0ebd8.

Signed-off-by: João Paulo Rechi Vita <jprvita@endlessm.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 13 -------------
 drivers/platform/x86/asus-wmi.c    |  8 +++-----
 drivers/platform/x86/asus-wmi.h    |  1 -
 3 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 3a2fb29b1bc4..dea98ffb6f60 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -103,10 +103,6 @@ static struct quirk_entry quirk_asus_x200ca = {
 	.wapf = 2,
 };
 
-static struct quirk_entry quirk_no_rfkill = {
-	.no_rfkill = true,
-};
-
 static struct quirk_entry quirk_asus_ux303ub = {
 	.wmi_backlight_native = true,
 };
@@ -364,15 +360,6 @@ static const struct dmi_system_id asus_quirks[] = {
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
 		.ident = "ASUSTeK COMPUTER INC. UX303UB",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 43cb680adbb4..da3b12c131ce 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -2095,11 +2095,9 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (err)
 		goto fail_leds;
 
-	if (!asus->driver->quirks->no_rfkill) {
-		err = asus_wmi_rfkill_init(asus);
-		if (err)
-			goto fail_rfkill;
-	}
+	err = asus_wmi_rfkill_init(asus);
+	if (err)
+		goto fail_rfkill;
 
 	/* Some Asus desktop boards export an acpi-video backlight interface,
 	   stop this from showing up */
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
