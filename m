Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D435637F01C;
	Fri,  9 Oct 2026 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550508; cv=pass; b=J5c8LnPefJ8UTxOxgn8rfpwv1lB/yN5sUX+c8idQlMVouS0yaHXsvDY4fLMN4PCdj7qp0rwV9IC/6WT6gY65YPA8ysB+mcMNKvmDOQr47O2IUFcwQ912m2KFRWf3IHD2FBluf4IPjYOhWAzjFmcgpWg0LR79JwOSnlaJ5YNAtTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550508; c=relaxed/simple;
	bh=xIT8HIf624vIth0kK1Iapjgtibtv+/FAHlPTrfsYsX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oeC5uEHaPQDoEytsoRch0mjH8AUk9vCAuvcyKQBSurYlJWYZHWrtvDkvtlj2drk3w20sI77WEogyrCyjgqECVPK9UzNUrBYFcFQhbs37JzagCL4DM9G+cG9Ot6klahA4UQNZ82C21886vB/tmYfU1DfbGQDp9ICnIkG8VRuBxV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=l3yqblb0; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="l3yqblb0"
ARC-Seal: i=1; a=rsa-sha256; t=1791550469; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TnO+eKibeY0BgNDQ3Il66vFMJDA1gXqr++62elBZlXVEBGySH19fQ2yZBLnVMKxIhRgTIVdP5LrTESCv/egZjcQmrRToeFtHynXxPZzcKeQOkN9yA7O360L4+xiezk+wuufrczQA+q0CiyOo5VgzfBhQoiU14O6LKLkC2IFbX70=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791550469; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w/tzbkPGgvcxoXXqNSRNbr676uRuzDzUHn/aEPeMDk0=; 
	b=JdzSf5hLFPfXblL8fsOYCVMqo2mvnhVcFiiOXBZGwug7SxHAu9zz4LCTrGqD4+meV1IXC/DaEdo77CeSOhdxlUDxnbDnNyc+CXkgSFs6qsJt8hMuWdQygLGn1rrKNv4GsDr2q4WGGqDvhPdjjSfmJYJF3wneb5FC/RcRuRPuN1k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791550469;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=w/tzbkPGgvcxoXXqNSRNbr676uRuzDzUHn/aEPeMDk0=;
	b=l3yqblb0QbHp/Up3UP20l6+xZrVETxWn109QeWrP9L2jbsjOecDpC8pgQUED01oT
	d86CIqtRiS9vgVjr0aqMmu7Tv+8ex8l81M7401UaY94o5Gj7Kq9gS/n3WNGCzYqqAXz
	afOws0Sx8zritcxj0O9B+wjFLErehhS9WoZS6PU08Sk6K95LLw9bvfPNpzglpNoxMtP
	ERNjpG216W1gxMoPSVaJDjZE/OcOSHWSIjJsru8MIZrErmfkkv2bWPUlLlHbY/zFsOu
	mTIPUGPoyNdIHsD3ys4zmvLwLjbO4og+xoMzOsBTz0ts9mAjDR6HCPSf++s7oBGjH8j
	3JAZkROtUQ==
Received: by smtp.zohomail.com with SMTPS id 1791550467996478.5314950700996;
	Fri, 9 Oct 2026 05:54:27 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 09 Oct 2026 20:53:45 +0800
Subject: [PATCH v2 03/12] platform/x86: lenovo-wmi-capdata: Only allocate
 sub-master info when necessary
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-lwmi-wmi-new-api-v2-3-402828382679@rong.moe>
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
In-Reply-To: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
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

When capdata00 declares no fan test support, there is no need to
allocate sub-master info as it's basically unused except for the
priv->sub_master->sub_component_list == ERR_PTR(-ENODEV) placeholder.

Therefore, only allocate priv->sub_master when necessary, otherwise its
absence implies the absence of sub-component. With that,
PTR_ERR(sub_component_list) == -ENODEV is repurposed for the following
changes to represent stubbed sub-component.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 36 ++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 58787da959b4..3a823aee608a 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -101,9 +101,11 @@ struct lwmi_cd_priv {
 	struct lwmi_cd_sub_master_priv {
 		struct device *master_dev;
 		cd_list_cb_t master_cb;
-		struct cd_list *sub_component_list; /* ERR_PTR(-ENODEV) implies no sub-component. */
+		struct cd_list *sub_component_list; /* ERR_PTR(-ENODEV) implies stubbed
+						     * sub-component.
+						     */
 		bool registered;                    /* Has the sub-master been registered? */
-	} *sub_master;
+	} *sub_master;                              /* NULL implies no sub-component. */
 };
 
 struct cd_list {
@@ -258,6 +260,12 @@ static int lwmi_cd_component_bind(struct device *cd_dev,
 	case LENOVO_CAPABILITY_DATA_00:
 		binder->cd00_list = priv->list;
 
+		/* Missing sub-master info implies missing sub-component. */
+		if (!priv->sub_master) {
+			binder->cd_fan_list_cb(om_dev, NULL);
+			break;
+		}
+
 		priv->sub_master->master_dev = om_dev;
 		priv->sub_master->master_cb = binder->cd_fan_list_cb;
 		lwmi_cd_call_master_cb(priv);
@@ -288,13 +296,9 @@ static void lwmi_cd_component_unbind(struct device *cd_dev,
 {
 	struct lwmi_cd_priv *priv = dev_get_drvdata(cd_dev);
 
-	switch (priv->list->type) {
-	case LENOVO_CAPABILITY_DATA_00:
+	if (priv->sub_master) {
 		priv->sub_master->master_dev = NULL;
 		priv->sub_master->master_cb = NULL;
-		return;
-	default:
-		return;
 	}
 }
 
@@ -369,17 +373,19 @@ static int lwmi_cd_sub_master_add(struct lwmi_cd_priv *priv,
 	struct component_match *master_match = NULL;
 	int ret;
 
+	/*
+	 * If the sub-master has no sub-component, there is no need to allocate
+	 * or register the sub-master. The master callback will be called with
+	 * NULL on master <-> sub-master bind to inform the master about the
+	 * absence of sub-component.
+	 */
+	if (sub_component_type == CD_TYPE_NONE)
+		return 0;
+
 	priv->sub_master = devm_kzalloc(&priv->wdev->dev, sizeof(*priv->sub_master), GFP_KERNEL);
 	if (!priv->sub_master)
 		return -ENOMEM;
 
-	if (sub_component_type == CD_TYPE_NONE) {
-		/* The master callback will be called with NULL on bind. */
-		priv->sub_master->sub_component_list = ERR_PTR(-ENODEV);
-		priv->sub_master->registered = false;
-		return 0;
-	}
-
 	/*
 	 * lwmi_cd_match() needs a pointer to enum lwmi_cd_type, but on-stack
 	 * data cannot be used here. Steal one from lwmi_cd_table.
@@ -404,7 +410,7 @@ static int lwmi_cd_sub_master_add(struct lwmi_cd_priv *priv,
  */
 static void lwmi_cd_sub_master_del(struct lwmi_cd_priv *priv)
 {
-	if (!priv->sub_master->registered)
+	if (!priv->sub_master || !priv->sub_master->registered)
 		return;
 
 	component_master_del(&priv->wdev->dev, &lwmi_cd_sub_master_ops);

-- 
2.55.0

