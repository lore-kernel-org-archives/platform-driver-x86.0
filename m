Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3C8C43217
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 Oct 2022 20:10:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbiJTUKp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 20 Oct 2022 16:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbiJTUKo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Oct 2022 16:10:44 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4365713A7E2
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Oct 2022 13:10:38 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id u15so909775oie.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Oct 2022 13:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMUQz4mXDasyWr2whDWg1IObmPzEdSn18J66ey/Bo6o=;
        b=CPK9c9mewislEG/Ubv2NsacNXGZ5VY6k9XPmcZBZqGgtgUbWnLKSVcVBb12wpvTFeO
         tCU+f2DtEB4XXkdjQ+l5CIBEFgJBpUEyLIsD3bnYi/TGsf4NHAF8m52c9xHf1sMl92Xj
         x3AAmUGboH/F8W/Umy34ul4YE2zaidPVaMpP1bJ0XuyFvG8+d6cw0KM8RZFur03on0yo
         bu6WjwnFrgmoPC5yqCxGLN7icnH/AKVxUZUKWTxSxdfPw3ZugtdyfcBvpF+gZEZ1eB2w
         ae3V1+U8ApiilLd1Q4MKdxKI3c0qHv7RTABZ3kNEAIrYMQZlbbFY/3wcyy+bLGCtqjiL
         drHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMUQz4mXDasyWr2whDWg1IObmPzEdSn18J66ey/Bo6o=;
        b=tm9LKFvJbBL7Nc2QMHkMxDv+jfIurUvEBm877ZpgOqlkVzgTNyrPt0/fMyxD3qG6lj
         QsjlNSkGvL0IAHEoHUAq9MWvCAgoq6xRu0iTnUON5949aWNFsJUsEk9sbWjIQmgxdSRc
         Pd2FK9FVUhBhS1tGR+1oRehukEDuQOJP9sZVm6eG0XnjvDBEpEG54jb3Za5c/tru1mcU
         LM3PnjycW7nwmGeQ6jTObPW8yELPcqLQgwGNJU47YaEU5RX4CGV1bes6jsdpYO8g7sCw
         hvHGEiXJb88N3O2LFCNscWtgPpBoaPDZjuoBqshNDrSDR5/uOKTDgttaHmvucv8+CtiV
         +Lng==
X-Gm-Message-State: ACrzQf2H5XOO8hWQRPQpkzyo+yZ2szAdqlnv/w3doGo7BYPtAOCuF4mB
        WcCMfNaRXNg9RdqQJXRiLHIVPUmSNKU=
X-Google-Smtp-Source: AMsMyM6m9Gcl4Wl9/oMHe1PzSxBIvoJhWpjQFOUEmiDHrzx/LQ58Lk3FgTh6bRoKmQYOUVXouJwdSw==
X-Received: by 2002:a05:6808:23d4:b0:354:e81a:127f with SMTP id bq20-20020a05680823d400b00354e81a127fmr21339475oib.164.1666296637974;
        Thu, 20 Oct 2022 13:10:37 -0700 (PDT)
Received: from grumpy-Fury.hsd1.tx.comcast.net ([2601:2c3:480:7390:ece5:3818:e03c:2cb7])
        by smtp.gmail.com with ESMTPSA id a25-20020a544e19000000b003539686cb7bsm302896oiy.53.2022.10.20.13.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 13:10:37 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 3/6] HP BIOSCFG driver - set 2
Date:   Thu, 20 Oct 2022 15:10:30 -0500
Message-Id: <20221020201033.12790-4-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020201033.12790-1-jorge.lopez2@hp.com>
References: <20221020201033.12790-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose for this patch is submit HP BIOSCFG driver to be list of
HP Linux kernel drivers.  The driver include a total of 12 files
broken in several patches.  This is set 2 of 4.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 .../x86/hp/hp-bioscfg/int-attributes.c        | 478 ++++++++++++++
 .../x86/hp/hp-bioscfg/ordered-attributes.c    | 586 ++++++++++++++++++
 .../x86/hp/hp-bioscfg/passwdattr-interface.c  |  50 ++
 3 files changed, 1114 insertions(+)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c

diff --git a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
new file mode 100644
index 000000000000..dc295ac4f83a
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
@@ -0,0 +1,478 @@
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
+	union acpi_object *obj = NULL;
+	ssize_t ret;
+
+	if (instance_id < 0)
+		return instance_id;
+
+	/* need to use specific instance_id and guid combination to get right data */
+	obj = get_wmiobj_pointer(instance_id, HP_WMI_BIOS_INTEGER_GUID);
+	if (!obj) {
+		ret = -EIO;
+		goto current_value_show_out;
+	}
+
+	ret = snprintf(buf, PAGE_SIZE, "%d\n",  bioscfg_drv.integer_data[instance_id].current_value);
+
+current_value_show_out:
+	kfree(obj);
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
+	ret = kstrtoint(buf, 10, &in_val);
+
+	/* BIOS treats it as a read only attribute */
+	if (bioscfg_drv.integer_data[instance_id].is_readonly)
+		return -EIO;
+
+	if (in_val < bioscfg_drv.integer_data[instance_id].lower_bound ||
+			in_val > bioscfg_drv.integer_data[instance_id].upper_bound)
+		return -EINVAL;
+
+	bioscfg_drv.integer_data[instance_id].new_value = in_val;
+	/*
+	 * set pending reboot flag depending on
+	 * "RequiresPhysicalPresence" value
+	 */
+	if (bioscfg_drv.integer_data[instance_id].requires_physical_presence)
+		bioscfg_drv.pending_reboot = TRUE;
+	return 0;
+}
+
+static void update_integer_value(int instance_id)
+{
+	bioscfg_drv.integer_data[instance_id].current_value =
+		bioscfg_drv.integer_data[instance_id].new_value;
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
+	__ATTR_RW_MODE(current_value, 0600);
+
+attribute_n_property_show(lower_bound, integer);
+static struct kobj_attribute integer_lower_bound =
+	__ATTR_RO(lower_bound);
+
+attribute_n_property_show(upper_bound, integer);
+static struct kobj_attribute integer_upper_bound =
+	__ATTR_RO(upper_bound);
+
+attribute_n_property_show(scalar_increment, integer);
+static struct kobj_attribute integer_scalar_increment =
+	__ATTR_RO(scalar_increment);
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sprintf(buf, "integer\n");
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
+					sizeof(struct integer_data), GFP_KERNEL);
+	if (!bioscfg_drv.integer_data) {
+		bioscfg_drv.integer_instances_count = 0;
+		ret = -ENOMEM;
+	}
+	return ret;
+}
+
+/*
+ * populate_int_data() -
+ * Populate all properties of an instance under integer attribute
+ *
+ * @elements: ACPI object with integer data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int populate_integer_package_data(union acpi_object *elements, int instance_id,
+			struct kobject *attr_name_kobj)
+{
+	char *str_value = NULL;
+	int str_len;
+	int ret = 0;
+
+	bioscfg_drv.integer_data[instance_id].type = HPWMI_INTEGER_TYPE;
+	bioscfg_drv.integer_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	ret = convert_hexstr_to_str(&(elements[NAME].string.pointer),
+				       elements[NAME].string.length,
+				       &str_value, &str_len);
+	if (ACPI_FAILURE(ret)) {
+		kfree(str_value);
+		return ret;
+	}
+
+	strscpy(bioscfg_drv.integer_data[instance_id].attribute_name,
+		str_value,
+		sizeof(bioscfg_drv.integer_data[instance_id].attribute_name));
+	strscpy(bioscfg_drv.integer_data[instance_id].display_name,
+		str_value,
+		sizeof(bioscfg_drv.integer_data[instance_id].display_name));
+	kfree(str_value);
+	str_value = NULL;
+
+	populate_integer_elements_from_package(elements, instance_id, HPWMI_INTEGER_TYPE);
+	update_attribute_permissions(bioscfg_drv.integer_data[instance_id].is_readonly,
+				    &integer_current_val);
+	friendly_user_name_update(bioscfg_drv.integer_data[instance_id].path,
+				  attr_name_kobj->name,
+				   bioscfg_drv.integer_data[instance_id].display_name,
+				   sizeof(bioscfg_drv.integer_data[instance_id].display_name));
+	return sysfs_create_group(attr_name_kobj, &integer_attr_group);
+}
+
+int populate_integer_elements_from_package(union acpi_object *elements,
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
+	strscpy(bioscfg_drv.integer_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.integer_data[instance_id].display_name_language_code));
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
+		/*
+		 * Stop if extra counter is greater than total number
+		 * of elements for integer type.
+		 */
+		if (eloc == hp_wmi_elements_count[type])
+			goto exit_integer_package;
+
+		/* Assign appropriate element value to corresponding field*/
+		switch (eloc) {
+		case VALUE:
+			status = kstrtoint(str_value, 10, &int_value);
+			if (status)
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
+		case PREREQUISITE_SIZE:
+			bioscfg_drv.integer_data[instance_id].prerequisitesize = int_value;
+
+			if (int_value > 20)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+			/*
+			 * prerequisites element is omitted when
+			 * prerequisitesSize value is zero.
+			 */
+			if (int_value == 0)
+				eloc++;
+			break;
+		case PREREQUISITES:
+			size = bioscfg_drv.integer_data[instance_id].prerequisitesize;
+			for (reqs = 0; reqs < size; reqs++) {
+				status = convert_hexstr_to_str(&elements[elem].string.pointer,
+							       elements[elem].string.length,
+							       &str_value, &value_len);
+
+				if (ACPI_FAILURE(status))
+					continue;
+
+				strlcat(bioscfg_drv.integer_data[instance_id].prerequisites,
+					str_value,
+					sizeof(bioscfg_drv.integer_data[instance_id].prerequisites));
+				if (reqs != (size - 1))
+					strlcat(bioscfg_drv.integer_data[instance_id].prerequisites, ";",
+						sizeof(bioscfg_drv.integer_data[instance_id].prerequisites));
+
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
+
+		default:
+			pr_warn("Invalid element: %d found in Integer attribute or data may be malformed\n", elem);
+			break;
+		}
+		kfree(str_value);
+		str_value = NULL;
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
+ * @integer_obj: ACPI object with integer data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int populate_integer_buffer_data(union acpi_object *integer_obj, int instance_id,
+			struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.integer_data[instance_id].type = HPWMI_INTEGER_TYPE;
+	bioscfg_drv.integer_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	strscpy(bioscfg_drv.integer_data[instance_id].attribute_name,
+		attr_name_kobj->name,
+		sizeof(bioscfg_drv.integer_data[instance_id].attribute_name));
+
+	strscpy(bioscfg_drv.integer_data[instance_id].display_name,
+		attr_name_kobj->name,
+		sizeof(bioscfg_drv.integer_data[instance_id].display_name));
+
+	/* Populate integer elements */
+	populate_integer_elements_from_buffer(integer_obj, instance_id, HPWMI_INTEGER_TYPE);
+	update_attribute_permissions(bioscfg_drv.integer_data[instance_id].is_readonly,
+				    &integer_current_val);
+	friendly_user_name_update(bioscfg_drv.integer_data[instance_id].path,
+				  attr_name_kobj->name,
+				   bioscfg_drv.integer_data[instance_id].display_name,
+				   sizeof(bioscfg_drv.integer_data[instance_id].display_name));
+
+	return sysfs_create_group(attr_name_kobj, &integer_attr_group);
+}
+
+int populate_integer_elements_from_buffer(union acpi_object *integer_obj,
+					  int instance_id, enum hp_wmi_data_type type)
+{
+	int status;
+	char *str = NULL;
+	int elem;
+	int reqs;
+	int integer;
+	int size = 0;
+	int ret;
+
+	elem = 0;
+	strscpy(bioscfg_drv.integer_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.integer_data[instance_id].display_name_language_code));
+
+	for (elem = 1; elem < 3; elem++) {
+
+		status = get_string_from_buffer((u16 **)&integer_obj->buffer.pointer, &str);
+		if (ACPI_FAILURE(status))
+			continue;
+
+		switch (elem) {
+		case VALUE:
+			ret = kstrtoint(str, 10, &integer);
+			if (ret)
+				continue;
+
+			bioscfg_drv.integer_data[instance_id].current_value = integer;
+			break;
+		case PATH:
+			strscpy(bioscfg_drv.integer_data[instance_id].path, str,
+				sizeof(bioscfg_drv.integer_data[instance_id].path));
+			break;
+		default:
+			pr_warn("Invalid element: %d found in Integer attribute or data may be malformed\n", elem);
+			break;
+		}
+		kfree(str);
+		str = NULL;
+	}
+
+	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
+
+		if (elem != PREREQUISITES)
+			status = get_integer_from_buffer((int **)&integer_obj->buffer.pointer, (int *)&integer);
+
+		if (ACPI_FAILURE(status))
+			continue;
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
+		case PREREQUISITE_SIZE:
+			bioscfg_drv.integer_data[instance_id].prerequisitesize = integer;
+			size = integer;
+			if (size > 20)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+
+			break;
+		case PREREQUISITES:
+			for (reqs = 0; reqs < size; reqs++) {
+				status = get_string_from_buffer((u16 **)&integer_obj->buffer.pointer, &str);
+				if (ACPI_FAILURE(status))
+					continue;
+
+				strlcat(bioscfg_drv.integer_data[instance_id].prerequisites,
+					str,
+					sizeof(bioscfg_drv.integer_data[instance_id].prerequisites));
+				if (reqs != (size - 1))
+					strlcat(bioscfg_drv.integer_data[instance_id].prerequisites, ";",
+						sizeof(bioscfg_drv.integer_data[instance_id].prerequisites));
+
+				kfree(str);
+				str = NULL;
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
+		kfree(str);
+		str = NULL;
+	}
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
+								&integer_attr_group);
+	}
+	bioscfg_drv.integer_instances_count = 0;
+
+	kfree(bioscfg_drv.integer_data);
+	bioscfg_drv.integer_data = NULL;
+}
diff --git a/drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
new file mode 100644
index 000000000000..603222c086a7
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
@@ -0,0 +1,586 @@
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
+	int instance_id = get_ordered_list_instance_id(kobj);
+	union acpi_object *obj = NULL;
+	ssize_t ret;
+
+	if (instance_id < 0)
+		return -EIO;
+
+	/* need to use specific instance_id and guid combination to get right data */
+	obj = get_wmiobj_pointer(instance_id, HP_WMI_BIOS_ORDERED_LIST_GUID);
+	if (!obj)
+		return -EIO;
+
+	ret = snprintf(buf, PAGE_SIZE, "%s\n",
+		       bioscfg_drv.ordered_list_data[instance_id].current_value);
+
+	kfree(obj);
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
+	char *options = NULL;
+	char *p;
+	int ret = 0;
+	int found = 0;
+	char *new_values = NULL;
+	char *value;
+	int elem;
+	int elem_found = 0;
+
+	options = kstrdup(bioscfg_drv.ordered_list_data[instance_id].elements,
+				 GFP_KERNEL);
+	new_values = kstrdup(buf, GFP_KERNEL);
+
+	if (!options || !new_values) {
+		ret = -ENOMEM;
+		goto validate_ordered_list_value_exit;
+	}
+
+	/* Is it a read only attribute */
+	if (bioscfg_drv.ordered_list_data[instance_id].is_readonly) {
+		ret = -EIO;
+		goto validate_ordered_list_value_exit;
+	}
+
+	/*
+	 * Changes to ordered list values require checking that new
+	 * values are found in the list of elements.
+	 */
+	for (elem = 0; elem < bioscfg_drv.ordered_list_data[instance_id].size; elem++) {
+
+		value = strsep(&new_values, ",");
+		if (value != NULL) {
+			if (!*value)
+				continue;
+			elem_found++;
+		}
+
+		while ((p = strsep(&options, ";")) != NULL) {
+			if (!*p)
+				continue;
+
+			if (!strcasecmp(p, value)) {
+				found = 1;
+				break;
+			}
+		}
+
+		if (!found) {
+			pr_warn("\"%s\" is not a valid ordered list element\n", value);
+			ret = -EINVAL;
+			goto validate_ordered_list_value_exit;
+		}
+	}
+
+	if (elem_found == bioscfg_drv.ordered_list_data[instance_id].size) {
+		pr_warn("Number of new values is not equal to number of ordered list elements (%d)\n",
+			bioscfg_drv.ordered_list_data[instance_id].size);
+		ret = -EINVAL;
+		goto validate_ordered_list_value_exit;
+	}
+
+validate_ordered_list_value_exit:
+	kfree(options);
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
+	if (ret < 0) {
+		ret = -EINVAL;
+		goto validate_ordered_list_exit;
+	}
+
+	strscpy(bioscfg_drv.ordered_list_data[instance_id].new_value,
+		buf,
+		sizeof(bioscfg_drv.ordered_list_data[instance_id].new_value));
+	/*
+	 * set pending reboot flag depending on
+	 * "RequiresPhysicalPresence" value
+	 */
+	if (bioscfg_drv.ordered_list_data[instance_id].requires_physical_presence)
+		bioscfg_drv.pending_reboot = TRUE;
+
+validate_ordered_list_exit:
+	return ret;
+}
+
+static void update_ordered_list_value(int instance_id)
+{
+	strscpy(bioscfg_drv.ordered_list_data[instance_id].current_value,
+		bioscfg_drv.ordered_list_data[instance_id].new_value,
+		sizeof(bioscfg_drv.ordered_list_data[instance_id].current_value));
+}
+
+attribute_s_property_show(display_name_language_code, ordered_list);
+static struct kobj_attribute ordered_list_display_langcode =
+		__ATTR_RO(display_name_language_code);
+
+attribute_s_property_show(display_name, ordered_list);
+static struct kobj_attribute ordered_list_display_name =
+		__ATTR_RO(display_name);
+
+attribute_property_store(current_value, ordered_list);
+static struct kobj_attribute ordered_list_current_val =
+		__ATTR_RW_MODE(current_value, 0600);
+
+attribute_s_property_show(elements, ordered_list);
+static struct kobj_attribute ordered_list_elements_val =
+		__ATTR_RO(elements);
+
+attribute_n_property_show(size, ordered_list);
+static struct kobj_attribute ordered_list_size_val =
+		__ATTR_RO(size);
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sprintf(buf, "ordered-list\n");
+}
+static struct kobj_attribute ordered_list_type =
+		__ATTR_RO(type);
+
+static struct attribute *ordered_list_attrs[] = {
+	&ordered_list_display_langcode.attr,
+	&ordered_list_display_name.attr,
+	&ordered_list_current_val.attr,
+	&ordered_list_elements_val.attr,
+	&ordered_list_size_val.attr,
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
+					sizeof(struct ordered_list_data), GFP_KERNEL);
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
+			struct kobject *attr_name_kobj)
+{
+	char *str_value = NULL;
+	int str_len;
+	int ret = 0;
+
+	bioscfg_drv.ordered_list_data[instance_id].type = HPWMI_ORDERED_LIST_TYPE;
+	bioscfg_drv.ordered_list_data[instance_id].attr_name_kobj = attr_name_kobj;
+	ret = convert_hexstr_to_str(&(order_obj[NAME].string.pointer),
+				       order_obj[NAME].string.length,
+				       &str_value, &str_len);
+
+	if (ACPI_FAILURE(ret)) {
+		kfree(str_value);
+		return ret;
+	}
+
+	strscpy(bioscfg_drv.ordered_list_data[instance_id].attribute_name,
+		str_value,
+		sizeof(bioscfg_drv.ordered_list_data[instance_id].attribute_name));
+	strscpy(bioscfg_drv.ordered_list_data[instance_id].display_name,
+		str_value,
+		sizeof(bioscfg_drv.ordered_list_data[instance_id].display_name));
+
+	kfree(str_value);
+	str_value = NULL;
+
+	populate_ordered_list_elements_from_package(order_obj, instance_id, HPWMI_ORDERED_LIST_TYPE);
+	update_attribute_permissions(bioscfg_drv.ordered_list_data[instance_id].is_readonly,
+				    &ordered_list_current_val);
+	friendly_user_name_update(bioscfg_drv.ordered_list_data[instance_id].path,
+				  attr_name_kobj->name,
+				   bioscfg_drv.ordered_list_data[instance_id].display_name,
+				  sizeof(bioscfg_drv.ordered_list_data[instance_id].display_name));
+	return sysfs_create_group(attr_name_kobj, &ordered_list_attr_group);
+}
+
+int populate_ordered_list_elements_from_package(union acpi_object *order_obj,
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
+	char *tmpstr = NULL;
+	char *part_tmp = NULL;
+	int tmp_len = 0;
+	char *part = NULL;
+
+	strscpy(bioscfg_drv.ordered_list_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.ordered_list_data[instance_id].display_name_language_code));
+
+	for (elem = 1, eloc = 1; elem < hp_wmi_elements_count[type]; elem++, eloc++) {
+
+		switch (order_obj[elem].type) {
+		case ACPI_TYPE_STRING:
+
+			if (elem != PREREQUISITES) {
+				status = convert_hexstr_to_str(&order_obj[elem].string.pointer,
+							       order_obj[elem].string.length,
+							       &str_value, &value_len);
+				if (ACPI_FAILURE(status))
+					continue;
+
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
+		/*
+		 * Stop if extra counter is greater than total number
+		 * of elements for ordered list type
+		 */
+		if (eloc == hp_wmi_elements_count[type])
+			goto exit_ordered_list_package;
+
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
+		case PREREQUISITE_SIZE:
+			bioscfg_drv.ordered_list_data[instance_id].prerequisitesize = int_value;
+			if (int_value > 20)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+			/*
+			 * prerequisites element is omitted when
+			 * prerequisitesSize value is zero.
+			 */
+			if (int_value == 0)
+				eloc++;
+			break;
+		case PREREQUISITES:
+			size = bioscfg_drv.ordered_list_data[instance_id].prerequisitesize;
+			for (reqs = 0; reqs < size; reqs++) {
+				status = convert_hexstr_to_str(&order_obj[elem].string.pointer,
+							       order_obj[elem].string.length,
+							       &str_value, &value_len);
+
+				if (ACPI_FAILURE(status))
+					continue;
+
+				strlcat(bioscfg_drv.ordered_list_data[instance_id].prerequisites,
+					str_value,
+					sizeof(bioscfg_drv.ordered_list_data[instance_id].prerequisites));
+
+				if (reqs != (size - 1))
+					strlcat(bioscfg_drv.ordered_list_data[instance_id].prerequisites, ";",
+						sizeof(bioscfg_drv.ordered_list_data[instance_id].prerequisites));
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
+			bioscfg_drv.ordered_list_data[instance_id].size = int_value;
+			break;
+		case ORD_LIST_ELEMENTS:
+			size = bioscfg_drv.ordered_list_data[instance_id].size;
+
+			/*
+			 * Ordered list data is stored in hex and comma separated format
+			 * Convert the data and split it to show each element
+			 */
+			status = convert_hexstr_to_str(&str_value, value_len, &tmpstr, &tmp_len);
+			if (ACPI_FAILURE(status))
+				goto exit_ordered_list_package;
+
+			part_tmp = tmpstr;
+			part = strsep(&part_tmp, ",");
+			if (!part)
+				strscpy(bioscfg_drv.ordered_list_data[instance_id].elements,
+					tmpstr, sizeof(bioscfg_drv.ordered_list_data[instance_id].elements));
+
+			while (part) {
+				strlcat(bioscfg_drv.ordered_list_data[instance_id].elements,
+					part, sizeof(bioscfg_drv.ordered_list_data[instance_id].elements));
+
+				part = strsep(&part_tmp, ",");
+				if (part)
+					strlcat(bioscfg_drv.ordered_list_data[instance_id].elements, ";",
+						sizeof(bioscfg_drv.ordered_list_data[instance_id].elements));
+			}
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
+ * @order_obj: ACPI object with enumeration data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ * @enum_property_count: Total properties count under ordered list type
+ */
+int populate_ordered_list_buffer_data(union acpi_object *order_obj, int instance_id,
+			struct kobject *attr_name_kobj)
+{
+
+	bioscfg_drv.ordered_list_data[instance_id].type = HPWMI_ORDERED_LIST_TYPE;
+	bioscfg_drv.ordered_list_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	strscpy(bioscfg_drv.ordered_list_data[instance_id].attribute_name,
+		attr_name_kobj->name,
+		sizeof(bioscfg_drv.ordered_list_data[instance_id].attribute_name));
+	strscpy(bioscfg_drv.ordered_list_data[instance_id].display_name,
+		attr_name_kobj->name,
+		sizeof(bioscfg_drv.ordered_list_data[instance_id].display_name));
+
+	/* Populate ordered list elements */
+	populate_ordered_list_elements_from_buffer(order_obj, instance_id, HPWMI_ORDERED_LIST_TYPE);
+	update_attribute_permissions(bioscfg_drv.ordered_list_data[instance_id].is_readonly,
+				    &ordered_list_current_val);
+	friendly_user_name_update(bioscfg_drv.ordered_list_data[instance_id].path,
+				  attr_name_kobj->name,
+				   bioscfg_drv.ordered_list_data[instance_id].display_name,
+				  sizeof(bioscfg_drv.ordered_list_data[instance_id].display_name));
+
+	return sysfs_create_group(attr_name_kobj, &ordered_list_attr_group);
+}
+
+int populate_ordered_list_elements_from_buffer(union acpi_object *order_obj,
+					       int instance_id, enum hp_wmi_data_type type)
+{
+	int status;
+	char *str = NULL;
+	int elem;
+	int reqs;
+	int integer;
+	int size = 0;
+	int values;
+
+	elem = 0;
+	strscpy(bioscfg_drv.ordered_list_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.ordered_list_data[instance_id].display_name_language_code));
+
+	for (elem = 1; elem < 3; elem++) {
+
+		status = get_string_from_buffer((u16 **)&order_obj->buffer.pointer, &str);
+		if (ACPI_FAILURE(status))
+			continue;
+
+		switch (elem) {
+		case VALUE:
+			strscpy(bioscfg_drv.ordered_list_data[instance_id].current_value,
+				str, sizeof(bioscfg_drv.ordered_list_data[instance_id].current_value));
+			break;
+		case PATH:
+			strscpy(bioscfg_drv.ordered_list_data[instance_id].path, str,
+				sizeof(bioscfg_drv.ordered_list_data[instance_id].path));
+			break;
+		default:
+			pr_warn("Invalid element: %d found in Ordered list attribute or data may be malformed\n", elem);
+			break;
+		}
+		kfree(str);
+		str = NULL;
+	}
+	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
+
+		if (elem != PREREQUISITES && elem != ORD_LIST_ELEMENTS)
+			status = get_integer_from_buffer((int **)&order_obj->buffer.pointer, (int *)&integer);
+
+		if (ACPI_FAILURE(status))
+			continue;
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
+		case PREREQUISITE_SIZE:
+			bioscfg_drv.ordered_list_data[instance_id].prerequisitesize = integer;
+			if (integer > 20)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+			break;
+		case PREREQUISITES:
+			size = bioscfg_drv.ordered_list_data[instance_id].prerequisitesize;
+			for (reqs = 0; reqs < size; reqs++) {
+				status = get_string_from_buffer((u16 **)&order_obj->buffer.pointer, &str);
+				if (ACPI_FAILURE(status))
+					continue;
+
+				strlcat(bioscfg_drv.ordered_list_data[instance_id].prerequisites,
+					str,
+					sizeof(bioscfg_drv.ordered_list_data[instance_id].prerequisites));
+
+				if (reqs != (size - 1))
+					strlcat(bioscfg_drv.ordered_list_data[instance_id].prerequisites, ";",
+						sizeof(bioscfg_drv.ordered_list_data[instance_id].prerequisites));
+
+				kfree(str);
+				str = NULL;
+			}
+			break;
+		case SECURITY_LEVEL:
+			bioscfg_drv.ordered_list_data[instance_id].security_level = integer;
+			break;
+		case ORD_LIST_SIZE:
+			bioscfg_drv.ordered_list_data[instance_id].size = integer;
+			break;
+		case ORD_LIST_ELEMENTS:
+			size = bioscfg_drv.ordered_list_data[instance_id].size;
+			for (values = 0; values < size; values++) {
+				status = get_string_from_buffer((u16 **)&order_obj->buffer.pointer, &str);
+				if (ACPI_FAILURE(status))
+					continue;
+
+				strlcat(bioscfg_drv.ordered_list_data[instance_id].elements,
+					str,
+					sizeof(bioscfg_drv.ordered_list_data[instance_id].elements));
+
+				if (values != (size - 1))
+					strlcat(bioscfg_drv.ordered_list_data[instance_id].elements, ";",
+						sizeof(bioscfg_drv.ordered_list_data[instance_id].elements));
+
+				kfree(str);
+				str = NULL;
+			}
+			break;
+		default:
+			pr_warn("Invalid element: %d found in Ordered list attribute or data may be malformed\n", elem);
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
+								&ordered_list_attr_group);
+	}
+	bioscfg_drv.ordered_list_instances_count = 0;
+
+	kfree(bioscfg_drv.ordered_list_data);
+	bioscfg_drv.ordered_list_data = NULL;
+}
diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c b/drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c
new file mode 100644
index 000000000000..ecba2994563c
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to SET password methods under
+ * HP_WMI_SET_BIOS_SETTING_GUID for use with hp-bioscfg driver.
+ *
+ * Copyright (c) 2022 Hewlett-Packard Inc.
+ */
+
+#include <linux/wmi.h>
+#include "bioscfg.h"
+
+static int bios_attr_pass_interface_probe(struct wmi_device *wdev, const void *context)
+{
+	mutex_lock(&bioscfg_drv.mutex);
+	bioscfg_drv.password_attr_wdev = wdev;
+	mutex_unlock(&bioscfg_drv.mutex);
+	return 0;
+}
+
+static void bios_attr_pass_interface_remove(struct wmi_device *wdev)
+{
+	mutex_lock(&bioscfg_drv.mutex);
+	bioscfg_drv.password_attr_wdev = NULL;
+	mutex_unlock(&bioscfg_drv.mutex);
+}
+
+static const struct wmi_device_id bios_attr_pass_interface_id_table[] = {
+	{ .guid_string = HP_WMI_SET_BIOS_SETTING_GUID },
+	{ },
+};
+static struct wmi_driver bios_attr_pass_interface_driver = {
+	.driver = {
+		.name = DRIVER_NAME"-password"
+	},
+	.probe = bios_attr_pass_interface_probe,
+	.remove = bios_attr_pass_interface_remove,
+	.id_table = bios_attr_pass_interface_id_table,
+};
+
+int init_bios_attr_pass_interface(void)
+{
+	return wmi_driver_register(&bios_attr_pass_interface_driver);
+}
+
+void exit_bios_attr_pass_interface(void)
+{
+	wmi_driver_unregister(&bios_attr_pass_interface_driver);
+}
+
+MODULE_DEVICE_TABLE(wmi, bios_attr_pass_interface_id_table);
-- 
2.34.1

