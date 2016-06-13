From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 5/7] asus-wmi: Add quirk_no_rfkill for the Asus Z550MA
Date: Mon, 13 Jun 2016 16:57:34 -0400
Message-ID: <1465851456-1421-6-git-send-email-jprvita@endlessm.com>
References: <1465851456-1421-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:35392 "EHLO
	mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161183AbcFMU5r (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Jun 2016 16:57:47 -0400
In-Reply-To: <1465851456-1421-1-git-send-email-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

The Asus Z550MA has an airplane-mode indicator LED and the WMI WLAN use=
r
bit set, so asus-wmi uses ASUS_WMI_DEVID_WLAN_LED (0x00010002) to store
the wlan state, which has a side-effect of driving the airplane mode
indicator LED in an inverted fashion. quirk_no_rfkill prevents asus-wmi
from registering RFKill switches at all for this laptop and allows
asus-wireless to drive the LED through the ASHS ACPI device.

Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
Reported-by: Ming Shuo Chiu <chiu@endlessm.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/=
asus-nb-wmi.c
index efae467..7b5c444 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -337,6 +337,15 @@ static const struct dmi_system_id asus_quirks[] =3D=
 {
 		},
 		.driver_data =3D &quirk_no_rfkill,
 	},
+	{
+		.callback =3D dmi_matched,
+		.ident =3D "ASUSTeK COMPUTER INC. Z550MA",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Z550MA"),
+		},
+		.driver_data =3D &quirk_no_rfkill,
+	},
 	{},
 };
=20
--=20
2.5.0
