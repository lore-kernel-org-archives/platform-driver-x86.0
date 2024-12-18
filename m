Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D456915665C;
	Wed, 18 Dec 2024 06:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734501836; cv=none; b=Uo4BxQCXb1S2B0TfFTWSb9QH+Y/VRWzpMzsZ8xh7t0OrJCMr1u8ebubnPTzcoT3C7YgaUBLvcX54soPd2XdjurMc6BQ911ZuBOEsMS4nc5wEdG1tkYEVGLq4Bu5Xg4o/Af2uoxqH5VEa6GVH4uPzw0ySNC4OJGkMpzmqdPvV+nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734501836; c=relaxed/simple;
	bh=FMFDH9aMAm9pEdwHg/ql2KPyw5P9RyjFzvaBnk4Esdc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJ/oEKCxgOMqdCKF8QiLNVgX4ECTnGvn3Q0wa+5odKL4Gemj1L4xK+2qz4qrIVGsxPq+3DwBJROT1rpr1GvUMW3SVKoIPdzRijsafmAMVoQu1QUh1k7pvk9MHxTw24TzbbXBdgvxlnFovj7khtHkk8BxLYr3CLJ9Cy6+4VX/CuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d689b766bd0511efa216b1d71e6e1362-20241218
X-CID-CACHE: Type:Local,Time:202412181402+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:699ffbb2-070a-4445-8732-0266f1a44ba9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:13dac96cfe28aa11cc86826af435e18f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,URL:0
	,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d689b766bd0511efa216b1d71e6e1362-20241218
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 766440506; Wed, 18 Dec 2024 14:03:44 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 35AF316002081;
	Wed, 18 Dec 2024 14:03:44 +0800 (CST)
X-ns-mid: postfix-676265C0-64752165
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id D4E7516002081;
	Wed, 18 Dec 2024 06:03:43 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ai Chao <aichao@kylinos.cn>
Subject: [PATCH] platform/x86:lenovo-wmi-camera: Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS
Date: Wed, 18 Dec 2024 14:03:41 +0800
Message-ID: <20241218060341.2496642-1-aichao@kylinos.cn>
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
 drivers/platform/x86/lenovo-wmi-camera.c | 139 +++++++++++------------
 1 file changed, 66 insertions(+), 73 deletions(-)

diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform/=
x86/lenovo-wmi-camera.c
index 0c0bedaf7407..fc9efd5beda8 100644
--- a/drivers/platform/x86/lenovo-wmi-camera.c
+++ b/drivers/platform/x86/lenovo-wmi-camera.c
@@ -16,29 +16,52 @@
=20
 #define WMI_LENOVO_CAMERABUTTON_EVENT_GUID "50C76F1F-D8E4-D895-0A3D-62F4=
EA400013"
=20
-struct lenovo_wmi_priv {
-	struct input_dev *idev;
-	struct mutex notify_lock;	/* lenovo WMI camera button notify lock */
-};
+static struct input_dev *camera_shutter_input_dev;
+static struct mutex notify_lock; /* lenovo WMI camera button notify lock=
 */
=20
 enum {
 	SW_CAMERA_OFF	=3D 0,
 	SW_CAMERA_ON	=3D 1,
 };
=20
-static void lenovo_wmi_notify(struct wmi_device *wdev, union acpi_object=
 *obj)
+static int camera_shutter_input_setup(void)
+{
+	int err;
+
+	camera_shutter_input_dev =3D input_allocate_device();
+	if (!camera_shutter_input_dev)
+		return -ENOMEM;
+
+	camera_shutter_input_dev->name =3D "Lenovo WMI Camera Button";
+	camera_shutter_input_dev->phys =3D "wmi/input0";
+	camera_shutter_input_dev->id.bustype =3D BUS_HOST;
+
+	__set_bit(EV_SW, camera_shutter_input_dev->evbit);
+	__set_bit(SW_CAMERA_LENS_COVER, camera_shutter_input_dev->swbit);
+
+	err =3D input_register_device(camera_shutter_input_dev);
+	if (err) {
+		input_free_device(camera_shutter_input_dev);
+		camera_shutter_input_dev =3D NULL;
+		return err;
+	}
+
+	return 0;
+}
+
+static void lenovo_wmi_notify(union acpi_object *obj, void *context)
 {
-	struct lenovo_wmi_priv *priv =3D dev_get_drvdata(&wdev->dev);
-	unsigned int keycode;
-	u8 camera_mode;
+	u32 event_data;
=20
+	if (!obj)
+		return;
 	if (obj->type !=3D ACPI_TYPE_BUFFER) {
-		dev_err(&wdev->dev, "Bad response type %u\n", obj->type);
+		pr_info("Unknown response received %d\n", obj->type);
 		return;
 	}
=20
 	if (obj->buffer.length !=3D 1) {
-		dev_err(&wdev->dev, "Invalid buffer length %u\n", obj->buffer.length);
+		pr_info("Invalid buffer length %u\n", obj->buffer.length);
 		return;
 	}
=20
@@ -47,80 +70,50 @@ static void lenovo_wmi_notify(struct wmi_device *wdev=
, union acpi_object *obj)
 	 *      0 camera close
 	 *      1 camera open
 	 */
-	camera_mode =3D obj->buffer.pointer[0];
-	if (camera_mode > SW_CAMERA_ON) {
-		dev_err(&wdev->dev, "Unknown camera mode %u\n", camera_mode);
-		return;
-	}
-
-	mutex_lock(&priv->notify_lock);
-
-	keycode =3D camera_mode =3D=3D SW_CAMERA_ON ?
-		   KEY_CAMERA_ACCESS_ENABLE : KEY_CAMERA_ACCESS_DISABLE;
-	input_report_key(priv->idev, keycode, 1);
-	input_sync(priv->idev);
-	input_report_key(priv->idev, keycode, 0);
-	input_sync(priv->idev);
-
-	mutex_unlock(&priv->notify_lock);
+	event_data =3D obj->buffer.pointer[0];
+
+	mutex_lock(&notify_lock);
+	if (!camera_shutter_input_dev)
+		if (camera_shutter_input_setup()) {
+			pr_err("Failed to setup camera shutter input device\n");
+			mutex_unlock(&notify_lock);
+			return;
+		}
+
+	if (event_data =3D=3D SW_CAMERA_ON)
+		input_report_switch(camera_shutter_input_dev, SW_CAMERA_LENS_COVER, 1)=
;
+	else if (event_data =3D=3D SW_CAMERA_OFF)
+		input_report_switch(camera_shutter_input_dev, SW_CAMERA_LENS_COVER, 0)=
;
+	else
+		pr_info("Unknown camera shutter state - 0x%x\n", event_data);
+	input_sync(camera_shutter_input_dev);
+
+	mutex_unlock(&notify_lock);
 }
=20
-static int lenovo_wmi_probe(struct wmi_device *wdev, const void *context=
)
+static __init int lenovo_wmi_init(void)
 {
-	struct lenovo_wmi_priv *priv;
-	int ret;
-
-	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	dev_set_drvdata(&wdev->dev, priv);
+	int event_capable =3D wmi_has_guid(WMI_LENOVO_CAMERABUTTON_EVENT_GUID);
+	acpi_status status;
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
+	if (!event_capable)
+		return -ENODEV;
=20
-	ret =3D input_register_device(priv->idev);
-	if (ret)
-		return ret;
-
-	mutex_init(&priv->notify_lock);
+	status =3D wmi_install_notify_handler(WMI_LENOVO_CAMERABUTTON_EVENT_GUI=
D,
+					    lenovo_wmi_notify, NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
=20
 	return 0;
 }
+module_init(lenovo_wmi_init);
=20
-static void lenovo_wmi_remove(struct wmi_device *wdev)
+static __exit void lenovo_wmi_exit(void)
 {
-	struct lenovo_wmi_priv *priv =3D dev_get_drvdata(&wdev->dev);
-
-	mutex_destroy(&priv->notify_lock);
+	if (camera_shutter_input_dev)
+		input_unregister_device(camera_shutter_input_dev);
 }
-
-static const struct wmi_device_id lenovo_wmi_id_table[] =3D {
-	{ .guid_string =3D WMI_LENOVO_CAMERABUTTON_EVENT_GUID },
-	{  }
-};
-MODULE_DEVICE_TABLE(wmi, lenovo_wmi_id_table);
-
-static struct wmi_driver lenovo_wmi_driver =3D {
-	.driver =3D {
-		.name =3D "lenovo-wmi-camera",
-		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
-	},
-	.id_table =3D lenovo_wmi_id_table,
-	.no_singleton =3D true,
-	.probe =3D lenovo_wmi_probe,
-	.notify =3D lenovo_wmi_notify,
-	.remove =3D lenovo_wmi_remove,
-};
-module_wmi_driver(lenovo_wmi_driver);
+module_exit(lenovo_wmi_exit);
=20
 MODULE_AUTHOR("Ai Chao <aichao@kylinos.cn>");
 MODULE_DESCRIPTION("Lenovo WMI Camera Button Driver");
--=20
2.25.1

