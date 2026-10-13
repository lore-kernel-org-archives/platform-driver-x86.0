Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B42051DE1F;
	Tue, 13 Oct 2026 19:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919654; cv=pass; b=qUljQFWGYLJTq9EBEh86hyDSifx4EUPaqZzoCzNpC1cHeA160hOMp3LpYtGsumyZRJgdcyoHnSYB4UUePUAWfOSYwEqUEa8GDkl6LWgFoVfiAzxwAjQfT47Y7TsXFf/lErYZlhQ+7rW0BXdejk0rmooIX5Bo9Qz7a8ajlxV0d54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919654; c=relaxed/simple;
	bh=EOnQi+nhIG6yE0e0nAB9TrTzbq3fgWh+7VtgMrlmNfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dtIIS1TqVBulyIWK9jAWYbMVjD3CBvFan6lDzLjAvPZC+vyuG16GRhrWfPNZeefJglbiFOc3un2qhDEU4+6Q6J8OX/uW3Wzj/s/T6rBnAxAykumF8Oo+U3Ow7RmlFf0yaT7tXLZD/SGEeJbUjM4jhB9WnLj5f3tO2LeesM3WEJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=GDES8t18; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="GDES8t18"
ARC-Seal: i=1; a=rsa-sha256; t=1791919611; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YLmqv3Mxz0LSwc3nLLOkO/c6Gt+5LaEf2X2h2QE7QHoooVCiYdrcZv+8p07Fx/8+0vhUWhUZBPJPrEYxzkRS5+sGYyB4aAVbLMo2sna3JKaYO+xjBE+qgWvUKXxTQEsPuU+PtUZatAtfldA038Pcr2lrAeqiwekG83tLgSLPjM4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791919611; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HjcHdlF7khTPy4vTFsJxIbLHIBS8t2iqrK4gB/L4AdY=; 
	b=nyGCg0Tmsb/Fhz4UK9kLSLrqRDmISH8QqHX6Dqs8vA9KxmPwFthBkQ6VaCztDtV9WC6r9FdjaOnjp+aVYABMkgUC8b+nY8Jsbicpf7KAFEnkTMuuktok38YOWPL2k6NVn35k0H3MBSr1eOt+oR5l0OAp1SMh1Jjr7BLfJXS0Szw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791919611;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=HjcHdlF7khTPy4vTFsJxIbLHIBS8t2iqrK4gB/L4AdY=;
	b=GDES8t18EBsjXMfTjNElsGFmPAj0RxgpD4iZohZDVNse+P7jcahRAoRWG8E2JbEQ
	XIX15TCWdDkWZz7qcnd2Mp4LVKWdyoghA2Apu1JqhYaRQezA/xT8V+XwEt/b1trPqzu
	w7Va3uDmfenSvlDF+vGiaf+qWumcOBOPkZwxrpqNKMhirRbdbiCfqNOEb4f0mFQBU3S
	16jvrT5SNsO/XVrJUE8xz/cIVQTKrbweobvXLiNcDI9p0a5MJGBT+BmKPvD/1bSvSZ3
	oyqQN3Y0/FQEeciZrun3mhG7Myywg8c851xzTGpa/fVrv9sH6Yr1laRkGnht7o6LGcN
	eLNrNB3WOQ==
Received: by smtp.zohomail.com with SMTPS id 1791919609044202.73846196626505;
	Tue, 13 Oct 2026 12:26:49 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 14 Oct 2026 03:21:46 +0800
Subject: [PATCH v3 03/12] platform/x86: lenovo-wmi-capdata: Only allocate
 sub-master info when necessary
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-lwmi-wmi-new-api-v3-3-e1032bed1c81@rong.moe>
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

When capdata00 declares no fan test support, there is no need to
allocate sub-master info as it's basically unused except for the
priv->sub_master->sub_component_list == ERR_PTR(-ENODEV) placeholder.

Therefore, only allocate priv->sub_master when necessary, otherwise its
absence implies the absence of sub-component. With that,
PTR_ERR(sub_component_list) == -ENODEV is repurposed for the following
changes to represent stubbed sub-component.

Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
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

