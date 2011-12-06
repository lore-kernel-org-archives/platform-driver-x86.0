From: =?windows-1252?Q?Milo=9A_=8Aifalda?= <m009@sifalda.net>
Subject: [PATCH] acer-wmi: support Acer Aspire One D257 / Bluetooth and Fn+WiFi
 key
Date: Tue, 06 Dec 2011 17:08:07 +0100
Message-ID: <4EDE3DE7.2080005@sifalda.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070901060805000000070609"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kk-net.cz ([85.193.32.41]:34779 "EHLO mail.kk-net.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750846Ab1LFQbZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 6 Dec 2011 11:31:25 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.kk-net.cz (Postfix) with ESMTP id ECD1D12D703
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Dec 2011 17:08:07 +0100 (CET)
Received: from mail.kk-net.cz ([127.0.0.1])
	by localhost (maser2.kk-net.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u5N+yuOmQ4B5 for <platform-driver-x86@vger.kernel.org>;
	Tue,  6 Dec 2011 17:08:07 +0100 (CET)
Received: from aone.mesice (unknown [85.193.32.38])
	by mail.kk-net.cz (Postfix) with ESMTP id A2F2212D702
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Dec 2011 16:08:07 +0000 (UTC)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------070901060805000000070609
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hallo, I have netbook Acer Aspire One D257.
With included patch is working correctly.

Miloš Šifalda


--- linux-3.2-rc4-orig/drivers/platform/x86/acer-wmi.c    2011-12-05 
08:36:54.785008655 +0100
+++ linux-3.2-rc4/drivers/platform/x86/acer-wmi.c    2011-12-05 
09:37:20.993377824 +0100
@@ -333,6 +333,15 @@
  static struct dmi_system_id acer_quirks[] = {
      {
          .callback = dmi_matched,
+        .ident = "Acer Aspire D257",
+        .matches = {
+            DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+            DMI_MATCH(DMI_PRODUCT_NAME, "Aspire D257"),
+        },
+        .driver_data = &quirk_acer_aspire_1520,
+    },
+    {
+        .callback = dmi_matched,
          .ident = "Acer Aspire 1360",
          .matches = {
              DMI_MATCH(DMI_SYS_VENDOR, "Acer"),


--------------070901060805000000070609
Content-Type: text/plain;
 name="acer-wmi.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="acer-wmi.c.patch"

--- linux-3.2-rc4-orig/drivers/platform/x86/acer-wmi.c	2011-12-05 08:36:54.785008655 +0100
+++ linux-3.2-rc4/drivers/platform/x86/acer-wmi.c	2011-12-05 09:37:20.993377824 +0100
@@ -333,6 +333,15 @@
 static struct dmi_system_id acer_quirks[] = {
 	{
 		.callback = dmi_matched,
+		.ident = "Acer Aspire D257",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire D257"),
+		},
+		.driver_data = &quirk_acer_aspire_1520,
+	},
+	{
+		.callback = dmi_matched,
 		.ident = "Acer Aspire 1360",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),

--------------070901060805000000070609--
