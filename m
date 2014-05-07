From: Andreas Utterberg <andreas.utterberg@thundera.se>
Subject: [PATCH] asus-nb-wmi: set wapf=4 for ASUSTeK COMPUTER INC. X75VBP
 & X550CA
Date: Wed, 07 May 2014 22:36:03 +0200
Message-ID: <536A9933.9010905@thundera.se>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010507040206030807050504"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from csmtp3.one.com ([91.198.169.23]:51963 "EHLO csmtp3.one.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751722AbaEGUmY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 7 May 2014 16:42:24 -0400
Received: from localhost.localdomain (c-3e53e155.414-3-64736c11.cust.bredbandsbolaget.se [85.225.83.62])
	by csmtp3.one.com (Postfix) with ESMTPA id CFB044001347A
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2014 20:36:05 +0000 (UTC)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------010507040206030807050504
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------010507040206030807050504
Content-Type: text/x-patch;
 name="0001-WAPF-4-for-ASUSTeK-COMPUTER-INC.-X75VBP-WLAN-ON.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-WAPF-4-for-ASUSTeK-COMPUTER-INC.-X75VBP-WLAN-ON.patch"

From 94ca7b44983b309fbb343f30758ba414280a0aee Mon Sep 17 00:00:00 2001
From: Andreas Utterberg <andreas.utterberg@thundera.se>
Date: Tue, 6 May 2014 22:27:45 +0200
Subject: [PATCH] WAPF 4 for ASUSTeK COMPUTER INC. X550CA WLAN ON.

The 'asus-nb-wmi' WAPF parameter must be set to 4, so the internal Wireless LAN device is operational.

Signed-off-by: Andreas Utterberg <andreas.utterberg@thundera.se>
---
 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 563f59e..ddf0eef 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -137,6 +137,15 @@ static struct dmi_system_id asus_quirks[] = {
 	},
 	{
 		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X550CA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X550CA"),
+		},
+		.driver_data = &quirk_asus_x401u,
+	},
+	{
+		.callback = dmi_matched,
 		.ident = "ASUSTeK COMPUTER INC. X55A",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
1.9.0

--------------010507040206030807050504--
