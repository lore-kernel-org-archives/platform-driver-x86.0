Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2A08F58;
	Wed,  1 Jan 2025 10:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735727396; cv=none; b=JZe+byhSIPWHSdVs1S/ZOh9QnEQKzLy7b9bihVk1SYu4hiRdLrcCTxbomy/ZqjPJxMHjtOro1OUiulEafYQa5HFUxXQH5oaRolcDNyDEUJ5GxgLy3ZUk54HyhZeg8V4cpncArHo2594kX+bANWxpemc2bE5Ccgxnal1p8vudNuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735727396; c=relaxed/simple;
	bh=s1StKrBnVfbpFjyQsvPSmkQ9HSnvE2wjUc17VHAfQxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qFa6mKxSTYU89Kcde8X9VeU1YXd0uDERKPswaFvJuCPwY93vO1wJ8QPwsAa2BZYv5sLnKrcPW30XLurIwnIkU1PZRKJB0viHGqUCxuca2jYXr2F3oatH+62onDhBdbk7nimrv62Sqn4m5UCLBqtoNmb6FPRC8Y4zDrUhUMXrofM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4b4ee992c82b11efa216b1d71e6e1362-20250101
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:d13404cb-55eb-42b6-a96a-40a2dbb8299d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:e39c39d8da3d00b2337ce96a91f34eca,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4b4ee992c82b11efa216b1d71e6e1362-20250101
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 643009676; Wed, 01 Jan 2025 18:29:34 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 43B3016001CC7;
	Wed,  1 Jan 2025 18:29:34 +0800 (CST)
X-ns-mid: postfix-6775190E-485391
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 42F3516001CC7;
	Wed,  1 Jan 2025 10:29:33 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ai Chao <aichao@kylinos.cn>
Subject: [PATCH v5] platform/x86: lenovo-wmi-camera: Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS
Date: Wed,  1 Jan 2025 18:29:21 +0800
Message-ID: <20250101102922.1784551-1-aichao@kylinos.cn>
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
change for v5
-Add input_report_switch before input_register_device.
change for v4
-Add mutex_unlock and report a switch state of 0 if SW_CAMERA_ON.
change for v3
-Used input_register_device and input_allocate_device.
change for v2
-Only delays the input-device registration and switches to reporting SW_C=
AMERA_LENS_COVER.

 drivers/platform/x86/lenovo-wmi-camera.c | 67 ++++++++++++++++--------
 1 file changed, 44 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform/=
x86/lenovo-wmi-camera.c
index 0c0bedaf7407..ceed441a0161 100644
--- a/drivers/platform/x86/lenovo-wmi-camera.c
+++ b/drivers/platform/x86/lenovo-wmi-camera.c
@@ -26,10 +26,38 @@ enum {
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
@@ -55,11 +83,18 @@ static void lenovo_wmi_notify(struct wmi_device *wdev=
, union acpi_object *obj)
=20
 	mutex_lock(&priv->notify_lock);
=20
-	keycode =3D camera_mode =3D=3D SW_CAMERA_ON ?
-		   KEY_CAMERA_ACCESS_ENABLE : KEY_CAMERA_ACCESS_DISABLE;
-	input_report_key(priv->idev, keycode, 1);
-	input_sync(priv->idev);
-	input_report_key(priv->idev, keycode, 0);
+	if (!priv->idev) {
+		if (camera_shutter_input_setup(wdev, camera_mode))
+			dev_warn(&wdev->dev, "Failed to register input device\n");
+
+		mutex_unlock(&priv->notify_lock);
+		return;
+	}
+
+	if (camera_mode =3D=3D SW_CAMERA_ON)
+		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 0);
+	else
+		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 1);
 	input_sync(priv->idev);
=20
 	mutex_unlock(&priv->notify_lock);
@@ -68,29 +103,12 @@ static void lenovo_wmi_notify(struct wmi_device *wde=
v, union acpi_object *obj)
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
@@ -100,6 +118,9 @@ static void lenovo_wmi_remove(struct wmi_device *wdev=
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

