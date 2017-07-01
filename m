From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH] platform/x86: ideapad-laptop: Add IdeaPad V510-15IKB to no_hw_rfkill
Date: Sat,  1 Jul 2017 08:20:18 +0200
Message-ID: <20170701062018.6493-1-sven@narfation.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from narfation.org ([79.140.41.39]:43224 "EHLO v3-1039.vlinux.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751563AbdGAG1U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 1 Jul 2017 02:27:20 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>, Sven Eckelmann <sven@narfation.org>

Like other Lenovo models the IdeaPad V510-15IKB does not have an hw
rfkill switch. This results in hard-blocked radios after boot, resulting
in always blocked radios rendering them unusable.

Add the IdeaPad V510-15IKB to the no_hw_rfkill DMI list and allows using
the built-in radios.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
Commit message "borrowed" from
ccc7179f4d94 ("platform/x86: ideapad-laptop: Add IdeaPad V310-15ISK to no_hw_rfkill")


 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 527e5d9ab9bf..f23e4ad7c564 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -916,6 +916,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 		},
 	},
 	{
+		.ident = "Lenovo V510-15IKB",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo V510-15IKB"),
+		},
+	},
+	{
 		.ident = "Lenovo ideapad 310-15IKB",
 		.matches = {
 		        DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
2.11.0
