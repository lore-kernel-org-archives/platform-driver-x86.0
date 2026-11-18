Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795028487;
	b=sL/5DaAiRACPUbayULKx4uTX/AlseuolfyO9X+d7vwU7B5Uc2OjQhoko7MDviYzPypTG
	 wFkWS49gFUWdhRUqyupPM+D8K7DNgno7doeXzQSrUmCe2yFDxUV6Xc4Xn5jT2lRdNmZSp
	 +z3J5WlgbK92GKJarmhpjv56/31seWlta79GI10ljdWVDfjTA9G5Jw+Bi7/e6PM7YSmxk
	 NaV+YPxtxFTC8Ur+/zhNH+5534HPlKzNUw+TYaL7bCfu3I/DhZCe3C/kzBkfLypGtB2bD
	 NBNwZDo7vXRrCem7VTM6Sshz1yP2BexaMflxM3Vq7y5bCQBTWD1kHcylWe8G/W3F2bA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028487;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=4W1cGI4H/tmIpb5gp4UF8pOaJOu6knMkGAGyXsGJ4sA=;
	b=PBM/dUJEEXa/0oQDev4dCSanMy14oYkHF01xbpWpHbrNVg1N/RxP9FomVgebTBvvN//D
	 DFTlPbCJLwef0sq/uuMgM4/AxbLMA9Zp0P67NteG+Jp7/09NML+PW2w3jaaMBxc8Qez0s
	 U7wVxiZ5OwhFewAMYo0+Jvvak9NrHuWbcDvmsxsstU+zUwlFfit5eaFfb6lYAEjKrID+6
	 9QeEozi/fPZ5CObLPOOkLawSfXHJjkRRI6iQ7HFTdHhbRvk2Edj2uDkClSIXkLet21aWb
	 yJsW+cI4VLNGthUPtGyswYxgbx/Pn+XdXs6HmEiXV3cauG5TllBreSREaIVA3ZY4GRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=lpM35M2S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD27606A32A;
	Wed, 18 Nov 2026 19:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DD27606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=lpM35M2S
ARC-Seal: i=1; a=rsa-sha256; t=1795028451; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UFrvDJb6y+NUMlkaFAz5NGXGuQjsIjesl/FRqU6Zv0aYWIzE/2/j7x8HSW/aoEtrfAWKkyMln/xrAxUyNSDF+Sht52LiQnZZyWxMVlvJ6rznCo/TQKNlfxtYsat9UCwKm8q7OnPyNiFsnnZJt5zxLQxS+6pvLBzgVAIRckL6dB4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795028451; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4W1cGI4H/tmIpb5gp4UF8pOaJOu6knMkGAGyXsGJ4sA=; 
	b=gqMAHpAxG1xtQzTAfmxwd/v7KThmkGzMjeVrPbLYj8KbZ7Htx1DT8aOJY9zQkT0Tckt56/NQusk3HXbt9nHBDyuafLmLcpyBZtnOKqFmo9QzY4Lsh+kvWnbTTpkfkRYWNaoXBSlZQmk55iTn2dwLo1c1x+ILg1o9HHLSpCRmE/0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=lpM35M2SWHL2cFT8+nYzCAkEfIHXzuVPRxoOPRMyG4AjpKfMAnpBMCmLOQijqu1uQc+7e/xmuah9Zwj6H0FWbmaI3rOkC4gWRAmz6aT2d2ljNv7QBXU13CRBD0cxHFQNutLJQ2n7mB9X7odQ1jbEoiqkjLcbSvibeffFpJP1sdK1eg5idUTbbJx6eU45QoGJf8wW5S83VMVn2tI9/ahIwdmx4j/tMyemzxFuOabMXKBR4SON1ZCMmye0KaWa6NKGngof4vh7TFD3askiPRaT7o2wnTy9P34cV3VjpYcJDmnksmd8kT/XDyXKnRp+OfnM5aRglKBLEvZPqcx1iq4x6A==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=4W1cGI4H/tmIpb5gp4UF8pOaJOu6knMkGAGyXsGJ4sA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17950284466171.5507303166440352;
	Wed, 18 Nov 2026 11:00:46 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Thu, 19 Nov 2026 02:58:47 +0800
Subject: [PATCH 4/5] platform/x86: lenovo-wmi-other: Properly implement
 no_singleton driver
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
Message-Id: <20261119-lwmi-no-singleton-v1-4-6b06fcfb5126@rong.moe>
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

The driver declares `.no_singleton = true' but stores device-specific
data to statically allocated tunable_attr_01 variables. This makes the
driver depend on the frigile fact that no device in wild has more than
one LENOVO_OTHER_MODE WMI devices.

Add unique indexes to all statically allocated tunable_attr_01 variables
with some __COUNTER__ tricks, and use them to access lwmi_om_priv's
newly-introduced tunable_attr_01_ctx array. In this manner, move all
device-specific data to the tunable_attr_01_ctx array, and constify all
statically allocated tunable_attr_01 variables to make the driver a
truly no_singleton driver.

Fixes: 03bb5147da08 ("platform/x86: lenovo-wmi-other: Limit adding attributes to supported devices")
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-other.c | 54 ++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 252ef775f300..f37dca7db034 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -134,15 +134,23 @@ struct tunable_attr_01 {
 	u8 feature_id;
 	u8 device_id;
 	u8 type_id;
+	u8 ctx_id; /* Index to tunable_attr_01_ctx[] */
+};
+
+struct tunable_attr_01_ctx {
 	u8 cd_mode_id; /* mode arg for searching capdata */
 	u8 cv_mode_id; /* mode arg for set/get current_value */
 };
 
+enum { TUNABLE_ATTR_01_COUNTER_BASE = __COUNTER__ + 1 };
+#define TUNABLE_ATTR_01_COUNTER (__COUNTER__ - TUNABLE_ATTR_01_COUNTER_BASE)
+
 #define DEFINE_TUNABLE_ATTR_01(_name, _device, _feature, _type)	\
-	static struct tunable_attr_01 _name = {			\
+	static const struct tunable_attr_01 _name = {		\
 		.device_id = LWMI_DEVICE_ID_##_device,		\
 		.feature_id = LWMI_FEATURE_ID_##_feature,	\
 		.type_id = LWMI_TYPE_ID_##_type,		\
+		.ctx_id = TUNABLE_ATTR_01_COUNTER,		\
 	}
 
 DEFINE_TUNABLE_ATTR_01(ppt_pl1_spl, CPU, CPU_SPL, NONE);
@@ -168,6 +176,10 @@ DEFINE_TUNABLE_ATTR_01(dgpu_didvid, GPU, DGPU_DIDVID, NONE);
 DEFINE_TUNABLE_ATTR_01(gpu_nv_bpl, GPU, GPU_NV_BPL, NONE);
 DEFINE_TUNABLE_ATTR_01(gpu_nv_cpu_boost, GPU, GPU_NV_CPU_BOOST, NONE);
 
+enum { TUNABLE_ATTR_01_NR = TUNABLE_ATTR_01_COUNTER };
+
+static_assert(TUNABLE_ATTR_01_NR > 0 && TUNABLE_ATTR_01_NR < U8_MAX);
+
 struct lwmi_om_priv {
 	struct component_master_ops *ops;
 
@@ -183,6 +195,8 @@ struct lwmi_om_priv {
 
 	struct lwmi_fan_info fan_info[LWMI_FAN_NR];
 
+	struct tunable_attr_01_ctx tunable_attr_ctx[TUNABLE_ATTR_01_NR];
+
 	struct {
 		bool capdata00_collected : 1;
 		bool capdata_fan_collected : 1;
@@ -1018,7 +1032,7 @@ static u32 tunable_attr_01_id(const struct tunable_attr_01 *attr, u8 mode)
 
 struct capdata01_attr {
 	struct kobj_attribute kobj_attr;
-	struct tunable_attr_01 *tunable_attr;
+	const struct tunable_attr_01 *tunable_attr;
 	union {
 		enum attribute_property prop;
 		const char *display_name;
@@ -1027,7 +1041,7 @@ struct capdata01_attr {
 
 struct capdata01_attr_group {
 	const struct attribute_group *attr_group;
-	struct tunable_attr_01 *tunable_attr;
+	const struct tunable_attr_01 *tunable_attr;
 };
 
 static inline struct lwmi_om_priv *kobj_to_om_priv(const struct kobject *kobj)
@@ -1041,6 +1055,12 @@ kobj_attr_to_cd01_attr(const struct kobj_attribute *kattr)
 	return container_of_const(kattr, struct capdata01_attr, kobj_attr);
 }
 
+static inline struct tunable_attr_01_ctx *tunable_to_ctx(struct lwmi_om_priv *priv,
+							 const struct tunable_attr_01 *tunable_attr)
+{
+	return &priv->tunable_attr_ctx[tunable_attr->ctx_id];
+}
+
 /* Attribute Methods */
 
 /**
@@ -1098,12 +1118,13 @@ static ssize_t attr_capdata01_show(struct kobject *kobj,
 	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
 	const struct capdata01_attr *cd01_attr = kobj_attr_to_cd01_attr(kattr);
 	const struct tunable_attr_01 *tunable_attr = cd01_attr->tunable_attr;
+	struct tunable_attr_01_ctx *ctx = tunable_to_ctx(priv, tunable_attr);
 	enum attribute_property prop = cd01_attr->prop;
 	struct capdata01 capdata;
 	u32 attribute_id;
 	int value, ret;
 
-	attribute_id = tunable_attr_01_id(tunable_attr, tunable_attr->cd_mode_id);
+	attribute_id = tunable_attr_01_id(tunable_attr, ctx->cd_mode_id);
 
 	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
 	if (ret)
@@ -1152,6 +1173,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
 	const struct capdata01_attr *cd01_attr = kobj_attr_to_cd01_attr(kattr);
 	const struct tunable_attr_01 *tunable_attr = cd01_attr->tunable_attr;
+	struct tunable_attr_01_ctx *ctx = tunable_to_ctx(priv, tunable_attr);
 	struct wmi_method_args_32 args = {};
 	struct capdata01 capdata;
 	enum thermal_mode mode;
@@ -1165,7 +1187,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (mode != LWMI_GZ_THERMAL_MODE_CUSTOM)
 		return -EBUSY;
 
-	args.arg0 = tunable_attr_01_id(tunable_attr, tunable_attr->cd_mode_id);
+	args.arg0 = tunable_attr_01_id(tunable_attr, ctx->cd_mode_id);
 
 	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
 	if (ret)
@@ -1178,7 +1200,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (value < capdata.min_value || value > capdata.max_value)
 		return -EINVAL;
 
-	args.arg0 = tunable_attr_01_id(tunable_attr, tunable_attr->cv_mode_id);
+	args.arg0 = tunable_attr_01_id(tunable_attr, ctx->cv_mode_id);
 	args.arg1 = value;
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
@@ -1208,6 +1230,7 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
 	const struct capdata01_attr *cd01_attr = kobj_attr_to_cd01_attr(kattr);
 	const struct tunable_attr_01 *tunable_attr = cd01_attr->tunable_attr;
+	struct tunable_attr_01_ctx *ctx = tunable_to_ctx(priv, tunable_attr);
 	struct wmi_method_args_32 args = {};
 	enum thermal_mode mode;
 	int retval;
@@ -1218,8 +1241,8 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 		return ret;
 
 	/* If "no-mode" is the supported mode, ensure we never send current mode */
-	if (tunable_attr->cv_mode_id == LWMI_GZ_THERMAL_MODE_NONE)
-		mode = tunable_attr->cv_mode_id;
+	if (ctx->cv_mode_id == LWMI_GZ_THERMAL_MODE_NONE)
+		mode = ctx->cv_mode_id;
 
 	args.arg0 = tunable_attr_01_id(tunable_attr, mode);
 
@@ -1243,21 +1266,22 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
  * First check if the attribute has a corresponding data table under custom mode
  * (0xff), then under no mode (0x00). If either of those passes, check if the
  * supported field of the capdata struct is > 0. If it is supported, store the
- * successful mode in the cd_mode_id field of tunable_attr.
+ * successful mode in the cd_mode_id field of tunable_attr_01_ctx.
  *
  * If the attribute capdata shows it is supported, attempt to determine the mode
  * for the current value property get/set methods using a similar pattern to the
  * capdata table check. If the value returned by either mode is 0 or an error,
  * assume that mode is not supported. Otherwise, store the successful mode in the
- * cv_mode_id field of tunable_attr.
+ * cv_mode_id field of tunable_attr_01_ctx.
  *
  * If any of the above checks fail then the attribute is not fully supported.
  *
  * Return: true if capdata and set/get modes are found, otherwise false.
  */
 static bool lwmi_attr_01_is_supported(struct lwmi_om_priv *priv,
-				      struct tunable_attr_01 *tunable_attr)
+				      const struct tunable_attr_01 *tunable_attr)
 {
+	struct tunable_attr_01_ctx *ctx = tunable_to_ctx(priv, tunable_attr);
 	u8 modes[2] = { LWMI_GZ_THERMAL_MODE_CUSTOM, LWMI_GZ_THERMAL_MODE_NONE };
 	struct wmi_method_args_32 args = {};
 	bool cd_mode_found = false;
@@ -1265,7 +1289,7 @@ static bool lwmi_attr_01_is_supported(struct lwmi_om_priv *priv,
 	struct capdata01 capdata;
 	int retval, ret, i;
 
-	/* Determine tunable_attr->cd_mode_id */
+	/* Determine cd_mode_id  */
 	for (i = 0; i < ARRAY_SIZE(modes); i++) {
 		args.arg0 = tunable_attr_01_id(tunable_attr, modes[i]);
 
@@ -1273,7 +1297,7 @@ static bool lwmi_attr_01_is_supported(struct lwmi_om_priv *priv,
 		if (ret || !capdata.supported)
 			continue;
 
-		tunable_attr->cd_mode_id = modes[i];
+		ctx->cd_mode_id = modes[i];
 		cd_mode_found = true;
 		break;
 	}
@@ -1283,7 +1307,7 @@ static bool lwmi_attr_01_is_supported(struct lwmi_om_priv *priv,
 
 	dev_dbg(&priv->wdev->dev, "cd_mode_id: %#010x\n", args.arg0);
 
-	/* Determine tunable_attr->cv_mode_id, returns 1 if supported */
+	/* Determine cv_mode_id, returns 1 if supported  */
 	for (i = 0; i < ARRAY_SIZE(modes); i++) {
 		args.arg0 = tunable_attr_01_id(tunable_attr, modes[i]);
 
@@ -1293,7 +1317,7 @@ static bool lwmi_attr_01_is_supported(struct lwmi_om_priv *priv,
 		if (ret || !retval)
 			continue;
 
-		tunable_attr->cv_mode_id = modes[i];
+		ctx->cv_mode_id = modes[i];
 		cv_mode_found = true;
 		break;
 	}

-- 
2.55.0

