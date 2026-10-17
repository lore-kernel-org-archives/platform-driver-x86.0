Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3BF3CAA3B;
	Sat, 17 Oct 2026 18:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792262609; cv=pass; b=dBg8ARR92uzrQR+k77bkW/XfsMrMChFbGM3dXEKiCDCOonom9+N/yBJjQyy+qnQfghZOI8LfO0gPih/SQDknlOZF7uinsxynjptOzweLEoBtE1jmUkRAOsBMW+ZqWEy3JnTeuA3sf4Tbpf8qCXSHZ7u/WedhGr36mHcAWCHMqvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792262609; c=relaxed/simple;
	bh=o1UfGAIw7tfo1RSPliKOTXQ+BWcg1UNVlwF7NBw39Vo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2QE6mcB/jvUHCImvOunWDQg5koKgiKnjEFsKvUWfJYA7JFzNXBjq2wiQf4gttldisIt7//FfBGCvUeJV5PI7nJ+84OMaO7UB8UJ0hHu0y4LSwF5mlp5/ABpMLW9i0Qn9W5E4yh03J7cOVRlZS6qBCcuu1ysvryBBW6ZWVCsWWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=M7p25Opd; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="M7p25Opd"
ARC-Seal: i=1; a=rsa-sha256; t=1792262581; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XDis9xAzSW368jI1BKk8h3Nia4MRImnHFH05j3VRCWY113fTNmU81TxNVjsIRlJjh2cuusncdaC57BpKb9t2ReD6CbtOC/csWqN2ZeOgtOa3f6pEsk07Eju8OVtsrFDB7B/CNOLyAXMqezwknQ3SwID4w4zBLKI+Kqth6UpNHDA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792262581; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PdMAha2bu9bIn+TvAIBbdJnVTbjJLN/vn9wKaWr7N2A=; 
	b=EoQSe/ULFaaHIOr7nZa+nfqiFm2Jcn0HNsLrnqjH/14kkVlDjgCZ4gyYwpm81zHbty7Rci3Fk7RWgP4cHGH1+xOpLyM8TOTZUL/QB6QiSzElNvCIZm4ZSVVwUEQlllB75KAWEUU0iv3KiemaDzakjtEvpd/FCDYS+bFlRczSuEo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792262581;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PdMAha2bu9bIn+TvAIBbdJnVTbjJLN/vn9wKaWr7N2A=;
	b=M7p25Opdn8YJoQP+4lWkXzNWpKv8GHlqln5hJbjEMcYhvsU/5Aga+szFzYK+X2DX
	XeUqmS6uzmFeZ0ll1on6hY/ueIVih2oI4eHr7tqEOQWcbZll+41yFUbdvw0IyEKRa+U
	ttsvF2Q9BrJI9H2BezCLl4ChIUB4/U7Z4c1t52IOL+WtcVEAW0CvcouuCbEjGNsGZTY
	NGcQzl14phwHG6drL5dHHztPCADHxn+d4xjJVEq0bSJvM7vUgABQ64Ie/RmgmHF1fo5
	lVz+PYf+Ogy91bufsqqJf+eJ9pXzjjJTBuMMCyo1XuQVWXUDjWmY3cqSx0xTGXgf9fQ
	RLneNVGgaQ==
Received: by smtp.zohomail.com with SMTPS id 1792262579272423.5197930182352;
	Sat, 17 Oct 2026 11:42:59 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 18 Oct 2026 02:42:33 +0800
Subject: [PATCH v4 03/12] platform/x86: lenovo-wmi-capdata: Only allocate
 sub-master info when necessary
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-lwmi-wmi-new-api-v4-3-aafef7956c4a@rong.moe>
References: <20261018-lwmi-wmi-new-api-v4-0-aafef7956c4a@rong.moe>
In-Reply-To: <20261018-lwmi-wmi-new-api-v4-0-aafef7956c4a@rong.moe>
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

Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v3:
- Shorten the comments of struct lwmi_cd_priv's members (thanks Derek
  J. Clark)
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 34 +++++++++++++++++--------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 58787da959b4..fbe2ba627ff5 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -101,9 +101,9 @@ struct lwmi_cd_priv {
 	struct lwmi_cd_sub_master_priv {
 		struct device *master_dev;
 		cd_list_cb_t master_cb;
-		struct cd_list *sub_component_list; /* ERR_PTR(-ENODEV) implies no sub-component. */
+		struct cd_list *sub_component_list; /* ERR_PTR(-ENODEV): stubbed sub-component. */
 		bool registered;                    /* Has the sub-master been registered? */
-	} *sub_master;
+	} *sub_master;                              /* NULL: no sub-component. */
 };
 
 struct cd_list {
@@ -258,6 +258,12 @@ static int lwmi_cd_component_bind(struct device *cd_dev,
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
@@ -288,13 +294,9 @@ static void lwmi_cd_component_unbind(struct device *cd_dev,
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
 
@@ -369,17 +371,19 @@ static int lwmi_cd_sub_master_add(struct lwmi_cd_priv *priv,
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
@@ -404,7 +408,7 @@ static int lwmi_cd_sub_master_add(struct lwmi_cd_priv *priv,
  */
 static void lwmi_cd_sub_master_del(struct lwmi_cd_priv *priv)
 {
-	if (!priv->sub_master->registered)
+	if (!priv->sub_master || !priv->sub_master->registered)
 		return;
 
 	component_master_del(&priv->wdev->dev, &lwmi_cd_sub_master_ops);

-- 
2.55.0

