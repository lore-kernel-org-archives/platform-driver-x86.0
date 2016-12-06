From: velemas <velemas@gmail.com>
Subject: [PATCH 1/1] ideapad-laptop: Add ideapad Y700 15-ACZ to the
 no_hw_rfkill DMI list
Date: Tue, 6 Dec 2016 22:17:43 +0300
Message-ID: <20161206221743.357426a0@fazafaka>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wj0-f194.google.com ([209.85.210.194]:33372 "EHLO
        mail-wj0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751895AbcLFTSA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Dec 2016 14:18:00 -0500
Received: by mail-wj0-f194.google.com with SMTP id kp2so45693642wjc.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Dec 2016 11:18:00 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ike.pan@canonical.com
Cc: platform-driver-x86@vger.kernel.org

Like other Y700 models Lenovo Y700 15-ACZ does not have a physical rfkill switch.
ideapad-laptop wrongly reports all radios as blocked by hardware which causes 
wireless network connections to fail.

Add this model without an rfkill switch to the no_hw_rfkill list.

Signed-off-by: Artiom Vaskov <velemas@gmail.com>
---
--- a/drivers/platform/x86/ideapad-laptop.c     2016-10-03 02:24:33.000000000 +0300
+++ b/drivers/platform/x86/ideapad-laptop.c     2016-11-24 23:02:08.108870266 +0300
@@ -870,6 +870,13 @@ static const struct dmi_system_id no_hw_
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo G50-30"),
 		},
 	},
+	{
+		.ident = "Lenovo ideapad Y700-15ACZ",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700-15ACZ"),
+		},
+	},
 	{
 		.ident = "Lenovo ideapad Y700-15ISK",
 		.matches = {
