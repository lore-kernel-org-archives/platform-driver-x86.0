From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 2/8] Revert "asus-wmi: Add quirk_no_rfkill_wapf4 for the Asus X456UF"
Date: Thu, 26 Jan 2017 10:30:07 -0500
Message-ID: <20170126153013.12753-3-jprvita@endlessm.com>
References: <20170126153013.12753-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170126153013.12753-1-jprvita@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

This reverts commit a961a285b479977fa21f12f71cd62f28adaba17c.

Signed-off-by: João Paulo Rechi Vita <jprvita@endlessm.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 6079510eaa29..5bf1dd225788 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -107,11 +107,6 @@ static struct quirk_entry quirk_no_rfkill = {
 	.no_rfkill = true,
 };
 
-static struct quirk_entry quirk_no_rfkill_wapf4 = {
-	.wapf = 4,
-	.no_rfkill = true,
-};
-
 static struct quirk_entry quirk_asus_ux303ub = {
 	.wmi_backlight_native = true,
 };
@@ -203,7 +198,7 @@ static const struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X456UF"),
 		},
-		.driver_data = &quirk_no_rfkill_wapf4,
+		.driver_data = &quirk_asus_wapf4,
 	},
 	{
 		.callback = dmi_matched,
-- 
2.11.0
