Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E47BC43219
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 Oct 2022 20:10:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbiJTUKr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 20 Oct 2022 16:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiJTUKo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Oct 2022 16:10:44 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E50D21552D3
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Oct 2022 13:10:40 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-13b103a3e5dso981372fac.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Oct 2022 13:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFBVp8gVlLbzkOlCGImkUuMTGocCsYNydDhK6T5vGQE=;
        b=Sq7z1WYWx95SqtFJSZbYnHsTthcM+mQUbhscF4Le27DtZUrE8Clq/26iDgag/yDJ+H
         63g0jY9fP4FDJ9JpE8c7cSl+NPiMazcjNi2Z7za1cKjGbN/rdzb8WzN6lRyTby9OoMnI
         tHsrfAmN3WqJ/4SvBxub4mjdC5maL44XbCGmsJzi/001OBTvgV2wCP2Rkm60CXZLxE5w
         rLoHlWJOHWLEJTBMI6n0uRykvw9b2nCUkJYMxkUamRHvV8OtlNunbMLE9Xe9sxYYZzyX
         /7raIAAtXBgWTfbrzXVOoPffcFSMIAZjlFuxm4aSBIlEkqhxbWzDwxgfAnrtkfdq9ljb
         FR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFBVp8gVlLbzkOlCGImkUuMTGocCsYNydDhK6T5vGQE=;
        b=S5ciZYT9IL2yNexL3CI7ccVOg3hPso36Oxx6G1wSxYG5bVaRtWqmjitRa44Tj1boFM
         eU6R7OO7BV/Cx6Uh1nsNRAAACd6p2FXtCg/Eg3IwqdnfVffhR8lYXuzPhgpi3QI6eRE1
         M5ggDnHHXWd1tV5MdFNcsXUyanSqDCsNnFOcyQYO7Us92WiQVrCE8vTivIzoM1uI4yHi
         dklWdKDa1kRStb/vxuk7zVDZ1ubtT8IGxbMOJSbGI/6+bfaDs8Ti4RM5mhw2iG8bvpgk
         G8I2r6KzC2OqtVl0HeUuO/SHre8x0BpoObHwRyc1+KqKwLJ0BGzJsQELUYzFhcXNQjGJ
         N4nw==
X-Gm-Message-State: ACrzQf1QC3751WhGKszT+rTDrQDiJ53VhhyLxQlTHPcinZ4lo3iB/9Ix
        54WHlJz9ByiDoNUk9LnM3f7l8VV9pSg=
X-Google-Smtp-Source: AMsMyM7S1bOgoXrO0eClLdnpgJIw7WZUQ/V0+t2mEAi4aLOkOPKxzcn1FI41U7awV8DBUC3Tl1aKhA==
X-Received: by 2002:a05:6870:a91b:b0:131:f14a:30c2 with SMTP id eq27-20020a056870a91b00b00131f14a30c2mr9505957oab.286.1666296639773;
        Thu, 20 Oct 2022 13:10:39 -0700 (PDT)
Received: from grumpy-Fury.hsd1.tx.comcast.net ([2601:2c3:480:7390:ece5:3818:e03c:2cb7])
        by smtp.gmail.com with ESMTPSA id a25-20020a544e19000000b003539686cb7bsm302896oiy.53.2022.10.20.13.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 13:10:39 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 6/6] HP BIOSCFG driver - remaining components
Date:   Thu, 20 Oct 2022 15:10:33 -0500
Message-Id: <20221020201033.12790-7-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020201033.12790-1-jorge.lopez2@hp.com>
References: <20221020201033.12790-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose for this patch is to submit the remaining components to
build hp-bioscfg driver, Kconfig ,and documentation describing new
attributes and extensions provided by the driver.  This documentation
is found at Documentation/.../sysfs-class-firmware-attributes file.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 .../testing/sysfs-class-firmware-attributes   |  181 ++-
 MAINTAINERS                                   |   11 +-
 drivers/platform/x86/hp/Kconfig               |   16 +
 drivers/platform/x86/hp/Makefile              |    3 +-
 drivers/platform/x86/hp/hp-bioscfg/Makefile   |   19 +
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 1064 +++++++++++++++++
 6 files changed, 1288 insertions(+), 6 deletions(-)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/Makefile
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 4cdba3477176..da8e06d9bb43 100644
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
@@ -126,6 +133,67 @@ Description:
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
+		"sure-admin"-type specific properties:
+
+		settings:
+					A file associated with Sure Admin. BIOS settings can
+					be read or written through the Sure Admin settings file in sysfs.
+
+					[BIOS setting],[new value],[auth token]
+
+					Sample settings reported data
+
+					{
+						"Class": "HPBIOS_BIOSEnumeration",
+						"Name": "USB Storage Boot",
+						"Path": "\\Advanced\\Boot Options",
+						"IsReadOnly": 0,
+						...
+						"Value": "Enable",
+						"Size": 2,
+						"PossibleValues": [
+							"Disable",
+							"Enable"
+							]
+					}
+
+					This file can also be written to in order to update
+					the value sof a <attr> using a CMSL generated payload.
+					For example:
+
+					<attr>,[value],[CMSL generated payload]
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
 What:		/sys/class/firmware-attributes/*/authentication/
 Date:		February 2021
 KernelVersion:	5.11
@@ -206,7 +274,7 @@ Description:
 		Drivers may emit a CHANGE uevent when a password is set or unset
 		userspace may check it again.
 
-		On Dell and Lenovo systems, if Admin password is set, then all BIOS attributes
+		On Dell, Lenovo, and HP systems, if Admin password is set, then all BIOS attributes
 		require password validation.
 		On Lenovo systems if you change the Admin password the new password is not active until
 		the next boot.
@@ -296,6 +364,15 @@ Description:
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
@@ -311,7 +388,7 @@ Description:
 			==	=========================================
 			0	All BIOS attributes setting are current
 			1	A reboot is necessary to get pending BIOS
-			        attribute changes applied
+				attribute changes applied
 			==	=========================================
 
 		Note, userspace applications need to follow below steps for efficient
@@ -364,3 +441,103 @@ Description:
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
+What:		/sys/class/firmware-attributes/*/attributes/Sure_Admin/settings
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	'settings' is a file associated with Sure Admin. BIOS settings can
+		be read or written through the Sure Admin settings file in sysfs.
+
+		Expected data format to update BIOS setting
+
+		  [BIOS setting],[new value],[auth token]
+
+		Sample settings reported data
+
+		  {
+			  "Class": "HPBIOS_BIOSEnumeration",
+			  "Name": "USB Storage Boot",
+			  "Path": "\\Advanced\\Boot Options",
+			  "IsReadOnly": 0,
+			  ...
+			  "Value": "Enable",
+			  "Size": 2,
+			  "PossibleValues": [
+				"Disable",
+				"Enable"
+				]
+		  }
+
+
+What:		/sys/class/firmware-attributes/*/attributes/Sure_Start/audit_log_entry_count
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	audit_log_entry_count is a read-only file that returns the
+		number of existing audit log events available to be read.
+
+		  [No of entries],[log entry size],[Max number of entries supported]
+
+
+What:		/sys/class/firmware-attributes/*/attributes/Sure_Start/audit_log_entries
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	audit_log_entries is a read-only file that returns the events
+		in the log.
+
+		Audit log entry format
+
+		  Byte 0-15:   Requested Audit Log entry  (Each Audit log is 16 bytes)
+		  Byte 16-127: Unused
diff --git a/MAINTAINERS b/MAINTAINERS
index 48f6705c19f8..9ad23364ae69 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -120,7 +120,7 @@ Descriptions of section entries and preferred order
 	   matches all files in and below net excluding net/ipv6/
 	N: Files and directories *Regex* patterns.
 	   N:	[^a-z]tegra	all files whose path contains tegra
-	                        (not including files like integrator)
+				(not including files like integrator)
 	   One pattern per line.  Multiple N: lines acceptable.
 	   scripts/get_maintainer.pl has different behavior for files that
 	   match F: pattern and matches of N: patterns.  By default,
@@ -140,8 +140,8 @@ Maintainers List
 ----------------
 
 .. note:: When reading this list, please look for the most precise areas
-          first. When adding to this list, please keep the entries in
-          alphabetical order.
+	  first. When adding to this list, please keep the entries in
+	  alphabetical order.
 
 3C59X NETWORK DRIVER
 M:	Steffen Klassert <klassert@kernel.org>
@@ -9286,6 +9286,11 @@ S:	Obsolete
 W:	http://w1.fi/hostap-driver.html
 F:	drivers/net/wireless/intersil/hostap/
 
+HP BIOSCFG DRIVER
+M:	Jorge Lopez <jorge.lopez2@hp.com>
+S:	Maintained
+F:	drivers/platform/x86/hp/hp-bioscfg/
+
 HP COMPAQ TC1100 TABLET WMI EXTRAS DRIVER
 L:	platform-driver-x86@vger.kernel.org
 S:	Orphan
diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kconfig
index 426e3575ddc3..af053370ab2b 100644
--- a/drivers/platform/x86/hp/Kconfig
+++ b/drivers/platform/x86/hp/Kconfig
@@ -61,5 +61,21 @@ config TC1100_WMI
 	  This is a driver for the WMI extensions (wireless and bluetooth power
 	  control) of the HP Compaq TC1100 tablet.
 
+config HP_BIOSCFG
+	tristate "HP BIOS Configuration Driver"
+	default m
+	depends on ACPI_WMI
+	depends on DMI
+	select NLS
+	select FW_ATTR_CLASS
+	help
+	  This driver enables administrators to securely manage BIOS settings
+	  using digital certificates and public-key cryptography that eliminate
+	  the need for passwords for both remote and local management. It supports
+	  changing BIOS settings on many HP machines from 2018 and newer without
+	  the use of any additional software.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called hp-bioscfg.
 
  endif # X86_PLATFORM_DRIVERS_HP
diff --git a/drivers/platform/x86/hp/Makefile b/drivers/platform/x86/hp/Makefile
index f651a405e876..6257b2846660 100644
--- a/drivers/platform/x86/hp/Makefile
+++ b/drivers/platform/x86/hp/Makefile
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for linux/drivers/platform/x86/hp
-# x86 Platform-Specific Drivers
+# HP x86 Platform-Specific Drivers
 #
 
 # Hewlett Packard
 obj-$(CONFIG_HP_ACCEL)		+= hp_accel.o
 obj-$(CONFIG_HP_WMI)		+= hp-wmi.o
 obj-$(CONFIG_TC1100_WMI)	+= tc1100-wmi.o
+obj-$(CONFIG_HP_BIOSCFG)        += hp-bioscfg/
diff --git a/drivers/platform/x86/hp/hp-bioscfg/Makefile b/drivers/platform/x86/hp/hp-bioscfg/Makefile
new file mode 100644
index 000000000000..e3790e223084
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/Makefile
@@ -0,0 +1,19 @@
+obj-m           := hp-bioscfg.o
+
+hp-bioscfg-objs := bioscfg.o 	\
+	enum-attributes.o 	\
+	int-attributes.o 	\
+	string-attributes.o 	\
+	passwdobj-attributes.o 	\
+	biosattr-interface.o  	\
+	passwdattr-interface.o 	\
+	ordered-attributes.o 	\
+	surestart-attributes.o 	\
+	spmobj-attributes.o 	\
+	sureadmin-attributes.o
+
+default:
+	make -C /lib/modules/`uname -r`/build M=$(PWD) hp-bioscfg.ko
+
+clean:
+	make -C /lib/modules/`uname -r`/build M=$(PWD) clean
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
new file mode 100644
index 000000000000..ef32223bd182
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -0,0 +1,1064 @@
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
+#include <linux/dmi.h>
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
+int get_integer_from_buffer(int **buffer, int *integer)
+{
+	int *ptr = PTR_ALIGN(*buffer, 4);
+	*integer = *(ptr++);
+	*buffer = ptr;
+	return 0;
+}
+
+int get_string_from_buffer(u16 **buffer, char **str)
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
+	return 0;
+}
+
+int store_acpi_string_from_buffer(u16 **buffer, char *str_data, int str_data_len)
+{
+	int ret;
+	char *str_read = NULL;
+
+	ret  = get_string_from_buffer(buffer, &str_read);
+	if (ACPI_SUCCESS(ret))
+		strscpy(str_data, str_read, str_data_len);
+
+	pr_warn("%s\n", str_data);
+
+	kfree(str_read);
+	str_read = NULL;
+	return ret;
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
+	/* u16 length field + one UTF16 char for each input char */
+	int size =  sizeof(u16) + strlen(str) * sizeof(u16);
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
+	sprintf(msg, "%d,\"%s\"", error_code, error_msg);
+	return error_code;
+}
+
+/*
+ * reset_bios_show() - sysfs implementaton for read reset_bios
+ * @kobj: Kernel object for this attribute
+ * @attr: Kernel object attribute
+ * @buf: The buffer to display to userspace
+ */
+static ssize_t reset_bios_show(struct kobject *kobj,
+			       struct kobj_attribute *attr, char *buf)
+{
+	return -EOPNOTSUPP;
+}
+
+/*
+ * reset_bios_store() - sysfs implementaton for write reset_bios
+ * @kobj: Kernel object for this attribute
+ * @attr: Kernel object attribute
+ * @buf: The buffer from userspace
+ * @count: the size of the buffer from userspace
+ */
+static ssize_t reset_bios_store(struct kobject *kobj,
+				struct kobj_attribute *attr,
+				const char *buf, size_t count)
+{
+	return -EOPNOTSUPP;
+}
+static struct kobj_attribute reset_bios = __ATTR_RW(reset_bios);
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
+	return sprintf(buf, "%d\n", bioscfg_drv.pending_reboot);
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
+	return sprintf(buf, "%s\n", buf);
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
+	ret = sysfs_create_file(&bioscfg_drv.main_dir_kset->kobj, &reset_bios.attr);
+	if (ret)
+		return ret;
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
+		current_val->attr.mode = (umode_t)0600;
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
+		sysfs_remove_file(&bioscfg_drv.main_dir_kset->kobj, &reset_bios.attr);
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
+				pr_warn("Failed to populate integer package data. Error [0%0x]\n", ret);
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
+			str_value = NULL;
+		}
+
+		if (obj->type == ACPI_TYPE_BUFFER) {
+			retval = get_string_from_buffer((u16 **)&obj->buffer.pointer, &str);
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
+				retval = populate_string_buffer_data(obj, instance_id, attr_name_kobj);
+				break;
+			case HPWMI_INTEGER_TYPE:
+				retval = populate_integer_buffer_data(obj, instance_id, attr_name_kobj);
+				break;
+			case HPWMI_ENUMERATION_TYPE:
+				retval = populate_enumeration_buffer_data(obj, instance_id, attr_name_kobj);
+				break;
+			case HPWMI_ORDERED_LIST_TYPE:
+				retval = populate_ordered_list_buffer_data(obj, instance_id, attr_name_kobj);
+				break;
+			case HPWMI_PASSWORD_TYPE:
+				retval = populate_password_buffer_data(obj, instance_id, attr_name_kobj);
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
-- 
2.34.1

