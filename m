Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795543480;
	b=JNLsvz45Dr5NGjQB7X73dQqNFoXy4AeqexQoRrZiqflxigYnVpyYjKyv/Xuk58X27sMi
	 SHf9jiCzkI2IHoWqIAacfu4YlwmDnlUjslehOYk908kwpglq437uX81Sw3FKkSPeGNJj+
	 lPWGBRPQafouhoBketmeADET1EIO+1Srf03gczb0hnEnAbwVx3xxQCsTEKOH5FyH5jUsW
	 Akz8FcqXQLwTG935bsn6gQK2Tdmtg4ezi7zs/cqm2NSaLUGYrJpwBjnclg/Hb/g5v7eSG
	 AnOGWKMugz7qYG940Ipys2YKzh7sFxpMSHzhvPqkvUwHsTp+XL3DcE2HoJmokfGGLXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543480;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=1Vr1RQIUEWnzmw+cIQYh4Tn4MnqQJJGLaUzabnprzlQ=;
	b=zro9GdKcUc2r7yvg0Ox/7abKP7ZXoNs0GxMad6s7j1IfGuF9ndFRLZQN4tWSRbVHQiCV
	 fNagI2ptmPUlcbEXJReAg4e181vR0IlaazsRYsDNP0fxUN/vpam6mb5Hud2h2ETR7xtu9
	 nYVJ1amXcsm6CY56YnnAw/fLyrhXykn4H8o1txnZDT0z0HIN4JmxRFX99rIzNR8R3Yesd
	 Cxvrj2BYfmUapBHBsOk4Ft8AXAN0J/tA+wCWXsofmMuDIOzSeFIYoduvSpRBChef1JWyC
	 EZhQiEAplc1H7MZC/r7sNeNejF6dXfPGuFBKOE+2uRf0kcB8EcUkypx2v6xVj8WsKdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=C0XNzd9J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEFD606A33C;
	Tue, 24 Nov 2026 18:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEEFD606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=C0XNzd9J
ARC-Seal: i=1; a=rsa-sha256; t=1795543390; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nD8CWeJzx1f+nyEomaKRE2OnBgl/kc52+TiqM6tmqOSUWbWDHdXRuB/IdRVZbk84Q2n0PvikJCKk56uevHTsrTtH9ySy9jTewGNlNizmVaaOSTkKir8I5lg12O3EHoLdeCre+6zDY1nyir/XZG1baEemU8gtUe054XhthqXI2iE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795543390; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1Vr1RQIUEWnzmw+cIQYh4Tn4MnqQJJGLaUzabnprzlQ=; 
	b=KK+gdziVEIywwUxXIOd35W1nfPcmDw0dTnwWjC/NJNfm05AadA11hun6P2y4lyzugz24HBtBsQF0YxqIt8rdRfLATf94ulvl2lmOMv7AXTZ1Ks741JqFIQoEPkGqIPTc6fHmPUQNNJwhR6sLzL2erE7IQHFCtPVewPbynG7Lsfw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=C0XNzd9J847k0lli/DyCZm2QpxdYBGLZ5F58Z+UN2c6gjZs5XLMsYHwP5pInpyR2pSzdKekwgXZb2ixZKe3WAQ6FXix/FmfX+rNUnPMhzunPvyb4A9NSTE68qupLghOkWEVW6x8vghUVXznhw5rUYloKHfj9dsFNgbnLosg/aY2uBpz9Wxv6ABIDxOC0LKdA4yBkGdBqmUKqJBpEuksyYYN4e2Fdvdfxhyu+2BRUh9V0DjfwOgyXksYSeCsNTxUyMS+06tWRLjT9J68NZyfeR9quLZQStD7mq8V8sI9hrBY/H4tq7fyot+wLI/zEZNpDnp/9enA5Y8BaCVj1OByFHg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=1Vr1RQIUEWnzmw+cIQYh4Tn4MnqQJJGLaUzabnprzlQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179554338794390.6474982166161;
	Tue, 24 Nov 2026 10:03:07 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Wed, 25 Nov 2026 02:02:42 +0800
Subject: [PATCH v2 4/5] platform/x86: lenovo-wmi-other: Constify
 tunable_attr_01 variables
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
Message-Id: <20261125-lwmi-no-singleton-v2-4-37611a7b2fc4@rong.moe>
References: <20261125-lwmi-no-singleton-v2-0-37611a7b2fc4@rong.moe>
In-Reply-To: <20261125-lwmi-no-singleton-v2-0-37611a7b2fc4@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

The driver declares `.no_singleton = true' but stores device-specific
data to statically allocated tunable_attr_01 variables. This violates
the requirements of a no_singleton driver (even though no device in wild
ever has more than one such WMI device).

Add unique indexes to all statically allocated tunable_attr_01 variables
with some __COUNTER__ tricks, and use them to access lwmi_om_priv's
newly-introduced tunable_attr_01_ctx array. In this manner, move all
device-specific data to the tunable_attr_01_ctx array, and constify all
statically allocated tunable_attr_01 variables to make the driver a
truly no_singleton driver.

Fixes: 03bb5147da08 ("platform/x86: lenovo-wmi-other: Limit adding attributes to supported devices")
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Rephrase the commit message (thanks Mark Pearson)
---
 drivers/platform/x86/lenovo/wmi-other.c | 54 ++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index b451facf5846..8551edd94c9c 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -134,15 +134,23 @@ struct tunable_attr_01 {
 	u8 device_id;
 	u8 feature_id;
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

