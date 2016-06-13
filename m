From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 7/7] asus-wmi: Add quirk_no_rfkill_wapf4 for the Asus X456UA
Date: Mon, 13 Jun 2016 16:57:36 -0400
Message-ID: <1465851456-1421-8-git-send-email-jprvita@endlessm.com>
References: <1465851456-1421-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465851456-1421-1-git-send-email-jprvita@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

The Asus X456UA has an airplane-mode indicator LED and the WMI WLAN use=
r
bit set, so asus-wmi uses ASUS_WMI_DEVID_WLAN_LED (0x00010002) to store
the wlan state, which has a side-effect of driving the airplane mode
indicator LED in an inverted fashion.

quirk_no_rfkill prevents asus-wmi from registering RFKill switches at
all for this laptop and allows asus-wireless to drive the LED through
the ASHS ACPI device.  This laptop already has a quirk for setting
WAPF=3D4, so this commit creates a new quirk, quirk_no_rfkill_wapf4, wh=
ich
both disables rfkill and sets WAPF=3D4.

Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
Reported-by: Angela Traeger <angie@endlessm.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/=
asus-nb-wmi.c
index 87cd60b..87d618f 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -142,7 +142,7 @@ static const struct dmi_system_id asus_quirks[] =3D=
 {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X456UA"),
 		},
-		.driver_data =3D &quirk_asus_wapf4,
+		.driver_data =3D &quirk_no_rfkill_wapf4,
 	},
 	{
 		.callback =3D dmi_matched,
--=20
2.5.0
