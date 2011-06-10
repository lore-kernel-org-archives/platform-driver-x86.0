From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] msi-laptop: add MSI U270 netbook to module alias and scm list
Date: Fri, 10 Jun 2011 15:24:26 +0800
Message-ID: <1307690666-8047-1-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:57974 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753578Ab1FJH0g (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 10 Jun 2011 03:26:36 -0400
Received: by gxk21 with SMTP id 21so1476790gxk.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2011 00:26:36 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

After test, msi-laptop driver also can support MSI U270 netbook.
So, add MSI U270's dmi information to module alias and scm table
for support this machine.

Tested on MSI U270 netbook.

Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 drivers/platform/x86/msi-laptop.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index d7213e4..1695c4f 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -538,6 +538,15 @@ static struct dmi_system_id __initdata msi_load_scm_models_dmi_table[] = {
 		},
 		.callback = dmi_check_cb
 	},
+	{
+		.ident = "MSI U270",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+				"Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "U270 series"),
+		},
+		.callback = dmi_check_cb
+	},
 	{ }
 };
 
@@ -996,3 +1005,4 @@ MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N034:*");
 MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N051:*");
 MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N014:*");
 MODULE_ALIAS("dmi:*:svnMicro-StarInternational*:pnCR620:*");
+MODULE_ALIAS("dmi:*:svnMicro-StarInternational*:pnU270series:*");
-- 
1.6.0.2
