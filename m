From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 5/8] Revert "asus-wmi: Add quirk_no_rfkill for the Asus N552VW"
Date: Thu, 26 Jan 2017 10:30:10 -0500
Message-ID: <20170126153013.12753-6-jprvita@endlessm.com>
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

This reverts commit 2d735244b798f0c8bf93ace1facfafdc1f7a4e6e.

Signed-off-by: João Paulo Rechi Vita <jprvita@endlessm.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 5e088fbef5ad..3a2fb29b1bc4 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -373,15 +373,6 @@ static const struct dmi_system_id asus_quirks[] = {
 	},
 	{
 		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. N552VW",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "N552VW"),
-		},
-		.driver_data = &quirk_no_rfkill,
-	},
-	{
-		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. UX303UB",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
2.11.0
