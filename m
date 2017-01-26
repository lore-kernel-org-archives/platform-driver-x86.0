From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 8/8] asus-wmi: Don't register rfkill if ASHS and user bit are present
Date: Thu, 26 Jan 2017 10:30:13 -0500
Message-ID: <20170126153013.12753-9-jprvita@endlessm.com>
References: <20170126153013.12753-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170126153013.12753-1-jprvita@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

Some Asus laptops that have an airplane-mode indicator LED, also have
the WMI WLAN user bit set, and the following bits in their DSDT:

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
wlan state, it drives the airplane-mode indicator LED (through the call
to OWGD) in an inverted fashion: the LED is ON when airplane mode is OFF
(since wlan is ON), and vice-versa.

This skips registering RFKill switches at all for these laptops, to
allow the asus-wireless driver to drive the airplane mode LED correctly
through the ASHS ACPI device. Relying on the presence of ASHS and
ASUS_WMI_DSTS_USER_BIT avoids adding DMI-based quirks for at least 21
different laptops.

Signed-off-by: João Paulo Rechi Vita <jprvita@endlessm.com>
---
 drivers/platform/x86/asus-wmi.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index da3b12c131ce..645204865a3f 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -49,6 +49,7 @@
 #include <linux/dmi.h>
 #include <acpi/video.h>
 
+#include "asus-wireless.h"
 #include "asus-wmi.h"
 
 MODULE_AUTHOR("Corentin Chary <corentin.chary@gmail.com>, "
@@ -2051,6 +2052,16 @@ static int asus_wmi_fan_init(struct asus_wmi *asus)
 	return 0;
 }
 
+static bool ashs_present(void)
+{
+	int i;
+
+	for (i = 0; strcmp(asus_wireless_ids[i].id, ""); i++)
+		if (acpi_dev_found(asus_wireless_ids[i].id))
+			return true;
+	return false;
+}
+
 /*
  * WMI Driver
  */
@@ -2095,9 +2106,15 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (err)
 		goto fail_leds;
 
-	err = asus_wmi_rfkill_init(asus);
-	if (err)
-		goto fail_rfkill;
+	asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_WLAN, &result);
+	if (result & (ASUS_WMI_DSTS_PRESENCE_BIT | ASUS_WMI_DSTS_USER_BIT))
+		asus->driver->wlan_ctrl_by_user = 1;
+
+	if (!(asus->driver->wlan_ctrl_by_user && ashs_present())) {
+		err = asus_wmi_rfkill_init(asus);
+		if (err)
+			goto fail_rfkill;
+	}
 
 	/* Some Asus desktop boards export an acpi-video backlight interface,
 	   stop this from showing up */
@@ -2132,10 +2149,6 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (err)
 		goto fail_debugfs;
 
-	asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_WLAN, &result);
-	if (result & (ASUS_WMI_DSTS_PRESENCE_BIT | ASUS_WMI_DSTS_USER_BIT))
-		asus->driver->wlan_ctrl_by_user = 1;
-
 	return 0;
 
 fail_debugfs:
-- 
2.11.0
