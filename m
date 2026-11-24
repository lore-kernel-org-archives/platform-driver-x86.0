Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795543499;
	b=oJ5VRsntJYyBa4eLB+ZDHN3gsy4ndfMikC6c+R0nTS0bfVYyDwzkkgZScq45JTXlvkyr
	 aPsPnOSEWZZ+wAJ6b9bSx7x5xmIKXC74VvhW1ubBYrPF79u8S93tkjItC8NSSbtOuWX2W
	 aLwl41Ga7BilM5oz99dOcVa8Sn2HJD4w4VSkJLe9yVltGHU8X99n7rfj0zYEqmT5JYR2V
	 BzlVAQBFEzB04Uz/EO/vY6HS6QHGmtyht1wbYpwPD/PBC1LGPFbDtZq0FXNbOBBpS1IFQ
	 vH4gLNKEsgT4DPTEnkJzrSUP/F7z4TLxoe1kFuizvSccESoQiNxzwVAFp0h2urdRhoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543499;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=h4qKUfGnsjq2abmxctZVFiVOKJp9QkJ+CUTS7di0A0I=;
	b=FZCLstQdTuVezp/P2QS7mTcp2ooIGzTcmJuYphG5seVkdA74TH8Iwv6cnZErx5CLHLBJ
	 4sivODCTNjAkrnTNGeOrJ4/RUGgv49XbmF/7MB45DT5E0v9DnS9k2oLzWI+WAYYD9OAlJ
	 dQ9V2MprnFXjYN0T2CJZsUmxJ++eamV7EzfZ7/y5lTM7VfuzO2GMfRWZspb/Ef2XCq6rX
	 Q1cdMDRhPLHUmxzEM/ED08dC0dyOoGv9Yjw98ofxzx6a3PFTO2nA/JAHMFzyz666HXb22
	 Yj/BU9ZLQ5Z3svBXlRKJFbT3Z+jdpQI+BQKsVV62dfLjsATJU+TVG17oliIuDxzxEJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=kOboM+RR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03114606A339;
	Tue, 24 Nov 2026 18:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03114606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=kOboM+RR
ARC-Seal: i=1; a=rsa-sha256; t=1795543392; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ggy2f57M8RntcUjalG3Z1cO0FJ5whym8rQYiWhRx4K+WAQBOvJIn6R2MLRAWtxd5eI7AR4BKNiSeIMnqNcKdqm4hX2EEjI0kv51lHEM+MhhQ3RjNlLwPSXLsMODxf7u/Rr0LV6/04r2SMCiYPBVuQtYBp6vg9MvWjRdMxH3khMU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795543392; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=h4qKUfGnsjq2abmxctZVFiVOKJp9QkJ+CUTS7di0A0I=; 
	b=IM/NcinTy+el/dTD4ACGb6Qg1HG1QN0rm/yP7YylGZvB2N/4bkMDuLR5tI4QME5jllcKsRjuuyx99bqNQT0bOL64ZgWGaZ/WwG5WlLHxQBS1hFlhN/U7RskMA/HkcjaC8Ec9b9lwZZGYJqoSIrT5F80TTMUQL50/2dsbp4ys/Mk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=kOboM+RRv5zEXgEv7nKqxcpFxiRVGtbalV574FRQ0NIZLei7tREjZNNriokdRJCsxXpta74hFu1+P4RiEPkpAY90ylFyrgn2b9UOdzRrWovUsINTft6/3SzBCkPsJB7I5ul1PtPUk8uT9Z26HyGAqE7D0ildIPL4S5DAQVRF6UjKG866uvvHMangW+WT/YdnzXKmIH50vh4IcYvZUNx38CABbmbhMfI7nS+268zALub3HK2Pzm2vGeg6VB8oUhOtASwuosAkZNo8tVkTXxWmIOA0FuPwmcVj2vlpcSI5lNndx8r2siypgoCexrpyQwHa7FpkCSZQiODyZ9yOLo158A==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=h4qKUfGnsjq2abmxctZVFiVOKJp9QkJ+CUTS7di0A0I=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795543390478614.9844577949777;
	Tue, 24 Nov 2026 10:03:10 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Wed, 25 Nov 2026 02:02:43 +0800
Subject: [PATCH v2 5/5] platform/x86: lenovo-wmi-other: Hide unsupported
 attributes using is_visible() callback
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
Message-Id: <20261125-lwmi-no-singleton-v2-5-37611a7b2fc4@rong.moe>
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

Currently, all attribute groups are created individually with support
check beforehand. This is unnecessary as unsupported attributes can be
hidden by returning SYSFS_GROUP_INVISIBLE in the is_visible() callback of
the attribute group.

Refactor the lwmi_attr_01_is_supported() function, and wrap it with
lwmi_attr_01_is_visible(). In this manner, the capdata01_attr_group
array is now replaced by a standard attribute_group array, which can be
created and removed at once using sysfs_create_groups() and
sysfs_remove_groups().

A new field `initialized' is added to tunable_attr_01_ctx to prevent it
from being initialized twice, as lwmi_attr_01_is_visible() is called
twice with n == 0, in which once is against the group and the other is
against the first attribute. The field is cleared on unbind to make sure
the next rebind caused by userspace writing to the sysfs bind file won't
get leaked data.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-other.c | 118 +++++++++++++++++++-------------
 1 file changed, 72 insertions(+), 46 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 8551edd94c9c..b47b71fab2e7 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -140,6 +140,8 @@ struct tunable_attr_01 {
 struct tunable_attr_01_ctx {
 	u8 cd_mode_id; /* mode arg for searching capdata */
 	u8 cv_mode_id; /* mode arg for set/get current_value */
+
+	bool initialized;
 };
 
 enum { TUNABLE_ATTR_01_COUNTER_BASE = __COUNTER__ + 1 };
@@ -1039,11 +1041,6 @@ struct capdata01_attr {
 	};
 };
 
-struct capdata01_attr_group {
-	const struct attribute_group *attr_group;
-	const struct tunable_attr_01 *tunable_attr;
-};
-
 static inline struct lwmi_om_priv *kobj_to_om_priv(const struct kobject *kobj)
 {
 	return dev_get_drvdata(kobj_to_dev(kobj->parent));
@@ -1055,6 +1052,13 @@ kobj_attr_to_cd01_attr(const struct kobj_attribute *kattr)
 	return container_of_const(kattr, struct capdata01_attr, kobj_attr);
 }
 
+static inline const struct capdata01_attr *attr_to_cd01_attr(const struct attribute *attr)
+{
+	const struct kobj_attribute *kattr = container_of_const(attr, struct kobj_attribute, attr);
+
+	return kobj_attr_to_cd01_attr(kattr);
+}
+
 static inline struct tunable_attr_01_ctx *tunable_to_ctx(struct lwmi_om_priv *priv,
 							 const struct tunable_attr_01 *tunable_attr)
 {
@@ -1289,6 +1293,9 @@ static bool lwmi_attr_01_is_supported(struct lwmi_om_priv *priv,
 	struct capdata01 capdata;
 	int retval, ret, i;
 
+	if (ctx->initialized)
+		return true;
+
 	/* Determine cd_mode_id  */
 	for (i = 0; i < ARRAY_SIZE(modes); i++) {
 		args.arg0 = tunable_attr_01_id(tunable_attr, modes[i]);
@@ -1328,7 +1335,32 @@ static bool lwmi_attr_01_is_supported(struct lwmi_om_priv *priv,
 	dev_dbg(&priv->wdev->dev, "cv_mode_id: %#010x, attribute support level: %#010x\n",
 		args.arg0, capdata.supported);
 
-	return capdata.supported > 0;
+	ctx->initialized = true;
+	return true;
+}
+
+/**
+ * lwmi_attr_01_is_visible() - Determine if the given attribute is visible.
+ * @kobj: Pointer to the driver object.
+ * @attr: Pointer to the attribute calling this function.
+ * @n: @attr is the N-th attribute.
+ *
+ * Return: umode_t or SYSFS_GROUP_INVISIBLE.
+ */
+static umode_t lwmi_attr_01_is_visible(struct kobject *kobj, const struct attribute *attr, int n)
+{
+	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
+
+	/* Only grab tunable_attr here as not all attributes are cd01_attr. */
+	if (n == 0) {
+		const struct capdata01_attr *cd01_attr = attr_to_cd01_attr(attr);
+		const struct tunable_attr_01 *tunable_attr = cd01_attr->tunable_attr;
+
+		if (!lwmi_attr_01_is_supported(priv, tunable_attr))
+			return SYSFS_GROUP_INVISIBLE;
+	}
+
+	return attr->mode;
 }
 
 /* Lenovo WMI Other Mode Attribute macros */
@@ -1377,6 +1409,7 @@ static bool lwmi_attr_01_is_supported(struct lwmi_om_priv *priv,
 	static const struct attribute_group _attrname##_attr_group = {    \
 		.name = #_attrname,                                       \
 		.attrs_const = _attrname##_attrs,                         \
+		.is_visible_const = lwmi_attr_01_is_visible,              \
 	}
 
 /* CPU tunable attributes */
@@ -1427,30 +1460,30 @@ LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ppab,
 LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_temp,
 			      "Set the GPU thermal load limit");
 
-static struct capdata01_attr_group cd01_attr_groups[] = {
-	{ &cpu_temp_attr_group, &cpu_temp },
-	{ &dgpu_boost_clk_attr_group, &dgpu_boost_clk },
-	{ &dgpu_didvid_attr_group, &dgpu_didvid },
-	{ &dgpu_enable_attr_group, &dgpu_enable },
-	{ &gpu_mode_attr_group, &gpu_mode },
-	{ &gpu_nv_ac_offset_attr_group, &gpu_nv_ac_offset },
-	{ &gpu_nv_bpl_attr_group, &gpu_nv_bpl },
-	{ &gpu_nv_cpu_boost_attr_group, &gpu_nv_cpu_boost },
-	{ &gpu_nv_ctgp_attr_group, &gpu_nv_ctgp },
-	{ &gpu_nv_ppab_attr_group, &gpu_nv_ppab },
-	{ &gpu_temp_attr_group, &gpu_temp },
-	{ &ppt_cpu_cl_attr_group, &ppt_cpu_cl },
-	{ &ppt_pl1_apu_spl_attr_group, &ppt_pl1_apu_spl },
-	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
-	{ &ppt_pl1_spl_cl_attr_group, &ppt_pl1_spl_cl },
-	{ &ppt_pl1_tau_attr_group, &ppt_pl1_tau },
-	{ &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
-	{ &ppt_pl2_sppt_cl_attr_group, &ppt_pl2_sppt_cl },
-	{ &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
-	{ &ppt_pl3_fppt_cl_attr_group, &ppt_pl3_fppt_cl },
-	{ &ppt_pl4_ipl_attr_group, &ppt_pl4_ipl },
-	{ &ppt_pl4_ipl_cl_attr_group, &ppt_pl4_ipl_cl },
-	{},
+static const struct attribute_group *const cd01_attr_groups[] = {
+	&cpu_temp_attr_group,
+	&dgpu_boost_clk_attr_group,
+	&dgpu_didvid_attr_group,
+	&dgpu_enable_attr_group,
+	&gpu_mode_attr_group,
+	&gpu_nv_ac_offset_attr_group,
+	&gpu_nv_bpl_attr_group,
+	&gpu_nv_cpu_boost_attr_group,
+	&gpu_nv_ctgp_attr_group,
+	&gpu_nv_ppab_attr_group,
+	&gpu_temp_attr_group,
+	&ppt_cpu_cl_attr_group,
+	&ppt_pl1_apu_spl_attr_group,
+	&ppt_pl1_spl_attr_group,
+	&ppt_pl1_spl_cl_attr_group,
+	&ppt_pl1_tau_attr_group,
+	&ppt_pl2_sppt_attr_group,
+	&ppt_pl2_sppt_cl_attr_group,
+	&ppt_pl3_fppt_attr_group,
+	&ppt_pl3_fppt_cl_attr_group,
+	&ppt_pl4_ipl_attr_group,
+	&ppt_pl4_ipl_cl_attr_group,
+	NULL
 };
 
 /**
@@ -1459,7 +1492,6 @@ static struct capdata01_attr_group cd01_attr_groups[] = {
  */
 static void lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 {
-	unsigned int i;
 	int err;
 
 	err = ida_alloc(&lwmi_om_ida, GFP_KERNEL);
@@ -1485,21 +1517,14 @@ static void lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 
 	dev_set_drvdata(priv->fw_attr_dev, priv);
 
-	for (i = 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
-		if (!lwmi_attr_01_is_supported(priv, cd01_attr_groups[i].tunable_attr))
-			continue;
+	err = sysfs_create_groups(&priv->fw_attr_kset->kobj, cd01_attr_groups);
+	if (err)
+		goto err_remove_kset;
 
-		err = sysfs_create_group(&priv->fw_attr_kset->kobj,
-					 cd01_attr_groups[i].attr_group);
-		if (err)
-			goto err_remove_groups;
-	}
 	return;
 
-err_remove_groups:
-	while (i--)
-		sysfs_remove_group(&priv->fw_attr_kset->kobj,
-				   cd01_attr_groups[i].attr_group);
+err_remove_kset:
+	memset(priv->tunable_attr_ctx, 0, sizeof(priv->tunable_attr_ctx));
 
 	kset_unregister(priv->fw_attr_kset);
 
@@ -1525,9 +1550,10 @@ static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
 	if (priv->ida_id < 0)
 		return;
 
-	for (unsigned int i = 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++)
-		sysfs_remove_group(&priv->fw_attr_kset->kobj,
-				   cd01_attr_groups[i].attr_group);
+	sysfs_remove_groups(&priv->fw_attr_kset->kobj, cd01_attr_groups);
+
+	/* Don't leak ctx->initialized to the next rebind from userspace. */
+	memset(priv->tunable_attr_ctx, 0, sizeof(priv->tunable_attr_ctx));
 
 	kset_unregister(priv->fw_attr_kset);
 	device_unregister(priv->fw_attr_dev);

-- 
2.55.0

