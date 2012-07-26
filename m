From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 1/2] asus-wmi: record wlan status while controlled by userapp
Date: Thu, 26 Jul 2012 17:13:31 +0800
Message-ID: <1343294012-15969-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:51178 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751024Ab2GZJNj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Jul 2012 05:13:39 -0400
Received: by mail-pb0-f46.google.com with SMTP id rp8so2922162pbb.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Jul 2012 02:13:39 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

If the user bit is set, that mean BIOS can't set and record the wlan
status, it will report the value read from id ASUS_WMI_DEVID_WLAN_LED
(0x00010012) while we query the wlan status by id ASUS_WMI_DEVID_WLAN
(0x00010011) through WMI.
So, we have to record wlan status in id ASUS_WMI_DEVID_WLAN_LED
(0x00010012) while setting the wlan status through WMI.
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
 drivers/platform/x86/asus-wmi.c |   21 ++++++++++++++++++++-
 drivers/platform/x86/asus-wmi.h |    1 +
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asu=
s-wmi.c
index 77aadde..83d4cf7 100644
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
@@ -725,8 +726,21 @@ static int asus_rfkill_set(void *data, bool blocke=
d)
 {
 	struct asus_rfkill *priv =3D data;
 	u32 ctrl_param =3D !blocked;
+	u32 dev_id =3D priv->dev_id;
=20
-	return asus_wmi_set_devstate(priv->dev_id, ctrl_param, NULL);
+	/*
+	 * If the user bit is set, BIOS can't set and record the wlan status,
+	 * it will report the value read from id ASUS_WMI_DEVID_WLAN_LED
+	 * while we query the wlan status through WMI(ASUS_WMI_DEVID_WLAN).
+	 * So, we have to record wlan status in id ASUS_WMI_DEVID_WLAN_LED
+	 * while setting the wlan status through WMI.
+	 * This is also the behavior that windows app will do.
+	 */
+	if ((dev_id =3D=3D ASUS_WMI_DEVID_WLAN) &&
+	     priv->asus->driver->wlan_ctrl_by_user)
+		dev_id =3D ASUS_WMI_DEVID_WLAN_LED;
+
+	return asus_wmi_set_devstate(dev_id, ctrl_param, NULL);
 }
=20
 static void asus_rfkill_query(struct rfkill *rfkill, void *data)
@@ -1648,6 +1662,7 @@ static int asus_wmi_add(struct platform_device *p=
dev)
 	struct asus_wmi *asus;
 	acpi_status status;
 	int err;
+	u32 result;
=20
 	asus =3D kzalloc(sizeof(struct asus_wmi), GFP_KERNEL);
 	if (!asus)
@@ -1700,6 +1715,10 @@ static int asus_wmi_add(struct platform_device *=
pdev)
 	if (err)
 		goto fail_debugfs;
=20
+	asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_WLAN, &result);
+	if (result & (ASUS_WMI_DSTS_PRESENCE_BIT | ASUS_WMI_DSTS_USER_BIT))
+		asus->driver->wlan_ctrl_by_user =3D 1;
+
 	return 0;
=20
 fail_debugfs:
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asu=
s-wmi.h
index d43b667..cbe7ee2 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -45,6 +45,7 @@ struct quirk_entry {
 struct asus_wmi_driver {
 	int			brightness;
 	int			panel_power;
+	int			wlan_ctrl_by_user;
=20
 	const char		*name;
 	struct module		*owner;
--=20
1.7.9.5
