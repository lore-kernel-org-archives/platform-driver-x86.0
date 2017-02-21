From: Sven Rebhan <sven.rebhan@gmail.com>
Subject: [PATCH] ideapad-laptop: Add Lenovo ideapad 310-15IKB to no_hw_rfkill
 dmi list
Date: Tue, 21 Feb 2017 20:53:48 +0100
Message-ID: <20170221195348.GA4998@Hugin.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33807 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754757AbdBUTx5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Feb 2017 14:53:57 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org

Like other Lenovo models the Lenovo ideapad 310-15IKB does not have a
hw rfkill switch. This results in hard-blocked radios after boot,
resulting in always blocked radios rendering them unusable.

The attached patch adds the ideapad 310-15IKB to the no_hw_rfkill
dmi list and allows using the built-in radios.

Signed-off-by: Sven Rebhan <Sven.Rebhan@googlemail.com>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index f46ece2ce3c4..cc6d91e18683 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -872,6 +872,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 		},
 	},
 	{
+		.ident = "Lenovo ideapad 310-15IKB",
+		.matches = {
+		        DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		        DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 310-15IKB"),
+		},
+	},
+	{
 		.ident = "Lenovo ideapad Y700-15ACZ",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
2.11.1
