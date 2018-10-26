From: Misha Komarovskiy <zombah@gmail.com>
Subject: [PATCH] platform/x86: ideapad: Add Y530-15ICH to no_hw_rfkill
Date: Sat, 27 Oct 2018 02:07:23 +0300
Message-ID: <20181026230723.12215-1-zombah@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: zombah@gmail.com, Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Lenovo Legion Y530-15ICH is another model without
hardware radio switch. Add it to no_hw_rfkill to
enable wireless.

Signed-off-by: Misha Komarovskiy <zombah@gmail.com>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index f856d59361f2..b6489cba2985 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1147,6 +1147,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 		},
 	},
 	{
+		.ident = "Lenovo Legion Y530-15ICH",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Legion Y530-15ICH"),
+		},
+	},
+	{
 		.ident = "Lenovo Legion Y720-15IKB",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
2.13.7
