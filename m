Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E12C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 Oct 2022 20:35:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbiJRUfl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 Oct 2022 16:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbiJRUfi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Oct 2022 16:35:38 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90D156EF39
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 13:35:36 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id x188so16965105oig.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 13:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/kHIbP8Pj39JAAO9mLvYMjlYVVVvfKIUa5qufcwuCY=;
        b=hCUzfaL71XFPPA3w4YKl4Q7xA6asArfLW2L8ukQwt6OSojn+JsTOGM37ZKPPGfh6XN
         y5SEdCrhAIQj+NRj0FKdskL3BjjYPU9tIccribjPKrIDEgdaJcPg83+jBk+mi9fbz1cI
         azWhOHjLlx2Fly5NRvrpkm9iV5Td1Vd9jEik9WhOSry1TemFNa1HY5Q4OZaUZdhX7JM3
         eXtSNNnhcgYZwG1dmGzzLeBt+b0O4aH8lYE+cS9ZosW6dQ8mqKmD4S84R0sHIfOzWENE
         urP6Qk0PqJWnCf4kyMomKU7m6XtbNu7Z0oqBrDnD3xCjglE5yDnD0VJiYLENx/2vVgvt
         R+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/kHIbP8Pj39JAAO9mLvYMjlYVVVvfKIUa5qufcwuCY=;
        b=bmN9v3Gd9PyAvrK9rBAev6sMsfpDRjEqWDZiFV85RgHq9kBXgSf53DLoCYTfDM4tGA
         mEpEGNMSR4cE7JrpdpICDWY0VNFTRBqpOQ6eYLysh8r2hEw7rZoOSnnNpoX/arEAEqZV
         1oV5nPtCeeuLyKiw1SRTnRnoWj9/LoFDc7W5fnB31c+7ykdkNBRRZMGppS5xcxjl4+Gp
         zNXJXrnmtMNkhAUgOCN7D8PghWKG0OkNPKiJTj01+nxeXBxDIOnlYsBEMyjHr/yIYm+A
         mYnNZuY5b8sXgvlau2xcurZ3jj16phAa446JWwVsyR2oT2OkcnGQP7BeDc5DYF/hCN+A
         7lXw==
X-Gm-Message-State: ACrzQf2NfyERgZwXqtgebOWFs8Z0rcDCz/eRX6QMjUO09xr3plEc385d
        KU7wstS1IMay/9/spUljuzNzQhOoBhQ=
X-Google-Smtp-Source: AMsMyM6yxK23DxZfhJoLr2EQ8uK4P7K1rQBX5Dit1ZtNH0El7Gi881yFcRz5qy7WWCBT7Mfi62bBKA==
X-Received: by 2002:a05:6808:2190:b0:355:4d53:eb07 with SMTP id be16-20020a056808219000b003554d53eb07mr2815148oib.127.1666125335422;
        Tue, 18 Oct 2022 13:35:35 -0700 (PDT)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:6d8c:32db:7793:d4c0])
        by smtp.gmail.com with ESMTPSA id s4-20020a056870248400b00136cfb02a94sm6580722oaq.7.2022.10.18.13.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 13:35:35 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 3/6] Set current_value permissions appropriate to read-only attributes
Date:   Tue, 18 Oct 2022 15:35:28 -0500
Message-Id: <20221018203531.17130-4-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221018203531.17130-1-jorge.lopez2@hp.com>
References: <20221018203531.17130-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch updates ‘current_value’ permissions to match the value
reported by ‘is_readonly’ value associated with the attribute.
‘current_value’ permissions are set to read-only if ‘is_readonly’
value is 1.  ‘current_value’ permissions are set to read-write if
‘is_readonly’ value is zero.   Other read-only and write-only
permissions will remain unchanged.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
---
 drivers/platform/x86/hp/bioscfg.c            | 17 +++++++++++++++++
 drivers/platform/x86/hp/bioscfg.h            |  1 +
 drivers/platform/x86/hp/enum-attributes.c    |  4 ++++
 drivers/platform/x86/hp/int-attributes.c     |  4 ++++
 drivers/platform/x86/hp/ordered-attributes.c |  6 +++++-
 drivers/platform/x86/hp/string-attributes.c  |  4 ++++
 6 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/bioscfg.c b/drivers/platform/x86/hp/bioscfg.c
index f08bcae5752a..72dd963f29ae 100644
--- a/drivers/platform/x86/hp/bioscfg.c
+++ b/drivers/platform/x86/hp/bioscfg.c
@@ -542,6 +542,23 @@ inline int encode_outsize_for_pvsz(int outsize)
 	return 1;
 }
 
+/**
+ * update_attribute_permissions() - Update attributes permissions when
+ * isReadOnly value is 1
+ *
+ * @isReadOnly:  ReadOnly value
+ * @current_val: kobj_attribute corresponding to attribute.
+ *
+ **/
+void update_attribute_permissions(u32 isReadOnly, struct kobj_attribute *current_val)
+{
+	if (isReadOnly)
+		current_val->attr.mode = (umode_t)0444;
+	else
+		current_val->attr.mode = (umode_t)0600;
+}
+
+
 /**
  * destroy_attribute_objs() - Free a kset of kobjects
  * @kset: The kset to destroy
diff --git a/drivers/platform/x86/hp/bioscfg.h b/drivers/platform/x86/hp/bioscfg.h
index ac02c8c1e5f2..ff030399b3a2 100644
--- a/drivers/platform/x86/hp/bioscfg.h
+++ b/drivers/platform/x86/hp/bioscfg.h
@@ -520,6 +520,7 @@ __BIN_ATTR(_name, 0444 | 0200, _group##_##_name##_read, _group##_##_name##_write
 union acpi_object *get_wmiobj_pointer(int instance_id, const char *guid_string);
 int get_instance_count(const char *guid_string);
 void strlcpy_attr(char *dest, char *src);
+void update_attribute_permissions(u32 isReadOnly, struct kobj_attribute *current_val);
 
 /* String attributes */
 int populate_string_buffer_data(union acpi_object *str_obj,
diff --git a/drivers/platform/x86/hp/enum-attributes.c b/drivers/platform/x86/hp/enum-attributes.c
index 9d4b6e97bd16..f4fe6a583ca4 100644
--- a/drivers/platform/x86/hp/enum-attributes.c
+++ b/drivers/platform/x86/hp/enum-attributes.c
@@ -190,6 +190,8 @@ int populate_enumeration_package_data(union acpi_object *enum_obj, int instance_
 	str_value = NULL;
 
 	populate_enumeration_elements_from_package(enum_obj, instance_id, HPWMI_ENUMERATION_TYPE);
+	update_attribute_permissions(bioscfg_drv.enumeration_data[instance_id].is_readonly,
+				    &enumeration_current_val);
 
 	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
 }
@@ -362,6 +364,8 @@ int populate_enumeration_buffer_data(union acpi_object *enum_obj, int instance_i
 
 	/* Populate enumeration elements */
 	populate_enumeration_elements_from_buffer(enum_obj, instance_id, HPWMI_ENUMERATION_TYPE);
+	update_attribute_permissions(bioscfg_drv.enumeration_data[instance_id].is_readonly,
+				    &enumeration_current_val);
 
 	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
 }
diff --git a/drivers/platform/x86/hp/int-attributes.c b/drivers/platform/x86/hp/int-attributes.c
index aa61497b44d5..eaae4b065098 100644
--- a/drivers/platform/x86/hp/int-attributes.c
+++ b/drivers/platform/x86/hp/int-attributes.c
@@ -168,6 +168,8 @@ int populate_integer_package_data(union acpi_object *elements, int instance_id,
 	str_value = NULL;
 
 	populate_integer_elements_from_package(elements, instance_id, HPWMI_INTEGER_TYPE);
+	update_attribute_permissions(bioscfg_drv.integer_data[instance_id].is_readonly,
+				    &integer_current_val);
 	return sysfs_create_group(attr_name_kobj, &integer_attr_group);
 }
 
@@ -329,6 +331,8 @@ int populate_integer_buffer_data(union acpi_object *integer_obj, int instance_id
 
 	/* Populate integer elements */
 	populate_integer_elements_from_buffer(integer_obj, instance_id, HPWMI_INTEGER_TYPE);
+	update_attribute_permissions(bioscfg_drv.integer_data[instance_id].is_readonly,
+				    &integer_current_val);
 
 	return sysfs_create_group(attr_name_kobj, &integer_attr_group);
 }
diff --git a/drivers/platform/x86/hp/ordered-attributes.c b/drivers/platform/x86/hp/ordered-attributes.c
index 585abc3bd362..723db9a0316d 100644
--- a/drivers/platform/x86/hp/ordered-attributes.c
+++ b/drivers/platform/x86/hp/ordered-attributes.c
@@ -239,6 +239,9 @@ int populate_ordered_list_package_data(union acpi_object *order_obj, int instanc
 	str_value = NULL;
 
 	populate_ordered_list_elements_from_package(order_obj, instance_id, HPWMI_ORDERED_LIST_TYPE);
+	update_attribute_permissions(bioscfg_drv.ordered_list_data[instance_id].is_readonly,
+				    &ordered_list_current_val);
+
 	return sysfs_create_group(attr_name_kobj, &ordered_list_attr_group);
 }
 
@@ -426,7 +429,8 @@ int populate_ordered_list_buffer_data(union acpi_object *order_obj, int instance
 
 	/* Populate ordered list elements */
 	populate_ordered_list_elements_from_buffer(order_obj, instance_id, HPWMI_ORDERED_LIST_TYPE);
-
+	update_attribute_permissions(bioscfg_drv.ordered_list_data[instance_id].is_readonly,
+				    &ordered_list_current_val);
 	return sysfs_create_group(attr_name_kobj, &ordered_list_attr_group);
 }
 
diff --git a/drivers/platform/x86/hp/string-attributes.c b/drivers/platform/x86/hp/string-attributes.c
index c85688cfbccc..a8e4f8b60dff 100644
--- a/drivers/platform/x86/hp/string-attributes.c
+++ b/drivers/platform/x86/hp/string-attributes.c
@@ -164,6 +164,8 @@ int populate_string_package_data(union acpi_object *elements, int instance_id,
 	str_value = NULL;
 
 	populate_string_elements_from_package(elements, instance_id, HPWMI_STRING_TYPE);
+	update_attribute_permissions(bioscfg_drv.string_data[instance_id].is_readonly,
+				    &string_current_val);
 
 	return sysfs_create_group(attr_name_kobj, &string_attr_group);
 }
@@ -321,6 +323,8 @@ int populate_string_buffer_data(union acpi_object *string_obj, int instance_id,
 	/* Populate string elements */
 
 	populate_string_elements_from_buffer(string_obj, instance_id, HPWMI_STRING_TYPE);
+	update_attribute_permissions(bioscfg_drv.string_data[instance_id].is_readonly,
+				    &string_current_val);
 
 	return sysfs_create_group(attr_name_kobj, &string_attr_group);
 }
-- 
2.34.1

