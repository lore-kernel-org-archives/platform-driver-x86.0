Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1BB4A3D2E
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968514; cv=none; b=X9sE0oDghBPMjvSLX7T/y9KwLgFJUXj/zrlgu+KKiKhoOsMxDwQfbbyN3hzdx1lS7+m7P9OpABak4Nvcqk7gQDIqd8VhBYSQC//qPEdRqMTBEnlkB/aS77Xv0nrxEQFKxgaLmxaV4NdkwK1rnkyLHauCLoQ0+JI5KxTgVPDWykI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968514; c=relaxed/simple;
	bh=78nqNKNzZB6xSb2DLh0qwV+u7MNJyF51sNzgLEd6T+U=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CuNDY5WL3J8U8yb79X4bFv5HqcxY1UxaHBgHk56nPL/eDrzwqiNMZeyUeQOBrEW6bv6GM7jcA+NjUX3L8F2QLF1yFALJfoUm/mP8xmrBC8PNcBrUhDfQv20f+lQcRxsyjcFo9cZM9LQ8vV6D7KpE2wKy0B4qxkwPQ9wAYcRJrE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLzW4wKo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLzW4wKo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791968508; x=1823504508;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=78nqNKNzZB6xSb2DLh0qwV+u7MNJyF51sNzgLEd6T+U=;
  b=BLzW4wKo9jQn3RBN9s74A9Ej5aNRZZKDdNvHB3QK312BU2sKVyVWKTWz
   uJProSyUv+vLzkB8DloGO+g3aujxMnswZA4fOS69JdljYCYOcKnbNf3ty
   0CUWGYbpvbYccEfFLjJ6A/j8xXgPeaV/SILSzowiwkfOojxRuuSYjRHuF
   bMjUg7CryxKLqATWzMpel4uBkTqqLF8YXqCwqetlIKHMAK75keJTB1cHf
   bn06J08i+x1hxCVrOzq0Xg6KTsZtm8/3dEcHtK5MoQWwH4jwDV8oMrMM9
   boRYBDqBXJAg5Bwd4Qzd0zi3YC0xBgSxU2dZ8Y8DQo0lCOorPjB9YkA/G
   w==;
X-CSE-ConnectionGUID: wBrLKu0wR9qxttwvn9jQAA==
X-CSE-MsgGUID: /GMj4aUASJeNDggG6DmR3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="814430"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="814430"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 02:01:47 -0700
X-CSE-ConnectionGUID: fI/FJvQzQGiMwm85R/FqeA==
X-CSE-MsgGUID: 0mc7PXReS+i1iBZMSUni4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1748037"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 02:01:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 Oct 2026 12:01:40 +0300 (EEST)
To: Mark Pearson <mpearson-lenovo@squebb.ca>
cc: prasanth.ksr@dell.com, W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>, 
    derekjohn.clark@gmail.com, Dell.Client.Kernel@dell.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH 5/7] platform/x86: think-lmi: Initial ThinkLMI v2
 driver
In-Reply-To: <20260925160047.2063361-6-mpearson-lenovo@squebb.ca>
Message-ID: <2428e3c0-21fc-ea5c-62a4-5c00b0f5e4e8@linux.intel.com>
References: <mpearson-lenovo@squebb.ca> <20260925160047.2063361-1-mpearson-lenovo@squebb.ca> <20260925160047.2063361-6-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Sep 2026, Mark Pearson wrote:

> Lenovo Thinkpad, Thinkstation and ThinkCenter are moving to a new common
> WMI implementation.
> 
> This driver adds initial support for the new implementation, allowing
> attributes to be read and modified.
> 
> Certificate based authentication is not implemented in this
> version.
> 
> think-lmi is updated to use this driver if supported by the HW and
> requested by the user.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  drivers/platform/x86/lenovo/think-lmi-v2.c | 960 +++++++++++++++++++++
>  drivers/platform/x86/lenovo/think-lmi.c    |   9 +-
>  drivers/platform/x86/lenovo/think-lmi.h    |  59 ++
>  3 files changed, 1025 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/platform/x86/lenovo/think-lmi-v2.c
> 
> diff --git a/drivers/platform/x86/lenovo/think-lmi-v2.c b/drivers/platform/x86/lenovo/think-lmi-v2.c
> new file mode 100644
> index 000000000000..5bc0a349c5fb
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/think-lmi-v2.c
> @@ -0,0 +1,960 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Think LMI V2 BIOS configuration driver
> + *
> + * Copyright(C) 2026 Lenovo
> + * Distributed under the GPL-2.0 license
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/string_helpers.h>
> +#include <linux/wmi.h>

I'm very very skeptical this is all you use below. ;-)

> +#include "../firmware_attributes_class.h"
> +#include "think-lmi.h"
> +
> +/*
> + * Name: BiosSetting
> + * Description: Get item name and settings for current LMI instance.
> + * Type: Query
> + */
> +#define LENOVO_BIOS_SETTING_GUID "4B79FBA6-FFD4-41B6-8EA8-E81CDA0F5FC3"
> +
> +/*
> + * Name: Configuration
> + * Description: The Configuration class provides methods to configure the
> + * BIOS settings, change system behavior, and perform certain actions
> + * After making changes to the BIOS settings, you must reboot the computer
> + * before the changes will take effect.
> + * Type: Method
> + */
> +#define LENOVO_BIOS_CONFIGURATION_GUID "816E5C9E-3E99-4385-AA5A-7353E14B781B"
> +
> +/* Method IDS for configuration GUID */
> +#define SET_ID          1
> +#define SAVE_ID         2
> +#define DISCARD_ID      3
> +#define LOAD_FACTORY_ID 4
> +#define LOAD_CUSTOM_ID  5
> +
> +#define LENOVO_BIOS_ACCESS_DATA_GUID "1178acfd-78a1-46d8-a8eb-5f7cb74a3b4e"
> +#define LENOVO_BIOS_ACCESS_GUID "5cb5f556-30ce-40d3-a135-7ca0648a5a52"
> +
> +/* Method IDS for Access GUID */
> +#define SET_PASSWORD    1
> +#define AUTHENTICATE    2
> +#define SET_CERT        3
> +#define UPDATE_CERT     4
> +#define CLEAR_CERT      5
> +#define CERT_TO_PWD     6
> +#define CERT_THUMBPRINT 7
> +
> +static bool tlmi_initialised;
> +#define TLMI_POP_PWD  BIT(0) /* Power-on */
> +#define TLMI_SVP_PWD  BIT(1) /* Supervisor */
> +#define TLMI_SMP_PWD  BIT(2) /* System Management */
> +#define TLMI_SVC_PWD  BIT(7) /* Supervisor Certificate */
> +#define TLMI_SMC_PWD  BIT(8) /* System Certificate */

Yeah, it wasn't. Please go through the code and add includes for what you 
actually use.

> +
> +static struct think_lmi tlmi_priv;
> +
> +static DEFINE_MUTEX(tlmi_lock);
> +
> +/* ---- Utility/access functions -----------------------------*/
> +
> +static inline struct tlmi_pwd_setting *to_tlmi_pwd_setting(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct tlmi_pwd_setting, kobj);
> +}
> +
> +static inline struct tlmi_attr_setting *to_tlmi_attr_setting(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct tlmi_attr_setting, kobj);
> +}
> +
> +static const struct tlmi_err_codes tlmi_errs[] = {
> +	{"Success", 0},
> +	{"Not Supported", -EOPNOTSUPP},
> +	{"Invalid Parameter", -EINVAL},
> +	{"Access Denied", -EACCES},
> +	{"System Busy", -EBUSY},
> +	{"System Locked", -EACCES},

I suggest aligning the errno's for better readability.

> +};
> +
> +static const char * const level_options[] = {
> +	[TLMI_LEVEL_USER] = "user",
> +	[TLMI_LEVEL_MASTER] = "master",
> +};
> +
> +/* Check for return errors and if found convert to suitable error code */

Grammar.

> +static int tlmi_returnstr_to_err(const char *errstr)
> +{
> +	int i;
> +
> +	for (i = 0; i < sizeof(tlmi_errs) / sizeof(struct tlmi_err_codes); i++) {

ARRAY_SIZE()

> +		if (!strcmp(tlmi_errs[i].err_str, errstr))
> +			return tlmi_errs[i].err_code;
> +	}
> +	return 0; /* assume valid data */
> +}
> +
> +/* Extract data or error string from WMI return buffer */
> +static int tlmi_extract_output(const struct acpi_buffer *output, char **data)
> +{
> +	const union acpi_object *obj;
> +	int tlmi_err;
> +	char *ret_str;
> +
> +	obj = output->pointer;
> +	if (!obj)
> +		return -ENOMEM;
> +
> +	if (obj->type != ACPI_TYPE_STRING)
> +		return -EIO;
> +
> +	if (!obj->string.pointer)
> +		return -EIO;
> +
> +	ret_str = kstrdup(obj->string.pointer, GFP_KERNEL);
> +	if (!ret_str)
> +		return -ENOMEM;
> +
> +	/* Check if error string was returned */
> +	tlmi_err = tlmi_returnstr_to_err(ret_str);
> +
> +	/* If not an error string, and caller wants data, pass it back */
> +	if (!tlmi_err && data)
> +		*data = ret_str;
> +	else /* error string no longer needed */
> +		kfree(ret_str);

Lets start with a right foot by using __free(). Use no_free_ptr() for the 
case where you want to keep the allocation.

> +
> +	return tlmi_err;
> +}
> +
> +/* Utility function to execute WMI call to BIOS */
> +static int tlmi_simple_call(const char *guid, int instance, int method,
> +			    char *buf, int len, char **data)
> +{
> +	const struct acpi_buffer input = { len, buf };
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_status status;
> +	int err = 0;
> +
> +	status = wmi_evaluate_method(guid, instance, method, &input, &output);
> +	if (ACPI_FAILURE(status)) {
> +		kfree(output.pointer);
> +		return -EIO;
> +	}
> +	err = tlmi_extract_output(&output, data);
> +	kfree(output.pointer);

__free() should be used to avoid having to duplicate kfree().

> +	return err;
> +}
> +
> +/* ---- sysfs entries --------------------------------------------------------- */
> +static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *attr,
> +				   char *buf)
> +{
> +	return sprintf(buf, "%d\n", tlmi_priv.pending_changes);

You used sysfs_emit() correctly below but this is sprintf() for some 
reason.

> +}
> +
> +static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
> +
> +static ssize_t save_settings_show(struct kobject *kobj, struct kobj_attribute *attr,
> +				  char *buf)
> +{
> +	return sysfs_emit(buf, "%s\n", tlmi_priv.save_required ? "needed" : "not-needed");

Why the dash?

Why is this a string, it looks just boolean data for me?

> +}
> +
> +static ssize_t save_settings_store(struct kobject *kobj, struct kobj_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	int ret = 0;
> +
> +	/* save command triggered by writing 'save' */
> +	if (strncmp(buf, "save", 4))

So anything starting with save goes?

> +		return -EINVAL;
> +
> +	/* Use lock in case multiple WMI operations needed */
> +	guard(mutex)(&tlmi_lock);
> +
> +	/* Check there is actually something to save */
> +	if (!tlmi_priv.save_required)
> +		return -ENOENT;
> +
> +	ret = tlmi_simple_call(LENOVO_BIOS_CONFIGURATION_GUID, 0, SAVE_ID, NULL, 0, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	tlmi_priv.save_required = false;
> +	tlmi_priv.reboot_required = true;
> +
> +	if (!tlmi_priv.pending_changes) {
> +		tlmi_priv.pending_changes = true;
> +		/* let userland know it may need to check reboot pending again */
> +		kobject_uevent(&tlmi_priv.class_dev->kobj, KOBJ_CHANGE);
> +	}
> +	return ret ?: count;
> +}
> +
> +static struct kobj_attribute save_settings = __ATTR_RW(save_settings);
> +
> +/* ---- Authentication sysfs --------------------------------------------------------- */
> +static ssize_t is_enabled_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			       char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +
> +	return sysfs_emit(buf, "%d\n", setting->pwd_enabled);
> +}
> +
> +static struct kobj_attribute auth_is_pass_set = __ATTR_RO(is_enabled);
> +
> +static ssize_t current_password_store(struct kobject *kobj,
> +				      struct kobj_attribute *attr,
> +				      const char *buf, size_t count)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +	size_t pwdlen, arglen;
> +	char *argbuf = NULL;
> +	int ret;
> +
> +	pwdlen = strlen(buf);
> +	/* pwdlen == 0 is allowed to clear the password */
> +	if (pwdlen && (pwdlen < setting->minlen || pwdlen > setting->maxlen))
> +		return -EINVAL;
> +
> +	strscpy(setting->password, buf, setting->maxlen);
> +	/* Strip out CR if one is present - setting password won't work if it is present */
> +	strreplace(setting->password, '\n', '\0');
> +
> +	arglen = wmi_calculate_string_buffer(setting->password);
> +	argbuf = kzalloc(arglen, GFP_KERNEL);
> +	if (!argbuf)
> +		return -ENOMEM;
> +
> +	ret = wmi_populate_string_buffer(argbuf, arglen, setting->password);
> +	if (ret < 0) {
> +		kfree(argbuf);
> +		return -EINVAL;
> +	}
> +
> +	ret = tlmi_simple_call(LENOVO_BIOS_ACCESS_GUID, 0, AUTHENTICATE, argbuf, arglen, NULL);
> +	kfree(argbuf);

Use __free().

> +
> +	/* Ignore error if password is being cleared. Authentication is cleared */
> +	if (!pwdlen)
> +		return count;
> +
> +	return ret ?: count;
> +}
> +
> +static struct kobj_attribute auth_current_password = __ATTR_WO(current_password);
> +
> +static ssize_t new_password_store(struct kobject *kobj,
> +				  struct kobj_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +	size_t pwdlen, cur_pwdlen, arglen;
> +	char *argbuf = NULL, *start;
> +	enum pwd_type_v2 pwd_type;
> +	char *new_pwd;
> +	int ix = 0;
> +	int ret;
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EPERM;
> +
> +	if (!tlmi_priv.can_set_bios_password)
> +		return -EOPNOTSUPP;
> +
> +	/* Strip out CR if one is present, setting password won't work if it is present */
> +	new_pwd = kstrdup_and_replace(buf, '\n', '\0', GFP_KERNEL);
> +	if (!new_pwd)
> +		return -ENOMEM;
> +
> +	/* Use lock in case multiple WMI operations needed */
> +	guard(mutex)(&tlmi_lock);
> +
> +	pwdlen = strlen(new_pwd);
> +	/* pwdlen == 0 is allowed to clear the password */
> +	if (pwdlen && (pwdlen < setting->minlen || pwdlen > setting->maxlen)) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	cur_pwdlen = wmi_calculate_string_buffer(setting->password);
> +	pwdlen = wmi_calculate_string_buffer(new_pwd);
> +	arglen = 2 + cur_pwdlen + pwdlen;
> +	argbuf = kzalloc(arglen, GFP_KERNEL);

Use __free(), remove out label.

> +	if (!argbuf) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	pwd_type = setting->type_v2;
> +	/* For HDD and NVME - check if we're user/master and drive index */
> +	if (setting == tlmi_priv.pwd_hdd) {
> +		if (setting->level == TLMI_LEVEL_MASTER)
> +			pwd_type = MASTERHDD1;
> +		pwd_type += (setting->index - 1);
> +	} else if (setting == tlmi_priv.pwd_nvme) {
> +		if (setting->level == TLMI_LEVEL_MASTER)
> +			pwd_type = MASTERNVME1;
> +		pwd_type += (setting->index - 1);
> +	}
> +	argbuf[0] = pwd_type;
> +	start = argbuf + 2;
> +
> +	ix = wmi_populate_string_buffer(start, cur_pwdlen, setting->password);
> +	if (ix < 0)
> +		goto out;
> +	start += ix;
> +	ix = wmi_populate_string_buffer(start, pwdlen, new_pwd);
> +	if (ix < 0)
> +		goto out;
> +
> +	ret = tlmi_simple_call(LENOVO_BIOS_ACCESS_GUID, 0, SET_PASSWORD, argbuf, arglen, NULL);
> +	if (ret)
> +		goto out;
> +
> +out:
> +	kfree(new_pwd);
> +	kfree(argbuf);
> +	return ret ?: count;
> +}
> +
> +static struct kobj_attribute auth_new_password = __ATTR_WO(new_password);
> +
> +static ssize_t min_password_length_show(struct kobject *kobj, struct kobj_attribute *attr,
> +					char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +
> +	return sysfs_emit(buf, "%d\n", setting->minlen);
> +}
> +
> +static struct kobj_attribute auth_min_pass_length = __ATTR_RO(min_password_length);
> +
> +static ssize_t max_password_length_show(struct kobject *kobj, struct kobj_attribute *attr,
> +					char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +
> +	return sysfs_emit(buf, "%d\n", setting->maxlen);
> +}
> +
> +static struct kobj_attribute auth_max_pass_length = __ATTR_RO(max_password_length);
> +
> +static ssize_t mechanism_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			      char *buf)
> +{
> +	return sysfs_emit(buf, "password\n");
> +}
> +
> +static struct kobj_attribute auth_mechanism = __ATTR_RO(mechanism);
> +
> +static ssize_t role_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +
> +	return sysfs_emit(buf, "%s\n", setting->role);
> +}
> +
> +static struct kobj_attribute auth_role = __ATTR_RO(role);
> +
> +static ssize_t index_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			  char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +
> +	return sysfs_emit(buf, "%d\n", setting->index);
> +}
> +
> +static ssize_t index_store(struct kobject *kobj,
> +			   struct kobj_attribute *attr,
> +			   const char *buf, size_t count)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +	int err, val;
> +
> +	err = kstrtoint(buf, 10, &val);
> +	if (err < 0)
> +		return err;
> +
> +	if (val < 0 || val > TLMI_INDEX_MAX)
> +		return -EINVAL;
> +
> +	setting->index = val;
> +	return count;
> +}
> +
> +static struct kobj_attribute auth_index = __ATTR_RW(index);
> +
> +static ssize_t level_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			  char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +
> +	return sysfs_emit(buf, "%s\n", level_options[setting->level]);
> +}
> +
> +static ssize_t level_store(struct kobject *kobj,
> +			   struct kobj_attribute *attr,
> +			   const char *buf, size_t count)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +	int i;
> +
> +	/* Scan for a matching profile */
> +	i = sysfs_match_string(level_options, buf);
> +	if (i < 0)
> +		return -EINVAL;
> +
> +	setting->level = i;
> +	return count;
> +}
> +
> +static struct kobj_attribute auth_level = __ATTR_RW(level);
> +
> +static umode_t auth_attr_is_visible(struct kobject *kobj,
> +				    struct attribute *attr, int n)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +
> +	/* We only want to display level and index settings on HDD/NVMe */
> +	if (attr == &auth_index.attr || attr == &auth_level.attr) {
> +		if (setting == tlmi_priv.pwd_hdd || setting == tlmi_priv.pwd_nvme)
> +			return attr->mode;
> +		return 0;
> +	}
> +
> +	return attr->mode;
> +}
> +
> +static struct attribute *auth_attrs[] = {
> +	&auth_is_pass_set.attr,
> +	&auth_min_pass_length.attr,
> +	&auth_max_pass_length.attr,
> +	&auth_current_password.attr,
> +	&auth_new_password.attr,
> +	&auth_role.attr,
> +	&auth_mechanism.attr,
> +	&auth_index.attr,
> +	&auth_level.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group auth_attr_group = {
> +	.is_visible = auth_attr_is_visible,
> +	.attrs = auth_attrs,
> +};
> +__ATTRIBUTE_GROUPS(auth_attr);
> +
> +static void tlmi_pwd_setting_release(struct kobject *kobj)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +
> +	kfree(setting);
> +}
> +
> +static const struct kobj_type tlmi_pwd_setting_ktype = {
> +	.release        = &tlmi_pwd_setting_release,
> +	.sysfs_ops	= &kobj_sysfs_ops,
> +	.default_groups = auth_attr_groups,
> +};
> +
> +/* ---- Attribute sysfs --------------------------------------------------------- */
> +
> +static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *attr,
> +				 char *buf)
> +{
> +	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> +
> +	return sysfs_emit(buf, "%s\n", setting->display_name);
> +}
> +
> +static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> +
> +	return sysfs_emit(buf, "%s\n", setting->current_value);
> +}
> +
> +static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> +
> +	return sysfs_emit(buf, "%s\n", setting->possible_values);
> +}
> +
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> +
> +	if (setting->possible_values) {
> +		/* Figure out what setting type is as BIOS does not return this */
> +		if (strchr(setting->possible_values, ';'))
> +			return sysfs_emit(buf, "enumeration\n");
> +	}
> +	/* Anything else is going to be a string */
> +	return sysfs_emit(buf, "string\n");
> +}
> +
> +static ssize_t current_value_store(struct kobject *kobj,
> +				   struct kobj_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> +	size_t arglen, namelen, valuelen;
> +	char *argbuf = NULL, *start;
> +	char *new_setting = NULL;
> +	int ret = -EINVAL;
> +	int ix = 0;
> +
> +	if (!tlmi_priv.can_set_bios_settings)
> +		return -EOPNOTSUPP;
> +
> +	/* If a save has been done then a reboot is needed */
> +	if (tlmi_priv.reboot_required)
> +		return -EPERM;
> +
> +	/* Strip out CR if one is present */
> +	new_setting = kstrdup_and_replace(buf, '\n', '\0', GFP_KERNEL);
> +	if (!new_setting)
> +		return -ENOMEM;
> +
> +	/* Use lock in case multiple WMI operations needed */
> +	guard(mutex)(&tlmi_lock);
> +
> +	/* Calculate and alloc buffer for command string */
> +	namelen = wmi_calculate_string_buffer(setting->name);
> +	valuelen = wmi_calculate_string_buffer(new_setting);
> +	arglen = namelen + valuelen;
> +	argbuf = kzalloc(arglen, GFP_KERNEL);
> +	if (!argbuf) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	/* build argument buffer from inputs */
> +	start = argbuf;
> +	ix = wmi_populate_string_buffer(start, namelen, setting->name);
> +	if (ix < 0)
> +		goto out;
> +	start += ix;
> +	ix = wmi_populate_string_buffer(start, valuelen, new_setting);
> +	if (ix < 0)
> +		goto out;
> +	start += ix;
> +
> +	ret = tlmi_simple_call(LENOVO_BIOS_CONFIGURATION_GUID, 0, SET_ID, argbuf, arglen, NULL);
> +	if (ret)
> +		goto out;
> +
> +	tlmi_priv.save_required = true;
> +
> +out:
> +	kfree(argbuf);
> +	kfree(new_setting);

__free() here too.

> +	return ret ?: count;
> +}
> +
> +static struct kobj_attribute attr_display_name = __ATTR_RO(display_name);
> +
> +static struct kobj_attribute attr_possible_values = __ATTR_RO(possible_values);
> +
> +static struct kobj_attribute attr_current_val = __ATTR_RW_MODE(current_value, 0600);
> +
> +static struct kobj_attribute attr_type = __ATTR_RO(type);
> +
> +static struct attribute *tlmi_attrs[] = {
> +	&attr_display_name.attr,
> +	&attr_current_val.attr,
> +	&attr_possible_values.attr,
> +	&attr_type.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group tlmi_attr_group = {
> +	.attrs = tlmi_attrs,
> +};
> +__ATTRIBUTE_GROUPS(tlmi_attr);
> +
> +static void tlmi_release_setting(struct tlmi_attr_setting *setting)
> +{
> +	if (setting) {
> +		kfree(setting->name);
> +		kfree(setting->display_name);
> +		kfree(setting->possible_values);
> +		kfree(setting->current_value);
> +		kfree(setting->factory_default);
> +		kfree(setting);
> +	}
> +}
> +
> +static void tlmi_attr_setting_release(struct kobject *kobj)
> +{
> +	tlmi_release_setting(to_tlmi_attr_setting(kobj));
> +}
> +
> +static const struct kobj_type tlmi_attr_setting_ktype = {
> +	.release        = &tlmi_attr_setting_release,
> +	.sysfs_ops	= &kobj_sysfs_ops,
> +	.default_groups = tlmi_attr_groups,
> +};
> +
> +/* ---- Initialisation --------------------------------------------------------- */
> +
> +static int tlmi_setting(struct wmi_device *wdev, int item)
> +{
> +	struct tlmi_attr_setting *setting;
> +	union acpi_object *obj;
> +
> +	obj = wmidev_block_query(wdev, item);
> +	if (!obj)
> +		return -EIO;
> +
> +	if (obj->type != ACPI_TYPE_PACKAGE) {
> +		kfree(obj);
> +		return -EINVAL;
> +	}
> +
> +	/* Confirm we have a valid item */
> +	if (!obj->package.elements[0].string.pointer[0]) {
> +		kfree(obj);
> +		return 0;
> +	}
> +
> +	setting = kzalloc_obj(*setting);
> +	if (!setting) {
> +		kfree(obj);
> +		return -ENOMEM;
> +	}
> +
> +	setting->wdev = wdev;
> +	setting->index = item;
> +	setting->name = kstrdup(obj->package.elements[0].string.pointer, GFP_KERNEL);
> +	setting->current_value = kstrdup(obj->package.elements[1].string.pointer, GFP_KERNEL);
> +	setting->possible_values = kstrdup(obj->package.elements[2].string.pointer, GFP_KERNEL);
> +	setting->factory_default = kstrdup(obj->package.elements[3].string.pointer, GFP_KERNEL);
> +	setting->display_name = kstrdup(obj->package.elements[5].string.pointer, GFP_KERNEL);

And what if these fail???

> +	setting->access_level = obj->package.elements[6].integer.value;
> +	setting->read_only = obj->package.elements[7].integer.value ? true : false;
> +	tlmi_priv.setting[item] = setting;
> +
> +	kfree(obj);

__free()

> +	return 0;
> +}
> +
> +static void tlmi_release_attr(void)
> +{
> +	struct kobject *pos, *n;
> +
> +	/* Attribute structures */
> +	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
> +	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &save_settings.attr);
> +
> +	list_for_each_entry_safe(pos, n, &tlmi_priv.attribute_kset->list, entry)
> +		kobject_put(pos);
> +
> +	kset_unregister(tlmi_priv.attribute_kset);
> +
> +	/* Authentication structures */
> +	list_for_each_entry_safe(pos, n, &tlmi_priv.authentication_kset->list, entry)
> +		kobject_put(pos);
> +
> +	kset_unregister(tlmi_priv.authentication_kset);
> +}
> +
> +static int tlmi_validate_setting_name(struct kset *attribute_kset, char *name)
> +{
> +	struct kobject *duplicate;
> +
> +	if (!strcmp(name, "Reserved"))
> +		return -EINVAL;
> +
> +	duplicate = kset_find_obj(attribute_kset, name);
> +	if (duplicate) {
> +		/* kset_find_obj() returns a reference */
> +		kobject_put(duplicate);
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tlmi_sysfs_init(void)
> +{
> +	int i, ret;
> +
> +	tlmi_priv.class_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
> +					    NULL, "%s", "thinklmi");
> +	if (IS_ERR(tlmi_priv.class_dev)) {
> +		ret = PTR_ERR(tlmi_priv.class_dev);
> +		goto fail_class_created;
> +	}
> +
> +	tlmi_priv.attribute_kset = kset_create_and_add("attributes", NULL,
> +						       &tlmi_priv.class_dev->kobj);
> +	if (!tlmi_priv.attribute_kset) {
> +		ret = -ENOMEM;
> +		goto fail_device_created;
> +	}
> +
> +	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
> +							    &tlmi_priv.class_dev->kobj);
> +	if (!tlmi_priv.authentication_kset) {
> +		kset_unregister(tlmi_priv.attribute_kset);
> +		ret = -ENOMEM;
> +		goto fail_device_created;
> +	}
> +
> +	for (i = 0; i < TLMI_SETTINGS_COUNT; i++) {
> +		/* Check if index is a valid setting - skip if it isn't */
> +		if (!tlmi_priv.setting[i])
> +			continue;
> +
> +		/* check for duplicate or reserved values */
> +		if (tlmi_validate_setting_name(tlmi_priv.attribute_kset,
> +					       tlmi_priv.setting[i]->name) < 0) {
> +			tlmi_release_setting(tlmi_priv.setting[i]);
> +			tlmi_priv.setting[i] = NULL;
> +			continue;
> +		}
> +
> +		/* Build attribute */
> +		tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
> +		ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &tlmi_attr_setting_ktype,
> +					   NULL, "%s", tlmi_priv.setting[i]->name);
> +		if (ret)
> +			goto fail_create_attr;
> +	}
> +
> +	ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
> +	if (ret)
> +		goto fail_create_attr;
> +
> +	ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &save_settings.attr);
> +	if (ret)
> +		goto fail_create_attr;
> +
> +	/* Create authentication entries */
> +	tlmi_priv.pwd_admin->kobj.kset = tlmi_priv.authentication_kset;
> +	ret = kobject_init_and_add(&tlmi_priv.pwd_admin->kobj, &tlmi_pwd_setting_ktype,
> +				   NULL, "%s", "Admin");
> +	if (ret)
> +		goto fail_create_attr;
> +
> +	tlmi_priv.pwd_power->kobj.kset = tlmi_priv.authentication_kset;
> +	ret = kobject_init_and_add(&tlmi_priv.pwd_power->kobj, &tlmi_pwd_setting_ktype,
> +				   NULL, "%s", "Power-on");
> +	if (ret)
> +		goto fail_create_attr;
> +
> +	tlmi_priv.pwd_system->kobj.kset = tlmi_priv.authentication_kset;
> +	ret = kobject_init_and_add(&tlmi_priv.pwd_system->kobj, &tlmi_pwd_setting_ktype,
> +				   NULL, "%s", "System");
> +	if (ret)
> +		goto fail_create_attr;
> +
> +	tlmi_priv.pwd_hdd->kobj.kset = tlmi_priv.authentication_kset;
> +	ret = kobject_init_and_add(&tlmi_priv.pwd_hdd->kobj, &tlmi_pwd_setting_ktype,
> +				   NULL, "%s", "HDD");
> +	if (ret)
> +		goto fail_create_attr;
> +
> +	tlmi_priv.pwd_nvme->kobj.kset = tlmi_priv.authentication_kset;
> +	ret = kobject_init_and_add(&tlmi_priv.pwd_nvme->kobj, &tlmi_pwd_setting_ktype,
> +				   NULL, "%s", "NVMe");
> +	if (ret)
> +		goto fail_create_attr;
> +
> +	return ret;
> +
> +fail_create_attr:
> +	tlmi_release_attr();

Dan will have something unpretty to say about this style of error handling 
/ rollback.

> +fail_device_created:
> +	device_unregister(tlmi_priv.class_dev);
> +fail_class_created:

Why you have this label?

> +	return ret;
> +}
> +
> +static struct tlmi_pwd_setting *tlmi_create_auth(enum pwd_type_v2 type,
> +						 const char *pwd_role)
> +{
> +	struct tlmi_pwd_setting *new_pwd;
> +
> +	new_pwd = kzalloc_obj(*new_pwd);
> +	if (!new_pwd)
> +		return NULL;
> +
> +	new_pwd->type_v2 = type;
> +	new_pwd->role = pwd_role;
> +	new_pwd->minlen = tlmi_priv.pwdcfg_v2.minlen;
> +	new_pwd->maxlen = tlmi_priv.pwdcfg_v2.maxlen;
> +	new_pwd->index = 0;
> +
> +	return new_pwd;
> +}
> +
> +/* Get password settings from BIOS */
> +static int tlmi_get_pwd_settings(void)
> +{
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	const union acpi_object *obj;
> +	acpi_status status;
> +
> +	if (!tlmi_priv.can_get_password_settings)
> +		return -EOPNOTSUPP;
> +
> +	status = wmi_query_block(LENOVO_BIOS_ACCESS_DATA_GUID, 0, &output);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	obj = output.pointer;
> +	if (!obj)
> +		return -ENOMEM;
> +
> +	if (obj->type != ACPI_TYPE_PACKAGE) {
> +		kfree(obj);
> +		return -EIO;
> +	}
> +
> +	tlmi_priv.pwdcfg_v2.password_state = obj->package.elements[0].integer.value;
> +	tlmi_priv.pwdcfg_v2.minlen = obj->package.elements[1].integer.value;
> +	tlmi_priv.pwdcfg_v2.maxlen = obj->package.elements[2].integer.value;
> +	tlmi_priv.pwdcfg_v2.strong_password = obj->package.elements[3].integer.value;
> +	tlmi_priv.pwdcfg_v2.supported_encodings = obj->package.elements[4].integer.value;
> +	tlmi_priv.pwdcfg_v2.supported_keyboard = obj->package.elements[5].integer.value;
> +	tlmi_priv.pwdcfg_v2.hdd_user_password = obj->package.elements[6].integer.value;
> +	tlmi_priv.pwdcfg_v2.hdd_master_password = obj->package.elements[7].integer.value;
> +	tlmi_priv.pwdcfg_v2.nvme_user_password = obj->package.elements[8].integer.value;
> +	tlmi_priv.pwdcfg_v2.nvme_master_password = obj->package.elements[9].integer.value;
> +	tlmi_priv.pwdcfg_v2.deploy_mode = obj->package.elements[10].integer.value;
> +	tlmi_priv.pwdcfg_v2.sys_mgr_pwd_ctrl = obj->package.elements[11].integer.value;
> +	tlmi_priv.pwdcfg_v2.power_on_pwd_ctrl = obj->package.elements[12].integer.value;
> +	tlmi_priv.pwdcfg_v2.storage_pwd_ctrl = obj->package.elements[13].integer.value;
> +	tlmi_priv.pwdcfg_v2.sys_mgr_setup_ctrl = obj->package.elements[14].integer.value;
> +
> +	if (WARN_ON(tlmi_priv.pwdcfg_v2.maxlen >= TLMI_PWD_BUFSIZE))
> +		tlmi_priv.pwdcfg_v2.maxlen = TLMI_PWD_BUFSIZE - 1;
> +
> +	tlmi_priv.pwd_admin = tlmi_create_auth(SVP, "bios-admin");
> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SVP_PWD)
> +		tlmi_priv.pwd_admin->pwd_enabled = true;
> +
> +	tlmi_priv.pwd_power = tlmi_create_auth(POP, "power-on");
> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_POP_PWD)
> +		tlmi_priv.pwd_power->pwd_enabled = true;
> +
> +	tlmi_priv.pwd_system = tlmi_create_auth(SMP, "system");
> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SMP_PWD)
> +		tlmi_priv.pwd_system->pwd_enabled = true;
> +
> +	tlmi_priv.pwd_hdd = tlmi_create_auth(HDD1, "hdd");
> +	tlmi_priv.pwd_hdd->index = 1;
> +	if (tlmi_priv.pwdcfg.ext.hdd_user_password ||
> +	    tlmi_priv.pwdcfg.ext.hdd_master_password) {
> +		tlmi_priv.pwd_hdd->pwd_enabled = true;
> +		if (tlmi_priv.pwdcfg.ext.hdd_master_password)
> +			tlmi_priv.pwd_hdd->index =
> +				ffs(tlmi_priv.pwdcfg.ext.hdd_master_password) - 1;
> +		else
> +			tlmi_priv.pwd_hdd->index =
> +				ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
> +	}
> +
> +	tlmi_priv.pwd_nvme = tlmi_create_auth(NVME1, "nvme");
> +	tlmi_priv.pwd_nvme->index = 1;
> +	if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
> +	    tlmi_priv.pwdcfg.ext.nvme_master_password) {
> +		tlmi_priv.pwd_nvme->pwd_enabled = true;
> +		if (tlmi_priv.pwdcfg.ext.nvme_master_password)
> +			tlmi_priv.pwd_nvme->index =
> +				ffs(tlmi_priv.pwdcfg.ext.nvme_master_password) - 1;
> +		else
> +			tlmi_priv.pwd_nvme->index =
> +				ffs(tlmi_priv.pwdcfg.ext.nvme_user_password) - 1;
> +	}
> +
> +	kfree(obj);

__free()

> +	return 0;
> +}
> +
> +static int tlmi_analyze(struct wmi_device *wdev)
> +{
> +	int i, ret;
> +
> +	if (wmi_has_guid(LENOVO_BIOS_CONFIGURATION_GUID))
> +		tlmi_priv.can_set_bios_settings = true;
> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_DATA_GUID))
> +		tlmi_priv.can_get_password_settings = true;
> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_GUID)) {
> +		tlmi_priv.can_set_bios_password = true;
> +		tlmi_priv.certificate_support = true;
> +	}
> +
> +	/*
> +	 * Try to find the number of valid settings of this machine
> +	 * and use it to create sysfs attributes.
> +	 */
> +	for (i = 0; i < TLMI_SETTINGS_COUNT - 1; ++i) {
> +		tlmi_priv.setting[i] = NULL;
> +		ret = tlmi_setting(wdev, i);
> +		if (ret)
> +			goto fail_clear_attr;
> +	}
> +
> +	/* Probe and create password setting structure */
> +	ret = tlmi_get_pwd_settings();
> +	if (ret)
> +		goto fail_clear_attr;
> +
> +	return 0;
> +
> +fail_clear_attr:
> +	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i) {
> +		if (tlmi_priv.setting[i])
> +			tlmi_release_setting(tlmi_priv.setting[i]);
> +	}
> +	kfree(tlmi_priv.pwd_admin);
> +	kfree(tlmi_priv.pwd_power);
> +	kfree(tlmi_priv.pwd_system);
> +	kfree(tlmi_priv.pwd_hdd);
> +	kfree(tlmi_priv.pwd_nvme);
> +
> +	return ret;
> +}
> +
> +void tlmi_v2_remove(struct wmi_device *wdev)
> +{
> +	if (tlmi_initialised) {
> +		tlmi_release_attr();
> +		device_unregister(tlmi_priv.class_dev);
> +		tlmi_initialised = false;
> +	}
> +}
> +EXPORT_SYMBOL(tlmi_v2_remove);
> +
> +int tlmi_v2_initialise(struct wmi_device *wdev, const void *context)
> +{
> +	int ret;
> +
> +	ret = tlmi_analyze(wdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = tlmi_sysfs_init();
> +	tlmi_initialised = true;
> +	return ret;
> +}
> +EXPORT_SYMBOL(tlmi_v2_initialise);

Please use a namespace.

> +
> +MODULE_AUTHOR("Mark Pearson <mpearson-lenovo@squebb.ca>");
> +MODULE_DESCRIPTION("ThinkLMI V2 Driver");
> +MODULE_LICENSE("GPL");
> +
> diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
> index da1e54dab2d1..a00d479e9fc2 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.c
> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> @@ -32,7 +32,10 @@ static void tlmi_remove(struct wmi_device *wdev)
>  		tlmi_v1_remove(wdev);
>  		break;
>  	case 2:
> -		pr_err("Not yet implemented\n");
> +		tlmi_v2_remove(wdev);
> +		break;
> +	default:
> +		pr_err("Unsupported version %d\n", tlmi_version);
>  	}
>  }
>  
> @@ -64,8 +67,8 @@ static int tlmi_probe(struct wmi_device *wdev, const void *context)
>  		ret = tlmi_v1_initialise(wdev, context);
>  		break;
>  	case 2:
> -		pr_err("Not yet implemented\n");
> -		return -EOPNOTSUPP;
> +		ret = tlmi_v2_initialise(wdev, context);
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/platform/x86/lenovo/think-lmi.h b/drivers/platform/x86/lenovo/think-lmi.h
> index fd8a98c2fdaa..1883493cf435 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.h
> +++ b/drivers/platform/x86/lenovo/think-lmi.h
> @@ -81,6 +81,55 @@ struct tlmi_pwdcfg {
>  	struct tlmi_pwdcfg_ext ext;
>  };
>  
> +/* For think_lmi_v2 only */
> +enum pwd_type_v2 {
> +	SVP = 0,
> +	SMP,
> +	POP,
> +	HDD1,
> +	HDD2,
> +	HDD3,
> +	HDD4,
> +	NVME1,
> +	NVME2,
> +	NVME3,
> +	NVME4,
> +	NVME5,
> +	NVME6,
> +	NVME7,
> +	NVME8,
> +	MASTERHDD1,
> +	MASTERHDD2,
> +	MASTERHDD3,
> +	MASTERHDD4,
> +	MASTERNVME1,
> +	MASTERNVME2,
> +	MASTERNVME3,
> +	MASTERNVME4,
> +	MASTERNVME5,
> +	MASTERNVME6,
> +	MASTERNVME7,
> +	MASTERNVME8,
> +};
> +
> +struct tlmi_pwdcfg_v2 {
> +	unsigned int password_state;
> +	unsigned int minlen;
> +	unsigned int maxlen;
> +	bool strong_password;
> +	unsigned int supported_encodings;
> +	unsigned int supported_keyboard;
> +	unsigned int hdd_user_password;
> +	unsigned int hdd_master_password;
> +	unsigned int nvme_user_password;
> +	unsigned int nvme_master_password;
> +	bool deploy_mode;
> +	bool sys_mgr_pwd_ctrl;
> +	bool power_on_pwd_ctrl;
> +	bool storage_pwd_ctrl;
> +	bool sys_mgr_setup_ctrl;
> +};
> +
>  /* password setting details */
>  struct tlmi_pwd_setting {
>  	struct kobject kobj;
> @@ -97,6 +146,7 @@ struct tlmi_pwd_setting {
>  	bool cert_installed;
>  	char *signature;
>  	char *save_signature;
> +	enum pwd_type_v2 type_v2;
>  };
>  
>  /* Attribute setting details */
> @@ -107,6 +157,12 @@ struct tlmi_attr_setting {
>  	char *name;
>  	char *display_name;
>  	char *possible_values;
> +	char *current_value;
> +	/* v2 fields */
> +	char *factory_default;
> +	char *user_default;
> +	unsigned char access_level;
> +	bool read_only;
>  };
>  
>  struct think_lmi {
> @@ -131,6 +187,7 @@ struct think_lmi {
>  	struct kset *authentication_kset;
>  
>  	struct tlmi_pwdcfg pwdcfg;
> +	struct tlmi_pwdcfg_v2 pwdcfg_v2;
>  	struct tlmi_pwd_setting *pwd_admin;
>  	struct tlmi_pwd_setting *pwd_power;
>  	struct tlmi_pwd_setting *pwd_system;
> @@ -142,5 +199,7 @@ struct think_lmi {
>  
>  void tlmi_v1_remove(struct wmi_device *wdev);
>  int tlmi_v1_initialise(struct wmi_device *wdev, const void *context);
> +void tlmi_v2_remove(struct wmi_device *wdev);
> +int tlmi_v2_initialise(struct wmi_device *wdev, const void *context);
>  
>  #endif /* !_THINK_LMI_H_ */
> 

-- 
 i.

