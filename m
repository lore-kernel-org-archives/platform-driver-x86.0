From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH v2 14/15] drivers/x86: mark const init data with __initconst instead of __initdata
Date: Fri, 30 Mar 2012 22:05:04 +0200
Message-ID: <1333137905-13809-14-git-send-email-u.kleine-koenig@pengutronix.de>
References: <20120330200358.GV15647@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:53511 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934665Ab2C3UFq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 30 Mar 2012 16:05:46 -0400
In-Reply-To: <20120330200358.GV15647@pengutronix.de>
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
changes since (implict) v1:
 - drop wrong changes to drivers/platform/x86/thinkpad_acpi.c

 drivers/platform/x86/dell-laptop.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
--=20
1.7.9.5
