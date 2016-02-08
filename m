From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 4/5] asus-wmi: Add quirk_no_rfkill for the Asus U303LB
Date: Mon,  8 Feb 2016 12:05:22 -0500
Message-ID: <1454951123-27470-5-git-send-email-jprvita@endlessm.com>
References: <1454951123-27470-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454951123-27470-1-git-send-email-jprvita@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
Reported-by: Mousou Yuu <guogaishiwo@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/=
asus-nb-wmi.c
index 86c0ae6..4ded187 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -319,6 +319,15 @@ static const struct dmi_system_id asus_quirks[] =3D=
 {
 		},
 		.driver_data =3D &quirk_no_rfkill,
 	},
+	{
+		.callback =3D dmi_matched,
+		.ident =3D "ASUSTeK COMPUTER INC. U303LB",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "U303LB"),
+		},
+		.driver_data =3D &quirk_no_rfkill,
+	},
 	{},
 };
=20
--=20
2.5.0
