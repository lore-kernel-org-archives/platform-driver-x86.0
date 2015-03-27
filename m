From: vieille.bertrand@free.fr
Subject: Re: [PATCH] hp-wmi: limit hotkey enable
Date: Fri, 27 Mar 2015 21:17:34 +0100 (CET)
Message-ID: <53828628.149912606.1427487454694.JavaMail.root@zimbra50-e8.priv.proxad.net>
References: <1427481191-4475-1-git-send-email-kvans32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp3-g21.free.fr ([212.27.42.3]:35180 "EHLO smtp3-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752645AbbC0URg convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 27 Mar 2015 16:17:36 -0400
In-Reply-To: <1427481191-4475-1-git-send-email-kvans32@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Aaron Lu <aaron.lu@intel.com>, Kyle Evans <kvans32@gmail.com>

Patch successfully tested on my HP6510b with 3.19.3 kernel.
Thanks

Bertrand Vieille

----- Mail original -----
De: "Kyle Evans" <kvans32@gmail.com>
=C3=80: "Aaron Lu" <aaron.lu@intel.com>, platform-driver-x86@vger.kerne=
l.org, "Bertrand Vieille" <vieille.bertrand@free.Fr>
Cc: "Kyle Evans" <kvans32@gmail.com>
Envoy=C3=A9: Vendredi 27 Mars 2015 19:33:11
Objet: [PATCH] hp-wmi: limit hotkey enable

Do not attempt to initialize hotkeys if the query returns a value.
=46urthermore, do not write initialize magic on systems that do not hav=
e
feature query 0xb.

Signed-off-by: Kyle Evans <kvans32@gmail.com>
---
 drivers/platform/x86/hp-wmi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wm=
i.c
index 0ab2b37..4a4d6e3 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -54,6 +54,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E=
4");
 #define HPWMI_HARDWARE_QUERY 0x4
 #define HPWMI_WIRELESS_QUERY 0x5
 #define HPWMI_BIOS_QUERY 0x9
+#define HPWMI_FEATURE2_QUERY 0xb
 #define HPWMI_HOTKEY_QUERY 0xc
 #define HPWMI_FEATURE_QUERY 0xd
 #define HPWMI_WIRELESS2_QUERY 0x1b
@@ -309,10 +310,18 @@ static int __init hp_wmi_bios_2009_later(void)
 static int hp_wmi_enable_hotkeys(void)
 {
 	int ret;
-	int query =3D 0x6e;
+	int query;
+	int value =3D 0x6e;
=20
-	ret =3D hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &query, sizeof(quer=
y),
-				   0);
+	ret =3D hp_wmi_perform_query(HPWMI_BIOS_QUERY, 0, &query,
+				   0, sizeof(query));
+
+	if (!ret && !query) {
+		if (!hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, 0, &query,
+					  0, sizeof(query)))
+		    ret =3D hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &value,
+					       sizeof(value), 0);
+	}
=20
 	if (ret)
 		return -EINVAL;
--=20
1.8.5.5
