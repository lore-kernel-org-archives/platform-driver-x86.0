From: Oleksij Rempel <linux@rempel-privat.de>
Subject: [PATCH] acer-wmi: add video_vendor quirk for Acer Aspire E1-572
Date: Thu,  5 Dec 2013 14:00:28 +0100
Message-ID: <1386248428-5767-1-git-send-email-linux@rempel-privat.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:58204 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932215Ab3LENAm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 5 Dec 2013 08:00:42 -0500
Received: from ultralex.lan ([93.218.116.213]) by mail.gmx.com (mrgmx103) with
 ESMTPSA (Nemesis) id 0M09Ee-1VaJwi1jH2-00uL6j for
 <platform-driver-x86@vger.kernel.org>; Thu, 05 Dec 2013 14:00:40 +0100
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jlee@suse.com, matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org
Cc: Oleksij Rempel <linux@rempel-privat.de>

Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
---
 drivers/platform/x86/acer-wmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index c9076bd..d5ca1648 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -572,6 +572,14 @@ static const struct dmi_system_id video_vendor_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5750"),
 		},
 	},
+	{
+		.callback = video_set_backlight_video_vendor,
+		.ident = "Acer Aspire E1-572",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire E1-572"),
+		},
+	},
 	{}
 };
 
-- 
1.8.3.2
