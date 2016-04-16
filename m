From: =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?=
	<giedrius.statkevicius@gmail.com>
Subject: [PATCH] asus-laptop: correct error handling in asus_read_brightness()
Date: Sat, 16 Apr 2016 03:27:12 +0300
Message-ID: <1460766432-5390-1-git-send-email-giedrius.statkevicius@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:35049 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751581AbcDPAbe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 15 Apr 2016 20:31:34 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: corentin.chary@gmail.com, dvhart@infradead.org
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>

It is possible that acpi_evaluate_integer might fail and value would no=
t be
set to any value so correct this defect by returning 0 in case of an
error. This is also the correct thing to return because the backlight
subsystem will print the old value of brightness in this case.

Signed-off-by: Giedrius Statkevi=C4=8Dius <giedrius.statkevicius@gmail.=
com>
---
 drivers/platform/x86/asus-laptop.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/=
asus-laptop.c
index 9a69734..15f1311 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -775,8 +775,10 @@ static int asus_read_brightness(struct backlight_d=
evice *bd)
=20
 	rv =3D acpi_evaluate_integer(asus->handle, METHOD_BRIGHTNESS_GET,
 				   NULL, &value);
-	if (ACPI_FAILURE(rv))
+	if (ACPI_FAILURE(rv)) {
 		pr_warn("Error reading brightness\n");
+		return 0;
+	}
=20
 	return value;
 }
--=20
2.8.0
