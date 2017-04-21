From: Oleksij Rempel <linux@rempel-privat.de>
Subject: [PATCH] platform/x86: asus-wmi: try to set als by default
Date: Fri, 21 Apr 2017 17:24:34 +0200
Message-ID: <20170421152434.3834-1-linux@rempel-privat.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:65217 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1423342AbdDUSjp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Apr 2017 14:39:45 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Oleksij Rempel <linux@rempel-privat.de>

some laptops, for example ASUS UX330UAK, have brocken als_get function
but working als_set funktion. In this case, ALS will stay turned off.

             Method (WMNB, 3, Serialized)
            {
	    ...
               If (Local0 == 0x53545344)
                {
		...
                    If (IIA0 == 0x00050001)
                    {
                        If (!ALSP)
                        {
                            Return (0x02)
                        }

                        Local0 = (GALS & 0x10)    <<<---- bug,
                                                    should be: (GALS () & 0x10)
                        If (Local0)
                        {
                            Return (0x00050001)
                        }
                        Else
                        {
                            Return (0x00050000)
                        }
                    }

             .....
                If (Local0 == 0x53564544)
                {
		...
                    If (IIA0 == 0x00050001)
                    {
                        Return (ALSC (IIA1))
                    }

Since it works without problems on Windows I assume ASUS WMI driver for Win
never trying to get ALS state, and instead it is setting it by default to ON.

This patch will do the same. Turn ALS on by default.

Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
---
 drivers/platform/x86/asus-wmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 8fe5890bf539..6b3aef40431c 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1109,6 +1109,15 @@ static void asus_wmi_set_xusb2pr(struct asus_wmi *asus)
 }
 
 /*
+ * Some devices dont support or have borcken get_als method
+ * but still support set method.
+ */
+static void asus_wmi_set_als(void)
+{
+	asus_wmi_set_devstate(ASUS_WMI_DEVID_ALS_ENABLE, 1, NULL);
+}
+
+/*
  * Hwmon device
  */
 static int asus_hwmon_agfn_fan_speed_read(struct asus_wmi *asus, int fan,
@@ -2117,6 +2126,8 @@ static int asus_wmi_add(struct platform_device *pdev)
 			goto fail_rfkill;
 	}
 
+	asus_wmi_set_als();
+
 	/* Some Asus desktop boards export an acpi-video backlight interface,
 	   stop this from showing up */
 	chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
-- 
2.11.0
