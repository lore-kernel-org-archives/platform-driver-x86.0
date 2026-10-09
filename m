Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604FE3191CA;
	Fri,  9 Oct 2026 12:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550526; cv=pass; b=ZwR2jq0/HzYGBmXMsCP1pTvxumKYFYBo1tgHThisDf5f18X304FeXzrWc8AHkutK+gk4gO0LDqTnoMSOzuwL7kPR90t5UOsGIzmxiZ7ANIzzzrPlkNPt4vWUrgS4YN0NUCb/tGUMnC27nK9RXIaau0yKJjYhQfg7kiD33RCGfpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550526; c=relaxed/simple;
	bh=VM8+n/SXKht9/aE9sSLIscYKivkJ0j3F3cfuvSrywbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B255XGSrfvAx+d2ILMELdgZd80l6kMepAl4TnFHeYqSS0DerL2EdfOjSYKjGlzxsl+7V/F9yDJkrPRxPo3ztOFlSitInleKVASNhB3K8cp5x+uJCXxsGJrLD1UvPOqq/hrFlIwrCZy3tS+aKQDh5hwK7rxX/Q8keVDL6q/omV1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=WHy9CKMs; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="WHy9CKMs"
ARC-Seal: i=1; a=rsa-sha256; t=1791550473; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HfqqxqdeRlibnXoKd8VNvTEZRAVJFTMJlmrvbShL5pSdK1EMjS/eRlIBBonNoE4GyhI5vKLq/mGuTzogrDdDh66zezb9+tQ7jtThhgtYY+O3J/OpuZ+G3TBz08aJMX3HAQZfIB9vxQNuM45MwSsfG7gGkZQYw/IfdiTpANQBmMc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791550473; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=g4gMnXzCvkDwL49kIPTSe7bUbDZFsF6wxwpB+rjMg/I=; 
	b=cBRCyG3n/cTroqb+jyvYUZeKzAwDeFQRzrmX6zO3y27ZdiEfLrxmqO1n5N+A5BNFC5/nb9uWrtSo6d7s9Lkeq2+VtdFuHWzUuEMM9D3w1CKaP2THH+qJLRZ20DRiUx2v+N1R+ycOXtnWp86faq6GRLeCQQSxF7txRcuYvyKNE4o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791550473;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=g4gMnXzCvkDwL49kIPTSe7bUbDZFsF6wxwpB+rjMg/I=;
	b=WHy9CKMsDOe2VRosCoq1V/3U0L/59fWcuVeFRRWXvchZe0WOwxv4uIY+thpr22j/
	ADhyVS1qTzDwh28i9EiiW3C65RcudZu+FHGW9Hfw6LSghb0pmaRLGEGSTGjBpz2kUWo
	yCBmEiqYQYmwjVqn2o93MoPj8tYysJLhLsWZE4nC+pblCHxCku1JyzVR/FUhwGXiVeV
	Xv/LLxXzzZqzPs/LHu5zEUP85XoGe2eHtBxtirhAQVPTe7sQPX5lrXtGZQonCKLUSJM
	J3Zx1zUg9ouglzCRUAncsTx0xVAu+GhkeNblwuiLOrMadJZH8GrSlWH0ihiA/I9ZvJQ
	/sNdkiUGng==
Received: by smtp.zohomail.com with SMTPS id 179155047322371.7674774967544;
	Fri, 9 Oct 2026 05:54:33 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 09 Oct 2026 20:53:47 +0800
Subject: [PATCH v2 05/12] platform/x86: lenovo-wmi-capdata: Defer mutex
 initialization
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261009-lwmi-wmi-new-api-v2-5-402828382679@rong.moe>
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
Changes in v2:
- Synchronize the initialization with release-acquire barriers (thanks
  Ilpo Järvinen)
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 86 +++++++++++++++++++++++--------
 1 file changed, 65 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 3008d6d699c0..e52cb2de49a6 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -48,6 +48,8 @@
 #include <linux/types.h>
 #include <linux/wmi.h>
 
+#include <asm/barrier.h>
+
 #include "wmi-capdata.h"
 #include "wmi-helpers.h"
 
@@ -91,6 +93,7 @@ struct lwmi_cd_priv {
 	struct wmi_device *wdev;
 	struct cd_list *list;
 	struct dentry *debugfs_dir;
+	bool initialized;
 
 	/*
 	 * A capdata device may be a component master of another capdata device.
@@ -588,14 +591,14 @@ static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
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
@@ -617,7 +620,6 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 		return -EINVAL;
 	}
 
-	guard(mutex)(&priv->list->list_mutex);
 	for (idx = 0; idx < priv->list->count; idx++, p += size) {
 		union acpi_object *ret_obj __free(kfree) = NULL;
 
@@ -635,14 +637,38 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
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
+	/* Synchronize mutex initialization. Paired with lwmi_cd_finalize(). */
+	if (!smp_load_acquire(&priv->initialized))
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
- * Return: count of fans found, or an error.
+ * Return: 0 on success, or an error.
  */
-static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_list **listptr)
+static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
 {
 	struct cd_list *list;
 	size_t size;
@@ -688,6 +714,9 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_lis
 	if (!list)
 		return -ENOMEM;
 
+	list->count = count;
+	priv->list = list;
+
 	for (idx = 0; idx < count; idx++) {
 		/* Do not calculate array index using count, as it may be truncated. */
 		list->cd_fan[idx] = (struct capdata_fan) {
@@ -697,8 +726,7 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_lis
 		};
 	}
 
-	*listptr = list;
-	return count;
+	return 0;
 }
 
 /**
@@ -714,7 +742,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
 {
 	struct cd_list *list;
 	size_t list_size;
-	int count, ret;
+	int count;
 
 	count = wmidev_instance_count(priv->wdev);
 
@@ -726,11 +754,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
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
@@ -739,17 +763,33 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
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
+	/* Synchronize mutex initialization. Paired with lwmi_cd_cache(). */
+	smp_store_release(&priv->initialized, 1);
+	return 0;
+}
+
 /**
  * lwmi_cd_setup() - Cache all WMI data block information
  * @priv: lenovo-wmi-capdata driver data.
@@ -768,7 +808,11 @@ static int lwmi_cd_setup(struct lwmi_cd_priv *priv)
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

