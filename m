From: Dmitry Tunin <hanipouspilot@gmail.com>
Subject: [PATCH v2] asus-nb-wmi: Add wapf4 quirk for X200MA
Date: Mon, 29 Jun 2015 18:35:13 +0300
Message-ID: <1435592113-14372-1-git-send-email-hanipouspilot@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f51.google.com ([209.85.215.51]:34183 "EHLO
	mail-la0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750735AbbF2PfZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Jun 2015 11:35:25 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>, Dmitry Tunin <hanipouspilot@gmail.com>, stable@vger.kernel.org

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
index 3a4951f..e8c6121 100644
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
