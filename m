Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795028456;
	b=pdfySN9l+zHEUyn7OrlhpCx4Rpu5w5Dc31HHuLYoNsK6Sg79bzEgL+eLOBXiPZzI2FKT
	 8uSvCbkNEbgORogcKeOF6ueFeWg6VJl4A71wz10akcCTaXtGPQpVXrXGaImLOimTrfUF9
	 9OT4Fbkc5C9/iWHUsIzq8WYL77JQccrROBSOocTGRQldxrytBOmK7knoFS0b6FYcV7lr6
	 x/FkHYkf1QwzgkefZKTO6yaV3+EORGBgkPwo0ykGnF1fIjvgF2qH/TtUlHRMW60rLrcH2
	 D2w5zk/q7gMjNwU9yDyTTvzhvWRA/ozjBDQLuuykAzdb4uno0foxm3D6JpWCqgPaXtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028456;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=2LSP6yW8oqva6uKTaJ1a7z/M3PyQsQOEoVXkCFNbaoU=;
	b=dJEIX0jckfaaBQhYvUr0a+wFkNZ/8fnoGX3deSg22kfHuo7qPDeXGv3LX/WmAm+EJGRU
	 l0FbT2dYT7LcEBrPq5AZr0QaFMbT41p04LwYZtukLXRpcyqt4uKjZPa6G6rMqwwNmIxmn
	 pCEINjHEIh8rwzkL9N/c+bW0Y7dOEZ40mLLM4NMFtOBDCKK0tTRQm29KoVY/Eg4Q+XY4q
	 xOZI6VB1+AgflQ2zkSH8MgD/MWuRgSD02/2hd5vGjGq2pmlx/gBNfdi3ihocBlcSIBnPu
	 p9nrPTx6iZqcpWuaMLQPedPuL99xqtXo5bjwpPrea89LrvQOz19+akl96Uj2w1WuV2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b="IVSHTS/O";
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5D1606A320;
	Wed, 18 Nov 2026 19:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A5D1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=IVSHTS/O
ARC-Seal: i=1; a=rsa-sha256; t=1795028441; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lfBy+OkPHpbWrLn+Xzho4REdAWKIoO59u+VKAYOPQsZHQtdphhxMPSB60Nm6sXI8cxbj2ZfI2aSN0WzVRDiTxpnWeo8CW963PZVY9/3z+J7bflzDkjcSP6no21xMygEwBk+YSbyckAIzmz3oc3ahFLKI++dw47x/W+t7RERI8oo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795028441; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2LSP6yW8oqva6uKTaJ1a7z/M3PyQsQOEoVXkCFNbaoU=; 
	b=gvlIi19gaxqnj90H6yuXnJb2Dj1y+Z1RG11d3nGNR3I0XxQ2cLNlIBmdRre1KxQb3bPWXQn2apctNTmDtdBPg9VdWy1A2BlSHHFNL3EvbLaL/J1TqG0N9bxPk9tmiDp0SJcmoiYZenhDTYsqnJ23qA1KLM9xPbFcD8OKPQpOrZo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=IVSHTS/O+tvuuH+cIVZMl+X21GDADCKIpud1u1xGcqnq4XmckTv8w7l74J/nhrS9grw63QtlF6rKdK3Hw1TZCvtezBYfU/rJHvGfFOrfpVIEJoqtPbcR45YZ0FPIi32bXqnrfpOEVuRHyRtAIJ68kCD7CM+CoXhoo84wExXGa65uZ/ScG7BofO08j9dzrduZAuRPYgfLJ+zY1xxidmw7R2JRg10n7yaV+Ezd72Jms4m1iown/0UQH2e+72Mo8HGTFCD6cdzJh3d2sJKaaQ4BHbcZolk5Fr++Fz/NHiYtc0DpEM5Q6wAPxUkVWGXFSPylrakDzeslaxVklabr68n2yA==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=2LSP6yW8oqva6uKTaJ1a7z/M3PyQsQOEoVXkCFNbaoU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795028437430998.4473257499437;
	Wed, 18 Nov 2026 11:00:37 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Thu, 19 Nov 2026 02:58:44 +0800
Subject: [PATCH 1/5] platform/x86: lenovo-wmi-other: Retrieve private data
 from firmware_attributes device
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-lwmi-no-singleton-v1-1-6b06fcfb5126@rong.moe>
References: <20261119-lwmi-no-singleton-v1-0-6b06fcfb5126@rong.moe>
In-Reply-To: <20261119-lwmi-no-singleton-v1-0-6b06fcfb5126@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Alok Tiwari <alok.a.tiwari@oracle.com>, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

Currently, each tunable_attr_01 stores a pointer to the WMI device,
which is unnecessary, as attributes' show/store callbacks can always
access the firmware_attributes device through the kobject hierarchy.
This also makes the driver fail to satisfy the requirements of a
no_singleton driver.

Store a pointer to the driver's privated data in the firmware_attributes
device's drvdata, and retrieve it in attributes' show/store callbacks,
so that we can get rid of tunable_attr_01.device and make it possible
for upcoming refactoring to eliminate all wrapper callbacks created by
macros and constify all statically allocated variables relevant to our
firmware_attributes interface.

Fixes: edc4b183b794 ("platform/x86: Add Lenovo Other Mode WMI Driver")
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-other.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index bd64e7b44669..c31a8bd08a85 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -967,7 +967,6 @@ static void lwmi_om_psy_remove(struct lwmi_om_priv *priv)
 /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
 
 struct tunable_attr_01 {
-	struct device *dev;
 	u8 feature_id;
 	u8 device_id;
 	u8 type_id;
@@ -1124,6 +1123,11 @@ struct capdata01_attr_group {
 	struct tunable_attr_01 *tunable_attr;
 };
 
+static inline struct lwmi_om_priv *kobj_to_om_priv(const struct kobject *kobj)
+{
+	return dev_get_drvdata(kobj_to_dev(kobj->parent));
+}
+
 /* Attribute Methods */
 
 /**
@@ -1163,7 +1167,7 @@ static ssize_t attr_capdata01_show(struct kobject *kobj,
 				   struct tunable_attr_01 *tunable_attr,
 				   enum attribute_property prop)
 {
-	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
+	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
 	struct capdata01 capdata;
 	u32 attribute_id;
 	int value, ret;
@@ -1219,7 +1223,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 					const char *buf, size_t count,
 					struct tunable_attr_01 *tunable_attr)
 {
-	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
+	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
 	struct wmi_method_args_32 args = {};
 	struct capdata01 capdata;
 	enum thermal_mode mode;
@@ -1277,7 +1281,7 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 				       struct kobj_attribute *kattr, char *buf,
 				       struct tunable_attr_01 *tunable_attr)
 {
-	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
+	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
 	struct wmi_method_args_32 args = {};
 	enum thermal_mode mode;
 	int retval;
@@ -1304,6 +1308,7 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 
 /**
  * lwmi_attr_01_is_supported() - Determine if the given attribute is supported.
+ * @priv: Driver private data
  * @tunable_attr: The attribute to verify.
  *
  * For an attribute to be supported it must have a functional get/set method,
@@ -1324,10 +1329,10 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
  *
  * Return: true if capdata and set/get modes are found, otherwise false.
  */
-static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
+static bool lwmi_attr_01_is_supported(struct lwmi_om_priv *priv,
+				      struct tunable_attr_01 *tunable_attr)
 {
 	u8 modes[2] = { LWMI_GZ_THERMAL_MODE_CUSTOM, LWMI_GZ_THERMAL_MODE_NONE };
-	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
 	struct wmi_method_args_32 args = {};
 	bool cd_mode_found = false;
 	bool cv_mode_found = false;
@@ -1350,8 +1355,7 @@ static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
 	if (!cd_mode_found)
 		return cd_mode_found;
 
-	dev_dbg(tunable_attr->dev,
-		"cd_mode_id: %#010x\n", args.arg0);
+	dev_dbg(&priv->wdev->dev, "cd_mode_id: %#010x\n", args.arg0);
 
 	/* Determine tunable_attr->cv_mode_id, returns 1 if supported */
 	for (i = 0; i < ARRAY_SIZE(modes); i++) {
@@ -1371,7 +1375,7 @@ static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
 	if (!cv_mode_found)
 		return cv_mode_found;
 
-	dev_dbg(tunable_attr->dev, "cv_mode_id: %#010x, attribute support level: %#010x\n",
+	dev_dbg(&priv->wdev->dev, "cv_mode_id: %#010x, attribute support level: %#010x\n",
 		args.arg0, capdata.supported);
 
 	return capdata.supported > 0;
@@ -1558,9 +1562,10 @@ static void lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 		goto err_destroy_classdev;
 	}
 
+	dev_set_drvdata(priv->fw_attr_dev, priv);
+
 	for (i = 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
-		cd01_attr_groups[i].tunable_attr->dev = &priv->wdev->dev;
-		if (!lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr))
+		if (!lwmi_attr_01_is_supported(priv, cd01_attr_groups[i].tunable_attr))
 			continue;
 
 		err = sysfs_create_group(&priv->fw_attr_kset->kobj,

-- 
2.55.0

