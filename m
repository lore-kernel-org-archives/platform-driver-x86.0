Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7BE369D7C;
	Sun, 13 Sep 2026 20:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332675; cv=pass; b=K4MEg/gPr6U5CKnbJFkr3aai9GO+hfDuIcZRfdwRD4hoB1RxKcVZseuFP4X68o6EUC/HRS2wL+lu9Ydni+QMw+IipYCDVawEdQdG1eTjoC2wpOXcC1Q2cojDRGQDuzkNtgf7XKEUa2gHCjfeWbGHsrnZp561N3Vqeh1dL+TEtkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332675; c=relaxed/simple;
	bh=4Iulpe0xHQceJQG8ACsvxWXwolEzEnojR200TkzITBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bpt967jXjQnK9xbss22N4FNlikPnxI2X+Vpln++bKf2KM3qsKaILTucBBEgLvaqClyW0yYpy8i5IDD+jD5xJ0AHY7Ex6dhAU6IbeISOUaXC9C1jc8+3ugPXPqlz9PVKgBiXmm/DBo4TTWYCZTxMe+MIZ6VaT9n4y8rCrvEfFfQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=pntnUv+f; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="pntnUv+f"
ARC-Seal: i=1; a=rsa-sha256; t=1789332640; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EgoM/CkBi2Dn0+gyosp+rgsbm47c3EqWYMFNtw1PS/Yd1Sw0MbRDSS8DUbdIf/E9EkFqZvKSaoEXy71tWnt5zfNCpOXGbWVJZ4TPmZ0z5OAqQcrpgd1EIdJZ4CXXBAFCUcoERrmHRxkvYvZnpSrjDhhSbtV1GX1smZFiBibjoRI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789332640; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=80ZfP9i37GSfGsF2Fhe7TLyYHVP9wOXmVluAG0L8mPo=; 
	b=HFRB/GIfpMW7N9DTG3pCsIyRQWkW2yiXhV+shGWirEoAI4zGSNQ4bgRvgT5sHOLF9enp6gBvd/poEcjz0rjrp6DhRTbwdak8AVZGiNOSfe++wIw2p+uQZvKR0BOOLH4dlVKnGAhZiM9wLYbKTVy1eBI5Vk1o/9fE/OZddQ4Amuw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789332640;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=80ZfP9i37GSfGsF2Fhe7TLyYHVP9wOXmVluAG0L8mPo=;
	b=pntnUv+f6jEkD4xNQUWI3wprknj52TUEWq4mYzJhL2NYZzo8jUyinf0zdKL4g3qI
	mu0BIs2If8gjn3hEqemXSmgHq3U4r8uMNHSgb8Ia2beSbwA06pUZil1gfKF3nVypYq/
	0cYidKICsSITuyp/Kr8noChNS2AFV62a9WaA/ro4TRLkun22JqBbOkBH9Ehn/bUMLgC
	6bdXCtM1QCrOkf8RmwBycPy2cxK/5+HF1Da7sJ5iiSpsl3D2okaNX13o1u9HIqua5MT
	4dYeIqJxH8fI/GfFy7ipPWs1mKPO9J4VKKEaxB2AChCaIXt127YRzcxwVP+YoR3y4mj
	nroH6g9CRA==
Received: by smtp.zohomail.com with SMTPS id 178933263996357.370519965290555;
	Sun, 13 Sep 2026 13:50:39 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 14 Sep 2026 04:50:25 +0800
Subject: [PATCH 4/9] platform/x86: lenovo-wmi-{capdata,other}: Only
 allocate capdata list when necessary
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-lwmi-wmi-new-api-v1-4-7a400f2f69f8@rong.moe>
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

When no capability data is available, there is no need to allocate
capability data list as it's basically unused except for the
priv->list->count == 0 placeholder.

Therefore, only allocate priv->list when necessary, otherwise its
absence implies the absence of capability data. In this manner,
lenovo-wmi-other can skip registering unavailable functionalities
accordingly. Meanwhile, skip creating the debugfs directory as it
provides nothing when there is no capability data.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 43 ++++++++++++++++++++++---------
 drivers/platform/x86/lenovo/wmi-other.c   | 11 +++++---
 2 files changed, 38 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 0123ec8f7b53..793b5103d533 100644
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
 	if (!priv->initialized)
 		return __lwmi_cd_cache(priv);
 
@@ -707,6 +717,9 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
 		count = 0;
 	}
 
+	if (!count)
+		return 0;
+
 	list = devm_kzalloc(&priv->wdev->dev, struct_size(list, cd_fan, count), GFP_KERNEL);
 	if (!list)
 		return -ENOMEM;
@@ -742,6 +755,8 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
 	int count;
 
 	count = wmidev_instance_count(priv->wdev);
+	if (!count)
+		return 0;
 
 	switch (priv->info->type) {
 	case LENOVO_CAPABILITY_DATA_00:
@@ -884,7 +899,9 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 		enum lwmi_cd_type sub_component_type = LENOVO_FAN_TEST_DATA;
 		struct capdata00 capdata00;
 
-		ret = lwmi_cd00_get_data(priv->list, LWMI_ATTR_ID_FAN_TEST, &capdata00);
+		ret = priv->list
+			? lwmi_cd00_get_data(priv->list, LWMI_ATTR_ID_FAN_TEST, &capdata00)
+			: -ENODATA;
 		if (ret || !(capdata00.supported & LWMI_SUPP_VALID)) {
 			dev_dbg(&wdev->dev, "capdata00 declares no fan test support\n");
 			sub_component_type = CD_TYPE_NONE;
@@ -905,14 +922,16 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
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
@@ -930,7 +949,7 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 		lwmi_cd_debugfs_add(priv);
 
 		dev_dbg(&wdev->dev, "registered %s with %u items\n",
-			info->name, priv->list->count);
+			info->name, priv->list ? priv->list->count : 0);
 	}
 	return ret;
 }
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index fbb32bf404f2..e6c8f6bcf050 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -1643,16 +1643,19 @@ static int lwmi_om_master_bind(struct device *dev)
 
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

