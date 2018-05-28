From: dylanchu <chdy.uuid@gmail.com>
Subject: [PATCH] ideapad-laptop: Add E42-80 to no_hw_rfkill
Date: Mon, 28 May 2018 19:44:48 +0800
Message-ID: <20180528114448.11710-1-chdy.uuid@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ike.pan@canonical.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, dylanchu <chdy.uuid@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Lenovo Zhaoyang E42-80 is another Lenovo model without
a hw rfkill switch, resulting in wifi always reported
as hard blocked.

Add the model to the list of models without rfkill switch.

Signed-off-by: dylanchu <chdy.uuid@gmail.com>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 535199c9e6bc..6fdd70373ed3 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1163,6 +1163,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 920-13IKB"),
 		},
 	},
+	{
+		.ident = "Lenovo Zhaoyang E42-80",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "ZHAOYANG E42-80"),
+		},
+	},
 	{}
 };

--
2.17.0
