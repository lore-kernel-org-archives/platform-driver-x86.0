Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58731C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Mar 2023 20:10:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjCIUKm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Mar 2023 15:10:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbjCIUKl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2023 15:10:41 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8548AFA8FB
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Mar 2023 12:10:38 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id s41so2555085oiw.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Mar 2023 12:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678392638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2K1ote41+VnLIoOH3SYXhlpbgtYF48T5NQF1oHLa38=;
        b=N4AzE5nb2nynI0z02I1vXMTkx622ZV127hAUq4Hi1jXJad63E57v4Q/TaN8llIaqj7
         Frs/1PB7zD9/tvb2p796Rr7IagLOBMTMOKgh1yH73PxQM6DLXF2Zm0GVackjYTzFOC8g
         jALKeYMW7NAf4HKRZnWCUETonc8C1+O1I8jX++xzzYBvChcxOhwL53H8V0/kE2Vub+H/
         NrEI7FxfDSWSPEjvE3ck7glZ6tzgN+z504wJZvy51vi8AN3uVwqdPedORVPidoR3y3I2
         0g79kn73SXYnMR7nuqZnB3Hg6z9ySfYxxbVJlU+AXxuNMdWi8bjprF8jKRFsxFpZ3XgV
         +JPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678392638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2K1ote41+VnLIoOH3SYXhlpbgtYF48T5NQF1oHLa38=;
        b=ZuBlHDSGxi1faVKkQ8v/G4LHxpo0AtpqzbO8IZnmTVKyrgKtCle4ZYUj/BygAJAHlp
         3JilcWbjOjA9uwP8VIP+4mkZRGindzM8BADt5VI630CZjTPZvoAxWzJ5SAN76pZTrU/L
         6RIYvocRj2HfCGiyFAKccqalFCbDLocPALFj3LV2or+xtHgvCh/WLjlxIb7w4xrP5DsF
         5aNfuMzsSG5PRiITcF9Qe5oTqbasCYTEpwCzFsI1+GU3cofdhKHB+gHl9kwFj9gP/ZIi
         SIEI3fl4tkKAL+LpgCNJLXGvJt4kz0g0tB9aE8w0kHISiJ0kyJZDtepFqgQA/l9LAguK
         0yqg==
X-Gm-Message-State: AO0yUKWYlpbELcaeA3vNVpbkkK5qUglcUS4BOUYEn9SQLeBvZds4tyCm
        W8WgiyBfyuiVYYALm0NT1XWMAKjW1Hw=
X-Google-Smtp-Source: AK7set/Z1iJsVtTm1SOZ4TdYFxByCkmDty8ztdKbp6QzAmhhGWdDXvfMKYKsy6QosJb96txDT9W9Dw==
X-Received: by 2002:a05:6808:901:b0:378:1ce1:5339 with SMTP id w1-20020a056808090100b003781ce15339mr9910307oih.12.1678392637712;
        Thu, 09 Mar 2023 12:10:37 -0800 (PST)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:44ca:abca:1f7c:b8e7])
        by smtp.gmail.com with ESMTPSA id r129-20020acaf387000000b00383f58e7e95sm98879oih.17.2023.03.09.12.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 12:10:36 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v6 4/4] Introduction of HP-BIOSCFG driver [4]
Date:   Thu,  9 Mar 2023 14:10:22 -0600
Message-Id: <20230309201022.9502-5-jorge.lopez2@hp.com>
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
 .../testing/sysfs-class-firmware-attributes   | 107 ++++++-
 MAINTAINERS                                   |   6 +
 drivers/platform/x86/hp/hp-bioscfg/Makefile   |  13 +
 .../x86/hp/hp-bioscfg/biosattr-interface.c    | 303 ++++++++++++++++++
 .../x86/hp/hp-bioscfg/passwdattr-interface.c  |  51 +++
 5 files changed, 479 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/Makefile
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 4cdba3477176..d1ae6b77da13 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -22,6 +22,13 @@ Description:
 			- integer: a range of numerical values
 			- string
 
+		HP specific types
+		-----------------
+			- ordered-list - a set of ordered list valid values
+			- sure-admin
+			- sure-start
+
+
 		All attribute types support the following values:
 
 		current_value:
@@ -126,6 +133,38 @@ Description:
 					value will not be effective through sysfs until this rule is
 					met.
 
+		HP specific class extensions
+		------------------------------
+
+		On HP systems the following additional attributes are available:
+
+		"ordered-list"-type specific properties:
+
+		elements:
+					A file that can be read to obtain the possible
+					list of values of the <attr>. Values are separated using
+					semi-colon (``;``). The order individual elements are listed
+					according to their priority.  An Element listed first has the
+					hightest priority. Writing the list in a different order to
+					current_value alters the priority order for the particular
+					attribute.
+
+		"sure-start"-type specific properties:
+
+		audit_log_entries:
+					A read-only file that returns the events in the log.
+
+					Audit log entry format
+
+					Byte 0-15:   Requested Audit Log entry  (Each Audit log is 16 bytes)
+					Byte 16-127: Unused
+
+		audit_log_entry_count:
+					A read-only file that returns the number of existing audit log events available to be read.
+
+					[No of entries],[log entry size],[Max number of entries supported]
+
+
 What:		/sys/class/firmware-attributes/*/authentication/
 Date:		February 2021
 KernelVersion:	5.11
@@ -206,7 +245,7 @@ Description:
 		Drivers may emit a CHANGE uevent when a password is set or unset
 		userspace may check it again.
 
-		On Dell and Lenovo systems, if Admin password is set, then all BIOS attributes
+		On Dell, Lenovo, and HP systems, if Admin password is set, then all BIOS attributes
 		require password validation.
 		On Lenovo systems if you change the Admin password the new password is not active until
 		the next boot.
@@ -296,6 +335,15 @@ Description:
 						echo "signature" > authentication/Admin/signature
 						echo "password" > authentication/Admin/certificate_to_password
 
+		HP specific class extensions
+		--------------------------------
+
+		On HP systems the following additional settings are available:
+
+		role: enhanced-bios-auth:
+					This role is specific to Secure Platform Management (SPM) attribute.
+					It requires configuring an endorsement (kek) and signing certificate (sk).
+
 
 What:		/sys/class/firmware-attributes/*/attributes/pending_reboot
 Date:		February 2021
@@ -364,3 +412,60 @@ Description:
 		use it to enable extra debug attributes or BIOS features for testing purposes.
 
 		Note that any changes to this attribute requires a reboot for changes to take effect.
+
+
+		HP specific class extensions
+		--------------------------------
+
+What:		/sys/class/firmware-attributes/*/authentication/SPM/kek
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	'kek' is a write-only file that can be used to configure the
+		RSA public key that will be used by the BIOS to verify
+		signatures when setting the signing key.  When written,
+		the bytes should correspond to the KEK certificate
+		(x509 .DER format containing an OU).  The size of the
+		certificate must be less than or equal to 4095 bytes.
+
+
+What:		/sys/class/firmware-attributes/*/authentication/SPM/sk
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	'sk' is a write-only file that can be used to configure the RSA
+		public key that will be used by the BIOS to verify signatures
+		when configuring BIOS settings and security features.  When
+		written, the bytes should correspond to the modulus of the
+		public key.  The exponent is assumed to be 0x10001.
+
+
+What:		/sys/class/firmware-attributes/*/authentication/SPM/status
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	'status' is a read-only file that returns ASCII text reporting
+		the status information.
+
+		  State:  Not Provisioned / Provisioned / Provisioning in progress
+		  Version:  Major.   Minor
+		  Feature Bit Mask: <16-bit unsigned number display in hex>
+		  SPM Counter: <16-bit unsigned number display in base 10>
+		  Signing Key Public Key Modulus (base64):
+		  KEK Public Key Modulus (base64):
+
+
+What:		/sys/class/firmware-attributes/*/authentication/SPM/statusbin
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	'statusbin' is a read-only file that returns identical status
+		information reported by 'status' file in binary format.
+
+
+What:		/sys/class/firmware-attributes/*/attributes/last_error
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	'last_error' is a read-only file that returns WMI error number
+		and message reported by last WMI command.
diff --git a/MAINTAINERS b/MAINTAINERS
index f32538373164..663ae73fb8be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9367,6 +9367,12 @@ S:	Obsolete
 W:	http://w1.fi/hostap-driver.html
 F:	drivers/net/wireless/intersil/hostap/
 
+HP BIOSCFG DRIVER
+M:	Jorge Lopez <jorge.lopez2@hp.com>
+L:      platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/hp/hp-bioscfg/
+
 HP COMPAQ TC1100 TABLET WMI EXTRAS DRIVER
 L:	platform-driver-x86@vger.kernel.org
 S:	Orphan
diff --git a/drivers/platform/x86/hp/hp-bioscfg/Makefile b/drivers/platform/x86/hp/hp-bioscfg/Makefile
new file mode 100644
index 000000000000..529eba6fa47f
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/Makefile
@@ -0,0 +1,13 @@
+obj-$(CONFIG_HP_BIOSCFG) := hp-bioscfg.o
+
+hp-bioscfg-objs := bioscfg.o	\
+	enum-attributes.o	\
+	int-attributes.o	\
+	string-attributes.o	\
+	passwdobj-attributes.o	\
+	biosattr-interface.o	\
+	passwdattr-interface.o	\
+	ordered-attributes.o	\
+	surestart-attributes.o	\
+	spmobj-attributes.o
+
diff --git a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
new file mode 100644
index 000000000000..903b055b31ce
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
@@ -0,0 +1,303 @@
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
+	char *auth_token_choice = NULL;
+
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
+	/* Select which auth token to use; password or [auth token] */
+
+	if (bioscfg_drv.spm_data.auth_token != NULL)
+		auth_token_choice = bioscfg_drv.spm_data.auth_token;
+	else
+		auth_token_choice = bioscfg_drv.password_data[instance].current_password;
+
+	a_name_size = bioscfg_calculate_string_buffer(a_name);
+	a_value_size = bioscfg_calculate_string_buffer(a_value);
+	security_area_size = calculate_security_buffer(auth_token_choice);
+	buffer_size = a_name_size + a_value_size + security_area_size;
+
+	buffer = kmalloc(buffer_size + 1, GFP_KERNEL);
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
+	populate_security_buffer(start, auth_token_choice);
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
+	if (query != HPWMI_SECUREPLATFORM_GET_STATE &&
+	    command != HPWMI_SECUREPLATFORM)
+		if (obj->type != ACPI_TYPE_BUFFER ||
+		    obj->buffer.length > sizeof(*bios_return)) {
+			pr_warn("query 0x%x returned wrong type or too small buffer\n", query);
+			ret = -EINVAL;
+			goto out_free;
+		}
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
+static void *utf16_empty_string(u16 *p)
+{
+	*p++ = 2;
+	*p++ = (u8)0x00;
+	return p;
+}
+
+/*
+ * ascii_to_utf16_unicode -  Convert ascii string to UTF-16 unicode
+ *
+ * BIOS supports UTF-16 characters that are 2 bytes long.  No variable
+ * multi-byte language supported.
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
+	 * "02 00 00 00"
+	 */
+	if (len == 0)
+		return utf16_empty_string(p);
+
+	/* Move pointer len * 2 number of bytes */
+	*p++ = len * 2;
+	ret = utf8s_to_utf16s(str, strlen(str), UTF16_HOST_ENDIAN, p, len);
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
-- 
2.34.1

