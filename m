From: Namhyung Kim <namhyung@gmail.com>
Subject: [PATCH] fujitsu-laptop: fix compiler warning on pnp_ids
Date: Wed,  8 Dec 2010 00:04:14 +0900
Message-ID: <1291734254-12250-1-git-send-email-namhyung@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:49804 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750832Ab0LGPEX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Dec 2010 10:04:23 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>, Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Annotate pnp_ids as '__used' to fix following warning:

  CC      drivers/platform/x86/fujitsu-laptop.o
drivers/platform/x86/fujitsu-laptop.c:1243: warning: =E2=80=98pnp_ids=E2=
=80=99 defined but not used

Signed-off-by: Namhyung Kim <namhyung@gmail.com>
---
 drivers/platform/x86/fujitsu-laptop.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x=
86/fujitsu-laptop.c
index f44cd26..ad88b2e 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -1240,7 +1240,7 @@ MODULE_ALIAS("dmi:*:svnFUJITSUSIEMENS:*:pvr:rvnFU=
JITSU:rnFJNB1D3:*:cvrS6410:*");
 MODULE_ALIAS("dmi:*:svnFUJITSUSIEMENS:*:pvr:rvnFUJITSU:rnFJNB1E6:*:cvr=
S6420:*");
 MODULE_ALIAS("dmi:*:svnFUJITSU:*:pvr:rvnFUJITSU:rnFJNB19C:*:cvrS7020:*=
");
=20
-static struct pnp_device_id pnp_ids[] =3D {
+static struct pnp_device_id pnp_ids[] __used =3D {
 	{.id =3D "FUJ02bf"},
 	{.id =3D "FUJ02B1"},
 	{.id =3D "FUJ02E3"},
--=20
1.7.0.4
