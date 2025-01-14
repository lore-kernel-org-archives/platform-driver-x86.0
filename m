Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283832309BE;
	Tue, 14 Jan 2025 06:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736836789; cv=none; b=fsOKx5v4FiJy6L0cbB18QTp7ovXCB9sFSiCQWf0QkdE6mcRw9aDaLw1slO4Sbn8fYr0XYTWscWxPK8qM5SnSyqH9gLSpix2vNXDzU+j9D+Co2+gcYyfvl0yblyKBdqhlWB5nPF+DjHf9w6cXKdVEikyk1ksmdXbNTb11wmw9CjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736836789; c=relaxed/simple;
	bh=JyZX8JnyehShvyZXsgpRMunVYUfa3SWwMMUAXuOTnrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZO+lBS6+MdDlVAvZC2WmRR7I//jDjfBQhAlUgHqnIZksmwlECmmnPzPXc5znNk/vEQXUOteeqKZa+uZsuW8xghuQ0uw/63Ty00InofxJe6xYzs4KWpKzVn9E6bKh1O0bGkHTZYGTSbSd3PzEOapWBU0bTjHcx5s5brYjNany55w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 538177e4d24211efa216b1d71e6e1362-20250114
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:dc480091-05af-48ef-9e09-29e164f4c5d6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:d975cd7fc03691bfa35a5814ac5d2b83,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 538177e4d24211efa216b1d71e6e1362-20250114
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1431131879; Tue, 14 Jan 2025 14:39:38 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 0FA8F1600810E;
	Tue, 14 Jan 2025 14:39:38 +0800 (CST)
X-ns-mid: postfix-678606A9-8857416821
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 45E661600810D;
	Tue, 14 Jan 2025 06:39:37 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ai Chao <aichao@kylinos.cn>
Subject: [PATCH v6] platform/x86: lenovo-wmi-camera: Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS
Date: Tue, 14 Jan 2025 14:39:34 +0800
Message-ID: <20250114063934.3116444-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS_ENABLE and
KEY_CAMERA_ACESS_DISABLE. When the camera toggle switch was hit,
the lenovo-wmi-camera driver would report an event code.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
change for v6
-Change mutex() to guard().
change for v5
-Add input_report_switch before input_register_device.
change for v4
-Add mutex_unlock and report a switch state of 0 if SW_CAMERA_ON.
change for v3
-Used input_register_device and input_allocate_device.
change for v2
-Only delays the input-device registration and switches to reporting SW_C=
AMERA_LENS_COVER.

 drivers/platform/x86/lenovo-wmi-camera.c | 75 +++++++++++++++---------
 1 file changed, 46 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform/=
x86/lenovo-wmi-camera.c
index 0c0bedaf7407..36835cd64758 100644
--- a/drivers/platform/x86/lenovo-wmi-camera.c
+++ b/drivers/platform/x86/lenovo-wmi-camera.c
@@ -13,12 +13,15 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/wmi.h>
+#include <linux/cleanup.h>
=20
 #define WMI_LENOVO_CAMERABUTTON_EVENT_GUID "50C76F1F-D8E4-D895-0A3D-62F4=
EA400013"
=20
+/* Lenovo WMI camera button notify lock */
+static DEFINE_MUTEX(notify_lock);
+
 struct lenovo_wmi_priv {
 	struct input_dev *idev;
-	struct mutex notify_lock;	/* lenovo WMI camera button notify lock */
 };
=20
 enum {
@@ -26,10 +29,38 @@ enum {
 	SW_CAMERA_ON	=3D 1,
 };
=20
+static int camera_shutter_input_setup(struct wmi_device *wdev, u8 camera=
_mode)
+{
+	struct lenovo_wmi_priv *priv =3D dev_get_drvdata(&wdev->dev);
+	int err;
+
+	priv->idev =3D input_allocate_device();
+	if (!priv->idev)
+		return -ENOMEM;
+
+	priv->idev->name =3D "Lenovo WMI Camera Button";
+	priv->idev->phys =3D "wmi/input0";
+	priv->idev->id.bustype =3D BUS_HOST;
+	priv->idev->dev.parent =3D &wdev->dev;
+
+	input_set_capability(priv->idev, EV_SW, SW_CAMERA_LENS_COVER);
+
+	input_report_switch(priv->idev, SW_CAMERA_LENS_COVER,
+			    camera_mode =3D=3D SW_CAMERA_ON ? 0 : 1);
+	input_sync(priv->idev);
+
+	err =3D input_register_device(priv->idev);
+	if (err) {
+		input_free_device(priv->idev);
+		priv->idev =3D NULL;
+	}
+
+	return err;
+}
+
 static void lenovo_wmi_notify(struct wmi_device *wdev, union acpi_object=
 *obj)
 {
 	struct lenovo_wmi_priv *priv =3D dev_get_drvdata(&wdev->dev);
-	unsigned int keycode;
 	u8 camera_mode;
=20
 	if (obj->type !=3D ACPI_TYPE_BUFFER) {
@@ -53,22 +84,24 @@ static void lenovo_wmi_notify(struct wmi_device *wdev=
, union acpi_object *obj)
 		return;
 	}
=20
-	mutex_lock(&priv->notify_lock);
+	guard(mutex)(&notify_lock);
=20
-	keycode =3D camera_mode =3D=3D SW_CAMERA_ON ?
-		   KEY_CAMERA_ACCESS_ENABLE : KEY_CAMERA_ACCESS_DISABLE;
-	input_report_key(priv->idev, keycode, 1);
-	input_sync(priv->idev);
-	input_report_key(priv->idev, keycode, 0);
-	input_sync(priv->idev);
+	if (!priv->idev) {
+		if (camera_shutter_input_setup(wdev, camera_mode))
+			dev_warn(&wdev->dev, "Failed to register input device\n");
+		return;
+	}
=20
-	mutex_unlock(&priv->notify_lock);
+	if (camera_mode =3D=3D SW_CAMERA_ON)
+		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 0);
+	else
+		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 1);
+	input_sync(priv->idev);
 }
=20
 static int lenovo_wmi_probe(struct wmi_device *wdev, const void *context=
)
 {
 	struct lenovo_wmi_priv *priv;
-	int ret;
=20
 	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -76,23 +109,6 @@ static int lenovo_wmi_probe(struct wmi_device *wdev, =
const void *context)
=20
 	dev_set_drvdata(&wdev->dev, priv);
=20
-	priv->idev =3D devm_input_allocate_device(&wdev->dev);
-	if (!priv->idev)
-		return -ENOMEM;
-
-	priv->idev->name =3D "Lenovo WMI Camera Button";
-	priv->idev->phys =3D "wmi/input0";
-	priv->idev->id.bustype =3D BUS_HOST;
-	priv->idev->dev.parent =3D &wdev->dev;
-	input_set_capability(priv->idev, EV_KEY, KEY_CAMERA_ACCESS_ENABLE);
-	input_set_capability(priv->idev, EV_KEY, KEY_CAMERA_ACCESS_DISABLE);
-
-	ret =3D input_register_device(priv->idev);
-	if (ret)
-		return ret;
-
-	mutex_init(&priv->notify_lock);
-
 	return 0;
 }
=20
@@ -100,7 +116,8 @@ static void lenovo_wmi_remove(struct wmi_device *wdev=
)
 {
 	struct lenovo_wmi_priv *priv =3D dev_get_drvdata(&wdev->dev);
=20
-	mutex_destroy(&priv->notify_lock);
+	if (priv->idev)
+		input_unregister_device(priv->idev);
 }
=20
 static const struct wmi_device_id lenovo_wmi_id_table[] =3D {
--=20
2.25.1

