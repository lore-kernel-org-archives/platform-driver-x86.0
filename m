Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54D63783B4;
	Sun, 13 Sep 2026 20:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332690; cv=pass; b=YmXrU+MYlPQ/E1ibG+K4TcAu7lysb/fJiu3/sm+wYBCfToncM1Odi/k9sBQnUbEUFbmHaHjfSahek7oEcb7R240B/KC1VrZwy8XqtGuO6UCunA4cUk44pw5DYEfJWg7fN128ZgfBvCD181m8tqvrq06kxexGMu5rVVaxSDv0Aqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332690; c=relaxed/simple;
	bh=tDzHL+vPxZNAgGlgZvyls2CIGXTm4N7LnYWR83lLYKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBnoHrkekrcLF1t4sfQbcMaI6Ehy5gK46T+MZ3q6HeA/cTv2JBu8th3Y27TpdDQqVeFVYFhFzMz84XbQo/YYE8kDV830JYTGnH0Tz4sQtaEiaS5u+Ha/57o4Or8BNcC2rb/GZ1YFjOY0XtyZRx5yk/zEGS9UyVuCTKJjiX9E/Vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=L7DwrMuC; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="L7DwrMuC"
ARC-Seal: i=1; a=rsa-sha256; t=1789332646; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CRQmsuW2bFfrLTmwn5lYrC8GOrbzj523QvlzjxtEojeIXm7F31tvJDn7NF2hIZN6VUoV+Ety0PdTyJTQeCXbyjF5Yw8KB57FGJfz8c8+Uzp0STJyWoqgRzc3ZsRPcWJvscFwDU+y3rBo8QkynH28XvkzIwu6M6PWj7KqtKxLr2Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789332646; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ttW3Cbvt0z93dH+e/+ikkPXywRazeEgc7HLKU1mKdz4=; 
	b=gue8EuyNvCk5NE4nkTohJoGKI8wS603XyEYnMkyG9Z6jCNDd+tbwxjfI5xNn1eQ66M/0JBSSMIgK0un6NCPFX1fgAQ7YOyPVqH7YBcWT37Wsjha2m4MlDb/5zy5AMYeFHdU/zkdAOtiGbcvN6T6gFZGMVMwrfgdTLBxqYBGqi58=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789332646;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ttW3Cbvt0z93dH+e/+ikkPXywRazeEgc7HLKU1mKdz4=;
	b=L7DwrMuCWU0NkjLabXhyLJ4SQeFgyyPwth/dZYTlzrbK8Er3/JfDuipuR3f+dw/I
	9zNs4O2ZeTyZcXvuoNtS6zMFDv+zCyQsX5uDL1SYK+PGUvkJ5YzMLssdc+Z7kY02ZMd
	BYf06pG7PJg09evqa+Ck1txXNRUa64aWDwT1tyNjWyP7xJPtc03IeCn0Gap1LhbeLlD
	6hqD6huxTWXYREPuLa/bpT9VYqrhnt7Ik0f6D8+NrcKHhGtfbm6hsyitjXUN2Chu0r3
	fpRIuoNwTgWx2Y7PnLlIfX+uW7fo3MHpNRLPYFnsUIALeOjD6TpV4Mpl1zzSVSsNH7q
	Qss1xr9zZw==
Received: by smtp.zohomail.com with SMTPS id 178933264530419.495999429970652;
	Sun, 13 Sep 2026 13:50:45 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 14 Sep 2026 04:50:27 +0800
Subject: [PATCH 6/9] platform/x86: lenovo-wmi-capdata: Register component
 even on WMI error
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-lwmi-wmi-new-api-v1-6-7a400f2f69f8@rong.moe>
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

Some devices do not support LENOVO_CAPABILITY_DATA_01 and define the
query method as a stub that returns zero buffer. Unfortunately, some
devices do not implement the stub properly, causing WMI errors
(including ACPI errors).

The current lenovo-wmi-* implementation enforces the binding between
LENOVO_CAPABILITY_DATA_00+01 and LENOVO_OTHER_MODE because of a
limitation of the device component framework. When the capdata device
bailing out due to a WMI error, lenovo-wmi-other becomes unbound and
unable to provide firmware-attributes or hwmon device for the other
functional capdata device.

Therefore, WMI errors must be non-fatal in order not to break the
assumptions made by the device component famrework.

Poison the capdata device by releasing the capability data list in this
case. After that, NULL list will be passed to lenovo-wmi-other on bind.
The latter will provide whatever is available, or unbind the components
if nothing is available.

A poisoned capdata device releases or skips allocating most resources,
e.g., the capability data list and the debugfs directory. The device
itself is only used to satisfy the component dependency of lenovo-wmi-
other and coordinate with the latter about the absence of the capability
data.

Reported-by: Charles <hanker007@gmail.com>
Link: https://msgid.link/CAKtz0s8UYRQYW_0bh=0TMx47Axm-W-muEay-r3rqUBS1NHMPVw@mail.gmail.com/
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 71 +++++++++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 5e66e6b52720..d4d5e8c97ddb 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -29,6 +29,7 @@
 #include <linux/acpi.h>
 #include <linux/bug.h>
 #include <linux/cleanup.h>
+#include <linux/compiler.h>
 #include <linux/component.h>
 #include <linux/container_of.h>
 #include <linux/debugfs.h>
@@ -38,6 +39,7 @@
 #include <linux/export.h>
 #include <linux/gfp_types.h>
 #include <linux/limits.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/mutex_types.h>
@@ -45,6 +47,7 @@
 #include <linux/overflow.h>
 #include <linux/seq_file.h>
 #include <linux/stddef.h>
+#include <linux/string.h>
 #include <linux/types.h>
 #include <linux/wmi.h>
 
@@ -447,7 +450,7 @@ static const struct component_ops lwmi_cd_sub_component_ops = {
 /*
  * lwmi_cd*_get_data - Get the data of the specified attribute
  * @list: The lenovo-wmi-capdata pointer to its cd_list struct.
- * @attribute_id: The capdata attribute ID to be found.
+ * @attribute_id: The capdata attribute ID (non-zero) to be found.
  * @output: Pointer to a capdata* struct to return the data.
  *
  * Retrieves the capability data struct pointer for the given
@@ -460,7 +463,7 @@ static const struct component_ops lwmi_cd_sub_component_ops = {
 	{											\
 		u8 idx;										\
 												\
-		if (WARN_ON(!list))								\
+		if (WARN_ON(!list || !attribute_id))						\
 			return -EINVAL;								\
 												\
 		guard(mutex)(&list->list_mutex);						\
@@ -595,6 +598,66 @@ static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
 
 /* ======== WMI interface ======== */
 
+/**
+ * lwmi_cd_poison() - Poison the device by not providing any capability data
+ * @priv: lenovo-wmi-capdata driver data.
+ * @err: The occurred error.
+ *
+ * The Other Mode driver binds to both Capability Data 00 and 01. If either 00
+ * or 01 fails to probe, the Other Mode device will fail to provide fw-attr or
+ * hwmon device for the other functional capdata device.
+ *
+ * Therefore, WMI errors must be non-fatal in order not to break the assumptions
+ * made by the device component famrework, so that the Other Mode device can
+ * provide whatever is functional.
+ *
+ * After poisoning the device, NULL list will be passed to the Other Mode device
+ * on bind.
+ *
+ * Return: 0 if the @err is suppressed, otherwise its propagated as is.
+ */
+static int lwmi_cd_poison(struct lwmi_cd_priv *priv, int err)
+{
+	dev_warn(&priv->wdev->dev, "%s %s (%u items) due to error: %d\n",
+		 priv->initialized ? "clearing" : "poisoning", priv->info->name,
+		 priv->list ? priv->list->count : 0, err);
+
+	/* Simply print the warning message. */
+	if (!priv->list)
+		return priv->initialized ? err : 0;
+
+	/* Poison the device on initialization errors. */
+	if (!priv->initialized) {
+		devm_kfree(&priv->wdev->dev, priv->list);
+		priv->list = NULL;
+
+		return 0;
+	}
+
+	/*
+	 * Runtime errors are transient. Simply clear all cached data and
+	 * propagate the error.
+	 *
+	 * Since a valid attribute id is never 0 (the firmware also untilize the
+	 * fact to stub some capabilities according to platform metadata),
+	 * clearing the cached data effectively makes all attributes temporarily
+	 * unavailable until the next notifier call.
+	 */
+
+	lockdep_assert_held(&priv->list->list_mutex);
+
+	switch (priv->info->type) {
+	case LENOVO_CAPABILITY_DATA_01:
+		memset(priv->list->cd01, 0,
+		       flex_array_size(priv->list, cd01, priv->list->count));
+		break;
+	default:
+		unreachable();
+	}
+
+	return err;
+}
+
 /**
  * __lwmi_cd_cache() - Cache all WMI data block information locklessly
  * @priv: lenovo-wmi-capdata driver data.
@@ -633,7 +696,7 @@ static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
 		if (ret == -ENODATA) /* The block is too short, probably stubbed. */
 			continue;
 		if (ret)
-			return ret;
+			return lwmi_cd_poison(priv, ret);
 
 		/* Capdata 01 is an extension to capdata 00. */
 		struct capdata00 *capdata __free(kfree) = wbuf.data;
@@ -693,7 +756,7 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
 	if (ret == -ENODATA) /* The block is too short, probably stubbed. */
 		return 0;
 	if (ret)
-		return ret;
+		return lwmi_cd_poison(priv, ret); /* Print the warning message. */
 
 	struct cd_fan_block *block __free(kfree) = wbuf.data;
 

-- 
2.55.0

