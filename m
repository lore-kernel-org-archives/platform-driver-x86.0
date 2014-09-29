From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH] dell-smo8800: Add more acpi ids and change description of driver
Date: Mon, 29 Sep 2014 14:45:48 +0200
Message-ID: <1411994748-11229-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:59424 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752182AbaI2MqC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Sep 2014 08:46:02 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
 drivers/platform/x86/Kconfig        |    4 ++--
 drivers/platform/x86/dell-smo8800.c |   10 ++++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
index 3bbcbf1..ba9ee4f 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -128,10 +128,10 @@ config DELL_WMI_AIO
 	  be called dell-wmi-aio.
=20
 config DELL_SMO8800
-	tristate "Dell Latitude freefall driver (ACPI SMO8800/SMO8810)"
+	tristate "Dell Latitude freefall driver (ACPI SMO88XX)"
 	depends on ACPI
 	---help---
-	  Say Y here if you want to support SMO8800/SMO8810 freefall device
+	  Say Y here if you want to support SMO88XX freefall device
 	  on Dell Latitude laptops.
=20
 	  To compile this driver as a module, choose M here: the module will
diff --git a/drivers/platform/x86/dell-smo8800.c b/drivers/platform/x86=
/dell-smo8800.c
index a653716..0aec4fd 100644
--- a/drivers/platform/x86/dell-smo8800.c
+++ b/drivers/platform/x86/dell-smo8800.c
@@ -1,5 +1,5 @@
 /*
- *  dell-smo8800.c - Dell Latitude ACPI SMO8800/SMO8810 freefall senso=
r driver
+ *  dell-smo8800.c - Dell Latitude ACPI SMO88XX freefall sensor driver
  *
  *  Copyright (C) 2012 Sonal Santan <sonal.santan@gmail.com>
  *  Copyright (C) 2014 Pali Roh=C3=A1r <pali.rohar@gmail.com>
@@ -209,7 +209,13 @@ static int smo8800_remove(struct acpi_device *devi=
ce)
=20
 static const struct acpi_device_id smo8800_ids[] =3D {
 	{ "SMO8800", 0 },
+	{ "SMO8801", 0 },
 	{ "SMO8810", 0 },
+	{ "SMO8811", 0 },
+	{ "SMO8820", 0 },
+	{ "SMO8821", 0 },
+	{ "SMO8830", 0 },
+	{ "SMO8831", 0 },
 	{ "", 0 },
 };
=20
@@ -228,6 +234,6 @@ static struct acpi_driver smo8800_driver =3D {
=20
 module_acpi_driver(smo8800_driver);
=20
-MODULE_DESCRIPTION("Dell Latitude freefall driver (ACPI SMO8800/SMO881=
0)");
+MODULE_DESCRIPTION("Dell Latitude freefall driver (ACPI SMO88XX)");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Sonal Santan, Pali Roh=C3=A1r");
--=20
1.7.9.5
