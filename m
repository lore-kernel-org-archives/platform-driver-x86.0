Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FE051596E;
	Tue, 13 Oct 2026 19:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919663; cv=pass; b=V9kQKw41+ksiZ+sLviAuu00RNvnaqSUv724yon+zRa5fQHHEXIctIGnxeP6AgXkQaUyH6wn8mumbbmgiYbdOH4RPIL448hraYTel4eSC7Gr9RZC7m6ACi2QCb/Sz7RzimAuU4HMJRQxNAATRrCagenE72EkjZ+ONVDp94p2syrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919663; c=relaxed/simple;
	bh=vUU+EVCbVDWvFg/wDo283Lcu+aR7VUZPIsCjjtCbBiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=smtHJ4hjSlUBHFKMPzjd485we02P1C1W13ZTmzJObM/YCA172BXmeFJrEe0Y/jjro598rpraUlSJV5HgxOG7t0lURnydDKzKn/wejZa+0c+N4R9HXTutH+YiBJ34yQw6uC6zKU/uiJMgrDZIgzgubdsf9N27nOIdecvivirpYb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=bu7iGkYJ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="bu7iGkYJ"
ARC-Seal: i=1; a=rsa-sha256; t=1791919614; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d44D6j10+yebQD4RSTmJSULTNSntWb2EmoWfBlPFatgfwy6nED2ehJpBemwElR6clRn6V00uqAaZmyIc+l94YEER+2y5J5VEyT8rwM9Yw0flIPEeAcejG4Js/SroB34Ge1QfITh13oRBzjvYUUt3If6djTy0jHWXADxnVBWsI3E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791919614; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3qkpJcoZWHHFpEAqTLdyt1qMmFetpmA4qvJYokZciDg=; 
	b=Iypp91TfLEIQ92lDvmuJ1Yvg7/jHrXkoZWoiEHxGhiL1GON4g7bEu7vml7Q7xhn5ZA3WVdXRnYg+170hiOklLBm8w73Bfr4vEGxTAyu/cFn1ie3IyMMElRsc9VPdIcviEHf6kWYoDLyhS6IHSlQllqXIOAMD01QfD9bAt+HhvHw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791919614;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=3qkpJcoZWHHFpEAqTLdyt1qMmFetpmA4qvJYokZciDg=;
	b=bu7iGkYJ0YvGswUM0lHwPyahPayOXwLHhkXsJRKCy2HnAnNPxwwtAyC18Q2spH4M
	UD+yJCcryYFnB7HD7Sv09kBrAte07sOpgKB0oPjGPbSoxRAYbFigi9rRghlNN6hlvU3
	nsg7F6NKAj0sKB0PN8PDLNxnXQjWY+3iTaL3fhqsglmShxIHQehYQjntwZbU4DEl9p5
	y0s6RjUxQbNoiXHIthfarNY0qHzKhdHTG2oTOI45sJKfujTY/FLPGxxBMmSbnRu0OuK
	eOw4oLrqyYJMoOuuWK0at4+lkgaSzC66XREMwCxfICY/vexM4l2O/uBAZh9JSbDGl/H
	2mzHYWIcCQ==
Received: by smtp.zohomail.com with SMTPS id 179191961160238.814111184771605;
	Tue, 13 Oct 2026 12:26:51 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 14 Oct 2026 03:21:47 +0800
Subject: [PATCH v3 04/12] platform/x86: lenovo-wmi-capdata: Store a pointer
 to component info
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-lwmi-wmi-new-api-v3-4-e1032bed1c81@rong.moe>
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

In the following changes, priv->list will become optional (i.e.,
NULLable). IOW, the type of the component cannot be reliable retrieved
from priv->list->type.

Store a pointer to component info so that the component type is always
available. In this manner, priv->list->type can be eliminated. Note that
the component type check in lwmi_cd*_get_data() must be removed due to
it being called without the availability of priv. Removing it should be
fine as the capdata APIs are really internal methods and their caller,
i.e., lenovo-wmi-other, always passes a matched list.

This also eliminates the need to pass the component type along setup
functions.

Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 44 +++++++++++++------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index fbe2ba627ff5..5748859f8101 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -87,6 +87,7 @@ static const struct lwmi_cd_info {
 
 struct lwmi_cd_priv {
 	struct notifier_block acpi_nb; /* ACPI events */
+	const struct lwmi_cd_info *info;
 	struct wmi_device *wdev;
 	struct cd_list *list;
 	struct dentry *debugfs_dir;
@@ -108,7 +109,6 @@ struct lwmi_cd_priv {
 
 struct cd_list {
 	struct mutex list_mutex; /* list R/W mutex */
-	enum lwmi_cd_type type;
 	u8 count;
 
 	union {
@@ -137,7 +137,7 @@ static int lwmi_cd_match(struct device *dev, void *type)
 		return false;
 
 	priv = dev_get_drvdata(dev);
-	return priv->list->type == *(enum lwmi_cd_type *)type;
+	return priv->info->type == *(enum lwmi_cd_type *)type;
 }
 
 /**
@@ -254,7 +254,7 @@ static int lwmi_cd_component_bind(struct device *cd_dev,
 	struct lwmi_cd_priv *priv = dev_get_drvdata(cd_dev);
 	struct lwmi_cd_binder *binder = data;
 
-	switch (priv->list->type) {
+	switch (priv->info->type) {
 	case LENOVO_CAPABILITY_DATA_00:
 		binder->cd00_list = priv->list;
 
@@ -452,14 +452,11 @@ static const struct component_ops lwmi_cd_sub_component_ops = {
  *
  * Return: 0 on success, or -EINVAL.
  */
-#define DEF_LWMI_CDXX_GET_DATA(_cdxx, _cd_type, _output_t)					\
+#define DEF_LWMI_CDXX_GET_DATA(_cdxx, _output_t)						\
 	int lwmi_##_cdxx##_get_data(struct cd_list *list, u32 attribute_id, _output_t *output)	\
 	{											\
 		u8 idx;										\
 												\
-		if (WARN_ON(list->type != _cd_type))						\
-			return -EINVAL;								\
-												\
 		guard(mutex)(&list->list_mutex);						\
 		for (idx = 0; idx < list->count; idx++) {					\
 			if (list->_cdxx[idx].id != attribute_id)				\
@@ -470,13 +467,13 @@ static const struct component_ops lwmi_cd_sub_component_ops = {
 		return -EINVAL;									\
 	}
 
-DEF_LWMI_CDXX_GET_DATA(cd00, LENOVO_CAPABILITY_DATA_00, struct capdata00);
+DEF_LWMI_CDXX_GET_DATA(cd00, struct capdata00);
 EXPORT_SYMBOL_NS_GPL(lwmi_cd00_get_data, "LENOVO_WMI_CAPDATA");
 
-DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdata01);
+DEF_LWMI_CDXX_GET_DATA(cd01, struct capdata01);
 EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CAPDATA");
 
-DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_fan);
+DEF_LWMI_CDXX_GET_DATA(cd_fan, struct capdata_fan);
 EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CAPDATA");
 
 /* ======== debugfs ======== */
@@ -550,15 +547,14 @@ static int lwmi_cd_debugfs_show(struct seq_file *s, void *data)
 
 	guard(mutex)(&priv->list->list_mutex);
 
-	/* lwmi_cd_alloc() ensured priv->list->type must be a valid type. */
 	for (idx = 0; idx < priv->list->count; idx++) {
-		seq_printf(s, "%s[%u]:\n", lwmi_cd_table[priv->list->type].name, idx);
+		seq_printf(s, "%s[%u]:\n", priv->info->name, idx);
 
-		if (priv->list->type == LENOVO_CAPABILITY_DATA_00)
+		if (priv->info->type == LENOVO_CAPABILITY_DATA_00)
 			lwmi_cd00_show(s, &priv->list->cd00[idx]);
-		else if (priv->list->type == LENOVO_CAPABILITY_DATA_01)
+		else if (priv->info->type == LENOVO_CAPABILITY_DATA_01)
 			lwmi_cd01_show(s, &priv->list->cd01[idx]);
-		else if (priv->list->type == LENOVO_FAN_TEST_DATA)
+		else if (priv->info->type == LENOVO_FAN_TEST_DATA)
 			lwmi_cd_fan_show(s, &priv->list->cd_fan[idx]);
 	}
 
@@ -603,7 +599,7 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 	int idx;
 	void *p;
 
-	switch (priv->list->type) {
+	switch (priv->info->type) {
 	case LENOVO_CAPABILITY_DATA_00:
 		p = &priv->list->cd00[0];
 		size = sizeof(priv->list->cd00[0]);
@@ -706,14 +702,13 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_lis
 /**
  * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
  * @priv: lenovo-wmi-capdata driver data.
- * @type: The type of capability data.
  *
  * Allocate a cd_list struct large enough to contain data from all WMI data
  * blocks provided by the interface.
  *
  * Return: 0 on success, or an error.
  */
-static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
+static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
 {
 	struct cd_list *list;
 	size_t list_size;
@@ -721,7 +716,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 
 	count = wmidev_instance_count(priv->wdev);
 
-	switch (type) {
+	switch (priv->info->type) {
 	case LENOVO_CAPABILITY_DATA_00:
 		list_size = struct_size(list, cd00, count);
 		break;
@@ -747,7 +742,6 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 	if (ret)
 		return ret;
 
-	list->type = type;
 	list->count = count;
 	priv->list = list;
 
@@ -757,7 +751,6 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 /**
  * lwmi_cd_setup() - Cache all WMI data block information
  * @priv: lenovo-wmi-capdata driver data.
- * @type: The type of capability data.
  *
  * Allocate a cd_list struct large enough to contain data from all WMI data
  * blocks provided by the interface. Then loop through each data block and
@@ -765,11 +758,11 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
  *
  * Return: 0 on success, or an error code.
  */
-static int lwmi_cd_setup(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
+static int lwmi_cd_setup(struct lwmi_cd_priv *priv)
 {
 	int ret;
 
-	ret = lwmi_cd_alloc(priv, type);
+	ret = lwmi_cd_alloc(priv);
 	if (ret)
 		return ret;
 
@@ -842,10 +835,11 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->info = info;
 	priv->wdev = wdev;
 	dev_set_drvdata(&wdev->dev, priv);
 
-	ret = lwmi_cd_setup(priv, info->type);
+	ret = lwmi_cd_setup(priv);
 	if (ret)
 		goto out;
 
@@ -911,7 +905,7 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
 
 	lwmi_cd_debugfs_remove(priv);
 
-	switch (priv->list->type) {
+	switch (priv->info->type) {
 	case LENOVO_CAPABILITY_DATA_00:
 		lwmi_cd_sub_master_del(priv);
 		fallthrough;

-- 
2.55.0

