Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D77C433B4
	for <platform-driver-x86@archiver.kernel.org>; Sun, 25 Apr 2021 15:09:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58FA261285
	for <platform-driver-x86@archiver.kernel.org>; Sun, 25 Apr 2021 15:09:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbhDYPJj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 25 Apr 2021 11:09:39 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.115]:40580 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230244AbhDYPJi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 25 Apr 2021 11:09:38 -0400
Received: from [100.112.6.224] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-c.us-east-1.aws.symcld.net id 20/BA-57782-A0685806; Sun, 25 Apr 2021 15:08:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRWlGSWpSXmKPExsWSLveKTZezrTX
  BoO+hlMWb49OZLD53TGaxWL3nBbMDs8e8k4Ee7/ddZfP4vEkugDmKNTMvKb8igTVj6/2zbAUH
  vjFWvPj/hrGB8dUlxi5GLg4hgf+MEpsfXWCFcN4wSjz+08nSxcjJwSagLbFlyy+2LkYODhEBG
  YkPaz1BwswCZRL7FixjA7GFBcIlnrYfYASxWQRUJR6f6QOL8wpYS2zZ1gUWlxCQl2i7Ph3M5g
  SqOdP1GGy8kICKxP0HS6DqBSVOznzCAjFfU6J1+292CFteonnrbGaIOQoStyZ/YoOwEyR6/j1
  im8AoMAtJ+ywk7bOQtC9gZF7FaJpUlJmeUZKbmJmja2hgoGtoaKRromtsopdYpZusV1qsm5pY
  XKJrqJdYXqxXXJmbnJOil5dasokRGOApBSxKOxib33zQO8QoycGkJMrbwNiaIMSXlJ9SmZFYn
  BFfVJqTWnyIUYaDQ0mCt74FKCdYlJqeWpGWmQOMNpi0BAePkgivRxlQmre4IDG3ODMdInWK0Z
  hjx6YFi5g5zr/9tJlZiCUvPy9VSpxXHWSSAEhpRmke3CBYErjEKCslzMvIwMAgxFOQWpSbWYI
  q/4pRnINRSZj3AMgUnsy8Erh9r4BOYQI6ha8O7JSSRISUVAOTxscPSU8CpzE6Z2T+nJZyT8Nt
  RX5Gw9P5+zlVje9rutWs+ONa7L3+Ro0zi7sTn3FV1O7+j35TInfctpr/mlNMu4C9NeiP9ir91
  vieb1VzvqlcdpJh5jkssoD1SOyUV8I/JWyY4q1cHqb+ONR6JfJ8UfK5e5uuxfusvrpArOom55
  NkfTblVbksqrcE1ukozxeZb8/Tayoxf7mjzeX/Zy9vPezeeyFQITv4dvxfTYlqveWms/wFDsX
  eMftiKK+TfsMo+dhBpQ+nb16Rl/744cCjmQLJd3Je1bHmycwRfDXjf8t3tY6C20+Tz/T4bZeQ
  D350QPCiqegjxYtiXDlu+6+KTt0h5PmHbYa/pFJ9bYYSS3FGoqEWc1FxIgBUCzHqfQMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-20.tower-415.messagelabs.com!1619363335!398270!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28709 invoked from network); 25 Apr 2021 15:08:56 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-20.tower-415.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 25 Apr 2021 15:08:56 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 0EE8ED9EA5393C16C89C;
        Sun, 25 Apr 2021 23:08:53 +0800 (CST)
Received: from localhost.localdomain.com (10.64.84.207) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Sun, 25 Apr 2021 11:08:50 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>, <slacshiminar@lenovo.com>
Subject: [PATCH] platform/x86: think-lmi: Add WMI interface support on Lenovo platforms
Date:   Sun, 25 Apr 2021 11:08:31 -0400
Message-ID: <20210425150831.34612-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.64.84.207]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

For Lenovo platforms that support a WMI interface to the BIOS add
support, using the firmware-attributes class, to allow users to access
and modify various BIOS related settings.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/Kconfig     |   11 +
 drivers/platform/x86/Makefile    |    1 +
 drivers/platform/x86/think-lmi.c | 1016 ++++++++++++++++++++++++++++++
 include/linux/think-lmi.h        |   72 +++
 4 files changed, 1100 insertions(+)
 create mode 100644 drivers/platform/x86/think-lmi.c
 create mode 100644 include/linux/think-lmi.h

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 461ec6153..c26acc211 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -616,6 +616,17 @@ config THINKPAD_ACPI_HOTKEY_POLL
 	  If you are not sure, say Y here.  The driver enables polling only if
 	  it is strictly necessary to do so.
 
+config THINKPAD_LMI
+	tristate "Lenovo WMI-based systems management driver"
+	default m
+	depends on ACPI_WMI
+	help
+	  This driver allows changing BIOS settings on Lenovo machines whose
+	  BIOS support the WMI interface.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called think-lmi.
+
 config INTEL_ATOMISP2_LED
 	tristate "Intel AtomISP2 camera LED driver"
 	depends on GPIOLIB && LEDS_GPIO
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 60d554073..43afc58c9 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -60,6 +60,7 @@ obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
 obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
 obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
 obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
+obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 
 # Intel
 obj-$(CONFIG_INTEL_ATOMISP2_LED)	+= intel_atomisp2_led.o
diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
new file mode 100644
index 000000000..996f655a2
--- /dev/null
+++ b/drivers/platform/x86/think-lmi.c
@@ -0,0 +1,1016 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * think-lmi.c - Think LMI BIOS configuration driver
+ *
+ * Copyright(C) 2019-2021 Lenovo
+ *
+ *  Original code from Thinkpad-wmi project https://github.com/iksaif/thinkpad-wmi
+ *  Copyright(C) 2017 Corentin Chary <corentin.chary@gmail.com>
+ *  Distributed under the GPL-2.0 license
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/fs.h>
+#include <linux/think-lmi.h>
+#include <linux/wmi.h>
+
+/*
+ * Name:
+ *  Lenovo_BiosSetting
+ * Description:
+ *  Get item name and settings for current LMI instance.
+ * Type:
+ *  Query
+ * Returns:
+ *  "Item,Value"
+ * Example:
+ *  "WakeOnLAN,Enable"
+ */
+#define LENOVO_BIOS_SETTING_GUID "51F5230E-9677-46CD-A1CF-C0B23EE34DB7"
+
+/*
+ * Name:
+ *  Lenovo_SetBiosSetting
+ * Description:
+ *  Change the BIOS setting to the desired value using the Lenovo_SetBiosSetting
+ *  class. To save the settings, use the Lenovo_SaveBiosSetting class.
+ *  BIOS settings and values are case sensitive.
+ *  After making changes to the BIOS settings, you must reboot the computer
+ *  before the changes will take effect.
+ * Type:
+ *  Method
+ * Arguments:
+ *  "Item,Value,Password,Encoding,KbdLang;"
+ * Example:
+ *  "WakeOnLAN,Disable,pswd,ascii,us;"
+ */
+#define LENOVO_SET_BIOS_SETTINGS_GUID "98479A64-33F5-4E33-A707-8E251EBBC3A1"
+
+/*
+ * Name:
+ *  Lenovo_SaveBiosSettings
+ * Description:
+ *  Save any pending changes in settings.
+ * Type:
+ *  Method
+ * Arguments:
+ *  "Password,Encoding,KbdLang;"
+ * Example:
+ * "pswd,ascii,us;"
+ */
+#define LENOVO_SAVE_BIOS_SETTINGS_GUID "6A4B54EF-A5ED-4D33-9455-B0D9B48DF4B3"
+
+/*
+ * Name:
+ *  Lenovo_BiosPasswordSettings
+ * Description:
+ *  Return BIOS Password settings
+ * Type:
+ *  Query
+ * Returns:
+ *  PasswordMode, PasswordState, MinLength, MaxLength,
+ *  SupportedEncoding, SupportedKeyboard
+ */
+#define LENOVO_BIOS_PASSWORD_SETTINGS_GUID "8ADB159E-1E32-455C-BC93-308A7ED98246"
+
+/*
+ * Name:
+ *  Lenovo_SetBiosPassword
+ * Description:
+ *  Change a specific password.
+ *  - BIOS settings cannot be changed at the same boot as power-on
+ *    passwords (POP) and hard disk passwords (HDP). If you want to change
+ *    BIOS settings and POP or HDP, you must reboot the system after changing
+ *    one of them.
+ *  - A password cannot be set using this method when one does not already
+ *    exist. Passwords can only be updated or cleared.
+ * Type:
+ *  Method
+ * Arguments:
+ *  "PasswordType,CurrentPassword,NewPassword,Encoding,KbdLang;"
+ * Example:
+ *  "pop,oldpop,newpop,ascii,us;”
+ */
+#define LENOVO_SET_BIOS_PASSWORD_GUID "2651D9FD-911C-4B69-B94E-D0DED5963BD7"
+
+/*
+ * Name:
+ *  Lenovo_GetBiosSelections
+ * Description:
+ *  Return a list of valid settings for a given item.
+ * Type:
+ *  Method
+ * Arguments:
+ *  "Item"
+ * Returns:
+ *  "Value1,Value2,Value3,..."
+ * Example:
+ *  -> "FlashOverLAN"
+ *  <- "Enabled,Disabled"
+ */
+#define LENOVO_GET_BIOS_SELECTIONS_GUID	"7364651A-132F-4FE7-ADAA-40C6C7EE2E3B"
+
+#define TLMI_POP_PWD (1 << 0)
+#define TLMI_PAP_PWD (1 << 1)
+
+/*
+ * Only add an alias on this one, since it's the one used
+ * in tlmi_probe
+ */
+MODULE_ALIAS("tlmi:"LENOVO_BIOS_SETTING_GUID);
+
+static struct class firmware_attributes_class = {
+	.name = "firmware-attributes",
+};
+
+static struct think_lmi tlmi_priv;
+
+/* ------ Utility functions ------------*/
+/* Convert BIOS WMI error string to suitable error code */
+static int tlmi_errstr_to_err(const char *errstr)
+{
+	if (!strcmp(errstr, "Success"))
+		/* Operation completed successfully */
+		return 0;
+	if (!strcmp(errstr, "Not Supported"))
+		/* The feature is not supported on this system */
+		return -EOPNOTSUPP;
+	if (!strcmp(errstr, "Invalid"))
+		/* The item or value provided is not valid parameter */
+		return -EINVAL;
+	if (!strcmp(errstr, "Access Denied"))
+		/*
+		 * The change could not be made due to an authentication problem.
+		 * If a supervisor password exists, the correct supervisor password
+		 * must be provided.
+		 */
+		return -EPERM;
+	if (!strcmp(errstr, "System Busy"))
+		/*
+		 * BIOS changes have already been made that need to be committed.
+		 238G* Reboot the system and try again.
+		 */
+		return -EBUSY;
+
+	pr_debug("Unknown error string: '%s'", errstr);
+	return -EINVAL;
+}
+
+/* Extract error string from WMI return buffer */
+static int tlmi_extract_error(const struct acpi_buffer *output)
+{
+	const union acpi_object *obj;
+	int ret;
+
+	obj = output->pointer;
+	if (!obj || obj->type != ACPI_TYPE_STRING || !obj->string.pointer)
+		return -EIO;
+
+	ret = tlmi_errstr_to_err(obj->string.pointer);
+	kfree(obj);
+	return ret;
+}
+
+/* Utility function to execute WMI call to BIOS */
+static int tlmi_simple_call(const char *guid, const char *arg)
+{
+	const struct acpi_buffer input = { strlen(arg), (char *)arg };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+
+	/*
+	 * duplicated call required to match bios workaround for behavior
+	 * seen when WMI accessed via scripting on other OS
+	 */
+	status = wmi_evaluate_method(guid, 0, 0, &input, &output);
+	status = wmi_evaluate_method(guid, 0, 0, &input, &output);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return tlmi_extract_error(&output);
+}
+
+/* Extract output string from WMI return buffer */
+static int tlmi_extract_output_string(const struct acpi_buffer *output,
+					char **string)
+{
+	const union acpi_object *obj;
+
+	obj = output->pointer;
+	if (!obj || obj->type != ACPI_TYPE_STRING || !obj->string.pointer)
+		return -EIO;
+
+	*string = kstrdup(obj->string.pointer, GFP_KERNEL);
+	kfree(obj);
+	return *string ? 0 : -ENOMEM;
+}
+
+/* ------ Core interface functions ------------*/
+
+/* Get password settings from BIOS */
+static int tlmi_get_pwd_settings(struct tlmi_pwdcfg *pwdcfg)
+{
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	const union acpi_object *obj;
+	acpi_status status;
+
+	status = wmi_query_block(LENOVO_BIOS_PASSWORD_SETTINGS_GUID, 0,
+				 &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj = output.pointer;
+	if (!obj || obj->type != ACPI_TYPE_BUFFER || !obj->buffer.pointer)
+		return -EIO;
+	if (obj->buffer.length != sizeof(struct tlmi_pwdcfg)) {
+
+		/* The size of thinkpad_wmi_pcfg on ThinkStation is larger than ThinkPad.
+		 * To make the driver compatible on different brands, we permit it to get
+		 * the data in below case.
+		 */
+		if (obj->buffer.length > sizeof(struct tlmi_pwdcfg)) {
+			memcpy(pwdcfg, obj->buffer.pointer, sizeof(struct tlmi_pwdcfg));
+			kfree(obj);
+			return 0;
+		}
+		pr_warn("Unknown pwdcfg buffer length %d\n", obj->buffer.length);
+		kfree(obj);
+		return -EIO;
+	}
+
+	memcpy(pwdcfg, obj->buffer.pointer, obj->buffer.length);
+	kfree(obj);
+	return 0;
+}
+
+static int tlmi_set_bios_settings(const char *settings)
+{
+	return tlmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID,
+				settings);
+}
+
+static int tlmi_save_bios_settings(const char *password)
+{
+	return tlmi_simple_call(LENOVO_SAVE_BIOS_SETTINGS_GUID,
+				password);
+}
+
+static int tlmi_set_bios_password(char *auth_str)
+{
+	return tlmi_simple_call(LENOVO_SET_BIOS_PASSWORD_GUID, auth_str);
+}
+
+static int tlmi_setting(int item, char **value, const char *guid_string)
+{
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+
+	status = wmi_query_block(guid_string, item, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return tlmi_extract_output_string(&output, value);
+}
+
+static int tlmi_get_bios_selections(const char *item, char **value)
+{
+	const struct acpi_buffer input = { strlen(item), (char *)item };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+
+	status = wmi_evaluate_method(LENOVO_GET_BIOS_SELECTIONS_GUID,
+				     0, 0, &input, &output);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return tlmi_extract_output_string(&output, value);
+}
+
+/* ---- Authentication sysfs --------------------------------------------------------- */
+static struct tlmi_pwd_setting *get_pwd_setting(struct kobject *kobj)
+{
+	if (strcmp(kobj->name, "Admin") == 0)
+		return tlmi_priv.pwd_admin;
+	else if (strcmp(kobj->name, "System") == 0)
+		return tlmi_priv.pwd_power;
+	else
+		return NULL;
+}
+
+static ssize_t is_enabled_show(struct kobject *kobj, struct kobj_attribute *attr,
+					  char *buf)
+{
+	struct tlmi_pwd_setting *pwd_setting = get_pwd_setting(kobj);
+
+	if (pwd_setting->valid)
+		return sysfs_emit(buf, "1\n");
+	else
+		return sysfs_emit(buf, "0\n");
+}
+
+static struct kobj_attribute auth_is_pass_set = __ATTR_RO(is_enabled);
+
+static ssize_t current_password_store(struct kobject *kobj,
+				      struct kobj_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *pwd_setting = get_pwd_setting(kobj);
+	int length;
+
+	if (!pwd_setting)
+		return -EIO;
+
+	length = strlen(buf);
+	if (buf[length-1] == '\n')
+		length--;
+
+	if (length >= TLMI_PWD_MAXLEN)
+		return -EINVAL;
+
+	memcpy(pwd_setting->password, buf, length);
+	pwd_setting->password[length] = '\0';
+	return count;
+}
+
+static struct kobj_attribute auth_current_password = __ATTR_WO(current_password);
+
+static ssize_t new_password_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *pwd_setting = get_pwd_setting(kobj);
+	char *p, *new_pwd;
+	char pwd_type[4];
+	char *auth_str;
+	int ret = 0, len;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	if (!pwd_setting)
+		return -EIO;
+
+	/* Ensure password, kbdlang and encoding has been set */
+	if (!strlen(pwd_setting->password)) {
+		pr_info("Error: current password not configured\n");
+		return -EINVAL;
+	}
+	if (!strlen(pwd_setting->kbdlang)) {
+		pr_info("Error: kbdlang not configured\n");
+		return -EINVAL;
+	}
+	if (!strlen(pwd_setting->encoding)) {
+		pr_info("Error: Encoding not configured\n");
+		return -EINVAL;
+	}
+
+	new_pwd = kstrdup(buf, GFP_KERNEL);
+	if (!new_pwd)
+		return -ENOMEM;
+	p = memchr(new_pwd, '\n', count);
+
+	if (p != NULL)
+		*p = '\0';
+	if (strlen(new_pwd) > pwd_setting->maxlen) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (strcmp(kobj->name, "Admin") == 0)
+		sprintf(pwd_type, "pap");
+	else
+		sprintf(pwd_type, "pop");
+
+	/* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
+	len = strlen(pwd_setting->password) + strlen(pwd_setting->encoding)
+		+ strlen(pwd_setting->kbdlang) + 3 /* type */
+		+ strlen(new_pwd) + 6 /* punctuation and terminator*/;
+	auth_str = kzalloc(len, GFP_KERNEL);
+	snprintf(auth_str, len, "%s,%s,%s,%s,%s;",
+		 pwd_type, pwd_setting->password, new_pwd,
+		 pwd_setting->encoding, pwd_setting->kbdlang);
+	ret = tlmi_set_bios_password(auth_str);
+	kfree(auth_str);
+out:
+	kfree(new_pwd);
+	return ret ? ret : count;
+}
+
+static struct kobj_attribute auth_new_password = __ATTR_WO(new_password);
+
+static ssize_t min_password_length_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *pwd_setting = get_pwd_setting(kobj);
+
+	if (!pwd_setting)
+		return -EIO;
+	return sysfs_emit(buf, "%d\n", pwd_setting->minlen);
+}
+
+static struct kobj_attribute auth_min_pass_length = __ATTR_RO(min_password_length);
+
+static ssize_t max_password_length_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *pwd_setting = get_pwd_setting(kobj);
+
+	if (!pwd_setting)
+		return -EIO;
+	return sysfs_emit(buf, "%d\n", pwd_setting->maxlen);
+}
+static struct kobj_attribute auth_max_pass_length = __ATTR_RO(max_password_length);
+
+static ssize_t mechanism_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	/* Do we need to add scancode here? */
+	return sysfs_emit(buf, "password\n");
+}
+static struct kobj_attribute auth_mechanism = __ATTR_RO(mechanism);
+
+static ssize_t encoding_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *pwd_setting = get_pwd_setting(kobj);
+
+	if (!pwd_setting)
+		return -EIO;
+
+	if (!strlen(pwd_setting->encoding))
+		return sysfs_emit(buf, "Not configured\n");
+
+	return sysfs_emit(buf, "%s\n", pwd_setting->encoding);
+}
+
+static ssize_t encoding_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *pwd_setting = get_pwd_setting(kobj);
+	int length;
+
+	if (!pwd_setting)
+		return -EIO;
+
+	length = strlen(buf);
+	if (buf[length-1] == '\n')
+		length--;
+	if (length >= TLMI_ENC_MAXLEN)
+		return -EINVAL;
+
+	memcpy(pwd_setting->encoding, buf, length);
+	pwd_setting->encoding[length] = '\0';
+	return count;
+}
+
+static struct kobj_attribute auth_encoding = __ATTR_RW(encoding);
+
+static ssize_t kbdlang_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *pwd_setting = get_pwd_setting(kobj);
+
+	if (!pwd_setting)
+		return -EIO;
+
+	if (!strlen(pwd_setting->kbdlang))
+		return sysfs_emit(buf, "Not configured\n");
+
+	return sysfs_emit(buf, "%s\n", pwd_setting->kbdlang);
+}
+
+static ssize_t kbdlang_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *pwd_setting = get_pwd_setting(kobj);
+	int length;
+
+	if (!pwd_setting)
+		return -EIO;
+
+	length = strlen(buf);
+	if (buf[length-1] == '\n')
+		length--;
+	if (length >= TLMI_LANG_MAXLEN)
+		return -EINVAL;
+
+	memcpy(pwd_setting->kbdlang, buf, length);
+	pwd_setting->kbdlang[length] = '\0';
+	return count;
+}
+
+static struct kobj_attribute auth_kbdlang = __ATTR_RW(kbdlang);
+
+static ssize_t role_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	if (strcmp(kobj->name, "Admin") == 0)
+		return sprintf(buf, "bios-admin\n");
+	else if (strcmp(kobj->name, "System") == 0)
+		return sprintf(buf, "power-on\n");
+	return -EIO;
+}
+static struct kobj_attribute auth_role = __ATTR_RO(role);
+
+static struct attribute *auth_attrs[] = {
+	&auth_is_pass_set.attr,
+	&auth_min_pass_length.attr,
+	&auth_max_pass_length.attr,
+	&auth_current_password.attr,
+	&auth_new_password.attr,
+	&auth_role.attr,
+	&auth_mechanism.attr,
+	&auth_encoding.attr,
+	&auth_kbdlang.attr,
+	NULL,
+};
+
+static const struct attribute_group auth_attr_group = {
+	.attrs = auth_attrs,
+};
+
+/* ---- Attributes sysfs --------------------------------------------------------- */
+static int get_instance_id(struct kobject *kobj)
+{
+	int i;
+
+	for (i = 0; i <= tlmi_priv.settings_count; i++) {
+		if (tlmi_priv.setting[i]) {
+			if (!(strcmp(kobj->name, tlmi_priv.setting[i]->display_name)))
+				return i;
+		}
+	}
+	return -EIO;
+}
+
+static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *attr,
+		char *buf)
+{
+	int i = get_instance_id(kobj);
+
+	if (i < 0)
+		return i;
+	if (!tlmi_priv.setting[i])
+		return -EINVAL;
+	return sysfs_emit(buf, "%s\n", tlmi_priv.setting[i]->display_name);
+}
+
+static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	int i = get_instance_id(kobj);
+	char *item;
+	int ret;
+
+	if (i < 0)
+		return i;
+
+	ret = tlmi_setting(i, &item, LENOVO_BIOS_SETTING_GUID);
+	if (ret)
+		return ret;
+	ret = sysfs_emit(buf, "%s\n", item);
+	kfree(item);
+	return ret;
+}
+
+static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	int i = get_instance_id(kobj);
+
+	if (!tlmi_priv.can_get_bios_selections)
+		return -EOPNOTSUPP;
+	if (i < 0)
+		return i;
+	if (!tlmi_priv.setting[i])
+		return -EINVAL;
+	return sysfs_emit(buf, "%s\n", tlmi_priv.setting[i]->possible_values);
+}
+
+static ssize_t current_value_store(struct kobject *kobj,
+		struct kobj_attribute *attr,
+		const char *buf, size_t count)
+{
+	int i = get_instance_id(kobj);
+	int alloc_len, auth_len = 0;
+	int str_ix = 0;
+	char *auth_str;
+	char *set_str;
+	int ret;
+
+	if (i < 0)
+		return i;
+	if (!tlmi_priv.setting[i])
+		return -EINVAL;
+
+	alloc_len = strlen(tlmi_priv.setting[i]->display_name) + 2 + count;
+
+	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password) {
+		auth_len += strlen(tlmi_priv.pwd_admin->password) + 1
+			+ strlen(tlmi_priv.pwd_admin->encoding) + 1
+			+ strlen(tlmi_priv.pwd_admin->kbdlang) + 1 + 1;
+		auth_str = kmalloc(auth_len, GFP_KERNEL);
+		if (!auth_str)
+			return -ENOMEM;
+
+		sprintf(auth_str, "%s,%s,%s;",
+				tlmi_priv.pwd_admin->password,
+				tlmi_priv.pwd_admin->encoding,
+				tlmi_priv.pwd_admin->kbdlang);
+		alloc_len += 1 + auth_len;
+	}
+
+	set_str = kmalloc(alloc_len, GFP_KERNEL);
+	if (!set_str) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	str_ix += sprintf(set_str, "%s,", tlmi_priv.setting[i]->display_name);
+	str_ix += snprintf(set_str + str_ix, count, "%s", buf);
+	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password)
+		sprintf(set_str + str_ix - 1, ",%s", auth_str);
+	else
+		sprintf(set_str + str_ix - 1, ";");
+
+	ret = tlmi_set_bios_settings(set_str);
+	if (ret)
+		goto err;
+
+	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password)
+		ret = tlmi_save_bios_settings(auth_str);
+	else
+		ret = tlmi_save_bios_settings("");
+	if (ret)
+		goto err;
+
+	kfree(set_str);
+	kfree(auth_str);
+	return count;
+err:
+	kfree(auth_str);
+	kfree(set_str);
+	return ret;
+}
+
+static struct kobj_attribute attr_displ_name =
+		__ATTR_RO(display_name);
+
+static struct kobj_attribute attr_possible_values =
+		__ATTR_RO(possible_values);
+
+static struct kobj_attribute attr_current_val =
+		__ATTR_RW_MODE(current_value, 0600);
+
+static struct attribute *tlmi_attrs[] = {
+	&attr_displ_name.attr,
+	&attr_current_val.attr,
+	&attr_possible_values.attr,
+	NULL,
+};
+
+static const struct attribute_group tlmi_attr_group = {
+	.attrs = tlmi_attrs,
+};
+
+static ssize_t tlmi_attr_show(struct kobject *kobj, struct attribute *attr,
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
+static ssize_t tlmi_attr_store(struct kobject *kobj, struct attribute *attr,
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
+static const struct sysfs_ops tlmi_kobj_sysfs_ops = {
+	.show	= tlmi_attr_show,
+	.store	= tlmi_attr_store,
+};
+
+static void attr_name_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
+static struct kobj_type attr_name_ktype = {
+	.release	= attr_name_release,
+	.sysfs_ops	= &tlmi_kobj_sysfs_ops,
+};
+
+/* ---- Initialisation --------------------------------------------------------- */
+static void tlmi_release_attr(void)
+{
+	int i;
+
+	/* Attribute structures */
+	for (i = 0; i < tlmi_priv.settings_count; i++) {
+		if (tlmi_priv.setting[i]) {
+			kfree(tlmi_priv.setting[i]->possible_values);
+
+			if (tlmi_priv.setting[i]->attr_name_kobj)
+				sysfs_remove_group(tlmi_priv.setting[i]->attr_name_kobj,
+						&tlmi_attr_group);
+			kfree(tlmi_priv.setting[i]);
+		}
+	}
+	if (tlmi_priv.attribute_kset) {
+		struct kobject *pos, *next;
+
+		list_for_each_entry_safe(pos, next, &tlmi_priv.attribute_kset->list, entry)
+			kobject_put(pos);
+		kset_unregister(tlmi_priv.attribute_kset);
+	}
+
+	/* Authentication structures */
+	if (tlmi_priv.pwd_admin->attr_name_kobj)
+		sysfs_remove_group(tlmi_priv.pwd_admin->attr_name_kobj, &auth_attr_group);
+	kfree(tlmi_priv.pwd_admin);
+	if (tlmi_priv.pwd_power->attr_name_kobj)
+		sysfs_remove_group(tlmi_priv.pwd_power->attr_name_kobj, &auth_attr_group);
+	kfree(tlmi_priv.pwd_power);
+	if (tlmi_priv.authentication_kset) {
+		struct kobject *pos, *next;
+
+		list_for_each_entry_safe(pos, next, &tlmi_priv.authentication_kset->list, entry)
+			kobject_put(pos);
+		kset_unregister(tlmi_priv.authentication_kset);
+	}
+}
+
+static int tlmi_sysfs_init(void)
+{
+	int i, ret;
+
+	ret = class_register(&firmware_attributes_class);
+	if (ret)
+		return ret;
+
+	tlmi_priv.class_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
+			NULL, "%s", "thinklmi-sysfs");
+	if (IS_ERR(tlmi_priv.class_dev)) {
+		ret = PTR_ERR(tlmi_priv.class_dev);
+		goto fail_class_created;
+	}
+
+	tlmi_priv.attribute_kset = kset_create_and_add("attributes", NULL,
+			&tlmi_priv.class_dev->kobj);
+	if (!tlmi_priv.attribute_kset) {
+		ret = -ENOMEM;
+		goto fail_device_created;
+	}
+
+	for (i = 0; i < tlmi_priv.settings_count; ++i) {
+		/*Check if index is a valid setting - skip if it isn't */
+		if (!tlmi_priv.setting[i])
+			continue;
+
+		/* build attribute */
+		tlmi_priv.setting[i]->attr_name_kobj = kzalloc(sizeof(struct kobject), GFP_KERNEL);
+		if (!tlmi_priv.setting[i]->attr_name_kobj) {
+			ret = -ENOMEM;
+			goto fail_create_attr;
+		}
+		tlmi_priv.setting[i]->attr_name_kobj->kset = tlmi_priv.attribute_kset;
+
+		ret = kobject_init_and_add(tlmi_priv.setting[i]->attr_name_kobj, &attr_name_ktype,
+				NULL, "%s", tlmi_priv.setting[i]->display_name);
+		if (ret)
+			goto fail_create_attr;
+
+		ret = sysfs_create_group(tlmi_priv.setting[i]->attr_name_kobj, &tlmi_attr_group);
+		if (ret)
+			goto fail_create_attr;
+	}
+
+	/* Create authentication entries */
+	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
+								&tlmi_priv.class_dev->kobj);
+	if (!tlmi_priv.authentication_kset) {
+		ret = -ENOMEM;
+		goto fail_create_attr;
+	}
+	tlmi_priv.pwd_admin->attr_name_kobj = kzalloc(sizeof(struct kobject), GFP_KERNEL);
+	if (!tlmi_priv.pwd_admin->attr_name_kobj) {
+		ret = -ENOMEM;
+		goto fail_create_attr;
+	}
+	tlmi_priv.pwd_admin->attr_name_kobj->kset = tlmi_priv.authentication_kset;
+	ret = kobject_init_and_add(tlmi_priv.pwd_admin->attr_name_kobj, &attr_name_ktype,
+			NULL, "%s", "Admin");
+	if (ret)
+		goto fail_create_attr;
+
+	ret = sysfs_create_group(tlmi_priv.pwd_admin->attr_name_kobj, &auth_attr_group);
+	if (ret)
+		goto fail_create_attr;
+
+	tlmi_priv.pwd_power->attr_name_kobj = kzalloc(sizeof(struct kobject), GFP_KERNEL);
+	if (!tlmi_priv.pwd_power->attr_name_kobj) {
+		ret = -ENOMEM;
+		goto fail_create_attr;
+	}
+	tlmi_priv.pwd_power->attr_name_kobj->kset = tlmi_priv.authentication_kset;
+	ret = kobject_init_and_add(tlmi_priv.pwd_power->attr_name_kobj, &attr_name_ktype,
+			NULL, "%s", "System");
+	if (ret)
+		goto fail_create_attr;
+
+	ret = sysfs_create_group(tlmi_priv.pwd_power->attr_name_kobj, &auth_attr_group);
+	if (ret)
+		goto fail_create_attr;
+
+	return ret;
+
+fail_create_attr:
+	tlmi_release_attr();
+fail_device_created:
+	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
+fail_class_created:
+	class_unregister(&firmware_attributes_class);
+	return ret;
+}
+
+static void tlmi_sysfs_exit(void)
+{
+	tlmi_release_attr();
+	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
+	class_unregister(&firmware_attributes_class);
+}
+
+/* ---- Base Driver -------------------------------------------------------- */
+static int tlmi_analyze(void)
+{
+	struct tlmi_pwdcfg pwdcfg;
+	acpi_status status;
+	int i = 0;
+	int ret;
+
+	if (wmi_has_guid(LENOVO_SET_BIOS_SETTINGS_GUID) &&
+	    wmi_has_guid(LENOVO_SAVE_BIOS_SETTINGS_GUID))
+		tlmi_priv.can_set_bios_settings = true;
+
+	if (wmi_has_guid(LENOVO_GET_BIOS_SELECTIONS_GUID))
+		tlmi_priv.can_get_bios_selections = true;
+
+	if (wmi_has_guid(LENOVO_SET_BIOS_PASSWORD_GUID))
+		tlmi_priv.can_set_bios_password = true;
+
+	if (wmi_has_guid(LENOVO_BIOS_PASSWORD_SETTINGS_GUID))
+		tlmi_priv.can_get_password_settings = true;
+
+	/*
+	 * Try to find the number of valid settings of this machine
+	 * and use it to create sysfs attributes
+	 */
+	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i) {
+		char *item = NULL;
+		int spleng = 0;
+		int num = 0;
+		char *p;
+		struct tlmi_attr_setting *setting;
+
+		tlmi_priv.setting[i] = NULL;
+		status = tlmi_setting(i, &item, LENOVO_BIOS_SETTING_GUID);
+		if (ACPI_FAILURE(status))
+			break;
+		if (!item)
+			break;
+		if (!*item)
+			continue;
+
+		/* It is not allowed to have '/' for file name. Convert it into '\'. */
+		spleng = strlen(item);
+		for (num = 0; num < spleng; num++) {
+			if (item[num] == '/')
+				item[num] = '\\';
+		}
+
+		/* Remove the value part */
+		p = strchr(item, ',');
+		if (p)
+			*p = '\0';
+
+		/* Create a setting entry */
+		setting = kzalloc(sizeof(struct tlmi_attr_setting), GFP_KERNEL);
+		if (!setting) {
+			ret = -ENOMEM;
+			goto fail_clear_attr;
+		}
+		strscpy(setting->display_name, item, TLMI_SETTINGS_MAXLEN);
+
+		/* If BIOS selections supported, load those */
+		if (tlmi_priv.can_get_bios_selections) {
+			ret = tlmi_get_bios_selections(setting->display_name,
+					&setting->possible_values);
+			if (ret || !setting->possible_values)
+				pr_info("Error retrieving possible values for %d : %s\n",
+						i, setting->display_name);
+		}
+		tlmi_priv.setting[i] = setting;
+		tlmi_priv.settings_count++;
+		kfree(item);
+	}
+
+	/* Create password setting structure */
+	ret = tlmi_get_pwd_settings(&pwdcfg);
+	if (ret)
+		goto fail_clear_attr;
+
+	tlmi_priv.pwd_admin = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
+	if (!tlmi_priv.pwd_admin) {
+		ret = -ENOMEM;
+		goto fail_clear_attr;
+	}
+	sprintf(tlmi_priv.pwd_admin->display_name, "admin");
+	sprintf(tlmi_priv.pwd_admin->kbdlang, "us");
+	sprintf(tlmi_priv.pwd_admin->encoding, "ascii");
+	tlmi_priv.pwd_admin->minlen = pwdcfg.min_length;
+	tlmi_priv.pwd_admin->maxlen = pwdcfg.max_length;
+	if (pwdcfg.password_state & TLMI_PAP_PWD)
+		tlmi_priv.pwd_admin->valid = true;
+
+	tlmi_priv.pwd_power = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
+	if (!tlmi_priv.pwd_power) {
+		ret = -ENOMEM;
+		goto fail_clear_attr;
+	}
+	sprintf(tlmi_priv.pwd_power->display_name, "power-on");
+	sprintf(tlmi_priv.pwd_power->kbdlang, "us");
+	sprintf(tlmi_priv.pwd_power->encoding, "ascii");
+	tlmi_priv.pwd_power->minlen = pwdcfg.min_length;
+	tlmi_priv.pwd_power->maxlen = pwdcfg.max_length;
+
+	if (pwdcfg.password_state & TLMI_POP_PWD)
+		tlmi_priv.pwd_power->valid = true;
+
+	return 0;
+
+fail_clear_attr:
+	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i)
+		kfree(tlmi_priv.setting[i]);
+	return ret;
+}
+
+static int tlmi_remove(struct wmi_device *wdev)
+{
+	tlmi_sysfs_exit();
+	return 0;
+}
+
+static int tlmi_probe(struct wmi_device *wdev, const void *context)
+{
+	tlmi_analyze();
+	return tlmi_sysfs_init();
+}
+
+static const struct wmi_device_id tlmi_id_table[] = {
+	{ .guid_string = LENOVO_BIOS_SETTING_GUID },
+	{ }
+};
+
+static struct wmi_driver tlmi_driver = {
+	.driver = {
+		.name = "think-lmi",
+	},
+	.id_table = tlmi_id_table,
+	.probe = tlmi_probe,
+	.remove = tlmi_remove,
+};
+
+static int __init tlmi_init(void)
+{
+	return wmi_driver_register(&tlmi_driver);
+}
+
+static void __exit tlmi_exit(void)
+{
+	wmi_driver_unregister(&tlmi_driver);
+}
+
+MODULE_AUTHOR("Sugumaran L <slacshiminar@lenovo.com>");
+MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
+MODULE_AUTHOR("Corentin Chary <corentin.chary@gmail.com>");
+MODULE_DESCRIPTION("ThinkLMI Driver");
+MODULE_LICENSE("GPL");
+
+module_init(tlmi_init);
+module_exit(tlmi_exit);
diff --git a/include/linux/think-lmi.h b/include/linux/think-lmi.h
new file mode 100644
index 000000000..9133c0567
--- /dev/null
+++ b/include/linux/think-lmi.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef _THINK_LMI_H_
+#define _THINK_LMI_H_
+
+#define TLMI_SETTINGS_COUNT  256
+#define TLMI_SETTINGS_MAXLEN 512
+#define TLMI_PWD_MAXLEN       64
+#define TLMI_PWDTYPE_MAXLEN   64
+#define TLMI_ENC_MAXLEN       64
+#define TLMI_LANG_MAXLEN       4
+/*
+ * Longest string should be in the set command: allow size of BIOS
+ * option and choice
+ */
+#define TLMI_GETSET_MAXLEN (TLMI_SETTINGS_MAXLEN + TLMI_SETTINGS_MAXLEN)
+
+#define THINKLMI_GET_SETTINGS _IOR('T', 1, int *)
+#define THINKLMI_GET_SETTINGS_STRING _IOWR('T', 2, char *)
+#define THINKLMI_SET_SETTING _IOW('T', 3, char *)
+#define THINKLMI_SHOW_SETTING _IOWR('T', 4, char *)
+#define THINKLMI_AUTHENTICATE _IOW('T', 5, char *)
+#define THINKLMI_CHANGE_PASSWORD _IOW('T', 6, char *)
+
+/* password configuration details */
+struct tlmi_pwdcfg {
+	uint32_t password_mode;
+	uint32_t password_state;
+	uint32_t min_length;
+	uint32_t max_length;
+	uint32_t supported_encodings;
+	uint32_t supported_keyboard;
+};
+
+/* password setting details */
+struct tlmi_pwd_setting {
+	struct kobject *attr_name_kobj;
+	bool valid;
+	char display_name[TLMI_PWDTYPE_MAXLEN];
+	char password[TLMI_PWD_MAXLEN];
+	int minlen;
+	int maxlen;
+	char encoding[TLMI_ENC_MAXLEN];
+	char kbdlang[TLMI_LANG_MAXLEN];
+};
+
+/* Attribute setting details */
+struct tlmi_attr_setting {
+	struct kobject *attr_name_kobj;
+	char display_name[TLMI_SETTINGS_MAXLEN];
+	char *possible_values;
+};
+
+struct think_lmi {
+	struct wmi_device *wmi_device;
+
+	int settings_count;
+	bool can_set_bios_settings;
+	bool can_get_bios_selections;
+	bool can_set_bios_password;
+	bool can_get_password_settings;
+
+	struct tlmi_attr_setting *setting[TLMI_SETTINGS_COUNT];
+	struct device *class_dev;
+	struct kset *attribute_kset;
+	struct kset *authentication_kset;
+	struct tlmi_pwd_setting *pwd_admin;
+	struct tlmi_pwd_setting *pwd_power;
+};
+
+#endif /* !_THINK_LMI_H_ */
+
-- 
2.30.2

