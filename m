Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82517C4708D
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Dec 2022 17:36:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233887AbiLBRgd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 2 Dec 2022 12:36:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233764AbiLBRgc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Dec 2022 12:36:32 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC496E8022
        for <platform-driver-x86@vger.kernel.org>; Fri,  2 Dec 2022 09:36:23 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id v13so6024157oie.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Dec 2022 09:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QH2TlkvIBTO2HUH5n3l7KhtQRPRKqeceo4FWt2+IsEw=;
        b=ZJptFjl2LQUkzA3jtfmzpLofKnjAtosuj2CVz52i3ga2pLD5NSB2xFiqGnJ7JK3Q92
         NK6D0D4/On1L7kbdXIPT+XClX4DHfPB9n7CLdzBZmbgTl6XmAP3Tx62ch7J5U02NIDRy
         2FlXaFlIlVX+fwvwM3KQqAZ3XDaKHwX6PAu6p0jTdNDs+OKr0djg5Vo7Y5sT2qu50mF2
         t2i4yyUbVuO554BRw/LsXJ/LKJKIncYWbCJKotx1MBB2c194ZNXoi6fG42C8HLaWGqUi
         KA2dUfxB9WJmpVyr+y3HzM1vGdozj2LTVDRqcTFFoU7hyiZnvcRZXBi0XD0h7zkTMgql
         Yx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QH2TlkvIBTO2HUH5n3l7KhtQRPRKqeceo4FWt2+IsEw=;
        b=BMtJ7AqxfbjjgVCPvjP2tS486vNqTmi5zAjgqGh+qjMpzdOqOa3pVnMwA0+HTIaulR
         Lsy/toh9ulPUFxsMO8xezGQmbZzjo7a3oStZ5hZiYkoVssYg8YUDEE7leNr5fj3XV2FE
         PJ+hiNzhsig1O/HdopSVUMHl0AGO6RBQO0NyQqjbCpWHd43h8TD/4ZnuLU1aKeJgGc00
         i5lXWbTaqqT6TVpm8WU2dBiCNk/iRDxnA8Nj3sfipgR8GWBKHwW1r+HccMOqK6ddHzMk
         qP2aF0fvvFsIwFFkuOAHL0Pwrch4fNnHQSsuSI+2Am5d1vFk5CRzmUcEwQqdcjt4LOau
         8DVw==
X-Gm-Message-State: ANoB5pmZRKxol6msB9saonY3VpErPlfvUIBlVMTHJsIntnlhku2dH+GO
        udmbOXqKDVVAgdl4ysL0CHcEFzwTyVu/zw==
X-Google-Smtp-Source: AA0mqf6OtHQfjN5w5+YRQ0sWAZ4N5Pu3G33K/JMPMDYc4Fy4vx6oJbGzt88rRDD3YOkOfFKOZY9gOg==
X-Received: by 2002:a05:6808:16a9:b0:35a:76f3:f550 with SMTP id bb41-20020a05680816a900b0035a76f3f550mr35028808oib.219.1670002582897;
        Fri, 02 Dec 2022 09:36:22 -0800 (PST)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:bec7:8390:5104:e759])
        by smtp.gmail.com with ESMTPSA id n7-20020a056870558700b0013cd709659dsm4371692oao.52.2022.12.02.09.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:36:22 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 4/5] Introduction of HP-BIOSCFG driver (4)
Date:   Fri,  2 Dec 2022 11:36:15 -0600
Message-Id: <20221202173616.180108-5-jorge.lopez2@hp.com>
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
 .../x86/hp/hp-bioscfg/passwdattr-interface.c  |  51 ++
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  | 631 ++++++++++++++++++
 .../x86/hp/hp-bioscfg/spmobj-attributes.c     | 419 ++++++++++++
 3 files changed, 1101 insertions(+)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c b/drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c
new file mode 100644
index 000000000000..02fc766eb3cf
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c
@@ -0,0 +1,51 @@
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
+static int bios_attr_pass_interface_probe(struct wmi_device *wdev,
+					  const void *context)
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
diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
new file mode 100644
index 000000000000..00a958f64d28
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -0,0 +1,631 @@
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
+ * Clear all passwords copied to memory for both Power-ON and Setup
+ * BIOS instances
+*/
+int clear_all_passwords(void)
+{
+	int instance;
+
+	for (instance = 0; instance < bioscfg_drv.password_instances_count; instance++)
+		clear_passwords(instance);
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
+attribute_s_property_show(supported_encoding,  password);
+static struct kobj_attribute password_encoding =
+		__ATTR_RO(supported_encoding);
+
+attribute_n_property_show(encoding_size,  password);
+static struct kobj_attribute password_encoding_size =
+		__ATTR_RO(encoding_size);
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
+	&password_encoding.attr,
+	&password_encoding_size.attr,
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
+	bioscfg_drv.password_data[instance_id].type = HPWMI_PASSWORD_TYPE;
+	bioscfg_drv.password_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	populate_password_elements_from_package(password_obj, instance_id, HPWMI_PASSWORD_TYPE);
+
+	if (strcmp(attr_name_kobj->name, "Setup Password") == 0) {
+		/* Save  system authentication instance for easy access */
+		return sysfs_create_group(attr_name_kobj, &bios_password_attr_group);
+	}
+
+	return sysfs_create_group(attr_name_kobj, &system_password_attr_group);
+}
+
+int populate_password_elements_from_package(union acpi_object *password_obj,
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
+	strscpy(bioscfg_drv.password_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.password_data[instance_id].display_name_language_code));
+
+	for (elem = 1, eloc = 1; elem < hp_wmi_elements_count[type]; elem++, eloc++) {
+
+		switch (password_obj[elem].type) {
+		case ACPI_TYPE_STRING:
+
+			if (PREREQUISITES != elem && ENUM_POSSIBLE_VALUES != elem) {
+				status = convert_hexstr_to_str(&password_obj[elem].string.pointer,
+							       password_obj[elem].string.length,
+							       &str_value, &value_len);
+
+				if (ACPI_FAILURE(status))
+					continue;
+
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
+		/* stop if extra counter is greater than total number
+		 * of elements for password type
+		 */
+		if (eloc == hp_wmi_elements_count[type])
+			goto exit_password_package;
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
+		case PREREQUISITE_SIZE:
+			bioscfg_drv.password_data[instance_id].prerequisitesize = int_value;
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
+			size = bioscfg_drv.password_data[instance_id].prerequisitesize;
+
+			for (reqs = 0; reqs < size; reqs++) {
+				status = convert_hexstr_to_str(&password_obj[elem].string.pointer,
+							       password_obj[elem].string.length,
+							       &str_value, &value_len);
+
+				if (ACPI_FAILURE(status))
+					break;
+
+				strlcat(bioscfg_drv.password_data[instance_id].prerequisites,
+					str_value,
+					sizeof(bioscfg_drv.password_data[instance_id].prerequisites));
+
+				if (reqs != (size - 1))
+					strlcat(bioscfg_drv.password_data[instance_id].prerequisites, ";",
+						sizeof(bioscfg_drv.password_data[instance_id].prerequisites));
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
+			bioscfg_drv.password_data[instance_id].encoding_size = int_value;
+			break;
+		case PSWD_SUPPORTED_ENCODING:
+			size = bioscfg_drv.password_data[instance_id].encoding_size;
+			for (pos_values = 0; pos_values < size; pos_values++) {
+				status = convert_hexstr_to_str(&password_obj[elem + pos_values].string.pointer,
+							       password_obj[elem  + pos_values].string.length,
+							       &str_value, &value_len);
+				if (ACPI_FAILURE(status))
+					break;
+
+				strlcat(bioscfg_drv.password_data[instance_id].supported_encoding,
+					str_value,
+					sizeof(bioscfg_drv.password_data[instance_id].supported_encoding));
+
+				if (pos_values < (size - 1))
+					strlcat(bioscfg_drv.password_data[instance_id].supported_encoding, ";",
+						sizeof(bioscfg_drv.password_data[instance_id].supported_encoding));
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
+			   struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.password_data[instance_id].type = HPWMI_PASSWORD_TYPE;
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
+	int status;
+	char *str = NULL;
+	int elem;
+	int reqs;
+	int integer;
+	int size = 0;
+	int values;
+
+	elem = 0;
+	strscpy(bioscfg_drv.password_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.password_data[instance_id].display_name_language_code));
+
+	for (elem = 1; elem < 3; elem++) {
+
+		status = get_string_from_buffer((u16 **)&buffer_ptr, buffer_size, &str);
+		if (status < 0)
+			continue;
+
+		switch (elem) {
+		case VALUE:
+			strscpy(bioscfg_drv.password_data[instance_id].current_password,
+				str, sizeof(bioscfg_drv.password_data[instance_id].current_password));
+			break;
+		case PATH:
+			strscpy(bioscfg_drv.password_data[instance_id].path, str,
+				sizeof(bioscfg_drv.password_data[instance_id].path));
+			break;
+		default:
+			pr_warn("Invalid element: %d found in Password  attribute or data may be malformed\n", elem);
+			break;
+		}
+		kfree(str);
+		str = NULL;
+	}
+
+	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
+
+		if (elem != PREREQUISITES  && elem != PSWD_SUPPORTED_ENCODING) {
+			status = get_integer_from_buffer((int **)&buffer_ptr, buffer_size, (int *)&integer);
+			if (ACPI_FAILURE(status))
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
+		case PREREQUISITE_SIZE:
+			bioscfg_drv.password_data[instance_id].prerequisitesize = integer;
+			if (integer > 20)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+			break;
+		case PREREQUISITES:
+			size = bioscfg_drv.password_data[instance_id].prerequisitesize;
+			for (reqs = 0; reqs < size; reqs++) {
+				status = get_string_from_buffer((u16 **)&buffer_ptr, buffer_size, &str);
+				if (status < 0)
+					continue;
+
+				strlcat(bioscfg_drv.password_data[instance_id].prerequisites,
+					str,
+					sizeof(bioscfg_drv.password_data[instance_id].prerequisites));
+
+				if (reqs != (size - 1))
+					strlcat(bioscfg_drv.password_data[instance_id].prerequisites, ";",
+						sizeof(bioscfg_drv.password_data[instance_id].prerequisites));
+
+				kfree(str);
+				str = NULL;
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
+			bioscfg_drv.password_data[instance_id].encoding_size = integer;
+			break;
+		case PSWD_SUPPORTED_ENCODING:
+			size = bioscfg_drv.password_data[instance_id].encoding_size;
+			for (values = 0; values < size; values++) {
+				status = get_string_from_buffer((u16 **)&buffer_ptr, buffer_size, &str);
+				if (status < 0)
+					continue;
+
+				strlcat(bioscfg_drv.password_data[instance_id].supported_encoding,
+					str,
+					sizeof(bioscfg_drv.password_data[instance_id].supported_encoding));
+
+				if (values != (size - 1))
+					strlcat(bioscfg_drv.password_data[instance_id].supported_encoding, ";",
+						sizeof(bioscfg_drv.password_data[instance_id].supported_encoding));
+
+				kfree(str);
+				str = NULL;
+			}
+			break;
+		case PSWD_IS_SET:
+			bioscfg_drv.password_data[instance_id].is_enabled = integer;
+			break;
+		default:
+			pr_warn("Invalid element: %d found in Password  attribute or data may be malformed\n", elem);
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
diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
new file mode 100644
index 000000000000..dcf296e99e26
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -0,0 +1,419 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to secure platform management object type
+ * attributes under BIOS PASSWORD for use with hp-bioscfg driver
+ *
+ *  Copyright (c) 2022 HP Development Company, L.P.
+ */
+
+#include "bioscfg.h"
+
+#define MAX_KEK_BLOB_SIZE	4160
+#define MAX_SK_BLOB_SIZE	516
+
+enum spm_states_values {
+	NOT_PROVISIONED		 = 0x00,
+	PROVISIONED		 = 0x01,
+	PROVISIONING_IN_PROGRESS = 0x02
+};
+
+static const char * const spm_state_types[] = {
+	"not provisioned",
+	"provisioned",
+	"provisioning in progress"};
+
+
+int check_spm_is_enabled(void)
+{
+	/* do we need to check the admin password is also configured */
+	return bioscfg_drv.spm_data.is_enabled;
+}
+
+/*
+ * calculate_security_buffer() - determines size of security buffer
+ * for authentication scheme
+ *
+ * @authentication: the authentication content
+ *
+ * Currently only supported type is Admin password
+ */
+size_t calculate_security_buffer(const char *authentication)
+{
+	int size;
+
+	if (authentication != NULL && strlen(authentication) > 0) {
+		size =  (sizeof(u16) + (strlen(authentication) * sizeof(u16)) +
+			+ (strlen(UTF_PREFIX) * sizeof(u16)));
+		return size;
+	}
+
+	size  = sizeof(u16) * 2;
+	return size;
+}
+
+/*
+ * populate_security_buffer() - builds a security buffer for
+ * authentication scheme
+ *
+ * @buffer: the buffer to populate
+ * @authentication: the authentication content
+ *
+ * Currently only supported type is PLAIN TEXT
+ */
+void populate_security_buffer(u16 *buffer, const char *authentication)
+{
+	u16 *auth = buffer;
+	char *strprefix = NULL;
+
+	if (strncmp(authentication, BEAM_PREFIX, strlen(BEAM_PREFIX)) == 0) {
+		/*
+		 * BEAM_PREFIX is append to buffer when a signature
+		 * is provided and Sure Admin is enabled in BIOS
+		 */
+		// BEAM_PREFIX found, convert part to unicode
+		auth = ascii_to_utf16_unicode(auth, authentication);
+	} else {
+		/*
+		 * UTF-16 prefix is append to the * buffer when a BIOS
+		 * admin password is configured in BIOS
+		 */
+
+		// append UTF_PREFIX to part and then convert it to unicode
+		strprefix = kasprintf(GFP_KERNEL, "%s%s", UTF_PREFIX,
+				      authentication);
+		if (!strprefix)
+			goto out_populate_security_buffer;
+
+		auth = ascii_to_utf16_unicode(auth, strprefix);
+	}
+out_populate_security_buffer:
+
+	kfree(strprefix);
+	strprefix = NULL;
+}
+
+ssize_t update_spm_state(void)
+{
+	int ret;
+	struct secureplatform_provisioning_data *data = NULL;
+
+	data = kmalloc(sizeof(struct secureplatform_provisioning_data),
+		       GFP_KERNEL);
+	if (!data) {
+		ret = -ENOMEM;
+		goto spm_state_exit;
+	}
+
+	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_GET_STATE,
+				   HPWMI_SECUREPLATFORM, data, 0,
+				   sizeof(struct secureplatform_provisioning_data));
+	if (ret < 0)
+		goto spm_state_exit;
+
+	bioscfg_drv.spm_data.mechanism = data->state;
+	if (bioscfg_drv.spm_data.mechanism)
+		bioscfg_drv.spm_data.is_enabled = 1;
+
+spm_state_exit:
+	kfree(data);
+
+	return ret;
+}
+
+/*
+ * statusbin - Reports SPM status in binary format
+ *
+ * @kobj:  Pointer to a kernel object of things that show up as
+ *	   directory in the sysfs filesystem.
+ * @attr:  Pointer to list of attributes for the operation
+ * @buf:   Pointer to buffer
+ *
+ * Returns number of bytes read on success.  Otherwise,
+ *         an HP WMI query specific error code (which is positive)
+ *         -ENODEV if the query was not successful at all
+ *
+ */
+ssize_t statusbin(struct kobject *kobj,
+		      struct kobj_attribute *attr, char *buf)
+{
+	int ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_GET_STATE,
+				       HPWMI_SECUREPLATFORM, buf, 0,
+				       sizeof(struct secureplatform_provisioning_data));
+
+	return ret ? -ENODEV : sizeof(struct secureplatform_provisioning_data);
+}
+
+ssize_t statusbin_show(struct kobject *kobj,
+			   struct kobj_attribute *attr, char *buf)
+{
+	int ret;
+	struct secureplatform_provisioning_data *data = NULL;
+
+	data = kmalloc(sizeof(struct secureplatform_provisioning_data),
+		       GFP_KERNEL);
+	if (!data) {
+		ret = -ENOMEM;
+		goto statusbin_show_exit;
+	}
+
+	ret = statusbin(kobj, attr, (char *)data);
+	if (ret < 0)
+		goto statusbin_show_exit;
+
+	/* copy data to spm local structure */
+	memcpy(buf, data, sizeof(struct secureplatform_provisioning_data));
+
+statusbin_show_exit:
+	kfree(data);
+
+	return ret ? ret : strnlen(buf, PAGE_SIZE);
+}
+struct kobj_attribute password_spm_statusbin = __ATTR_RO(statusbin);
+
+/*
+ * status_show - Reads SPM status
+ *
+ * @kobj:  Pointer to a kernel object of things that show up as
+ *	   directory in the sysfs filesystem.
+ * @attr:  Pointer to list of attributes for the operation
+ * @buf:   Pointer to buffer
+ *
+ * Returns number of bytes read on success.  Otherwise,
+ *         an HP WMI query specific error code (which is positive)
+ *         -ENODEV if the query was not successful at all
+ *         -ENOMEM if cannot allocate required memory size
+ *
+ */
+ssize_t status_show(struct kobject *kobj, struct kobj_attribute
+			*attr, char *buf)
+{
+	int ret, i;
+	struct secureplatform_provisioning_data *data = NULL;
+
+	data = kmalloc(sizeof(struct secureplatform_provisioning_data),
+		       GFP_KERNEL);
+	if (!data) {
+		ret = -ENOMEM;
+		goto status_show_exit;
+	}
+
+	ret = statusbin(kobj, attr, (char *)data);
+	if (ret < 0)
+		goto status_show_exit;
+
+	sysfs_emit(buf, "%sState: %d\n", buf, data->state);
+	sysfs_emit(buf, "%sVersion: %d.%d\n", buf, data->version[0],
+		 data->version[1]);
+
+	/*
+	 * state == 0 means secure platform management
+	 * feature is not configured in BIOS.
+	*/
+	if (data->state == 0)
+		goto status_show_exit;
+
+	sysfs_emit(buf, "%sNonce: %d\n", buf, data->nonce);
+	sysfs_emit(buf, "%sFeaturesInUse: %d\n", buf, data->features);
+	sysfs_emit(buf, "%sEndorsementKeyMod: {", buf);
+
+	for (i = 255; i >= 0; i--)
+		sysfs_emit(buf, "%s %u", buf, data->kek_mod[i]);
+
+	sysfs_emit(buf, "%s }\n", buf);
+	sysfs_emit(buf, "%sSigningKeyMod: {", buf);
+
+	for (i = 255; i >= 0; i--)
+		sysfs_emit(buf, "%s %u", buf, data->sk_mod[i]);
+
+	/* Return buf contents */
+
+	sysfs_emit(buf, "%s }\n", buf);
+
+status_show_exit:
+	kfree(data);
+
+	return strnlen(buf, PAGE_SIZE);
+}
+
+struct kobj_attribute password_spm_status = __ATTR_RO(status);
+
+attribute_spm_n_property_show(is_enabled, spm);
+static struct kobj_attribute password_spm_is_key_enabled = __ATTR_RO(is_enabled);
+
+
+static ssize_t key_mechanism_show(struct kobject *kobj, struct kobj_attribute *attr,
+			   char *buf)
+{
+	int ret;
+
+	ret = sysfs_emit(buf, "%s\n",
+		       spm_mechanism_types[bioscfg_drv.spm_data.mechanism]);
+	return ret;
+}
+static struct kobj_attribute password_spm_key_mechanism = __ATTR_RO(key_mechanism);
+
+static ssize_t sk_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	int ret;
+	int length;
+
+	length = count;
+	if (buf[length-1] == '\n')
+		length--;
+
+	/* allocate space and copy current signing key */
+	bioscfg_drv.spm_data.signing_key = kmalloc(length, GFP_KERNEL);
+	if (!bioscfg_drv.spm_data.signing_key) {
+		ret = -ENOMEM;
+		goto exit_signing_key;
+	}
+
+	memcpy(bioscfg_drv.spm_data.signing_key, buf, length);
+	bioscfg_drv.spm_data.signing_key[length] = '\0';
+
+	/* submit signing key payload */
+	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_SK,
+				   HPWMI_SECUREPLATFORM,
+				   (void *)bioscfg_drv.spm_data.signing_key,
+				   length, 0);
+
+	if (!ret) {
+		bioscfg_drv.spm_data.mechanism = SIGNING_KEY;
+		bioscfg_drv.pending_reboot = TRUE;
+	}
+
+exit_signing_key:
+	kfree(bioscfg_drv.spm_data.signing_key);
+	bioscfg_drv.spm_data.signing_key = NULL;
+
+	return ret ? ret : count;
+}
+
+static struct kobj_attribute password_spm_signing_key = __ATTR_WO(sk);
+
+static ssize_t kek_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	int ret;
+	int length;
+
+	length = count;
+	if (buf[length-1] == '\n')
+		length--;
+
+	/* allocate space and copy current signing key */
+	bioscfg_drv.spm_data.endorsement_key = kmalloc(length, GFP_KERNEL);
+	if (!bioscfg_drv.spm_data.endorsement_key) {
+		ret = -ENOMEM;
+		goto exit_endorsement_key;
+	}
+
+	memcpy(bioscfg_drv.spm_data.endorsement_key, buf, length);
+	bioscfg_drv.spm_data.endorsement_key[length] = '\0';
+
+	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_KEK,
+				   HPWMI_SECUREPLATFORM,
+				   (void *)bioscfg_drv.spm_data.endorsement_key,
+				   count, 0);
+
+	if (!ret) {
+		bioscfg_drv.spm_data.mechanism = ENDORSEMENT_KEY;
+		bioscfg_drv.pending_reboot = TRUE;
+	}
+
+exit_endorsement_key:
+	kfree(bioscfg_drv.spm_data.endorsement_key);
+	bioscfg_drv.spm_data.endorsement_key = NULL;
+
+	return ret ? ret : count;
+}
+static struct kobj_attribute password_spm_endorsement_key = __ATTR_WO(kek);
+
+static ssize_t display_name_language_code_show(struct kobject *kobj,
+					       struct kobj_attribute *attr,
+					       char *buf)
+{
+	return sysfs_emit(buf, "%s\n", LANG_CODE_STR);
+}
+
+static struct kobj_attribute password_spm_display_langcode =
+		__ATTR_RO(display_name_language_code);
+
+
+static ssize_t display_name_show(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%s\n", SPM_STR_DESC);
+}
+static struct kobj_attribute password_spm_display_name = __ATTR_RO(display_name);
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "secure-platform-management\n");
+}
+static struct kobj_attribute password_spm_type = __ATTR_RO(type);
+
+static ssize_t role_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "%s\n", role_type[BIOS_SPM]);
+}
+static struct kobj_attribute password_spm_role = __ATTR_RO(role);
+
+static struct attribute *secure_platform_attrs[] = {
+	&password_spm_display_name.attr,
+	&password_spm_display_langcode.attr,
+	&password_spm_is_key_enabled.attr,
+	&password_spm_signing_key.attr,
+	&password_spm_endorsement_key.attr,
+	&password_spm_key_mechanism.attr,
+	&password_spm_status.attr,
+	&password_spm_statusbin.attr,
+	&password_spm_type.attr,
+	&password_spm_role.attr,
+	NULL,
+};
+
+static const struct attribute_group secure_platform_attr_group = {
+	.attrs = secure_platform_attrs,
+};
+
+void exit_secure_platform_attributes(void)
+{
+	/* remove secure platform sysfs entry and free key data*/
+
+	kfree(bioscfg_drv.spm_data.endorsement_key);
+	bioscfg_drv.spm_data.endorsement_key = NULL;
+
+	kfree(bioscfg_drv.spm_data.signing_key);
+	bioscfg_drv.spm_data.signing_key = NULL;
+
+	sysfs_remove_group(bioscfg_drv.spm_data.attr_name_kobj,
+			   &secure_platform_attr_group);
+}
+
+int populate_secure_platform_data(struct kobject *attr_name_kobj)
+{
+	/* Populate data for Secure Platform Management */
+	bioscfg_drv.spm_data.type = HPWMI_SECURE_PLATFORM_TYPE;
+	bioscfg_drv.spm_data.attr_name_kobj = attr_name_kobj;
+
+	strscpy(bioscfg_drv.spm_data.attribute_name, SPM_STR,
+		sizeof(bioscfg_drv.spm_data.attribute_name));
+	strscpy(bioscfg_drv.spm_data.display_name, SPM_STR_DESC,
+		sizeof(bioscfg_drv.spm_data.display_name));
+
+	bioscfg_drv.spm_data.is_enabled = 0;
+	bioscfg_drv.spm_data.mechanism = 0;
+	bioscfg_drv.pending_reboot = FALSE;
+	update_spm_state();
+
+	bioscfg_drv.spm_data.endorsement_key = NULL;
+	bioscfg_drv.spm_data.signing_key = NULL;
+
+	return sysfs_create_group(attr_name_kobj, &secure_platform_attr_group);
+}
-- 
2.34.1

