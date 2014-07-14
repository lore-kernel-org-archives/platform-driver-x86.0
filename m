From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] asus-nb-wmi.c: Rename x401u quirk to wapf4
Date: Mon, 14 Jul 2014 09:14:34 +0200
Message-ID: <1405322075-2334-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:61615 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752861AbaGNHOx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Jul 2014 03:14:53 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, Hans de Goede <hdegoede@redhat.com>

The actual x401u does not use the so named x401u quirk but the x55u quirk.
All that the x401u quirk does it setting wapf to 4, so rename it to wapf4 to
stop the confusion.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index ddf0eef..fd8e9d3 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -70,7 +70,7 @@ static struct quirk_entry quirk_asus_x55u = {
 	.no_display_toggle = true,
 };
 
-static struct quirk_entry quirk_asus_x401u = {
+static struct quirk_entry quirk_asus_wapf4 = {
 	.wapf = 4,
 };
 
@@ -97,7 +97,7 @@ static struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X401A"),
 		},
-		.driver_data = &quirk_asus_x401u,
+		.driver_data = &quirk_asus_wapf4,
 	},
 	{
 		.callback = dmi_matched,
@@ -106,7 +106,7 @@ static struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X401A1"),
 		},
-		.driver_data = &quirk_asus_x401u,
+		.driver_data = &quirk_asus_wapf4,
 	},
 	{
 		.callback = dmi_matched,
@@ -124,7 +124,7 @@ static struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X501A"),
 		},
-		.driver_data = &quirk_asus_x401u,
+		.driver_data = &quirk_asus_wapf4,
 	},
 	{
 		.callback = dmi_matched,
@@ -133,7 +133,7 @@ static struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X501A1"),
 		},
-		.driver_data = &quirk_asus_x401u,
+		.driver_data = &quirk_asus_wapf4,
 	},
 	{
 		.callback = dmi_matched,
@@ -142,7 +142,7 @@ static struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X550CA"),
 		},
-		.driver_data = &quirk_asus_x401u,
+		.driver_data = &quirk_asus_wapf4,
 	},
 	{
 		.callback = dmi_matched,
@@ -151,7 +151,7 @@ static struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X55A"),
 		},
-		.driver_data = &quirk_asus_x401u,
+		.driver_data = &quirk_asus_wapf4,
 	},
 	{
 		.callback = dmi_matched,
@@ -160,7 +160,7 @@ static struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X55C"),
 		},
-		.driver_data = &quirk_asus_x401u,
+		.driver_data = &quirk_asus_wapf4,
 	},
 	{
 		.callback = dmi_matched,
@@ -178,7 +178,7 @@ static struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X55VD"),
 		},
-		.driver_data = &quirk_asus_x401u,
+		.driver_data = &quirk_asus_wapf4,
 	},
 	{
 		.callback = dmi_matched,
@@ -187,7 +187,7 @@ static struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X75A"),
 		},
-		.driver_data = &quirk_asus_x401u,
+		.driver_data = &quirk_asus_wapf4,
 	},
 	{
 		.callback = dmi_matched,
@@ -196,7 +196,7 @@ static struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "1015E"),
 		},
-		.driver_data = &quirk_asus_x401u,
+		.driver_data = &quirk_asus_wapf4,
 	},
 	{
 		.callback = dmi_matched,
@@ -205,7 +205,7 @@ static struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "1015U"),
 		},
-		.driver_data = &quirk_asus_x401u,
+		.driver_data = &quirk_asus_wapf4,
 	},
 	{},
 };
-- 
2.0.0
