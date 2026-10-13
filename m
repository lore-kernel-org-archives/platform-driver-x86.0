Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BC253F6A9;
	Tue, 13 Oct 2026 19:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919683; cv=pass; b=ci1oWbVIWsKVFmIsUoKEZzZaVLnbDZ0BStdKu4dDLED/EP+O1O5/DUI+WRfvrsZ+wsD3gYMu1JQvFn9U/uqFMCCBuxQeS+j3KVilYXBI3P4V3UM38+JMYX3FJ6tF26k3i8dLvUOsCT940KnVX1UN+3m/hZo2AISAyXdIZuz8+F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919683; c=relaxed/simple;
	bh=iRXUZqFPPpJ25YkGuCknxQTbLHCKfYV9llRV76+HIyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VAyR6+VWv1woi2202ZlirivlI79F83zYG7+8uqe99syLJftOthtEp8wUlRbqtYnnow2cW3ARwsrGgaUl9D5TN8Ue9GbLvEk4ql9p/NOQSUMWzWB4/NOCC8oecAq0e0QEREl1TikUq4+TXrme43anPTGeWWxLkvFI2ElM7g41aPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=XJSrhWYO; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="XJSrhWYO"
ARC-Seal: i=1; a=rsa-sha256; t=1791919617; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jc3aKoRBNdnncmXJVuPjMsjLJNhoVEgT+tXDlL2BfD+3W7sPWgAfprQXjt/obbPJOeOvdBLkm3+as1pVTxbu6CyQkPP/McDg/h6yONAnr9hUJ2vMWhkyRUwgTT7WXyavSBaZSaLggU1GqLvho/dkdkyPE7DSOnZQhArzj2onJEE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791919617; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oGfX1urLw9UobKagc1pefW/2V9yNTK3tkxEu83nmGzQ=; 
	b=bUthvWJgghei9fuAcG1pqOGvOw8P0ZPiDJlhGf4cUk+tStLoAVwCpqGC/He2HzEZKSGoYhTo3NAPgJ2cdZhNmrqdUAy+Rn1xdehVa/vzNcycdYeiHdHYYCylIuaN74/hgGjAVPFU5IG/TbtZJQcEE8RRFL6yfeiRQNQPS30tNC8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791919617;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=oGfX1urLw9UobKagc1pefW/2V9yNTK3tkxEu83nmGzQ=;
	b=XJSrhWYOntmPZWyfBeyKufQHaWWDhIyX2JxK0KAE4rNpNKGEpKhes0EL2D/nO0eT
	ZGY1+Z/Ctlit3YdYTwwsXtEwTVRDKe4L0PcWJNdwEIBT5+qvQUAGl+L2XuzJvT0Cmd2
	Pv9yzL6xScOS1rdWqxygJv46gdFGAkLwsByZav11rAfaPiXejMWucwxpvH/CI3kKnjl
	rkkvGaBhw6p6eQmlyst/PqiktDcCTYfMKthEituC2ZtTTjFWc6WNf9MQW4erZBHQraZ
	c30z9YsI6rXn0ejYMqlnShhqkuidVmZ/HJUBzxwOvWaw7vZW+SoxT6ZBIO+uu9r1y58
	llxlyFh8iw==
Received: by smtp.zohomail.com with SMTPS id 1791919616834128.51599979007904;
	Tue, 13 Oct 2026 12:26:56 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 14 Oct 2026 03:21:49 +0800
Subject: [PATCH v3 06/12] platform/x86: lenovo-wmi-{capdata,other}: Only
 allocate capdata list when necessary
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261014-lwmi-wmi-new-api-v3-6-e1032bed1c81@rong.moe>
References: <20261014-lwmi-wmi-new-api-v3-0-e1032bed1c81@rong.moe>
In-Reply-To: <20261014-lwmi-wmi-new-api-v3-0-e1032bed1c81@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, 
 Navon John Lukose <navonjohnlukose@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-73bef
X-ZohoMailClient: External

When no capability data is available, there is no need to allocate
capability data list as it's basically unused except for the
priv->list->count == 0 placeholder.

Therefore, only allocate priv->list when necessary, otherwise its
absence implies the absence of capability data. In this manner,
lenovo-wmi-other can skip registering unavailable functionalities
accordingly. Meanwhile, skip creating the debugfs directory as it
provides nothing when there is no capability data.

Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Refine line wrap (thanks Ilpo Järvinen)
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 42 ++++++++++++++++++++++---------
 drivers/platform/x86/lenovo/wmi-other.c   | 24 +++++++++++-------
 2 files changed, 45 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 3ef8879d8587..3c09bb9e3d46 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -313,8 +313,8 @@ static const struct component_ops lwmi_cd_component_ops = {
  * @dev: The sub-master capdata basic device.
  *
  * Call component_bind_all to bind the sub-component device to the sub-master
- * device. On success, collect the pointer to the sub-component list and try
- * to call the master callback.
+ * device. On success, collect the pointer (or ERR_PTR(-ENODEV) if it's stubbed)
+ * to the sub-component list and try to call the master callback.
  *
  * Return: 0 on success, or an error code.
  */
@@ -328,7 +328,7 @@ static int lwmi_cd_sub_master_bind(struct device *dev)
 	if (ret)
 		return ret;
 
-	priv->sub_master->sub_component_list = sub_component_list;
+	priv->sub_master->sub_component_list = sub_component_list ?: ERR_PTR(-ENODEV);
 	lwmi_cd_call_master_cb(priv);
 
 	return 0;
@@ -460,6 +460,9 @@ static const struct component_ops lwmi_cd_sub_component_ops = {
 	{											\
 		u8 idx;										\
 												\
+		if (WARN_ON(!list))								\
+			return -EINVAL;								\
+												\
 		guard(mutex)(&list->list_mutex);						\
 		for (idx = 0; idx < list->count; idx++) {					\
 			if (list->_cdxx[idx].id != attribute_id)				\
@@ -571,6 +574,9 @@ DEFINE_SHOW_ATTRIBUTE(lwmi_cd_debugfs);
  */
 static void lwmi_cd_debugfs_add(struct lwmi_cd_priv *priv)
 {
+	if (!priv->list)
+		return;
+
 	priv->debugfs_dir = lwmi_debugfs_create_dir(priv->wdev);
 
 	debugfs_create_file("capdata", 0444, priv->debugfs_dir, priv, &lwmi_cd_debugfs_fops);
@@ -582,6 +588,7 @@ static void lwmi_cd_debugfs_add(struct lwmi_cd_priv *priv)
  */
 static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
 {
+	/* Debugfs can handle NULL dir, no need to check. */
 	debugfs_remove_recursive(priv->debugfs_dir);
 	priv->debugfs_dir = NULL;
 }
@@ -645,6 +652,9 @@ static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
  */
 static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 {
+	if (!priv->list)
+		return 0;
+
 	/* Synchronize mutex initialization. Paired with lwmi_cd_finalize(). */
 	if (!smp_load_acquire(&priv->initialized))
 		return __lwmi_cd_cache(priv);
@@ -708,6 +718,9 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
 		count = 0;
 	}
 
+	if (!count)
+		return 0;
+
 	list = devm_kzalloc(&priv->wdev->dev, struct_size(list, cd_fan, count), GFP_KERNEL);
 	if (!list)
 		return -ENOMEM;
@@ -743,6 +756,8 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
 	int count;
 
 	count = wmidev_instance_count(priv->wdev);
+	if (!count)
+		return 0;
 
 	switch (priv->info->type) {
 	case LENOVO_CAPABILITY_DATA_00:
@@ -892,7 +907,8 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 		enum lwmi_cd_type sub_component_type = LENOVO_FAN_TEST_DATA;
 		struct capdata00 capdata00;
 
-		ret = lwmi_cd00_get_data(priv->list, LWMI_ATTR_ID_FAN_TEST, &capdata00);
+		ret = priv->list ? lwmi_cd00_get_data(priv->list, LWMI_ATTR_ID_FAN_TEST,
+						      &capdata00) : -ENODATA;
 		if (ret || !(capdata00.supported & LWMI_SUPP_VALID)) {
 			dev_dbg(&wdev->dev, "capdata00 declares no fan test support\n");
 			sub_component_type = CD_TYPE_NONE;
@@ -913,14 +929,16 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 	case LENOVO_CAPABILITY_DATA_01:
 		priv->acpi_nb.notifier_call = lwmi_cd01_notifier_call;
 
-		ret = register_acpi_notifier(&priv->acpi_nb);
-		if (ret)
-			goto out;
+		if (priv->list) {
+			ret = register_acpi_notifier(&priv->acpi_nb);
+			if (ret)
+				goto out;
 
-		ret = devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister,
-					       &priv->acpi_nb);
-		if (ret)
-			goto out;
+			ret = devm_add_action_or_reset(&wdev->dev, lwmi_cd01_unregister,
+						       &priv->acpi_nb);
+			if (ret)
+				goto out;
+		}
 
 		ret = component_add(&wdev->dev, &lwmi_cd_component_ops);
 		goto out;
@@ -938,7 +956,7 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 		lwmi_cd_debugfs_add(priv);
 
 		dev_dbg(&wdev->dev, "registered %s with %u items\n",
-			info->name, priv->list->count);
+			info->name, priv->list ? priv->list->count : 0);
 	}
 	return ret;
 }
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index fbb32bf404f2..147e182685a1 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -1619,11 +1619,14 @@ static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
  * lenovo-wmi-other master driver, with a callback to collect fan info from
  * capdata_fan. On success, assign the capability data list pointers to the
  * driver data struct for later access. These pointers are only valid while the
- * capdata interfaces exist. Finally, collect fan info from capdata00 and
- * register all firmware attribute groups. Note that the HWMON device is
- * registered only if all fan info is collected. Hence, it is not registered
- * here. See lwmi_om_fan_info_collect_cd00() and
- * lwmi_om_fan_info_collect_cd_fan().
+ * capdata interfaces exist.
+ *
+ * If capdata00 is bound, collect fan info from capdata00 and register the power
+ * supply extension. Note that the HWMON device is registered only if all fan
+ * info is collected. Hence, it is not registered here. See
+ * lwmi_om_fan_info_collect_cd00() and lwmi_om_fan_info_collect_cd_fan().
+ *
+ * If capdata01 is bound, register all firmware attribute groups.
  *
  * Return: 0 on success, or an error code.
  */
@@ -1643,16 +1646,19 @@ static int lwmi_om_master_bind(struct device *dev)
 
 	priv->cd00_list = binder.cd00_list;
 	priv->cd01_list = binder.cd01_list;
-	if (!priv->cd00_list || !priv->cd01_list) {
+	if (!priv->cd00_list && !priv->cd01_list) {
 		component_unbind_all(dev, NULL);
 
 		return -ENODEV;
 	}
 
-	lwmi_om_fan_info_collect_cd00(priv);
-	lwmi_om_psy_ext_init(priv);
+	if (priv->cd00_list) {
+		lwmi_om_fan_info_collect_cd00(priv);
+		lwmi_om_psy_ext_init(priv);
+	}
 
-	lwmi_om_fw_attr_add(priv);
+	if (priv->cd01_list)
+		lwmi_om_fw_attr_add(priv);
 
 	return 0;
 }

-- 
2.55.0

