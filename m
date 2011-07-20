From: Thomas Courbon <thcourbon@gmail.com>
Subject: [PATCH 1/1] Platform: fix samsung-laptop DMI identification for N150/N210/220/N230
Date: Wed, 20 Jul 2011 22:57:44 +0200
Message-ID: <1311195464-12605-1-git-send-email-thcourbon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f52.google.com ([209.85.161.52]:42631 "EHLO
	mail-fx0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751309Ab1GTU6l (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 20 Jul 2011 16:58:41 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Courbon <thcourbon@gmail.com>

Some samsung latop of the N150/N2{10,20,30} serie are badly detected by=
 the samsung-laptop platform driver, see bug # 36082.
It appears that N230 identifies itself as N150/N210/N220/N230 whereas t=
he other identify themselves as N150/N210/220.
This patch attemtp fix #36082 allowing correct identification for all t=
he said netbook model.

Reported-by: Daniel Ekl=C3=B6f <daniel@ekloef.se>
Signed-off-by: Thomas Courbon <thcourbon@gmail.com>
---
 drivers/platform/x86/samsung-laptop.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x=
86/samsung-laptop.c
index d347116..bd61898 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -601,6 +601,16 @@ static struct dmi_system_id __initdata samsung_dmi=
_table[] =3D {
 		.callback =3D dmi_check_cb,
 	},
 	{
+		.ident =3D "N150/N210/N220",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR,
+					"SAMSUNG ELECTRONICS CO., LTD."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "N150/N210/N220"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150/N210/N220"),
+		},
+		.callback =3D dmi_check_cb,
+	},
+	{
 		.ident =3D "N150/N210/N220/N230",
 		.matches =3D {
 			DMI_MATCH(DMI_SYS_VENDOR,
--=20
1.7.6
