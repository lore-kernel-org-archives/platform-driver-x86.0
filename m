Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3BB2D9EE4;
	Sun, 13 Sep 2026 20:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332649; cv=pass; b=sQCRlTb78hzQkUbry8EsWDHqOn34+/jYhJsfbjDiXe69FrLf7bnIWmcuYyeKVjiW2xZ5E5v+fKbjyHQ57cr8ksP+ETJDNCPcB9sd3bdSuvwzcIu1hodDqNenBIXEfy84a1h41ksieC5HPWlkYwJhUbXLwXIn/KoQ9NcJi32yVPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332649; c=relaxed/simple;
	bh=QexOzfbfHvHbP8QAub7mNrntBQ4goENKAGtRFZkgPlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZWYe5KQBVX4NuHdVdNIdZj8rN9qBYnmykKN9QFIfCd6GqE6+WiTI3hMzFj/S38wV4tnlQrexU9VAtVUBXFGgQT99L5JlX50xNu1HffR38fj7JhCfuqLitryVOhy9dhwTFeTh67DuxLxjIbMZscApYCoWqyOj5YxER7FkVsE+VwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=hBPWOWy8; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="hBPWOWy8"
ARC-Seal: i=1; a=rsa-sha256; t=1789332632; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ebWWw7qVxVtPgO8108B5qIDKVdEQALn9shHT13nSS/eQNl6SC4FjAjI0UMGogbTzyKhPy8LpPfhBKpa6lvbiuQRb2dC3vOvKiPpSACvySj/C3y7D5rbFvYTz7CgOvZcYtZPqpMU61JHzx2lbC5nfe79mvWzrs2GQ2gcAx7npaiY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789332632; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U1AcDlbyh7bW0hsJo3k0PHp6dPtQpCOqVlcpaw4sph0=; 
	b=mgCGiFK2sNY8LjoGOlgKHotLeF9499e7BhvgyI4L4PI9OeJmss1WL07LdM8zCyuMocnjt1p63SL9EI/lCKtfQnMC/xC+lWQHIGl3ztzjsFaUP2qqEqLkBvMLdgkPSxDOmmg1gT5nUotW1u/NwebNfHzc15rvErisFVQGi1dld8A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789332632;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=U1AcDlbyh7bW0hsJo3k0PHp6dPtQpCOqVlcpaw4sph0=;
	b=hBPWOWy8BbZso5WFWuMXo08Oc9u+5HUWGOENqD3U03txOdfViT9xEj0jh9KzeGxp
	tg7+uwT+KorlDftYfodLL/utOofGXo8trpkfusMFYB9tg6BMNAAZrj7nc00QXrEA8vg
	SDsHg2+VztNYFl6hvoNWoqYvr4hc/vtqgJh7J6D2ATtpzePuRqXUiT4AbyPBuic0XI9
	MBTAEbiPHVrE6BZOSJLur5lRQZePSEHBj3L0UN1avJDpIJOFxb0//jX7n6tGvRANHyn
	99fipUB4KF9GU9CnY5UxWFVKxeARnTSdBLmlU1APlhU2HDM1mVF4hGr2Q1G1pUT2fhG
	1EpZpuIBOg==
Received: by smtp.zohomail.com with SMTPS id 1789332631896438.93239606933537;
	Sun, 13 Sep 2026 13:50:31 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 14 Sep 2026 04:50:22 +0800
Subject: [PATCH 1/9] platform/x86: lenovo-wmi-capdata: Only allocate
 sub-master info when necessary
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-lwmi-wmi-new-api-v1-1-7a400f2f69f8@rong.moe>
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
index d5e961566136..c9e4380a70d2 100644
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

