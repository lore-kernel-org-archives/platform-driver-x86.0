From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 1/2] asus-wmi: record wlan status while controlling by user app
Date: Fri, 20 Jul 2012 11:26:26 +0800
Message-ID: <1342754788-22880-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gh0-f174.google.com ([209.85.160.174]:64999 "EHLO
	mail-gh0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750789Ab2GTD0c (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 19 Jul 2012 23:26:32 -0400
Received: by ghrr11 with SMTP id r11so3576771ghr.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jul 2012 20:26:32 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

If the user bit is set, that mean BIOS can't set and record the wlan
status, it will report the value read from id ASUS_WMI_DEVID_WLAN_LED
while we query the wlan status by id ASUS_WMI_DEVID_WLAN through WMI.
So, we have to record wlan status in id ASUS_WMI_DEVID_WLAN_LED
while setting the wlan status through WMI.
This is also the behavior that windows app will do.

Quote from ASUS application engineer
=3D=3D=3D
When you call WMIMethod(DSTS, 0x00010011) to get WLAN status, it may re=
turn

(1) 0x00050001 (On)
(2) 0x00050000 (Off)
(3) 0x00030001 (On)
(4) 0x00030000 (Off)
(5) 0x00000002 (Unknown)

(1), (2) means that the model has hardware GPIO for WLAN, you can call
WMIMethod(DEVS, 0x00010011, 1 or 0) to turn WLAN on/off.
(3), (4) means that the model doesn=E2=80=99t have hardware GPIO, you n=
eed to use
API or driver library to turn WLAN on/off, and call
WMIMethod(DEVS, 0x00010012, 1 or 0) to set WLAN LED status.
After you set WLAN LED status, you can see the WLAN status is changed w=
ith
WMIMethod(DSTS, 0x00010011). Because the status is recorded lastly
(ex: Windows), you can use it for synchronization.
(5) means that the model doesn=E2=80=99t have WLAN device.

WLAN is the ONLY special case with upper rule.

=46or other device, like Bluetooth, you just need use
WMIMethod(DSTS, 0x00010013) to get, and WMIMethod(DEVS, 0x00010013, 1 o=
r 0)
to set.
=3D=3D=3D

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-wmi.c |   27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asu=
s-wmi.c
index 556cbb4..638facf 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -98,6 +98,7 @@ MODULE_LICENSE("GPL");
 #define ASUS_WMI_DEVID_WIRELESS_LED	0x00010002
 #define ASUS_WMI_DEVID_CWAP		0x00010003
 #define ASUS_WMI_DEVID_WLAN		0x00010011
+#define ASUS_WMI_DEVID_WLAN_LED		0x00010012
 #define ASUS_WMI_DEVID_BLUETOOTH	0x00010013
 #define ASUS_WMI_DEVID_GPS		0x00010015
 #define ASUS_WMI_DEVID_WIMAX		0x00010017
@@ -723,10 +724,34 @@ error_workqueue:
  */
 static int asus_rfkill_set(void *data, bool blocked)
 {
+	static u32 wlan_status =3D 0xffffffff;
 	struct asus_rfkill *priv =3D data;
 	u32 ctrl_param =3D !blocked;
+	u32 dev_id =3D priv->dev_id;
+	int result;
=20
-	return asus_wmi_set_devstate(priv->dev_id, ctrl_param, NULL);
+	/*
+	 * If the user bit is set, BIOS can't set and record the wlan status,
+	 * it will report the value read from id ASUS_WMI_DEVID_WLAN_LED
+	 * while we query the wlan status through WMI.
+	 * So, we have to record wlan status in id ASUS_WMI_DEVID_WLAN_LED
+	 * while setting the wlan status through WMI.
+	 * This is also the behavior that windows app will do.
+	 */
+	if (dev_id =3D=3D ASUS_WMI_DEVID_WLAN) {
+		if (wlan_status =3D=3D 0xffffffff)
+			asus_wmi_get_devstate(priv->asus,
+					      ASUS_WMI_DEVID_WLAN,
+					      &wlan_status);
+
+		if (wlan_status &
+		   (ASUS_WMI_DSTS_PRESENCE_BIT | ASUS_WMI_DSTS_USER_BIT))
+			dev_id =3D ASUS_WMI_DEVID_WLAN_LED;
+	}
+
+	result =3D asus_wmi_set_devstate(dev_id, ctrl_param, NULL);
+
+	return result;
 }
=20
 static void asus_rfkill_query(struct rfkill *rfkill, void *data)
--=20
1.7.9.5
