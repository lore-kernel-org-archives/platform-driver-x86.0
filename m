From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: add Acer Extensa 5235 to video backlight vendor
Date: Wed, 18 Apr 2012 17:01:07 +0800
Message-ID: <1334739667-20398-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:54890 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751181Ab2DRJDk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 18 Apr 2012 05:03:40 -0400
Received: by vcqp1 with SMTP id p1so4729351vcq.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Apr 2012 02:03:40 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Bence Lukacs <lukacs.bence1@gmail.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

From: "Lee, Chun-Yi" <jlee@suse.com>

Acer Extensa 5235 laptop have broken _BCM implemenation, the AML
code wrote value to EC register but firmware didn't change brighenss.

Fortunately, the brightness control works on those machines with vendor mode.
So, add this machine to video backlight vendor mode quirk table.

Reference: bko#42833
	https://bugzilla.kernel.org/show_bug.cgi?id=42833

Cc: Bence Lukacs <lukacs.bence1@gmail.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index c1a3fd8..c2a237f 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -523,6 +523,14 @@ static const struct dmi_system_id video_vendor_dmi_table[] = {
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
 	{}
 };
 
-- 
1.7.7
