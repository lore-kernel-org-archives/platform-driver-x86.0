From: John Dahlstrom <jodarom@SDF.ORG>
Subject: [PATCH][RESEND] ideapad-laptop: Add Lenovo ideapad Y700 Touch-15ISK
 and Lenovo ideapad Y700-15ISK to the no_hw_rfkill DMI list
Date: Wed, 17 Feb 2016 05:55:49 -0600 (CST)
Message-ID: <Pine.NEB.4.64.1602170529490.2123@faeroes.freeshell.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx.sdf.org ([192.94.73.23]:60290 "EHLO sdf.lonestar.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S933854AbcBQL4O (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 06:56:14 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Some Lenovo ideapad models lack a physical rfkill switch.
On Lenovo models ideapad Y700 Touch-15ISK and ideapad Y700-15ISK,
ideapad-laptop would wrongly report all radios as blocked by
hardware which caused wireless network connections to fail.

Add these models without an rfkill switch to the no_hw_rfkill list.

Relevant kernel versions: 4.5-rc4, 4.4.1, 4.3.5, 4.1.18, 3.18.27

Tested-by: John Dahlstrom <jodarom@sdf.org>
Signed-off-by: John Dahlstrom <jodarom@sdf.org>
---

--- a/drivers/platform/x86/ideapad-laptop.c	2016-02-14 15:05:20.000000000 -0600
+++ b/drivers/platform/x86/ideapad-laptop.c	2016-02-16 03:54:48.484423725 -0600
@@ -864,4 +864,18 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo G50-30"),
 		},
+ 	},
+ 	{
+		.ident = "Lenovo ideapad Y700-15ISK",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700-15ISK"),
+		},
+	},
+	{
+		.ident = "Lenovo ideapad Y700 Touch-15ISK",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700 Touch-15ISK"),
+		},
 	},
 	{
