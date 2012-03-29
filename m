From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH 16/17] drivers/x86: mark const init data with __initconst instead of __initdata
Date: Thu, 29 Mar 2012 23:12:33 +0200
Message-ID: <1333055554-31300-16-git-send-email-u.kleine-koenig@pengutronix.de>
References: <20120329211131.GA31250@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:33799 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933924Ab2C2VM6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 29 Mar 2012 17:12:58 -0400
In-Reply-To: <20120329211131.GA31250@pengutronix.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel@pengutronix.de, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net

As long as there is no other non-const variable marked __initdata in th=
e
same compilation unit it doesn't hurt. If there were one however
compilation would fail with

	error: $variablename causes a section type conflict

because a section containing const variables is marked read only and so
cannot contain non-const variables.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org
Cc: ibm-acpi-devel@lists.sourceforge.net
---
 drivers/platform/x86/dell-laptop.c   |    2 +-
 drivers/platform/x86/thinkpad_acpi.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index a05fc9c..882bfa4 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -94,7 +94,7 @@ static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
 static struct rfkill *wwan_rfkill;
=20
-static const struct dmi_system_id __initdata dell_device_table[] =3D {
+static const struct dmi_system_id dell_device_table[] __initconst =3D =
{
 	{
 		.ident =3D "Dell laptop",
 		.matches =3D {
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x8=
6/thinkpad_acpi.c
index d68c000..dc1900c 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -522,7 +522,7 @@ static acpi_handle ec_handle;
=20
 #define TPACPI_HANDLE(object, parent, paths...)			\
 	static acpi_handle  object##_handle;			\
-	static const acpi_handle *object##_parent __initdata =3D	\
+	static const acpi_handle *object##_parent __initconst =3D	\
 						&parent##_handle; \
 	static char *object##_paths[] __initdata =3D { paths }
=20
--=20
1.7.9.1
