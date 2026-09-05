Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29D52E5429
	for <platform-driver-x86@vger.kernel.org>; Sat,  5 Sep 2026 21:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788644899; cv=none; b=ZY8LSsau9jzM6W8WePw6VphHDjsZ9TF08iPJbgOSUi5ZejlKIfGuGcKD5RsBzriQacNniYMd5KY7+zkY4RTGdhakqVu9y+GP+oZcRZVecWePlHsl2NEc5G1BkLfdRZa/bwh9QzYzIr5vG/q51LmvQDzzcPID3SA5rvMAnoY6xB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788644899; c=relaxed/simple;
	bh=8GsMM0DpL7AWXW2SKKhntCHDlxXo/w1VJ2AvNXfC8Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V15LX0nQfhC40gdDUBFnVOzvd4V1KMlJBC2WaGjpG2/7ZtTjW+UmMoFUQZOINHtKPla6+9NJCRHVBTSeJ65+xoao3PhCaRiPd48tCTU90bJTM5qS5cHzXVn5lxxyU2Gt/9RXWSCGCkVOxmaCWZ037fS5BN9hc/CwMBesL+9hiyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLG7FVlo; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLG7FVlo"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48586861639so1566217f8f.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Sep 2026 14:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788644896; x=1789249696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lg+QuN7VRsgQzcs6dMFfAXHItf+Rhj5cjNF6dBC2FiU=;
        b=hLG7FVloepU+dIxZEMkVya/m8PcAtvtvI1dsv9f0dGsYegkUJEbyMeZ6O88minqdQ4
         XoOIsactmocKXgFHN6AjJD6D7HCXmE1LwlPCTZLcENjIKb/VCGQq531CyJWFVSSbB2du
         d4odDqBaCSI+m+5JP8bFP6BD2tuwDOfH/9wodVGgkPa/QsNvAh3wrI0rw/++AEgbJW1i
         ysZFMZP4/qfLoSprXeSI7oB4x+DR2V3WrbhVKFl5rQRBYwlmCCPNaltpangbsbKOcYuM
         xDdNC/cI9Ug5wR0q2ND7J+wHzg/3Ft13oS+EHHuG/8sAHuwUtvvp6UKqOHyaO3OiFI6C
         1KuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788644896; x=1789249696;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lg+QuN7VRsgQzcs6dMFfAXHItf+Rhj5cjNF6dBC2FiU=;
        b=guJ8pXgucTrTcwvMrROb80jlUbxzHorKmVQdZZ+EjZacKMYTgpO8FJM9hpPsMbOXBS
         pC6CBKT2Ci5yi7RuWaNpqWLNjl6FlIUBY0Re0O0DNVloHprIk8kbWh//ZWNRCWRzL8Rd
         mdIVtUpy4pOdyoESUQlOPcxEMvKMEIHK3gEFX/3x5qsboKtGe/rmf9sFmzNV0+cR377w
         hl4g0KtoDsaxrmzVzJgbnPk8RhV5bsPblN9NEkrz3EKWe0zNSqEC7uqsBMHw8Dkr1pJ2
         /9vMRyDg1fpWZ2zDVoo2r0JQA/+o8osKX0zI4NYyCOT33VHS+ro1zQEucAIVhMnN5AlV
         AmWg==
X-Forwarded-Encrypted: i=1; AKwUvBxKB0OCWITm+aS8ylO65iUzO2z5L7CyLh0ezT35cgG8khxQTvGsT7nJ9kgp6CEgzULpVfNsPplR8tQgTpUMo8/499AZ@vger.kernel.org
X-Gm-Message-State: AFuF++k1qzXNFTsuw1sgCrdSAYW3YMqrGBlPPSDK+onuo8yka/wGQzdY
	G0uLuvTxLxxm57MSzEsamB/osgaa4AtfSd8G0qFfHsnNFm+Zl7OSMDQvSKi7P8vn
X-Gm-Gg: AYBFou1zUcrcslFosS7WNdHeDnNZr3TpAltYL/CAgf66pp9nb0ESt+DoaJYNGxaoDUO
	WUXZ+0zM/BbuxtnpQZHf5KMVT7qEa51gfsJltUHIAzMNpaqSNimrkEwzs8guCSKwRLu+d+XhjHr
	ffhhitdCDr7dEddpW1MrjKE7aBKz0BVSIbLmCm3/bP74HSEneYGSGkAjHfj9+EAAqEGryklAwvU
	LVqQ3xYbleE6lD8zr8PxyfJM1PPhf+/LQdor6COfMse+o3c+b6ySHh3Oe9bV9dZ3tVQO8HBtRgP
	gPe5Gn6W96iBv9KCZ7qINKElTFpVQXGEDgZJJWR0MlkAt9crNW4ptJ+t7gO6nGROeq3tDJn/Fou
	njrsK23Y7RAaULFSfZS/NjCKsHUyo3hwJuX1PSuLeTzjbCZ8ZUi8PQMSGF8Ywkl9lRxPij1XMJb
	BNVk6qFWSVjdggbJKZriOPbBatBRXmUMhbJpKw8i6L1ITuBozbIL1jN9gBRw8L7EcnJFwrAW91i
	H1BVZRGpU/qUD3bFM28++H5UWEU++eXOr0TjKGQqA==
X-Received: by 2002:a05:6000:490d:b0:482:fbb6:1b29 with SMTP id ffacd0b85a97d-485891e729fmr13298374f8f.10.1788644895483;
        Sat, 05 Sep 2026 14:48:15 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm16918073f8f.1.2026.09.05.14.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:48:14 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] platform/x86: hp-bioscfg: consolidate common package-element parsing
Date: Sun,  6 Sep 2026 02:48:01 +0500
Message-ID: <20260905214801.76265-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hp_populate_string_elements_from_package(),
hp_populate_integer_elements_from_package(),
hp_populate_enumeration_elements_from_package(),
hp_populate_ordered_list_elements_from_package(), and
hp_populate_password_elements_from_package() each parse the same
PATH..SECURITY_LEVEL range into their own struct common_data
sub-object, copy-pasted five times. Factor it into
hp_get_common_data_from_package(), called from all five, mirroring
hp_get_common_data_from_buffer()'s existing split for the buffer
side.

The five PREREQUISITES loops weren't identical: on a bad
prerequisite string, string/integer/ordered_list continue,
enumeration returns -EINVAL, password breaks. The shared helper
continues, matching the majority and
hp_get_common_data_from_buffer()'s own handling of the equivalent
failure. This changes enumeration (no longer aborts the package)
and password (no longer leaves later prerequisites unfilled).

The expected_*_types[eloc] != obj[elem].type check above this
switch has the same split -- enumeration warns and continues, the
rest pr_err() and return -EIO -- left alone here; consolidating it
needs each type's expected_*_types[] table passed into a shared
checker, not just struct common_data.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 97 +++++++++++++++++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  |  3 +
 .../x86/hp/hp-bioscfg/enum-attributes.c       | 57 +----------
 .../x86/hp/hp-bioscfg/int-attributes.c        | 57 +----------
 .../x86/hp/hp-bioscfg/order-list-attributes.c | 58 +----------
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  | 57 +----------
 .../x86/hp/hp-bioscfg/string-attributes.c     | 58 +----------
 7 files changed, 125 insertions(+), 262 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 309634c1cc20..22c198680903 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -484,6 +484,103 @@ int hp_convert_hexstr_to_str(const char *input, u32 input_len, char **str, int *
 	return ret;
 }
 
+/**
+ * hp_get_common_data_from_package() - Parse the package elements shared
+ * by every attribute type (PATH..SECURITY_LEVEL)
+ * @obj: ACPI object package for this attribute instance
+ * @obj_count: Number of elements in @obj
+ * @elem: Current position in @obj; advanced in place when PREREQUISITES
+ *	  consumes additional array elements
+ * @eloc: Current common-element locator; advanced in place when
+ *	  PREREQUISITES_SIZE is zero, since PREREQUISITES is then omitted
+ *	  by BIOS
+ * @int_value: Integer value already decoded by the caller for *@eloc,
+ *	       when applicable
+ * @str_value: String value already decoded by the caller for *@eloc, when
+ *	       applicable; reused and reset to NULL while walking
+ *	       PREREQUISITES, same as the caller does with its own copy
+ * @common: Destination common_data struct for this attribute instance
+ *
+ * Called by each type's own hp_populate_*_elements_from_package()
+ * instead of duplicating this parsing per type, since every BIOS
+ * attribute package uses the same layout for these elements (see
+ * struct common_data).
+ *
+ * Return: 0 on success, or -EINVAL if @obj is too small for the
+ * declared PREREQUISITES_SIZE.
+ */
+int hp_get_common_data_from_package(union acpi_object *obj, int obj_count,
+				    int *elem, int *eloc, u32 int_value,
+				    char **str_value, struct common_data *common)
+{
+	int value_len;
+	int reqs;
+	int size;
+
+	switch (*eloc) {
+	case PATH:
+		strscpy(common->path, *str_value);
+		break;
+	case IS_READONLY:
+		common->is_readonly = int_value;
+		break;
+	case DISPLAY_IN_UI:
+		common->display_in_ui = int_value;
+		break;
+	case REQUIRES_PHYSICAL_PRESENCE:
+		common->requires_physical_presence = int_value;
+		break;
+	case SEQUENCE:
+		common->sequence = int_value;
+		break;
+	case PREREQUISITES_SIZE:
+		if (int_value > MAX_PREREQUISITES_SIZE) {
+			pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+			int_value = MAX_PREREQUISITES_SIZE;
+		}
+		common->prerequisites_size = int_value;
+
+		/*
+		 * This step is needed to keep the expected
+		 * element list pointing to the right obj[elem].type
+		 * when the size is zero. PREREQUISITES
+		 * object is omitted by BIOS when the size is
+		 * zero.
+		 */
+		if (common->prerequisites_size == 0)
+			(*eloc)++;
+		break;
+	case PREREQUISITES:
+		size = min_t(u32, common->prerequisites_size, MAX_PREREQUISITES_SIZE);
+
+		for (reqs = 0; reqs < size; reqs++) {
+			if (*elem + reqs >= obj_count) {
+				pr_err("Error elem-objects package is too small\n");
+				return -EINVAL;
+			}
+
+			if (hp_convert_hexstr_to_str(obj[*elem + reqs].string.pointer,
+						     obj[*elem + reqs].string.length,
+						     str_value, &value_len))
+				continue;
+
+			strscpy(common->prerequisites[reqs], *str_value);
+			kfree(*str_value);
+			*str_value = NULL;
+		}
+		if (size)
+			*elem += size - 1;
+		break;
+	case SECURITY_LEVEL:
+		common->security_level = int_value;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 /* map output size to the corresponding WMI method id */
 int hp_encode_outsize_for_pvsz(int outsize)
 {
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
index ac57d6eab4c3..94619c034187 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
@@ -493,5 +493,8 @@ void hp_friendly_user_name_update(char *path, const char *attr_name,
 				  char *attr_display, int attr_size);
 int hp_wmi_error_and_message(int error_code);
 int hp_get_common_data_from_buffer(u8 **buffer_ptr, u32 *buffer_size, struct common_data *common);
+int hp_get_common_data_from_package(union acpi_object *obj, int obj_count,
+				    int *elem, int *eloc, u32 int_value,
+				    char **str_value, struct common_data *common);
 
 #endif
diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
index 446dd18d2cee..8f1ecbf127bc 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
@@ -132,7 +132,6 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 	u32 size = 0;
 	u32 int_value = 0;
 	int elem = 0;
-	int reqs;
 	int pos_values;
 	int ret;
 	int eloc;
@@ -176,64 +175,18 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 		case VALUE:
 			break;
 		case PATH:
-			strscpy(enum_data->common.path, str_value);
-			break;
 		case IS_READONLY:
-			enum_data->common.is_readonly = int_value;
-			break;
 		case DISPLAY_IN_UI:
-			enum_data->common.display_in_ui = int_value;
-			break;
 		case REQUIRES_PHYSICAL_PRESENCE:
-			enum_data->common.requires_physical_presence = int_value;
-			break;
 		case SEQUENCE:
-			enum_data->common.sequence = int_value;
-			break;
 		case PREREQUISITES_SIZE:
-			if (int_value > MAX_PREREQUISITES_SIZE) {
-				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
-				int_value = MAX_PREREQUISITES_SIZE;
-			}
-			enum_data->common.prerequisites_size = int_value;
-
-			/*
-			 * This step is needed to keep the expected
-			 * element list pointing to the right obj[elem].type
-			 * when the size is zero. PREREQUISITES
-			 * object is omitted by BIOS when the size is
-			 * zero.
-			 */
-			if (int_value == 0)
-				eloc++;
-			break;
-
 		case PREREQUISITES:
-			size = min_t(u32, enum_data->common.prerequisites_size, MAX_PREREQUISITES_SIZE);
-			for (reqs = 0; reqs < size; reqs++) {
-				if (elem + reqs >= enum_obj_count) {
-					pr_err("Error enum-objects package is too small\n");
-					return -EINVAL;
-				}
-
-				ret = hp_convert_hexstr_to_str(enum_obj[elem + reqs].string.pointer,
-							       enum_obj[elem + reqs].string.length,
-							       &str_value, &value_len);
-
-				if (ret)
-					return -EINVAL;
-
-				strscpy(enum_data->common.prerequisites[reqs], str_value);
-
-				kfree(str_value);
-				str_value = NULL;
-			}
-			if (size)
-				elem += size - 1;
-			break;
-
 		case SECURITY_LEVEL:
-			enum_data->common.security_level = int_value;
+			ret = hp_get_common_data_from_package(enum_obj, enum_obj_count,
+							      &elem, &eloc, int_value, &str_value,
+							      &enum_data->common);
+			if (ret)
+				return ret;
 			break;
 
 		case ENUM_CURRENT_VALUE:
diff --git a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
index a27907066448..f2774eff613b 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
@@ -145,9 +145,7 @@ static int hp_populate_integer_elements_from_package(union acpi_object *integer_
 	int ret;
 	u32 int_value = 0;
 	int elem;
-	int reqs;
 	int eloc;
-	int size;
 	struct integer_data *integer_data = &bioscfg_drv.integer_data[instance_id];
 
 	if (!integer_obj)
@@ -192,63 +190,18 @@ static int hp_populate_integer_elements_from_package(union acpi_object *integer_
 			integer_data->current_value = int_value;
 			break;
 		case PATH:
-			strscpy(integer_data->common.path, str_value);
-			break;
 		case IS_READONLY:
-			integer_data->common.is_readonly = int_value;
-			break;
 		case DISPLAY_IN_UI:
-			integer_data->common.display_in_ui = int_value;
-			break;
 		case REQUIRES_PHYSICAL_PRESENCE:
-			integer_data->common.requires_physical_presence = int_value;
-			break;
 		case SEQUENCE:
-			integer_data->common.sequence = int_value;
-			break;
 		case PREREQUISITES_SIZE:
-			if (int_value > MAX_PREREQUISITES_SIZE) {
-				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
-				int_value = MAX_PREREQUISITES_SIZE;
-			}
-			integer_data->common.prerequisites_size = int_value;
-
-			/*
-			 * This step is needed to keep the expected
-			 * element list pointing to the right obj[elem].type
-			 * when the size is zero. PREREQUISITES
-			 * object is omitted by BIOS when the size is
-			 * zero.
-			 */
-			if (integer_data->common.prerequisites_size == 0)
-				eloc++;
-			break;
 		case PREREQUISITES:
-			size = min_t(u32, integer_data->common.prerequisites_size, MAX_PREREQUISITES_SIZE);
-
-			for (reqs = 0; reqs < size; reqs++) {
-				if (elem + reqs >= integer_obj_count) {
-					pr_err("Error elem-objects package is too small\n");
-					return -EINVAL;
-				}
-
-				ret = hp_convert_hexstr_to_str(integer_obj[elem + reqs].string.pointer,
-							       integer_obj[elem + reqs].string.length,
-							       &str_value, &value_len);
-
-				if (ret)
-					continue;
-
-				strscpy(integer_data->common.prerequisites[reqs], str_value);
-				kfree(str_value);
-				str_value = NULL;
-			}
-			if (size)
-				elem += size - 1;
-			break;
-
 		case SECURITY_LEVEL:
-			integer_data->common.security_level = int_value;
+			ret = hp_get_common_data_from_package(integer_obj, integer_obj_count,
+							      &elem, &eloc, int_value, &str_value,
+							      &integer_data->common);
+			if (ret)
+				return ret;
 			break;
 		case INT_LOWER_BOUND:
 			integer_data->lower_bound = int_value;
diff --git a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
index 5bf8d40bdf81..95fca0919f1f 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
@@ -130,11 +130,9 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
 	char *str_value = NULL;
 	int value_len = 0;
 	int ret;
-	u32 size;
 	u32 int_value = 0;
 	int elem;
 	int olist_elem;
-	int reqs;
 	int eloc;
 	char *tmpstr = NULL;
 	char *part_tmp = NULL;
@@ -180,64 +178,18 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
 			replace_char_str(ordered_list_data->current_value, COMMA_SEP, SEMICOLON_SEP);
 			break;
 		case PATH:
-			strscpy(ordered_list_data->common.path, str_value);
-			break;
 		case IS_READONLY:
-			ordered_list_data->common.is_readonly = int_value;
-			break;
 		case DISPLAY_IN_UI:
-			ordered_list_data->common.display_in_ui = int_value;
-			break;
 		case REQUIRES_PHYSICAL_PRESENCE:
-			ordered_list_data->common.requires_physical_presence = int_value;
-			break;
 		case SEQUENCE:
-			ordered_list_data->common.sequence = int_value;
-			break;
 		case PREREQUISITES_SIZE:
-			if (int_value > MAX_PREREQUISITES_SIZE) {
-				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
-				int_value = MAX_PREREQUISITES_SIZE;
-			}
-			ordered_list_data->common.prerequisites_size = int_value;
-
-			/*
-			 * This step is needed to keep the expected
-			 * element list pointing to the right obj[elem].type
-			 * when the size is zero. PREREQUISITES
-			 * object is omitted by BIOS when the size is
-			 * zero.
-			 */
-			if (int_value == 0)
-				eloc++;
-			break;
 		case PREREQUISITES:
-			size = min_t(u32, ordered_list_data->common.prerequisites_size,
-				     MAX_PREREQUISITES_SIZE);
-			for (reqs = 0; reqs < size; reqs++) {
-				if (elem + reqs >= order_obj_count) {
-					pr_err("Error elem-objects package is too small\n");
-					return -EINVAL;
-				}
-
-				ret = hp_convert_hexstr_to_str(order_obj[elem + reqs].string.pointer,
-							       order_obj[elem + reqs].string.length,
-							       &str_value, &value_len);
-
-				if (ret)
-					continue;
-
-				strscpy(ordered_list_data->common.prerequisites[reqs], str_value);
-
-				kfree(str_value);
-				str_value = NULL;
-			}
-			if (size)
-				elem += size - 1;
-			break;
-
 		case SECURITY_LEVEL:
-			ordered_list_data->common.security_level = int_value;
+			ret = hp_get_common_data_from_package(order_obj, order_obj_count,
+							      &elem, &eloc, int_value, &str_value,
+							      &ordered_list_data->common);
+			if (ret)
+				return ret;
 			break;
 
 		case ORD_LIST_SIZE:
diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index a9e178637416..95fa0aeba920 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -224,7 +224,6 @@ static int hp_populate_password_elements_from_package(union acpi_object *passwor
 	u32 size;
 	u32 int_value = 0;
 	int elem;
-	int reqs;
 	int eloc;
 	int pos_values;
 	struct password_data *password_data = &bioscfg_drv.password_data[instance_id];
@@ -268,64 +267,18 @@ static int hp_populate_password_elements_from_package(union acpi_object *passwor
 		case VALUE:
 			break;
 		case PATH:
-			strscpy(password_data->common.path, str_value);
-			break;
 		case IS_READONLY:
-			password_data->common.is_readonly = int_value;
-			break;
 		case DISPLAY_IN_UI:
-			password_data->common.display_in_ui = int_value;
-			break;
 		case REQUIRES_PHYSICAL_PRESENCE:
-			password_data->common.requires_physical_presence = int_value;
-			break;
 		case SEQUENCE:
-			password_data->common.sequence = int_value;
-			break;
 		case PREREQUISITES_SIZE:
-			if (int_value > MAX_PREREQUISITES_SIZE) {
-				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
-				int_value = MAX_PREREQUISITES_SIZE;
-			}
-			password_data->common.prerequisites_size = int_value;
-
-			/* This step is needed to keep the expected
-			 * element list pointing to the right obj[elem].type
-			 * when the size is zero. PREREQUISITES
-			 * object is omitted by BIOS when the size is
-			 * zero.
-			 */
-			if (int_value == 0)
-				eloc++;
-			break;
 		case PREREQUISITES:
-			size = min_t(u32, password_data->common.prerequisites_size,
-				     MAX_PREREQUISITES_SIZE);
-
-			for (reqs = 0; reqs < size; reqs++) {
-				if (elem + reqs >= password_obj_count) {
-					pr_err("Error elem-objects package is too small\n");
-					return -EINVAL;
-				}
-
-				ret = hp_convert_hexstr_to_str(password_obj[elem + reqs].string.pointer,
-							       password_obj[elem + reqs].string.length,
-							       &str_value, &value_len);
-
-				if (ret)
-					break;
-
-				strscpy(password_data->common.prerequisites[reqs], str_value);
-
-				kfree(str_value);
-				str_value = NULL;
-
-			}
-			if (size)
-				elem += size - 1;
-			break;
 		case SECURITY_LEVEL:
-			password_data->common.security_level = int_value;
+			ret = hp_get_common_data_from_package(password_obj, password_obj_count,
+							      &elem, &eloc, int_value, &str_value,
+							      &password_data->common);
+			if (ret)
+				return ret;
 			break;
 		case PSWD_MIN_LENGTH:
 			password_data->min_password_length = int_value;
diff --git a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
index f3dfba270f7e..e9bfbef8a3a4 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
@@ -135,9 +135,7 @@ static int hp_populate_string_elements_from_package(union acpi_object *string_ob
 	int ret = 0;
 	u32 int_value = 0;
 	int elem;
-	int reqs;
 	int eloc;
-	int size;
 	struct string_data *string_data = &bioscfg_drv.string_data[instance_id];
 
 	if (!string_obj)
@@ -181,64 +179,18 @@ static int hp_populate_string_elements_from_package(union acpi_object *string_ob
 			strscpy(string_data->current_value, str_value);
 			break;
 		case PATH:
-			strscpy(string_data->common.path, str_value);
-			break;
 		case IS_READONLY:
-			string_data->common.is_readonly = int_value;
-			break;
 		case DISPLAY_IN_UI:
-			string_data->common.display_in_ui = int_value;
-			break;
 		case REQUIRES_PHYSICAL_PRESENCE:
-			string_data->common.requires_physical_presence = int_value;
-			break;
 		case SEQUENCE:
-			string_data->common.sequence = int_value;
-			break;
 		case PREREQUISITES_SIZE:
-			if (int_value > MAX_PREREQUISITES_SIZE) {
-				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
-				int_value = MAX_PREREQUISITES_SIZE;
-			}
-			string_data->common.prerequisites_size = int_value;
-
-			/*
-			 * This step is needed to keep the expected
-			 * element list pointing to the right obj[elem].type
-			 * when the size is zero. PREREQUISITES
-			 * object is omitted by BIOS when the size is
-			 * zero.
-			 */
-			if (string_data->common.prerequisites_size == 0)
-				eloc++;
-			break;
 		case PREREQUISITES:
-			size = min_t(u32, string_data->common.prerequisites_size,
-				     MAX_PREREQUISITES_SIZE);
-
-			for (reqs = 0; reqs < size; reqs++) {
-				if (elem + reqs >= string_obj_count) {
-					pr_err("Error elem-objects package is too small\n");
-					return -EINVAL;
-				}
-
-				ret = hp_convert_hexstr_to_str(string_obj[elem + reqs].string.pointer,
-							       string_obj[elem + reqs].string.length,
-							       &str_value, &value_len);
-
-				if (ret)
-					continue;
-
-				strscpy(string_data->common.prerequisites[reqs], str_value);
-				kfree(str_value);
-				str_value = NULL;
-			}
-			if (size)
-				elem += size - 1;
-			break;
-
 		case SECURITY_LEVEL:
-			string_data->common.security_level = int_value;
+			ret = hp_get_common_data_from_package(string_obj, string_obj_count,
+							      &elem, &eloc, int_value, &str_value,
+							      &string_data->common);
+			if (ret)
+				return ret;
 			break;
 		case STR_MIN_LENGTH:
 			string_data->min_length = int_value;
-- 
2.55.0

