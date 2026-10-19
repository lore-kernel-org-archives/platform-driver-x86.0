Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422275;
	b=3SeI3s6Y8V8+3CW1EEa9H2dQCCBUircEwCozwNeybu7icJbkkljCeKHE9+Jfl9FqEb5g
	 UuzbJcPkzGVq5D1LRpgcFZ4BzHtA1ch/g/AgnL2xv+o7eiS9gJdeH0Y1pv8CvVKh1hB+N
	 RdghAMbn63ZSEhzJZ0/EY8g31YkaYzSh6W5XeX8gFSOnrfMIHds9fT5zVF0faMjEy69Il
	 vlaqkOnhjB0x0G+MQZx4YpkEnPQV59RSh2pYba1jby1U/197zhumTa0kTOJdNt/X1ex3G
	 rZ/SMYieZIKfN8snHqx0J3yMteYj/RqENSARzingzCo8pmINUNPMTrKlaut15MbkKQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422275;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=pDkeAjEf7CBlFjh3CVcYW7A4XwN4/HsXPRkdenR0yqE=;
	b=YmUgURFNcJd+rI41kNsxsU/fcGje5iFHsJSM/UB2LFXacm/pWk+5qec8zonB+wKcsLeW
	 jVZNhg/SYu4RFVy3mK43IfY2qFP86tIJIHjHTpb5Xa2yMBitk+Woxeyux+XrWGD1rme+z
	 77XaVFTlJt8apno274v618DMXquuGuRUWYWMDQHT30JRuptg2srPrWpVNXtGyGHaAI1AO
	 v+QtxPsp4oiMt6tkztIYMC79bEJoZ+Sh53ADh7slW604DF1gGb00+Ax7O7O/LQcQ2bfg4
	 KaCWfigwme8YzdvlSazrU+7KgaGAY745pr6tLciU2Bf9zQ4V1gdvYS7oqkkn7PbQcdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=QMWd3xZU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABE1607F49B;
	Mon, 19 Oct 2026 15:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ABE1607F49B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=QMWd3xZU
ARC-Seal: i=1; a=rsa-sha256; t=1792422206; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nmCakz1O1AeAjarAkOuSjGk6tCbJLr64lwoFaBTkbUQpE/hHcD2DXFLUTIax0BC3ztCqUa6Bw9x8vU6Bqdb9P5UBsIRNNDpT9xBVkbXwVCnlL/2IfnWOOe8W4rBTcbLWdGM5WNHCK56Q+zu+8J2/oj/jk9Q+SY0AfcVxCwmz4yc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792422206; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pDkeAjEf7CBlFjh3CVcYW7A4XwN4/HsXPRkdenR0yqE=; 
	b=NxXC46FwT2rXI0McmcNWdX7l82Q70Za6gEdor1kFpMPsB0pHbmTdQaeD/ietmEZ6nKLXI8J+MUEEFoCi07ZlYlTvnYcjfoXuU32aPpR1SYoxm84HddA5w5zav5/Vjz5/PsnDT/el6mdZgek5hMjbXBj7HrlwvyPy31Cu0/ff9gM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792422206;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=pDkeAjEf7CBlFjh3CVcYW7A4XwN4/HsXPRkdenR0yqE=;
	b=QMWd3xZUTbnZoDQ4Zna6Wcl3khNnt08q6G9Sioh9GZSRAQ5iQKbJQxbAXPhultk+
	ZbsMVYPe+tYXHFV38sXoL3fge56ktUecweNEqhofIRmxcNT/lJRBkWGNnRyB/zDQcXf
	P+wyINou7ThEpCV+GZlXuPwUgLehSGpU/mfz1o2o/LkbaFxHxkE9iJXZEICKWg9Ek4+
	eAmcdJBaDm69f8ILMeA2QNP358FOKdn6PlE0p9a7jn5HrdyfNe/hLM+f7ZTJmkpCh9n
	KggQLJqv/1bWavObpQihMMlBJvmu33JIWSgoe9VnXSM6r8R1wNv5SX/r1A6jkl5lBvR
	n0ABzWOWGA==
Received: by smtp.zohomail.com with SMTPS id 17924222012321005.8235513667192;
	Mon, 19 Oct 2026 08:03:21 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 19 Oct 2026 23:02:30 +0800
Subject: [PATCH v5 08/12] platform/x86: lenovo-wmi-capdata: Register
 component even on WMI error
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261019-lwmi-wmi-new-api-v5-8-71557d28d058@rong.moe>
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
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Replace the term "poison" with "stub" (thanks Ilpo Järvinen)
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 94 +++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 0efe37644627..7310b72e8c2f 100644
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
 
 	struct lwmi_cd_fan_block *block __free(kfree) = wbuf.data;
 

-- 
2.55.0

