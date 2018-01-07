From: Olle Liljenzin <olle@liljenzin.se>
Subject: [PATCH] platform/x86: ideapad-laptop: Add Y720-15IKB to no_hw_rfkill
Date: Sun,  7 Jan 2018 20:53:12 +0100
Message-ID: <20180107195312.13130-1-olle@liljenzin.se>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from host224-206.customer.mediateknik.net ([194.132.224.206]:58184
        "EHLO ludenben.liljenzin.se" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754497AbeAGUKe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 7 Jan 2018 15:10:34 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ike.pan@canonical.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, piotr.baranowski@osec.pl, olle@liljenzin.se

Lenovo Legion Y720-15IKB is another Lenovo model without a
hw rfkill switch, resulting in wifi always reported as hard
blocked.

Add the model to the list of models without rfkill switch.

Signed-off-by: Olle Liljenzin <olle@liljenzin.se>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 53ab4e0f8962..c945572485ce 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1103,6 +1103,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Y520-15IKBN"),
 		},
 	},
+	{
+		.ident = "Lenovo Legion Y720-15IKB",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Y720-15IKB"),
+		},
+	},
 	{
 		.ident = "Lenovo Legion Y720-15IKBN",
 		.matches = {
-- 
2.14.3
