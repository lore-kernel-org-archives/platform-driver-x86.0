From: Dmitry Tunin <hanipouspilot@gmail.com>
Subject: [PATCH] asus-nb-wmi: Add wapf4 quirk for X200MA
Date: Fri, 29 May 2015 23:14:43 +0300
Message-ID: <1432930483-16861-1-git-send-email-hanipouspilot@gmail.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@linux.intel.com>, Dmitry Tunin <hanipouspilot@gmail.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Wireless is not blocked without this quirk, but
wireless LED does not follow wireless status.
With this quirk it accurately reflects if wireless is on or off.

Signed-off-by: Dmitry Tunin <hanipouspilot@gmail.com>
Cc: stable@vger.kernel.org
---
 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index abdaed3..bc86a71 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -101,6 +101,15 @@ static const struct dmi_system_id asus_quirks[] = {
 	},
 	{
 		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X200MA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X200MA"),
+		},
+		.driver_data = &quirk_asus_wapf4,
+	},
+	{
+		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. X401U",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
1.9.1
