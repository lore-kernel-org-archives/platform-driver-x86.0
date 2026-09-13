Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1280637E5E9;
	Sun, 13 Sep 2026 20:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332657; cv=pass; b=GB9KkIYQMrJ/BEeAf/7K0jO4z65K3D2t5uIl6OD93cJtf3ow9CV4UKSEBxJwpVFFygw6n2mF8z6fqEC2h2BC+OwLd9qhhvZRNWuqMwjkmywNFvpmu4WOSJDZIlVPg7yiBHckQyxjsdyJzZvkabpQLzznXhY4yeBuy7Q4nLtgQso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332657; c=relaxed/simple;
	bh=PZKD+TZqXk983BA5ghI12sxmqS+qbdOrtBXiFovKh80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iy5N78RFmmF9V8fiQrMCEWVzsxZ28YSMCpbecBaG/rOE5xG7U8EL/sJmQekuawCsqHqthoeCyyYkexiUPVafWNZGoSDBsFEqcu4e5w01YOtGe/4BtF58jifN0F9CJxhoo1EFQSmiQtEcizx/NDWZF1bO9tpPg7dtCoBoPcomt+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=CVbUZv1e; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="CVbUZv1e"
ARC-Seal: i=1; a=rsa-sha256; t=1789332636; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pp52veHur0T4eqkK+F8njMnIZS4RYOvTbZarJuJe/wTK8bIxC4loYFhJyrnaeQb/bRVLeRw1r0Pc+iwN6EDVrDaBKcYkkzjE6Ln5sqA3qM90RG9rBxOOHJq4ZsL7A9sEXPjWdaCiajU6jHan9r28duP/ddQLDfQ8b/r58JWwDJk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789332636; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5qqAx6oe9xriIxfBryrhNEbVbUw/GGX/ebb7CoPUr7Y=; 
	b=O9XHm1938qBOw9m1CdEVlzhnVJudiul7LdT13kopphTRF9lsMq8ZWHiudRT/fcMTR4HBLFnF1eBG69F9AbpUbXmdTRQVqmwtPF7P4vF3qAcUuUR4ioCdh6FlfLvO4/semE+RG/W+Pou0ngZCTXp6Mzc7lj59fr3S8PWRQO6iQSU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789332636;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5qqAx6oe9xriIxfBryrhNEbVbUw/GGX/ebb7CoPUr7Y=;
	b=CVbUZv1ejqMy34o5X34ClR596ZQ54ACgMVR16c5JvUiEojYENDPHPTBYMWfnjDK6
	U6po8gdGrJr9dynqt5GHpeKNhu/9hYlP7HXTHDuDwC++UFYZcjPq0rFk0rN22pmc54k
	1Go6lR+WQ4RFCdvXo9cw5vy32EY4G75okbgqYYJ8y9zifMF/58BWtJixTVS5LQgIwrX
	kr0m1x409n9FRHUPurOLFgkDDB2F9T6uhDsyQrIYziXiCa0uiBBMEDeZsv1dkyAUznd
	6r0tnI7U6F7/JiLSA398HkzAA/18PbG8fgjTgn4xC+94/BO9HeOrBzIHy6aqsJ67mZk
	ifqMIDizZA==
Received: by smtp.zohomail.com with SMTPS id 1789332634589517.8181414359683;
	Sun, 13 Sep 2026 13:50:34 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 14 Sep 2026 04:50:23 +0800
Subject: [PATCH 2/9] platform/x86: lenovo-wmi-capdata: Store a pointer to
 component info
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-lwmi-wmi-new-api-v1-2-7a400f2f69f8@rong.moe>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
In-Reply-To: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
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

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 44 +++++++++++++------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index c9e4380a70d2..880ac444c206 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -87,6 +87,7 @@ static const struct lwmi_cd_info {
 
 struct lwmi_cd_priv {
 	struct notifier_block acpi_nb; /* ACPI events */
+	const struct lwmi_cd_info *info;
 	struct wmi_device *wdev;
 	struct cd_list *list;
 	struct dentry *debugfs_dir;
@@ -110,7 +111,6 @@ struct lwmi_cd_priv {
 
 struct cd_list {
 	struct mutex list_mutex; /* list R/W mutex */
-	enum lwmi_cd_type type;
 	u8 count;
 
 	union {
@@ -139,7 +139,7 @@ static int lwmi_cd_match(struct device *dev, void *type)
 		return false;
 
 	priv = dev_get_drvdata(dev);
-	return priv->list->type == *(enum lwmi_cd_type *)type;
+	return priv->info->type == *(enum lwmi_cd_type *)type;
 }
 
 /**
@@ -256,7 +256,7 @@ static int lwmi_cd_component_bind(struct device *cd_dev,
 	struct lwmi_cd_priv *priv = dev_get_drvdata(cd_dev);
 	struct lwmi_cd_binder *binder = data;
 
-	switch (priv->list->type) {
+	switch (priv->info->type) {
 	case LENOVO_CAPABILITY_DATA_00:
 		binder->cd00_list = priv->list;
 
@@ -454,14 +454,11 @@ static const struct component_ops lwmi_cd_sub_component_ops = {
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
@@ -472,13 +469,13 @@ static const struct component_ops lwmi_cd_sub_component_ops = {
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
@@ -552,15 +549,14 @@ static int lwmi_cd_debugfs_show(struct seq_file *s, void *data)
 
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
 
@@ -605,7 +601,7 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 	int idx;
 	void *p;
 
-	switch (priv->list->type) {
+	switch (priv->info->type) {
 	case LENOVO_CAPABILITY_DATA_00:
 		p = &priv->list->cd00[0];
 		size = sizeof(priv->list->cd00[0]);
@@ -708,14 +704,13 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_lis
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
@@ -723,7 +718,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 
 	count = wmidev_instance_count(priv->wdev);
 
-	switch (type) {
+	switch (priv->info->type) {
 	case LENOVO_CAPABILITY_DATA_00:
 		list_size = struct_size(list, cd00, count);
 		break;
@@ -749,7 +744,6 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 	if (ret)
 		return ret;
 
-	list->type = type;
 	list->count = count;
 	priv->list = list;
 
@@ -759,7 +753,6 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 /**
  * lwmi_cd_setup() - Cache all WMI data block information
  * @priv: lenovo-wmi-capdata driver data.
- * @type: The type of capability data.
  *
  * Allocate a cd_list struct large enough to contain data from all WMI data
  * blocks provided by the interface. Then loop through each data block and
@@ -767,11 +760,11 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
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
 
@@ -838,10 +831,11 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->info = info;
 	priv->wdev = wdev;
 	dev_set_drvdata(&wdev->dev, priv);
 
-	ret = lwmi_cd_setup(priv, info->type);
+	ret = lwmi_cd_setup(priv);
 	if (ret)
 		goto out;
 
@@ -907,7 +901,7 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
 
 	lwmi_cd_debugfs_remove(priv);
 
-	switch (priv->list->type) {
+	switch (priv->info->type) {
 	case LENOVO_CAPABILITY_DATA_00:
 		lwmi_cd_sub_master_del(priv);
 		fallthrough;

-- 
2.55.0

