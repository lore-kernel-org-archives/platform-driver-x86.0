From: Bin Li <bin.li@canonical.com>
Subject: [PATCH v3] platform/x86: ideapad-laptop: Add IdeaPad V310-14ISK to no_hw_rfkill
Date: Thu,  6 Jul 2017 17:22:28 +0800
Message-ID: <1499332949-8732-1-git-send-email-bin.li@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:48118 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751905AbdGFJWh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Jul 2017 05:22:37 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, libin.charles@gmail.com

Like other Lenovo models the IdeaPad V310-14ISK does not have an hw
rfkill switch. This results in hard-blocked radios after boot, resulting
in always blocked radios rendering them unusable.

Add the IdeaPad V310-14ISK to the no_hw_rfkill DMI list and allows using
the built-in radios.

Signed-off-by: Bin Li <bin.li@canonical.com>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 24ca9fb..8336af4 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -869,6 +869,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 		},
 	},
 	{
+		.ident = "Lenovo V310-14ISK",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo V310-14ISK"),
+		},
+	},
+	{
 		.ident = "Lenovo V310-15ISK",
 		.matches = {
 		        DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
2.7.4
