From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] dell-laptop: Fixed typo in touchpad LED quirk
Date: Mon,  6 Aug 2012 09:48:58 +0800
Message-ID: <1344217738-18353-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:46262 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755286Ab2HFBtD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Aug 2012 21:49:03 -0400
Received: by pbbrr13 with SMTP id rr13so1757919pbb.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Aug 2012 18:49:02 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Carlos Alberto Lopez Perez <clopez@igalia.com>

Fixed the typo introduced from the below commit
5f1e88f dell-laptop: Add 6 machines to touchpad led quirk

Reported-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/dell-laptop.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 4e96e8c..927c33a 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -211,7 +211,7 @@ static struct dmi_system_id __devinitdata dell_quirks[] = {
 		.ident = "Dell Inspiron 5420",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 5420"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 5420"),
 		},
 		.driver_data = &quirk_dell_vostro_v130,
 	},
@@ -220,7 +220,7 @@ static struct dmi_system_id __devinitdata dell_quirks[] = {
 		.ident = "Dell Inspiron 5520",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 5520"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 5520"),
 		},
 		.driver_data = &quirk_dell_vostro_v130,
 	},
@@ -229,7 +229,7 @@ static struct dmi_system_id __devinitdata dell_quirks[] = {
 		.ident = "Dell Inspiron 5720",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 5720"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 5720"),
 		},
 		.driver_data = &quirk_dell_vostro_v130,
 	},
@@ -238,7 +238,7 @@ static struct dmi_system_id __devinitdata dell_quirks[] = {
 		.ident = "Dell Inspiron 7420",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 7420"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 7420"),
 		},
 		.driver_data = &quirk_dell_vostro_v130,
 	},
@@ -247,7 +247,7 @@ static struct dmi_system_id __devinitdata dell_quirks[] = {
 		.ident = "Dell Inspiron 7520",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 7520"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 7520"),
 		},
 		.driver_data = &quirk_dell_vostro_v130,
 	},
@@ -256,7 +256,7 @@ static struct dmi_system_id __devinitdata dell_quirks[] = {
 		.ident = "Dell Inspiron 7720",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 7720"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 7720"),
 		},
 		.driver_data = &quirk_dell_vostro_v130,
 	},
-- 
1.7.9.5
