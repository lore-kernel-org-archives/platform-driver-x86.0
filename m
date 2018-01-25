From: Alexander Abrosimov <alexander.n.abrosimov@gmail.com>
Subject: [PATCH] platform/x86: dell-laptop: Add 2-in-1 devices to the DMI whitelist
Date: Fri, 26 Jan 2018 01:48:57 +0300
Message-ID: <20180125224857.3622-1-alexander.n.abrosimov@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35464 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751238AbeAYWtn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Jan 2018 17:49:43 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Abrosimov <alexander.n.abrosimov@gmail.com>

SMBIOS 3.0.0 Specification introduced new Chassis Types field values for
2-in-1 devices like tablets, convertibles and detachables. Dell's
Inspiron 2-in-1 and XPS 2-in-1 fall into this category and they have to
be added to the DMI whitelist, so rfkill and backlight can be controlled
for them as for other laptops.

Signed-off-by: Alexander Abrosimov <alexander.n.abrosimov@gmail.com>
---
 drivers/platform/x86/dell-laptop.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index cd4725e7e0b5..23fc94d70ea1 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -110,6 +110,24 @@ static const struct dmi_system_id dell_device_table[] __initconst = {
 		},
 	},
 	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_CHASSIS_TYPE, "30"), /*Tablet*/
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_CHASSIS_TYPE, "31"), /*Convertible*/
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_CHASSIS_TYPE, "32"), /*Detachable*/
+		},
+	},
+	{
 		.ident = "Dell Computer Corporation",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
-- 
2.13.6
