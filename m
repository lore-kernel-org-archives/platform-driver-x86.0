From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] compal-laptop: switch to using use MODULE_DEVICE_TABLE
Date: Mon, 14 Nov 2011 00:25:54 -0800
Message-ID: <1321259154-10488-1-git-send-email-dmitry.torokhov@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:55974 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752507Ab1KNIZ6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Nov 2011 03:25:58 -0500
Received: by gyc15 with SMTP id 15so4637616gyc.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Nov 2011 00:25:57 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>

Use MODULE_DEVCE_TABLE instead of rolling MODULE_ALIAS by hand.

Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---
 drivers/platform/x86/compal-laptop.c |   14 +-------------
 1 files changed, 1 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index 8877b83..9d96de6 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -882,6 +882,7 @@ static struct dmi_system_id __initdata compal_dmi_table[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(dmi, compal_dmi_table);
 
 static void initialize_power_supply_data(struct compal_data *data)
 {
@@ -1097,16 +1098,3 @@ MODULE_AUTHOR("Roald Frederickx (roald.frederickx@gmail.com)");
 MODULE_DESCRIPTION("Compal Laptop Support");
 MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL");
-
-MODULE_ALIAS("dmi:*:rnIFL90:rvrIFT00:*");
-MODULE_ALIAS("dmi:*:rnIFL90:rvrREFERENCE:*");
-MODULE_ALIAS("dmi:*:rnIFL91:rvrIFT00:*");
-MODULE_ALIAS("dmi:*:rnJFL92:rvrIFT00:*");
-MODULE_ALIAS("dmi:*:rnIFT00:rvrIFT00:*");
-MODULE_ALIAS("dmi:*:rnJHL90:rvrREFERENCE:*");
-MODULE_ALIAS("dmi:*:svnDellInc.:pnInspiron910:*");
-MODULE_ALIAS("dmi:*:svnDellInc.:pnInspiron1010:*");
-MODULE_ALIAS("dmi:*:svnDellInc.:pnInspiron1011:*");
-MODULE_ALIAS("dmi:*:svnDellInc.:pnInspiron1012:*");
-MODULE_ALIAS("dmi:*:svnDellInc.:pnInspiron1110:*");
-MODULE_ALIAS("dmi:*:svnDellInc.:pnInspiron1210:*");
-- 
1.7.6.4
