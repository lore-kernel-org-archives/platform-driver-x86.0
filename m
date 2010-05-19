From: Daniel Mack <daniel@caiaq.de>
Subject: [PATCH] drivers/platform/x86/eeepc-wmi.c: fix build warning
Date: Wed, 19 May 2010 12:37:01 +0200
Message-ID: <1274265421-26747-1-git-send-email-daniel@caiaq.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from buzzloop.caiaq.de ([212.112.241.133]:38360 "EHLO
	buzzloop.caiaq.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757404Ab0ESKhk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 19 May 2010 06:37:40 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Daniel Mack <daniel@caiaq.de>, Matthew Garrett <mjg@redhat.com>, Yong Wang <yong.y.wang@intel.com>, Corentin Chary <corentincj@iksaif.net>, Dmitry Torokhov <dtor@mail.ru>, Tejun Heo <tj@kernel.org>, platform-driver-x86@vger.kernel.org

drivers/platform/x86/eeepc-wmi.c: In function =E2=80=98eeepc_wmi_notify=
=E2=80=99:
drivers/platform/x86/eeepc-wmi.c:209: warning: =E2=80=98new=E2=80=99 ma=
y be used uninitialized in this function
drivers/platform/x86/eeepc-wmi.c:209: note: =E2=80=98new=E2=80=99 was d=
eclared here

Signed-off-by: Daniel Mack <daniel@caiaq.de>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Yong Wang <yong.y.wang@intel.com>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Tejun Heo <tj@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
---
 drivers/platform/x86/eeepc-wmi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/ee=
epc-wmi.c
index b227eb4..9dc50fb 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -206,7 +206,7 @@ static int eeepc_wmi_backlight_notify(struct eeepc_=
wmi *eeepc, int code)
 {
 	struct backlight_device *bd =3D eeepc->backlight_device;
 	int old =3D bd->props.brightness;
-	int new;
+	int new =3D old;
=20
 	if (code >=3D NOTIFY_BRNUP_MIN && code <=3D NOTIFY_BRNUP_MAX)
 		new =3D code - NOTIFY_BRNUP_MIN + 1;
--=20
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
