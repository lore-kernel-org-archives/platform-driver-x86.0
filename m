From: Olle Liljenzin <olle@liljenzin.se>
Subject: [PATCH] platform/x86: ideapad-laptop: Add Y520-15IKBN to no_hw_rfkill
Date: Sun, 18 Jun 2017 13:09:31 +0200
Message-ID: <20170618110931.2299-1-olle@liljenzin.se>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from host224-206.customer.mediateknik.net ([194.132.224.206]:45706
        "EHLO ludenben.liljenzin.se" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752825AbdFRMFG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Jun 2017 08:05:06 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ike.pan@canonical.com
Cc: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, olle@liljenzin.se

Lenovo Legion Y520-15IKBN is yet another Lenovo model that does not
have an hw rfkill switch, resulting in wifi always reported as hard
blocked.

Add the model to the list of models without rfkill switch.

Signed-off-by: Olle Liljenzin <olle@liljenzin.se>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 24ca9fb..4bd575d 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -911,6 +911,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 		},
 	},
 	{
+		.ident = "Lenovo Legion Y520-15IKBN",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Y520-15IKBN"),
+		},
+	},
+	{
 		.ident = "Lenovo Yoga 2 11 / 13 / Pro",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
2.9.4
