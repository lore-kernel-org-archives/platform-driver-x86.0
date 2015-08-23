From: =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?=
	<giedrius.statkevicius@gmail.com>
Subject: [PATCH] hp-wireless: remove unneeded goto/label in hpwl_init
Date: Sun, 23 Aug 2015 14:41:09 +0300
Message-ID: <1440330069-16537-1-git-send-email-giedrius.statkevicius@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:33537 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752100AbbHWLmS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 23 Aug 2015 07:42:18 -0400
Received: by wijp15 with SMTP id p15so53630292wij.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 23 Aug 2015 04:42:17 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>

acpi_bus_register_driver() already returns an appropriate value (0 on
success, and some negative value on error) to be used in __init functio=
ns
so the goto/label is redundant in hpwl_init thus remove it and directly
return the value

Signed-off-by: Giedrius Statkevi=C4=8Dius <giedrius.statkevicius@gmail.=
com>
---
 drivers/platform/x86/hp-wireless.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/platform/x86/hp-wireless.c b/drivers/platform/x86/=
hp-wireless.c
index 4e4cc8b..988eedb 100644
--- a/drivers/platform/x86/hp-wireless.c
+++ b/drivers/platform/x86/hp-wireless.c
@@ -114,14 +114,9 @@ static int __init hpwl_init(void)
=20
 	pr_info("Initializing HPQ6001 module\n");
 	err =3D acpi_bus_register_driver(&hpwl_driver);
-	if (err) {
+	if (err)
 		pr_err("Unable to register HP wireless control driver.\n");
-		goto error_acpi_register;
-	}
-
-	return 0;
=20
-error_acpi_register:
 	return err;
 }
=20
--=20
2.5.0
