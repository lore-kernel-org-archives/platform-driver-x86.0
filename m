Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.69.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216600;
	b=NZfFsrqpTkXzR0Mb7/B2KphZ3FDDN0/m62DTVAtrFP6JDxATCV+EWDqbYoV8iVUZER9E
	 NdJVcFvqv8u81gea2R74wuN0xziAvYjDKzp93TZDN2G/l/NROB5381iidxtn8DIitatDN
	 cobtQgvdMPua3ZU1Et0VNmjtNCHsbTeMxHnez44l3ZEHUq+3bVfhscPMzuV1MOo81VDlE
	 5S2OKoEr+VTYR+MshA+/G3lUDTjWjzyxRsFYaUXQRoVjgGEvhi0LQx7VZxBg3PmAkkAw+
	 IERfU411ugCW2N/Qy2mPKnkiRVPxHWbler7UOzt/NxFW5MpLL+mjIR7Th6ysPREalCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216600;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Report-Abuse:Feedback-ID:X-smtpcorp-track;
	bh=1iPf5YilaXEpOW76uWldyD93lQGtquY7HiJvpfuAXVY=;
	b=RuaGLwHAC0rO8oOFBDeA4JhNptsbG5+SYDV/H5UyDw4tNx2ofBgmrPFyLQszBIZWMjM4
	 ogWfeoBK0n97q2Ve6W55OwKxotWVzd+ChiROI4j6zVJEzzuOA0ycBYV0f+NRe1xfO8EYR
	 7qCMC18ojGd2avItGlbxeFDXfzQFje6ucPjGGtumHEbvgpIaY/PuCm3T1cW6A9F40KvjF
	 kcQIYnuTo7cRqdgxfnoCAHK7uMpFCmKrLmnKusucYPvMMUqD0XTQq0WjaKUBIkLqxb8ME
	 5dE/K/bgJHj/Y4vT/vKBa2tN0ateORX5ac5vTbjZsYbJThkHs9RLGo+HvUoEO1lQIgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=oven.ninja;
	spf=pass smtp.mailfrom=em762108.oven.ninja;
	dkim=pass header.d=oven.ninja header.i=@oven.ninja header.a=rsa-sha256 header.s=s762108 header.b=YMqapBT4;
	arc=none smtp.remote-ip=170.10.69.209
Received: from o1i465.smtp2go.com (o1i465.smtp2go.com [170.10.69.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D6B606A325
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 23:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D6B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oven.ninja
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em762108.oven.ninja
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oven.ninja header.i=@oven.ninja header.a=rsa-sha256 header.s=s762108 header.b=YMqapBT4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oven.ninja;
 i=@oven.ninja; q=dns/txt; s=s762108; t=1795216590; h=from : subject :
 to : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=1iPf5YilaXEpOW76uWldyD93lQGtquY7HiJvpfuAXVY=;
 b=YMqapBT45kmpK3Zwh23UsYFiHuSTaBMsrYf90oqEj3xAHDLGxf8Xjg56u2MZWdzMyGZee
 QUBIgJ227QbVr84u+8wMyUM+hb2KGgo6As9O3gSqducwNVTSUgQQ0dU/VZy/rGdZedtg0Y+
 VZ2aMWyp0QU/pnupY5ntQZDkSLyywBGeDURxvqfoKt5+jSkrnsdawMqxOSKGdnm/i7NPgXv
 nyLgkvOEFc070MdIg78wkR8MxuHbrNGIXCUXN5DOaY6J+AcJIifupfMKeaRel0B7i86RhHi
 NpCkV/AOwthLe2ZjddK1OsYhWNT74r2KnKWctGWDLDWZbea0Me7zu3p8Q76w==
Received: from [10.240.242.228] (helo=oven-pc)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
	(Exim 4.100.1)
	(envelope-from <ava@oven.ninja>)
	id 1xUXqB-FnQW0hPoboc-ZiLO;
	Fri, 20 Nov 2026 23:16:23 +0000
From: Ava Green <ava@oven.ninja>
To: Prasanth Ksr <prasanth.ksr@dell.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ava Green <ava@oven.ninja>
Subject: [PATCH v3] platform/x86: dell-wmi-sysman: replace deprecated strlcpy with strscpy
Date: Sat, 21 Nov 2026 10:16:07 +1100
Message-ID: <20261120231607.7908-1-ava@oven.ninja>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 762108m:762108aX0MQon:762108sZnAUST3i1
X-smtpcorp-track: kbVHQMlEbO10.KR-cKJAQpNRR.FxtN2QATDc5

The kernel has deprecated the use of strlcpy wrappers in favor of
the safer strscpy variants. Replace the internal driver helper
function strlcpy_attr() with strscpy_attr() across all
dell-wmi-sysman attribute parser files.

Ensure explicit destination buffer sizes are passed using sizeof()
to prevent potential out-of-bounds array writes during ACPI object
evaluations.

Signed-off-by: Ava Green <ava@oven.ninja>
---
Changes in v3:
- Fix kernel doc formatting (reported by kernel robot)
Changes in v2:
- Send accidently, Please ignore this version

 .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  2 +-
 .../dell/dell-wmi-sysman/enum-attributes.c    | 25 +++++++++++--------
 .../x86/dell/dell-wmi-sysman/int-attributes.c | 20 +++++++++------
 .../dell/dell-wmi-sysman/passobj-attributes.c |  5 ++--
 .../dell/dell-wmi-sysman/string-attributes.c  | 25 +++++++++++--------
 .../x86/dell/dell-wmi-sysman/sysman.c         | 18 ++++++-------
 6 files changed, 54 insertions(+), 41 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
index eb48ced55..f82e07efc 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
@@ -162,7 +162,7 @@ static ssize_t curr_val##_store(struct kobject *kobj,				\
 
 union acpi_object *get_wmiobj_pointer(int instance_id, const char *guid_string);
 int get_instance_count(const char *guid_string);
-void strlcpy_attr(char *dest, char *src);
+int strscpy_attr(char *dest, char *src, size_t size);
 
 int populate_enum_data(union acpi_object *enumeration_obj, int instance_id,
 			struct kobject *attr_name_kobj, u32 enum_property_count);
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
index a85639d8a..27291261c 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
@@ -165,24 +165,29 @@ int populate_enum_data(union acpi_object *enumeration_obj, int instance_id,
 	wmi_priv.enumeration_data[instance_id].attr_name_kobj = attr_name_kobj;
 	if (check_property_type(enumeration, ATTR_NAME, ACPI_TYPE_STRING))
 		return -EINVAL;
-	strlcpy_attr(wmi_priv.enumeration_data[instance_id].attribute_name,
-		enumeration_obj[ATTR_NAME].string.pointer);
+	strscpy_attr(wmi_priv.enumeration_data[instance_id].attribute_name,
+		enumeration_obj[ATTR_NAME].string.pointer,
+		sizeof(wmi_priv.enumeration_data[instance_id].attribute_name));
 	if (check_property_type(enumeration, DISPL_NAME_LANG_CODE, ACPI_TYPE_STRING))
 		return -EINVAL;
-	strlcpy_attr(wmi_priv.enumeration_data[instance_id].display_name_language_code,
-		enumeration_obj[DISPL_NAME_LANG_CODE].string.pointer);
+	strscpy_attr(wmi_priv.enumeration_data[instance_id].display_name_language_code,
+		enumeration_obj[DISPL_NAME_LANG_CODE].string.pointer,
+		sizeof(wmi_priv.enumeration_data[instance_id].display_name_language_code));
 	if (check_property_type(enumeration, DISPLAY_NAME, ACPI_TYPE_STRING))
 		return -EINVAL;
-	strlcpy_attr(wmi_priv.enumeration_data[instance_id].display_name,
-		enumeration_obj[DISPLAY_NAME].string.pointer);
+	strscpy_attr(wmi_priv.enumeration_data[instance_id].display_name,
+		enumeration_obj[DISPLAY_NAME].string.pointer,
+		sizeof(wmi_priv.enumeration_data[instance_id].display_name));
 	if (check_property_type(enumeration, DEFAULT_VAL, ACPI_TYPE_STRING))
 		return -EINVAL;
-	strlcpy_attr(wmi_priv.enumeration_data[instance_id].default_value,
-		enumeration_obj[DEFAULT_VAL].string.pointer);
+	strscpy_attr(wmi_priv.enumeration_data[instance_id].default_value,
+		enumeration_obj[DEFAULT_VAL].string.pointer,
+		sizeof(wmi_priv.enumeration_data[instance_id].default_value));
 	if (check_property_type(enumeration, MODIFIER, ACPI_TYPE_STRING))
 		return -EINVAL;
-	strlcpy_attr(wmi_priv.enumeration_data[instance_id].dell_modifier,
-		enumeration_obj[MODIFIER].string.pointer);
+	strscpy_attr(wmi_priv.enumeration_data[instance_id].dell_modifier,
+		enumeration_obj[MODIFIER].string.pointer,
+		sizeof(wmi_priv.enumeration_data[instance_id].dell_modifier));
 
 	next_obj = MODIFIER + 1;
 
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
index ab5c24722..a32630a33 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
@@ -144,24 +144,28 @@ int populate_int_data(union acpi_object *integer_obj, int instance_id,
 	wmi_priv.integer_data[instance_id].attr_name_kobj = attr_name_kobj;
 	if (check_property_type(integer, ATTR_NAME, ACPI_TYPE_STRING))
 		return -EINVAL;
-	strlcpy_attr(wmi_priv.integer_data[instance_id].attribute_name,
-		integer_obj[ATTR_NAME].string.pointer);
+	strscpy_attr(wmi_priv.integer_data[instance_id].attribute_name,
+		integer_obj[ATTR_NAME].string.pointer,
+		sizeof(wmi_priv.integer_data[instance_id].attribute_name));
 	if (check_property_type(integer, DISPL_NAME_LANG_CODE, ACPI_TYPE_STRING))
 		return -EINVAL;
-	strlcpy_attr(wmi_priv.integer_data[instance_id].display_name_language_code,
-		integer_obj[DISPL_NAME_LANG_CODE].string.pointer);
+	strscpy_attr(wmi_priv.integer_data[instance_id].display_name_language_code,
+		integer_obj[DISPL_NAME_LANG_CODE].string.pointer,
+		sizeof(wmi_priv.integer_data[instance_id].display_name_language_code));
 	if (check_property_type(integer, DISPLAY_NAME, ACPI_TYPE_STRING))
 		return -EINVAL;
-	strlcpy_attr(wmi_priv.integer_data[instance_id].display_name,
-		integer_obj[DISPLAY_NAME].string.pointer);
+	strscpy_attr(wmi_priv.integer_data[instance_id].display_name,
+		integer_obj[DISPLAY_NAME].string.pointer,
+		sizeof(wmi_priv.integer_data[instance_id].display_name));
 	if (check_property_type(integer, DEFAULT_VAL, ACPI_TYPE_INTEGER))
 		return -EINVAL;
 	wmi_priv.integer_data[instance_id].default_value =
 		(uintptr_t)integer_obj[DEFAULT_VAL].string.pointer;
 	if (check_property_type(integer, MODIFIER, ACPI_TYPE_STRING))
 		return -EINVAL;
-	strlcpy_attr(wmi_priv.integer_data[instance_id].dell_modifier,
-		integer_obj[MODIFIER].string.pointer);
+	strscpy_attr(wmi_priv.integer_data[instance_id].dell_modifier,
+		integer_obj[MODIFIER].string.pointer,
+		sizeof(wmi_priv.integer_data[instance_id].dell_modifier));
 	if (check_property_type(integer, MIN_VALUE, ACPI_TYPE_INTEGER))
 		return -EINVAL;
 	wmi_priv.integer_data[instance_id].min_value =
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
index be939b731..79b8f1e34 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
@@ -163,8 +163,9 @@ int populate_po_data(union acpi_object *po_obj, int instance_id, struct kobject
 	wmi_priv.po_data[instance_id].attr_name_kobj = attr_name_kobj;
 	if (check_property_type(po, ATTR_NAME, ACPI_TYPE_STRING))
 		return -EINVAL;
-	strlcpy_attr(wmi_priv.po_data[instance_id].attribute_name,
-		     po_obj[ATTR_NAME].string.pointer);
+	strscpy_attr(wmi_priv.po_data[instance_id].attribute_name,
+		     po_obj[ATTR_NAME].string.pointer,
+		     sizeof(wmi_priv.po_data[instance_id].attribute_name));
 	if (check_property_type(po, MIN_PASS_LEN, ACPI_TYPE_INTEGER))
 		return -EINVAL;
 	wmi_priv.po_data[instance_id].min_password_length =
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
index 41e19f039..2634f6cce 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
@@ -128,24 +128,29 @@ int populate_str_data(union acpi_object *str_obj, int instance_id, struct kobjec
 	wmi_priv.str_data[instance_id].attr_name_kobj = attr_name_kobj;
 	if (check_property_type(str, ATTR_NAME, ACPI_TYPE_STRING))
 		return -EINVAL;
-	strlcpy_attr(wmi_priv.str_data[instance_id].attribute_name,
-		     str_obj[ATTR_NAME].string.pointer);
+	strscpy_attr(wmi_priv.str_data[instance_id].attribute_name,
+		     str_obj[ATTR_NAME].string.pointer,
+		     sizeof(wmi_priv.str_data[instance_id].attribute_name));
 	if (check_property_type(str, DISPL_NAME_LANG_CODE, ACPI_TYPE_STRING))
 		return -EINVAL;
-	strlcpy_attr(wmi_priv.str_data[instance_id].display_name_language_code,
-		     str_obj[DISPL_NAME_LANG_CODE].string.pointer);
+	strscpy_attr(wmi_priv.str_data[instance_id].display_name_language_code,
+		     str_obj[DISPL_NAME_LANG_CODE].string.pointer,
+		     sizeof(wmi_priv.str_data[instance_id].display_name_language_code));
 	if (check_property_type(str, DISPLAY_NAME, ACPI_TYPE_STRING))
 		return -EINVAL;
-	strlcpy_attr(wmi_priv.str_data[instance_id].display_name,
-		     str_obj[DISPLAY_NAME].string.pointer);
+	strscpy_attr(wmi_priv.str_data[instance_id].display_name,
+		     str_obj[DISPLAY_NAME].string.pointer,
+		     sizeof(wmi_priv.str_data[instance_id].display_name));
 	if (check_property_type(str, DEFAULT_VAL, ACPI_TYPE_STRING))
 		return -EINVAL;
-	strlcpy_attr(wmi_priv.str_data[instance_id].default_value,
-		     str_obj[DEFAULT_VAL].string.pointer);
+	strscpy_attr(wmi_priv.str_data[instance_id].default_value,
+		     str_obj[DEFAULT_VAL].string.pointer,
+		     sizeof(wmi_priv.str_data[instance_id].default_value));
 	if (check_property_type(str, MODIFIER, ACPI_TYPE_STRING))
 		return -EINVAL;
-	strlcpy_attr(wmi_priv.str_data[instance_id].dell_modifier,
-		     str_obj[MODIFIER].string.pointer);
+	strscpy_attr(wmi_priv.str_data[instance_id].dell_modifier,
+		     str_obj[MODIFIER].string.pointer,
+		     sizeof(wmi_priv.str_data[instance_id].dell_modifier));
 	if (check_property_type(str, MIN_LEN, ACPI_TYPE_INTEGER))
 		return -EINVAL;
 	wmi_priv.str_data[instance_id].min_length = (uintptr_t)str_obj[MIN_LEN].string.pointer;
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index ae89670f7..0a5410bd9 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -229,23 +229,21 @@ static const struct kobj_type attr_name_ktype = {
 	.sysfs_ops	= &kobj_sysfs_ops,
 };
 
+
 /**
- * strlcpy_attr - Copy a length-limited, NULL-terminated string with bound checks
+ * strscpy_attr - Copy a length limited, NULL-terminated string with bound checks
  * @dest: Where to copy the string to
  * @src: Where to copy the string from
+ * @size: Size of the destination buffer
  */
-void strlcpy_attr(char *dest, char *src)
+int strscpy_attr(char *dest, char *src, size_t size)
 {
-	size_t len = strlen(src) + 1;
-
-	if (len > 1 && len <= MAX_BUFF)
-		strscpy(dest, src, len);
+	ssize_t rc = strscpy(dest, src, size);
 
-	/*len can be zero because any property not-applicable to attribute can
-	 * be empty so check only for too long buffers and log error
-	 */
-	if (len > MAX_BUFF)
+	if (rc == -E2BIG)
 		pr_err("Source string returned from BIOS is out of bound!\n");
+
+	return rc;
 }
 
 /**
-- 
2.56.0

