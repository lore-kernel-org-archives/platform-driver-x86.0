From: Dmitry Tunin <hanipouspilot@gmail.com>
Subject: [PATCH] asus-nb-wmi: X200MA add wapf=4 quirk
Date: Thu, 27 Nov 2014 20:05:23 +0300
Message-ID: <547759D3.3010906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Wifi led does not follow wireless status, add quirk.

Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Tunin <hanipouspilot@gmail.com>
---
  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
  1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index c1a6cd6..9ecf466 100644
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
