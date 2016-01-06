From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 2/2] asus-wmi: Create quirk for airplane_mode LED
Date: Tue,  5 Jan 2016 21:19:28 -0500
Message-ID: <1452046768-6291-3-git-send-email-jprvita@endlessm.com>
References: <1452046768-6291-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452046768-6291-1-git-send-email-jprvita@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

Some Asus laptops have a "airplane mode" indicator LED, have the WMI
WLAN user bit set, and also have the following bits in their DSDT:

Scope (_SB)
{
  (...)
  Device (ATKD)
  {
    (...)
    Method (WMNB, 3, Serialized)
    {
      (...)
      If (LEqual (IIA0, 0x00010002))
      {
        OWGD (IIA1)
        Return (One)
      }
    }
  }
}

So when asus-wmi uses ASUS_WMI_DEVID_WLAN_LED (0x00010002) to store the
wlan state, it drives the airplane mode indicator LED (throught the cal=
l
to OWGD)in an inverted fashion: the LED is ON when airplane mode is OFF
(since wlan is ON), and vice-versa.

This commit creates a quirk to no register a RFKill switch at all for
these laptops, to allow the asus-wireless driver to drive the airplane
mode LED correctly.

Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 31 ++++++++++++++++++++++++++++++=
+
 drivers/platform/x86/asus-wmi.c    |  8 +++++---
 drivers/platform/x86/asus-wmi.h    |  1 +
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/=
asus-nb-wmi.c
index 131fee2..4ded187 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -78,6 +78,10 @@ static struct quirk_entry quirk_asus_x200ca =3D {
 	.wapf =3D 2,
 };
=20
+static struct quirk_entry quirk_no_rfkill =3D {
+	.no_rfkill =3D true,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	quirks =3D dmi->driver_data;
@@ -297,6 +301,33 @@ static const struct dmi_system_id asus_quirks[] =3D=
 {
 		},
 		.driver_data =3D &quirk_asus_x200ca,
 	},
+	{
+		.callback =3D dmi_matched,
+		.ident =3D "ASUSTeK COMPUTER INC. X555UB",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X555UB"),
+		},
+		.driver_data =3D &quirk_no_rfkill,
+	},
+	{
+		.callback =3D dmi_matched,
+		.ident =3D "ASUSTeK COMPUTER INC. X552VW",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X552VW"),
+		},
+		.driver_data =3D &quirk_no_rfkill,
+	},
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
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asu=
s-wmi.c
index a96630d..370fa347 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -2064,9 +2064,11 @@ static int asus_wmi_add(struct platform_device *=
pdev)
 	if (err)
 		goto fail_leds;
=20
-	err =3D asus_wmi_rfkill_init(asus);
-	if (err)
-		goto fail_rfkill;
+	if (!asus->driver->quirks->no_rfkill) {
+		err =3D asus_wmi_rfkill_init(asus);
+		if (err)
+			goto fail_rfkill;
+	}
=20
 	/* Some Asus desktop boards export an acpi-video backlight interface,
 	   stop this from showing up */
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asu=
s-wmi.h
index 4da4c8b..5de1df5 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -38,6 +38,7 @@ struct key_entry;
 struct asus_wmi;
=20
 struct quirk_entry {
+	bool no_rfkill;
 	bool hotplug_wireless;
 	bool scalar_panel_brightness;
 	bool store_backlight_power;
--=20
2.5.0
