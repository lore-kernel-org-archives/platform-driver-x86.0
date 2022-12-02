Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFCBC4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Dec 2022 17:36:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233736AbiLBRga (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 2 Dec 2022 12:36:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233764AbiLBRga (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Dec 2022 12:36:30 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DCDECE60
        for <platform-driver-x86@vger.kernel.org>; Fri,  2 Dec 2022 09:36:22 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id p24-20020a0568301d5800b0066e6dc09be5so3336615oth.8
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Dec 2022 09:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJpMXRYuLHGBRHSWiW0ovtE8BBN7YmWuPVKG/ACwtZo=;
        b=LJwWnARGWQpwnaoLooeZXCYb+fgNtangP/9x0uBAM/wkwlhyeGiNgQUU6KEr1F2sOe
         OzoqSfmV4nSXLZ1BSz2GUyAEEuPEEWLjaeUplvGjTrR7fkt9yMUpH7+sr7O3J8T72IZ9
         fwQoW1DijqoxIVC759uHA+w1s/Jv3c9s8yAvR8/ZRC8P+ue64Hfp4wVqxMYTSodF5gmB
         kpTD9trbb5WQ0PzBo69085uu3CxSMwnNfh+492YWQ1vOVwjWLuqTI/Ko71m1oucycLxW
         z3ZGDhk1c1Rl7Upwx36NfFBysmnicD2IBSZGl6oAy+6sm0NcK/xgHPPzpAdF0X66pnbZ
         2woQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJpMXRYuLHGBRHSWiW0ovtE8BBN7YmWuPVKG/ACwtZo=;
        b=dMLYj/E11Fr38KKAQMfGfaVOJQ2lU6zXKec+Izcf/EQSXQXq185mvIrHbOABrL8dEK
         lgGqWk4kp2eL9WG1kaqx6cmvwqZnHi+4kOqS/1u5g1SlOm0nUwJBeyKEsecky3XGV3g4
         PrrQsOkdryd3fmTYsXxQ+OS73WS8SVpQ8VfndOGgneGRThKRiasff3XJKPGRDLOqjFhX
         NzHUduc/rhOKreDohjETZJL7QXWsem9fIipNwmkf7J7etP3GiUwpH2Nzp+u6R6OoxMln
         ajZ1RHklp9GH4HHCJPKreRsbDKQlNWjnu6k3HsVcUaRha3y6szTLKeA5i5wUyDn4Eth8
         TTFA==
X-Gm-Message-State: ANoB5pnpSZWN1CIVTIlYgqPoAt2mz0OmqcqJ6FuIlHQTFsEI7I8T3Cm9
        CsnKHf+sWR1uSQNJEVZq6nrF9O2r7MbB1Q==
X-Google-Smtp-Source: AA0mqf4bBapZTwtn8Ii3HknPuqgIMyPje5NwTq9SBbg6AlvWqJKJl1TK3XXZzM73DA7sY+OhCsuQzA==
X-Received: by 2002:a9d:17a9:0:b0:66c:9c02:8148 with SMTP id j38-20020a9d17a9000000b0066c9c028148mr36640084otj.240.1670002581003;
        Fri, 02 Dec 2022 09:36:21 -0800 (PST)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:bec7:8390:5104:e759])
        by smtp.gmail.com with ESMTPSA id n7-20020a056870558700b0013cd709659dsm4371692oao.52.2022.12.02.09.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:36:20 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 2/5] Introduction of HP-BIOSCFG driver (2)
Date:   Fri,  2 Dec 2022 11:36:13 -0600
Message-Id: <20221202173616.180108-3-jorge.lopez2@hp.com>
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
 .../x86/hp/hp-bioscfg/biosattr-interface.c    |  283 +++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 1066 +++++++++++++++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  |  673 +++++++++++
 3 files changed, 2022 insertions(+)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h

diff --git a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
new file mode 100644
index 000000000000..20620762dcaa
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to methods under BIOS interface GUID
+ * for use with hp-bioscfg driver.
+ *
+ *  Copyright (c) 2022 Hewlett-Packard Inc.
+ */
+
+#include <linux/wmi.h>
+#include "bioscfg.h"
+
+#define SET_DEFAULT_VALUES_METHOD_ID	0x02
+#define SET_BIOS_DEFAULTS_METHOD_ID	0x03
+#define SET_ATTRIBUTE_METHOD_ID		0x04
+
+/*
+ * set_attribute() - Update an attribute value
+ * @a_name: The attribute name
+ * @a_value: The attribute value
+ *
+ * Sets an attribute to new value
+ */
+int hp_set_attribute(const char *a_name, const char *a_value)
+{
+	size_t security_area_size;
+	size_t a_name_size, a_value_size;
+	u16 *buffer = NULL;
+	u16 *start = NULL;
+	int  buffer_size;
+	int ret;
+	int instance;
+	char *auth_empty_value = "";
+
+	mutex_lock(&bioscfg_drv.mutex);
+	if (!bioscfg_drv.bios_attr_wdev) {
+		ret = -ENODEV;
+		goto out_set_attribute;
+	}
+
+	instance = get_password_instance_for_type(SETUP_PASSWD);
+	if (instance < 0)
+		goto out_set_attribute;
+
+	if (strlen(bioscfg_drv.password_data[instance].current_password) == 0)
+		strscpy(bioscfg_drv.password_data[instance].current_password,
+			auth_empty_value,
+			sizeof(bioscfg_drv.password_data[instance].current_password));
+
+	a_name_size = calculate_string_buffer(a_name);
+	a_value_size = calculate_string_buffer(a_value);
+	security_area_size = calculate_security_buffer(bioscfg_drv.password_data[instance].current_password);
+	buffer_size = a_name_size + a_value_size + security_area_size;
+
+	buffer = kzalloc(buffer_size, GFP_KERNEL);
+	if (!buffer) {
+		ret = -ENOMEM;
+		goto out_set_attribute;
+	}
+
+	/* build variables to set */
+	start = buffer;
+	start = ascii_to_utf16_unicode(start, a_name);
+	if (!start)
+		goto out_set_attribute;
+
+	start = ascii_to_utf16_unicode(start, a_value);
+	if (!start)
+		goto out_set_attribute;
+
+	populate_security_buffer(start, bioscfg_drv.password_data[instance].current_password);
+	ret = hp_wmi_set_bios_setting(buffer, buffer_size);
+
+
+out_set_attribute:
+	kfree(buffer);
+	mutex_unlock(&bioscfg_drv.mutex);
+	return ret;
+}
+
+/*
+ * hp_wmi_perform_query
+ *
+ * query:	The commandtype (enum hp_wmi_commandtype)
+ * write:	The command (enum hp_wmi_command)
+ * buffer:	Buffer used as input and/or output
+ * insize:	Size of input buffer
+ * outsize:	Size of output buffer
+ *
+ * returns zero on success
+ *         an HP WMI query specific error code (which is positive)
+ *         -EINVAL if the query was not successful at all
+ *         -EINVAL if the output buffer size exceeds buffersize
+ *
+ * Note: The buffersize must at least be the maximum of the input and output
+ *       size. E.g. Battery info query is defined to have 1 byte input
+ *       and 128 byte output. The caller would do:
+ *       buffer = kzalloc(128, GFP_KERNEL);
+ *       ret = hp_wmi_perform_query(HPWMI_BATTERY_QUERY, HPWMI_READ,
+ *				    buffer, 1, 128)
+ */
+int hp_wmi_perform_query(int query, enum hp_wmi_command command, void *buffer,
+			 int insize, int outsize)
+{
+	struct acpi_buffer input, output = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct bios_return *bios_return;
+	union acpi_object *obj = NULL;
+	struct bios_args *args = NULL;
+	int mid, actual_insize, actual_outsize;
+	size_t bios_args_size;
+	int ret;
+
+	mid = encode_outsize_for_pvsz(outsize);
+	if (WARN_ON(mid < 0))
+		return mid;
+
+	actual_insize = insize;
+	bios_args_size = struct_size(args, data, insize);
+	args = kmalloc(bios_args_size, GFP_KERNEL);
+	if (!args)
+		return -ENOMEM;
+
+	input.length = bios_args_size;
+	input.pointer = args;
+
+	args->signature = 0x55434553;
+	args->command = command;
+	args->commandtype = query;
+	args->datasize = insize;
+	memcpy(args->data, buffer, flex_array_size(args, data, insize));
+
+	ret = wmi_evaluate_method(HP_WMI_BIOS_GUID, 0, mid, &input, &output);
+	bioscfg_drv.last_wmi_status = ret;
+	if (ret)
+		goto out_free;
+
+	obj = output.pointer;
+	if (!obj) {
+		ret = -EINVAL;
+		goto out_free;
+	}
+
+
+	bios_return = (struct bios_return *)obj->buffer.pointer;
+	if (!bios_return) {
+		ret = -EINVAL;
+		goto out_free;
+	}
+
+
+	ret = bios_return->return_code;
+	bioscfg_drv.last_wmi_status = ret;
+	if (ret) {
+		if (ret != HPWMI_RET_UNKNOWN_COMMAND &&
+		    ret != HPWMI_RET_UNKNOWN_CMDTYPE)
+			pr_warn("query 0x%x returned error 0x%x\n", query, ret);
+		goto out_free;
+	}
+
+	/* Ignore output data of zero size */
+	if (!outsize)
+		goto out_free;
+
+	actual_outsize = min(outsize, (int)(obj->buffer.length - sizeof(*bios_return)));
+	memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actual_outsize);
+	memset(buffer + actual_outsize, 0, outsize - actual_outsize);
+
+out_free:
+	kfree(obj);
+	kfree(args);
+	return ret;
+}
+
+/*
+ * ascii_to_utf16_unicode -  Convert ascii string to UTF-16 unicode
+ *
+ * @p:   Unicode buffer address
+ * @str: string to convert to unicode
+ *
+ * Returns a void pointer to the buffer containing unicode string
+ */
+void *ascii_to_utf16_unicode(u16 *p, const u8 *str)
+{
+	int len = strlen(str);
+	int ret;
+
+	/*
+	 * Add null character when reading an empty string
+	 */
+	if (len == 0) {
+		*p++ = 2;
+		*p++ = (u8)0x00;
+		return p;
+	}
+	*p++ = len * 2;
+	ret = utf8s_to_utf16s(str, strlen(str), UTF16_HOST_ENDIAN, p, len);
+
+	if (ret < 0) {
+		dev_err(bioscfg_drv.class_dev, "UTF16 conversion failed\n");
+		goto ascii_to_utf16_unicode_out;
+	}
+
+	if ((ret * sizeof(u16)) > U16_MAX) {
+		dev_err(bioscfg_drv.class_dev, "Error string too long\n");
+		goto ascii_to_utf16_unicode_out;
+	}
+
+ascii_to_utf16_unicode_out:
+	p += len;
+	return p;
+}
+
+/*
+ * hp_wmi_set_bios_setting - Set setting's value in BIOS
+ *
+ * @input_buffer: Input buffer address
+ * @input_size:   Input buffer size
+ *
+ * Returns: Count of unicode characters written to BIOS if successful, otherwise
+ *		-ENOMEM unable to allocate memory
+ *		-EINVAL buffer not allocated or too small
+ */
+int hp_wmi_set_bios_setting(u16 *input_buffer, u32 input_size)
+{
+	union acpi_object *obj;
+	struct acpi_buffer input = {input_size, input_buffer};
+	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
+	int ret = 0;
+
+	ret = wmi_evaluate_method(HP_WMI_SET_BIOS_SETTING_GUID, 0, 1, &input, &output);
+
+	obj = output.pointer;
+	if (!obj)
+		return -EINVAL;
+
+	if (obj->type != ACPI_TYPE_INTEGER)
+		ret = -EINVAL;
+
+	ret = obj->integer.value;
+	bioscfg_drv.last_wmi_status = ret;
+
+	kfree(obj);
+	return ret;
+}
+
+static int bios_attr_set_interface_probe(struct wmi_device *wdev, const void *context)
+{
+	mutex_lock(&bioscfg_drv.mutex);
+	bioscfg_drv.bios_attr_wdev = wdev;
+	mutex_unlock(&bioscfg_drv.mutex);
+	return 0;
+}
+
+static void bios_attr_set_interface_remove(struct wmi_device *wdev)
+{
+	mutex_lock(&bioscfg_drv.mutex);
+	bioscfg_drv.bios_attr_wdev = NULL;
+	mutex_unlock(&bioscfg_drv.mutex);
+}
+
+static const struct wmi_device_id bios_attr_set_interface_id_table[] = {
+	{ .guid_string = HP_WMI_BIOS_GUID},
+	{ },
+};
+static struct wmi_driver bios_attr_set_interface_driver = {
+	.driver = {
+		.name = DRIVER_NAME
+	},
+	.probe = bios_attr_set_interface_probe,
+	.remove = bios_attr_set_interface_remove,
+	.id_table = bios_attr_set_interface_id_table,
+};
+
+int init_bios_attr_set_interface(void)
+{
+	return wmi_driver_register(&bios_attr_set_interface_driver);
+}
+
+void exit_bios_attr_set_interface(void)
+{
+	wmi_driver_unregister(&bios_attr_set_interface_driver);
+}
+
+MODULE_DEVICE_TABLE(wmi, bios_attr_set_interface_id_table);
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
new file mode 100644
index 000000000000..def37b99b03b
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -0,0 +1,1066 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Common methods for use with hp-bioscfg driver
+ *
+ *  Copyright (c) 2022 HP Development Company, L.P.
+ */
+
+#include <asm-generic/errno-base.h>
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/fs.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/wmi.h>
+#include "bioscfg.h"
+#include "../../firmware_attributes_class.h"
+#include <linux/nls.h>
+
+MODULE_AUTHOR("Jorge Lopez <jorge.lopez2@hp.com>");
+MODULE_DESCRIPTION("HP BIOS Configuration Driver");
+MODULE_LICENSE("GPL");
+
+
+#define MAX_TYPES  4
+
+struct bioscfg_priv bioscfg_drv = {
+	.mutex = __MUTEX_INITIALIZER(bioscfg_drv.mutex),
+};
+
+/* reset bios to defaults */
+static const char * const reset_types[] = {"builtinsafe", "lastknowngood", "factory", "custom"};
+static struct class *fw_attr_class;
+
+int get_integer_from_buffer(int **buffer, int *buffer_size, int *integer)
+{
+	int *ptr = PTR_ALIGN(*buffer, 4);
+
+	/* Ensure there is enough space remaining to read the integer */
+	if (*buffer_size < sizeof(int))
+		return -EINVAL;
+
+	*integer = *(ptr++);
+	*buffer = ptr;
+	*buffer_size -= sizeof(int);
+
+	return 0;
+}
+
+int get_string_from_buffer(u16 **buffer, int *buffer_size, char **str)
+{
+	u16 *ptr = *buffer;
+	u16 ptrlen;
+
+	u16 size;
+	int i;
+	char *output = NULL;
+	int escape = 0;
+
+	ptrlen = *(ptr++);
+	size = ptrlen / 2;
+
+	/* Ensure there is enough space remaining to read and convert
+	 * the string
+	 */
+	if (*buffer_size < (size *  sizeof(u16)))
+		return -EINVAL;
+
+
+	for (i = 0; i < size; i++)
+		if (ptr[i] == '\\' || ptr[i] == '\r' || ptr[i] == '\n' || ptr[i] == '\t')
+			escape++;
+
+	size += escape;
+	*str = kcalloc(size + 1, sizeof(char), GFP_KERNEL);
+	if (!*str)
+		return -ENOMEM;
+
+	output = *str;
+
+	/*
+	 * convert from UTF-16 unicode to ASCII
+	 */
+	utf16s_to_utf8s(ptr, ptrlen, UTF16_HOST_ENDIAN, output, size);
+
+	for (i = 0; i < size; i++) {
+		if (*ptr == '\\' || *ptr == '\r' || *ptr == '\n' || *ptr == '\t')
+			output[i++] = '\\';
+
+		if (*ptr == '\r')
+			output[i] = 'r';
+		else if (*ptr == '\n')
+			output[i] = 'n';
+		else if (*ptr == '\t')
+			output[i] = 't';
+		else if (*ptr == '"')
+			output[i] = '\'';
+		else
+			output[i] = *ptr;
+		ptr++;
+	}
+
+	*buffer = ptr;
+	*buffer_size -= size * sizeof(u16);
+	return size;
+}
+
+/*
+ * populate_string_buffer() - populates a string buffer
+ * @buffer: the start of the destination buffer
+ * @buffer_len: length of the destination buffer
+ * @str: the string to insert into buffer
+ */
+ssize_t populate_string_buffer(u16 *buffer, size_t buffer_len, const char *str)
+{
+	u16 *target = buffer;
+	int ret;
+
+	ret = utf8s_to_utf16s(str, strlen(str), UTF16_HOST_ENDIAN,
+			      target, buffer_len - sizeof(u16));
+	if (ret < 0) {
+		dev_err(bioscfg_drv.class_dev, "UTF16 conversion failed\n");
+		return ret;
+	}
+	if ((ret * sizeof(u16)) > U16_MAX) {
+		dev_err(bioscfg_drv.class_dev, "Error string too long\n");
+		return -ERANGE;
+	}
+	return buffer_len;
+}
+
+/*
+ * calculate_string_buffer() - determines size of string buffer for use with BIOS communication
+ * @str: the string to calculate based upon
+ */
+size_t calculate_string_buffer(const char *str)
+{
+	int length = strlen(str);
+	int size;
+
+	/* BIOS expects 4 bytes when an empty string is found */
+	if (!length)
+		length = 1;
+
+
+	/* u16 length field + one UTF16 char for each input char */
+	size =  sizeof(u16) + length * sizeof(u16);
+
+	return size;
+}
+
+int wmi_error_and_message(int error_code, char *msg)
+{
+	char *error_msg = NULL;
+	int ret = -EIO;
+
+	switch (error_code) {
+	case SUCCESS:
+		error_msg = "Success";
+		ret = 0;
+		break;
+	case CMD_FAILED:
+		error_msg = "Command failed";
+		ret = -EINVAL;
+		break;
+	case INVALID_SIGN:
+		error_msg = "Invalid signature";
+		ret = -EINVAL;
+		break;
+	case INVALID_CMD_VALUE:
+		error_msg = "Invalid command value/Feature not supported";
+		ret = -EOPNOTSUPP;
+		break;
+	case INVALID_CMD_TYPE:
+		error_msg = "Invalid command type";
+		ret = -EINVAL;
+		break;
+	case INVALID_DATA_SIZE:
+		error_msg = "Invalid data size";
+		ret = -EINVAL;
+		break;
+	case INVALID_CMD_PARAM:
+		error_msg = "Invalid command parameter";
+		ret = -EINVAL;
+		break;
+	case ENCRYP_CMD_REQUIRED:
+		error_msg = "Secure/encrypted command required";
+		ret = -EACCES;
+		break;
+	case NO_SECURE_SESSION:
+		error_msg = "No secure session established";
+		ret = -EACCES;
+		break;
+	case SECURE_SESSION_FOUND:
+		error_msg = "Secure session already established";
+		ret = -EACCES;
+		break;
+	case SECURE_SESSION_FAILED:
+		error_msg = "Secure session failed";
+		ret = -EIO;
+		break;
+	case AUTH_FAILED:
+		error_msg = "Other permission/Authentication failed";
+		ret = -EACCES;
+		break;
+	case INVALID_BIOS_AUTH:
+		error_msg = "Invalid BIOS administrator password";
+		ret = -EINVAL;
+		break;
+	case NONCE_DID_NOT_MATCH:
+		error_msg = "Nonce did not match";
+		ret = -EINVAL;
+		break;
+	case GENERIC_ERROR:
+		error_msg = "Generic/Other error";
+		ret = -EIO;
+		break;
+	case BIOS_ADMIN_POLICY_NOT_MET:
+		error_msg = "BIOS Admin password does not meet password policy requirements";
+		ret = -EINVAL;
+		break;
+	case BIOS_ADMIN_NOT_SET:
+		error_msg = "BIOS Setup password is not set.";
+		ret = -EPERM;
+		break;
+	case P21_NO_PROVISIONED:
+		error_msg = "P21 is not provisioned";
+		ret = -EPERM;
+		break;
+	case P21_PROVISION_IN_PROGRESS:
+		error_msg = "P21 is already provisioned or provisioning is in progress and a signing key has already been sent.";
+		ret = -EINPROGRESS;
+		break;
+	case P21_IN_USE:
+		error_msg = "P21 in use (cannot deprovision)";
+		ret = -EPERM;
+		break;
+	case HEP_NOT_ACTIVE:
+		error_msg = "HEP not activated";
+		ret = -EPERM;
+		break;
+	case HEP_ALREADY_SET:
+		error_msg = "HEP Transport already set";
+		ret = -EINVAL;
+		break;
+	case HEP_CHECK_STATE:
+		error_msg = "Check the current HEP state";
+		ret = -EINVAL;
+		break;
+	default:
+		error_msg = "Generic/Other error";
+		ret = -EIO;
+		break;
+	}
+
+	if (msg != NULL)
+		sprintf(msg, "%d,\"%s\"", error_code, error_msg);
+	return error_code;
+}
+
+
+/*
+ * pending_reboot_show() - sysfs implementaton for read pending_reboot
+ * @kobj: Kernel object for this attribute
+ * @attr: Kernel object attribute
+ * @buf: The buffer to display to userspace
+ *
+ * Stores default value as 0
+ * When current_value is changed this attribute is set to 1 to notify reboot may be required
+ */
+static ssize_t pending_reboot_show(struct kobject *kobj,
+				   struct kobj_attribute *attr,
+				   char *buf)
+{
+	return sysfs_emit(buf, "%d\n", bioscfg_drv.pending_reboot);
+}
+static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
+
+/*
+ * last_error_show() - sysfs implementaton for reporting the WMI
+ * error/success value.
+ * @kobj: Kernel object for this attribute
+ * @attr: Kernel object attribute
+ * @buf: The buffer to display to userspace
+ */
+static ssize_t last_error_show(struct kobject *kobj,
+			       struct kobj_attribute *attr,
+				   char *buf)
+{
+	wmi_error_and_message(bioscfg_drv.last_wmi_status, buf);
+	return sysfs_emit(buf, "%s\n", buf);
+}
+static struct kobj_attribute last_error = __ATTR_RO(last_error);
+
+/*
+ * create_attributes_level_sysfs_files() - Creates reset_bios,
+ * pending_reboot, and last_error attributes
+ */
+static int create_attributes_level_sysfs_files(void)
+{
+	int ret;
+
+	ret = sysfs_create_file(&bioscfg_drv.main_dir_kset->kobj, &pending_reboot.attr);
+	if (ret)
+		return ret;
+
+	ret = sysfs_create_file(&bioscfg_drv.main_dir_kset->kobj, &last_error.attr);
+	if (ret)
+		return ret;
+
+	bioscfg_drv.last_wmi_status = 0;
+	return 0;
+}
+
+
+static ssize_t bioscfg_attr_show(struct kobject *kobj, struct attribute *attr,
+				    char *buf)
+{
+	struct kobj_attribute *kattr;
+	ssize_t ret = -EIO;
+
+	kattr = container_of(attr, struct kobj_attribute, attr);
+	if (kattr->show)
+		ret = kattr->show(kobj, kattr, buf);
+	return ret;
+}
+
+static ssize_t bioscfg_attr_store(struct kobject *kobj, struct attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct kobj_attribute *kattr;
+	ssize_t ret = -EIO;
+
+	kattr = container_of(attr, struct kobj_attribute, attr);
+	if (kattr->store)
+		ret = kattr->store(kobj, kattr, buf, count);
+	return ret;
+}
+
+static const struct sysfs_ops bioscfg_kobj_sysfs_ops = {
+	.show	= bioscfg_attr_show,
+	.store	= bioscfg_attr_store,
+};
+
+static void attr_name_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
+static struct kobj_type attr_name_ktype = {
+	.release	= attr_name_release,
+	.sysfs_ops	= &bioscfg_kobj_sysfs_ops,
+};
+
+/*
+ * strlcpy_attr - Copy a length-limited, NULL-terminated string with bound checks
+ * @dest: Where to copy the string to
+ * @src: Where to copy the string from
+ */
+void strlcpy_attr(char *dest, char *src)
+{
+	size_t len = strlen(src) + 1;
+
+	if (len > 1 && len <= MAX_BUFF)
+		strscpy(dest, src, len);
+
+	/*
+	 * len can be zero because any property not-applicable to attribute can
+	 * be empty so check only for too long buffers and log error
+	 */
+	if (len > MAX_BUFF)
+		pr_err("Source string returned from BIOS is out of bound!\n");
+}
+
+/*
+ * get_wmiobj_pointer() - Get Content of WMI block for particular instance
+ *
+ * @instance_id: WMI instance ID
+ * @guid_string: WMI GUID (in str form)
+ *
+ * Fetches the content for WMI block (instance_id) under GUID (guid_string)
+ * Caller must kfree the return
+ */
+union acpi_object *get_wmiobj_pointer(int instance_id, const char *guid_string)
+{
+	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+
+	status = wmi_query_block(guid_string, instance_id, &out);
+	return ACPI_SUCCESS(status) ? (union acpi_object *)out.pointer : NULL;
+}
+
+/*
+ * get_instance_count() - Compute total number of instances under guid_string
+ *
+ * @guid_string: WMI GUID (in string form)
+ */
+int get_instance_count(const char *guid_string)
+{
+	union acpi_object *wmi_obj = NULL;
+	int i = 0;
+
+	do {
+		kfree(wmi_obj);
+		wmi_obj = get_wmiobj_pointer(i, guid_string);
+		i++;
+	} while (wmi_obj);
+
+	return (i-1);
+}
+
+/*
+ * alloc_attributes_data() - Allocate attributes data for a particular type
+ *
+ * @attr_type: Attribute type to allocate
+ */
+static int alloc_attributes_data(int attr_type)
+{
+	int retval = 0;
+
+	switch (attr_type) {
+	case HPWMI_STRING_TYPE:
+		retval = alloc_string_data();
+		break;
+	case HPWMI_INTEGER_TYPE:
+		retval = alloc_integer_data();
+		break;
+	case HPWMI_ENUMERATION_TYPE:
+		retval = alloc_enumeration_data();
+		break;
+	case HPWMI_ORDERED_LIST_TYPE:
+		retval = alloc_ordered_list_data();
+		break;
+	case HPWMI_PASSWORD_TYPE:
+		retval = alloc_password_data();
+		break;
+	default:
+		break;
+	}
+
+	return retval;
+}
+
+int convert_hexstr_to_int(char *str, int *int_value)
+{
+	int ret;
+
+	ret = kstrtou32(str, 10, int_value);
+	return ret;
+}
+
+int convert_hexstr_to_str(char **hex, int input_len, char **str, int *len)
+{
+	int ret = 0;
+	int new_len = 0;
+	char tmp[] = "0x00";
+	char *input = *hex;
+	char *new_str = NULL;
+	long  ch;
+	int i;
+
+	if (input_len <= 0 || hex == NULL || str == NULL || len == NULL)
+		return -EINVAL;
+
+	*len = 0;
+	*str = NULL;
+
+	new_str = kmalloc(input_len, GFP_KERNEL);
+	if (!new_str)
+		return -ENOMEM;
+
+	for (i = 0; i < input_len; i += 5) {
+		strncpy(tmp, input + i, strlen(tmp));
+		if (kstrtol(tmp, 16, &ch) == 0) {
+			// escape char
+			if (ch == '\\' || ch == '\r' || ch == '\n' || ch == '\t') {
+				if (ch == '\r')
+					ch = 'r';
+				else if (ch == '\n')
+					ch = 'n';
+				else if (ch == '\t')
+					ch = 't';
+				new_str[new_len++] = '\\';
+			}
+			new_str[new_len++] = ch;
+			if (ch == '\0')
+				break;
+		}
+	}
+
+	if (new_len) {
+		new_str[new_len] = '\0';
+		*str = krealloc(new_str, (new_len + 1) * sizeof(char), GFP_KERNEL);
+		if (*str)
+			*len = new_len;
+		else
+			ret = -ENOMEM;
+	} else {
+		ret = -EFAULT;
+	}
+
+	if (ret)
+		kfree(new_str);
+	return ret;
+}
+
+/* map output size to the corresponding WMI method id */
+inline int encode_outsize_for_pvsz(int outsize)
+{
+	if (outsize > 4096)
+		return -EINVAL;
+	if (outsize > 1024)
+		return 5;
+	if (outsize > 128)
+		return 4;
+	if (outsize > 4)
+		return 3;
+	if (outsize > 0)
+		return 2;
+	return 1;
+}
+
+/*
+ * Update friendly display name for several attributes associated to
+ * 'Schedule Power-On'
+ */
+void friendly_user_name_update(char *path, const char *attr_name,
+				char *attr_display, int attr_size)
+{
+	char *found = NULL;
+
+	found = strstr(path, SCHEDULE_POWER_ON);
+	if (found)
+		snprintf(attr_display,
+			 attr_size,
+			 "%s - %s",
+			 SCHEDULE_POWER_ON,
+			 attr_name);
+	else
+		strscpy(attr_display, attr_name, attr_size);
+}
+
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
+		current_val->attr.mode = (umode_t)0644;
+}
+
+
+/**
+ * destroy_attribute_objs() - Free a kset of kobjects
+ * @kset: The kset to destroy
+ *
+ * Fress kobjects created for each attribute_name under attribute type kset
+ */
+static void destroy_attribute_objs(struct kset *kset)
+{
+	struct kobject *pos, *next;
+
+	list_for_each_entry_safe(pos, next, &kset->list, entry)
+		kobject_put(pos);
+}
+
+/**
+ * release_attributes_data() - Clean-up all sysfs directories and files created
+ */
+static void release_attributes_data(void)
+{
+	mutex_lock(&bioscfg_drv.mutex);
+
+	exit_string_attributes();
+	exit_integer_attributes();
+	exit_enumeration_attributes();
+	exit_ordered_list_attributes();
+	exit_password_attributes();
+	exit_sure_start_attributes();
+	exit_sure_admin_attributes();
+	exit_secure_platform_attributes();
+
+	if (bioscfg_drv.authentication_dir_kset) {
+		destroy_attribute_objs(bioscfg_drv.authentication_dir_kset);
+		kset_unregister(bioscfg_drv.authentication_dir_kset);
+		bioscfg_drv.authentication_dir_kset = NULL;
+	}
+	if (bioscfg_drv.main_dir_kset) {
+		sysfs_remove_file(&bioscfg_drv.main_dir_kset->kobj, &pending_reboot.attr);
+		sysfs_remove_file(&bioscfg_drv.main_dir_kset->kobj, &last_error.attr);
+		destroy_attribute_objs(bioscfg_drv.main_dir_kset);
+		kset_unregister(bioscfg_drv.main_dir_kset);
+		bioscfg_drv.main_dir_kset = NULL;
+	}
+	mutex_unlock(&bioscfg_drv.mutex);
+}
+
+
+/*
+ * hp_add_other_attributes - Initialize HP custom attributes not reported by
+ * BIOS and required to support Secure Platform, Sure Start, and Sure
+ * Admin.
+ * @attr_type: Custom HP attribute not reported by BIOS
+ *
+ * Initialiaze all 3 types of attributes: Platform, Sure Start, and Sure
+ * Admin object.  Populates each attrbute types respective properties
+ * under sysfs files.
+ *
+ * Returns zero(0) if successful.  Otherwise, a negative value.
+ */
+static int hp_add_other_attributes(int attr_type)
+{
+	struct kobject *attr_name_kobj;
+	union acpi_object *obj = NULL;
+	int retval = 0;
+	u8 *attr_name;
+
+	mutex_lock(&bioscfg_drv.mutex);
+
+	attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
+	if (!attr_name_kobj) {
+		retval = -ENOMEM;
+		goto err_other_attr_init;
+	}
+
+	/* Check if attribute type is supported */
+	switch (attr_type) {
+	case HPWMI_SECURE_PLATFORM_TYPE:
+		attr_name_kobj->kset = bioscfg_drv.authentication_dir_kset;
+		attr_name = SPM_STR;
+		break;
+
+	case HPWMI_SURE_START_TYPE:
+		attr_name_kobj->kset = bioscfg_drv.main_dir_kset;
+		attr_name = SURE_START_STR;
+		break;
+
+	case HPWMI_SURE_ADMIN_TYPE:
+		attr_name_kobj->kset = bioscfg_drv.main_dir_kset;
+		attr_name = SURE_ADMIN_STR;
+		break;
+	default:
+		pr_err("Error: Unknown attr_type: %d\n", attr_type);
+		retval = -EINVAL;
+		goto err_other_attr_init;
+	}
+
+	retval = kobject_init_and_add(attr_name_kobj, &attr_name_ktype,
+				      NULL, "%s", attr_name);
+	if (retval) {
+		pr_err("Error encountered [%d]\n", retval);
+		kobject_put(attr_name_kobj);
+		goto err_other_attr_init;
+	}
+
+	/* Populate attribute data */
+	switch (attr_type) {
+	case HPWMI_SECURE_PLATFORM_TYPE:
+		retval = populate_secure_platform_data(attr_name_kobj);
+		break;
+
+	case HPWMI_SURE_START_TYPE:
+		retval = populate_sure_start_data(attr_name_kobj);
+		break;
+
+	case HPWMI_SURE_ADMIN_TYPE:
+		retval = populate_sure_admin_data(attr_name_kobj);
+		break;
+
+	default:
+		goto err_other_attr_init;
+	}
+
+	mutex_unlock(&bioscfg_drv.mutex);
+	return 0;
+
+err_other_attr_init:
+	mutex_unlock(&bioscfg_drv.mutex);
+	kfree(obj);
+	return retval;
+}
+
+/*
+ * hp_init_bios_attributes - Initialize all attributes for a type
+ * @attr_type: The attribute type to initialize
+ * @guid: The WMI GUID associated with this type to initialize
+ *
+ * Initialiaze all 5 types of attributes: enumeration, integer,
+ * string, password, ordered list  object.  Populates each attrbute types
+ * respective properties under sysfs files
+ */
+static int hp_init_bios_attributes(int attr_type, const char *guid)
+{
+	struct kobject *attr_name_kobj;
+	union acpi_object *obj = NULL;
+	union acpi_object *elements;
+	struct kset *tmp_set;
+	int min_elements;
+	char *str = NULL;
+	char *temp_str = NULL;
+	char *str_value = NULL;
+	int str_len;
+	int ret = 0;
+
+	u8 *buffer_ptr = NULL;
+	int buffer_size;
+
+
+	/* instance_id needs to be reset for each type GUID
+	 * also, instance IDs are unique within GUID but not across
+	 */
+	int instance_id = 0;
+	int retval = 0;
+
+	retval = alloc_attributes_data(attr_type);
+	if (retval)
+		return retval;
+
+	switch (attr_type) {
+	case HPWMI_STRING_TYPE:
+		min_elements = 12;
+		break;
+	case HPWMI_INTEGER_TYPE:
+		min_elements = 13;
+		break;
+	case HPWMI_ENUMERATION_TYPE:
+		min_elements = 13;
+		break;
+	case HPWMI_ORDERED_LIST_TYPE:
+		min_elements = 12;
+		break;
+	case HPWMI_PASSWORD_TYPE:
+		min_elements = 15;
+		break;
+	default:
+		pr_err("Error: Unknown attr_type: %d\n", attr_type);
+		return -EINVAL;
+	}
+
+	/* need to use specific instance_id and guid combination to get right data */
+	obj = get_wmiobj_pointer(instance_id, guid);
+
+	if (!obj)
+		return -ENODEV;
+
+	mutex_lock(&bioscfg_drv.mutex);
+	while (obj) {
+		if (obj->type != ACPI_TYPE_PACKAGE && obj->type != ACPI_TYPE_BUFFER) {
+			pr_err("Error: Expected ACPI-package or buffer type, got: %d\n", obj->type);
+			retval = -EIO;
+			goto err_attr_init;
+		}
+
+		/* Take action appropriate to each ACPI TYPE */
+		if (obj->type == ACPI_TYPE_PACKAGE) {
+			if (obj->package.count < min_elements) {
+				pr_err("Error: ACPI-package does not have enough elements: %d < %d\n",
+				       obj->package.count, min_elements);
+				goto nextobj;
+			}
+
+			elements = obj->package.elements;
+			/* sanity checking */
+			if (elements[NAME].type != ACPI_TYPE_STRING) {
+				pr_debug("incorrect element type\n");
+				goto nextobj;
+			}
+			if (strlen(elements[NAME].string.pointer) == 0) {
+				pr_debug("empty attribute found\n");
+				goto nextobj;
+			}
+			if (attr_type == HPWMI_PASSWORD_TYPE)
+				tmp_set = bioscfg_drv.authentication_dir_kset;
+			else
+				tmp_set = bioscfg_drv.main_dir_kset;
+
+			/* convert attribute name to string */
+			retval = convert_hexstr_to_str(&(elements[NAME].string.pointer),
+						       elements[NAME].string.length,
+						       &str_value, &str_len);
+
+			if (ACPI_FAILURE(retval)) {
+				pr_debug("Failed to populate integer package data. Error [0%0x]\n", ret);
+				kfree(str_value);
+				return ret;
+			}
+
+			if (kset_find_obj(tmp_set, str_value)) {
+				pr_debug("Duplicate attribute name found - %s\n",
+					 str_value);
+				goto nextobj;
+			}
+
+			/* build attribute */
+			attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
+			if (!attr_name_kobj) {
+				retval = -ENOMEM;
+				goto err_attr_init;
+			}
+
+			attr_name_kobj->kset = tmp_set;
+
+			retval = kobject_init_and_add(attr_name_kobj, &attr_name_ktype,
+						      NULL, "%s", str_value);
+			if (retval) {
+				kobject_put(attr_name_kobj);
+				goto err_attr_init;
+			}
+
+			/* enumerate all of these attributes */
+			switch (attr_type) {
+			case HPWMI_STRING_TYPE:
+				retval = populate_string_package_data(elements,
+								      instance_id,
+								      attr_name_kobj);
+				break;
+			case HPWMI_INTEGER_TYPE:
+				retval = populate_integer_package_data(elements,
+								       instance_id,
+								       attr_name_kobj);
+				break;
+			case HPWMI_ENUMERATION_TYPE:
+				retval = populate_enumeration_package_data(elements,
+									   instance_id,
+									   attr_name_kobj);
+				break;
+			case HPWMI_ORDERED_LIST_TYPE:
+				retval = populate_ordered_list_package_data(elements,
+									    instance_id,
+									    attr_name_kobj);
+				break;
+			case HPWMI_PASSWORD_TYPE:
+				retval = populate_password_package_data(elements,
+									instance_id,
+									attr_name_kobj);
+				break;
+			default:
+				break;
+			}
+
+			kfree(str_value);
+		}
+
+		if (obj->type == ACPI_TYPE_BUFFER) {
+
+			buffer_size = obj->buffer.length;
+			buffer_ptr = obj->buffer.pointer;
+
+			retval = get_string_from_buffer((u16 **)&buffer_ptr, &buffer_size, &str);
+			if (retval < 0)
+				goto err_attr_init;
+
+			if (attr_type == HPWMI_PASSWORD_TYPE || attr_type == HPWMI_SECURE_PLATFORM_TYPE)
+				tmp_set = bioscfg_drv.authentication_dir_kset;
+			else
+				tmp_set = bioscfg_drv.main_dir_kset;
+
+			if (kset_find_obj(tmp_set, str)) {
+				pr_warn("Duplicate attribute name found - %s\n",
+					 str);
+				goto nextobj;
+			}
+
+			/* build attribute */
+			attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
+			if (!attr_name_kobj) {
+				retval = -ENOMEM;
+				goto err_attr_init;
+			}
+
+			attr_name_kobj->kset = tmp_set;
+
+			temp_str = str;
+			if (attr_type == HPWMI_SECURE_PLATFORM_TYPE)
+				temp_str = "SPM";
+
+			retval = kobject_init_and_add(attr_name_kobj,
+						      &attr_name_ktype, NULL, "%s",
+						      temp_str);
+			if (retval) {
+				kobject_put(attr_name_kobj);
+				goto err_attr_init;
+			}
+
+			/* enumerate all of these attributes */
+			switch (attr_type) {
+			case HPWMI_STRING_TYPE:
+				retval = populate_string_buffer_data(buffer_ptr,
+								     &buffer_size,
+								     instance_id,
+								     attr_name_kobj);
+				break;
+			case HPWMI_INTEGER_TYPE:
+				retval = populate_integer_buffer_data(buffer_ptr,
+								      &buffer_size,
+								      instance_id,
+								      attr_name_kobj);
+				break;
+			case HPWMI_ENUMERATION_TYPE:
+				retval = populate_enumeration_buffer_data(buffer_ptr,
+									  &buffer_size,
+									  instance_id,
+									  attr_name_kobj);
+				break;
+			case HPWMI_ORDERED_LIST_TYPE:
+				retval = populate_ordered_list_buffer_data(buffer_ptr,
+									   &buffer_size,
+									   instance_id,
+									   attr_name_kobj);
+				break;
+			case HPWMI_PASSWORD_TYPE:
+				retval = populate_password_buffer_data(buffer_ptr,
+								       &buffer_size,
+								       instance_id,
+								       attr_name_kobj);
+				break;
+			default:
+				break;
+			}
+		}
+
+nextobj:
+		kfree(obj);
+		instance_id++;
+		obj = get_wmiobj_pointer(instance_id, guid);
+	}
+	mutex_unlock(&bioscfg_drv.mutex);
+	return 0;
+
+err_attr_init:
+	mutex_unlock(&bioscfg_drv.mutex);
+	kfree(obj);
+	return retval;
+}
+
+static int __init bioscfg_init(void)
+{
+	int ret = 0;
+	int bios_capable = wmi_has_guid(HP_WMI_BIOS_GUID);
+
+	if (!bios_capable) {
+		pr_err("Unable to run on non-HP system\n");
+		return -ENODEV;
+	}
+
+	ret = init_bios_attr_set_interface();
+	if (ret)
+		return ret;
+
+	ret = init_bios_attr_pass_interface();
+	if (ret)
+		goto err_exit_bios_attr_set_interface;
+
+	if (!bioscfg_drv.bios_attr_wdev || !bioscfg_drv.password_attr_wdev) {
+		pr_debug("Failed to find set or pass interface\n");
+		ret = -ENODEV;
+		goto err_exit_bios_attr_pass_interface;
+	}
+
+	ret = fw_attributes_class_get(&fw_attr_class);
+	if (ret)
+		goto err_exit_bios_attr_pass_interface;
+
+	bioscfg_drv.class_dev = device_create(fw_attr_class, NULL, MKDEV(0, 0),
+					      NULL, "%s", DRIVER_NAME);
+	if (IS_ERR(bioscfg_drv.class_dev)) {
+		ret = PTR_ERR(bioscfg_drv.class_dev);
+		goto err_unregister_class;
+	}
+
+	bioscfg_drv.main_dir_kset = kset_create_and_add("attributes", NULL,
+						     &bioscfg_drv.class_dev->kobj);
+	if (!bioscfg_drv.main_dir_kset) {
+		ret = -ENOMEM;
+		pr_debug("Failed to create and add attributes\n");
+		goto err_destroy_classdev;
+	}
+
+	bioscfg_drv.authentication_dir_kset = kset_create_and_add("authentication", NULL,
+								&bioscfg_drv.class_dev->kobj);
+	if (!bioscfg_drv.authentication_dir_kset) {
+		ret = -ENOMEM;
+		pr_debug("Failed to create and add authentication\n");
+		goto err_release_attributes_data;
+	}
+
+	/*
+	 * sysfs level attributes.
+	 * - reset_bios
+	 * - pending_reboot
+	 * - last_error (WMI error)
+	 */
+	ret = create_attributes_level_sysfs_files();
+	if (ret)
+		pr_debug("Failed to create sysfs level attributes\n");
+
+	ret = hp_init_bios_attributes(HPWMI_STRING_TYPE, HP_WMI_BIOS_STRING_GUID);
+	if (ret)
+		pr_debug("Failed to populate string type attributes\n");
+
+	ret = hp_init_bios_attributes(HPWMI_INTEGER_TYPE, HP_WMI_BIOS_INTEGER_GUID);
+	if (ret)
+		pr_debug("Failed to populate integer type attributes\n");
+
+	ret = hp_init_bios_attributes(HPWMI_ENUMERATION_TYPE, HP_WMI_BIOS_ENUMERATION_GUID);
+	if (ret)
+		pr_debug("Failed to populate enumeration type attributes\n");
+
+	ret = hp_init_bios_attributes(HPWMI_ORDERED_LIST_TYPE, HP_WMI_BIOS_ORDERED_LIST_GUID);
+	if (ret)
+		pr_debug("Failed to populate ordered list object type attributes\n");
+
+	ret = hp_init_bios_attributes(HPWMI_PASSWORD_TYPE, HP_WMI_BIOS_PASSWORD_GUID);
+	if (ret)
+		pr_debug("Failed to populate password object type attributes\n");
+
+	ret = hp_add_other_attributes(HPWMI_SECURE_PLATFORM_TYPE);
+	if (ret)
+		pr_debug("Failed to populate secure platform object type attribute\n");
+
+	ret = hp_add_other_attributes(HPWMI_SURE_START_TYPE);
+	if (ret)
+		pr_debug("Failed to populate sure start object type attribute\n");
+
+	ret = hp_add_other_attributes(HPWMI_SURE_ADMIN_TYPE);
+	if (ret)
+		pr_debug("Failed to populate sure admin object type attribute\n");
+
+	return 0;
+
+err_release_attributes_data:
+	release_attributes_data();
+
+err_destroy_classdev:
+	device_destroy(fw_attr_class, MKDEV(0, 0));
+
+err_unregister_class:
+	fw_attributes_class_put();
+
+err_exit_bios_attr_pass_interface:
+	exit_bios_attr_pass_interface();
+
+err_exit_bios_attr_set_interface:
+	exit_bios_attr_set_interface();
+
+	return ret;
+}
+
+static void __exit bioscfg_exit(void)
+{
+	release_attributes_data();
+	device_destroy(fw_attr_class, MKDEV(0, 0));
+
+	fw_attributes_class_put();
+	exit_bios_attr_set_interface();
+	exit_bios_attr_pass_interface();
+}
+
+module_init(bioscfg_init);
+module_exit(bioscfg_exit);
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
new file mode 100644
index 000000000000..6d9c896bf14a
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
@@ -0,0 +1,673 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Definitions for kernel modules using hp_bioscfg driver
+ *
+ *  Copyright (c) 2022 HP Development Company, L.P.
+ */
+
+#ifndef _HP_BIOSCFG_H_
+#define _HP_BIOSCFG_H_
+
+#include <linux/wmi.h>
+#include <linux/types.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/capability.h>
+#include <linux/nls.h>
+
+
+#define DRIVER_NAME	"hp-bioscfg"
+
+#define MAX_BUFF		512
+#define MAX_KEY_MOD		256
+#define MAX_PASSWD_SIZE		64
+#define MAX_MESSAGE_SIZE        256
+
+#define SPM_STR_DESC	"Secure Platform Management"
+#define SPM_STR		"SPM"
+#define SURE_START_DESC "Sure Start"
+#define SURE_START_STR  "Sure_Start"
+#define SURE_ADMIN_DESC "Sure Admin"
+#define SURE_ADMIN_STR  "Sure_Admin"
+#define SETUP_PASSWD	"Setup Password"
+#define POWER_ON_PASSWD	"Power-On Password"
+
+#define LANG_CODE_STR		"en_US.UTF-8"
+#define SCHEDULE_POWER_ON	"Scheduled Power-On"
+
+/* Sure Admin Functions */
+
+#define UTF_PREFIX	((unsigned char *)"<utf-16/>")
+#define BEAM_PREFIX	((unsigned char *)"<BEAM/>")
+
+/* mechanism - Authentication attribute */
+
+#define MAX_MECHANISM_TYPES 3
+
+enum mechanism_values {
+	PASSWORD	= 0x00,
+	NOT_PROVISION   = 0x00,
+	SIGNING_KEY	= 0x01,
+	ENDORSEMENT_KEY = 0x02
+};
+
+static const char * const spm_mechanism_types[] = {
+	"not provision",
+	"signing-key",
+	"endorsement-key"
+};
+
+static const char * const passwd_mechanism_types[] = {
+	"password",
+};
+
+/* roles - Authentication attribute */
+enum role_values {
+	BIOS_ADMIN	= 0x00,
+	POWER_ON	= 0x01,
+	BIOS_SPM	= 0x02
+};
+
+static const char * const role_type[] = {
+	"bios-admin",
+	"power-on",
+	"enhanced-bios-auth"
+};
+
+
+#define HP_WMI_BIOS_GUID		"5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
+
+#define HP_WMI_BIOS_STRING_GUID		"988D08E3-68F4-4c35-AF3E-6A1B8106F83C"
+#define HP_WMI_BIOS_INTEGER_GUID	"8232DE3D-663D-4327-A8F4-E293ADB9BF05"
+#define HP_WMI_BIOS_ENUMERATION_GUID	"2D114B49-2DFB-4130-B8FE-4A3C09E75133"
+#define HP_WMI_BIOS_ORDERED_LIST_GUID	"14EA9746-CE1F-4098-A0E0-7045CB4DA745"
+#define HP_WMI_BIOS_PASSWORD_GUID	"322F2028-0F84-4901-988E-015176049E2D"
+#define HP_WMI_SET_BIOS_SETTING_GUID	"1F4C91EB-DC5C-460b-951D-C7CB9B4B8D5E"
+
+enum hp_wmi_spm_commandtype {
+	HPWMI_SECUREPLATFORM_GET_STATE  = 0x10,
+	HPWMI_SECUREPLATFORM_SET_KEK	= 0x11,
+	HPWMI_SECUREPLATFORM_SET_SK	= 0x12,
+};
+
+enum hp_wmi_surestart_commandtype {
+	HPWMI_SURESTART_GET_LOG_COUNT	= 0x01,
+	HPWMI_SURESTART_GET_LOG		= 0x02,
+};
+
+enum hp_wmi_command {
+	HPWMI_READ		= 0x01,
+	HPWMI_WRITE		= 0x02,
+	HPWMI_ODM		= 0x03,
+	HPWMI_SURESTART		= 0x20006,
+	HPWMI_GM		= 0x20008,
+	HPWMI_SECUREPLATFORM	= 0x20010,
+};
+
+struct bios_return {
+	u32 sigpass;
+	u32 return_code;
+};
+
+enum hp_return_value {
+	HPWMI_RET_WRONG_SIGNATURE	= 0x02,
+	HPWMI_RET_UNKNOWN_COMMAND	= 0x03,
+	HPWMI_RET_UNKNOWN_CMDTYPE	= 0x04,
+	HPWMI_RET_INVALID_PARAMETERS	= 0x05,
+};
+
+enum wmi_error_values {
+	SUCCESS			= 0x00,
+	CMD_FAILED			= 0x01,
+	INVALID_SIGN			= 0x02,
+	INVALID_CMD_VALUE		= 0x03,
+	INVALID_CMD_TYPE		= 0x04,
+	INVALID_DATA_SIZE		= 0x05,
+	INVALID_CMD_PARAM		= 0x06,
+	ENCRYP_CMD_REQUIRED		= 0x07,
+	NO_SECURE_SESSION		= 0x08,
+	SECURE_SESSION_FOUND		= 0x09,
+	SECURE_SESSION_FAILED		= 0x0A,
+	AUTH_FAILED			= 0x0B,
+	INVALID_BIOS_AUTH		= 0x0E,
+	NONCE_DID_NOT_MATCH		= 0x18,
+	GENERIC_ERROR			= 0x1C,
+	BIOS_ADMIN_POLICY_NOT_MET	= 0x28,
+	BIOS_ADMIN_NOT_SET		= 0x38,
+	P21_NO_PROVISIONED		= 0x1000,
+	P21_PROVISION_IN_PROGRESS	= 0x1001,
+	P21_IN_USE			= 0x1002,
+	HEP_NOT_ACTIVE			= 0x1004,
+	HEP_ALREADY_SET		= 0x1006,
+	HEP_CHECK_STATE		= 0x1007
+};
+
+enum spm_features {
+	HEP_ENABLED		= 0x01,
+	PLATFORM_RECOVERY	= 0x02,
+	ENHANCED_BIOS_AUTH_MODE	= 0x04
+};
+
+
+/*
+ * struct bios_args buffer is dynamically allocated.  New WMI command types
+ * were introduced that exceeds 128-byte data size.  Changes to handle
+ * the data size allocation scheme were kept in hp_wmi_perform_qurey function.
+ */
+struct bios_args {
+	u32 signature;
+	u32 command;
+	u32 commandtype;
+	u32 datasize;
+	u8 data[];
+};
+
+
+#pragma pack(1)
+struct secureplatform_provisioning_data {
+	u8 state;
+	u8 version[2];
+	u8 reserved1;
+	u32 features;
+	u32 nonce;
+	u8 reserved2[28];
+	u8 sk_mod[MAX_KEY_MOD];
+	u8 kek_mod[MAX_KEY_MOD];
+};
+
+#pragma pack()
+
+
+struct string_data {
+	struct kobject *attr_name_kobj;
+	u8 attribute_name[MAX_BUFF];
+	u8 display_name[MAX_BUFF];
+	u8 current_value[MAX_BUFF];
+	u8 new_value[MAX_BUFF];
+	u8 path[MAX_BUFF];
+	u32 is_readonly;
+	u32 display_in_ui;
+	u32 requires_physical_presence;
+	u32 sequence;
+	u32 prerequisitesize;
+	u8 prerequisites[MAX_BUFF];
+	u32 security_level;
+	u32 min_length;
+	u32 max_length;
+	u8 display_name_language_code[MAX_BUFF];
+	u32 type;
+};
+
+struct integer_data {
+	struct kobject *attr_name_kobj;
+	u8 attribute_name[MAX_BUFF];
+	u8 display_name[MAX_BUFF];
+	u32 current_value;
+	u32 new_value;
+	u8 path[MAX_BUFF];
+	u32 is_readonly;
+	u32 display_in_ui;
+	u32 requires_physical_presence;
+	u32 sequence;
+	u32 prerequisitesize;
+	u8 prerequisites[MAX_BUFF];
+	u32 security_level;
+	u32 lower_bound;
+	u32 upper_bound;
+	u32 scalar_increment;
+	u8 display_name_language_code[MAX_BUFF];
+	u32 type;
+};
+
+struct enumeration_data {
+	struct kobject *attr_name_kobj;
+	u8 attribute_name[MAX_BUFF];
+	u8 display_name[MAX_BUFF];
+	u8 path[MAX_BUFF];
+	u32 is_readonly;
+	u32 display_in_ui;
+	u32 requires_physical_presence;
+	u32 sequence;
+	u32 prerequisitesize;
+	u8 prerequisites[MAX_BUFF];
+	u32 security_level;
+	u8 current_value[MAX_BUFF];
+	u8 new_value[MAX_BUFF];
+	u32 size;
+	u8 possible_values[MAX_BUFF];
+	u8 display_name_language_code[MAX_BUFF];
+	u32 type;
+};
+
+struct ordered_list_data {
+	struct kobject *attr_name_kobj;
+	u8 attribute_name[MAX_BUFF];
+	u8 display_name[MAX_BUFF];
+	u8 current_value[MAX_BUFF];
+	u8 new_value[MAX_BUFF];
+	u8 path[MAX_BUFF];
+	u32 is_readonly;
+	u32 display_in_ui;
+	u32 requires_physical_presence;
+	u32 sequence;
+	u32 prerequisitesize;
+	u8 prerequisites[MAX_BUFF];
+	u32 security_level;
+	u32 size;
+	u8 elements[MAX_BUFF];
+	u8 display_name_language_code[MAX_BUFF];
+	u32 type;
+};
+
+struct password_data {
+	struct kobject *attr_name_kobj;
+	u8 attribute_name[MAX_BUFF];
+	u8 display_name[MAX_BUFF];
+	u8 current_password[MAX_PASSWD_SIZE];
+	u8 new_password[MAX_PASSWD_SIZE];
+	u8 path[MAX_BUFF];
+	u32 is_readonly;
+	u32 display_in_ui;
+	u32 requires_physical_presence;
+	u32 sequence;
+	u32 prerequisitesize;
+	u8 prerequisites[MAX_BUFF];
+	u32 security_level;
+	u32 min_password_length;
+	u32 max_password_length;
+	u32 encoding_size;
+	u8 supported_encoding[MAX_BUFF];
+	u8 display_name_language_code[MAX_BUFF];
+	u32 is_enabled;
+
+	// 'bios-admin' 'power-on'
+	u32 role;
+
+	//'password'
+	u32 mechanism;
+	u32 type;
+};
+
+struct secure_platform_data {
+	struct kobject *attr_name_kobj;
+	u8 attribute_name[MAX_BUFF];
+	u8 display_name[MAX_BUFF];
+
+	u8 *endorsement_key;
+	u8 *signing_key;
+
+	u32 is_enabled;
+	u32 mechanism;
+	u32 type;
+};
+
+struct bioscfg_priv {
+	struct wmi_device *password_attr_wdev;
+	struct wmi_device *bios_attr_wdev;
+	struct kset *authentication_dir_kset;
+	struct kset *main_dir_kset;
+	struct device *class_dev;
+	struct string_data *string_data;
+	u32 string_instances_count;
+	struct integer_data *integer_data;
+	u32 integer_instances_count;
+	struct enumeration_data *enumeration_data;
+	u32 enumeration_instances_count;
+	struct ordered_list_data *ordered_list_data;
+	u32 ordered_list_instances_count;
+	struct password_data *password_data;
+	u32 password_instances_count;
+
+	struct kobject *sure_start_attr_kobj;
+	struct kobject *sure_admin_attr_kobj;
+	struct secure_platform_data spm_data;
+
+	int  last_wmi_status;
+	bool pending_reboot;
+	struct mutex mutex;
+};
+
+/* global structure used by multiple WMI interfaces */
+extern struct bioscfg_priv bioscfg_drv;
+
+enum hp_wmi_data_type {
+	HPWMI_STRING_TYPE		= 0x00,
+	HPWMI_INTEGER_TYPE		= 0x01,
+	HPWMI_ENUMERATION_TYPE		= 0x02,
+	HPWMI_ORDERED_LIST_TYPE		= 0x03,
+	HPWMI_PASSWORD_TYPE		= 0x04,
+	HPWMI_SECURE_PLATFORM_TYPE	= 0x05,
+	HPWMI_SURE_START_TYPE		= 0x06,
+	HPWMI_SURE_ADMIN_TYPE           = 0x07,
+};
+
+enum hp_wmi_data_elements {
+
+	/* Common elements */
+	NAME = 0,
+	VALUE = 1,
+	PATH = 2,
+	IS_READONLY = 3,
+	DISPLAY_IN_UI = 4,
+	REQUIRES_PHYSICAL_PRESENCE = 5,
+	SEQUENCE = 6,
+	PREREQUISITE_SIZE = 7,
+	PREREQUISITES = 8,
+	SECURITY_LEVEL = 9,
+
+	/* String elements */
+	STR_MIN_LENGTH = 10,
+	STR_MAX_LENGTH = 11,
+
+	/* Integer elements */
+	INT_LOWER_BOUND = 10,
+	INT_UPPER_BOUND = 11,
+	INT_SCALAR_INCREMENT = 12,
+
+	/* Enumeration elements */
+	ENUM_CURRENT_VALUE = 10,
+	ENUM_SIZE = 11,
+	ENUM_POSSIBLE_VALUES = 12,
+
+	/* Ordered list elements */
+	ORD_LIST_SIZE = 10,
+	ORD_LIST_ELEMENTS = 11,
+
+	/* Password elements */
+	PSWD_MIN_LENGTH = 10,
+	PSWD_MAX_LENGTH = 11,
+	PSWD_SIZE = 12,
+	PSWD_SUPPORTED_ENCODING = 13,
+	PSWD_IS_SET = 14
+};
+
+
+static const int hp_wmi_elements_count[] = {
+	12,   // string
+	13,   // integer
+	13,   // enumeration
+	12,   // ordered list
+	15    // password
+};
+
+#define get_instance_id(type)							\
+static int get_##type##_instance_id(struct kobject *kobj)			\
+{										\
+	int i; \
+								\
+	for (i = 0; i <= bioscfg_drv.type##_instances_count; i++) { \
+		if (!(strcmp(kobj->name, bioscfg_drv.type##_data[i].attr_name_kobj->name))) \
+			return i;						\
+	}									\
+	return -EIO;								\
+}
+
+#define get_instance_id_for_attribute(type)			\
+static int get_instance_id_for_##type(char *attr_name)		\
+{										\
+	int i;									\
+										\
+	for (i = 0; i < bioscfg_drv.type##_instances_count; i++) {		\
+		if (strcmp(bioscfg_drv.type##_data[i].attr_name_kobj->name, attr_name) == 0)						\
+			return i;						\
+	}									\
+	return -EIO;								\
+}
+
+#define attribute_s_property_show(name, type)					\
+static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr,	\
+			   char *buf)						\
+{										\
+	int i = get_##type##_instance_id(kobj);					\
+	if (i >= 0)								\
+		return sysfs_emit(buf, "%s\n", bioscfg_drv.type##_data[i].name);	\
+	return 0;								\
+}
+/* There is no need to keep track of default and current values
+ * separately
+ */
+#define attribute_s_default_property_show(name, type, new_name)			\
+static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr,	\
+			   char *buf)						\
+{										\
+	int i = get_##type##_instance_id(kobj);					\
+	if (i >= 0)								\
+		return sysfs_emit(buf, "%s\n", bioscfg_drv.type##_data[i].new_name);	\
+	return 0;								\
+}
+
+#define attribute_n_default_property_show(name, type, new_name)			\
+static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr,	\
+			   char *buf)						\
+{										\
+	int i = get_##type##_instance_id(kobj);					\
+	if (i >= 0)								\
+		return sysfs_emit(buf, "%d\n", bioscfg_drv.type##_data[i].new_name); \
+	return 0;								\
+}
+
+#define attribute_n_property_show(name, type)					\
+static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr,	\
+			   char *buf)						\
+{										\
+	int i = get_##type##_instance_id(kobj);					\
+	if (i >= 0)								\
+		return sysfs_emit(buf, "%d\n", bioscfg_drv.type##_data[i].name);	\
+	return 0;								\
+}
+
+
+#define attribute_property_store(curr_val, type)				\
+static ssize_t curr_val##_store(struct kobject *kobj,				\
+				struct kobj_attribute *attr,			\
+				const char *buf, size_t count)			\
+{										\
+	char *p = NULL;							\
+	char *attr_value = NULL;						\
+	char *attr_name = NULL;							\
+	int i;									\
+	int ret = -EIO;								\
+										\
+	attr_name = kstrdup(kobj->name, GFP_KERNEL);				\
+	if (!attr_name)								\
+		return -ENOMEM;							\
+										\
+	attr_value = kstrdup(buf, GFP_KERNEL);					\
+	if (!attr_value)							\
+		return -ENOMEM;							\
+										\
+	p = memchr(attr_value, '\n', count);					\
+	if (p != NULL)								\
+		*p = '\0';							\
+										\
+	i = get_##type##_instance_id(kobj);					\
+	if (i >= 0)								\
+		ret = validate_##type##_input(i, attr_value);			\
+	if (!ret)								\
+		ret = hp_set_attribute(attr_name, attr_value);			\
+	if (!ret)								\
+		update_##type##_value(i, attr_value);				\
+										\
+	clear_all_passwords();							\
+	kfree(attr_name);							\
+	kfree(attr_value);							\
+										\
+	return ret ? ret : count;						\
+}
+
+#define attribute_spm_n_property_show(name, type)				\
+static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
+{									\
+	return sysfs_emit(buf, "%d\n", bioscfg_drv.type##_data.name);\
+}
+
+#define attribute_spm_s_property_show(name, type)				\
+static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
+{									\
+	return sysfs_emit(buf, "%s\n", bioscfg_drv.type##_data.name);		\
+}
+
+#define check_property_type(attr, prop, valuetype)\
+	(attr##_obj[prop].type != valuetype)
+
+#define HPWMI_BINATTR_RW(_group, _name, _size)	\
+static struct bin_attribute _group##_##_name =	\
+__BIN_ATTR(_name, 0444 | 0200, _group##_##_name##_read, _group##_##_name##_write, _size)
+
+/*
+ * Prototypes
+ */
+union acpi_object *get_wmiobj_pointer(int instance_id, const char *guid_string);
+int get_instance_count(const char *guid_string);
+void strlcpy_attr(char *dest, char *src);
+void update_attribute_permissions(u32 isReadOnly, struct kobj_attribute *current_val);
+void friendly_user_name_update(char *path, const char *attr_name,
+				char *attr_display, int attr_size);
+
+/* String attributes */
+int populate_string_buffer_data(u8 *buffer_ptr, int *buffer_size,
+			 int instance_id,
+			 struct kobject *attr_name_kobj);
+int populate_string_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
+					 int instance_id,
+					 enum hp_wmi_data_type type);
+int alloc_string_data(void);
+void exit_string_attributes(void);
+int populate_string_package_data(union acpi_object *str_obj,
+				 int instance_id,
+				 struct kobject *attr_name_kobj);
+int populate_string_elements_from_package(union acpi_object *str_obj,
+						  int instance_id,
+						  enum hp_wmi_data_type type);
+
+/* Integer attributes */
+int populate_integer_buffer_data(u8 *buffer_ptr, int *buffer_size,
+			  int instance_id,
+			  struct kobject *attr_name_kobj);
+int populate_integer_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
+					  int instance_id,
+					  enum hp_wmi_data_type type);
+int alloc_integer_data(void);
+void exit_integer_attributes(void);
+int populate_integer_package_data(union acpi_object *integer_obj,
+				  int instance_id,
+				  struct kobject *attr_name_kobj);
+int populate_integer_elements_from_package(union acpi_object *integer_obj,
+						  int instance_id,
+						  enum hp_wmi_data_type type);
+
+/* Enumeration attributes */
+int populate_enumeration_buffer_data(u8 *buffer_ptr, int *buffer_size,
+			      int instance_id,
+			      struct kobject *attr_name_kobj);
+int populate_enumeration_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
+					      int instance_id,
+					      enum hp_wmi_data_type type);
+int alloc_enumeration_data(void);
+void exit_enumeration_attributes(void);
+int populate_enumeration_package_data(union acpi_object *enum_obj,
+				      int instance_id,
+				      struct kobject *attr_name_kobj);
+int populate_enumeration_elements_from_package(union acpi_object *enum_obj,
+					       int instance_id,
+					       enum hp_wmi_data_type type);
+
+/* Ordered list */
+int populate_ordered_list_buffer_data(u8 *buffer_ptr,
+				      int *buffer_size,
+				      int instance_id,
+				      struct kobject *attr_name_kobj);
+int populate_ordered_list_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
+					       int instance_id,
+					       enum hp_wmi_data_type type);
+int alloc_ordered_list_data(void);
+void exit_ordered_list_attributes(void);
+int populate_ordered_list_package_data(union acpi_object *order_obj,
+				       int instance_id,
+				       struct kobject *attr_name_kobj);
+int populate_ordered_list_elements_from_package(union acpi_object *order_obj,
+						int instance_id,
+						enum hp_wmi_data_type type);
+
+/* Password authentication attributes */
+int populate_password_buffer_data(u8 *buffer_ptr, int *buffer_size,
+			   int instance_id,
+			   struct kobject *attr_name_kobj);
+int populate_password_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
+					   int instance_id,
+					   enum hp_wmi_data_type type);
+int populate_password_package_data(union acpi_object *password_obj,
+				   int instance_id,
+				   struct kobject *attr_name_kobj);
+int populate_password_elements_from_package(union acpi_object *password_obj,
+					   int instance_id,
+					    enum hp_wmi_data_type type);
+int alloc_password_data(void);
+int alloc_secure_platform_data(void);
+void exit_password_attributes(void);
+void exit_secure_platform_attributes(void);
+int populate_secure_platform_data(struct kobject *attr_name_kobj);
+int password_is_set(const char *auth);
+int check_spm_is_enabled(void);
+int wmi_error_and_message(int error_code, char *message);
+int hp_wmi_set_bios_setting(u16 *input_buffer, u32 input_size);
+int hp_wmi_perform_query(int query, enum hp_wmi_command command,
+				void *buffer, int insize, int outsize);
+
+/* Sure Start attributes */
+void exit_sure_start_attributes(void);
+int populate_sure_start_data(struct kobject *attr_name_kobj);
+
+/* Sure Admin Attributes */
+void exit_sure_admin_attributes(void);
+int populate_sure_admin_data(struct kobject *attr_name_kobj);
+int hp_set_attribute(const char *a_name, const char *a_value);
+int hp_set_attribute_with_payload(const char *a_name,
+				  const char *a_value,
+				  const char *auth_payload);
+int update_attribute_value(char *attr_name, char *attr_value);
+int hp_bios_settings_fill_buffer(void);
+int hp_bios_settings_free_buffer(void);
+int hp_bios_settings_realloc_buffer(char **buf, int *buf_size,
+					   int *alloc_size);
+int append_read_string_attributes(char *buf, int alloc_size,
+					int instance,
+					enum hp_wmi_data_type type);
+int append_read_integer_attributes(char *buf, int alloc_size,
+					 int instance,
+					 enum hp_wmi_data_type type);
+int append_read_enumeration_attributes(char *buf, int alloc_size,
+					     int instance,
+					     enum hp_wmi_data_type type);
+int append_read_ordered_list_attributes(char *buf, int alloc_size,
+					      int instance,
+					      enum hp_wmi_data_type type);
+int append_read_password_attributes(char *buf, int alloc_size,
+					 int instance,
+					 enum hp_wmi_data_type type);
+int append_read_settings(enum hp_wmi_data_type type, char **buf,
+			      int *buf_size, int *alloc_size);
+int append_read_attributes(char **buf, int alloc_size,
+				 int instance, enum hp_wmi_data_type type);
+int set_bios_defaults(u8 defType);
+int get_password_instance_for_type(const char *name);
+int clear_all_passwords(void);
+int clear_passwords(const int instance);
+void exit_bios_attr_set_interface(void);
+int init_bios_attr_set_interface(void);
+size_t calculate_string_buffer(const char *str);
+size_t calculate_security_buffer(const char *authentication);
+void populate_security_buffer(u16 *buffer, const char *authentication);
+ssize_t populate_string_buffer(u16 *buffer, size_t buffer_len, const char *str);
+int set_new_password(const char *password_type, const char *new_password);
+int init_bios_attr_pass_interface(void);
+void exit_bios_attr_pass_interface(void);
+void *ascii_to_utf16_unicode(u16 *p, const u8 *str);
+int get_integer_from_buffer(int **buffer, int *buffer_size, int *integer);
+int get_string_from_buffer(u16 **buffer, int *buffer_size, char **str);
+int convert_hexstr_to_str(char **hex, int input_len, char **str, int *len);
+int convert_hexstr_to_int(char *str, int *int_value);
+inline int encode_outsize_for_pvsz(int outsize);
+
+#endif
-- 
2.34.1

