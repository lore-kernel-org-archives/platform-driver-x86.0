From: yjx@flygoat.com
Subject: [PATCH v3] ideapad-laptop: Add several models to no_hw_rfkill
Date: Tue,  4 Jul 2017 14:39:19 +0000
Message-ID: <20170704143919.2942-1-yjx@flygoat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from forward16h.cmail.yandex.net ([87.250.230.158]:48425 "EHLO
        forward16h.cmail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750841AbdGEFuP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Jul 2017 01:50:15 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ike.pan@canonical.com
Cc: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Yang Jiaxun <yjx@flygoat.com>

From: Yang Jiaxun <yjx@flygoat.com>

Some Lenovo ideapad models do not have hardware rfkill switches, but
trying to read the rfkill switches through the ideapad-laptop module.
It caused to always reported blocking breaking wifi.

Fix it by adding those models to no_hw_rfkill_list.

Signed-off-by: Yang Jiaxun <yjx@flygoat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 70 +++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 24ca9fbe31cc..5f4515b88a18 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -869,6 +869,27 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 		},
 	},
 	{
+		.ident = "Lenovo V310-14IKB",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo V310-14IKB"),
+		},
+	},
+	{
+		.ident = "Lenovo V310-14ISK",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo V310-14ISK"),
+		},
+	},
+	{
+		.ident = "Lenovo V310-15IKB",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo V310-15IKB"),
+		},
+	},
+	{
 		.ident = "Lenovo V310-15ISK",
 		.matches = {
 		        DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
@@ -876,6 +897,48 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 		},
 	},
 	{
+		.ident = "Lenovo ideapad 300-15IBR",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 300-15IBR"),
+		},
+	},
+	{
+		.ident = "Lenovo ideapad 300-15IKB",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 300-15IKB"),
+		},
+	},
+	{
+		.ident = "Lenovo ideapad 300S-11IBR",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 300S-11BR"),
+		},
+	},
+	{
+		.ident = "Lenovo ideapad 310-15ABR",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 310-15ABR"),
+		},
+	},
+	{
+		.ident = "Lenovo ideapad 310-15IAP",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 310-15IAP"),
+		},
+	},
+	{
+		.ident = "Lenovo ideapad 310-15ISK",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 310-15ISK"),
+		},
+	},
+	{
 		.ident = "Lenovo ideapad 310-15IKB",
 		.matches = {
 		        DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
@@ -883,6 +946,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 		},
 	},
 	{
+		.ident = "Lenovo ideapad Y700-14ISK",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700-14ISK"),
+		},
+	},
+	{
 		.ident = "Lenovo ideapad Y700-15ACZ",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
2.13.2
