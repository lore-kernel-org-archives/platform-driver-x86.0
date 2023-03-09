Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2D2C64EC4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Mar 2023 20:10:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbjCIUKh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Mar 2023 15:10:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjCIUKg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2023 15:10:36 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0BEFA8C3
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Mar 2023 12:10:32 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id e21so2604192oie.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Mar 2023 12:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678392631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBYE82Hsu8RCh31QwSIJvxgNo22JYu1jSjKstsyRasU=;
        b=Dur22lYICICKqic6w1lTsFWFVeH5j88vy2/W32P0zkC+Vg1jszNVo86hBuTmMiq4Qg
         vk5ko2Gal+RhFvdNj3KhlEMFz276MyXyWFPpEZSpRDIrhdskyUOY2phopZAcH4x0xJg+
         EUG35jyyDbLOGqefIf4OYvGR8F6obCVyUKUJxqVPbnz87ywPKyIQCq8QFqDtlELxigMA
         hQ2Q4x2ml8Rm6LaFYla7do5xLT93OWYLY6BrkGewTWFgmJm3NL9QKtZOZRMjxN+r097v
         rkxX+oxrBsUGyobvQPYmVJCz91PR1iS2XZxQg/UsC2oCDlqC3Cq3zRflSh7dzso7bITQ
         sT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678392631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBYE82Hsu8RCh31QwSIJvxgNo22JYu1jSjKstsyRasU=;
        b=h34E6FnOZND6s5hAviZkzTzjImdaO2+KicRUn3eUmuPQJaciCXihGKLJJBi0hBsxkE
         SvfTT5fX7Ec2+TW9WX9IJwEPPFhSgIvFeXtKlvmh3PHEjArttoTyZra4V0KF8T8a9Q0c
         HC0+VunkUToVo2jWoqQFp47N4ao5vMGjXhaP2x3uXheYx6emnxi4vdrSZSJihKKZFZIq
         +WP+STkpDlRrvmiinWn8dBRKPMlM4aFBYgyH18WHukFZrX9wwhBQ0XL398R54j5ppGEf
         EJcmhb5drYqPPfdg6CllAdYmEjyk9n1MvqkG7LPRU9oDpik3k9xi7JdP4LPCewKkS6TU
         a6kA==
X-Gm-Message-State: AO0yUKVR4k3gsIcmj+SrmguGTtmgQJzy2SR84Z5vikCtzVM+iqBpQpdl
        Y7zFIwlO39lx1lRBqc3+wY/lSNZbeJ8=
X-Google-Smtp-Source: AK7set8eNFFpyqsRP59lbykIljA13pwo6ZwgqIMZ6JGQnxUS8ujnu4pKMAvuBeVGhZOdE9HDWLGPzA==
X-Received: by 2002:a54:4612:0:b0:384:3b35:f741 with SMTP id p18-20020a544612000000b003843b35f741mr9859930oip.35.1678392631025;
        Thu, 09 Mar 2023 12:10:31 -0800 (PST)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:44ca:abca:1f7c:b8e7])
        by smtp.gmail.com with ESMTPSA id r129-20020acaf387000000b00383f58e7e95sm98879oih.17.2023.03.09.12.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 12:10:29 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v6 2/4] Introduction of HP-BIOSCFG driver [2]
Date:   Thu,  9 Mar 2023 14:10:20 -0600
Message-Id: <20230309201022.9502-3-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309201022.9502-1-jorge.lopez2@hp.com>
References: <20230309201022.9502-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose for this patch is submit HP BIOSCFG driver to be list of
HP Linux kernel drivers.  The driver include a total of 12 files
broken in several patches.

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

Version 6
	Breaks down the changes into 4 patches
	SureAdmin-attributes was removed

Version 5
	Remove version 4 patch 1
	Address review changes proposed in Version 4
	Reorganize all patches number and file order
---
 .../x86/hp/hp-bioscfg/int-attributes.c        | 472 ++++++++++++
 .../x86/hp/hp-bioscfg/ordered-attributes.c    | 571 +++++++++++++++
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  | 676 ++++++++++++++++++
 3 files changed, 1719 insertions(+)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c

diff --git a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
new file mode 100644
index 000000000000..84c58d6ee707
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
@@ -0,0 +1,472 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to integer type attributes under
+ * BIOS Enumeration GUID for use with hp-bioscfg driver.
+ *
+ *  Copyright (c) 2022 Hewlett-Packard Inc.
+ */
+
+#include "bioscfg.h"
+
+get_instance_id(integer);
+
+static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	int instance_id = get_integer_instance_id(kobj);
+	ssize_t ret;
+
+	if (instance_id < 0)
+		return instance_id;
+
+	ret = sysfs_emit(buf, "%d\n",
+			 bioscfg_drv.integer_data[instance_id].current_value);
+	return ret;
+}
+
+/*
+ * validate_integer_input() -
+ * Validate input of current_value against lower and upper bound
+ *
+ * @instance_id: The instance on which input is validated
+ * @buf: Input value
+ */
+static int validate_integer_input(int instance_id, char *buf)
+{
+	int in_val;
+	int ret;
+
+	/* BIOS treats it as a read only attribute */
+	if (bioscfg_drv.integer_data[instance_id].is_readonly)
+		return -EIO;
+
+	ret = kstrtoint(buf, 10, &in_val);
+	if (in_val < bioscfg_drv.integer_data[instance_id].lower_bound ||
+	    in_val > bioscfg_drv.integer_data[instance_id].upper_bound)
+		return -EINVAL;
+
+	/*
+	 * set pending reboot flag depending on
+	 * "RequiresPhysicalPresence" value
+	 */
+	if (bioscfg_drv.integer_data[instance_id].requires_physical_presence)
+		bioscfg_drv.pending_reboot = TRUE;
+	return 0;
+}
+
+static void update_integer_value(int instance_id, char *attr_value)
+{
+	int in_val;
+	int ret;
+
+	ret = kstrtoint(attr_value, 10, &in_val);
+	bioscfg_drv.integer_data[instance_id].current_value = in_val;
+}
+
+attribute_s_property_show(display_name_language_code, integer);
+static struct kobj_attribute integer_display_langcode =
+	__ATTR_RO(display_name_language_code);
+
+attribute_s_property_show(display_name, integer);
+static struct kobj_attribute integer_display_name =
+	__ATTR_RO(display_name);
+
+attribute_property_store(current_value, integer);
+static struct kobj_attribute integer_current_val =
+	__ATTR_RW_MODE(current_value, 0644);
+
+attribute_n_property_show(lower_bound, integer);
+static struct kobj_attribute integer_lower_bound =
+	__ATTR_RO(lower_bound);
+
+attribute_n_property_show(upper_bound, integer);
+static struct kobj_attribute integer_upper_bound =
+	__ATTR_RO(upper_bound);
+
+attribute_n_property_show(prerequisites_size, integer);
+static struct kobj_attribute  integer_prerequisites_size_val =
+	__ATTR_RO(prerequisites_size);
+
+attribute_values_property_show(prerequisites, integer);
+static struct kobj_attribute  integer_prerequisites_val =
+	__ATTR_RO(prerequisites);
+
+attribute_n_property_show(scalar_increment, integer);
+static struct kobj_attribute integer_scalar_increment =
+	__ATTR_RO(scalar_increment);
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "integer\n");
+}
+static struct kobj_attribute integer_type =
+	__ATTR_RO(type);
+
+static struct attribute *integer_attrs[] = {
+	&integer_display_langcode.attr,
+	&integer_display_name.attr,
+	&integer_current_val.attr,
+	&integer_lower_bound.attr,
+	&integer_upper_bound.attr,
+	&integer_scalar_increment.attr,
+	&integer_prerequisites_size_val.attr,
+	&integer_prerequisites_val.attr,
+	&integer_type.attr,
+	NULL,
+};
+
+static const struct attribute_group integer_attr_group = {
+	.attrs = integer_attrs,
+};
+
+int alloc_integer_data(void)
+{
+	int ret = 0;
+
+	bioscfg_drv.integer_instances_count = get_instance_count(HP_WMI_BIOS_INTEGER_GUID);
+	bioscfg_drv.integer_data = kcalloc(bioscfg_drv.integer_instances_count,
+					   sizeof(struct integer_data), GFP_KERNEL);
+
+	if (!bioscfg_drv.integer_data) {
+		bioscfg_drv.integer_instances_count = 0;
+		ret = -ENOMEM;
+	}
+	return ret;
+}
+
+/* Expected Values types associated with each element */
+static acpi_object_type expected_integer_types[] = {
+	[NAME] = ACPI_TYPE_STRING,
+	[VALUE] = ACPI_TYPE_STRING,
+	[PATH] = ACPI_TYPE_STRING,
+	[IS_READONLY] = ACPI_TYPE_INTEGER,
+	[DISPLAY_IN_UI] = ACPI_TYPE_INTEGER,
+	[REQUIRES_PHYSICAL_PRESENCE] = ACPI_TYPE_INTEGER,
+	[SEQUENCE] = ACPI_TYPE_INTEGER,
+	[PREREQUISITES_SIZE] = ACPI_TYPE_INTEGER,
+	[PREREQUISITES] = ACPI_TYPE_STRING,
+	[SECURITY_LEVEL] = ACPI_TYPE_INTEGER,
+	[INT_LOWER_BOUND] = ACPI_TYPE_INTEGER,
+	[INT_UPPER_BOUND] = ACPI_TYPE_INTEGER,
+	[INT_SCALAR_INCREMENT] = ACPI_TYPE_INTEGER
+};
+
+/*
+ * populate_int_data() -
+ * Populate all properties of an instance under integer attribute
+ *
+ * @integer_obj: ACPI object with integer data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int populate_integer_package_data(union acpi_object *integer_obj,
+				  int instance_id,
+				  struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.integer_data[instance_id].attr_name_kobj = attr_name_kobj;
+	populate_integer_elements_from_package(integer_obj,
+					       integer_obj->package.count,
+					       instance_id,
+					       HPWMI_INTEGER_TYPE);
+	update_attribute_permissions(bioscfg_drv.integer_data[instance_id].is_readonly,
+				     &integer_current_val);
+	friendly_user_name_update(bioscfg_drv.integer_data[instance_id].path,
+				  attr_name_kobj->name,
+				  bioscfg_drv.integer_data[instance_id].display_name,
+				  sizeof(bioscfg_drv.integer_data[instance_id].display_name));
+	return sysfs_create_group(attr_name_kobj, &integer_attr_group);
+}
+
+int populate_integer_elements_from_package(union acpi_object *integer_obj,
+					   int integer_obj_count,
+					   int instance_id,
+					   enum hp_wmi_data_type type)
+{
+	char *str_value = NULL;
+	int value_len;
+	int ret = 0;
+	u32 size = 0;
+	u32 int_value;
+	int elem = 0;
+	int reqs;
+	int eloc;
+
+	if (!integer_obj)
+		return -EINVAL;
+
+	strscpy(bioscfg_drv.integer_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.integer_data[instance_id].display_name_language_code));
+
+	for (elem = 1, eloc = 1; elem < integer_obj_count; elem++, eloc++) {
+
+		/* ONLY look at the first 'hp_wmi_elements_count[type]' elements */
+		if (eloc == hp_wmi_elements_count[type])
+			goto exit_integer_package;
+
+		switch (integer_obj[elem].type) {
+		case ACPI_TYPE_STRING:
+
+			if (elem != PREREQUISITES) {
+				ret = convert_hexstr_to_str(integer_obj[elem].string.pointer,
+							    integer_obj[elem].string.length,
+							    &str_value, &value_len);
+				if (ret)
+					continue;
+			}
+			break;
+		case ACPI_TYPE_INTEGER:
+			int_value = (u32)integer_obj[elem].integer.value;
+			break;
+		default:
+			pr_warn("Unsupported object type [%d]\n", integer_obj[elem].type);
+			continue;
+		}
+		/* Check that both expected and read object type match */
+		if (expected_integer_types[eloc] != integer_obj[elem].type) {
+			pr_err("Error expected type %d for elem  %d, but got type %d instead\n",
+			       expected_integer_types[eloc], elem, integer_obj[elem].type);
+			return -EIO;
+		}
+		/* Assign appropriate element value to corresponding field*/
+		switch (eloc) {
+		case VALUE:
+			ret = kstrtoint(str_value, 10, &int_value);
+			if (ret)
+				continue;
+
+			bioscfg_drv.integer_data[instance_id].current_value = int_value;
+			break;
+		case PATH:
+			strscpy(bioscfg_drv.integer_data[instance_id].path, str_value,
+				sizeof(bioscfg_drv.integer_data[instance_id].path));
+			break;
+		case IS_READONLY:
+			bioscfg_drv.integer_data[instance_id].is_readonly = int_value;
+			break;
+		case DISPLAY_IN_UI:
+			bioscfg_drv.integer_data[instance_id].display_in_ui = int_value;
+			break;
+		case REQUIRES_PHYSICAL_PRESENCE:
+			bioscfg_drv.integer_data[instance_id].requires_physical_presence = int_value;
+			break;
+		case SEQUENCE:
+			bioscfg_drv.integer_data[instance_id].sequence = int_value;
+			break;
+		case PREREQUISITES_SIZE:
+			bioscfg_drv.integer_data[instance_id].prerequisites_size = int_value;
+
+			if (int_value > MAX_PREREQUISITES_SIZE)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+			/*
+			 * This HACK is needed to keep the expected
+			 * element list pointing to the right obj[elem].type
+			 * when the size is zero.  PREREQUISITES
+			 * object is omitted by BIOS when the size is
+			 * zero.
+			 */
+			if (int_value == 0)
+				eloc++;
+			break;
+		case PREREQUISITES:
+			size = bioscfg_drv.integer_data[instance_id].prerequisites_size;
+
+			for (reqs = 0; reqs < size && reqs < MAX_PREREQUISITES_SIZE; reqs++) {
+				if (elem >= integer_obj_count) {
+					pr_err("Error elem-objects package is too small\n");
+					return -EINVAL;
+				}
+
+				ret = convert_hexstr_to_str(integer_obj[elem + reqs].string.pointer,
+							    integer_obj[elem + reqs].string.length,
+							    &str_value, &value_len);
+
+				if (ret)
+					continue;
+
+				strscpy(bioscfg_drv.integer_data[instance_id].prerequisites[reqs],
+					str_value,
+					sizeof(bioscfg_drv.integer_data[instance_id].prerequisites[reqs]));
+				kfree(str_value);
+				str_value = NULL;
+			}
+			break;
+
+		case SECURITY_LEVEL:
+			bioscfg_drv.integer_data[instance_id].security_level = int_value;
+			break;
+		case INT_LOWER_BOUND:
+			bioscfg_drv.integer_data[instance_id].lower_bound = int_value;
+			break;
+		case INT_UPPER_BOUND:
+			bioscfg_drv.integer_data[instance_id].upper_bound = int_value;
+			break;
+		case INT_SCALAR_INCREMENT:
+			bioscfg_drv.integer_data[instance_id].scalar_increment = int_value;
+			break;
+		default:
+			pr_warn("Invalid element: %d found in Integer attribute or data may be malformed\n", elem);
+			break;
+		}
+	}
+exit_integer_package:
+	kfree(str_value);
+	str_value = NULL;
+	return 0;
+}
+
+
+/*
+ * populate_integer_buffer_data() -
+ * Populate all properties of an instance under integer attribute
+ *
+ * @buffer_ptr: Buffer pointer
+ * @buffer_size: Buffer size
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int populate_integer_buffer_data(u8 *buffer_ptr, int *buffer_size, int instance_id,
+				 struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.integer_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	/* Populate integer elements */
+	populate_integer_elements_from_buffer(buffer_ptr, buffer_size,
+					      instance_id, HPWMI_INTEGER_TYPE);
+	update_attribute_permissions(bioscfg_drv.integer_data[instance_id].is_readonly,
+				     &integer_current_val);
+	friendly_user_name_update(bioscfg_drv.integer_data[instance_id].path,
+				  attr_name_kobj->name,
+				  bioscfg_drv.integer_data[instance_id].display_name,
+				  sizeof(bioscfg_drv.integer_data[instance_id].display_name));
+
+	return sysfs_create_group(attr_name_kobj, &integer_attr_group);
+}
+
+int populate_integer_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
+					  int instance_id, enum hp_wmi_data_type type)
+{
+	char *dst = NULL;
+	int elem;
+	int reqs;
+	int integer;
+	int size = 0;
+	int ret;
+	int dst_size = *buffer_size / sizeof(u16);
+
+	dst = kcalloc(dst_size, sizeof(char), GFP_KERNEL);
+	if (!dst)
+		return -ENOMEM;
+
+	elem = 0;
+	strscpy(bioscfg_drv.integer_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.integer_data[instance_id].display_name_language_code));
+
+	for (elem = 1; elem < 3; elem++) {
+
+		ret = get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
+		if (ret < 0)
+			continue;
+
+		switch (elem) {
+		case VALUE:
+			ret = kstrtoint(dst, 10, &integer);
+			if (ret)
+				continue;
+
+			bioscfg_drv.integer_data[instance_id].current_value = integer;
+			break;
+		case PATH:
+			strscpy(bioscfg_drv.integer_data[instance_id].path, dst,
+				sizeof(bioscfg_drv.integer_data[instance_id].path));
+			break;
+		default:
+			pr_warn("Invalid element: %d found in Integer attribute or data may be malformed\n", elem);
+			break;
+		}
+	}
+
+	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
+
+		if (elem != PREREQUISITES) {
+			ret = get_integer_from_buffer((int **)&buffer_ptr, buffer_size, (int *)&integer);
+			if (ret < 0)
+				continue;
+		}
+
+		switch (elem) {
+
+		case IS_READONLY:
+			bioscfg_drv.integer_data[instance_id].is_readonly = integer;
+			break;
+		case DISPLAY_IN_UI:
+			bioscfg_drv.integer_data[instance_id].display_in_ui = integer;
+			break;
+		case REQUIRES_PHYSICAL_PRESENCE:
+			bioscfg_drv.integer_data[instance_id].requires_physical_presence = integer;
+			break;
+		case SEQUENCE:
+			bioscfg_drv.integer_data[instance_id].sequence = integer;
+			break;
+		case PREREQUISITES_SIZE:
+			bioscfg_drv.integer_data[instance_id].prerequisites_size = integer;
+			size = integer;
+			if (size > MAX_PREREQUISITES_SIZE)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+
+			// PREREQUISITES:
+			elem++;
+			for (reqs = 0; reqs < size && reqs  < MAX_PREREQUISITES_SIZE; reqs++) {
+				ret = get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
+				if (ret < 0)
+					continue;
+
+				strscpy(bioscfg_drv.integer_data[instance_id].prerequisites[reqs],
+					dst,
+					sizeof(bioscfg_drv.integer_data[instance_id].prerequisites[reqs]));
+			}
+			break;
+
+		case SECURITY_LEVEL:
+			bioscfg_drv.integer_data[instance_id].security_level = integer;
+			break;
+		case INT_LOWER_BOUND:
+			bioscfg_drv.integer_data[instance_id].lower_bound = integer;
+			break;
+		case INT_UPPER_BOUND:
+			bioscfg_drv.integer_data[instance_id].upper_bound = integer;
+			break;
+		case INT_SCALAR_INCREMENT:
+			bioscfg_drv.integer_data[instance_id].scalar_increment = integer;
+			break;
+
+		default:
+			pr_warn("Invalid element: %d found in Integer attribute or data may be malformed\n", elem);
+			break;
+		}
+	}
+	kfree(dst);
+
+	return 0;
+}
+
+/*
+ * exit_integer_attributes() - Clear all attribute data
+ *
+ * Clears all data allocated for this group of attributes
+ */
+void exit_integer_attributes(void)
+{
+	int instance_id;
+
+	for (instance_id = 0; instance_id < bioscfg_drv.integer_instances_count; instance_id++) {
+		if (bioscfg_drv.integer_data[instance_id].attr_name_kobj)
+			sysfs_remove_group(bioscfg_drv.integer_data[instance_id].attr_name_kobj,
+					   &integer_attr_group);
+	}
+	bioscfg_drv.integer_instances_count = 0;
+
+	kfree(bioscfg_drv.integer_data);
+	bioscfg_drv.integer_data = NULL;
+}
diff --git a/drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
new file mode 100644
index 000000000000..4f0527a9273d
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
@@ -0,0 +1,571 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to ordered list type attributes under
+ * BIOS ORDERED LIST GUID for use with hp-bioscfg driver.
+ *
+ *  Copyright (c) 2022 HP Development Company, L.P.
+ */
+
+#include "bioscfg.h"
+
+get_instance_id(ordered_list);
+
+static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	ssize_t ret;
+	int instance_id = get_ordered_list_instance_id(kobj);
+
+	if (instance_id < 0)
+		return -EIO;
+
+	ret = sysfs_emit(buf, "%s\n",
+			 bioscfg_drv.ordered_list_data[instance_id].current_value);
+
+	return ret;
+}
+
+/*
+ * validate_ordered_list_value -
+ * Validate input of current_value against possible values
+ *
+ * @instance_id: The instance on which input is validated
+ * @buf: Input value
+ */
+static int validate_ordered_list_values(int instance_id, const char *buf)
+{
+	int ret = 0;
+	int found = 0;
+	char *new_values = NULL;
+	char *value;
+	int elem;
+	int elem_found = 0;
+
+	/* Is it a read only attribute */
+	if (bioscfg_drv.ordered_list_data[instance_id].is_readonly)
+		return -EIO;
+
+	new_values = kstrdup(buf, GFP_KERNEL);
+
+	/*
+	 * Changes to ordered list values require checking that new
+	 * values are found in the list of elements.
+	 */
+	elem_found = 0;
+	while (elem_found < bioscfg_drv.ordered_list_data[instance_id].elements_size) {
+
+		value = strsep(&new_values, ",");
+		if (value != NULL) {
+			if (!*value)
+				continue;
+			elem_found++;
+		}
+
+		found = 0;
+		for (elem = 0; elem < bioscfg_drv.ordered_list_data[instance_id].elements_size; elem++) {
+			if (!strcasecmp(bioscfg_drv.ordered_list_data[instance_id].elements[elem], value)) {
+				found = 1;
+				break;
+			}
+		}
+
+
+		if (!found) {
+			ret = -EINVAL;
+			goto validate_ordered_list_value_exit;
+		}
+	}
+
+	if (elem_found == bioscfg_drv.ordered_list_data[instance_id].elements_size) {
+		pr_warn("Number of new values is not equal to number of ordered list elements (%d)\n",
+			bioscfg_drv.ordered_list_data[instance_id].elements_size);
+		ret = -EINVAL;
+		goto validate_ordered_list_value_exit;
+	}
+
+validate_ordered_list_value_exit:
+	kfree(new_values);
+	return ret;
+}
+
+/*
+ * validate_ordered_input() -
+ * Validate input of current_value against possible values
+ *
+ * @instance_id: The instance on which input is validated
+ * @buf: Input value
+ */
+static int validate_ordered_list_input(int instance_id, const char *buf)
+{
+	int ret = 0;
+
+	ret = validate_ordered_list_values(instance_id, buf);
+	if (ret < 0)
+		return -EINVAL;
+
+	/*
+	 * set pending reboot flag depending on
+	 * "RequiresPhysicalPresence" value
+	 */
+	if (bioscfg_drv.ordered_list_data[instance_id].requires_physical_presence)
+		bioscfg_drv.pending_reboot = TRUE;
+
+	return ret;
+}
+
+static void update_ordered_list_value(int instance_id, char *attr_value)
+{
+	strscpy(bioscfg_drv.ordered_list_data[instance_id].current_value,
+		attr_value,
+		sizeof(bioscfg_drv.ordered_list_data[instance_id].current_value));
+}
+
+attribute_s_property_show(display_name_language_code, ordered_list);
+static struct kobj_attribute ordered_list_display_langcode =
+	__ATTR_RO(display_name_language_code);
+
+attribute_s_property_show(display_name, ordered_list);
+static struct kobj_attribute ordered_list_display_name =
+	__ATTR_RO(display_name);
+
+attribute_property_store(current_value, ordered_list);
+static struct kobj_attribute ordered_list_current_val =
+	__ATTR_RW_MODE(current_value, 0644);
+
+
+attribute_n_property_show(prerequisites_size, ordered_list);
+static struct kobj_attribute  ordered_list_prerequisites_size_val =
+	__ATTR_RO(prerequisites_size);
+
+attribute_values_property_show(prerequisites, ordered_list);
+static struct kobj_attribute  ordered_list_prerequisites_val =
+	__ATTR_RO(prerequisites);
+
+attribute_n_property_show(elements_size, ordered_list);
+static struct kobj_attribute  ordered_list_elements_size_val =
+	__ATTR_RO(elements_size);
+
+attribute_values_property_show(elements, ordered_list);
+static struct kobj_attribute  ordered_list_elements_val =
+	__ATTR_RO(elements);
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "ordered-list\n");
+}
+static struct kobj_attribute ordered_list_type =
+	__ATTR_RO(type);
+
+static struct attribute *ordered_list_attrs[] = {
+	&ordered_list_display_langcode.attr,
+	&ordered_list_display_name.attr,
+	&ordered_list_current_val.attr,
+	&ordered_list_prerequisites_size_val.attr,
+	&ordered_list_prerequisites_val.attr,
+	&ordered_list_elements_val.attr,
+	&ordered_list_elements_size_val.attr,
+	&ordered_list_type.attr,
+	NULL,
+};
+
+static const struct attribute_group ordered_list_attr_group = {
+	.attrs = ordered_list_attrs,
+};
+
+int alloc_ordered_list_data(void)
+{
+	int ret = 0;
+
+	bioscfg_drv.ordered_list_instances_count =
+		get_instance_count(HP_WMI_BIOS_ORDERED_LIST_GUID);
+	bioscfg_drv.ordered_list_data = kcalloc(bioscfg_drv.ordered_list_instances_count,
+						sizeof(struct ordered_list_data), GFP_KERNEL);
+	if (!bioscfg_drv.ordered_list_data) {
+		bioscfg_drv.ordered_list_instances_count = 0;
+		ret = -ENOMEM;
+	}
+	return ret;
+}
+
+/*
+ * populate_ordered_list_package_data() -
+ * Populate all properties of an instance under ordered_list attribute
+ *
+ * @order_obj: ACPI object with ordered_list data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int populate_ordered_list_package_data(union acpi_object *order_obj, int instance_id,
+				       struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.ordered_list_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	populate_ordered_list_elements_from_package(order_obj,
+						    order_obj->package.count,
+						    instance_id,
+						    HPWMI_ORDERED_LIST_TYPE);
+	update_attribute_permissions(bioscfg_drv.ordered_list_data[instance_id].is_readonly,
+				     &ordered_list_current_val);
+	friendly_user_name_update(bioscfg_drv.ordered_list_data[instance_id].path,
+				  attr_name_kobj->name,
+				  bioscfg_drv.ordered_list_data[instance_id].display_name,
+				  sizeof(bioscfg_drv.ordered_list_data[instance_id].display_name));
+	return sysfs_create_group(attr_name_kobj, &ordered_list_attr_group);
+}
+
+/* Expected Values types associated with each element */
+static acpi_object_type expected_order_types[] = {
+	[NAME]	= ACPI_TYPE_STRING,
+	[VALUE] = ACPI_TYPE_STRING,
+	[PATH] = ACPI_TYPE_STRING,
+	[IS_READONLY] = ACPI_TYPE_INTEGER,
+	[DISPLAY_IN_UI] = ACPI_TYPE_INTEGER,
+	[REQUIRES_PHYSICAL_PRESENCE] = ACPI_TYPE_INTEGER,
+	[SEQUENCE] = ACPI_TYPE_INTEGER,
+	[PREREQUISITES_SIZE] = ACPI_TYPE_INTEGER,
+	[PREREQUISITES] = ACPI_TYPE_STRING,
+	[SECURITY_LEVEL] = ACPI_TYPE_INTEGER,
+	[ORD_LIST_SIZE] = ACPI_TYPE_INTEGER,
+	[ORD_LIST_ELEMENTS] = ACPI_TYPE_STRING
+};
+
+
+int populate_ordered_list_elements_from_package(union acpi_object *order_obj,
+						int order_obj_count,
+						int instance_id,
+						enum hp_wmi_data_type type)
+{
+	char *str_value = NULL;
+	int value_len;
+	int ret = 0;
+	u32 size = 0;
+	u32 int_value;
+	int elem = 0;
+	int reqs;
+	int eloc;
+	char *tmpstr = NULL;
+	char *part_tmp = NULL;
+	int tmp_len = 0;
+	char *part = NULL;
+
+	if (!order_obj)
+		return -EINVAL;
+
+	strscpy(bioscfg_drv.ordered_list_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.ordered_list_data[instance_id].display_name_language_code));
+
+	for (elem = 1, eloc = 1; elem < order_obj_count; elem++, eloc++) {
+
+		/* ONLY look at the first 'hp_wmi_elements_count[type]' elements */
+		if (eloc == hp_wmi_elements_count[type])
+			goto exit_ordered_list_package;
+
+		switch (order_obj[elem].type) {
+		case ACPI_TYPE_STRING:
+
+			if (elem != PREREQUISITES && elem != ORD_LIST_ELEMENTS) {
+				ret = convert_hexstr_to_str(order_obj[elem].string.pointer,
+							    order_obj[elem].string.length,
+							    &str_value, &value_len);
+				if (ret)
+					continue;
+			}
+			break;
+		case ACPI_TYPE_INTEGER:
+			int_value = (u32)order_obj[elem].integer.value;
+			break;
+		default:
+			pr_warn("Unsupported object type [%d]\n", order_obj[elem].type);
+			continue;
+		}
+
+		/* Check that both expected and read object type match */
+		if (expected_order_types[eloc] != order_obj[elem].type) {
+			pr_err("Error expected type %d for elem  %d, but got type %d instead\n",
+			       expected_order_types[eloc], elem, order_obj[elem].type);
+			return -EIO;
+		}
+
+		/* Assign appropriate element value to corresponding field*/
+		switch (eloc) {
+		case VALUE:
+			strscpy(bioscfg_drv.ordered_list_data[instance_id].current_value,
+				str_value, sizeof(bioscfg_drv.ordered_list_data[instance_id].current_value));
+			break;
+		case PATH:
+			strscpy(bioscfg_drv.ordered_list_data[instance_id].path, str_value,
+				sizeof(bioscfg_drv.ordered_list_data[instance_id].path));
+			break;
+		case IS_READONLY:
+			bioscfg_drv.ordered_list_data[instance_id].is_readonly = int_value;
+			break;
+		case DISPLAY_IN_UI:
+			bioscfg_drv.ordered_list_data[instance_id].display_in_ui = int_value;
+			break;
+		case REQUIRES_PHYSICAL_PRESENCE:
+			bioscfg_drv.ordered_list_data[instance_id].requires_physical_presence = int_value;
+			break;
+		case SEQUENCE:
+			bioscfg_drv.ordered_list_data[instance_id].sequence = int_value;
+			break;
+		case PREREQUISITES_SIZE:
+			bioscfg_drv.ordered_list_data[instance_id].prerequisites_size = int_value;
+			if (int_value > MAX_PREREQUISITES_SIZE)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+
+			/*
+			 * This HACK is needed to keep the expected
+			 * element list pointing to the right obj[elem].type
+			 * when the size is zero.  PREREQUISITES
+			 * object is omitted by BIOS when the size is
+			 * zero.
+			 */
+			if (int_value == 0)
+				eloc++;
+			break;
+		case PREREQUISITES:
+			size = bioscfg_drv.ordered_list_data[instance_id].prerequisites_size;
+
+			for (reqs = 0; reqs < size && reqs < MAX_PREREQUISITES_SIZE; reqs++) {
+				ret = convert_hexstr_to_str(order_obj[elem + reqs].string.pointer,
+							    order_obj[elem + reqs].string.length,
+							    &str_value, &value_len);
+
+				if (ret)
+					continue;
+
+				strscpy(bioscfg_drv.ordered_list_data[instance_id].prerequisites[reqs],
+					str_value,
+					sizeof(bioscfg_drv.ordered_list_data[instance_id].prerequisites[reqs]));
+
+				kfree(str_value);
+				str_value = NULL;
+			}
+			break;
+
+		case SECURITY_LEVEL:
+			bioscfg_drv.ordered_list_data[instance_id].security_level = int_value;
+			break;
+
+		case ORD_LIST_SIZE:
+			bioscfg_drv.ordered_list_data[instance_id].elements_size = int_value;
+			if (int_value > MAX_ELEMENTS_SIZE)
+				pr_warn("Ordered List size value exceeded the maximum number of elements supported or data may be malformed\n");
+			/*
+			 * This HACK is needed to keep the expected
+			 * element list pointing to the right obj[elem].type
+			 * when the size is zero.  ORD_LIST_ELEMENTS
+			 * object is omitted by BIOS when the size is
+			 * zero.
+			 */
+			if (int_value == 0)
+				eloc++;
+			break;
+		case ORD_LIST_ELEMENTS:
+			size = bioscfg_drv.ordered_list_data[instance_id].elements_size;
+
+			/*
+			 * Ordered list data is stored in hex and comma separated format
+			 * Convert the data and split it to show each element
+			 */
+			ret = convert_hexstr_to_str(str_value, value_len, &tmpstr, &tmp_len);
+			if (ret)
+				goto exit_ordered_list_package;
+
+			part_tmp = tmpstr;
+			part = strsep(&part_tmp, ",");
+			if (!part)
+				strscpy(bioscfg_drv.ordered_list_data[instance_id].elements[0],
+					tmpstr,
+					sizeof(bioscfg_drv.ordered_list_data[instance_id].elements[0]));
+
+			for (elem = 1; elem < MAX_ELEMENTS_SIZE && part; elem++) {
+				strscpy(bioscfg_drv.ordered_list_data[instance_id].elements[elem],
+					part,
+					sizeof(bioscfg_drv.ordered_list_data[instance_id].elements[elem]));
+				part = strsep(&part_tmp, ",");
+			}
+
+			kfree(tmpstr);
+			tmpstr = NULL;
+			break;
+		default:
+			pr_warn("Invalid element: %d found in Ordered_List attribute or data may be malformed\n", elem);
+			break;
+		}
+		kfree(tmpstr);
+		tmpstr = NULL;
+		kfree(str_value);
+		str_value = NULL;
+	}
+
+exit_ordered_list_package:
+	kfree(tmpstr);
+	tmpstr = NULL;
+	kfree(str_value);
+	str_value = NULL;
+	return 0;
+}
+
+/*
+ * populate_ordered_list_data() - Populate all properties of an
+ * instance under ordered list attribute
+ *
+ * @buffer_ptr: Buffer pointer
+ * @buffer_size: Buffer size
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ * @enum_property_count: Total properties count under ordered list type
+ */
+int populate_ordered_list_buffer_data(u8 *buffer_ptr, int *buffer_size, int instance_id,
+				      struct kobject *attr_name_kobj)
+{
+
+	bioscfg_drv.ordered_list_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	/* Populate ordered list elements */
+	populate_ordered_list_elements_from_buffer(buffer_ptr, buffer_size,
+						   instance_id, HPWMI_ORDERED_LIST_TYPE);
+	update_attribute_permissions(bioscfg_drv.ordered_list_data[instance_id].is_readonly,
+				     &ordered_list_current_val);
+	friendly_user_name_update(bioscfg_drv.ordered_list_data[instance_id].path,
+				  attr_name_kobj->name,
+				  bioscfg_drv.ordered_list_data[instance_id].display_name,
+				  sizeof(bioscfg_drv.ordered_list_data[instance_id].display_name));
+
+	return sysfs_create_group(attr_name_kobj, &ordered_list_attr_group);
+}
+
+int populate_ordered_list_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
+					       int instance_id, enum hp_wmi_data_type type)
+{
+	int ret;
+	char *dst = NULL;
+	int elem;
+	int reqs;
+	int integer;
+	int size = 0;
+	int values;
+	int dst_size = *buffer_size / sizeof(u16);
+
+	dst = kcalloc(dst_size, sizeof(char), GFP_KERNEL);
+	if (!dst)
+		return -ENOMEM;
+
+	elem = 0;
+	strscpy(bioscfg_drv.ordered_list_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.ordered_list_data[instance_id].display_name_language_code));
+
+	for (elem = 1; elem < 3; elem++) {
+
+		ret = get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
+		if (ret < 0)
+			continue;
+
+		switch (elem) {
+		case VALUE:
+			strscpy(bioscfg_drv.ordered_list_data[instance_id].current_value,
+				dst, sizeof(bioscfg_drv.ordered_list_data[instance_id].current_value));
+			break;
+		case PATH:
+			strscpy(bioscfg_drv.ordered_list_data[instance_id].path, dst,
+				sizeof(bioscfg_drv.ordered_list_data[instance_id].path));
+			break;
+		default:
+			pr_warn("Invalid element: %d found in Ordered list attribute or data may be malformed\n", elem);
+			break;
+		}
+	}
+	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
+
+		if (elem != PREREQUISITES && elem != ORD_LIST_ELEMENTS) {
+			ret = get_integer_from_buffer((int **)&buffer_ptr, buffer_size, (int *)&integer);
+			if (ret < 0)
+				continue;
+		}
+
+		switch (elem) {
+
+		case IS_READONLY:
+			bioscfg_drv.ordered_list_data[instance_id].is_readonly = integer;
+			break;
+		case DISPLAY_IN_UI:
+			bioscfg_drv.ordered_list_data[instance_id].display_in_ui = integer;
+			break;
+		case REQUIRES_PHYSICAL_PRESENCE:
+			bioscfg_drv.ordered_list_data[instance_id].requires_physical_presence = integer;
+			break;
+		case SEQUENCE:
+			bioscfg_drv.ordered_list_data[instance_id].sequence = integer;
+			break;
+		case PREREQUISITES_SIZE:
+			bioscfg_drv.ordered_list_data[instance_id].prerequisites_size = integer;
+			if (integer > MAX_PREREQUISITES_SIZE)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+
+			// PREREQUISITES:
+			elem++;
+			size = bioscfg_drv.ordered_list_data[instance_id].prerequisites_size;
+			for (reqs = 0; reqs < size && reqs < MAX_PREREQUISITES_SIZE; reqs++) {
+				ret = get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
+				if (ret < 0)
+					continue;
+
+				strscpy(bioscfg_drv.ordered_list_data[instance_id].prerequisites[reqs],
+					dst,
+					sizeof(bioscfg_drv.ordered_list_data[instance_id].prerequisites[reqs]));
+			}
+			break;
+		case SECURITY_LEVEL:
+			bioscfg_drv.ordered_list_data[instance_id].security_level = integer;
+			break;
+		case ORD_LIST_SIZE:
+			bioscfg_drv.ordered_list_data[instance_id].elements_size = integer;
+			if (integer > MAX_ELEMENTS_SIZE)
+				pr_warn("Ordered List size value exceeded the maximum number of elements supported or data may be malformed\n");
+
+			// ORD_LIST_ELEMENTS:
+			elem++;
+			size = bioscfg_drv.ordered_list_data[instance_id].elements_size;
+			for (values = 0; values < size && values < MAX_ELEMENTS_SIZE; values++) {
+				ret = get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
+				if (ret < 0)
+					continue;
+
+				strscpy(bioscfg_drv.ordered_list_data[instance_id].elements[values],
+					dst,
+					sizeof(bioscfg_drv.ordered_list_data[instance_id].elements)[values]);
+			}
+			break;
+		default:
+			pr_warn("Invalid element: %d found in Ordered list attribute or data may be malformed\n", elem);
+			break;
+		}
+	}
+	kfree(dst);
+
+	return 0;
+}
+
+
+/*
+ * exit_ordered_list_attributes() - Clear all attribute data
+ *
+ * Clears all data allocated for this group of attributes
+ */
+void exit_ordered_list_attributes(void)
+{
+	int instance_id;
+
+	for (instance_id = 0; instance_id < bioscfg_drv.ordered_list_instances_count; instance_id++) {
+		if (bioscfg_drv.ordered_list_data[instance_id].attr_name_kobj)
+			sysfs_remove_group(bioscfg_drv.ordered_list_data[instance_id].attr_name_kobj,
+					   &ordered_list_attr_group);
+	}
+	bioscfg_drv.ordered_list_instances_count = 0;
+
+	kfree(bioscfg_drv.ordered_list_data);
+	bioscfg_drv.ordered_list_data = NULL;
+}
diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
new file mode 100644
index 000000000000..a627b90e5f28
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -0,0 +1,676 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to password object type attributes under
+ * BIOS PASSWORD for use with hp-bioscfg driver.
+ *
+ *  Copyright (c) 2022 HP Development Company, L.P.
+ */
+
+#include "bioscfg.h"
+#include <asm-generic/posix_types.h>
+
+get_instance_id(password);
+
+/*
+ * Clear all passwords copied to memory for a particular
+ * authentication instance
+*/
+int clear_passwords(const int instance)
+{
+	if (!bioscfg_drv.password_data[instance].is_enabled)
+		return 0;
+
+	memset(bioscfg_drv.password_data[instance].current_password,
+	       0, sizeof(bioscfg_drv.password_data[instance].current_password));
+	memset(bioscfg_drv.password_data[instance].new_password,
+	       0, sizeof(bioscfg_drv.password_data[instance].new_password));
+
+	return 0;
+}
+
+/*
+ * Clear all credentials copied to memory for both Power-ON and Setup
+ * BIOS instances
+*/
+int clear_all_credentials(void)
+{
+	int instance;
+
+	/* clear all passwords */
+	for (instance = 0; instance < bioscfg_drv.password_instances_count; instance++)
+		clear_passwords(instance);
+
+	/* clear auth_token */
+	kfree(bioscfg_drv.spm_data.auth_token);
+	bioscfg_drv.spm_data.auth_token = NULL;
+
+	return 0;
+}
+
+int get_password_instance_for_type(const char *name)
+{
+	int count = bioscfg_drv.password_instances_count;
+	int instance;
+
+	for (instance = 0; instance < count; instance++) {
+		if (strcmp(bioscfg_drv.password_data[instance].display_name, name) == 0)
+			return instance;
+	}
+	return -EINVAL;
+}
+
+int validate_password_input(int instance_id, const char *buf)
+{
+	int length;
+
+	length = strlen(buf);
+	if (buf[length-1] == '\n')
+		length--;
+
+	if (length > MAX_PASSWD_SIZE)
+		return INVALID_BIOS_AUTH;
+
+	if (bioscfg_drv.password_data[instance_id].min_password_length > length ||
+	    bioscfg_drv.password_data[instance_id].max_password_length < length)
+		return INVALID_BIOS_AUTH;
+	return SUCCESS;
+}
+
+int password_is_set(const char *name)
+{
+	int id;
+
+	id = get_password_instance_for_type(name);
+	if (id < 0)
+		return 0;
+
+	return bioscfg_drv.password_data[id].is_enabled;
+}
+
+attribute_n_property_show(is_enabled, password);
+static struct kobj_attribute password_is_password_set = __ATTR_RO(is_enabled);
+
+static ssize_t current_password_store(struct kobject *kobj,
+				      struct kobj_attribute *attr,
+				      const char *buf, size_t count)
+{
+	char *p, *buf_cp;
+	int id, ret = 0;
+
+	buf_cp = kstrdup(buf, GFP_KERNEL);
+	if (!buf_cp) {
+		ret = -ENOMEM;
+		goto exit_current_password;
+	}
+
+	p = memchr(buf_cp, '\n', count);
+
+	if (p != NULL)
+		*p = '\0';
+
+	id = get_password_instance_id(kobj);
+
+	if (id >= 0)
+		ret = validate_password_input(id, buf_cp);
+
+	if (!ret) {
+		strscpy(bioscfg_drv.password_data[id].current_password,
+			buf_cp,
+			sizeof(bioscfg_drv.password_data[id].current_password));
+		/*
+		 * set pending reboot flag depending on
+		 * "RequiresPhysicalPresence" value
+		 */
+		if (bioscfg_drv.password_data[id].requires_physical_presence)
+			bioscfg_drv.pending_reboot = TRUE;
+	}
+
+exit_current_password:
+	kfree(buf_cp);
+	return ret ? ret : count;
+}
+static struct kobj_attribute password_current_password = __ATTR_WO(current_password);
+
+static ssize_t new_password_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	char *p, *buf_cp = NULL;
+	int id, ret = -EIO;
+
+	buf_cp = kstrdup(buf, GFP_KERNEL);
+	if (!buf_cp) {
+		ret = -ENOMEM;
+		goto exit_new_password;
+	}
+
+	p = memchr(buf_cp, '\n', count);
+
+	if (p != NULL)
+		*p = '\0';
+
+	id = get_password_instance_id(kobj);
+
+	if (id >= 0)
+		ret = validate_password_input(id, buf_cp);
+
+	if (!ret)
+		strscpy(bioscfg_drv.password_data[id].new_password,
+			buf_cp,
+			sizeof(bioscfg_drv.password_data[id].new_password));
+
+	if (!ret)
+		ret = hp_set_attribute(kobj->name, buf_cp);
+
+exit_new_password:
+	/*
+	 * Regardless of the results both new and current passwords
+	 * will be set to zero and avoid security issues
+	 */
+	clear_passwords(id);
+
+	kfree(buf_cp);
+	return ret ? ret : count;
+}
+
+static struct kobj_attribute password_new_password = __ATTR_WO(new_password);
+
+
+attribute_n_property_show(min_password_length, password);
+static struct kobj_attribute password_min_password_length = __ATTR_RO(min_password_length);
+
+attribute_n_property_show(max_password_length, password);
+static struct kobj_attribute password_max_password_length = __ATTR_RO(max_password_length);
+
+static ssize_t role_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	if (strcmp(kobj->name, SETUP_PASSWD) == 0)
+		return sysfs_emit(buf, "%s\n", role_type[BIOS_ADMIN]);
+
+	if (strcmp(kobj->name, POWER_ON_PASSWD) == 0)
+		return sysfs_emit(buf,  "%s\n", role_type[POWER_ON]);
+
+	return -EIO;
+}
+static struct kobj_attribute password_role = __ATTR_RO(role);
+
+static ssize_t mechanism_show(struct kobject *kobj, struct kobj_attribute *attr,
+			   char *buf)
+{
+	int i = get_password_instance_id(kobj);
+
+	if (i < 0)
+		return i;
+
+	if (bioscfg_drv.password_data[i].mechanism != PASSWORD)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%s\n",
+			  passwd_mechanism_types[bioscfg_drv.password_data[i].mechanism]);
+}
+static struct kobj_attribute password_mechanism = __ATTR_RO(mechanism);
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "password\n");
+}
+static struct kobj_attribute password_type = __ATTR_RO(type);
+
+attribute_s_property_show(display_name, password);
+static struct kobj_attribute password_display_name =
+		__ATTR_RO(display_name);
+
+attribute_s_property_show(display_name_language_code, password);
+static struct kobj_attribute password_display_langcode =
+		__ATTR_RO(display_name_language_code);
+
+attribute_n_property_show(prerequisites_size, password);
+static struct kobj_attribute  password_prerequisites_size_val =
+		__ATTR_RO(prerequisites_size);
+
+attribute_values_property_show(prerequisites, password);
+static struct kobj_attribute  password_prerequisites_val =
+		__ATTR_RO(prerequisites);
+
+attribute_n_property_show(encodings_size, password);
+static struct kobj_attribute  password_encodings_size_val =
+		__ATTR_RO(encodings_size);
+
+attribute_values_property_show(encodings, password);
+static struct kobj_attribute  password_encodings_val =
+		__ATTR_RO(encodings);
+
+
+static struct attribute *password_attrs[] = {
+	&password_is_password_set.attr,
+	&password_min_password_length.attr,
+	&password_max_password_length.attr,
+	&password_current_password.attr,
+	&password_new_password.attr,
+	&password_role.attr,
+	&password_mechanism.attr,
+	&password_type.attr,
+	&password_display_name.attr,
+	&password_display_langcode.attr,
+	&password_prerequisites_size_val.attr,
+	&password_prerequisites_val.attr,
+	&password_encodings_val.attr,
+	&password_encodings_size_val.attr,
+	NULL,
+};
+
+static const struct attribute_group bios_password_attr_group = {
+	.attrs = password_attrs,
+};
+
+static const struct attribute_group system_password_attr_group = {
+	.attrs = password_attrs,
+};
+
+int alloc_password_data(void)
+{
+	int ret = 0;
+
+	bioscfg_drv.password_instances_count = get_instance_count(HP_WMI_BIOS_PASSWORD_GUID);
+	bioscfg_drv.password_data = kcalloc(bioscfg_drv.password_instances_count,
+					    sizeof(struct password_data), GFP_KERNEL);
+	if (!bioscfg_drv.password_data) {
+		bioscfg_drv.password_instances_count = 0;
+		ret = -ENOMEM;
+	}
+
+	return ret;
+}
+
+/*
+ * populate_password_package_data -
+ *	Populate all properties for an instance under password attribute
+ *
+ * @password_obj: ACPI object with password data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int populate_password_package_data(union acpi_object *password_obj, int instance_id,
+				   struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.password_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	populate_password_elements_from_package(password_obj,
+						password_obj->package.count,
+						instance_id,
+						HPWMI_PASSWORD_TYPE);
+
+	if (strcmp(attr_name_kobj->name, "Setup Password") == 0) {
+		/* Save  system authentication instance for easy access */
+		return sysfs_create_group(attr_name_kobj, &bios_password_attr_group);
+	}
+
+	return sysfs_create_group(attr_name_kobj, &system_password_attr_group);
+}
+
+/* Expected Values types associated with each element */
+static acpi_object_type expected_password_types[] = {
+	[NAME] = ACPI_TYPE_STRING,
+	[VALUE] = ACPI_TYPE_STRING,
+	[PATH] = ACPI_TYPE_STRING,
+	[IS_READONLY] = ACPI_TYPE_INTEGER,
+	[DISPLAY_IN_UI] = ACPI_TYPE_INTEGER,
+	[REQUIRES_PHYSICAL_PRESENCE] = ACPI_TYPE_INTEGER,
+	[SEQUENCE] = ACPI_TYPE_INTEGER,
+	[PREREQUISITES_SIZE] = ACPI_TYPE_INTEGER,
+	[PREREQUISITES] = ACPI_TYPE_STRING,
+	[SECURITY_LEVEL] = ACPI_TYPE_INTEGER,
+	[PSWD_MIN_LENGTH] = ACPI_TYPE_INTEGER,
+	[PSWD_MAX_LENGTH] = ACPI_TYPE_INTEGER,
+	[PSWD_SIZE] = ACPI_TYPE_INTEGER,
+	[PSWD_ENCODINGS] = ACPI_TYPE_STRING,
+	[PSWD_IS_SET] = ACPI_TYPE_INTEGER
+};
+
+
+int populate_password_elements_from_package(union acpi_object *password_obj,
+					    int password_obj_count,
+					    int instance_id,
+					    enum hp_wmi_data_type type)
+{
+	char *str_value = NULL;
+	int value_len;
+	int ret = 0;
+	u32 size = 0;
+	u32 int_value;
+	int elem = 0;
+	int reqs;
+	int eloc;
+	int pos_values;
+
+
+	if (!password_obj)
+		return -EINVAL;
+
+	strscpy(bioscfg_drv.password_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.password_data[instance_id].display_name_language_code));
+
+	for (elem = 1, eloc = 1; elem < password_obj_count; elem++, eloc++) {
+
+		/* ONLY look at the first 'hp_wmi_elements_count[type]' elements */
+		if (eloc == hp_wmi_elements_count[type])
+			goto exit_password_package;
+
+		switch (password_obj[elem].type) {
+		case ACPI_TYPE_STRING:
+
+			if (PREREQUISITES != elem && PSWD_ENCODINGS != elem) {
+				ret = convert_hexstr_to_str(password_obj[elem].string.pointer,
+							    password_obj[elem].string.length,
+							    &str_value, &value_len);
+				if (ret)
+					continue;
+			}
+			break;
+		case ACPI_TYPE_INTEGER:
+			int_value = (u32)password_obj[elem].integer.value;
+			break;
+		default:
+			pr_warn("Unsupported object type [%d]\n", password_obj[elem].type);
+			continue;
+		}
+
+		/* Check that both expected and read object type match */
+		if (expected_password_types[eloc] != password_obj[elem].type) {
+			pr_err("Error expected type %d for elem  %d, but got type %d instead\n",
+			       expected_password_types[eloc], elem, password_obj[elem].type);
+			return -EIO;
+		}
+
+		/* Assign appropriate element value to corresponding field*/
+		switch (eloc) {
+		case VALUE:
+			break;
+		case PATH:
+			strscpy(bioscfg_drv.password_data[instance_id].path, str_value,
+				sizeof(bioscfg_drv.password_data[instance_id].path));
+			break;
+		case IS_READONLY:
+			bioscfg_drv.password_data[instance_id].is_readonly = int_value;
+			break;
+		case DISPLAY_IN_UI:
+			bioscfg_drv.password_data[instance_id].display_in_ui = int_value;
+			break;
+		case REQUIRES_PHYSICAL_PRESENCE:
+			bioscfg_drv.password_data[instance_id].requires_physical_presence = int_value;
+			break;
+		case SEQUENCE:
+			bioscfg_drv.password_data[instance_id].sequence = int_value;
+			break;
+		case PREREQUISITES_SIZE:
+			bioscfg_drv.password_data[instance_id].prerequisites_size = int_value;
+			if (int_value > MAX_PREREQUISITES_SIZE)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+			/*
+			 * This HACK is needed to keep the expected
+			 * element list pointing to the right obj[elem].type
+			 * when the size is zero.  PREREQUISITES
+			 * object is omitted by BIOS when the size is
+			 * zero.
+			 */
+			if (int_value == 0)
+				eloc++;
+			break;
+		case PREREQUISITES:
+			size = bioscfg_drv.password_data[instance_id].prerequisites_size;
+
+			for (reqs = 0; reqs < size; reqs++) {
+				ret = convert_hexstr_to_str(password_obj[elem + reqs].string.pointer,
+							    password_obj[elem + reqs].string.length,
+							    &str_value, &value_len);
+
+				if (ret)
+					break;
+
+				strscpy(bioscfg_drv.password_data[instance_id].prerequisites[reqs],
+					str_value,
+					sizeof(bioscfg_drv.password_data[instance_id].prerequisites[reqs]));
+
+				kfree(str_value);
+				str_value = NULL;
+			}
+			break;
+
+		case SECURITY_LEVEL:
+			bioscfg_drv.password_data[instance_id].security_level = int_value;
+			break;
+
+		case PSWD_MIN_LENGTH:
+			bioscfg_drv.password_data[instance_id].min_password_length = int_value;
+			break;
+		case PSWD_MAX_LENGTH:
+			bioscfg_drv.password_data[instance_id].max_password_length = int_value;
+			break;
+		case PSWD_SIZE:
+			bioscfg_drv.password_data[instance_id].encodings_size = int_value;
+			if (int_value > MAX_ENCODINGS_SIZE)
+				pr_warn("Password Encoding size value exceeded the maximum number of elements supported or data may be malformed\n");
+
+			/*
+			 * This HACK is needed to keep the expected
+			 * element list pointing to the right obj[elem].type
+			 * when the size is zero. PSWD_ENCODINGS
+			 * object is omitted by BIOS when the size is
+			 * zero.
+			 */
+			if (int_value == 0)
+				eloc++;
+			break;
+
+		case PSWD_ENCODINGS:
+			size = bioscfg_drv.password_data[instance_id].encodings_size;
+
+			for (pos_values = 0; pos_values < size && pos_values < MAX_ENCODINGS_SIZE; pos_values++) {
+				ret = convert_hexstr_to_str(password_obj[elem + pos_values].string.pointer,
+							    password_obj[elem + pos_values].string.length,
+							    &str_value, &value_len);
+				if (ret)
+					break;
+
+				strscpy(bioscfg_drv.password_data[instance_id].encodings[pos_values],
+					str_value,
+					sizeof(bioscfg_drv.password_data[instance_id].encodings[pos_values]));
+				kfree(str_value);
+				str_value = NULL;
+			}
+			break;
+		case PSWD_IS_SET:
+			bioscfg_drv.password_data[instance_id].is_enabled = int_value;
+			break;
+
+		default:
+			pr_warn("Invalid element: %d found in Password attribute or data may be malformed\n", elem);
+			break;
+		}
+		kfree(str_value);
+		str_value = NULL;
+	}
+
+exit_password_package:
+	kfree(str_value);
+	str_value = NULL;
+	return 0;
+}
+
+/*
+ * populate_password_buffer_data -
+ * Populate all properties for an instance under password object attribute
+ *
+ * @buffer_ptr: Buffer pointer
+ * @buffer_size: Buffer size
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int populate_password_buffer_data(u8 *buffer_ptr, int *buffer_size, int instance_id,
+				  struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.password_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	/* Populate Password attributes */
+	populate_password_elements_from_buffer(buffer_ptr, buffer_size,
+					       instance_id, HPWMI_PASSWORD_TYPE);
+	friendly_user_name_update(bioscfg_drv.password_data[instance_id].path,
+				  attr_name_kobj->name,
+				  bioscfg_drv.password_data[instance_id].display_name,
+				  sizeof(bioscfg_drv.password_data[instance_id].display_name));
+	if (strcmp(attr_name_kobj->name, "Setup Password") == 0)
+		return sysfs_create_group(attr_name_kobj, &bios_password_attr_group);
+
+	return sysfs_create_group(attr_name_kobj, &system_password_attr_group);
+}
+
+int populate_password_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
+					   int instance_id,
+					   enum hp_wmi_data_type type)
+{
+	int ret;
+	char *dst = NULL;
+	int elem;
+	int reqs;
+	int integer;
+	int size = 0;
+	int values;
+	int dst_size = *buffer_size / sizeof(u16);
+
+	dst = kcalloc(dst_size, sizeof(char), GFP_KERNEL);
+	if (!dst)
+		return -ENOMEM;
+
+	elem = 0;
+	strscpy(bioscfg_drv.password_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.password_data[instance_id].display_name_language_code));
+
+	for (elem = 1; elem < 3; elem++) {
+
+		ret = get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
+		if (ret < 0)
+			continue;
+
+		switch (elem) {
+		case VALUE:
+			strscpy(bioscfg_drv.password_data[instance_id].current_password,
+				dst, sizeof(bioscfg_drv.password_data[instance_id].current_password));
+			break;
+		case PATH:
+			strscpy(bioscfg_drv.password_data[instance_id].path, dst,
+				sizeof(bioscfg_drv.password_data[instance_id].path));
+			break;
+		default:
+			pr_warn("Invalid element: %d found in Password  attribute or data may be malformed\n", elem);
+			break;
+		}
+	}
+
+	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
+
+		if (elem != PREREQUISITES  && elem != PSWD_ENCODINGS) {
+			ret = get_integer_from_buffer((int **)&buffer_ptr, buffer_size, (int *)&integer);
+			if (ret)
+				continue;
+		}
+
+		switch (elem) {
+		case IS_READONLY:
+			bioscfg_drv.password_data[instance_id].is_readonly = integer;
+			break;
+		case DISPLAY_IN_UI:
+			bioscfg_drv.password_data[instance_id].display_in_ui = integer;
+			break;
+		case REQUIRES_PHYSICAL_PRESENCE:
+			bioscfg_drv.password_data[instance_id].requires_physical_presence = integer;
+			break;
+		case SEQUENCE:
+			bioscfg_drv.password_data[instance_id].sequence = integer;
+			break;
+		case PREREQUISITES_SIZE:
+			bioscfg_drv.password_data[instance_id].prerequisites_size = integer;
+			if (integer > MAX_PREREQUISITES_SIZE)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+
+			// PREREQUISITES:
+			elem++;
+			size = bioscfg_drv.password_data[instance_id].prerequisites_size;
+			for (reqs = 0; reqs < size && reqs > MAX_PREREQUISITES_SIZE; reqs++) {
+				ret = get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
+				if (ret < 0)
+					continue;
+
+				strscpy(bioscfg_drv.password_data[instance_id].prerequisites[reqs],
+					dst,
+					sizeof(bioscfg_drv.password_data[instance_id].prerequisites[reqs]));
+			}
+			break;
+		case SECURITY_LEVEL:
+			bioscfg_drv.password_data[instance_id].security_level = integer;
+			break;
+
+		case PSWD_MIN_LENGTH:
+			bioscfg_drv.password_data[instance_id].min_password_length = integer;
+			break;
+		case PSWD_MAX_LENGTH:
+			bioscfg_drv.password_data[instance_id].max_password_length = integer;
+			break;
+		case PSWD_SIZE:
+			bioscfg_drv.password_data[instance_id].encodings_size = integer;
+			if (integer > MAX_ENCODINGS_SIZE)
+				pr_warn("Password Encoding size value exceeded the maximum number of elements supported or data may be malformed\n");
+
+			// PSWD_ENCODINGS:
+			elem++;
+			size = bioscfg_drv.password_data[instance_id].encodings_size;
+			for (values = 0; values < size && values < MAX_ENCODINGS_SIZE; values++) {
+				ret = get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
+				if (ret < 0)
+					continue;
+
+				strscpy(bioscfg_drv.password_data[instance_id].encodings[values],
+					dst,
+					sizeof(bioscfg_drv.password_data[instance_id].encodings[values]));
+
+			}
+			break;
+		case PSWD_IS_SET:
+			bioscfg_drv.password_data[instance_id].is_enabled = integer;
+			break;
+		default:
+			pr_warn("Invalid element: %d found in Password  attribute or data may be malformed\n", elem);
+			break;
+		}
+	}
+	kfree(dst);
+
+	return 0;
+}
+
+/*
+ * exit_password_attributes() - Clear all attribute data
+ *
+ * Clears all data allocated for this group of attributes
+ */
+void exit_password_attributes(void)
+{
+	int instance_id;
+
+	for (instance_id = 0; instance_id < bioscfg_drv.password_instances_count; instance_id++) {
+		if (bioscfg_drv.password_data[instance_id].attr_name_kobj) {
+			if (strcmp(bioscfg_drv.password_data[instance_id].attr_name_kobj->name, SETUP_PASSWD) == 0)
+				sysfs_remove_group(bioscfg_drv.password_data[instance_id].attr_name_kobj,
+						   &bios_password_attr_group);
+			else
+				sysfs_remove_group(bioscfg_drv.password_data[instance_id].attr_name_kobj,
+						   &system_password_attr_group);
+		}
+	}
+	bioscfg_drv.password_instances_count = 0;
+	kfree(bioscfg_drv.password_data);
+	bioscfg_drv.password_data = NULL;
+}
-- 
2.34.1

