From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: add 3 laptops to video backlight vendor mode quirk table
Date: Mon, 21 May 2012 23:19:51 +0800
Message-ID: <1337613591-12755-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:44304 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751003Ab2EUPXe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 May 2012 11:23:34 -0400
Received: by pbbrp8 with SMTP id rp8so7070423pbb.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 May 2012 08:23:33 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, "Christopher M. Penalver" <christopher.penalver@gmx.com>, Bence Lukacs <lukacs.bence1@gmail.com>, Joern Heissler <kernelbugs2012@joern.heissler.de>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

Acer Extensa 5235, TravelMate 5760 and Aspire 5750 laptop have broken _BCM
implemenation, the AML code wrote value to EC register but firmware didn't
change brighenss.

Fortunately, the brightness control works on those machines with vendor mode.
So, add this machine to video backlight vendor mode quirk table.

Reference: bko#36322
        https://bugzilla.kernel.org/show_bug.cgi?id=36322
Reference: bko#42833
        https://bugzilla.kernel.org/show_bug.cgi?id=42833
Reference: bko#42993
        https://bugzilla.kernel.org/show_bug.cgi?id=42993

Cc: Christopher M. Penalver <christopher.penalver@gmx.com>
Cc: Bence Lukacs <lukacs.bence1@gmail.com>
Cc: Joern Heissler <kernelbugs2012@joern.heissler.de>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index c1a3fd8..ce875dc 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -523,6 +523,30 @@ static const struct dmi_system_id video_vendor_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 4750"),
 		},
 	},
+	{
+		.callback = video_set_backlight_video_vendor,
+		.ident = "Acer Extensa 5235",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Extensa 5235"),
+		},
+	},
+	{
+		.callback = video_set_backlight_video_vendor,
+		.ident = "Acer TravelMate 5760",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 5760"),
+		},
+	},
+	{
+		.callback = video_set_backlight_video_vendor,
+		.ident = "Acer Aspire 5750",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5750"),
+		},
+	},
 	{}
 };
 
-- 
1.6.0.2
