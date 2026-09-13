Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5006C37EFE4;
	Sun, 13 Sep 2026 20:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332666; cv=pass; b=apDyWDxF14FTWBZPvE+kydi+eMNig77sHdbwMtOVn6IJ7NCfj8w4qSsPGa7Zkf/7egFbZxw7FRfGdIOzlkSdTo30ISzlg1LSeUlhCPdKG95scM8KYjdH9VqWw5XvA+3Tl21/Db31zzpWL/+VydkYG2LGOxsWDFdVAyvUpUxAwNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332666; c=relaxed/simple;
	bh=l8vbbq6mwRKkVEYwXPLOgBo+K+uGL6lmzJ5V5xl4hmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rt7zF9bjV7l8A36BzOi5dDKQKw4FAIIvHN9KUjMsMWxlb51tnzUd2SmG0QtJ0LxNeEJMJBmOeXHyDkFw7tEPU6hUag0M7s/162y4sQaNKeJY4/uB/VvjyW+mBAojX9wW8eu82KE9fE/HM5leX7WMH9M8d9AnGCSyEOnRNRtAujs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=PHH5ab0W; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="PHH5ab0W"
ARC-Seal: i=1; a=rsa-sha256; t=1789332638; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iF3iYnyWNgFLzZkLq60iJQqVz6mYzp1ZzJXh4Pz/x8vNtL58qTU8VJcDh1ytBJlqiGW45bWokw5jAlQ45cNYG5lVdAv9kG70bVe62nArF05nSZwOHjCQQoGnGkzR/J8Z86upx/Low4Of7kUSWBJJBfI8W0LbUcfnyK64rmk1LLU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789332638; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nZLTOWbhasXWCYrctDiJmJMxmIn8+t6ASx9j0zGBUCM=; 
	b=KQSmf01Guj2AKmb81MuD+T8qPXnWVQGA1UDTB5seA7dOgFat0LpnDK+Cao4afS1pGSvXHwJijPrQSF4Gik6GFi6y2mNT48R7+y8fOfrCBQeHOQl7UirDGqHv4gSPvp3kXGbuIhnPYNkKgc5bTH4AqWsJI8a8/OnYTRhTAU7U41w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789332638;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=nZLTOWbhasXWCYrctDiJmJMxmIn8+t6ASx9j0zGBUCM=;
	b=PHH5ab0WjrPaXkk4pDiGZ1xVQL0tvrvqKPfK1q5+e/2wsQO5hY/HhU3f2rZJlptp
	9ADVdF6NIgM4FmEQqdOlFgwolvxDC8CmNOJQeEEXI1BI3lbiquptDWSNVUUwS443yHO
	JpA+SCEQpHHAr5DrwGma6HbC+SpPnVmjHbBnX/IxvT6ykPUJXsJX08CM7VSHPX+fcUy
	+3zDP+ZNnB6SNSrjw3rxyO4zs/XZ3Iu0B142q7FVo7Oc0uhcx2OwFY0LCbM7SME2ZGa
	5J1c3N77PPnG/CyIOthMUI9+2XVAGHYIkNwLNeUYmu8Rq6SwmvV6gqZEBtKn8Vj+0il
	RfKvKXGVRg==
Received: by smtp.zohomail.com with SMTPS id 1789332637266489.3839651910447;
	Sun, 13 Sep 2026 13:50:37 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 14 Sep 2026 04:50:24 +0800
Subject: [PATCH 3/9] platform/x86: lenovo-wmi-capdata: Defer mutex
 initialization
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-lwmi-wmi-new-api-v1-3-7a400f2f69f8@rong.moe>
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

In the following changes, priv->list may be freed if the first call to
lwmi_cd_cache() fails due to WMI/ACPI errors, so the list_mutex must be
initialized after it in order not to break lockdep, as there is no
devm_mutex_destroy(). Considering that the first call to lwmi_cd_cache()
doesn't need serialization as there is no other reader or writer this
early, the initialization of list_mutex can be deferred.

Therefore, initialize list_mutex only after the first call to
lwmi_cd_cache() succeeds, otherwise it remains uninitialized and can be
devm_kfree()-ed.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 80 +++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 880ac444c206..0123ec8f7b53 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -91,6 +91,7 @@ struct lwmi_cd_priv {
 	struct wmi_device *wdev;
 	struct cd_list *list;
 	struct dentry *debugfs_dir;
+	bool initialized;
 
 	/*
 	 * A capdata device may be a component master of another capdata device.
@@ -588,14 +589,14 @@ static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
 /* ======== WMI interface ======== */
 
 /**
- * lwmi_cd_cache() - Cache all WMI data block information
+ * __lwmi_cd_cache() - Cache all WMI data block information locklessly
  * @priv: lenovo-wmi-capdata driver data.
  *
- * Loop through each WMI data block and cache the data.
+ * Loop through each WMI data block and cache the data locklessly.
  *
  * Return: 0 on success, or an error.
  */
-static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
+static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
 {
 	size_t size;
 	int idx;
@@ -617,7 +618,6 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 		return -EINVAL;
 	}
 
-	guard(mutex)(&priv->list->list_mutex);
 	for (idx = 0; idx < priv->list->count; idx++, p += size) {
 		union acpi_object *ret_obj __free(kfree) = NULL;
 
@@ -635,14 +635,37 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 	return 0;
 }
 
+/**
+ * lwmi_cd_cache() - Cache all WMI data block information
+ * @priv: lenovo-wmi-capdata driver data.
+ *
+ * Loop through each WMI data block and cache the data.
+ *
+ * Return: 0 on success, or an error.
+ */
+static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
+{
+	if (!priv->initialized)
+		return __lwmi_cd_cache(priv);
+
+	switch (priv->info->type) {
+	case LENOVO_CAPABILITY_DATA_01:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	guard(mutex)(&priv->list->list_mutex);
+	return __lwmi_cd_cache(priv);
+}
+
 /**
  * lwmi_cd_fan_list_alloc_cache() - Alloc and cache Fan Test Data list
  * @priv: lenovo-wmi-capdata driver data.
- * @listptr: Pointer to returned cd_list pointer.
  *
  * Return: count of fans found, or an error.
  */
-static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_list **listptr)
+static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
 {
 	struct cd_list *list;
 	size_t size;
@@ -688,6 +711,9 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_lis
 	if (!list)
 		return -ENOMEM;
 
+	list->count = count;
+	priv->list = list;
+
 	for (idx = 0; idx < count; idx++) {
 		/* Do not calculate array index using count, as it may be truncated. */
 		list->cd_fan[idx] = (struct capdata_fan) {
@@ -697,8 +723,7 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_lis
 		};
 	}
 
-	*listptr = list;
-	return count;
+	return 0;
 }
 
 /**
@@ -714,7 +739,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
 {
 	struct cd_list *list;
 	size_t list_size;
-	int count, ret;
+	int count;
 
 	count = wmidev_instance_count(priv->wdev);
 
@@ -726,11 +751,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
 		list_size = struct_size(list, cd01, count);
 		break;
 	case LENOVO_FAN_TEST_DATA:
-		count = lwmi_cd_fan_list_alloc_cache(priv, &list);
-		if (count < 0)
-			return count;
-
-		goto got_list;
+		return lwmi_cd_fan_list_alloc_cache(priv);
 	default:
 		return -EINVAL;
 	}
@@ -739,17 +760,32 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
 	if (!list)
 		return -ENOMEM;
 
-got_list:
-	ret = devm_mutex_init(&priv->wdev->dev, &list->list_mutex);
-	if (ret)
-		return ret;
-
 	list->count = count;
 	priv->list = list;
 
 	return 0;
 }
 
+/**
+ * lwmi_cd_finalize() - Finalize the capability data initialization
+ * @priv: lenovo-wmi-capdata driver data.
+ *
+ * Return: 0 on success, or an error code.
+ */
+static int lwmi_cd_finalize(struct lwmi_cd_priv *priv)
+{
+	int ret;
+
+	if (priv->list) {
+		ret = devm_mutex_init(&priv->wdev->dev, &priv->list->list_mutex);
+		if (ret)
+			return ret;
+	}
+
+	priv->initialized = 1;
+	return 0;
+}
+
 /**
  * lwmi_cd_setup() - Cache all WMI data block information
  * @priv: lenovo-wmi-capdata driver data.
@@ -768,7 +804,11 @@ static int lwmi_cd_setup(struct lwmi_cd_priv *priv)
 	if (ret)
 		return ret;
 
-	return lwmi_cd_cache(priv);
+	ret = lwmi_cd_cache(priv);
+	if (ret)
+		return ret;
+
+	return lwmi_cd_finalize(priv);
 }
 
 /**

-- 
2.55.0

