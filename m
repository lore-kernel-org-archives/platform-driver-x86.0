Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795543434;
	b=3H8ZlpTFX1A7Yi3g7oYqbWTJqpXCKZ+N6kjo1UXUMt6OzBA+g3KIg8jeoy8ktjdhnZzX
	 WuY4je9sxzY/KfGgfbfA0opIEEbUD1GvxSR90KPumxGWRyVoORGHsQUOlrwYruPVyjP7c
	 /rr9t0M3gaIrROYH6t7CpY6TnUFBwrMuZGM/E7Fh/tkhiC/k6HZASz1OQjgCI3xBwTqDq
	 SYc5AVtq3EpgHqbSY8nht1fNc5IrrykYrUwtZlppdAiQhiqRVJWHyXX/5QIXJvcFZpej3
	 ko3kCRhhYI/n+7q8cFuyBRwHKxDwGdTPqvXsYRsL4syRsUPWp6mDQ4TrsGhZVg8yetg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543434;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=744klW7KR0wC+impxWH68RYDcd/EYkvUkY1iDZ6OsWk=;
	b=bLTCY9pPKi+c/T2oqpVw+CQChsZAuqvCJYCg2anjg3Cm9JBau3wyd9I8ukVvwrWVcDvB
	 ZPDQxC5psgxK8PW+jhONEunEK8gd9Zi6g6z9gLDFOL6HwDsiZ8020Zqeof82/eEkX1quN
	 MnHCgtqPjH/SYbjgW+kSv+xTLsRf43/FaviMAQPGBRs/t2WFWkNdxg5sWXPaF0qqMEM1E
	 +XSy5/Ss+ccYgW5ILgiPh4XngTGev+57lcLZj2ZZvMh7LfKvYUHldIxgupRfGgGKlhQLq
	 MsPFc+XUHRAA9IvEsPIWpKF+rbfHDONa9+b6UXeTDsIgCiOLagoASphHLzRduGQNOkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=PBoR5t2c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684EF606A326;
	Tue, 24 Nov 2026 18:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 684EF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=PBoR5t2c
ARC-Seal: i=1; a=rsa-sha256; t=1795543382; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E57BBBd2BKHVmW1mCkDRR3qAVESwCVwNWKizEw//Sr1+vIbk9DVBLgFa1qAPej1T+RKZec/LWHRbVkhvg4vjk9z/hS07Az5uD0YJJwsUSoOKBq6WWCdykZ59otg5FGFMye9mX90VmeSXLX6RnFORP/FX19dvlODxH8vlRovqNhE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795543382; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=744klW7KR0wC+impxWH68RYDcd/EYkvUkY1iDZ6OsWk=; 
	b=RK3l19hqt81Mfo4rHl3PML45BuOU6C9CeTBtcTfbKX02MePCOGJUzRADQKY7fRyD5Cv96onKX9DPnZ2K/hMDNbie4Dxy6A4mRNo4atQclSo1VlPpnxd17NSaO0fa5Buyb96QhHaqWwwf3Ta5+EGIQ6HVMNGj6lC+xxSaOsJX7pU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=PBoR5t2cld6pGSCgEuH4c7sASQxj8GAoxpBmErb/w90SkniveWTcS6kkEi80e6BDXK/x4kMdwor1B6PZNSjLwiSq/hZ2+t6qKta2jw2fPEQlY4HAb7HCWR8PI/hLCqOBfSjsRWdYMbsIckZJwIv6aFpQ6mXWnou3BL6CYdOLAaLQBHmk9UKgI+Yh+ZeItfrvlqiEkG8AyVxPpUmykNZzo/yGucFxFYew0pbgNrmFSyY/CWJk2IUCuX293LrEVQoO/rGrySJ7ICDLlGr3+RLuFI/OF3HmKfnt6V1mjmKZc2LMOF4tyd5FmNJnPr5uiBuuAKrUG+SlnPlo7xpI5haUQQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=744klW7KR0wC+impxWH68RYDcd/EYkvUkY1iDZ6OsWk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795543380932176.65023665323668;
	Tue, 24 Nov 2026 10:03:00 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Wed, 25 Nov 2026 02:02:40 +0800
Subject: [PATCH v2 2/5] platform/x86: lenovo-wmi-other: Eliminate
 attribute-specific callbacks
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
Message-Id: <20261125-lwmi-no-singleton-v2-2-37611a7b2fc4@rong.moe>
References: <20261125-lwmi-no-singleton-v2-0-37611a7b2fc4@rong.moe>
In-Reply-To: <20261125-lwmi-no-singleton-v2-0-37611a7b2fc4@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

Currently, all firmware-attributes are backed by numerous
attribute-specific wrapper callbacks generated by macros. Besides,
every firmware attribute has the same type "integer" and shares the same
show callback int_type_show(), but LWMI_ATTR_GROUP_TUNABLE_CAP01()
defines attr_*_type over and over again.

As a result, the definition of attributes significantly bloats up the
module size.

Eliminating these attribute-specific callbacks by moving their data into
a newly-introduced container struct capdata01_attr, and utilize
container_of_const() to retrieve the required data in the corresponding
callbacks, which are adjusted to make them generic and shared among
different attributes. Also introduce a unified attr_int_type attribute
to replace all attr_*_type attributes.

With these, all firmware-attributes now use generic callbacks directly
and are constified.

This shrinks the module size by 23.8K (42.7%).

      text       data        bss      total filename (before)
     23463      32197          3      55663 lenovo-wmi-other.ko

      text       data        bss      total filename (after)
      5816      26059          3      31878 lenovo-wmi-other.ko

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-other.c | 217 ++++++++++++++++----------------
 1 file changed, 108 insertions(+), 109 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index c31a8bd08a85..4d51b05a5acf 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -981,7 +981,7 @@ struct tunable_attr_01 {
  *
  * Return: encoded capability data attribute ID.
  */
-static u32 tunable_attr_01_id(struct tunable_attr_01 *attr, u8 mode)
+static u32 tunable_attr_01_id(const struct tunable_attr_01 *attr, u8 mode)
 {
 	return lwmi_attr_id(attr->device_id, attr->feature_id, mode, attr->type_id);
 }
@@ -1118,6 +1118,15 @@ static struct tunable_attr_01 gpu_nv_cpu_boost = {
 	.type_id = LWMI_TYPE_ID_NONE,
 };
 
+struct capdata01_attr {
+	struct kobj_attribute kobj_attr;
+	struct tunable_attr_01 *tunable_attr;
+	union {
+		enum attribute_property prop;
+		const char *display_name;
+	};
+};
+
 struct capdata01_attr_group {
 	const struct attribute_group *attr_group;
 	struct tunable_attr_01 *tunable_attr;
@@ -1128,6 +1137,12 @@ static inline struct lwmi_om_priv *kobj_to_om_priv(const struct kobject *kobj)
 	return dev_get_drvdata(kobj_to_dev(kobj->parent));
 }
 
+static inline const struct capdata01_attr *
+kobj_attr_to_cd01_attr(const struct kobj_attribute *kattr)
+{
+	return container_of_const(kattr, struct capdata01_attr, kobj_attr);
+}
+
 /* Attribute Methods */
 
 /**
@@ -1138,36 +1153,54 @@ static inline struct lwmi_om_priv *kobj_to_om_priv(const struct kobject *kobj)
  *
  * Return: Number of characters written to buf.
  */
-static ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *kattr,
+static ssize_t int_type_show(struct kobject *kobj, const struct kobj_attribute *kattr,
 			     char *buf)
 {
 	return sysfs_emit(buf, "integer\n");
 }
 
+static const struct kobj_attribute attr_int_type = __KOBJ_ATTR(type, 0444, int_type_show, NULL);
+
+/**
+ * attr_display_name_show() - Get the display name of the given attribute
+ * @kobj: Pointer to the driver object.
+ * @kattr: Pointer to the attribute calling this function.
+ * @buf: The buffer to write to.
+ *
+ * Retrieves the display name from the capdata01_attr struct for the specified
+ * attribute. This function is intended to be generic so it can be called from
+ * any integer attributes.
+ *
+ * Return: Number of characters written to buf.
+ */
+static ssize_t attr_display_name_show(struct kobject *kobj,
+				      const struct kobj_attribute *kattr, char *buf)
+{
+	const struct capdata01_attr *cd01_attr = kobj_attr_to_cd01_attr(kattr);
+
+	return sysfs_emit(buf, "%s\n", cd01_attr->display_name);
+}
+
 /**
  * attr_capdata01_show() - Get the value of the specified attribute property
  *
  * @kobj: Pointer to the driver object.
  * @kattr: Pointer to the attribute calling this function.
  * @buf: The buffer to write to.
- * @tunable_attr: The attribute to be read.
- * @prop: The property of this attribute to be read.
  *
  * Retrieves the given property from the capability data 01 struct for the
  * specified attribute's "custom" thermal mode. This function is intended
- * to be generic so it can be called from any integer attributes "_show"
- * function.
- *
- * If the WMI is success the sysfs attribute is notified.
+ * to be generic so it can be called from any integer attributes.
  *
  * Return: Either number of characters written to buf, or an error code.
  */
 static ssize_t attr_capdata01_show(struct kobject *kobj,
-				   struct kobj_attribute *kattr, char *buf,
-				   struct tunable_attr_01 *tunable_attr,
-				   enum attribute_property prop)
+				   const struct kobj_attribute *kattr, char *buf)
 {
 	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
+	const struct capdata01_attr *cd01_attr = kobj_attr_to_cd01_attr(kattr);
+	const struct tunable_attr_01 *tunable_attr = cd01_attr->tunable_attr;
+	enum attribute_property prop = cd01_attr->prop;
 	struct capdata01 capdata;
 	u32 attribute_id;
 	int value, ret;
@@ -1204,26 +1237,23 @@ static ssize_t attr_capdata01_show(struct kobject *kobj,
  * @kattr: Pointer to the attribute calling this function.
  * @buf: The buffer to read from, this is parsed to `int` type.
  * @count: Required by sysfs attribute macros, pass in from the callee attr.
- * @tunable_attr: The attribute to be stored.
  *
  * Sets the value of the given attribute when operating under the "custom"
  * smartfan profile. The current smartfan profile is retrieved from the
  * lenovo-wmi-gamezone driver and error is returned if the result is not
  * "custom". This function is intended to be generic so it can be called from
- * any integer attribute's "_store" function. The integer to be sent to the WMI
- * method is range checked and an error code is returned if out of range.
- *
- * If the value is valid and WMI is success, then the sysfs attribute is
- * notified.
+ * any integer attributes. The integer to be sent to the WMI method is range
+ * checked and an error code is returned if out of range.
  *
  * Return: Either count, or an error code.
  */
 static ssize_t attr_current_value_store(struct kobject *kobj,
-					struct kobj_attribute *kattr,
-					const char *buf, size_t count,
-					struct tunable_attr_01 *tunable_attr)
+					const struct kobj_attribute *kattr,
+					const char *buf, size_t count)
 {
 	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
+	const struct capdata01_attr *cd01_attr = kobj_attr_to_cd01_attr(kattr);
+	const struct tunable_attr_01 *tunable_attr = cd01_attr->tunable_attr;
 	struct wmi_method_args_32 args = {};
 	struct capdata01 capdata;
 	enum thermal_mode mode;
@@ -1266,22 +1296,20 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
  * @kobj: Pointer to the driver object.
  * @kattr: Pointer to the attribute calling this function.
  * @buf: The buffer to write to.
- * @tunable_attr: The attribute to be read.
  *
  * Retrieves the value of the given attribute for the current smartfan profile.
  * The current smartfan profile is retrieved from the lenovo-wmi-gamezone driver.
  * This function is intended to be generic so it can be called from any integer
- * attribute's "_show" function.
- *
- * If the WMI is success the sysfs attribute is notified.
+ * attributes.
  *
  * Return: Either number of characters written to buf, or an error code.
  */
 static ssize_t attr_current_value_show(struct kobject *kobj,
-				       struct kobj_attribute *kattr, char *buf,
-				       struct tunable_attr_01 *tunable_attr)
+				       const struct kobj_attribute *kattr, char *buf)
 {
 	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
+	const struct capdata01_attr *cd01_attr = kobj_attr_to_cd01_attr(kattr);
+	const struct tunable_attr_01 *tunable_attr = cd01_attr->tunable_attr;
 	struct wmi_method_args_32 args = {};
 	enum thermal_mode mode;
 	int retval;
@@ -1382,128 +1410,99 @@ static bool lwmi_attr_01_is_supported(struct lwmi_om_priv *priv,
 }
 
 /* Lenovo WMI Other Mode Attribute macros */
-#define __LWMI_ATTR_RO(_func, _name)                                  \
-	{                                                             \
-		.attr = { .name = __stringify(_name), .mode = 0444 }, \
-		.show = _func##_##_name##_show,                       \
-	}
 
-#define __LWMI_ATTR_RO_AS(_name, _show)                               \
-	{                                                             \
-		.attr = { .name = __stringify(_name), .mode = 0444 }, \
-		.show = _show,                                        \
+/* Attribute current value read/write */
+#define __LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname)                                        \
+	static const struct capdata01_attr ext_attr_##_attrname##_current_value = {          \
+		.kobj_attr = __KOBJ_ATTR(current_value, 0644,                                \
+					 attr_current_value_show, attr_current_value_store), \
+		.tunable_attr = &_attrname,                                                  \
 	}
 
-#define __LWMI_ATTR_RW(_func, _name) \
-	__ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_store)
-
-/* Shows a formatted static variable */
-#define __LWMI_ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)                     \
-	static ssize_t _attrname##_##_prop##_show(                             \
-		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
-	{                                                                      \
-		return sysfs_emit(buf, _fmt, _val);                            \
-	}                                                                      \
-	static struct kobj_attribute attr_##_attrname##_##_prop =              \
-		__LWMI_ATTR_RO(_attrname, _prop)
+/* Attribute property read only */
+#define __LWMI_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)                               \
+	static const struct capdata01_attr ext_attr_##_attrname##_##_prop = {               \
+		.kobj_attr = __KOBJ_ATTR(_prop, 0444, attr_capdata01_show, NULL),           \
+		.tunable_attr = &_attrname,                                                 \
+		.prop = _prop_type,                                                         \
+	}
 
-/* Attribute current value read/write */
-#define __LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname)                          \
-	static ssize_t _attrname##_current_value_store(                        \
-		struct kobject *kobj, struct kobj_attribute *kattr,            \
-		const char *buf, size_t count)                                 \
-	{                                                                      \
-		return attr_current_value_store(kobj, kattr, buf, count,       \
-						&_attrname);                   \
-	}                                                                      \
-	static ssize_t _attrname##_current_value_show(                         \
-		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
-	{                                                                      \
-		return attr_current_value_show(kobj, kattr, buf, &_attrname);  \
-	}                                                                      \
-	static struct kobj_attribute attr_##_attrname##_current_value =        \
-		__LWMI_ATTR_RW(_attrname, current_value)
+/* Attribute display name */
+#define __LWMI_DISPLAY_NAME(_attrname, _val)                                                \
+	static const struct capdata01_attr ext_attr_##_attrname##_display_name = {          \
+		.kobj_attr = __KOBJ_ATTR(display_name, 0444, attr_display_name_show, NULL), \
+		.tunable_attr = &_attrname,                                                 \
+		.display_name = _val,                                                       \
+	}
 
-/* Attribute property read only */
-#define __LWMI_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)                  \
-	static ssize_t _attrname##_##_prop##_show(                             \
-		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
-	{                                                                      \
-		return attr_capdata01_show(kobj, kattr, buf, &_attrname,       \
-					   _prop_type);                        \
-	}                                                                      \
-	static struct kobj_attribute attr_##_attrname##_##_prop =              \
-		__LWMI_ATTR_RO(_attrname, _prop)
-
-#define LWMI_ATTR_GROUP_TUNABLE_CAP01(_attrname, _fsname, _dispname)      \
+#define LWMI_ATTR_GROUP_TUNABLE_CAP01(_attrname, _dispname)               \
 	__LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname);                    \
 	__LWMI_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);   \
-	__LWMI_ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname); \
+	__LWMI_DISPLAY_NAME(_attrname, _dispname);                        \
 	__LWMI_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);           \
 	__LWMI_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);           \
 	__LWMI_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);   \
-	static struct kobj_attribute attr_##_attrname##_type =            \
-		__LWMI_ATTR_RO_AS(type, int_type_show);                   \
-	static struct attribute *_attrname##_attrs[] = {                  \
-		&attr_##_attrname##_current_value.attr,                   \
-		&attr_##_attrname##_default_value.attr,                   \
-		&attr_##_attrname##_display_name.attr,                    \
-		&attr_##_attrname##_max_value.attr,                       \
-		&attr_##_attrname##_min_value.attr,                       \
-		&attr_##_attrname##_scalar_increment.attr,                \
-		&attr_##_attrname##_type.attr,                            \
+	static const struct attribute *const _attrname##_attrs[] = {      \
+		&ext_attr_##_attrname##_current_value.kobj_attr.attr,     \
+		&ext_attr_##_attrname##_default_value.kobj_attr.attr,     \
+		&ext_attr_##_attrname##_display_name.kobj_attr.attr,      \
+		&ext_attr_##_attrname##_max_value.kobj_attr.attr,         \
+		&ext_attr_##_attrname##_min_value.kobj_attr.attr,         \
+		&ext_attr_##_attrname##_scalar_increment.kobj_attr.attr,  \
+		&attr_int_type.attr,                                      \
 		NULL,                                                     \
 	};                                                                \
 	static const struct attribute_group _attrname##_attr_group = {    \
-		.name = _fsname, .attrs = _attrname##_attrs               \
+		.name = #_attrname,                                       \
+		.attrs_const = _attrname##_attrs,                         \
 	}
 
 /* CPU tunable attributes */
-LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp,
 			      "Set the CPU thermal load limit");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl,
 			      "Set the CPU cross loading power limit");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_apu_spl, "ppt_pl1_apu_spl",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_apu_spl,
 			      "Set the APU sustained power limit");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl,
 			      "Set the CPU sustained power limit");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl_cl, "ppt_pl1_spl_cl",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl_cl,
 			      "Set the CPU cross loading sustained power limit");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt,
 			      "Set the CPU slow package power tracking limit");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt_cl, "ppt_pl2_sppt_cl",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt_cl,
 			      "Set the CPU cross loading slow package power tracking limit");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt,
 			      "Set the CPU fast package power tracking limit");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt_cl, "ppt_pl3_fppt_cl",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt_cl,
 			      "Set the CPU cross loading fast package power tracking limit");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_tau, "ppt_pl1_tau",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_tau,
 			      "Set the CPU sustained power limit exceed duration");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl4_ipl",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl,
 			      "Set the CPU instantaneous power limit");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl,
 			      "Set the CPU cross loading instantaneous power limit");
 
 /* GPU tunable attributes */
-LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_boost_clk, "dgpu_boost_clk",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_boost_clk,
 			      "Set the dedicated GPU boost clock");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_didvid, "dgpu_didvid",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_didvid,
 			      "Get the GPU device identifier and vendor identifier");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_enable, "dgpu_enable",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_enable,
 			      "Set the dedicated Nvidia GPU enabled status");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_mode, "gpu_mode",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_mode,
 			      "Set the GPU mode by power limit");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ac_offset, "gpu_nv_ac_offset",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ac_offset,
 			      "Set the Nvidia GPU AC total processing power baseline offset");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_bpl, "gpu_nv_bpl",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_bpl,
 			      "Set the Nvidia GPU base power limit");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_cpu_boost, "gpu_nv_cpu_boost",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_cpu_boost,
 			      "Set the Nvidia GPU to CPU dynamic boost limit");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ctgp, "gpu_nv_ctgp",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ctgp,
 			      "Set the GPU configurable total graphics power");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ppab, "gpu_nv_ppab",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ppab,
 			      "Set the Nvidia GPU power performance aware boost limit");
-LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_temp, "gpu_temp",
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_temp,
 			      "Set the GPU thermal load limit");
 
 static struct capdata01_attr_group cd01_attr_groups[] = {

-- 
2.55.0

