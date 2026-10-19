Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422252;
	b=XNDLmdts8c3WmxhXcFj/zgfRAJsAt2fCJBPpoR4ApRnaY9TtY3yzxX/x39NIxjTNZRi3
	 ckrg1RL3QLk7+RODFJCKaooE6GqSVDfHxG9YN7MXT+MkbfkqpiBeyfDJRGvcTcl3MrebM
	 MiQhKAvj1rru9c2upZCvfzj1lK6R4Td4xSNfv7g3gCh8ucnC/+90ALBfBYaD7cFYTLRXb
	 TaREFmOrL0yLdWCKRzCN8NylGATY71Z5xOMyPlFEizSntju6maoh2zBG5eAwDyLreu9Lf
	 4KvibbkvjjqfLD6VC7pUPCCFQW/B5pM60Hyh8WLQUxpqYmQ6sLaaBzQdGe78mEnTYDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422252;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=omVTKij4X4glQVWORkAGhbDtdBZqVSiTbkudax5EPv0=;
	b=PMl68EG9YsW+0Ne0EUlSHHVEQKFsBr3SHPyoqoANb7wxMxQit2HfM9rod51mjP2xvv0b
	 qO3voHiXVDbTlHs2dmbD4dE4jvmTShEHmYM2TbUlZ735l8n6gtt6Hq7Q9ZeymG/c9gsL8
	 1/p6mzITAAJDzAfGq7Dq931TE/1ecukm7YWhLvI6AdqWpUXU1OeSPYHisljMFNhjF9xuQ
	 63AzdWIPUo/fweh91whaMzR3b+YPZfr/Qfmo/Dh1qUc2dCQWWuBuOg9k+iS/0D3QQPVjV
	 krVuL4QQVzRbGXjESSRwdazK3mCUVXa25fowSELmv9SZ/+Fs8rdldtv5D0EZKA4xb0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=MTffdrbj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622B6607F481;
	Mon, 19 Oct 2026 15:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 622B6607F481
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=MTffdrbj
ARC-Seal: i=1; a=rsa-sha256; t=1792422197; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PfBJ1nXk0T/orR3Zl5lobuqusL+dj+a/raVB4cNtimkhzAsXKvmN1q7kzSiebPLTKi2MFvoVJt+lZznb22BbrE88dQ/wpgxZUpsz1qjex3tFkYKT++26kjw9uga8MQ5btoRCT563c5S1x9d4glMl/T9QhXLYRqgPhGjvGSLlc9A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792422197; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=omVTKij4X4glQVWORkAGhbDtdBZqVSiTbkudax5EPv0=; 
	b=NhPT5Qhgyde3vJ9M+TF0+WebBYkmy7+vri3M4QGsNCH2gCWwz+PSx8pXPIBwFuNNG56C4y+rJRlirMBWItW5/oYEuVMkJgOHH8ffYPLCOzqh5WuOkhDwY/vC83kuVBFvPS1jy6d0TddUXvZqKtCqXkhkpiEEI+MnafPhXR5zj6M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792422197;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=omVTKij4X4glQVWORkAGhbDtdBZqVSiTbkudax5EPv0=;
	b=MTffdrbjzVwk0SAhK0bWtbHWYPxUUMTVqVvBF8jdZosnCwiQVbkrXyjvHhnlJYNF
	hNskQ85sM2DQ4sMxBqrup280otnFpeZ4EROLcJjS06KJBerZQg4zvD7Vy1HuGW4Ivsc
	qLRe7BXWJIxjFeIu2WF2hiOGlrhA5aYQWv7GzrQtgBfLWdXnNpjR9q2G6VquaL8cIo/
	AymYTLV5hRGouXPzXd+XWnMPW1keygAys20WvqnP3OXWT4x0mFHF+5DNzT56jiUKemZ
	PREbncuiSfd6KI6Jb579XknbxHIgPyFg5fkGyyLC8ALBO2/owIVQPUnE88qZYCE+rik
	YBHPvOEqBQ==
Received: by smtp.zohomail.com with SMTPS id 1792422193677321.60863692689475;
	Mon, 19 Oct 2026 08:03:13 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 19 Oct 2026 23:02:28 +0800
Subject: [PATCH v5 06/12] platform/x86: lenovo-wmi-{capdata,other}: Only
 allocate capdata list when necessary
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261019-lwmi-wmi-new-api-v5-6-71557d28d058@rong.moe>
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
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
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

