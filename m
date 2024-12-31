Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C890E1547CC;
	Tue, 31 Dec 2024 06:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735625602; cv=none; b=UQph8o+c3Wtb59vwBHMA1lrQVgevVBnyCz4PmuDJEkg9FTmtceZ46oY6jEeKOdeerJHM6NivEaVTYPTpksshER+U/N6X4Wp59rj5oWzZ4nywuSL6x/EktUsWspZaVASkvf1Q36TElaEpSLagjbTGNan3rfCq8FalLsuUHl/CsV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735625602; c=relaxed/simple;
	bh=iAEe9zdwqdeFW+iTjMzCzONK1Lj7wZQHdgyqk2fnVMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rg2bFOiiVCCKctdvQ8Cdv8wRDJVS3oajR1VHj03qFZGSfYRrmEyjwnK02pXNA5y0rvCwsvxN33A8HHl6MB5iCdYqt9tT69h1taukxLP8SRSn3vvZDn3yhqpA/QcC/d8d2fIZknybair9Im9i4NY1+IbbCfsBdIYNJSWzaoVGe1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4e57cfb6c73e11efa216b1d71e6e1362-20241231
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:c5737f8b-3163-4d12-ab00-5a842a193693,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:5ac74f9d7733b7c7be314e95cc262e13,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4e57cfb6c73e11efa216b1d71e6e1362-20241231
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 952988170; Tue, 31 Dec 2024 14:13:08 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id A02CB16002081;
	Tue, 31 Dec 2024 14:13:08 +0800 (CST)
X-ns-mid: postfix-67738B74-461427247
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id B421416003300;
	Tue, 31 Dec 2024 06:13:07 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ai Chao <aichao@kylinos.cn>
Subject: [PATCH v4] platform/x86: lenovo-wmi-camera: Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS
Date: Tue, 31 Dec 2024 14:13:03 +0800
Message-ID: <20241231061303.1142106-1-aichao@kylinos.cn>
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
change for v4
-Add mutex_unlock and report a switch state of 0 if SW_CAMERA_ON.
change for v3
-Used input_register_device and input_allocate_device.
change for v2
-Only delays the input-device registration and switches to reporting SW_C=
AMERA_LENS_COVER.

 drivers/platform/x86/lenovo-wmi-camera.c | 61 +++++++++++++++---------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform/=
x86/lenovo-wmi-camera.c
index 0c0bedaf7407..2a662b3c78f2 100644
--- a/drivers/platform/x86/lenovo-wmi-camera.c
+++ b/drivers/platform/x86/lenovo-wmi-camera.c
@@ -26,10 +26,34 @@ enum {
 	SW_CAMERA_ON	=3D 1,
 };
=20
+static int camera_shutter_input_setup(struct wmi_device *wdev)
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
@@ -55,11 +79,16 @@ static void lenovo_wmi_notify(struct wmi_device *wdev=
, union acpi_object *obj)
=20
 	mutex_lock(&priv->notify_lock);
=20
-	keycode =3D camera_mode =3D=3D SW_CAMERA_ON ?
-		   KEY_CAMERA_ACCESS_ENABLE : KEY_CAMERA_ACCESS_DISABLE;
-	input_report_key(priv->idev, keycode, 1);
-	input_sync(priv->idev);
-	input_report_key(priv->idev, keycode, 0);
+	if (!priv->idev)
+		if (camera_shutter_input_setup(wdev)) {
+			mutex_unlock(&priv->notify_lock);
+			return;
+		}
+
+	if (camera_mode =3D=3D SW_CAMERA_ON)
+		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 0);
+	else
+		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 1);
 	input_sync(priv->idev);
=20
 	mutex_unlock(&priv->notify_lock);
@@ -68,29 +97,12 @@ static void lenovo_wmi_notify(struct wmi_device *wdev=
, union acpi_object *obj)
 static int lenovo_wmi_probe(struct wmi_device *wdev, const void *context=
)
 {
 	struct lenovo_wmi_priv *priv;
-	int ret;
=20
 	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
=20
 	dev_set_drvdata(&wdev->dev, priv);
-
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
 	mutex_init(&priv->notify_lock);
=20
 	return 0;
@@ -100,6 +112,9 @@ static void lenovo_wmi_remove(struct wmi_device *wdev=
)
 {
 	struct lenovo_wmi_priv *priv =3D dev_get_drvdata(&wdev->dev);
=20
+	if (priv->idev)
+		input_unregister_device(priv->idev);
+
 	mutex_destroy(&priv->notify_lock);
 }
=20
--=20
2.25.1

