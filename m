Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422230;
	b=G5AIOveYtX9oeYO8Tg8KK6PkLAsMrARJvfzVXe1lOlA1rgU6PFsS4uXalxWU9e6C2GId
	 FO5pElylrFlM7g1dS7hQbxC1N9jr7/m+oTjU83Lq00kxr1t/uxAek3xAup4XI0tXEqH15
	 CRvJo1NE4T7VpNGzgMek4j0z+pvzPHbL9UusJTsXd4SsSLt+Z+Ubbn9HYP8J3uMxeLXqo
	 TrV7FbPiEqDvQtA5GwwioZRHv+v1b1Sj44dWeuq4ZtvTxzTNo8uDPGDHhk+5SpqxNMYaO
	 kawnkC8fpS647H3h4ayP4mSn9od/Kqru6owtrVnFBe39/ZcHLy8idH8W1WFr3YSF4ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422230;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=lax5mvzMdQMj5q0NwoMYFOyVhPZc0MFLMC9gpb4+qck=;
	b=vUHWXKY0uYq4W8NvooaGfImzTI2Dr+HA7WNQ3awZYJFkm1JIciTdXDKQZyY/1JAwvfKN
	 1UcM/VE4gi5zGXng1GEPgexKK4L190j3ULV0SLfhJnWIR7Zgtb5ULEXwL8uY37nqAYzHE
	 pngqiPGCtEvB8ST+V9h4IIBIeHARbTNeQ39KaqD90yWUovmZd78myKRM8G0VEuddKsedl
	 6jCdTkv7RHJp+3PY4gUmmBpKE2UhugBEQuVzRvEj4xkZmHuK3KeP+EqcDPqLOcij3VQAe
	 MOomkjKQnagXp/Pb/52xEA6uHwY91jGojjSFk367txY2XUHdpymoNyo0rpVpsz2HvDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=dDbrNC3F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A20607DC60;
	Mon, 19 Oct 2026 15:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24A20607DC60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=dDbrNC3F
ARC-Seal: i=1; a=rsa-sha256; t=1792422189; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aPh5a5Q8tHv8aIibJjHEsGSnaLUbyMKW0cPbsnGMe/SmTANsCUDGNJ/s5Lvukhnm4GQMXFXFBGZEyiJdzZUSIVd6X3yICs1MBlmfgzOGq9UPP9E0f0txjygjKAc4mWyM4F8X+wgOlScdarpWJw6/1AeSUYpjH/KDRtntm+6ngq0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792422189; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lax5mvzMdQMj5q0NwoMYFOyVhPZc0MFLMC9gpb4+qck=; 
	b=CYyzQbvrIlTN6sH/BPvasq3f3NzvTMdnBwo/4ehA8xt0ll5HvZ7u2FTNd4FxD0rNSmJA643xher/ZVuvffM5SHvkmNF0teIOSBs4H8kRAUxES0jpWwBfiYatJsnNKkzQiBfn21yevxR11iuhJVyazbF9XjIQaMvIuOm9Ak5Fxbw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792422189;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=lax5mvzMdQMj5q0NwoMYFOyVhPZc0MFLMC9gpb4+qck=;
	b=dDbrNC3FBeG5X2pbUTwlt8+YiEqnib6+avkP1aorTfRHATIArQbjn3K6z/ArCF8i
	suu4riixTWpp+pOEPuXxiMeig6GXzKGzl1ckqniPOCv3my9GgTl3pwUu6NDSh7exbof
	OhUtUdGp2AUxGKjpwlPXpTHFB9qwsLNF2ExoMby4YTEKHoz0wE7xl0hvuUfll1+15JB
	oKTX5hazQR6ByYe7kpUKfH6bZtlq+MfkQAeLUGBkV9Yyecc6RFKUSm7LYbUEpwRdB3X
	0pqEDvd0QTXunN7NBitqu9iB156cJaL0dMrSYYYZF/zvX6dsYAVz8BH2hbe2gi9B5mL
	zi+XpHM9YQ==
Received: by smtp.zohomail.com with SMTPS id 179242218698720.98992502407168;
	Mon, 19 Oct 2026 08:03:06 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 19 Oct 2026 23:02:26 +0800
Subject: [PATCH v5 04/12] platform/x86: lenovo-wmi-capdata: Store a pointer
 to component info
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
Message-Id: <20261019-lwmi-wmi-new-api-v5-4-71557d28d058@rong.moe>
References: <20261019-lwmi-wmi-new-api-v5-0-71557d28d058@rong.moe>
In-Reply-To: <20261019-lwmi-wmi-new-api-v5-0-71557d28d058@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, 
 Navon John Lukose <navonjohnlukose@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-6be7c
X-ZohoMailClient: External

In the following changes, priv->list will become optional (i.e.,
NULLable). IOW, the type of the component cannot be reliable retrieved
from priv->list->type.

Store a pointer to component info so that the component type is always
available. In this manner, priv->list->type can be eliminated. Note that
the component type check in lwmi_cd*_get_data() must be removed due to
it being called without the availability of priv. Removing it should be
fine as the capdata APIs are really internal methods and their caller,
i.e., lenovo-wmi-other, always passes a matched list.

This also eliminates the need to pass the component type along setup
functions.

Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 44 +++++++++++++------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index fbe2ba627ff5..5748859f8101 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -87,6 +87,7 @@ static const struct lwmi_cd_info {
 
 struct lwmi_cd_priv {
 	struct notifier_block acpi_nb; /* ACPI events */
+	const struct lwmi_cd_info *info;
 	struct wmi_device *wdev;
 	struct cd_list *list;
 	struct dentry *debugfs_dir;
@@ -108,7 +109,6 @@ struct lwmi_cd_priv {
 
 struct cd_list {
 	struct mutex list_mutex; /* list R/W mutex */
-	enum lwmi_cd_type type;
 	u8 count;
 
 	union {
@@ -137,7 +137,7 @@ static int lwmi_cd_match(struct device *dev, void *type)
 		return false;
 
 	priv = dev_get_drvdata(dev);
-	return priv->list->type == *(enum lwmi_cd_type *)type;
+	return priv->info->type == *(enum lwmi_cd_type *)type;
 }
 
 /**
@@ -254,7 +254,7 @@ static int lwmi_cd_component_bind(struct device *cd_dev,
 	struct lwmi_cd_priv *priv = dev_get_drvdata(cd_dev);
 	struct lwmi_cd_binder *binder = data;
 
-	switch (priv->list->type) {
+	switch (priv->info->type) {
 	case LENOVO_CAPABILITY_DATA_00:
 		binder->cd00_list = priv->list;
 
@@ -452,14 +452,11 @@ static const struct component_ops lwmi_cd_sub_component_ops = {
  *
  * Return: 0 on success, or -EINVAL.
  */
-#define DEF_LWMI_CDXX_GET_DATA(_cdxx, _cd_type, _output_t)					\
+#define DEF_LWMI_CDXX_GET_DATA(_cdxx, _output_t)						\
 	int lwmi_##_cdxx##_get_data(struct cd_list *list, u32 attribute_id, _output_t *output)	\
 	{											\
 		u8 idx;										\
 												\
-		if (WARN_ON(list->type != _cd_type))						\
-			return -EINVAL;								\
-												\
 		guard(mutex)(&list->list_mutex);						\
 		for (idx = 0; idx < list->count; idx++) {					\
 			if (list->_cdxx[idx].id != attribute_id)				\
@@ -470,13 +467,13 @@ static const struct component_ops lwmi_cd_sub_component_ops = {
 		return -EINVAL;									\
 	}
 
-DEF_LWMI_CDXX_GET_DATA(cd00, LENOVO_CAPABILITY_DATA_00, struct capdata00);
+DEF_LWMI_CDXX_GET_DATA(cd00, struct capdata00);
 EXPORT_SYMBOL_NS_GPL(lwmi_cd00_get_data, "LENOVO_WMI_CAPDATA");
 
-DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdata01);
+DEF_LWMI_CDXX_GET_DATA(cd01, struct capdata01);
 EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CAPDATA");
 
-DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_fan);
+DEF_LWMI_CDXX_GET_DATA(cd_fan, struct capdata_fan);
 EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CAPDATA");
 
 /* ======== debugfs ======== */
@@ -550,15 +547,14 @@ static int lwmi_cd_debugfs_show(struct seq_file *s, void *data)
 
 	guard(mutex)(&priv->list->list_mutex);
 
-	/* lwmi_cd_alloc() ensured priv->list->type must be a valid type. */
 	for (idx = 0; idx < priv->list->count; idx++) {
-		seq_printf(s, "%s[%u]:\n", lwmi_cd_table[priv->list->type].name, idx);
+		seq_printf(s, "%s[%u]:\n", priv->info->name, idx);
 
-		if (priv->list->type == LENOVO_CAPABILITY_DATA_00)
+		if (priv->info->type == LENOVO_CAPABILITY_DATA_00)
 			lwmi_cd00_show(s, &priv->list->cd00[idx]);
-		else if (priv->list->type == LENOVO_CAPABILITY_DATA_01)
+		else if (priv->info->type == LENOVO_CAPABILITY_DATA_01)
 			lwmi_cd01_show(s, &priv->list->cd01[idx]);
-		else if (priv->list->type == LENOVO_FAN_TEST_DATA)
+		else if (priv->info->type == LENOVO_FAN_TEST_DATA)
 			lwmi_cd_fan_show(s, &priv->list->cd_fan[idx]);
 	}
 
@@ -603,7 +599,7 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 	int idx;
 	void *p;
 
-	switch (priv->list->type) {
+	switch (priv->info->type) {
 	case LENOVO_CAPABILITY_DATA_00:
 		p = &priv->list->cd00[0];
 		size = sizeof(priv->list->cd00[0]);
@@ -706,14 +702,13 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_lis
 /**
  * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
  * @priv: lenovo-wmi-capdata driver data.
- * @type: The type of capability data.
  *
  * Allocate a cd_list struct large enough to contain data from all WMI data
  * blocks provided by the interface.
  *
  * Return: 0 on success, or an error.
  */
-static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
+static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
 {
 	struct cd_list *list;
 	size_t list_size;
@@ -721,7 +716,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 
 	count = wmidev_instance_count(priv->wdev);
 
-	switch (type) {
+	switch (priv->info->type) {
 	case LENOVO_CAPABILITY_DATA_00:
 		list_size = struct_size(list, cd00, count);
 		break;
@@ -747,7 +742,6 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 	if (ret)
 		return ret;
 
-	list->type = type;
 	list->count = count;
 	priv->list = list;
 
@@ -757,7 +751,6 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 /**
  * lwmi_cd_setup() - Cache all WMI data block information
  * @priv: lenovo-wmi-capdata driver data.
- * @type: The type of capability data.
  *
  * Allocate a cd_list struct large enough to contain data from all WMI data
  * blocks provided by the interface. Then loop through each data block and
@@ -765,11 +758,11 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
  *
  * Return: 0 on success, or an error code.
  */
-static int lwmi_cd_setup(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
+static int lwmi_cd_setup(struct lwmi_cd_priv *priv)
 {
 	int ret;
 
-	ret = lwmi_cd_alloc(priv, type);
+	ret = lwmi_cd_alloc(priv);
 	if (ret)
 		return ret;
 
@@ -842,10 +835,11 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->info = info;
 	priv->wdev = wdev;
 	dev_set_drvdata(&wdev->dev, priv);
 
-	ret = lwmi_cd_setup(priv, info->type);
+	ret = lwmi_cd_setup(priv);
 	if (ret)
 		goto out;
 
@@ -911,7 +905,7 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
 
 	lwmi_cd_debugfs_remove(priv);
 
-	switch (priv->list->type) {
+	switch (priv->info->type) {
 	case LENOVO_CAPABILITY_DATA_00:
 		lwmi_cd_sub_master_del(priv);
 		fallthrough;

-- 
2.55.0

