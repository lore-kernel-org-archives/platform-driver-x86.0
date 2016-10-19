From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] ideapad-laptop: Add another DMI entry for Yoga 900
Date: Wed, 19 Oct 2016 13:27:40 +0300
Message-ID: <20161019102740.74567-1-mika.westerberg@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:38210 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S943177AbcJSOzC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Oct 2016 10:55:02 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>, Mika Westerberg <mika.westerberg@linux.intel.com>

This particular laptop has its motherboard replaced and after that, even
with the latest BIOS, some DMI identification strings have become
"INVALID". This includes DMI_PRODUCT_VERSION which results Wifi being
blocked.

It seems that DMI_BOARD_NAME is still valid so use that as an
alternative for Lenovo Yoga 900.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index d1a091b..d99b45e 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -933,6 +933,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 900"),
 		},
 	},
+	{
+		.ident = "Lenovo Yoga 900",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "VIUU4"),
+		},
+	},
 	{}
 };
 
-- 
2.7.4
