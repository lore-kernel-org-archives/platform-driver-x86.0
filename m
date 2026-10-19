Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422219;
	b=WmuShnUal4xs+Ak2cVF67Mjk4SXlLMpN50aQ49tAt/WsghJo1raL1uObh6fkjnybdTXn
	 692bLOTAUxWgGLkXrtzeZWil2h0h/FRuIwstRYhhMGJhazKEhj5RutbDxIUbVo9Lzw+Rv
	 ER8OwhwZtt+lN4+XrmpVlFYULjE/VByRigCk2D84e+L2CY0cqpOuILw2CgT335dBq/bny
	 76LC7ncvZ6U2LVi7o4Mx8Aeqb0VjOvrDrpa7Kub7vY0Ua84KKrJOTw/7PFdOn/ax+ntVE
	 PqmkKENoFimBTrWiXcXb5DdiBNhH2vsIhy1L87tRHH4VD+8X4/DrwcqdTK9FeNBgzag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422219;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=PdMAha2bu9bIn+TvAIBbdJnVTbjJLN/vn9wKaWr7N2A=;
	b=jfMZQ83j0UPTuknCxLh7KVaN6s6ZTnTL9CbZaSvanxkyhBNe+LU0oRJ2uKhCk0ZlMqvX
	 0fUFCS6xuTAzyNG/72FAOzTaptKLH5yDFlPEJf/N3xCsQCctE8aA8guGR97M8yfUMwMY6
	 x7yJ1W2vHjhA+u3Jy73/sxvnxhz0znzWII6M6Dps6mkBVKYut2EiqfDgEeK+gVOdfVvri
	 o5hfI0u5TCD7r6j6F1If3NJYvdwl3Wr+G+j/2gTyoVyVB4iW0DggJ+Ql8cS5l7AUPdvjc
	 BIsoFxvw+adHiQCcLh2iaDPqAW84dFsg258VeTFCP3SYmibXzr5UhYvm5aMC2z9ecsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=DmtQ4vse;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EE6607DC53;
	Mon, 19 Oct 2026 15:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41EE6607DC53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=DmtQ4vse
ARC-Seal: i=1; a=rsa-sha256; t=1792422185; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dWNNbBaEHC0Gq/6gTc8LqnNXhdIwWR+e3P8XUdlLO9R7uER4J534p3jwRCzzrFIueS9yfRZ/+ahJfyf2gku1sWPXjyNp7n8S1ZZakR8rSnAeUydeBVTAugR1oYsX25oZqXh9ljxO5GzdG9PYmu0bIrGq3Lg+DEc2qovfAKWshXA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792422185; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PdMAha2bu9bIn+TvAIBbdJnVTbjJLN/vn9wKaWr7N2A=; 
	b=eZN2eb5+b9ugYhcv+n4kEtffUCqHYnmoVvN7YsoXes9YXd+tryKADFWVDw1lhUnEfatwNoujrgECZkxTL6ARm/ekNXTo7Arx+C95mgFOYfbLQCtv5ZKC1XLaGXvO/Bcc5YZNC0szRfZjpN9AHULWsoiAqel6yo7ePqjHzVjYeiI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792422185;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PdMAha2bu9bIn+TvAIBbdJnVTbjJLN/vn9wKaWr7N2A=;
	b=DmtQ4vse8Rj81Y2etdD3oXuTcirjmGCTfH4IuD1WqK9G/I3fuAxhV6Bnv/Lj85kb
	tlxw55hnGCMSRX1h8rsYrz5I8D7lp8wqek0s+jNpnhpzXC9ArlXeV+FTM46fX4wimB9
	VEBHRhxXtvWeXxNA10/71ESA/aZryUz6RDCKErTyH6wuXYf+pjSYrGTu/histUBtxnZ
	HuzW1kCrVaAX6h4mwSTMSFpsrdeDtWboa5hfqsgAHZB3i2lAT4kvuhmSRZA3gLkgxqt
	8x+vsPQQ+RIcuA9iOV/GOeLiTXm2AAO3p2UYAk5nP7gZVu/XkPKS1Lf1oGcREnDWenW
	W0zaTweSfw==
Received: by smtp.zohomail.com with SMTPS id 179242218273654.14301423763561;
	Mon, 19 Oct 2026 08:03:02 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 19 Oct 2026 23:02:25 +0800
Subject: [PATCH v5 03/12] platform/x86: lenovo-wmi-capdata: Only allocate
 sub-master info when necessary
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
Message-Id: <20261019-lwmi-wmi-new-api-v5-3-71557d28d058@rong.moe>
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

