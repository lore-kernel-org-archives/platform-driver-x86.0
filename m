From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCHv2 1/2] platform/x86: asus-wmi: Detect quirk_no_rfkill from the DSDT
Date: Mon, 20 Feb 2017 14:50:22 -0500
Message-ID: <20170220195023.17775-2-jprvita@endlessm.com>
References: <20170220195023.17775-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:36580 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752204AbdBTTu7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2017 14:50:59 -0500
In-Reply-To: <20170220195023.17775-1-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

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

This commit skips registering RFKill switches at all for these laptops,
to allow the asus-wireless driver to drive the airplane mode LED
correctly through the ASHS ACPI device. Relying on the presence of ASHS
and ASUS_WMI_DSTS_USER_BIT avoids adding DMI-based quirks for at least
21 different laptops.

Signed-off-by: João Paulo Rechi Vita <jprvita@endlessm.com>
---
 drivers/platform/x86/asus-wmi.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 43cb680adbb4..8499d3ae4257 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -159,6 +159,8 @@ MODULE_LICENSE("GPL");
 #define USB_INTEL_XUSB2PR		0xD0
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
 
+static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
+
 struct bios_args {
 	u32 arg0;
 	u32 arg1;
@@ -2051,6 +2053,16 @@ static int asus_wmi_fan_init(struct asus_wmi *asus)
 	return 0;
 }
 
+static bool ashs_present(void)
+{
+	int i = 0;
+	while (ashs_ids[i]) {
+		if (acpi_dev_found(ashs_ids[i++]))
+			return true;
+	}
+	return false;
+}
+
 /*
  * WMI Driver
  */
@@ -2095,6 +2107,13 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (err)
 		goto fail_leds;
 
+	asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_WLAN, &result);
+	if (result & (ASUS_WMI_DSTS_PRESENCE_BIT | ASUS_WMI_DSTS_USER_BIT))
+		asus->driver->wlan_ctrl_by_user = 1;
+
+	if (asus->driver->wlan_ctrl_by_user && ashs_present())
+		asus->driver->quirks->no_rfkill = 1;
+
 	if (!asus->driver->quirks->no_rfkill) {
 		err = asus_wmi_rfkill_init(asus);
 		if (err)
@@ -2134,10 +2153,6 @@ static int asus_wmi_add(struct platform_device *pdev)
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
