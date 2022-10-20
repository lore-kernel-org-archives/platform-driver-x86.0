Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB54C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 Oct 2022 20:10:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbiJTUK5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 20 Oct 2022 16:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbiJTUK4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Oct 2022 16:10:56 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBAE415CB03
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Oct 2022 13:10:51 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1322d768ba7so960043fac.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Oct 2022 13:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHFQWiNNJHWvX89Uq8jv6+4k/ljSMrMgjxN1Mjs2RnU=;
        b=fdPC6f0mc3wPTnok/RT/CDpQoUk2hi5GGMJLNJdGPhqGNBVOR2x4xUjbWezaeOmJdf
         4Ttmpn7ekMb9Gip6E7x2A9y/8ic6tcT1Rec2f3rAqVCcnGosL6apkTxKusyGPKGfzjJP
         Wfo97y2fLx5eXCPSFTLmaVviVxwegprS/wjTA979stJFGbMsNmd/XuSrH/NpuNpUGTAe
         0BYMsOYMhmZlDrOpE/Gwj+sc/IBc8eB/sDuht/0vGG6hMnCx0IgDS3x5C9sl/HPDOoF8
         +AEYFPCdlZKUQ5vGt/A3n3Sog8euzrhwc6kGNTVx/OrqUptxk6j+cu4M5lYQAknB3HGj
         XNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHFQWiNNJHWvX89Uq8jv6+4k/ljSMrMgjxN1Mjs2RnU=;
        b=P6NQxqd1uzOh33qQ5V2B+EROirfmqvxNo5S4E+caU7UfPeY2Jwnzyzk3uSPHirgBPD
         LoVQNs/K11boa86qJG4TfOqA9eP46FlhwoOfOnoQ7vccU8ZyjEL+Kmgp8u477DHkJSdC
         Uxu373Ne5iq0kl7ftogBR6FgRXatMSeInXPGguSfginI6e3rz5HReAR8J6/7C6XdXb7J
         bBY1w9taSz1v79J/vG+ALHj3nFwYPITZBUG2llIDsbvLzUWU0xkOXF94oaRHe2krk9mx
         bpYXQydLKLKi7srgYuXwS+D3H1my57cn6yqfsIZAV15grDAGcBr6jcdKYRlTFToiIsJv
         4+7Q==
X-Gm-Message-State: ACrzQf08AIgxDpD3k/k/cNpmP365FYM9BuYramW7fqEpNul8O+hRh8da
        Sf63K++mCMH0Cn5t/8dql91ZRaM/AT0=
X-Google-Smtp-Source: AMsMyM6jOSzCE64cAXz1FJ3WYIEOMY/ANI90XG/FQ2bdr5c8/84JReXSZDIZuMDwEEfZopaOnhMahA==
X-Received: by 2002:a05:6870:b4a8:b0:132:21a3:f71e with SMTP id y40-20020a056870b4a800b0013221a3f71emr26959891oap.266.1666296639226;
        Thu, 20 Oct 2022 13:10:39 -0700 (PDT)
Received: from grumpy-Fury.hsd1.tx.comcast.net ([2601:2c3:480:7390:ece5:3818:e03c:2cb7])
        by smtp.gmail.com with ESMTPSA id a25-20020a544e19000000b003539686cb7bsm302896oiy.53.2022.10.20.13.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 13:10:38 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 5/6] HP BIOSCFG driver - set 4
Date:   Thu, 20 Oct 2022 15:10:32 -0500
Message-Id: <20221020201033.12790-6-jorge.lopez2@hp.com>
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
broken in several patches.  This is set 4 of 4.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 .../x86/hp/hp-bioscfg/sureadmin-attributes.c  | 1014 +++++++++++++++++
 .../x86/hp/hp-bioscfg/surestart-attributes.c  |  145 +++
 2 files changed, 1159 insertions(+)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/sureadmin-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c

diff --git a/drivers/platform/x86/hp/hp-bioscfg/sureadmin-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/sureadmin-attributes.c
new file mode 100644
index 000000000000..5ad45cdddad9
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
+	return sprintf(buf, "sure-admin\n");
+}
+static struct kobj_attribute sure_admin_type = __ATTR_RO(type);
+
+static ssize_t display_name_language_code_show(struct kobject *kobj,
+					       struct kobj_attribute *attr,
+					       char *buf)
+{
+	return sprintf(buf, "%s\n", LANG_CODE_STR);
+}
+
+static struct kobj_attribute sure_admin_display_langcode =
+		__ATTR_RO(display_name_language_code);
+
+
+static ssize_t display_name_show(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%s\n", SURE_ADMIN_DESC);
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
index 000000000000..41c5a549f2ca
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
@@ -0,0 +1,145 @@
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
+	ret = hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG_COUNT, HPWMI_SURESTART,
+				   &count, 0, sizeof(count));
+	if (ret < 0)
+		return ret;
+
+	return snprintf(buf, PAGE_SIZE, "%d,%d,%d\n", count, LOG_ENTRY_SIZE, LOG_MAX_ENTRIES);
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
+	ret = hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG_COUNT, HPWMI_SURESTART,
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
+	return sprintf(buf, "sure-start\n");
+}
+static struct kobj_attribute sure_start_type = __ATTR_RO(type);
+
+static ssize_t display_name_language_code_show(struct kobject *kobj,
+					       struct kobj_attribute *attr,
+					       char *buf)
+{
+	return sprintf(buf, "%s\n", LANG_CODE_STR);
+}
+
+static struct kobj_attribute sure_start_display_langcode =
+		__ATTR_RO(display_name_language_code);
+
+
+static ssize_t display_name_show(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%s\n", SURE_START_DESC);
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
+	sysfs_remove_group(bioscfg_drv.sure_start_attr_kobj, &sure_start_attr_group);
+}
+
+int populate_sure_start_data(struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.sure_start_attr_kobj = attr_name_kobj;
+	return sysfs_create_group(attr_name_kobj, &sure_start_attr_group);
+}
-- 
2.34.1

