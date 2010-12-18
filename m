From: Albert Astals Cid <aacid@kde.org>
Subject: Patch for drivers/platform/x86/compal-laptop.c
Date: Sat, 18 Dec 2010 20:09:57 +0000
Message-ID: <201012182009.57670.aacid@kde.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_VURDNz1w/3Akfxm"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f171.google.com ([209.85.215.171]:63523 "EHLO
	mail-ey0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932083Ab0LRUKG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 18 Dec 2010 15:10:06 -0500
Received: by eyg5 with SMTP id 5so884925eyg.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Dec 2010 12:10:04 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, platform-driver-x86@vger.kernel.org

--Boundary-00=_VURDNz1w/3Akfxm
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

*****
  Please CC me on answers i'm not subscribed to the list.
*****

Hi, this patch adds support for my compal laptop model.

I've checked the values the driver uses against 
http://ftp.compal.com/Download/NB/KHLBX/Service Manual/KHLB2_SM_PDF.pdf and 
they match and i've been using the driver for a while and it helps me with my 
fan speed problem (as i can change the fan to be controled by the OS instead 
of by the motherboard).

Albert

--Boundary-00=_VURDNz1w/3Akfxm
Content-Type: text/x-patch;
  charset="UTF-8";
  name="khlb2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="khlb2.patch"

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index 097083c..034572b 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -872,6 +872,14 @@ static struct dmi_system_id __initdata compal_dmi_table[] = {
 		},
 		.callback = dmi_check_cb_extra
 	},
+	{
+		.ident = "KHLB2",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "KHLB2"),
+			DMI_MATCH(DMI_BOARD_VERSION, "REFERENCE"),
+		},
+		.callback = dmi_check_cb_extra
+	},
 	{ }
 };
 

--Boundary-00=_VURDNz1w/3Akfxm--
