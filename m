Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6901C4321E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 Oct 2022 20:10:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbiJTUKq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 20 Oct 2022 16:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbiJTUKo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Oct 2022 16:10:44 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C3A513A7CA
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Oct 2022 13:10:38 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-13aeccf12fbso917243fac.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Oct 2022 13:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AICgPP87KS7fBk1tYYnuTSGNn1UneTv+fSRNVS+jRgo=;
        b=IMtGcLd1kis/J6TqQ+wnpxamFEw+tkvVaLzuexp+dbljftWh99ekP3U21BF2hEo6vJ
         STBU6wXZsmGj9ybZkk2TCFGXxL2yjrh1yzE/6v8gqkJPNxyDmJRazqY1IV2WPOWQaF95
         5h52j14Q/vjRsgyB0zfGTZywLNiNqDKAl0f5XI+Fi8t8q3bSB7cJUNZ7/d4I3uqmgR4P
         vNB1JdStTCxlVDHePNsfWxCMfP8DVCYHsFQQcc7qnyF5HVckQREV7lTyaFRxSnz6NSyb
         IoR3IP8W4sL7nUjJHZFy1frIt795BKgAKgfe8ljUz48ThP2HJhQFHOwtrzq5DgzBE4zi
         SWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AICgPP87KS7fBk1tYYnuTSGNn1UneTv+fSRNVS+jRgo=;
        b=ELV0xvbr6JMTtuUS8Lp1NOb1yi4XIzorClFgxtJzve7MV8nLe8ObCKb5z5Pz+z7tZX
         AX304ke5YZ8SwyY9XzFa03KsIRkUkIp+nyjhEEh06MtRAzUg0fyeaCj/SNLXY3OFUv2G
         GlnaqwKFcNCZXrYuT0qvU7o7wyO+2RknMsthR9a2alX+wp5mFuDkNp+Wc6V7vcrrAc9G
         0Ri6YGjtNLk9mZApqGhR8jWWApgft8ecNlTeXmeM1ZXWOEVPhNSO++0hUOyf+GC8IEgU
         tQWgSk26jFbFalJ1Yc6JB4ckukg880uHk+otemksI9NyIM+I5NlwMw0mTaNV/vusiKj6
         31kg==
X-Gm-Message-State: ACrzQf08YJz1QM3Q0MwXjP2HWZJtwEZJ9PlkAUGQRZSXEBvg41OJl90F
        qfNCdbW6Lq8tfMf72ZB5oLLdsGoOlx0=
X-Google-Smtp-Source: AMsMyM5LcgxxbIXxftK9v0w27fvx1Tl4+QGR7sC2PBxIkgeLOZlhUUiIv3RkyKTytW0ULDGA0SLMrA==
X-Received: by 2002:a05:6870:c88d:b0:137:5344:776e with SMTP id er13-20020a056870c88d00b001375344776emr18671006oab.180.1666296637226;
        Thu, 20 Oct 2022 13:10:37 -0700 (PDT)
Received: from grumpy-Fury.hsd1.tx.comcast.net ([2601:2c3:480:7390:ece5:3818:e03c:2cb7])
        by smtp.gmail.com with ESMTPSA id a25-20020a544e19000000b003539686cb7bsm302896oiy.53.2022.10.20.13.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 13:10:36 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 2/6] Introduction of HP-BIOSCFG driver
Date:   Thu, 20 Oct 2022 15:10:29 -0500
Message-Id: <20221020201033.12790-3-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020201033.12790-1-jorge.lopez2@hp.com>
References: <20221020201033.12790-1-jorge.lopez2@hp.com>
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
---
 .../x86/hp/hp-bioscfg/biosattr-interface.c    | 285 ++++++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  | 671 ++++++++++++++++++
 .../x86/hp/hp-bioscfg/enum-attributes.c       | 521 ++++++++++++++
 3 files changed, 1477 insertions(+)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c

diff --git a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
new file mode 100644
index 000000000000..f0c919bf3ab0
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
@@ -0,0 +1,285 @@
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
+	char *auth_empty_value = " ";
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
+		strncpy(bioscfg_drv.password_data[instance].current_password,
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
+ *       ret = hp_wmi_perform_query(HPWMI_BATTERY_QUERY, HPWMI_READ, buffer, 1, 128)
+ */
+int hp_wmi_perform_query(int query, enum hp_wmi_command command, void *buffer, int insize, int outsize)
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
+	bios_return = (struct bios_return *)obj->buffer.pointer;
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
+int hp_wmi_set_bios_setting(void *input_buffer, int input_size)
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
+
+	kfree(obj);
+	return ret;
+}
+
+/*
+ * set_bios_defaults() - Resets BIOS defaults
+ *
+ * @deftype: the type of BIOS value reset to issue.
+ *
+ * Resets BIOS defaults
+ */
+int set_bios_defaults(u8 deftype)
+{
+	return -EOPNOTSUPP;
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
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
new file mode 100644
index 000000000000..4409481f84f2
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
@@ -0,0 +1,671 @@
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
+		if (!(strcmp(kobj->name, bioscfg_drv.type##_data[i].attribute_name))) \
+			return i;						\
+	}									\
+	return -EIO;								\
+}
+
+#define get_instance_id_for_attribute(type)			\
+static int get_instance_id_for_##type(char *attr_name)	        \
+{										\
+	int i;									\
+										\
+	for (i = 0; i < bioscfg_drv.type##_instances_count; i++) {		\
+		if (strcmp(bioscfg_drv.type##_data[i].attribute_name, attr_name) == 0)						\
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
+		return sprintf(buf, "%s\n", bioscfg_drv.type##_data[i].name);	\
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
+		return sprintf(buf, "%s\n", bioscfg_drv.type##_data[i].new_name);	\
+	return 0;								\
+}
+
+#define attribute_n_default_property_show(name, type, new_name)			\
+static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr,	\
+			   char *buf)						\
+{										\
+	int i = get_##type##_instance_id(kobj);					\
+	if (i >= 0)								\
+		return sprintf(buf, "%d\n", bioscfg_drv.type##_data[i].new_name); \
+	return 0;								\
+}
+
+#define attribute_n_property_show(name, type)					\
+static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr,	\
+			   char *buf)						\
+{										\
+	int i = get_##type##_instance_id(kobj);					\
+	if (i >= 0)								\
+		return sprintf(buf, "%d\n", bioscfg_drv.type##_data[i].name);	\
+	return 0;								\
+}
+
+
+#define attribute_property_store(curr_val, type)				\
+static ssize_t curr_val##_store(struct kobject *kobj,				\
+				struct kobj_attribute *attr,			\
+				const char *buf, size_t count)			\
+{										\
+	char *p = NULL;								\
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
+		update_##type##_value(i);					\
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
+	return sprintf(buf, "%d\n", bioscfg_drv.type##_data.name);\
+}
+
+#define attribute_spm_s_property_show(name, type)				\
+static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
+{									\
+	return sprintf(buf, "%s\n", bioscfg_drv.type##_data.name);		\
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
+int populate_string_buffer_data(union acpi_object *str_obj,
+			 int instance_id,
+			 struct kobject *attr_name_kobj);
+int populate_string_elements_from_buffer(union acpi_object *string_obj,
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
+int populate_integer_buffer_data(union acpi_object *integer_obj,
+			  int instance_id,
+			  struct kobject *attr_name_kobj);
+int populate_integer_elements_from_buffer(union acpi_object *integer_obj,
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
+int populate_enumeration_buffer_data(union acpi_object *enum_obj,
+			      int instance_id,
+			      struct kobject *attr_name_kobj);
+int populate_enumeration_elements_from_buffer(union acpi_object *enum_obj,
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
+int populate_ordered_list_buffer_data(union acpi_object *order_obj, int instance_id,
+				      struct kobject *attr_name_kobj);
+int populate_ordered_list_elements_from_buffer(union acpi_object *order_obj,
+					       int instance_id,
+					       enum hp_wmi_data_type
+					       type);
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
+int populate_password_buffer_data(union acpi_object *password_obj,
+			   int instance_id,
+			   struct kobject *attr_name_kobj);
+int populate_password_elements_from_buffer(union acpi_object *password_obj,
+					   int instance_id,
+					   enum hp_wmi_data_type type);
+int populate_password_package_data(union acpi_object *password_obj, int instance_id,
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
+int hp_wmi_set_bios_setting(void *input_buffer, int input_size);
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
+int get_integer_from_buffer(int **buffer, int *integer);
+int get_string_from_buffer(u16 **buffer, char **str);
+int convert_hexstr_to_str(char **hex, int input_len, char **str, int *len);
+int convert_hexstr_to_int(char *str, int *int_value);
+inline int encode_outsize_for_pvsz(int outsize);
+
+#endif
diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
new file mode 100644
index 000000000000..e67e7c397c12
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
@@ -0,0 +1,521 @@
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
+	union acpi_object *obj = NULL;
+	ssize_t ret;
+
+	if (instance_id < 0)
+		return -EIO;
+
+	/* need to use specific instance_id and guid combination to get right data */
+	obj = get_wmiobj_pointer(instance_id, HP_WMI_BIOS_ENUMERATION_GUID);
+	if (!obj)
+		return -EIO;
+
+	ret = snprintf(buf, PAGE_SIZE, "%s\n",
+		       bioscfg_drv.enumeration_data[instance_id].current_value);
+
+	kfree(obj);
+	return ret;
+}
+
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
+	options = kstrdup(bioscfg_drv.enumeration_data[instance_id].possible_values,
+			  GFP_KERNEL);
+
+	if (!options) {
+		ret = -ENOMEM;
+		goto exit_validate_enum_input;
+	}
+
+	/* Is it a read only attribute */
+	if (bioscfg_drv.enumeration_data[instance_id].is_readonly) {
+		ret = -EIO;
+		goto exit_validate_enum_input;
+	}
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
+	strscpy(bioscfg_drv.enumeration_data[instance_id].new_value,
+		buf,
+		sizeof(bioscfg_drv.enumeration_data[instance_id].new_value));
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
+static void update_enumeration_value(int instance_id)
+{
+	strscpy(bioscfg_drv.enumeration_data[instance_id].current_value,
+		bioscfg_drv.enumeration_data[instance_id].new_value,
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
+	__ATTR_RW_MODE(current_value, 0600);
+
+attribute_s_property_show(possible_values, enumeration);
+static struct kobj_attribute  enumeration_poss_val =
+		__ATTR_RO(possible_values);
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sprintf(buf, "enumeration\n");
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
+	char *str_value = NULL;
+	int str_len;
+	int ret = 0;
+
+	bioscfg_drv.enumeration_data[instance_id].type = HPWMI_ENUMERATION_TYPE;
+	bioscfg_drv.enumeration_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	ret = convert_hexstr_to_str(&(enum_obj[NAME].string.pointer),
+				    enum_obj[NAME].string.length,
+				    &str_value, &str_len);
+	if (ACPI_FAILURE(ret)) {
+		pr_warn("Failed to populate enumeration package data. Error [0%0x]\n", ret);
+		kfree(str_value);
+		return ret;
+	}
+
+	strscpy(bioscfg_drv.enumeration_data[instance_id].attribute_name,
+		str_value,
+		sizeof(bioscfg_drv.enumeration_data[instance_id].attribute_name));
+
+	strscpy(bioscfg_drv.enumeration_data[instance_id].display_name,
+		str_value,
+		sizeof(bioscfg_drv.enumeration_data[instance_id].display_name));
+
+	kfree(str_value);
+	str_value = NULL;
+
+	populate_enumeration_elements_from_package(enum_obj, instance_id, HPWMI_ENUMERATION_TYPE);
+	update_attribute_permissions(bioscfg_drv.enumeration_data[instance_id].is_readonly,
+				    &enumeration_current_val);
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
+ * @enum_obj: ACPI object with enumeration data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ * @enumeration_property_count: Total properties count under enumeration type
+ */
+int populate_enumeration_buffer_data(union acpi_object *enum_obj, int instance_id,
+			      struct kobject *attr_name_kobj)
+{
+
+	bioscfg_drv.enumeration_data[instance_id].type = HPWMI_ENUMERATION_TYPE;
+	bioscfg_drv.enumeration_data[instance_id].attr_name_kobj = attr_name_kobj;
+	strscpy(bioscfg_drv.enumeration_data[instance_id].attribute_name,
+		attr_name_kobj->name,
+		sizeof(bioscfg_drv.enumeration_data[instance_id].attribute_name));
+	strscpy(bioscfg_drv.enumeration_data[instance_id].display_name,
+		attr_name_kobj->name,
+		sizeof(bioscfg_drv.enumeration_data[instance_id].display_name));
+
+	/* Populate enumeration elements */
+	populate_enumeration_elements_from_buffer(enum_obj, instance_id, HPWMI_ENUMERATION_TYPE);
+	update_attribute_permissions(bioscfg_drv.enumeration_data[instance_id].is_readonly,
+				    &enumeration_current_val);
+	friendly_user_name_update(bioscfg_drv.enumeration_data[instance_id].path,
+				  attr_name_kobj->name,
+				   bioscfg_drv.enumeration_data[instance_id].display_name,
+				   sizeof(bioscfg_drv.enumeration_data[instance_id].display_name));
+
+	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
+}
+
+int populate_enumeration_elements_from_buffer(union acpi_object *enum_obj,
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
+		status = get_string_from_buffer((u16 **)&enum_obj->buffer.pointer, &str);
+		if (ACPI_FAILURE(status))
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
+		kfree(str);
+		str = NULL;
+	}
+
+	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
+		if (PREREQUISITES != elem && ENUM_CURRENT_VALUE != elem && ENUM_POSSIBLE_VALUES != elem)
+			status = get_integer_from_buffer((int **)&enum_obj->buffer.pointer, (int *)&integer);
+
+		if (ACPI_FAILURE(status))
+			continue;
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
+				status = get_string_from_buffer((u16 **)&enum_obj->buffer.pointer, &str);
+				if (ACPI_FAILURE(status))
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
+			status = get_string_from_buffer((u16 **)&enum_obj->buffer.pointer, &str);
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
+				status = get_string_from_buffer((u16 **)&enum_obj->buffer.pointer, &str);
+				if (ACPI_FAILURE(status))
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
+	str = NULL;
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
+								&enumeration_attr_group);
+	}
+	bioscfg_drv.enumeration_instances_count = 0;
+
+	kfree(bioscfg_drv.enumeration_data);
+	bioscfg_drv.enumeration_data = NULL;
+}
-- 
2.34.1

