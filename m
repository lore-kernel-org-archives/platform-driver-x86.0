From: Loic WEI YU NENG <loic.wyn@gmail.com>
Subject: [PATCH] ideapad-laptop: Add Lenovo Yoga 2 13 to the no_hw_rfkill DMI list
Date: Wed, 14 Nov 2018 07:12:12 -0800
Message-ID: <20181114151212.20942-1-loic.wyn@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, andy.shevchenko@gmail.com, ike.pan@canonical.com, andy@infradead.org, trivial@kernel.org, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Cc: Loic WEI YU NENG <loic.wyn@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Some Lenovo ideapad models lack a physical rfkill switch.
On Lenovo models Yoga 2 13, ideapad-laptop would wrongly report all
radios as blocked by hardware which caused wireless network connections
to fail.
Add these models without an rfkill switch to the no_hw_rfkill list.

Signed-off-by: Loic WEI YU NENG <loic.wyn@gmail.com>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index b6489cba2985..1589dffab9fa 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1188,6 +1188,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "Yoga2"),
 		},
 	},
+	{
+		.ident = "Lenovo Yoga 2 13",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Yoga 2 13"),
+		},
+	},
 	{
 		.ident = "Lenovo Yoga 3 1170 / 1470",
 		.matches = {
-- 
2.17.1
