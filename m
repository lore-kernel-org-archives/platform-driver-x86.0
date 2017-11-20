From: Kiernan Hager <kah.listaddress@gmail.com>
Subject: [PATCH] Make asus-nb-wmi support the Zenbook UX430UQ
Date: Mon, 20 Nov 2017 14:18:44 -0700
Message-ID: <20171120211844.6553-1-kah.listaddress@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:46409 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751109AbdKTVTz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2017 16:19:55 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kiernan Hager <kah.listaddress@gmail.com>

This patch adds support for the Zenbook UX430UQ to the asus_nb_wmi
driver. It also renames "quirk_asus_ux330uak" to "quirk_asus_forceals"
because it is now used for more than one model of computer, and should
thus have a more general name.

Signed-off-by: Kiernan Hager <kah.listaddress@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 5269a01d9bdd..7fbb1c4bcdb5 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -111,7 +111,7 @@ static struct quirk_entry quirk_asus_x550lb = {
 	.xusb2pr = 0x01D9,
 };
 
-static struct quirk_entry quirk_asus_ux330uak = {
+static struct quirk_entry quirk_asus_forceals = {
 	.wmi_force_als_set = true,
 };
 
@@ -387,7 +387,7 @@ static const struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "UX330UAK"),
 		},
-		.driver_data = &quirk_asus_ux330uak,
+		.driver_data = &quirk_asus_forceals,
 	},
 	{
 		.callback = dmi_matched,
@@ -398,6 +398,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_x550lb,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. UX430UQ",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "UX430UQ")
+		},
+	.driver_data = &quirk_asus_forceals
+	},
 	{},
 };
 
-- 
2.15.0
