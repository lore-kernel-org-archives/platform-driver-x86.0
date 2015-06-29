From: Dmitry Tunin <hanipouspilot@gmail.com>
Subject: [RESEND] asus-nb-wmi: Add wapf4 quirk for X200MA
Date: Mon, 29 Jun 2015 18:29:45 +0300
Message-ID: <1435591785-14133-1-git-send-email-hanipouspilot@gmail.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Darren Hart <dvhart@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Dmitry Tunin <hanipouspilot@gmail.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Wireless is not blocked without this quirk, but
wireless LED does not follow wireless status.
With this quirk it accurately reflects if wireless is on or off.

Signed-off-by: Dmitry Tunin <hanipouspilot@gmail.com>
Acked-by: Corentin Chary <corentin.chary@gmail.com>
Cc: stable@vger.kernel.org
---
 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 3a4951f..4b1c13d 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -104,6 +104,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		.ident = "ASUSTeK COMPUTER INC. X401U",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X200MA"),
+		},
+		.driver_data = &quirk_asus_wapf4,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X401U",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X401U"),
 		},
 		.driver_data = &quirk_asus_x55u,
-- 
1.9.1
