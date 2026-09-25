Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657F34E1C79
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352080; cv=none; b=GDkIfPK+roYTTSFoDBSavoG000VmCoqaxUIIkJ9m5lHcnMogCzW5mWszUeJnvnLx/aateTSyeLMLtMXEuQHnB0zjTpmzoLyeJa/Qn712NV3dRzeVY426bSn/M4W+agmHEOsw8CCCf0O+aP8KDCwg9lUQQCqdwvs9jSi9FvsCQ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352080; c=relaxed/simple;
	bh=Of9tNreal7ec/f1y2KsWE8SVMZlibXA4PLnQ9LC27pE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l8NIUax3qkU8cAEcss4QvWD9y3pz8LGQFa088gZz9cWPP+VA5+P0g0thh04m1eVWHFUU/jhcRAD7qG4xg5G010KNs1MB4dGDTsNbbW1at9ela8l7DeeLxOli7AodHv2o1scjuvLUpkTeDzlCGQq2+kmWuDXhpChq4wT4MbvmAB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=iRooECCr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wOAdUQpq; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="iRooECCr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wOAdUQpq"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 374921D000F4;
	Fri, 25 Sep 2026 12:01:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 25 Sep 2026 12:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1790352076; x=
	1790438476; bh=GykgitPR2eV4YR+Eb3QbohFKBkOmVD6oH2EWbM6exK0=; b=i
	RooECCrITbWECOg8rtxd835BpsjyDkheRL+mn6jIIRFLaEIm8UgyV+8ivy86lcfH
	7CA55k2+CENDQpe3usxwv8X+z7lkfarzovNpfs7NrZaFycg425ttR0p0kfd0c1IC
	9BFBUdzAvdgNtwg5L+2xMxKx/e5MWprfl0gj4y7vhi31zSJF502mqYsLACfVNEFW
	D3kgRUFMKnycVO8hFBntmL9Q68EsgW1byaaKMHjGubpDy8XWZBuhg4zZAPUPOb8n
	s2W3B7xkdVxK4BjSd8EUmhx7am2OfeQYbP93FOBWXGgI7eR8CYijUEN4mq/bujii
	A/+D3eiSGXGxlR85YtMWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790352076; x=1790438476; bh=G
	ykgitPR2eV4YR+Eb3QbohFKBkOmVD6oH2EWbM6exK0=; b=wOAdUQpqURbgjpO6C
	6xW931JLlIiSR2rczSSIGDgTD8eEd2wzh+pM86253/8AnkjnI/7QRknGDfTFhyUE
	Im67+lc7rmpTF9yoWf5iArbKRtC1SJW+zXVLgsSNTqzg2jbLRP3i1WSfBWB1cQfv
	yyCB1RwIQxMmA6iR62bI3Mnp18A9ao75r3ZLWFyHyOWuz2fOjlSfjSWkgCvz9QSB
	EzOT7N3Cuejo8Cn7xeYfz3OnqFtttn+5szu8EsVuHkGd6VZMazNRZz3zKz9fhYeg
	N4M2AmUREsuE+HVyh6QG2Vspx4O9wtNmLgAtqnG9niAxkE6aLIdB/aRH7O3hO21/
	nY0OQ==
X-ME-Sender: <xms:y5q2arbGgPV4r-LK62Mb_M8CL2CUmpXXIVGit-UQvU3RnHoKJ3sOvw>
    <xme:y5q2akY9DbNlQ6a4VD5bR3j4jPG6hpR9ZG6eNUQrOMk5gb_Ju8vzo1da9RvcfAake
    hKzksta_27z5UCucE4zYO8K7pogdyFS2kJUgP_pVXPSDQJXfAhu0QI>
X-ME-Received: <xmr:y5q2akmJdno1dkmD7EG2_wJ77SzLlYc-sxeTqJo73Qr9xSb_FBa2RNiTykGJN0ZI-aC2V8-yISWxUGn4A6Q>
X-ME-Proxy-Cause: dmFkZTFAqRjIET+o+Knc5wq04/pJp/kG3NWH79se3OUk8Jx9Ws+5TeXeAhw0lw84CZfCa5
    XszS53ZNMPSGgM+TC43vxDh7advKDrTf4PgP56HnEr5zEVWCUyE2k8BDspoPX499GaxTRE
    V1eKcNyiinHtxna9NvYs99yIHYSWsXCOY7shQ2n5xKrnBF94Ke1m+umQMzcXbaKO4nuzlv
    pHBbG84yYgIabal4U0mJ/68h+LEm6dp/Hsp+Y10KwEA53rge7qeaPxpGejeywcyarxVZzV
    xqTm+T91nk9oSRQAjttvysVIHJW/QeiSJW95yiubIUvuIYH/i+YPH0msP/UQBMnrJBq4dX
    CSbdCf3xeZNP4JOsUCcIWxnqQz/urDlhlcNreNvu0IAtXvWD+0ir6mxqbvRb6FwySeIvSI
    O73DtU8xaLdUwjj3UFUERpPjSeLQjY+AB5tKz9YbwmEOmoptbji7gAB+frkFkqPzn1LzIN
    B4be2nUoDMayc9htWyORfMw5pLap6CymK2EyKRnWZ7cWGOO7zvix29WoShP28JN+lpLzYb
    v9ljtDYZkKEj313M+tBpXDCul+El2PFVDyARJKaC/Dzv+HhsxecAITbszsdpb5Z/LZwNxx
    wODo1jKl4oADDRGqOja37CWfz4pV7bWe5DjMjVTLvvqey4cdcvqSkUczq8fg
X-ME-Proxy: <xmx:y5q2av0H1GG56UbzUctYBqktBYum8HcoO8EKMP5SjwMoZGi5BpwRBQ>
    <xmx:zJq2ak0FdGwFpIIuFqIkQh6UhE6val8QgZb4KJe_lec9EXq7LzOSuQ>
    <xmx:zJq2ahpQ2UUycVIfF4OI9g7cdevWfQJksuwBaWZe9IGD_miifJJj5Q>
    <xmx:zJq2aghMlOaBH3JzqvyXtAelT-1P3diWKdpqeh6w_mOFpSRJjpmvhQ>
    <xmx:zJq2aouMRw8CJ8VOSjNNc4bEan-QrCmBKhxIDo7CVWlj0h3zNoVawXC0>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Sep 2026 12:01:14 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: prasanth.ksr@dell.com,
	W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	derekjohn.clark@gmail.com,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 5/7] platform/x86: think-lmi: Initial ThinkLMI v2 driver
Date: Fri, 25 Sep 2026 12:00:33 -0400
Message-ID: <20260925160047.2063361-6-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lenovo Thinkpad, Thinkstation and ThinkCenter are moving to a new common
WMI implementation.

This driver adds initial support for the new implementation, allowing
attributes to be read and modified.

Certificate based authentication is not implemented in this
version.

think-lmi is updated to use this driver if supported by the HW and
requested by the user.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/x86/lenovo/think-lmi-v2.c | 960 +++++++++++++++++++++
 drivers/platform/x86/lenovo/think-lmi.c    |   9 +-
 drivers/platform/x86/lenovo/think-lmi.h    |  59 ++
 3 files changed, 1025 insertions(+), 3 deletions(-)
 create mode 100644 drivers/platform/x86/lenovo/think-lmi-v2.c

diff --git a/drivers/platform/x86/lenovo/think-lmi-v2.c b/drivers/platform/x86/lenovo/think-lmi-v2.c
new file mode 100644
index 000000000000..5bc0a349c5fb
--- /dev/null
+++ b/drivers/platform/x86/lenovo/think-lmi-v2.c
@@ -0,0 +1,960 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Think LMI V2 BIOS configuration driver
+ *
+ * Copyright(C) 2026 Lenovo
+ * Distributed under the GPL-2.0 license
+ */
+
+#include <linux/acpi.h>
+#include <linux/string_helpers.h>
+#include <linux/wmi.h>
+#include "../firmware_attributes_class.h"
+#include "think-lmi.h"
+
+/*
+ * Name: BiosSetting
+ * Description: Get item name and settings for current LMI instance.
+ * Type: Query
+ */
+#define LENOVO_BIOS_SETTING_GUID "4B79FBA6-FFD4-41B6-8EA8-E81CDA0F5FC3"
+
+/*
+ * Name: Configuration
+ * Description: The Configuration class provides methods to configure the
+ * BIOS settings, change system behavior, and perform certain actions
+ * After making changes to the BIOS settings, you must reboot the computer
+ * before the changes will take effect.
+ * Type: Method
+ */
+#define LENOVO_BIOS_CONFIGURATION_GUID "816E5C9E-3E99-4385-AA5A-7353E14B781B"
+
+/* Method IDS for configuration GUID */
+#define SET_ID          1
+#define SAVE_ID         2
+#define DISCARD_ID      3
+#define LOAD_FACTORY_ID 4
+#define LOAD_CUSTOM_ID  5
+
+#define LENOVO_BIOS_ACCESS_DATA_GUID "1178acfd-78a1-46d8-a8eb-5f7cb74a3b4e"
+#define LENOVO_BIOS_ACCESS_GUID "5cb5f556-30ce-40d3-a135-7ca0648a5a52"
+
+/* Method IDS for Access GUID */
+#define SET_PASSWORD    1
+#define AUTHENTICATE    2
+#define SET_CERT        3
+#define UPDATE_CERT     4
+#define CLEAR_CERT      5
+#define CERT_TO_PWD     6
+#define CERT_THUMBPRINT 7
+
+static bool tlmi_initialised;
+#define TLMI_POP_PWD  BIT(0) /* Power-on */
+#define TLMI_SVP_PWD  BIT(1) /* Supervisor */
+#define TLMI_SMP_PWD  BIT(2) /* System Management */
+#define TLMI_SVC_PWD  BIT(7) /* Supervisor Certificate */
+#define TLMI_SMC_PWD  BIT(8) /* System Certificate */
+
+static struct think_lmi tlmi_priv;
+
+static DEFINE_MUTEX(tlmi_lock);
+
+/* ---- Utility/access functions -----------------------------*/
+
+static inline struct tlmi_pwd_setting *to_tlmi_pwd_setting(struct kobject *kobj)
+{
+	return container_of(kobj, struct tlmi_pwd_setting, kobj);
+}
+
+static inline struct tlmi_attr_setting *to_tlmi_attr_setting(struct kobject *kobj)
+{
+	return container_of(kobj, struct tlmi_attr_setting, kobj);
+}
+
+static const struct tlmi_err_codes tlmi_errs[] = {
+	{"Success", 0},
+	{"Not Supported", -EOPNOTSUPP},
+	{"Invalid Parameter", -EINVAL},
+	{"Access Denied", -EACCES},
+	{"System Busy", -EBUSY},
+	{"System Locked", -EACCES},
+};
+
+static const char * const level_options[] = {
+	[TLMI_LEVEL_USER] = "user",
+	[TLMI_LEVEL_MASTER] = "master",
+};
+
+/* Check for return errors and if found convert to suitable error code */
+static int tlmi_returnstr_to_err(const char *errstr)
+{
+	int i;
+
+	for (i = 0; i < sizeof(tlmi_errs) / sizeof(struct tlmi_err_codes); i++) {
+		if (!strcmp(tlmi_errs[i].err_str, errstr))
+			return tlmi_errs[i].err_code;
+	}
+	return 0; /* assume valid data */
+}
+
+/* Extract data or error string from WMI return buffer */
+static int tlmi_extract_output(const struct acpi_buffer *output, char **data)
+{
+	const union acpi_object *obj;
+	int tlmi_err;
+	char *ret_str;
+
+	obj = output->pointer;
+	if (!obj)
+		return -ENOMEM;
+
+	if (obj->type != ACPI_TYPE_STRING)
+		return -EIO;
+
+	if (!obj->string.pointer)
+		return -EIO;
+
+	ret_str = kstrdup(obj->string.pointer, GFP_KERNEL);
+	if (!ret_str)
+		return -ENOMEM;
+
+	/* Check if error string was returned */
+	tlmi_err = tlmi_returnstr_to_err(ret_str);
+
+	/* If not an error string, and caller wants data, pass it back */
+	if (!tlmi_err && data)
+		*data = ret_str;
+	else /* error string no longer needed */
+		kfree(ret_str);
+
+	return tlmi_err;
+}
+
+/* Utility function to execute WMI call to BIOS */
+static int tlmi_simple_call(const char *guid, int instance, int method,
+			    char *buf, int len, char **data)
+{
+	const struct acpi_buffer input = { len, buf };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+	int err = 0;
+
+	status = wmi_evaluate_method(guid, instance, method, &input, &output);
+	if (ACPI_FAILURE(status)) {
+		kfree(output.pointer);
+		return -EIO;
+	}
+	err = tlmi_extract_output(&output, data);
+	kfree(output.pointer);
+
+	return err;
+}
+
+/* ---- sysfs entries --------------------------------------------------------- */
+static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *attr,
+				   char *buf)
+{
+	return sprintf(buf, "%d\n", tlmi_priv.pending_changes);
+}
+
+static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
+
+static ssize_t save_settings_show(struct kobject *kobj, struct kobj_attribute *attr,
+				  char *buf)
+{
+	return sysfs_emit(buf, "%s\n", tlmi_priv.save_required ? "needed" : "not-needed");
+}
+
+static ssize_t save_settings_store(struct kobject *kobj, struct kobj_attribute *attr,
+				   const char *buf, size_t count)
+{
+	int ret = 0;
+
+	/* save command triggered by writing 'save' */
+	if (strncmp(buf, "save", 4))
+		return -EINVAL;
+
+	/* Use lock in case multiple WMI operations needed */
+	guard(mutex)(&tlmi_lock);
+
+	/* Check there is actually something to save */
+	if (!tlmi_priv.save_required)
+		return -ENOENT;
+
+	ret = tlmi_simple_call(LENOVO_BIOS_CONFIGURATION_GUID, 0, SAVE_ID, NULL, 0, NULL);
+	if (ret < 0)
+		return ret;
+
+	tlmi_priv.save_required = false;
+	tlmi_priv.reboot_required = true;
+
+	if (!tlmi_priv.pending_changes) {
+		tlmi_priv.pending_changes = true;
+		/* let userland know it may need to check reboot pending again */
+		kobject_uevent(&tlmi_priv.class_dev->kobj, KOBJ_CHANGE);
+	}
+	return ret ?: count;
+}
+
+static struct kobj_attribute save_settings = __ATTR_RW(save_settings);
+
+/* ---- Authentication sysfs --------------------------------------------------------- */
+static ssize_t is_enabled_show(struct kobject *kobj, struct kobj_attribute *attr,
+			       char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	return sysfs_emit(buf, "%d\n", setting->pwd_enabled);
+}
+
+static struct kobj_attribute auth_is_pass_set = __ATTR_RO(is_enabled);
+
+static ssize_t current_password_store(struct kobject *kobj,
+				      struct kobj_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+	size_t pwdlen, arglen;
+	char *argbuf = NULL;
+	int ret;
+
+	pwdlen = strlen(buf);
+	/* pwdlen == 0 is allowed to clear the password */
+	if (pwdlen && (pwdlen < setting->minlen || pwdlen > setting->maxlen))
+		return -EINVAL;
+
+	strscpy(setting->password, buf, setting->maxlen);
+	/* Strip out CR if one is present - setting password won't work if it is present */
+	strreplace(setting->password, '\n', '\0');
+
+	arglen = wmi_calculate_string_buffer(setting->password);
+	argbuf = kzalloc(arglen, GFP_KERNEL);
+	if (!argbuf)
+		return -ENOMEM;
+
+	ret = wmi_populate_string_buffer(argbuf, arglen, setting->password);
+	if (ret < 0) {
+		kfree(argbuf);
+		return -EINVAL;
+	}
+
+	ret = tlmi_simple_call(LENOVO_BIOS_ACCESS_GUID, 0, AUTHENTICATE, argbuf, arglen, NULL);
+	kfree(argbuf);
+
+	/* Ignore error if password is being cleared. Authentication is cleared */
+	if (!pwdlen)
+		return count;
+
+	return ret ?: count;
+}
+
+static struct kobj_attribute auth_current_password = __ATTR_WO(current_password);
+
+static ssize_t new_password_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+	size_t pwdlen, cur_pwdlen, arglen;
+	char *argbuf = NULL, *start;
+	enum pwd_type_v2 pwd_type;
+	char *new_pwd;
+	int ix = 0;
+	int ret;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	if (!tlmi_priv.can_set_bios_password)
+		return -EOPNOTSUPP;
+
+	/* Strip out CR if one is present, setting password won't work if it is present */
+	new_pwd = kstrdup_and_replace(buf, '\n', '\0', GFP_KERNEL);
+	if (!new_pwd)
+		return -ENOMEM;
+
+	/* Use lock in case multiple WMI operations needed */
+	guard(mutex)(&tlmi_lock);
+
+	pwdlen = strlen(new_pwd);
+	/* pwdlen == 0 is allowed to clear the password */
+	if (pwdlen && (pwdlen < setting->minlen || pwdlen > setting->maxlen)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	cur_pwdlen = wmi_calculate_string_buffer(setting->password);
+	pwdlen = wmi_calculate_string_buffer(new_pwd);
+	arglen = 2 + cur_pwdlen + pwdlen;
+	argbuf = kzalloc(arglen, GFP_KERNEL);
+	if (!argbuf) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	pwd_type = setting->type_v2;
+	/* For HDD and NVME - check if we're user/master and drive index */
+	if (setting == tlmi_priv.pwd_hdd) {
+		if (setting->level == TLMI_LEVEL_MASTER)
+			pwd_type = MASTERHDD1;
+		pwd_type += (setting->index - 1);
+	} else if (setting == tlmi_priv.pwd_nvme) {
+		if (setting->level == TLMI_LEVEL_MASTER)
+			pwd_type = MASTERNVME1;
+		pwd_type += (setting->index - 1);
+	}
+	argbuf[0] = pwd_type;
+	start = argbuf + 2;
+
+	ix = wmi_populate_string_buffer(start, cur_pwdlen, setting->password);
+	if (ix < 0)
+		goto out;
+	start += ix;
+	ix = wmi_populate_string_buffer(start, pwdlen, new_pwd);
+	if (ix < 0)
+		goto out;
+
+	ret = tlmi_simple_call(LENOVO_BIOS_ACCESS_GUID, 0, SET_PASSWORD, argbuf, arglen, NULL);
+	if (ret)
+		goto out;
+
+out:
+	kfree(new_pwd);
+	kfree(argbuf);
+	return ret ?: count;
+}
+
+static struct kobj_attribute auth_new_password = __ATTR_WO(new_password);
+
+static ssize_t min_password_length_show(struct kobject *kobj, struct kobj_attribute *attr,
+					char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	return sysfs_emit(buf, "%d\n", setting->minlen);
+}
+
+static struct kobj_attribute auth_min_pass_length = __ATTR_RO(min_password_length);
+
+static ssize_t max_password_length_show(struct kobject *kobj, struct kobj_attribute *attr,
+					char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	return sysfs_emit(buf, "%d\n", setting->maxlen);
+}
+
+static struct kobj_attribute auth_max_pass_length = __ATTR_RO(max_password_length);
+
+static ssize_t mechanism_show(struct kobject *kobj, struct kobj_attribute *attr,
+			      char *buf)
+{
+	return sysfs_emit(buf, "password\n");
+}
+
+static struct kobj_attribute auth_mechanism = __ATTR_RO(mechanism);
+
+static ssize_t role_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	return sysfs_emit(buf, "%s\n", setting->role);
+}
+
+static struct kobj_attribute auth_role = __ATTR_RO(role);
+
+static ssize_t index_show(struct kobject *kobj, struct kobj_attribute *attr,
+			  char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	return sysfs_emit(buf, "%d\n", setting->index);
+}
+
+static ssize_t index_store(struct kobject *kobj,
+			   struct kobj_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+	int err, val;
+
+	err = kstrtoint(buf, 10, &val);
+	if (err < 0)
+		return err;
+
+	if (val < 0 || val > TLMI_INDEX_MAX)
+		return -EINVAL;
+
+	setting->index = val;
+	return count;
+}
+
+static struct kobj_attribute auth_index = __ATTR_RW(index);
+
+static ssize_t level_show(struct kobject *kobj, struct kobj_attribute *attr,
+			  char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	return sysfs_emit(buf, "%s\n", level_options[setting->level]);
+}
+
+static ssize_t level_store(struct kobject *kobj,
+			   struct kobj_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+	int i;
+
+	/* Scan for a matching profile */
+	i = sysfs_match_string(level_options, buf);
+	if (i < 0)
+		return -EINVAL;
+
+	setting->level = i;
+	return count;
+}
+
+static struct kobj_attribute auth_level = __ATTR_RW(level);
+
+static umode_t auth_attr_is_visible(struct kobject *kobj,
+				    struct attribute *attr, int n)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	/* We only want to display level and index settings on HDD/NVMe */
+	if (attr == &auth_index.attr || attr == &auth_level.attr) {
+		if (setting == tlmi_priv.pwd_hdd || setting == tlmi_priv.pwd_nvme)
+			return attr->mode;
+		return 0;
+	}
+
+	return attr->mode;
+}
+
+static struct attribute *auth_attrs[] = {
+	&auth_is_pass_set.attr,
+	&auth_min_pass_length.attr,
+	&auth_max_pass_length.attr,
+	&auth_current_password.attr,
+	&auth_new_password.attr,
+	&auth_role.attr,
+	&auth_mechanism.attr,
+	&auth_index.attr,
+	&auth_level.attr,
+	NULL
+};
+
+static const struct attribute_group auth_attr_group = {
+	.is_visible = auth_attr_is_visible,
+	.attrs = auth_attrs,
+};
+__ATTRIBUTE_GROUPS(auth_attr);
+
+static void tlmi_pwd_setting_release(struct kobject *kobj)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	kfree(setting);
+}
+
+static const struct kobj_type tlmi_pwd_setting_ktype = {
+	.release        = &tlmi_pwd_setting_release,
+	.sysfs_ops	= &kobj_sysfs_ops,
+	.default_groups = auth_attr_groups,
+};
+
+/* ---- Attribute sysfs --------------------------------------------------------- */
+
+static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *attr,
+				 char *buf)
+{
+	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
+
+	return sysfs_emit(buf, "%s\n", setting->display_name);
+}
+
+static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
+
+	return sysfs_emit(buf, "%s\n", setting->current_value);
+}
+
+static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
+
+	return sysfs_emit(buf, "%s\n", setting->possible_values);
+}
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
+
+	if (setting->possible_values) {
+		/* Figure out what setting type is as BIOS does not return this */
+		if (strchr(setting->possible_values, ';'))
+			return sysfs_emit(buf, "enumeration\n");
+	}
+	/* Anything else is going to be a string */
+	return sysfs_emit(buf, "string\n");
+}
+
+static ssize_t current_value_store(struct kobject *kobj,
+				   struct kobj_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
+	size_t arglen, namelen, valuelen;
+	char *argbuf = NULL, *start;
+	char *new_setting = NULL;
+	int ret = -EINVAL;
+	int ix = 0;
+
+	if (!tlmi_priv.can_set_bios_settings)
+		return -EOPNOTSUPP;
+
+	/* If a save has been done then a reboot is needed */
+	if (tlmi_priv.reboot_required)
+		return -EPERM;
+
+	/* Strip out CR if one is present */
+	new_setting = kstrdup_and_replace(buf, '\n', '\0', GFP_KERNEL);
+	if (!new_setting)
+		return -ENOMEM;
+
+	/* Use lock in case multiple WMI operations needed */
+	guard(mutex)(&tlmi_lock);
+
+	/* Calculate and alloc buffer for command string */
+	namelen = wmi_calculate_string_buffer(setting->name);
+	valuelen = wmi_calculate_string_buffer(new_setting);
+	arglen = namelen + valuelen;
+	argbuf = kzalloc(arglen, GFP_KERNEL);
+	if (!argbuf) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	/* build argument buffer from inputs */
+	start = argbuf;
+	ix = wmi_populate_string_buffer(start, namelen, setting->name);
+	if (ix < 0)
+		goto out;
+	start += ix;
+	ix = wmi_populate_string_buffer(start, valuelen, new_setting);
+	if (ix < 0)
+		goto out;
+	start += ix;
+
+	ret = tlmi_simple_call(LENOVO_BIOS_CONFIGURATION_GUID, 0, SET_ID, argbuf, arglen, NULL);
+	if (ret)
+		goto out;
+
+	tlmi_priv.save_required = true;
+
+out:
+	kfree(argbuf);
+	kfree(new_setting);
+	return ret ?: count;
+}
+
+static struct kobj_attribute attr_display_name = __ATTR_RO(display_name);
+
+static struct kobj_attribute attr_possible_values = __ATTR_RO(possible_values);
+
+static struct kobj_attribute attr_current_val = __ATTR_RW_MODE(current_value, 0600);
+
+static struct kobj_attribute attr_type = __ATTR_RO(type);
+
+static struct attribute *tlmi_attrs[] = {
+	&attr_display_name.attr,
+	&attr_current_val.attr,
+	&attr_possible_values.attr,
+	&attr_type.attr,
+	NULL
+};
+
+static const struct attribute_group tlmi_attr_group = {
+	.attrs = tlmi_attrs,
+};
+__ATTRIBUTE_GROUPS(tlmi_attr);
+
+static void tlmi_release_setting(struct tlmi_attr_setting *setting)
+{
+	if (setting) {
+		kfree(setting->name);
+		kfree(setting->display_name);
+		kfree(setting->possible_values);
+		kfree(setting->current_value);
+		kfree(setting->factory_default);
+		kfree(setting);
+	}
+}
+
+static void tlmi_attr_setting_release(struct kobject *kobj)
+{
+	tlmi_release_setting(to_tlmi_attr_setting(kobj));
+}
+
+static const struct kobj_type tlmi_attr_setting_ktype = {
+	.release        = &tlmi_attr_setting_release,
+	.sysfs_ops	= &kobj_sysfs_ops,
+	.default_groups = tlmi_attr_groups,
+};
+
+/* ---- Initialisation --------------------------------------------------------- */
+
+static int tlmi_setting(struct wmi_device *wdev, int item)
+{
+	struct tlmi_attr_setting *setting;
+	union acpi_object *obj;
+
+	obj = wmidev_block_query(wdev, item);
+	if (!obj)
+		return -EIO;
+
+	if (obj->type != ACPI_TYPE_PACKAGE) {
+		kfree(obj);
+		return -EINVAL;
+	}
+
+	/* Confirm we have a valid item */
+	if (!obj->package.elements[0].string.pointer[0]) {
+		kfree(obj);
+		return 0;
+	}
+
+	setting = kzalloc_obj(*setting);
+	if (!setting) {
+		kfree(obj);
+		return -ENOMEM;
+	}
+
+	setting->wdev = wdev;
+	setting->index = item;
+	setting->name = kstrdup(obj->package.elements[0].string.pointer, GFP_KERNEL);
+	setting->current_value = kstrdup(obj->package.elements[1].string.pointer, GFP_KERNEL);
+	setting->possible_values = kstrdup(obj->package.elements[2].string.pointer, GFP_KERNEL);
+	setting->factory_default = kstrdup(obj->package.elements[3].string.pointer, GFP_KERNEL);
+	setting->display_name = kstrdup(obj->package.elements[5].string.pointer, GFP_KERNEL);
+	setting->access_level = obj->package.elements[6].integer.value;
+	setting->read_only = obj->package.elements[7].integer.value ? true : false;
+	tlmi_priv.setting[item] = setting;
+
+	kfree(obj);
+	return 0;
+}
+
+static void tlmi_release_attr(void)
+{
+	struct kobject *pos, *n;
+
+	/* Attribute structures */
+	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
+	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &save_settings.attr);
+
+	list_for_each_entry_safe(pos, n, &tlmi_priv.attribute_kset->list, entry)
+		kobject_put(pos);
+
+	kset_unregister(tlmi_priv.attribute_kset);
+
+	/* Authentication structures */
+	list_for_each_entry_safe(pos, n, &tlmi_priv.authentication_kset->list, entry)
+		kobject_put(pos);
+
+	kset_unregister(tlmi_priv.authentication_kset);
+}
+
+static int tlmi_validate_setting_name(struct kset *attribute_kset, char *name)
+{
+	struct kobject *duplicate;
+
+	if (!strcmp(name, "Reserved"))
+		return -EINVAL;
+
+	duplicate = kset_find_obj(attribute_kset, name);
+	if (duplicate) {
+		/* kset_find_obj() returns a reference */
+		kobject_put(duplicate);
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static int tlmi_sysfs_init(void)
+{
+	int i, ret;
+
+	tlmi_priv.class_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
+					    NULL, "%s", "thinklmi");
+	if (IS_ERR(tlmi_priv.class_dev)) {
+		ret = PTR_ERR(tlmi_priv.class_dev);
+		goto fail_class_created;
+	}
+
+	tlmi_priv.attribute_kset = kset_create_and_add("attributes", NULL,
+						       &tlmi_priv.class_dev->kobj);
+	if (!tlmi_priv.attribute_kset) {
+		ret = -ENOMEM;
+		goto fail_device_created;
+	}
+
+	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
+							    &tlmi_priv.class_dev->kobj);
+	if (!tlmi_priv.authentication_kset) {
+		kset_unregister(tlmi_priv.attribute_kset);
+		ret = -ENOMEM;
+		goto fail_device_created;
+	}
+
+	for (i = 0; i < TLMI_SETTINGS_COUNT; i++) {
+		/* Check if index is a valid setting - skip if it isn't */
+		if (!tlmi_priv.setting[i])
+			continue;
+
+		/* check for duplicate or reserved values */
+		if (tlmi_validate_setting_name(tlmi_priv.attribute_kset,
+					       tlmi_priv.setting[i]->name) < 0) {
+			tlmi_release_setting(tlmi_priv.setting[i]);
+			tlmi_priv.setting[i] = NULL;
+			continue;
+		}
+
+		/* Build attribute */
+		tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
+		ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &tlmi_attr_setting_ktype,
+					   NULL, "%s", tlmi_priv.setting[i]->name);
+		if (ret)
+			goto fail_create_attr;
+	}
+
+	ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
+	if (ret)
+		goto fail_create_attr;
+
+	ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &save_settings.attr);
+	if (ret)
+		goto fail_create_attr;
+
+	/* Create authentication entries */
+	tlmi_priv.pwd_admin->kobj.kset = tlmi_priv.authentication_kset;
+	ret = kobject_init_and_add(&tlmi_priv.pwd_admin->kobj, &tlmi_pwd_setting_ktype,
+				   NULL, "%s", "Admin");
+	if (ret)
+		goto fail_create_attr;
+
+	tlmi_priv.pwd_power->kobj.kset = tlmi_priv.authentication_kset;
+	ret = kobject_init_and_add(&tlmi_priv.pwd_power->kobj, &tlmi_pwd_setting_ktype,
+				   NULL, "%s", "Power-on");
+	if (ret)
+		goto fail_create_attr;
+
+	tlmi_priv.pwd_system->kobj.kset = tlmi_priv.authentication_kset;
+	ret = kobject_init_and_add(&tlmi_priv.pwd_system->kobj, &tlmi_pwd_setting_ktype,
+				   NULL, "%s", "System");
+	if (ret)
+		goto fail_create_attr;
+
+	tlmi_priv.pwd_hdd->kobj.kset = tlmi_priv.authentication_kset;
+	ret = kobject_init_and_add(&tlmi_priv.pwd_hdd->kobj, &tlmi_pwd_setting_ktype,
+				   NULL, "%s", "HDD");
+	if (ret)
+		goto fail_create_attr;
+
+	tlmi_priv.pwd_nvme->kobj.kset = tlmi_priv.authentication_kset;
+	ret = kobject_init_and_add(&tlmi_priv.pwd_nvme->kobj, &tlmi_pwd_setting_ktype,
+				   NULL, "%s", "NVMe");
+	if (ret)
+		goto fail_create_attr;
+
+	return ret;
+
+fail_create_attr:
+	tlmi_release_attr();
+fail_device_created:
+	device_unregister(tlmi_priv.class_dev);
+fail_class_created:
+	return ret;
+}
+
+static struct tlmi_pwd_setting *tlmi_create_auth(enum pwd_type_v2 type,
+						 const char *pwd_role)
+{
+	struct tlmi_pwd_setting *new_pwd;
+
+	new_pwd = kzalloc_obj(*new_pwd);
+	if (!new_pwd)
+		return NULL;
+
+	new_pwd->type_v2 = type;
+	new_pwd->role = pwd_role;
+	new_pwd->minlen = tlmi_priv.pwdcfg_v2.minlen;
+	new_pwd->maxlen = tlmi_priv.pwdcfg_v2.maxlen;
+	new_pwd->index = 0;
+
+	return new_pwd;
+}
+
+/* Get password settings from BIOS */
+static int tlmi_get_pwd_settings(void)
+{
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	const union acpi_object *obj;
+	acpi_status status;
+
+	if (!tlmi_priv.can_get_password_settings)
+		return -EOPNOTSUPP;
+
+	status = wmi_query_block(LENOVO_BIOS_ACCESS_DATA_GUID, 0, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj = output.pointer;
+	if (!obj)
+		return -ENOMEM;
+
+	if (obj->type != ACPI_TYPE_PACKAGE) {
+		kfree(obj);
+		return -EIO;
+	}
+
+	tlmi_priv.pwdcfg_v2.password_state = obj->package.elements[0].integer.value;
+	tlmi_priv.pwdcfg_v2.minlen = obj->package.elements[1].integer.value;
+	tlmi_priv.pwdcfg_v2.maxlen = obj->package.elements[2].integer.value;
+	tlmi_priv.pwdcfg_v2.strong_password = obj->package.elements[3].integer.value;
+	tlmi_priv.pwdcfg_v2.supported_encodings = obj->package.elements[4].integer.value;
+	tlmi_priv.pwdcfg_v2.supported_keyboard = obj->package.elements[5].integer.value;
+	tlmi_priv.pwdcfg_v2.hdd_user_password = obj->package.elements[6].integer.value;
+	tlmi_priv.pwdcfg_v2.hdd_master_password = obj->package.elements[7].integer.value;
+	tlmi_priv.pwdcfg_v2.nvme_user_password = obj->package.elements[8].integer.value;
+	tlmi_priv.pwdcfg_v2.nvme_master_password = obj->package.elements[9].integer.value;
+	tlmi_priv.pwdcfg_v2.deploy_mode = obj->package.elements[10].integer.value;
+	tlmi_priv.pwdcfg_v2.sys_mgr_pwd_ctrl = obj->package.elements[11].integer.value;
+	tlmi_priv.pwdcfg_v2.power_on_pwd_ctrl = obj->package.elements[12].integer.value;
+	tlmi_priv.pwdcfg_v2.storage_pwd_ctrl = obj->package.elements[13].integer.value;
+	tlmi_priv.pwdcfg_v2.sys_mgr_setup_ctrl = obj->package.elements[14].integer.value;
+
+	if (WARN_ON(tlmi_priv.pwdcfg_v2.maxlen >= TLMI_PWD_BUFSIZE))
+		tlmi_priv.pwdcfg_v2.maxlen = TLMI_PWD_BUFSIZE - 1;
+
+	tlmi_priv.pwd_admin = tlmi_create_auth(SVP, "bios-admin");
+	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SVP_PWD)
+		tlmi_priv.pwd_admin->pwd_enabled = true;
+
+	tlmi_priv.pwd_power = tlmi_create_auth(POP, "power-on");
+	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_POP_PWD)
+		tlmi_priv.pwd_power->pwd_enabled = true;
+
+	tlmi_priv.pwd_system = tlmi_create_auth(SMP, "system");
+	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SMP_PWD)
+		tlmi_priv.pwd_system->pwd_enabled = true;
+
+	tlmi_priv.pwd_hdd = tlmi_create_auth(HDD1, "hdd");
+	tlmi_priv.pwd_hdd->index = 1;
+	if (tlmi_priv.pwdcfg.ext.hdd_user_password ||
+	    tlmi_priv.pwdcfg.ext.hdd_master_password) {
+		tlmi_priv.pwd_hdd->pwd_enabled = true;
+		if (tlmi_priv.pwdcfg.ext.hdd_master_password)
+			tlmi_priv.pwd_hdd->index =
+				ffs(tlmi_priv.pwdcfg.ext.hdd_master_password) - 1;
+		else
+			tlmi_priv.pwd_hdd->index =
+				ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
+	}
+
+	tlmi_priv.pwd_nvme = tlmi_create_auth(NVME1, "nvme");
+	tlmi_priv.pwd_nvme->index = 1;
+	if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
+	    tlmi_priv.pwdcfg.ext.nvme_master_password) {
+		tlmi_priv.pwd_nvme->pwd_enabled = true;
+		if (tlmi_priv.pwdcfg.ext.nvme_master_password)
+			tlmi_priv.pwd_nvme->index =
+				ffs(tlmi_priv.pwdcfg.ext.nvme_master_password) - 1;
+		else
+			tlmi_priv.pwd_nvme->index =
+				ffs(tlmi_priv.pwdcfg.ext.nvme_user_password) - 1;
+	}
+
+	kfree(obj);
+
+	return 0;
+}
+
+static int tlmi_analyze(struct wmi_device *wdev)
+{
+	int i, ret;
+
+	if (wmi_has_guid(LENOVO_BIOS_CONFIGURATION_GUID))
+		tlmi_priv.can_set_bios_settings = true;
+	if (wmi_has_guid(LENOVO_BIOS_ACCESS_DATA_GUID))
+		tlmi_priv.can_get_password_settings = true;
+	if (wmi_has_guid(LENOVO_BIOS_ACCESS_GUID)) {
+		tlmi_priv.can_set_bios_password = true;
+		tlmi_priv.certificate_support = true;
+	}
+
+	/*
+	 * Try to find the number of valid settings of this machine
+	 * and use it to create sysfs attributes.
+	 */
+	for (i = 0; i < TLMI_SETTINGS_COUNT - 1; ++i) {
+		tlmi_priv.setting[i] = NULL;
+		ret = tlmi_setting(wdev, i);
+		if (ret)
+			goto fail_clear_attr;
+	}
+
+	/* Probe and create password setting structure */
+	ret = tlmi_get_pwd_settings();
+	if (ret)
+		goto fail_clear_attr;
+
+	return 0;
+
+fail_clear_attr:
+	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i) {
+		if (tlmi_priv.setting[i])
+			tlmi_release_setting(tlmi_priv.setting[i]);
+	}
+	kfree(tlmi_priv.pwd_admin);
+	kfree(tlmi_priv.pwd_power);
+	kfree(tlmi_priv.pwd_system);
+	kfree(tlmi_priv.pwd_hdd);
+	kfree(tlmi_priv.pwd_nvme);
+
+	return ret;
+}
+
+void tlmi_v2_remove(struct wmi_device *wdev)
+{
+	if (tlmi_initialised) {
+		tlmi_release_attr();
+		device_unregister(tlmi_priv.class_dev);
+		tlmi_initialised = false;
+	}
+}
+EXPORT_SYMBOL(tlmi_v2_remove);
+
+int tlmi_v2_initialise(struct wmi_device *wdev, const void *context)
+{
+	int ret;
+
+	ret = tlmi_analyze(wdev);
+	if (ret)
+		return ret;
+
+	ret = tlmi_sysfs_init();
+	tlmi_initialised = true;
+	return ret;
+}
+EXPORT_SYMBOL(tlmi_v2_initialise);
+
+MODULE_AUTHOR("Mark Pearson <mpearson-lenovo@squebb.ca>");
+MODULE_DESCRIPTION("ThinkLMI V2 Driver");
+MODULE_LICENSE("GPL");
+
diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index da1e54dab2d1..a00d479e9fc2 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -32,7 +32,10 @@ static void tlmi_remove(struct wmi_device *wdev)
 		tlmi_v1_remove(wdev);
 		break;
 	case 2:
-		pr_err("Not yet implemented\n");
+		tlmi_v2_remove(wdev);
+		break;
+	default:
+		pr_err("Unsupported version %d\n", tlmi_version);
 	}
 }
 
@@ -64,8 +67,8 @@ static int tlmi_probe(struct wmi_device *wdev, const void *context)
 		ret = tlmi_v1_initialise(wdev, context);
 		break;
 	case 2:
-		pr_err("Not yet implemented\n");
-		return -EOPNOTSUPP;
+		ret = tlmi_v2_initialise(wdev, context);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/platform/x86/lenovo/think-lmi.h b/drivers/platform/x86/lenovo/think-lmi.h
index fd8a98c2fdaa..1883493cf435 100644
--- a/drivers/platform/x86/lenovo/think-lmi.h
+++ b/drivers/platform/x86/lenovo/think-lmi.h
@@ -81,6 +81,55 @@ struct tlmi_pwdcfg {
 	struct tlmi_pwdcfg_ext ext;
 };
 
+/* For think_lmi_v2 only */
+enum pwd_type_v2 {
+	SVP = 0,
+	SMP,
+	POP,
+	HDD1,
+	HDD2,
+	HDD3,
+	HDD4,
+	NVME1,
+	NVME2,
+	NVME3,
+	NVME4,
+	NVME5,
+	NVME6,
+	NVME7,
+	NVME8,
+	MASTERHDD1,
+	MASTERHDD2,
+	MASTERHDD3,
+	MASTERHDD4,
+	MASTERNVME1,
+	MASTERNVME2,
+	MASTERNVME3,
+	MASTERNVME4,
+	MASTERNVME5,
+	MASTERNVME6,
+	MASTERNVME7,
+	MASTERNVME8,
+};
+
+struct tlmi_pwdcfg_v2 {
+	unsigned int password_state;
+	unsigned int minlen;
+	unsigned int maxlen;
+	bool strong_password;
+	unsigned int supported_encodings;
+	unsigned int supported_keyboard;
+	unsigned int hdd_user_password;
+	unsigned int hdd_master_password;
+	unsigned int nvme_user_password;
+	unsigned int nvme_master_password;
+	bool deploy_mode;
+	bool sys_mgr_pwd_ctrl;
+	bool power_on_pwd_ctrl;
+	bool storage_pwd_ctrl;
+	bool sys_mgr_setup_ctrl;
+};
+
 /* password setting details */
 struct tlmi_pwd_setting {
 	struct kobject kobj;
@@ -97,6 +146,7 @@ struct tlmi_pwd_setting {
 	bool cert_installed;
 	char *signature;
 	char *save_signature;
+	enum pwd_type_v2 type_v2;
 };
 
 /* Attribute setting details */
@@ -107,6 +157,12 @@ struct tlmi_attr_setting {
 	char *name;
 	char *display_name;
 	char *possible_values;
+	char *current_value;
+	/* v2 fields */
+	char *factory_default;
+	char *user_default;
+	unsigned char access_level;
+	bool read_only;
 };
 
 struct think_lmi {
@@ -131,6 +187,7 @@ struct think_lmi {
 	struct kset *authentication_kset;
 
 	struct tlmi_pwdcfg pwdcfg;
+	struct tlmi_pwdcfg_v2 pwdcfg_v2;
 	struct tlmi_pwd_setting *pwd_admin;
 	struct tlmi_pwd_setting *pwd_power;
 	struct tlmi_pwd_setting *pwd_system;
@@ -142,5 +199,7 @@ struct think_lmi {
 
 void tlmi_v1_remove(struct wmi_device *wdev);
 int tlmi_v1_initialise(struct wmi_device *wdev, const void *context);
+void tlmi_v2_remove(struct wmi_device *wdev);
+int tlmi_v2_initialise(struct wmi_device *wdev, const void *context);
 
 #endif /* !_THINK_LMI_H_ */
-- 
2.43.0

