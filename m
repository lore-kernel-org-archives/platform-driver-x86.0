Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F4A5293F6;
	Tue, 13 Oct 2026 19:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919706; cv=pass; b=nnpK1h8XJiStaLFiU1CfzoFp/z0JlthrAjoaEY3yP58t0NuLdOHUR2LGWTSNlRip7rGZlcKZixA6y2lA8LMrt7DTEPUvRtK38QMUy50iXkw9Z1fNvPvXFa/xpKKEgEJfU2rfvtNer38PM70sfRIbNnQDiZiGHOrGAikkZkcNRnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919706; c=relaxed/simple;
	bh=BK9zPgZ4NjnJkQUnOeM3fi3M8R+OeU0xBp5LqbrU88Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KlbJT9GcpGp8YMEVusoJPnAibkIlBq58pe2ocVooVpDxjEsmXa/pjJkfTFafHc3DorxNQJik6Ls46GnJPAA37rcgMSxQeuK2z64PAbpfgED1qcGnU2sMkwwWUMgD9A52VF7N+hvtCUNuB7SUFm+JNdbCsO/1DSD3fUzSIdCRNpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=XjQX4cmR; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="XjQX4cmR"
ARC-Seal: i=1; a=rsa-sha256; t=1791919624; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VekdCNZzg2SvWW2k64itRp25XG6+TsKcL1uW9j/WOw8nXxMPV67EmQdD3RgUM4WxP6Kof7JF34zJtj0IebNukjIoGR0vMn6tzz475Mpv0cSEKlibiv6M/S4tS5Mfwr9YzncurN1cbSz1pb0alExmrD+KmBLgwGA2PDprCwu2NTQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791919624; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6yk3KjRB3nrjjjf75SCpbNtXXfXfBd5qBXdFyBHV5OU=; 
	b=k4pUu/NeEu2ngq84O3yAMCN9aAlPpVYwQyZ3OPrRtZvlB5lTjCnV4hU9fJKVQVK/gfuz7LQWnEaF2M6qsnmkLnPPglMLA5mrglbkyB52Rc4MkfruVlyuIkSghWq0KC7zPqr8A+4ikHBGn8zbKljPAwvAMMjGxLb/px1B9GzLxpA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791919624;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=6yk3KjRB3nrjjjf75SCpbNtXXfXfBd5qBXdFyBHV5OU=;
	b=XjQX4cmRB9b64OcLcTlaM/tLmePcxCmi9zfgYOy5PdE3sHpWNMOnXvCYykAa0+me
	zscUAk5tdytMGOwV36aXJlmAwwhyunyFBtFcVduqY4DmTZNK2bj5xyDs9ABn8UGTM3d
	h0uxUzMCt+1pWRzMQ7SrDgVYRWZwh8tKZv0A/fv8bFzPlYKYQb5q0YORBEJ/vE/LcgT
	jFR7MzrKiyzDTr7b+Rh4LYdKtohgKjio5umNuJN+cjoWlkvULeZRv700n3IE4SZPGfE
	R51KLJ7e3C1YD6fnMjGkofNrmiqSafbZXNTAtbfKncCHHxM3JHVcDC585Aw2m5fau2O
	XvsTnf461g==
Received: by smtp.zohomail.com with SMTPS id 1791919621912708.0975044850209;
	Tue, 13 Oct 2026 12:27:01 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 14 Oct 2026 03:21:51 +0800
Subject: [PATCH v3 08/12] platform/x86: lenovo-wmi-capdata: Register
 component even on WMI error
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261014-lwmi-wmi-new-api-v3-8-e1032bed1c81@rong.moe>
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

Therefore, errors must be non-fatal in order not to break the
assumptions made by the device component framework.

Stub the capdata device by releasing the capability data list in this
case. After that, NULL list will be passed to lenovo-wmi-other on bind.
The latter will provide whatever is available, or unbind the components
if nothing is available.

A stubbed capdata device releases or skips allocating most resources,
e.g., the capability data list and the debugfs directory. The device
itself is only used to satisfy the component dependency of lenovo-wmi-
other and coordinate with the latter about the absence of the capability
data.

Reported-by: Charles <hanker007@gmail.com>
Closes: https://msgid.link/CAKtz0s8UYRQYW_0bh=0TMx47Axm-W-muEay-r3rqUBS1NHMPVw@mail.gmail.com/
Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Replace the term "poison" with "stub" (thanks Ilpo Järvinen)
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 94 +++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index abf5ffda7163..71ea31482987 100644
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
@@ -595,6 +598,89 @@ static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
 
 /* ======== WMI interface ======== */
 
+/**
+ * lwmi_cd_stub() - Stub the device by not providing any capability data
+ * @priv: lenovo-wmi-capdata driver data.
+ * @err: The occurred error.
+ *
+ * The Other Mode driver binds to both Capability Data 00 and 01. If either 00
+ * or 01 fails to probe, the Other Mode device will fail to provide fw-attr or
+ * hwmon/power_supply_ext devices for the other functional capdata device.
+ *
+ * Therefore, errors must be non-fatal in order not to break the assumptions
+ * made by the device component framework, so that the Other Mode device can
+ * provide whatever is functional.
+ *
+ * After stubbing the device, a NULL list will be passed to the Other Mode
+ * device on bind.
+ *
+ * Return: 0 if the @err is suppressed, otherwise its propagated as is.
+ */
+static int lwmi_cd_stub(struct lwmi_cd_priv *priv, int err)
+{
+	/*
+	 * No barrier is required in any possible code paths:
+	 * - called from lwmi_cd_cache(): a proper barrier has been employed
+	 * - called from lwmi_cd_fan_list_alloc_cache(): early setup does not
+	 *   require synchronization, and priv->initialized must be false
+	 */
+	bool initialized = READ_ONCE(priv->initialized);
+
+	dev_warn(&priv->wdev->dev, "%s %s (%u items) due to error: %d\n",
+		 initialized ? "clearing" : "stubbing", priv->info->name,
+		 priv->list ? priv->list->count : 0, err);
+
+	/* Simply print the warning message. */
+	if (!priv->list)
+		return initialized ? err : 0;
+
+	/*
+	 * Stub the device on initialization errors.
+	 *
+	 * Note that if a transient error occurs during initialization, there is
+	 * nothing we can do to re-enable the functionalities of the Other Mode
+	 * driver even if a successful runtime notifier call making the relevant
+	 * capdata emerge, as registering functionalities without the protection
+	 * of the component framework is unsafe. Therefore, registering the
+	 * notifier for a stubbed device is meaningless, and we don't need to
+	 * distinguish transient and pernament errors during initialization.
+	 *
+	 * For runtime errors (see below), the registered functionalities
+	 * (fw-attr) become temporarily unavailable due to the unavailablilty of
+	 * the relevant capdata, and will recover after a successful runtime
+	 * notifier call.
+	 */
+	if (!initialized) {
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
@@ -633,7 +719,7 @@ static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
 		if (ret == -ENODATA) /* The block is too short, probably stubbed. */
 			continue;
 		if (ret)
-			return ret;
+			return lwmi_cd_stub(priv, ret);
 
 		/* Capdata 01 is an extension to capdata 00. */
 		struct capdata00 *capdata __free(kfree) = wbuf.data;
@@ -694,7 +780,7 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
 	if (ret == -ENODATA) /* The block is too short, probably stubbed. */
 		return 0;
 	if (ret)
-		return ret;
+		return lwmi_cd_stub(priv, ret); /* Print the warning message. */
 
 	struct cd_fan_block *block __free(kfree) = wbuf.data;
 

-- 
2.55.0

