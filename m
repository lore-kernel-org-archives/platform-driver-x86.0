From: =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?=
	<giedrius.statkevicius@gmail.com>
Subject: [PATCH v2 1/2] asus-laptop: remove redundant initializers
Date: Sat, 16 Apr 2016 03:01:56 +0300
Message-ID: <1460764917-1042-1-git-send-email-giedrius.statkevicius@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35303 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751921AbcDPACn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 15 Apr 2016 20:02:43 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: corentin.chary@gmail.com, dvhart@infradead.org
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>

Initializing rv to AE_OK is pointless because later function results ar=
e
assigned to them and only then the variable is used

Signed-off-by: Giedrius Statkevi=C4=8Dius <giedrius.statkevicius@gmail.=
com>
---
 drivers/platform/x86/asus-laptop.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/=
asus-laptop.c
index f2b5d0a..d86d42e 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -771,7 +771,7 @@ static int asus_read_brightness(struct backlight_de=
vice *bd)
 {
 	struct asus_laptop *asus =3D bl_get_data(bd);
 	unsigned long long value;
-	acpi_status rv =3D AE_OK;
+	acpi_status rv;
=20
 	rv =3D acpi_evaluate_integer(asus->handle, METHOD_BRIGHTNESS_GET,
 				   NULL, &value);
@@ -865,7 +865,7 @@ static ssize_t infos_show(struct device *dev, struc=
t device_attribute *attr,
 	int len =3D 0;
 	unsigned long long temp;
 	char buf[16];		/* enough for all info */
-	acpi_status rv =3D AE_OK;
+	acpi_status rv;
=20
 	/*
 	 * We use the easy way, we don't care of off and count,
@@ -1265,7 +1265,7 @@ static DEVICE_ATTR_RO(ls_value);
 static int asus_gps_status(struct asus_laptop *asus)
 {
 	unsigned long long status;
-	acpi_status rv =3D AE_OK;
+	acpi_status rv;
=20
 	rv =3D acpi_evaluate_integer(asus->handle, METHOD_GPS_STATUS,
 				   NULL, &status);
--=20
2.8.0
