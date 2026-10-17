Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F383DA7FF;
	Sat, 17 Oct 2026 18:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792262629; cv=pass; b=Pqiwl9U4qTCHF7l4HYmLaOHuDT0WbzMsBvMwPowvUEvgxwVUO6t53+o1PLAtvPRIswpSOjBfc2YWr+wn8i676OCAYHOcMnsYARNHvdJCVAv1zXPSHV9RCX5+nMi29PkRm1f9lMYDrdDGKJMkOtWC6Voli5slW/UOhWZHCMzr/eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792262629; c=relaxed/simple;
	bh=33qIn4n++OrOvTgCCC89QGxvyokeUMd+hkA/b+ACx/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d5ZdZq9PKExOX4R/bLHw5gYPlO2206YroEqegraPXCxpSzzla0AKSYiEy4Sm7CnTE6pTbuR8PReycrOutHMoozT4dxCYL51fSwm9Eq6Ol4OFZ6LlaTcfjb5LCcJBPJFozfIhfdmOoWolY/Ha0OwGID7c/9/knG7eB39z5sJ7jTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=W53CW9aQ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="W53CW9aQ"
ARC-Seal: i=1; a=rsa-sha256; t=1792262587; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dpm8PpAWUjIxxKKJAfdWpOVcI71miH6TlRdDmg/L4P0cBgHE5G8h9KGpVlpJSfN/7GBymDmlaamStdVCI2fCtM/tkTFq2/takKTBIqBOMa04ghDnpOR/vN6OFxItnw27G6CgU48b0zCZIsgHyqIei+0OhDIIiDal/rXn+E1v3hU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792262587; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Gcyo/x+7dSKQKoLvMY1mobH5f1e7zJvCCB0MCLbeP+w=; 
	b=S++NVNTa70WNkFI5ddu/rYAAokxononJlvzikdrjhrpyloqY7g70+HYt/dEylLLRAAoteXPaghR+AuHln1YKWkQnfXchLoKzLat5GdGVGeEnGpRiBXdc1qawEzF3nUfwZNF1i/zF5ws/HlNEsVfxavRoQ5gMsnBmRt9EFd8N2KE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792262587;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Gcyo/x+7dSKQKoLvMY1mobH5f1e7zJvCCB0MCLbeP+w=;
	b=W53CW9aQTi283A0JpvPYwetHcWTgVjPV8qKIQmDpH8rjUOyFziYmdZGmEBUvLhkt
	szNjaJd1TKedPnTJghGZiGlsIrpxvGBJF6WQmQ/UPTm9UD0rs3SU10aP2n1I41u/Fj0
	YcGrQC7KU9MlnVx4cSMcycveWPNphCcFP7ClHwBI0GMKtZ+WAGt+UPDg5nbWaX13Iev
	Fmuo/0nClbP6ebfUN8My8Bws+kpJ+G0Wj5BWnwndjZEX0QdTieJYKSZonFZZy222XPg
	VnLSiizpLhZcdahT5ioGupVBiVK8l+xWuKdolOKxmWc9tB2wz3x4mVWYWyFuTiXi9Gv
	1lAimN3iFg==
Received: by smtp.zohomail.com with SMTPS id 1792262585624167.99608790288596;
	Sat, 17 Oct 2026 11:43:05 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 18 Oct 2026 02:42:35 +0800
Subject: [PATCH v4 05/12] platform/x86: lenovo-wmi-capdata: Defer mutex
 initialization
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-lwmi-wmi-new-api-v4-5-aafef7956c4a@rong.moe>
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

In the following changes, priv->list may be freed if the first call to
lwmi_cd_cache() fails due to WMI/ACPI errors, so the list_mutex must be
initialized after it in order not to break lockdep, as there is no
devm_mutex_destroy(). Considering that the first call to lwmi_cd_cache()
doesn't need serialization as there is no other reader or writer this
early, the initialization of list_mutex can be deferred.

Therefore, initialize list_mutex only after the first call to
lwmi_cd_cache() succeeds, otherwise it remains uninitialized and can be
devm_kfree()-ed.

Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Synchronize the initialization with release-acquire barriers (thanks
  Ilpo Järvinen)
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 86 +++++++++++++++++++++++--------
 1 file changed, 65 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 5748859f8101..3ef8879d8587 100644
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
@@ -586,14 +589,14 @@ static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
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
@@ -615,7 +618,6 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 		return -EINVAL;
 	}
 
-	guard(mutex)(&priv->list->list_mutex);
 	for (idx = 0; idx < priv->list->count; idx++, p += size) {
 		union acpi_object *ret_obj __free(kfree) = NULL;
 
@@ -633,14 +635,38 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
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
@@ -686,6 +712,9 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_lis
 	if (!list)
 		return -ENOMEM;
 
+	list->count = count;
+	priv->list = list;
+
 	for (idx = 0; idx < count; idx++) {
 		/* Do not calculate array index using count, as it may be truncated. */
 		list->cd_fan[idx] = (struct capdata_fan) {
@@ -695,8 +724,7 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_lis
 		};
 	}
 
-	*listptr = list;
-	return count;
+	return 0;
 }
 
 /**
@@ -712,7 +740,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
 {
 	struct cd_list *list;
 	size_t list_size;
-	int count, ret;
+	int count;
 
 	count = wmidev_instance_count(priv->wdev);
 
@@ -724,11 +752,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
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
@@ -737,17 +761,33 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
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
@@ -766,7 +806,11 @@ static int lwmi_cd_setup(struct lwmi_cd_priv *priv)
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

