From: Rezwanul Kabir <Rezwanul_Kabir@dell.com>
Subject: dell-laptop: Add another Dell laptop family to the DMI whitelist
Date: Wed, 23 Jun 2010 12:02:43 -0500
Message-ID: <1277312563-31921-1-git-send-email-Rezwanul_Kabir@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausc60ps301.us.dell.com ([143.166.148.206]:21355 "EHLO
	ausc60ps301.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752036Ab0FWRDB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 23 Jun 2010 13:03:01 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: mjg59@srcf.ucam.org, Rezwanul_Kabir@dell.com

This is to support Precision M4500 and others.

Signed-off-by: Rezwanul Kabir <Rezwanul_Kabir@dell.com>
---

diff -urNp a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
--- a/drivers/platform/x86/dell-laptop.c	2010-06-22 19:58:03.889177921 -0500
+++ b/drivers/platform/x86/dell-laptop.c	2010-06-22 20:00:38.199933620 -0500
@@ -83,6 +83,12 @@ static const struct dmi_system_id __init
 		},
 	},
 	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_CHASSIS_TYPE, "9"), /*Laptop*/
+		},
+	},
+	{
 		.ident = "Dell Computer Corporation",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
@@ -621,4 +627,5 @@ MODULE_AUTHOR("Matthew Garrett <mjg@redh
 MODULE_DESCRIPTION("Dell laptop driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("dmi:*svnDellInc.:*:ct8:*");
+MODULE_ALIAS("dmi:*svnDellInc.:*:ct9:*");
 MODULE_ALIAS("dmi:*svnDellComputerCorporation.:*:ct8:*");
