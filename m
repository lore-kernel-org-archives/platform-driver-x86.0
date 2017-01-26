From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 4/8] Revert "asus-wmi: Add quirk_no_rfkill for the Asus U303LB"
Date: Thu, 26 Jan 2017 10:30:09 -0500
Message-ID: <20170126153013.12753-5-jprvita@endlessm.com>
References: <20170126153013.12753-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:35046 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752635AbdAZPbQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Jan 2017 10:31:16 -0500
In-Reply-To: <20170126153013.12753-1-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

This reverts commit 02db9ff7af18f7ace60f430cbbaa1d846b350916.

Signed-off-by: João Paulo Rechi Vita <jprvita@endlessm.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 9d686d642934..5e088fbef5ad 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -382,15 +382,6 @@ static const struct dmi_system_id asus_quirks[] = {
 	},
 	{
 		.callback = dmi_matched,
-		.ident = "ASUSTeK COMPUTER INC. U303LB",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "U303LB"),
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
