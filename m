From: Andreas Utterberg <andreas.utterberg@thundera.se>
Subject: [PATCH] asus-nb-wmi: set wapf=4 for ASUSTeK COMPUTER INC. X75VBP
 & X550CA
Date: Wed, 07 May 2014 21:48:10 +0200
Message-ID: <536A8DFA.40906@thundera.se>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080805040808040800060203"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from csmtp5.one.com ([195.47.247.105]:41319 "EHLO csmtp5.one.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750793AbaEGTsN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 7 May 2014 15:48:13 -0400
Received: from localhost.localdomain (c-3e53e155.414-3-64736c11.cust.bredbandsbolaget.se [85.225.83.62])
	by csmtp5.one.com (Postfix) with ESMTPA id 6A0FB40000B40
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2014 19:48:11 +0000 (UTC)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------080805040808040800060203
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------080805040808040800060203
Content-Type: text/x-patch;
 name="0001-WAPF-4-for-ASUSTeK-COMPUTER-INC.-X75VBP-WLAN-ON.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-WAPF-4-for-ASUSTeK-COMPUTER-INC.-X75VBP-WLAN-ON.patch"

From d39d3460f1ab36365a48b6815dd9a5d26613d3ec Mon Sep 17 00:00:00 2001
From: poma <pomidorabelisima@gmail.com>
Date: Tue, 6 May 2014 22:03:38 +0200
Subject: [PATCH] WAPF 4 for ASUSTeK COMPUTER INC. X75VBP WLAN ON.

The 'asus-nb-wmi' WAPF parameter must be set to 4, so the internal Wireless LAN device is operational.

Signed-off-by: poma <pomidorabelisima@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 563f59e..674793d 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -182,6 +182,15 @@ static struct dmi_system_id asus_quirks[] = {
 	},
 	{
 		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X75VBP",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X75VBP"),
+		},
+		.driver_data = &quirk_asus_x401u,
+	},
+	{
+		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. 1015E",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
1.9.0



--------------080805040808040800060203--
