Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1D9C4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Dec 2022 17:36:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234079AbiLBRge (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 2 Dec 2022 12:36:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233911AbiLBRgc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Dec 2022 12:36:32 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA408D8278
        for <platform-driver-x86@vger.kernel.org>; Fri,  2 Dec 2022 09:36:22 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id e205so5980643oif.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Dec 2022 09:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHJ+nJq0zu7TMQThZcr7Sl3oCLPnRI7z3xRXWskQtUQ=;
        b=jgJ2d7bsPb2yLV+oCWdKdeaPx78HRNQe4/cquX8UGUD+4HPT5/ExO4mLHZ/Zz7a+tX
         FzrMG2TBn0VWICSYXx+bGgR0OXMtYTGHb+jAGZ/p47dyTaUbyXDxgaVhRsFw3YmRa7IO
         yS5EePZnci13ZgnqYRcWuCq03gq9czXKziWRvEbzzdkKexd0wm6OVSeoCVqDRUWHtpsp
         jNoHiyga0oYyO3yL2yBpFfYI/g8KjQYXRSGhzZrbEzsAztCGCXcrBxLoL7P5qOVTQyTG
         dA5oOmiRViIDUkQu/ou7O/Mhl2Oa5WTkxGK257UHStjT4jzvHzWHAhVNYaWBl942m570
         Z7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHJ+nJq0zu7TMQThZcr7Sl3oCLPnRI7z3xRXWskQtUQ=;
        b=dv0fbue3bTZN5c1ydtnYmHzLodT1tWI1CnyP4yr//CqgEcIR/VZC7m9U6jQUkf7jTk
         XdVkbwX/oWwiwABalbpOun6eqIdmX8mcJaCecJEgBdS6Vz7YxD38oNHXPKS7FhjL7J8V
         09Ja3W/ShWZmE2A3SymdOTqChpParz42CO/qTd0YVzK9GQUGqRkH/UVbfDlRJQYs5mj8
         pMrDbjO4UA8fomInUvRE2T/DgPZds8KLnlCKK99G6iJHQ6Yw/fhFIqmHoXkMX5lvGFBr
         JiG62O9EIQWWso+eIgz7d0w7RstYOirl947KsPbb02ldJfibMda8i1DKXfrJ+72iDRso
         m3Hw==
X-Gm-Message-State: ANoB5pk5pzvMr+j4b6BSGeaDs/m5A4jzUCDLhbz/qFpnHUAMPX9asb6L
        m2wprwkVivYNys03uWWovNG+XnZ2/ABoZg==
X-Google-Smtp-Source: AA0mqf52czMWHmVmTWXaCgCV2JSgEY1dpSlKPekHLcKIY3fTUVloCuC8tavYGG84XIdQfy7DNb9jjQ==
X-Received: by 2002:aca:da45:0:b0:355:3cb7:b77 with SMTP id r66-20020acada45000000b003553cb70b77mr37686119oig.37.1670002581868;
        Fri, 02 Dec 2022 09:36:21 -0800 (PST)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:bec7:8390:5104:e759])
        by smtp.gmail.com with ESMTPSA id n7-20020a056870558700b0013cd709659dsm4371692oao.52.2022.12.02.09.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:36:21 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 3/5] Introduction of HP-BIOSCFG driver (3)
Date:   Fri,  2 Dec 2022 11:36:14 -0600
Message-Id: <20221202173616.180108-4-jorge.lopez2@hp.com>
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
 .../x86/hp/hp-bioscfg/enum-attributes.c       | 499 ++++++++++++++++
 .../x86/hp/hp-bioscfg/int-attributes.c        | 450 ++++++++++++++
 .../x86/hp/hp-bioscfg/ordered-attributes.c    | 549 ++++++++++++++++++
 3 files changed, 1498 insertions(+)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c

diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
new file mode 100644
index 000000000000..5ef81daf0099
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
@@ -0,0 +1,499 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to enumeration type attributes under
+ * BIOS Enumeration GUID for use with hp-bioscfg driver.
+ *
+ *  Copyright (c) 2022 HP Development Company, L.P.
+ */
+
+#include "bioscfg.h"
+
+get_instance_id(enumeration);
+
+static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	int instance_id = get_enumeration_instance_id(kobj);
+	ssize_t ret;
+
+	if (instance_id < 0)
+		return -EIO;
+
+	ret = sysfs_emit(buf, "%s\n",
+			    bioscfg_drv.enumeration_data[instance_id].current_value);
+
+	return ret;
+}
+
+/*
+ * validate_enumeration_input() -
+ * Validate input of current_value against possible values
+ *
+ * @instance_id: The instance on which input is validated
+ * @buf: Input value
+ */
+static int validate_enumeration_input(int instance_id, const char *buf)
+{
+	char *options = NULL;
+	char *p;
+	int ret = 0;
+	int found = 0;
+
+	/* Is it a read only attribute */
+	if (bioscfg_drv.enumeration_data[instance_id].is_readonly)
+		return -EIO;
+
+	options = kstrdup(bioscfg_drv.enumeration_data[instance_id].possible_values,
+			  GFP_KERNEL);
+
+	if (!options) {
+		ret = -ENOMEM;
+		goto exit_validate_enum_input;
+	}
+
+
+	while ((p = strsep(&options, ";")) != NULL) {
+		if (!*p)
+			continue;
+
+		if (!strcasecmp(p, buf)) {
+			found = 1;
+			break;
+		}
+	}
+
+	if (!found) {
+		ret = -EINVAL;
+		goto exit_validate_enum_input;
+	}
+
+	/*
+	 * set pending reboot flag depending on
+	 * "RequiresPhysicalPresence" value
+	 */
+	if (bioscfg_drv.enumeration_data[instance_id].requires_physical_presence)
+		bioscfg_drv.pending_reboot = TRUE;
+
+exit_validate_enum_input:
+	kfree(options);
+	return ret;
+}
+
+static void update_enumeration_value(int instance_id, char *attr_value)
+{
+	strscpy(bioscfg_drv.enumeration_data[instance_id].current_value,
+		attr_value,
+		sizeof(bioscfg_drv.enumeration_data[instance_id].current_value));
+}
+
+
+attribute_s_property_show(display_name_language_code, enumeration);
+static struct kobj_attribute enumeration_display_langcode =
+		__ATTR_RO(display_name_language_code);
+
+attribute_s_property_show(display_name, enumeration);
+static struct kobj_attribute  enumeration_display_name =
+		__ATTR_RO(display_name);
+
+attribute_property_store(current_value, enumeration);
+static struct kobj_attribute enumeration_current_val =
+	__ATTR_RW_MODE(current_value, 0644);
+
+attribute_s_property_show(possible_values, enumeration);
+static struct kobj_attribute  enumeration_poss_val =
+		__ATTR_RO(possible_values);
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "enumeration\n");
+}
+static struct kobj_attribute enumeration_type =
+		__ATTR_RO(type);
+
+static struct attribute *enumeration_attrs[] = {
+	&enumeration_display_langcode.attr,
+	&enumeration_display_name.attr,
+	&enumeration_current_val.attr,
+	&enumeration_poss_val.attr,
+	&enumeration_type.attr,
+	NULL,
+};
+
+static const struct attribute_group enumeration_attr_group = {
+	.attrs = enumeration_attrs,
+};
+
+int alloc_enumeration_data(void)
+{
+	int ret = 0;
+
+	bioscfg_drv.enumeration_instances_count =
+		get_instance_count(HP_WMI_BIOS_ENUMERATION_GUID);
+
+	bioscfg_drv.enumeration_data = kcalloc(bioscfg_drv.enumeration_instances_count,
+					sizeof(struct enumeration_data), GFP_KERNEL);
+	if (!bioscfg_drv.enumeration_data) {
+		bioscfg_drv.enumeration_instances_count = 0;
+		ret = -ENOMEM;
+	}
+	return ret;
+}
+
+/*
+ * populate_enumeration_package_data() -
+ * Populate all properties of an instance under enumeration attribute
+ *
+ * @enum_obj: ACPI object with enumeration data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int populate_enumeration_package_data(union acpi_object *enum_obj, int instance_id,
+			struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.enumeration_data[instance_id].type = HPWMI_ENUMERATION_TYPE;
+	bioscfg_drv.enumeration_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	populate_enumeration_elements_from_package(enum_obj, instance_id, HPWMI_ENUMERATION_TYPE);
+	update_attribute_permissions(bioscfg_drv.enumeration_data[instance_id].is_readonly,
+				     &enumeration_current_val);
+	/*
+	 * Several attributes have names such "MONDAY".  Friendly
+	 * user nane is generated to make the name more descriptive
+	 */
+	friendly_user_name_update(bioscfg_drv.enumeration_data[instance_id].path,
+				  attr_name_kobj->name,
+				   bioscfg_drv.enumeration_data[instance_id].display_name,
+				   sizeof(bioscfg_drv.enumeration_data[instance_id].display_name));
+	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
+}
+
+int populate_enumeration_elements_from_package(union acpi_object *enum_obj,
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
+	int pos_values;
+
+	strscpy(bioscfg_drv.enumeration_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.enumeration_data[instance_id].display_name_language_code));
+
+	for (elem = 1, eloc = 1; elem < hp_wmi_elements_count[type]; elem++, eloc++) {
+
+		switch (enum_obj[elem].type) {
+		case ACPI_TYPE_STRING:
+
+			if (PREREQUISITES != elem && ENUM_POSSIBLE_VALUES != elem) {
+				status = convert_hexstr_to_str(&enum_obj[elem].string.pointer,
+							       enum_obj[elem].string.length,
+							       &str_value, &value_len);
+				if (ACPI_FAILURE(status))
+					continue;
+
+			}
+			break;
+		case ACPI_TYPE_INTEGER:
+			int_value = (u32)enum_obj[elem].integer.value;
+			break;
+		default:
+			pr_warn("Unsupported object type [%d]\n", enum_obj[elem].type);
+			continue;
+		}
+
+		/* stop if extra counter is greater than total number
+		 * of elements for enumeration type
+		 */
+		if (eloc == hp_wmi_elements_count[type])
+			goto exit_enumeration_package;
+
+		/* Assign appropriate element value to corresponding field*/
+		switch (eloc) {
+		case VALUE:
+			break;
+		case PATH:
+			strscpy(bioscfg_drv.enumeration_data[instance_id].path, str_value,
+				sizeof(bioscfg_drv.enumeration_data[instance_id].path));
+			break;
+		case IS_READONLY:
+			bioscfg_drv.enumeration_data[instance_id].is_readonly = int_value;
+			break;
+		case DISPLAY_IN_UI:
+			bioscfg_drv.enumeration_data[instance_id].display_in_ui = int_value;
+			break;
+		case REQUIRES_PHYSICAL_PRESENCE:
+			bioscfg_drv.enumeration_data[instance_id].requires_physical_presence = int_value;
+			break;
+		case SEQUENCE:
+			bioscfg_drv.enumeration_data[instance_id].sequence = int_value;
+			break;
+		case PREREQUISITE_SIZE:
+			bioscfg_drv.enumeration_data[instance_id].prerequisitesize = int_value;
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
+			size = bioscfg_drv.enumeration_data[instance_id].prerequisitesize;
+
+			for (reqs = 0; reqs < size; reqs++) {
+				status = convert_hexstr_to_str(&enum_obj[elem].string.pointer,
+							       enum_obj[elem].string.length,
+							       &str_value, &value_len);
+				if (ACPI_FAILURE(status))
+					break;
+
+				strlcat(bioscfg_drv.enumeration_data[instance_id].prerequisites,
+					str_value,
+					sizeof(bioscfg_drv.enumeration_data[instance_id].prerequisites));
+				if (reqs != (size - 1))
+					strlcat(bioscfg_drv.enumeration_data[instance_id].prerequisites, ";",
+						sizeof(bioscfg_drv.enumeration_data[instance_id].prerequisites));
+
+				kfree(str_value);
+				str_value = NULL;
+			}
+			break;
+
+		case SECURITY_LEVEL:
+			bioscfg_drv.enumeration_data[instance_id].security_level = int_value;
+			break;
+
+		case ENUM_CURRENT_VALUE:
+			strscpy(bioscfg_drv.enumeration_data[instance_id].current_value,
+				str_value, sizeof(bioscfg_drv.enumeration_data[instance_id].current_value));
+			break;
+		case ENUM_SIZE:
+			bioscfg_drv.enumeration_data[instance_id].size = int_value;
+			break;
+		case ENUM_POSSIBLE_VALUES:
+			size = bioscfg_drv.enumeration_data[instance_id].size;
+			for (pos_values = 0; pos_values < size; pos_values++) {
+				status = convert_hexstr_to_str(&enum_obj[elem + pos_values].string.pointer,
+							       enum_obj[elem  + pos_values].string.length,
+							       &str_value, &value_len);
+				if (ACPI_FAILURE(status))
+					break;
+
+				strlcat(bioscfg_drv.enumeration_data[instance_id].possible_values,
+					str_value,
+					sizeof(bioscfg_drv.enumeration_data[instance_id].possible_values));
+				if (pos_values < (size - 1))
+					strlcat(bioscfg_drv.enumeration_data[instance_id].possible_values, ";",
+						sizeof(bioscfg_drv.enumeration_data[instance_id].possible_values));
+				kfree(str_value);
+				str_value = NULL;
+			}
+			break;
+		default:
+			pr_warn("Invalid element: %d found in Enumeration attribute or data may be malformed\n", elem);
+			break;
+		}
+
+		kfree(str_value);
+		str_value = NULL;
+	}
+
+exit_enumeration_package:
+		kfree(str_value);
+		str_value = NULL;
+	return 0;
+}
+
+/*
+ * populate_enumeration_buffer_data() -
+ * Populate all properties of an instance under enumeration attribute
+ *
+ * @buffer_ptr: Buffer pointer
+ * @buffer_size: Buffer size
+ * @enum_obj: ACPI object with enumeration data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ * @enumeration_property_count: Total properties count under enumeration type
+ */
+int populate_enumeration_buffer_data(u8 *buffer_ptr, int *buffer_size,
+				     int instance_id,
+				     struct kobject *attr_name_kobj)
+{
+
+	bioscfg_drv.enumeration_data[instance_id].type = HPWMI_ENUMERATION_TYPE;
+	bioscfg_drv.enumeration_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	/* Populate enumeration elements */
+	populate_enumeration_elements_from_buffer(buffer_ptr, buffer_size,
+						  instance_id,
+						  HPWMI_ENUMERATION_TYPE);
+
+	update_attribute_permissions(bioscfg_drv.enumeration_data[instance_id].is_readonly,
+				    &enumeration_current_val);
+	/*
+	 * Several attributes have names such "MONDAY". A Friendlier
+	 * user nane is generated to make the name more descriptive
+	 */
+	friendly_user_name_update(bioscfg_drv.enumeration_data[instance_id].path,
+				  attr_name_kobj->name,
+				   bioscfg_drv.enumeration_data[instance_id].display_name,
+				   sizeof(bioscfg_drv.enumeration_data[instance_id].display_name));
+
+	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
+}
+
+int populate_enumeration_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
+					      int instance_id,
+					      enum hp_wmi_data_type type)
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
+
+	strscpy(bioscfg_drv.enumeration_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.enumeration_data[instance_id].display_name_language_code));
+
+	for (elem = 1; elem < 3; elem++) {
+
+		status = get_string_from_buffer((u16 **)&buffer_ptr,
+						buffer_size, &str);
+		if (status < 0)
+			continue;
+
+		switch (elem) {
+		case VALUE:
+			/* Skip 'Value' since 'CurrentValue' is reported. */
+			break;
+		case PATH:
+			strscpy(bioscfg_drv.enumeration_data[instance_id].path,
+				str, sizeof(bioscfg_drv.enumeration_data[instance_id].path));
+			break;
+		default:
+			pr_warn("Invalid element: %d found in Enumeration attribute or data may be malformed\n", elem);
+			break;
+		}
+
+		kfree(str);
+		str = NULL;
+	}
+
+	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
+		if (PREREQUISITES != elem && ENUM_CURRENT_VALUE != elem && ENUM_POSSIBLE_VALUES != elem) {
+			status = get_integer_from_buffer((int **)&buffer_ptr, buffer_size, (int *)&integer);
+			if (status < 0)
+				continue;
+		}
+
+		switch (elem) {
+		case IS_READONLY:
+			bioscfg_drv.enumeration_data[instance_id].is_readonly = integer;
+			break;
+		case DISPLAY_IN_UI:
+			bioscfg_drv.enumeration_data[instance_id].display_in_ui = integer;
+			break;
+		case REQUIRES_PHYSICAL_PRESENCE:
+			bioscfg_drv.enumeration_data[instance_id].requires_physical_presence = integer;
+			break;
+		case SEQUENCE:
+			bioscfg_drv.enumeration_data[instance_id].sequence = integer;
+			break;
+		case PREREQUISITE_SIZE:
+			bioscfg_drv.enumeration_data[instance_id].prerequisitesize = integer;
+			if (integer > 20)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+			break;
+		case PREREQUISITES:
+			size = bioscfg_drv.enumeration_data[instance_id].prerequisitesize;
+			for (reqs = 0; reqs < size; reqs++) {
+				status = get_string_from_buffer((u16 **)&buffer_ptr, buffer_size, &str);
+				if (status < 0)
+					continue;
+
+				strlcat(bioscfg_drv.enumeration_data[instance_id].prerequisites,
+					str,
+					sizeof(bioscfg_drv.enumeration_data[instance_id].prerequisites));
+				if (reqs != (size - 1))
+					strlcat(bioscfg_drv.enumeration_data[instance_id].prerequisites, ";",
+						sizeof(bioscfg_drv.enumeration_data[instance_id].prerequisites));
+				kfree(str);
+				str = NULL;
+			}
+			break;
+		case SECURITY_LEVEL:
+			bioscfg_drv.enumeration_data[instance_id].security_level = integer;
+			break;
+		case ENUM_CURRENT_VALUE:
+			status = get_string_from_buffer((u16 **)&buffer_ptr,
+							buffer_size, &str);
+			if (status < 0)
+				continue;
+
+			strscpy(bioscfg_drv.enumeration_data[instance_id].current_value,
+				str,
+				sizeof(bioscfg_drv.enumeration_data[instance_id].current_value));
+			break;
+		case ENUM_SIZE:
+			bioscfg_drv.enumeration_data[instance_id].size = integer;
+			break;
+		case ENUM_POSSIBLE_VALUES:
+			size = bioscfg_drv.enumeration_data[instance_id].size;
+			for (values = 0; values < size; values++) {
+				status = get_string_from_buffer((u16 **)&buffer_ptr, buffer_size, &str);
+				if (status < 0)
+					continue;
+
+				strlcat(bioscfg_drv.enumeration_data[instance_id].possible_values,
+					str,
+					sizeof(bioscfg_drv.enumeration_data[instance_id].possible_values));
+				if (values != (size - 1))
+					strlcat(bioscfg_drv.enumeration_data[instance_id].possible_values, ";",
+						sizeof(bioscfg_drv.enumeration_data[instance_id].possible_values));
+				kfree(str);
+				str = NULL;
+			}
+			break;
+		default:
+			pr_warn("Invalid element: %d found in Enumeration attribute or data may be malformed\n", elem);
+			break;
+		}
+		kfree(str);
+		str = NULL;
+	}
+	kfree(str);
+
+	return 0;
+}
+
+/**
+ * exit_enumeration_attributes() - Clear all attribute data
+ *
+ * Clears all data allocated for this group of attributes
+ */
+void exit_enumeration_attributes(void)
+{
+	int instance_id;
+
+	for (instance_id = 0; instance_id < bioscfg_drv.enumeration_instances_count; instance_id++) {
+		if (bioscfg_drv.enumeration_data[instance_id].attr_name_kobj)
+			sysfs_remove_group(bioscfg_drv.enumeration_data[instance_id].attr_name_kobj,
+					   &enumeration_attr_group);
+	}
+	bioscfg_drv.enumeration_instances_count = 0;
+
+	kfree(bioscfg_drv.enumeration_data);
+	bioscfg_drv.enumeration_data = NULL;
+}
diff --git a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
new file mode 100644
index 000000000000..c7ab6e5c2b7a
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
@@ -0,0 +1,450 @@
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
+	if (!obj)
+		return -EIO;
+
+	ret = sysfs_emit(buf, "%d\n",  bioscfg_drv.integer_data[instance_id].current_value);
+
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
+	/* BIOS treats it as a read only attribute */
+	if (bioscfg_drv.integer_data[instance_id].is_readonly)
+		return -EIO;
+
+	ret = kstrtoint(buf, 10, &in_val);
+	if (in_val < bioscfg_drv.integer_data[instance_id].lower_bound ||
+			in_val > bioscfg_drv.integer_data[instance_id].upper_bound)
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
+
+	bioscfg_drv.integer_data[instance_id].type = HPWMI_INTEGER_TYPE;
+	bioscfg_drv.integer_data[instance_id].attr_name_kobj = attr_name_kobj;
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
+ * @buffer_ptr: Buffer pointer
+ * @buffer_size: Buffer size
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int populate_integer_buffer_data(u8 *buffer_ptr, int *buffer_size, int instance_id,
+			struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.integer_data[instance_id].type = HPWMI_INTEGER_TYPE;
+	bioscfg_drv.integer_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	/* Populate integer elements */
+	populate_integer_elements_from_buffer(buffer_ptr, buffer_size,
+					      instance_id, HPWMI_INTEGER_TYPE);
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
+int populate_integer_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
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
+		status = get_string_from_buffer((u16 **)&buffer_ptr, buffer_size, &str);
+		if (status < 0)
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
+		if (elem != PREREQUISITES) {
+			status = get_integer_from_buffer((int **)&buffer_ptr, buffer_size, (int *)&integer);
+			if (status < 0)
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
+		case PREREQUISITE_SIZE:
+			bioscfg_drv.integer_data[instance_id].prerequisitesize = integer;
+			size = integer;
+			if (size > 20)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+
+			break;
+		case PREREQUISITES:
+			for (reqs = 0; reqs < size; reqs++) {
+				status = get_string_from_buffer((u16 **)&buffer_ptr, buffer_size, &str);
+				if (status < 0)
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
+					   &integer_attr_group);
+	}
+	bioscfg_drv.integer_instances_count = 0;
+
+	kfree(bioscfg_drv.integer_data);
+	bioscfg_drv.integer_data = NULL;
+}
diff --git a/drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
new file mode 100644
index 000000000000..727cc01ed022
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
@@ -0,0 +1,549 @@
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
+	ret = sysfs_emit(buf, "%s\n",
+			 bioscfg_drv.ordered_list_data[instance_id].current_value);
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
+	/* Is it a read only attribute */
+	if (bioscfg_drv.ordered_list_data[instance_id].is_readonly)
+		return -EIO;
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
+		__ATTR_RO(display_name_language_code);
+
+attribute_s_property_show(display_name, ordered_list);
+static struct kobj_attribute ordered_list_display_name =
+		__ATTR_RO(display_name);
+
+attribute_property_store(current_value, ordered_list);
+static struct kobj_attribute ordered_list_current_val =
+		__ATTR_RW_MODE(current_value, 0644);
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
+	return sysfs_emit(buf, "ordered-list\n");
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
+				       struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.ordered_list_data[instance_id].type = HPWMI_ORDERED_LIST_TYPE;
+	bioscfg_drv.ordered_list_data[instance_id].attr_name_kobj = attr_name_kobj;
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
+ * @buffer_ptr: Buffer pointer
+ * @buffer_size: Buffer size
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ * @enum_property_count: Total properties count under ordered list type
+ */
+int populate_ordered_list_buffer_data(u8 *buffer_ptr, int *buffer_size, int instance_id,
+			struct kobject *attr_name_kobj)
+{
+
+	bioscfg_drv.ordered_list_data[instance_id].type = HPWMI_ORDERED_LIST_TYPE;
+	bioscfg_drv.ordered_list_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	/* Populate ordered list elements */
+	populate_ordered_list_elements_from_buffer(buffer_ptr, buffer_size, instance_id, HPWMI_ORDERED_LIST_TYPE);
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
+int populate_ordered_list_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
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
+		status = get_string_from_buffer((u16 **)&buffer_ptr, buffer_size, &str);
+		if (status < 0)
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
+		if (elem != PREREQUISITES && elem != ORD_LIST_ELEMENTS) {
+			status = get_integer_from_buffer((int **)&buffer_ptr, buffer_size, (int *)&integer);
+			if (status < 0)
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
+		case PREREQUISITE_SIZE:
+			bioscfg_drv.ordered_list_data[instance_id].prerequisitesize = integer;
+			if (integer > 20)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+			break;
+		case PREREQUISITES:
+			size = bioscfg_drv.ordered_list_data[instance_id].prerequisitesize;
+			for (reqs = 0; reqs < size; reqs++) {
+				status = get_string_from_buffer((u16 **)&buffer_ptr, buffer_size, &str);
+				if (status < 0)
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
+				status = get_string_from_buffer((u16 **)&buffer_ptr, buffer_size, &str);
+				if (status < 0)
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
-- 
2.34.1

