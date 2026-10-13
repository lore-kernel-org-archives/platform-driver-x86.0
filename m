Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB9B52FE4D;
	Tue, 13 Oct 2026 19:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919674; cv=pass; b=IX7byoGi5wpG0XXTbpCmWUyCpHZ4ZtrNqT+6Lc9FWB4RIJQ25BBZAp6KY8XhzP+Sjn+dXwJ2HzbEewfYfR2SpRltJzt/m982wFu0JApYxha4832F2qb2mNShyQ2RnE9tKYmKTwKKkI+o+dbg6dDV6e9RxstjnIjJrJetlzlbW94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919674; c=relaxed/simple;
	bh=RKshi51i/746iDvkAmg4QkUZnCljUvXCyJFKBgsg674=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pi/rBY1GFWmuy0mH0LD6Z73EeDtWTIzEsK0khkClYsg31sJXKZCf158W5kiBETCX0ipweaShz3fA5yj1gTA0aVI3tDBr1vk+DGYIapiX/EvWyGaINkxZidZLHFRjCWp0ug6eEU5QnsRKkZ9rgRL/NlhE0jfOVWDHufiglhm1FoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=jA6AAb8Z; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="jA6AAb8Z"
ARC-Seal: i=1; a=rsa-sha256; t=1791919616; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TGSkXjwmlGkaWCIG6H6ixun8pVYwPnCBpOSPriEUEqCfsnDPtp/SBz4egZ10FHIO1WvRNMdb0M7dwL8ffQ6BZoJjsJMdvvc/QtGUr5uNBKrXDqZP79GSH5kv5R3+ApkkaQNHLdKR/b68GS8UqhXrfczf2gn4rXEOer8yQZ+mTl4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791919616; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xBmCladIJBDvP8VZNRKiXsixskIfXVC6vct1AaMXikw=; 
	b=gJ/V56Jb6Brf8GCQMdwIQvdSNXbSjfuFncB1Q+6uo4Ac19ZiF0mPZxpCGHJlcnRTdwbOA6t9DZFVddR8NVgfCYg6+Yv5d2QT4Y7Gjqvp1vDBaF0nAOiO9vGMV9W8mzIi9p73S0j0U4bDTX+o4IfyVPPGicnGbE31JI2xsc3AUZw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791919616;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=xBmCladIJBDvP8VZNRKiXsixskIfXVC6vct1AaMXikw=;
	b=jA6AAb8Zum3UkcPXguLRf9UeVg8X3OoN+6DgRt9Ut98FkB2ToVa45tKGW7kHWt+g
	sFnOpwrmxJU0qk8KD6DoaiCPeHJzuHLMLsJY8rc2Q1zaxbMGzUD0W38jwObdGgmEvPb
	hXVcV9Ma+raZmjyK+hEw+/pxiTvxeUvzIs5/BNyqD5N2Pk56VCl8fZ4iL9I/DlAFOE8
	P7TrLyVGbgDcpaYafb0Z2mRvo3mgiDyN9UqmIez9jrE2JZSvczGKMLbWq26r/QARWkU
	kqCnzUdYZSlTU8b9CMlsNCNVSi9XNp58bHROatHbXkUbKZpcJpwM/KkRN0j/Lq41WP6
	S3L9XmKUMA==
Received: by smtp.zohomail.com with SMTPS id 1791919614178821.0788592501591;
	Tue, 13 Oct 2026 12:26:54 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 14 Oct 2026 03:21:48 +0800
Subject: [PATCH v3 05/12] platform/x86: lenovo-wmi-capdata: Defer mutex
 initialization
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261014-lwmi-wmi-new-api-v3-5-e1032bed1c81@rong.moe>
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

