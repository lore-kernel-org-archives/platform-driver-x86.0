Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62587C47090
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Dec 2022 17:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233151AbiLBRgg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 2 Dec 2022 12:36:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234132AbiLBRge (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Dec 2022 12:36:34 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00EF1E8E03
        for <platform-driver-x86@vger.kernel.org>; Fri,  2 Dec 2022 09:36:25 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id v19-20020a9d5a13000000b0066e82a3872dso1314405oth.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Dec 2022 09:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=On8Y7tXoD1wJ86UVO6bflBUKhsb1Cih1YdP/Z3PfHwo=;
        b=eX3q7qZqgu/9GaNRWehNdRtYsaYDO42rwsK7QWH6zcw9WE5pbvkd3o2vLAj1GyoQ0l
         xgTH+QSuTkBj77om2SfewVLMdPCzF4urKpJUdm/imhiYUQQSZa9rtwnMktO+UWrv+JCI
         97RfvrwfBYzzG+Y9Q0hC1V/sRCsMwn4hLrry++jKjw1peuyrQLsgpWA6zgCncwHdXukJ
         gJifS2NUOitOO5S0qxiHAJMb7E0oSYRknVC4WVVI8YCMqM7Amp3MNpo0Ao1fS4h0CBGz
         mSRqXMDmFiYXTRIM842Ch9HnITjn7cxaTizjg833Dn2GO9PyNYDuvZvHbHajrt9kZxav
         7esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=On8Y7tXoD1wJ86UVO6bflBUKhsb1Cih1YdP/Z3PfHwo=;
        b=T9+baX2eGNcJMuhZfeT0w2WjtOh6AyJpKdFmSJ7YVijd5Q7oe7nRiNTvqayfEVv5aH
         Bj7HZ14fSCm7kopway1jlNKmtcTjWn/DIINXQVGkLDeURe+9qKzPpSB7QWJfCwm8X15I
         c8EjgWGgBCCFrHQS2QmTmK7BLBvsVrnUHj+0lV8/TBn1ecWD7hvzk1T71Fr/gc8zlGMs
         DzX2MamWRT1tbLPuTaUomo5+bEn1TBT+A3pBecjCc0RfsdsLZgkQ5zn/Il8NVLWGxxGi
         WDjXsmZjfejqIUXb/54eJn/hE7ZC+t06202r0lR92SCZbmCrnuI89r5D3fTxZzeRjvy8
         mTlQ==
X-Gm-Message-State: ANoB5ploF4AbrVcJoGjhDi9evWbf022nyR453AQ/AHmHcpDVOcKAjKMj
        pghlIe3UOXdX1fxeVUWv5gPdQrq3AFGI7w==
X-Google-Smtp-Source: AA0mqf7i/Id/2W8hlxBP+23PlyPVG2T01leBCqHvw1cNztlvEE5P+S6p3Ri+nZrfyl2jyqx0CP7WQA==
X-Received: by 2002:a9d:4f03:0:b0:66e:6f16:8bb1 with SMTP id d3-20020a9d4f03000000b0066e6f168bb1mr6177633otl.203.1670002583821;
        Fri, 02 Dec 2022 09:36:23 -0800 (PST)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:bec7:8390:5104:e759])
        by smtp.gmail.com with ESMTPSA id n7-20020a056870558700b0013cd709659dsm4371692oao.52.2022.12.02.09.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:36:23 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 5/5] Introduction of HP-BIOSCFG driver (5)
Date:   Fri,  2 Dec 2022 11:36:16 -0600
Message-Id: <20221202173616.180108-6-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202173616.180108-1-jorge.lopez2@hp.com>
References: <20221202173616.180108-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose for this patch is submit HP BIOSCFG driver to be list of
HP Linux kernel drivers.  The driver include a total of 12 files
broken in several patches.  This is set 1 of 4.

HP BIOS Configuration driver purpose is to provide a driver supporting
the latest sysfs class firmware attributes framework allowing the user
to change BIOS settings and security solutions on HP Inc.’s commercial
notebooks.

Many features of HP Commercial PC’s can be managed using Windows
Management Instrumentation (WMI). WMI is an implementation of Web-Based
Enterprise Management (WBEM) that provides a standards-based interface
for changing and monitoring system settings.  HP BISOCFG driver provides
a native Linux solution and the exposed features facilitates the
migration to Linux environments.

The Linux security features to be provided in hp-bioscfg driver enables
managing the BIOS settings and security solutions via sysfs, a virtual
filesystem that can be used by user-mode applications.   The new
documentation cover features such Secure Platform Management, Sure
Admin, and Sure Start.  Each section provides security feature
description and identifies sysfs directories and files exposed by
the driver.

Many HP Commercial PC’s include a feature called Secure Platform
Management (SPM), which replaces older password-based BIOS settings
management with public key cryptography. PC secure product management
begins when a target system is provisioned with cryptographic keys
that are used to ensure the integrity of communications between system
management utilities and the BIOS.

HP Commercial PC’s have several BIOS settings that control its behaviour
and capabilities, many of which are related to security. To prevent
unauthorized changes to these settings, the system can be configured
to use a Sure Admin cryptographic signature-based authorization string
that the BIOS will use to verify authorization to modify the setting.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next

History

Version 5
	Remove version 4 patch 1
	Address review changes proposed in Version 4
	Reorganize all patches number and file order
---
 .../x86/hp/hp-bioscfg/string-attributes.c     |  425 +++++++
 .../x86/hp/hp-bioscfg/sureadmin-attributes.c  | 1014 +++++++++++++++++
 .../x86/hp/hp-bioscfg/surestart-attributes.c  |  149 +++
 3 files changed, 1588 insertions(+)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/sureadmin-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c

diff --git a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
new file mode 100644
index 000000000000..ad20e8af3844
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
@@ -0,0 +1,425 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to string type attributes under
+ * HP_WMI_BIOS_STRING_GUID for use with hp-bioscfg driver.
+ *
+ * Copyright (c) 2022 HP Development Company, L.P.
+ */
+
+#include "bioscfg.h"
+
+#define WMI_STRING_TYPE "HPBIOS_BIOSString"
+
+get_instance_id(string);
+
+static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	int instance_id = get_string_instance_id(kobj);
+	union acpi_object *obj = NULL;
+	ssize_t ret;
+
+	if (instance_id < 0)
+		return -EIO;
+
+	/* need to use specific instance_id and guid combination to get right data */
+	obj = get_wmiobj_pointer(instance_id, HP_WMI_BIOS_STRING_GUID);
+	if (!obj)
+		return -EIO;
+
+	ret = sysfs_emit(buf, "%s\n",
+		       bioscfg_drv.string_data[instance_id].current_value);
+
+	kfree(obj);
+	return ret;
+}
+
+/*
+ * validate_string_input() -
+ * Validate input of current_value against min and max lengths
+ *
+ * @instance_id: The instance on which input is validated
+ * @buf: Input value
+ */
+static int validate_string_input(int instance_id, const char *buf)
+{
+	int in_len = strlen(buf);
+
+	/* BIOS treats it as a read only attribute */
+	if (bioscfg_drv.string_data[instance_id].is_readonly)
+		return -EIO;
+
+	if ((in_len < bioscfg_drv.string_data[instance_id].min_length) ||
+	    (in_len > bioscfg_drv.string_data[instance_id].max_length))
+		return -EINVAL;
+
+	return 0;
+}
+
+static void update_string_value(int instance_id, char *attr_value)
+{
+	/* Write settings to BIOS */
+	strscpy(bioscfg_drv.string_data[instance_id].current_value,
+		attr_value,
+		sizeof(bioscfg_drv.string_data[instance_id].current_value));
+}
+
+attribute_s_property_show(display_name_language_code, string);
+static struct kobj_attribute string_display_langcode =
+		__ATTR_RO(display_name_language_code);
+
+attribute_s_property_show(display_name, string);
+static struct kobj_attribute string_display_name =
+		__ATTR_RO(display_name);
+
+attribute_property_store(current_value, string);
+static struct kobj_attribute string_current_val =
+		__ATTR_RW_MODE(current_value, 0644);
+
+attribute_n_property_show(min_length, string);
+static struct kobj_attribute string_min_length =
+		__ATTR_RO(min_length);
+
+attribute_n_property_show(max_length, string);
+static struct kobj_attribute string_max_length =
+		__ATTR_RO(max_length);
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "string\n");
+}
+
+static struct kobj_attribute string_type =
+	__ATTR_RO(type);
+
+static struct attribute *string_attrs[] = {
+	&string_display_langcode.attr,
+	&string_display_name.attr,
+	&string_current_val.attr,
+	&string_min_length.attr,
+	&string_max_length.attr,
+	&string_type.attr,
+	NULL
+};
+
+static const struct attribute_group string_attr_group = {
+	.attrs = string_attrs,
+};
+
+int alloc_string_data(void)
+{
+	int ret = 0;
+
+	bioscfg_drv.string_instances_count = get_instance_count(HP_WMI_BIOS_STRING_GUID);
+	bioscfg_drv.string_data = kcalloc(bioscfg_drv.string_instances_count,
+					sizeof(struct string_data), GFP_KERNEL);
+	if (!bioscfg_drv.string_data) {
+		bioscfg_drv.string_instances_count = 0;
+		ret = -ENOMEM;
+	}
+	return ret;
+}
+
+/*
+ * populate_string_package_data() -
+ * Populate all properties of an instance under string attribute
+ *
+ * @elements: ACPI object with string data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int populate_string_package_data(union acpi_object *elements, int instance_id,
+			struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.string_data[instance_id].type = HPWMI_STRING_TYPE;
+	bioscfg_drv.string_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	populate_string_elements_from_package(elements, instance_id, HPWMI_STRING_TYPE);
+	update_attribute_permissions(bioscfg_drv.string_data[instance_id].is_readonly,
+				    &string_current_val);
+	friendly_user_name_update(bioscfg_drv.string_data[instance_id].path,
+				  attr_name_kobj->name,
+				  bioscfg_drv.string_data[instance_id].display_name,
+				  sizeof(bioscfg_drv.string_data[instance_id].display_name));
+	return sysfs_create_group(attr_name_kobj, &string_attr_group);
+}
+
+int populate_string_elements_from_package(union acpi_object *elements,
+					   int instance_id,
+					   enum hp_wmi_data_type type)
+{
+	char *str_value = NULL;
+	int value_len;
+	int status = 0;
+	u32 size = 0;
+	u32 int_value;
+	int elem = 0;
+	int reqs;
+	int eloc;
+
+	if (!elements)
+		return -EINVAL;
+
+	strscpy(bioscfg_drv.string_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.string_data[instance_id].display_name_language_code));
+
+	for (elem = 1, eloc = 1; elem < hp_wmi_elements_count[type]; elem++, eloc++) {
+
+		switch (elements[elem].type) {
+		case ACPI_TYPE_STRING:
+
+			if (elem != PREREQUISITES) {
+				status = convert_hexstr_to_str(&elements[elem].string.pointer,
+							       elements[elem].string.length,
+							       &str_value, &value_len);
+
+				if (ACPI_FAILURE(status))
+					continue;
+			}
+			break;
+		case ACPI_TYPE_INTEGER:
+			int_value = (u32)elements[elem].integer.value;
+			break;
+		default:
+			pr_warn("Unsupported object type [%d]\n", elements[elem].type);
+			continue;
+		}
+
+		/*
+		 * Stop if extra counter is greater than total number
+		 * of elements for string type
+		 */
+		if (eloc == hp_wmi_elements_count[type])
+			goto exit_string_package;
+
+		/* Assign appropriate element value to corresponding field*/
+		switch (eloc) {
+		case VALUE:
+			strscpy(bioscfg_drv.string_data[instance_id].current_value,
+				str_value, sizeof(bioscfg_drv.string_data[instance_id].current_value));
+			break;
+		case PATH:
+			strscpy(bioscfg_drv.string_data[instance_id].path, str_value,
+				sizeof(bioscfg_drv.string_data[instance_id].path));
+			break;
+		case IS_READONLY:
+			bioscfg_drv.string_data[instance_id].is_readonly = int_value;
+			break;
+		case DISPLAY_IN_UI:
+			bioscfg_drv.string_data[instance_id].display_in_ui = int_value;
+			break;
+		case REQUIRES_PHYSICAL_PRESENCE:
+			bioscfg_drv.string_data[instance_id].requires_physical_presence = int_value;
+			break;
+		case SEQUENCE:
+			bioscfg_drv.string_data[instance_id].sequence = int_value;
+			break;
+		case PREREQUISITE_SIZE:
+			bioscfg_drv.string_data[instance_id].prerequisitesize = int_value;
+			if (size > 20)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+
+			/*
+			 * prerequisites element is omitted when
+			 * prerequisitesSize value is zero.
+			 */
+			if (int_value == 0)
+				eloc++;
+			break;
+		case PREREQUISITES:
+			size = bioscfg_drv.string_data[instance_id].prerequisitesize;
+
+			for (reqs = 0; reqs < size; reqs++) {
+				status = convert_hexstr_to_str(&elements[elem].string.pointer,
+							       elements[elem].string.length,
+							       &str_value, &value_len);
+
+				if (ACPI_FAILURE(status))
+					continue;
+
+				strlcat(bioscfg_drv.string_data[instance_id].prerequisites,
+					str_value,
+					sizeof(bioscfg_drv.string_data[instance_id].prerequisites));
+
+				if (reqs != (size - 1))
+					strlcat(bioscfg_drv.string_data[instance_id].prerequisites, ";",
+						sizeof(bioscfg_drv.string_data[instance_id].prerequisites));
+
+				kfree(str_value);
+				str_value = NULL;
+			}
+			break;
+
+		case SECURITY_LEVEL:
+			bioscfg_drv.string_data[instance_id].security_level = int_value;
+			break;
+		case STR_MIN_LENGTH:
+			bioscfg_drv.string_data[instance_id].min_length = int_value;
+			break;
+		case STR_MAX_LENGTH:
+			bioscfg_drv.string_data[instance_id].max_length = int_value;
+			break;
+		default:
+			pr_warn("Invalid element: %d found in String attribute or data may be malformed\n", elem);
+			break;
+		}
+		kfree(str_value);
+		str_value = NULL;
+	}
+exit_string_package:
+	kfree(str_value);
+	str_value = NULL;
+
+	return 0;
+}
+
+/*
+ * populate_string_data() -
+ * Populate all properties of an instance under string attribute
+ *
+ * @buffer_ptr: Buffer pointer
+ * @buffer_size: Buffer size
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int populate_string_buffer_data(u8 *buffer_ptr, int *buffer_size, int instance_id, struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.string_data[instance_id].type = HPWMI_STRING_TYPE;
+	bioscfg_drv.string_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	populate_string_elements_from_buffer(buffer_ptr, buffer_size,
+					     instance_id, HPWMI_STRING_TYPE);
+	update_attribute_permissions(bioscfg_drv.string_data[instance_id].is_readonly,
+				    &string_current_val);
+	friendly_user_name_update(bioscfg_drv.string_data[instance_id].path,
+				  attr_name_kobj->name,
+				  bioscfg_drv.string_data[instance_id].display_name,
+				  sizeof(bioscfg_drv.string_data[instance_id].display_name));
+	return sysfs_create_group(attr_name_kobj, &string_attr_group);
+}
+
+int populate_string_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
+					 int instance_id, enum hp_wmi_data_type type)
+{
+	int status;
+	char *str = NULL;
+	int elem;
+	int reqs;
+	int int_value;
+	int size = 0;
+
+	strscpy(bioscfg_drv.string_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.string_data[instance_id].display_name_language_code));
+
+	for (elem = 1; elem < 3; elem++) {
+		status = get_string_from_buffer((u16 **)&buffer_ptr, buffer_size, &str);
+		if (status < 0)
+			continue;
+
+		switch (elem) {
+		case VALUE:
+			strscpy(bioscfg_drv.string_data[instance_id].current_value,
+				str, sizeof(bioscfg_drv.string_data[instance_id].current_value));
+			break;
+		case PATH:
+			strscpy(bioscfg_drv.string_data[instance_id].path, str,
+				sizeof(bioscfg_drv.string_data[instance_id].path));
+			break;
+		default:
+			pr_warn("Invalid element: %d found in String attribute or data may be malformed\n", elem);
+			break;
+		}
+		kfree(str);
+		str = NULL;
+	}
+
+	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
+
+		if (elem != PREREQUISITES) {
+			status = get_integer_from_buffer((int **)&buffer_ptr,
+							 buffer_size,
+							 (int *)&int_value);
+			if (status < 0)
+				continue;
+		}
+
+		switch (elem) {
+		case IS_READONLY:
+			bioscfg_drv.string_data[instance_id].is_readonly = int_value;
+			break;
+		case DISPLAY_IN_UI:
+			bioscfg_drv.string_data[instance_id].display_in_ui = int_value;
+			break;
+		case REQUIRES_PHYSICAL_PRESENCE:
+			bioscfg_drv.string_data[instance_id].requires_physical_presence = int_value;
+			break;
+		case SEQUENCE:
+			bioscfg_drv.string_data[instance_id].sequence = int_value;
+			break;
+		case PREREQUISITE_SIZE:
+			bioscfg_drv.string_data[instance_id].prerequisitesize = int_value;
+			if (int_value > 20)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+			break;
+		case PREREQUISITES:
+			size = bioscfg_drv.string_data[instance_id].prerequisitesize;
+			for (reqs = 0; reqs < size; reqs++) {
+				status = get_string_from_buffer((u16 **)&buffer_ptr, buffer_size, &str);
+				if (status < 0)
+					continue;
+
+				strlcat(bioscfg_drv.string_data[instance_id].prerequisites,
+					str,
+					sizeof(bioscfg_drv.string_data[instance_id].prerequisites));
+
+				if (reqs != (size - 1))
+					strlcat(bioscfg_drv.string_data[instance_id].prerequisites, ";",
+						sizeof(bioscfg_drv.string_data[instance_id].prerequisites));
+
+				kfree(str);
+				str = NULL;
+			}
+			break;
+		case SECURITY_LEVEL:
+			bioscfg_drv.string_data[instance_id].security_level = int_value;
+			break;
+		case STR_MIN_LENGTH:
+			bioscfg_drv.string_data[instance_id].min_length = int_value;
+			break;
+		case STR_MAX_LENGTH:
+			bioscfg_drv.string_data[instance_id].max_length = int_value;
+			break;
+		default:
+			pr_warn("Invalid element: %d found in String attribute or data may be malformed\n", elem);
+			break;
+		}
+		kfree(str);
+		str = NULL;
+	}
+	kfree(str);
+	str = NULL;
+
+	return 0;
+}
+
+/*
+ * exit_string_attributes() - Clear all attribute data
+ *
+ * Clears all data allocated for this group of attributes
+ */
+void exit_string_attributes(void)
+{
+	int instance_id;
+
+	for (instance_id = 0; instance_id < bioscfg_drv.string_instances_count; instance_id++) {
+		if (bioscfg_drv.string_data[instance_id].attr_name_kobj)
+			sysfs_remove_group(bioscfg_drv.string_data[instance_id].attr_name_kobj,
+					   &string_attr_group);
+	}
+	bioscfg_drv.string_instances_count = 0;
+
+	kfree(bioscfg_drv.string_data);
+	bioscfg_drv.string_data = NULL;
+}
diff --git a/drivers/platform/x86/hp/hp-bioscfg/sureadmin-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/sureadmin-attributes.c
new file mode 100644
index 000000000000..d00269cbf8b7
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/sureadmin-attributes.c
@@ -0,0 +1,1014 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to sure admin object type attributes under
+ * BIOS for use with hp-bioscfg driver
+ *
+ *  Copyright (c) 2022 HP Development Company, L.P.
+ */
+
+#include "bioscfg.h"
+
+static int bios_settings_size;
+static int buf_alloc_size;
+static char *bios_settings_buffer;
+
+const char *hp_wmi_classes[] = {
+	"HPBIOS_BIOSString",
+	"HPBIOS_BIOSInteger",
+	"HPBIOS_BIOSEnumeration",
+	"HPBIOS_BIOSOrderedList",
+	"HPBIOS_BIOSPassword"
+};
+
+get_instance_id_for_attribute(string);
+get_instance_id_for_attribute(integer);
+get_instance_id_for_attribute(enumeration);
+get_instance_id_for_attribute(ordered_list);
+
+static ssize_t sure_admin_settings_write(struct file *filp, struct kobject *kobj,
+					 struct bin_attribute *attr,
+					 char *buf, loff_t off, size_t count)
+{
+	int status = 0;
+	char *part = NULL;
+	char *attr_name = NULL;
+	char *attr_value = NULL;
+	int part_len = 0;
+	unsigned short *buffer = NULL;
+	unsigned short *tmpstr = NULL;
+	int buffer_size = (count + strlen(UTF_PREFIX)) * sizeof(unsigned short);
+
+	buffer = kmalloc(buffer_size, GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	tmpstr = buffer;
+	part = strsep(&buf, ",");
+	if (!part) {
+		status = -EINVAL;
+		goto exit_settings;
+	}
+	// Save attr_name
+	attr_name = kmalloc(strlen(part) + 1, GFP_KERNEL);
+	if (!attr_name) {
+		status = -EINVAL;
+		goto exit_settings;
+	}
+	strncpy(attr_name, part, strlen(part));
+
+	tmpstr = ascii_to_utf16_unicode(tmpstr, part);
+	part = strsep(&buf, ",");
+	if (!part) {
+		status = -EINVAL;
+		goto exit_settings;
+	}
+
+	part_len = strlen(part);
+
+	/* Add extra buffer space when encountering an empty string */
+	if (!part_len) {
+		buffer_size += sizeof(unsigned short);
+		part_len += sizeof(unsigned short);
+	}
+
+	// Save attr_value
+	attr_value = kmalloc(part_len + 1, GFP_KERNEL);
+	if (!attr_value) {
+		status = -EINVAL;
+		goto exit_settings;
+	}
+	strncpy(attr_value, part, part_len);
+
+	tmpstr = ascii_to_utf16_unicode(tmpstr, part);
+	part = strsep(&buf, ",");
+	if (!part) {
+		status = -EINVAL;
+		goto exit_settings;
+	}
+	part_len = strlen(part) - 1;
+	part[part_len] = '\0';
+
+	if (strncmp(part, BEAM_PREFIX, strlen(BEAM_PREFIX)) == 0) {
+	       /*
+		* BEAM_PREFIX is append to buffer when a signature
+		* is provided and Sure Admin is enabled in BIOS
+		*/
+		// BEAM_PREFIX found, convert part to unicode
+		tmpstr = ascii_to_utf16_unicode(tmpstr, part);
+		// decrease buffer size allocated initially for UTF_PREFIX
+		buffer_size -= strlen(UTF_PREFIX) * sizeof(unsigned short);
+	} else {
+		/*
+		 * UTF-16 prefix is append to the * buffer when a BIOS
+		 * admin password is configured in BIOS
+		 */
+
+		// append UTF_PREFIX to part and then convert it to unicode
+		part = kasprintf(GFP_KERNEL, "%s%s", UTF_PREFIX, part);
+		if (!part)
+			goto exit_settings;
+
+		tmpstr = ascii_to_utf16_unicode(tmpstr, part);
+		kfree(part);
+	}
+
+	part = strsep(&buf, ",");
+	if (part) {
+		status = -EINVAL;
+		goto exit_settings;
+	}
+
+	status = hp_wmi_set_bios_setting(buffer, buffer_size);
+	if (ACPI_FAILURE(status)) {
+		status = -EINVAL;
+		goto exit_settings;
+	}
+
+	if (attr_name == NULL)
+		pr_warn("Name is null\n");
+	if (attr_value == NULL)
+		pr_warn("Value is null\n");
+
+	update_attribute_value(attr_name, attr_value);
+
+
+exit_settings:
+	kfree(buffer);
+	kfree(attr_name);
+	kfree(attr_value);
+
+	if (ACPI_SUCCESS(status))
+		return count;
+
+	return status;
+}
+
+int update_attribute_value(char *attr_name, char *attr_value)
+{
+	int instance = -EIO;
+	int int_val;
+	int ret;
+
+	if (!attr_name || !attr_value)
+		return -EIO;
+
+	/* update value for the attribute */
+	instance = get_instance_id_for_string(attr_name);
+	if (instance >= 0) {
+		strscpy(bioscfg_drv.string_data[instance].current_value,
+			attr_value,
+			sizeof(bioscfg_drv.string_data[instance].current_value));
+
+		/*
+		 * set pending reboot flag depending on
+		 * "RequiresPhysicalPresence" value
+		 */
+		if (bioscfg_drv.string_data[instance].requires_physical_presence)
+			bioscfg_drv.pending_reboot = TRUE;
+		goto exit_update_attribute;
+	}
+
+	instance = get_instance_id_for_integer(attr_name);
+	if (instance >= 0) {
+		ret = kstrtoint(attr_value, 10, &int_val);
+		if (!ret) {
+			bioscfg_drv.integer_data[instance].current_value = int_val;
+			/*
+			 * set pending reboot flag depending on
+			 * "RequiresPhysicalPresence" value
+			 */
+			if (bioscfg_drv.integer_data[instance].requires_physical_presence)
+				bioscfg_drv.pending_reboot = TRUE;
+		}
+
+		goto exit_update_attribute;
+	}
+
+	instance = get_instance_id_for_enumeration(attr_name);
+	if (instance >= 0) {
+		strscpy(bioscfg_drv.enumeration_data[instance].current_value,
+			attr_value,
+			sizeof(bioscfg_drv.enumeration_data[instance].current_value));
+		/*
+		 * set pending reboot flag depending on
+		 * "RequiresPhysicalPresence" value
+		 */
+		if (bioscfg_drv.enumeration_data[instance].requires_physical_presence)
+			bioscfg_drv.pending_reboot = TRUE;
+
+		goto exit_update_attribute;
+	}
+	instance = get_instance_id_for_ordered_list(attr_name);
+	if (instance >= 0) {
+		strscpy(bioscfg_drv.ordered_list_data[instance].current_value,
+			attr_value,
+			sizeof(bioscfg_drv.ordered_list_data[instance].current_value));
+
+		/*
+		 * set pending reboot flag depending on
+		 * "RequiresPhysicalPresence" value
+		 */
+		if (bioscfg_drv.ordered_list_data[instance].requires_physical_presence)
+			bioscfg_drv.pending_reboot = TRUE;
+	}
+
+exit_update_attribute:
+	return instance;
+}
+
+static ssize_t sure_admin_settings_read(struct file *filp, struct kobject *kobj,
+					struct bin_attribute *attr, char *buf,
+					loff_t off, size_t count)
+{
+	ssize_t ret;
+
+	/* clear the buffer when offset is pointing to the last position */
+	if (off >= bios_settings_size && bios_settings_size > 0) {
+		hp_bios_settings_free_buffer();
+		return 0;
+	}
+
+	/* clear the buffer whenever the read starts from the first position */
+	if (off == 0 && bios_settings_size > 0)
+		hp_bios_settings_free_buffer();
+
+	if (bios_settings_size == 0)
+		hp_bios_settings_fill_buffer();
+
+	mutex_lock(&bioscfg_drv.mutex);
+	ret = memory_read_from_buffer(buf, count, &off, bios_settings_buffer,
+				      bios_settings_size);
+	mutex_unlock(&bioscfg_drv.mutex);
+
+	return ret;
+}
+
+HPWMI_BINATTR_RW(sure_admin, settings, 0);
+
+static struct bin_attribute *sure_admin_binattrs[] = {
+	&sure_admin_settings,
+	NULL,
+};
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "sure-admin\n");
+}
+static struct kobj_attribute sure_admin_type = __ATTR_RO(type);
+
+static ssize_t display_name_language_code_show(struct kobject *kobj,
+					       struct kobj_attribute *attr,
+					       char *buf)
+{
+	return sysfs_emit(buf, "%s\n", LANG_CODE_STR);
+}
+
+static struct kobj_attribute sure_admin_display_langcode =
+		__ATTR_RO(display_name_language_code);
+
+
+static ssize_t display_name_show(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%s\n", SURE_ADMIN_DESC);
+}
+static struct kobj_attribute sure_admin_display_name = __ATTR_RO(display_name);
+
+static struct attribute *sure_admin_attrs[] = {
+	&sure_admin_display_name.attr,
+	&sure_admin_display_langcode.attr,
+	&sure_admin_type.attr,
+	NULL,
+};
+
+static const struct attribute_group sure_admin_attr_group = {
+	.attrs = sure_admin_attrs,
+	.bin_attrs = sure_admin_binattrs,
+};
+
+void exit_sure_admin_attributes(void)
+{
+	sysfs_remove_group(bioscfg_drv.sure_admin_attr_kobj, &sure_admin_attr_group);
+}
+
+int populate_sure_admin_data(struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.sure_admin_attr_kobj = attr_name_kobj;
+	return sysfs_create_group(attr_name_kobj, &sure_admin_attr_group);
+}
+
+int hp_bios_settings_fill_buffer(void)
+{
+	int status = 0;
+	int initial_buffer_size = 20 * PAGE_SIZE;
+
+	mutex_lock(&bioscfg_drv.mutex);
+	bios_settings_buffer = kmalloc(initial_buffer_size, GFP_KERNEL);
+	mutex_unlock(&bioscfg_drv.mutex);
+	if (!bios_settings_buffer)
+		return -ENOMEM;
+
+	mutex_lock(&bioscfg_drv.mutex);
+	buf_alloc_size = ksize(bios_settings_buffer);
+	memset(bios_settings_buffer, 0x00, buf_alloc_size);
+	bios_settings_size = snprintf(bios_settings_buffer,
+					buf_alloc_size, "[\n");
+	mutex_unlock(&bioscfg_drv.mutex);
+
+	status = append_read_settings(HPWMI_STRING_TYPE,
+					   &bios_settings_buffer,
+					   &bios_settings_size,
+					   &buf_alloc_size);
+	if (ACPI_FAILURE(status))
+		pr_err("error 0x%x occurred retrieving string instances\n", status);
+
+	status = append_read_settings(HPWMI_INTEGER_TYPE,
+					   &bios_settings_buffer,
+					   &bios_settings_size,
+					   &buf_alloc_size);
+	if (ACPI_FAILURE(status))
+		pr_err("error 0x%x occurred retrieving integer instances\n", status);
+
+	status = append_read_settings(HPWMI_ENUMERATION_TYPE,
+					   &bios_settings_buffer,
+					   &bios_settings_size,
+					   &buf_alloc_size);
+	if (ACPI_FAILURE(status))
+		pr_err("error 0x%x occurred retrieving enumeration instances\n", status);
+
+	status = append_read_settings(HPWMI_ORDERED_LIST_TYPE,
+					   &bios_settings_buffer,
+					   &bios_settings_size,
+					   &buf_alloc_size);
+	if (ACPI_FAILURE(status))
+		pr_err("error 0x%x occurred retrieving ordered list instances\n", status);
+
+	status = append_read_settings(HPWMI_PASSWORD_TYPE,
+					   &bios_settings_buffer,
+					   &bios_settings_size,
+					   &buf_alloc_size);
+	if (ACPI_FAILURE(status))
+		pr_err("error 0x%x occurred retrieving password list instances\n", status);
+
+	mutex_lock(&bioscfg_drv.mutex);
+	/*
+	 * remove trailing comma
+	 */
+	if (bios_settings_size >= 3) {
+		if (bios_settings_buffer[bios_settings_size - 2] == ',')
+			bios_settings_buffer[bios_settings_size - 2] = ' ';
+	}
+	bios_settings_size = snprintf(bios_settings_buffer,
+					buf_alloc_size, "%s]\n",
+					bios_settings_buffer);
+	mutex_unlock(&bioscfg_drv.mutex);
+
+	return bios_settings_size;
+}
+
+int hp_bios_settings_free_buffer(void)
+{
+	mutex_lock(&bioscfg_drv.mutex);
+	kfree(bios_settings_buffer);
+	bios_settings_size = 0;
+	buf_alloc_size = 0;
+	mutex_unlock(&bioscfg_drv.mutex);
+
+	return 0;
+}
+int hp_bios_settings_realloc_buffer(char **buf, int *buf_size, int *alloc_size)
+{
+	int new_buffer_size;
+	char *new_buf = NULL;
+	int ret = 0;
+
+	if (*buf_size + PAGE_SIZE >= *alloc_size) {
+		new_buffer_size = buf_alloc_size + 2 * PAGE_SIZE;
+
+		mutex_lock(&bioscfg_drv.mutex);
+		new_buf = krealloc(*buf, new_buffer_size, GFP_KERNEL);
+		mutex_unlock(&bioscfg_drv.mutex);
+		if (new_buf) {
+			mutex_lock(&bioscfg_drv.mutex);
+			*buf = new_buf;
+			*alloc_size = ksize(new_buf);
+			mutex_unlock(&bioscfg_drv.mutex);
+		} else {
+			hp_bios_settings_free_buffer();
+			ret = -ENOMEM;
+		}
+	}
+
+	return ret;
+}
+
+int append_read_settings(enum hp_wmi_data_type type, char **buf,
+			 int *buf_size, int *alloc_size)
+{
+	int ret = 0;
+	int status = 0;
+	int instance = 0;
+	int instance_count = 0;
+
+	switch (type) {
+	case HPWMI_STRING_TYPE:
+		instance_count = bioscfg_drv.string_instances_count;
+		break;
+	case HPWMI_INTEGER_TYPE:
+		instance_count = bioscfg_drv.integer_instances_count;
+		break;
+	case HPWMI_ENUMERATION_TYPE:
+		instance_count = bioscfg_drv.enumeration_instances_count;
+		break;
+	case HPWMI_ORDERED_LIST_TYPE:
+		instance_count = bioscfg_drv.ordered_list_instances_count;
+		break;
+	case HPWMI_PASSWORD_TYPE:
+		instance_count = bioscfg_drv.password_instances_count;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/*
+	 * Query all the instances
+	 */
+	for (instance = 0; instance < instance_count; instance++) {
+		mutex_lock(&bioscfg_drv.mutex);
+		status = append_read_attributes(buf, *alloc_size,
+						     instance, type);
+		if (status > 0)
+			*buf_size = status;
+
+		mutex_unlock(&bioscfg_drv.mutex);
+
+		ret = hp_bios_settings_realloc_buffer(buf, buf_size,
+						      alloc_size);
+	}
+	return ret;
+}
+
+int append_read_attributes(char **buf, int alloc_size,
+			   int instance, enum hp_wmi_data_type type)
+{
+	int status = 0;
+
+	switch (type) {
+	case HPWMI_STRING_TYPE:
+		status = append_read_string_attributes(*buf, alloc_size,
+						       instance, type);
+		break;
+	case HPWMI_INTEGER_TYPE:
+		status = append_read_integer_attributes(*buf, alloc_size,
+							instance, type);
+		break;
+	case HPWMI_ENUMERATION_TYPE:
+		status = append_read_enumeration_attributes(*buf,
+							    alloc_size,
+							    instance, type);
+		break;
+	case HPWMI_ORDERED_LIST_TYPE:
+		status = append_read_ordered_list_attributes(*buf,
+							     alloc_size,
+							     instance, type);
+		break;
+	case HPWMI_PASSWORD_TYPE:
+		status = append_read_password_attributes(*buf,
+							 alloc_size,
+							 instance, type);
+		break;
+	default:
+		status = -EINVAL;
+		break;
+	}
+	return status;
+}
+
+
+int append_read_string_attributes(char *buf, int alloc_size,
+				  int instance,
+				  enum hp_wmi_data_type type)
+{
+	int buf_size;
+	char *part_tmp = NULL;
+	char *part = NULL;
+
+	if (type >= ARRAY_SIZE(hp_wmi_classes) || !buf)
+		return -EINVAL;
+
+	buf_size = snprintf(buf, alloc_size, "%s{\n", buf);
+	buf_size = snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\",\n",
+			    buf, hp_wmi_classes[type]);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Name\": \"%s\",\n",
+			    buf,
+			    bioscfg_drv.string_data[instance].display_name);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Value\": \"%s\",\n",
+			    buf,
+			    bioscfg_drv.string_data[instance].current_value);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Path\": \"%s\",\n",
+			    buf,
+			    bioscfg_drv.string_data[instance].path);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"IsReadOnly\": %d,\n",
+			    buf,
+			    bioscfg_drv.string_data[instance].is_readonly);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"DisplayInUI\": %d,\n",
+			    buf,
+			    bioscfg_drv.string_data[instance].display_in_ui);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"RequiresPhysicalPresence\": %d,\n",
+			    buf,
+			    bioscfg_drv.string_data[instance].requires_physical_presence);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Sequence\": %d,\n",
+			    buf,
+			    bioscfg_drv.string_data[instance].sequence);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"PrerequisiteSize\": %d,\n",
+			    buf,
+			    bioscfg_drv.string_data[instance].prerequisitesize);
+
+	buf_size = snprintf(buf, alloc_size, "%s\t\"Prerequisites\": [\n", buf);
+
+	if (bioscfg_drv.string_data[instance].prerequisitesize) {
+		part_tmp = kstrdup(bioscfg_drv.string_data[instance].prerequisites,
+				   GFP_KERNEL);
+		part = strsep(&part_tmp, ";");
+		while (part) {
+			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"", buf, part);
+			part = strsep(&part_tmp, ";");
+			if (part)
+				buf_size = snprintf(buf, alloc_size, "%s,\n", buf);
+			else
+				buf_size = snprintf(buf, alloc_size, "%s\n", buf);
+		}
+		kfree(part_tmp);
+		part_tmp = NULL;
+	}
+	buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
+
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"SecurityLevel\": %d,\n",
+			    buf,
+			    bioscfg_drv.string_data[instance].security_level);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"MinLength\": %d,\n",
+			    buf,
+			    bioscfg_drv.string_data[instance].min_length);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"MaxLength\": %d\n",
+			    buf,
+			    bioscfg_drv.string_data[instance].max_length);
+
+	return snprintf(buf, alloc_size, "%s},\n", buf);
+}
+
+
+int append_read_integer_attributes(char *buf, int alloc_size,
+				   int instance,
+				   enum hp_wmi_data_type type)
+{
+	int buf_size;
+	char *part_tmp = NULL;
+	char *part = NULL;
+
+	if (type >= ARRAY_SIZE(hp_wmi_classes) || !buf)
+		return -EINVAL;
+
+	buf_size = snprintf(buf, alloc_size, "%s{\n", buf);
+	buf_size = snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\",\n",
+			    buf, hp_wmi_classes[type]);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Name\": \"%s\",\n",
+			    buf,
+			    bioscfg_drv.integer_data[instance].display_name);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Value\": \"%d\",\n",
+			    buf,
+			    bioscfg_drv.integer_data[instance].current_value);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Path\": \"%s\",\n",
+			    buf,
+			    bioscfg_drv.integer_data[instance].path);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"IsReadOnly\": %d,\n",
+			    buf,
+			    bioscfg_drv.integer_data[instance].is_readonly);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"DisplayInUI\": %d,\n",
+			    buf,
+			    bioscfg_drv.integer_data[instance].display_in_ui);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"RequiresPhysicalPresence\": %d,\n",
+			    buf,
+			    bioscfg_drv.integer_data[instance].requires_physical_presence);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Sequence\": %d,\n",
+			    buf,
+			    bioscfg_drv.integer_data[instance].sequence);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"PrerequisiteSize\": %d,\n",
+			    buf,
+			    bioscfg_drv.integer_data[instance].prerequisitesize);
+
+	buf_size = snprintf(buf, alloc_size, "%s\t\"Prerequisites\": [\n", buf);
+
+	if (bioscfg_drv.integer_data[instance].prerequisitesize) {
+		part_tmp = kstrdup(bioscfg_drv.integer_data[instance].prerequisites,
+				   GFP_KERNEL);
+		part = strsep(&part_tmp, ";");
+		while (part) {
+			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"", buf, part);
+			part = strsep(&part_tmp, ";");
+			if (part)
+				buf_size = snprintf(buf, alloc_size, "%s,\n", buf);
+			else
+				buf_size = snprintf(buf, alloc_size, "%s\n", buf);
+		}
+		kfree(part_tmp);
+		part_tmp = NULL;
+	}
+	buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"SecurityLevel\": %d,\n",
+			    buf,
+			    bioscfg_drv.integer_data[instance].security_level);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"LowerBound\": %d,\n",
+			    buf,
+			    bioscfg_drv.integer_data[instance].lower_bound);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"UpperBound\": %d,\n",
+			    buf,
+			    bioscfg_drv.integer_data[instance].upper_bound);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"IntValue\": %d\n",
+			    buf,
+			    bioscfg_drv.integer_data[instance].scalar_increment);
+
+	return snprintf(buf, alloc_size, "%s},\n", buf);
+}
+
+int append_read_enumeration_attributes(char *buf, int alloc_size,
+				       int instance,
+				       enum hp_wmi_data_type type)
+{
+	int buf_size;
+	char *part_tmp = NULL;
+	char *part = NULL;
+
+	if (type >= ARRAY_SIZE(hp_wmi_classes) || !buf)
+		return -EINVAL;
+
+	buf_size = snprintf(buf, alloc_size, "%s{\n", buf);
+	buf_size = snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\",\n",
+			    buf, hp_wmi_classes[type]);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Name\": \"%s\",\n",
+			    buf,
+			    bioscfg_drv.enumeration_data[instance].display_name);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Path\": \"%s\",\n",
+			    buf,
+			    bioscfg_drv.enumeration_data[instance].path);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"IsReadOnly\": %d,\n",
+			    buf,
+			    bioscfg_drv.enumeration_data[instance].is_readonly);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"DisplayInUI\": %d,\n",
+			    buf,
+			    bioscfg_drv.enumeration_data[instance].display_in_ui);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"RequiresPhysicalPresence\": %d,\n",
+			    buf,
+			    bioscfg_drv.enumeration_data[instance].requires_physical_presence);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Sequence\": %d,\n",
+			    buf,
+			    bioscfg_drv.enumeration_data[instance].sequence);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"PrerequisiteSize\": %d,\n",
+			    buf,
+			    bioscfg_drv.enumeration_data[instance].prerequisitesize);
+
+	buf_size = snprintf(buf, alloc_size, "%s\t\"Prerequisites\": [\n", buf);
+
+	if (bioscfg_drv.enumeration_data[instance].prerequisitesize) {
+		part_tmp = kstrdup(bioscfg_drv.enumeration_data[instance].prerequisites,
+				   GFP_KERNEL);
+		part = strsep(&part_tmp, ";");
+		while (part) {
+			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"", buf, part);
+			part = strsep(&part_tmp, ";");
+			if (part)
+				buf_size = snprintf(buf, alloc_size, "%s,\n", buf);
+			else
+				buf_size = snprintf(buf, alloc_size, "%s\n", buf);
+		}
+		kfree(part_tmp);
+		part_tmp = NULL;
+	}
+	buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"SecurityLevel\": %d,\n",
+			    buf,
+			    bioscfg_drv.enumeration_data[instance].security_level);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Value\": \"%s\",\n",
+			    buf,
+			    bioscfg_drv.enumeration_data[instance].current_value);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Size\": %d,\n",
+			    buf,
+			    bioscfg_drv.enumeration_data[instance].size);
+
+	buf_size = snprintf(buf, alloc_size, "%s\t\"PossibleValues\": [\n", buf);
+
+	if (bioscfg_drv.enumeration_data[instance].size) {
+		part_tmp = kstrdup(bioscfg_drv.enumeration_data[instance].possible_values,
+				   GFP_KERNEL);
+		part = strsep(&part_tmp, ";");
+		while (part) {
+			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"", buf, part);
+			part = strsep(&part_tmp, ";");
+			if (part)
+				buf_size = snprintf(buf, alloc_size, "%s,\n", buf);
+			else
+				buf_size = snprintf(buf, alloc_size, "%s\n", buf);
+		}
+		kfree(part_tmp);
+		part_tmp = NULL;
+	}
+	buf_size = snprintf(buf, alloc_size, "%s\t]\n", buf);
+
+	return snprintf(buf, alloc_size, "%s},\n", buf);
+}
+
+int append_read_ordered_list_attributes(char *buf, int alloc_size,
+					int instance,
+					enum hp_wmi_data_type type)
+{
+	int buf_size;
+	char *part_tmp = NULL;
+	char *part = NULL;
+
+	if (type >= ARRAY_SIZE(hp_wmi_classes) || !buf)
+		return -EINVAL;
+
+	buf_size = snprintf(buf, alloc_size, "%s{\n", buf);
+	buf_size = snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\",\n",
+			    buf, hp_wmi_classes[type]);
+
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Name\": \"%s\",\n",
+			    buf,
+			    bioscfg_drv.ordered_list_data[instance].display_name);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Value\": \"%s\",\n",
+			    buf,
+			    bioscfg_drv.ordered_list_data[instance].current_value);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Path\": \"%s\",\n",
+			    buf,
+			    bioscfg_drv.ordered_list_data[instance].path);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"IsReadOnly\": %d,\n",
+			    buf,
+			    bioscfg_drv.ordered_list_data[instance].is_readonly);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"DisplayInUI\": %d,\n",
+			    buf,
+			    bioscfg_drv.ordered_list_data[instance].display_in_ui);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"RequiresPhysicalPresence\": %d,\n",
+			    buf,
+			    bioscfg_drv.ordered_list_data[instance].requires_physical_presence);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Sequence\": %d,\n",
+			    buf,
+			    bioscfg_drv.ordered_list_data[instance].sequence);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"PrerequisiteSize\": %d,\n",
+			    buf,
+			    bioscfg_drv.ordered_list_data[instance].prerequisitesize);
+
+	buf_size = snprintf(buf, alloc_size, "%s\t\"Prerequisites\": [\n", buf);
+
+	if (bioscfg_drv.ordered_list_data[instance].prerequisitesize) {
+		part_tmp = kstrdup(bioscfg_drv.ordered_list_data[instance].prerequisites,
+				   GFP_KERNEL);
+		part = strsep(&part_tmp, ";");
+		while (part) {
+			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"", buf, part);
+			part = strsep(&part_tmp, ";");
+			if (part)
+				buf_size = snprintf(buf, alloc_size, "%s,\n", buf);
+			else
+				buf_size = snprintf(buf, alloc_size, "%s\n", buf);
+		}
+		kfree(part_tmp);
+		part_tmp = NULL;
+	}
+	buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"SecurityLevel\": %d,\n",
+			    buf,
+			    bioscfg_drv.ordered_list_data[instance].security_level);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Size\": %d,\n",
+			    buf,
+			    bioscfg_drv.ordered_list_data[instance].size);
+
+	buf_size = snprintf(buf, alloc_size, "%s\t\"Elements\": [\n", buf);
+
+	if (bioscfg_drv.ordered_list_data[instance].size) {
+		part_tmp = kstrdup(bioscfg_drv.ordered_list_data[instance].elements,
+				   GFP_KERNEL);
+		part = strsep(&part_tmp, ";");
+		while (part) {
+			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"", buf, part);
+			part = strsep(&part_tmp, ";");
+			if (part)
+				buf_size = snprintf(buf, alloc_size, "%s,\n", buf);
+			else
+				buf_size = snprintf(buf, alloc_size, "%s\n", buf);
+		}
+		kfree(part_tmp);
+		part_tmp = NULL;
+	}
+	buf_size = snprintf(buf, alloc_size, "%s\t]\n", buf);
+
+	return snprintf(buf, alloc_size, "%s},\n", buf);
+}
+
+
+int append_read_password_attributes(char *buf, int alloc_size,
+				    int instance,
+				    enum hp_wmi_data_type type)
+{
+	int buf_size;
+	char *part_tmp = NULL;
+	char *part = NULL;
+
+	if (type >= ARRAY_SIZE(hp_wmi_classes) || !buf)
+		return -EINVAL;
+
+	buf_size = snprintf(buf, alloc_size, "%s{\n", buf);
+	buf_size = snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\",\n",
+			    buf, hp_wmi_classes[type]);
+
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Name\": \"%s\",\n",
+			    buf,
+			    bioscfg_drv.password_data[instance].display_name);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Value\": \"%s\",\n",
+			    buf,
+			    bioscfg_drv.password_data[instance].current_password);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Path\": \"%s\",\n",
+			    buf,
+			    bioscfg_drv.password_data[instance].path);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"IsReadOnly\": %d,\n",
+			    buf,
+			    bioscfg_drv.password_data[instance].is_readonly);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"DisplayInUI\": %d,\n",
+			    buf,
+			    bioscfg_drv.password_data[instance].display_in_ui);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"RequiresPhysicalPresence\": %d,\n",
+			    buf,
+			    bioscfg_drv.password_data[instance].requires_physical_presence);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Sequence\": %d,\n",
+			    buf,
+			    bioscfg_drv.password_data[instance].sequence);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"PrerequisiteSize\": %d,\n",
+			    buf,
+			    bioscfg_drv.password_data[instance].prerequisitesize);
+
+	buf_size = snprintf(buf, alloc_size, "%s\t\"Prerequisites\": [\n", buf);
+
+	if (bioscfg_drv.password_data[instance].prerequisitesize) {
+		part_tmp = kstrdup(bioscfg_drv.password_data[instance].prerequisites,
+				   GFP_KERNEL);
+		part = strsep(&part_tmp, ";");
+		while (part) {
+			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"", buf, part);
+			part = strsep(&part_tmp, ";");
+			if (part)
+				buf_size = snprintf(buf, alloc_size, "%s,\n", buf);
+			else
+				buf_size = snprintf(buf, alloc_size, "%s\n", buf);
+		}
+		kfree(part_tmp);
+		part_tmp = NULL;
+	}
+	buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"SecurityLevel\": %d,\n",
+			    buf,
+			    bioscfg_drv.password_data[instance].security_level);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"MinLength\": %d,\n",
+			    buf,
+			    bioscfg_drv.password_data[instance].min_password_length);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"MaxLength\": %d,\n",
+			    buf,
+			    bioscfg_drv.password_data[instance].max_password_length);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"Size\": %d,\n",
+			    buf,
+			    bioscfg_drv.password_data[instance].encoding_size);
+
+	buf_size = snprintf(buf, alloc_size, "%s\t\"SupportedEncoding\": [\n", buf);
+
+	if (bioscfg_drv.password_data[instance].encoding_size) {
+		part_tmp = kstrdup(bioscfg_drv.password_data[instance].supported_encoding,
+				   GFP_KERNEL);
+		part = strsep(&part_tmp, ";");
+		while (part) {
+			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"", buf, part);
+			part = strsep(&part_tmp, ";");
+			if (part)
+				buf_size = snprintf(buf, alloc_size, "%s,\n", buf);
+			else
+				buf_size = snprintf(buf, alloc_size, "%s\n", buf);
+		}
+		kfree(part_tmp);
+		part_tmp = NULL;
+	}
+	buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
+
+	buf_size = snprintf(buf, alloc_size,
+			    "%s\t\"IsSet\": %d\n",
+			    buf,
+			    bioscfg_drv.password_data[instance].is_enabled);
+
+	return snprintf(buf, alloc_size, "%s},\n", buf);
+}
diff --git a/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
new file mode 100644
index 000000000000..f142d5e0a8fe
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to sure start object type attributes under
+ * BIOS for use with hp-bioscfg driver
+ *
+ *  Copyright (c) 2022 HP Development Company, L.P.
+ */
+
+#include "bioscfg.h"
+#include <asm-generic/posix_types.h>
+
+#define LOG_MAX_ENTRIES	254
+#define LOG_ENTRY_SIZE	16
+
+/*
+ * audit_log_entry_count_show - Reports the number of
+ *				existing audit log entries available
+ *				to be read
+ *
+ * @kobj:  Pointer to a kernel object of things that show up as directory
+ *	   in the sysfs filesystem.
+ * @attr:  Pointer to list of attributes for the operation
+ * @buf:   Pointer to buffer
+ *
+ * Returns number of existing audit log entries available to be read,
+ *         audit log entry size, and maximum number of entries
+ *         supported. Otherwise, an HP WMI query specific error code
+ *         (which is negative)
+ *
+ *         [No of entries],[log entry size],[Max number of entries supported]
+ */
+static ssize_t audit_log_entry_count_show(struct kobject *kobj,
+					  struct kobj_attribute *attr, char *buf)
+{
+	int ret;
+	u32 count = 0;
+
+	ret = hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG_COUNT,
+				   HPWMI_SURESTART,
+				   &count, 0, sizeof(count));
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%d,%d,%d\n", count, LOG_ENTRY_SIZE,
+			  LOG_MAX_ENTRIES);
+}
+
+/*
+ * audit_log_entries_show() - Return all entries found in log file
+ *
+ * @kobj:  Pointer to a kernel object of things that show up as
+ *	   directory in the sysfs filesystem.
+ * @attr:  Pointer to list of attributes for the operation
+ * @buf:   Pointer to buffer
+ *
+ * Returns number of bytes needed to read all audit logs entries to be read.
+ *         Otherwise, an HP WMI query specific error code (which is negative)
+ *	   -EFAULT if the audit logs size exceeds 4KB
+ *
+ */
+static ssize_t audit_log_entries_show(struct kobject *kobj,
+				      struct kobj_attribute *attr, char *buf)
+{
+	int ret;
+	int i;
+	u32 count = 0;
+
+	// Get the number of event logs
+	ret = hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG_COUNT,
+				   HPWMI_SURESTART,
+				   &count, 1, 4);
+
+	/*
+	 * The show() api will not work if the audit logs ever go
+	 *  beyond 4KB
+	 */
+	if (count * LOG_ENTRY_SIZE > PAGE_SIZE)
+		return -EFAULT;
+
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * We are guaranteed the buffer is 4KB so today all the event
+	 * logs will fit
+	 */
+	for (i = 0; ((i < count) & (ret >= 0)); i++) {
+		*buf = (i + 1);
+		ret = hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG,
+					   HPWMI_SURESTART,
+					   buf, 1, 128);
+		if (ret >= 0)
+			buf += LOG_ENTRY_SIZE;
+	}
+	return (count * LOG_ENTRY_SIZE);
+}
+
+static struct kobj_attribute sure_start_audit_log_entry_count = __ATTR_RO(audit_log_entry_count);
+struct kobj_attribute sure_start_audit_log_entries = __ATTR_RO(audit_log_entries);
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "sure-start\n");
+}
+static struct kobj_attribute sure_start_type = __ATTR_RO(type);
+
+static ssize_t display_name_language_code_show(struct kobject *kobj,
+					       struct kobj_attribute *attr,
+					       char *buf)
+{
+	return sysfs_emit(buf, "%s\n", LANG_CODE_STR);
+}
+
+static struct kobj_attribute sure_start_display_langcode =
+		__ATTR_RO(display_name_language_code);
+
+
+static ssize_t display_name_show(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%s\n", SURE_START_DESC);
+}
+static struct kobj_attribute sure_start_display_name = __ATTR_RO(display_name);
+
+static struct attribute *sure_start_attrs[] = {
+	&sure_start_display_name.attr,
+	&sure_start_display_langcode.attr,
+	&sure_start_audit_log_entry_count.attr,
+	&sure_start_audit_log_entries.attr,
+	&sure_start_type.attr,
+	NULL,
+};
+
+static const struct attribute_group sure_start_attr_group = {
+	.attrs = sure_start_attrs,
+};
+
+void exit_sure_start_attributes(void)
+{
+	sysfs_remove_group(bioscfg_drv.sure_start_attr_kobj,
+			   &sure_start_attr_group);
+}
+
+int populate_sure_start_data(struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.sure_start_attr_kobj = attr_name_kobj;
+	return sysfs_create_group(attr_name_kobj, &sure_start_attr_group);
+}
-- 
2.34.1

