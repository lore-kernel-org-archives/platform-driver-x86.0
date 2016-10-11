From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH] ideapad-laptop: Add Lenovo Yoga 910-13IKB to no_hw_rfkill dmi list
Date: Tue, 11 Oct 2016 19:28:02 -0400
Message-ID: <1476228482-2823-1-git-send-email-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ike.pan@canonical.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, masneyb@onstation.org
List-Id: platform-driver-x86.vger.kernel.org

The Lenovo Yoga 910-13IKB does not have a hw rfkill switch, and trying
to read the hw rfkill switch through the ideapad module causes it to
always report as blocked.

This commit adds the Lenovo Yoga 910-13IKB to the no_hw_rfkill dmi list,
fixing the WiFI breakage.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index d1a091b..a232394 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -933,6 +933,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 900"),
 		},
 	},
+	{
+		.ident = "Lenovo YOGA 910-13IKB",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 910-13IKB"),
+		},
+	},
 	{}
 };
 
-- 
2.7.4
