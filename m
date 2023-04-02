Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE464C76196
	for <platform-driver-x86@archiver.kernel.org>; Sun,  2 Apr 2023 17:01:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjDBRB2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 2 Apr 2023 13:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjDBRB1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 2 Apr 2023 13:01:27 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EDC8690
        for <platform-driver-x86@vger.kernel.org>; Sun,  2 Apr 2023 10:01:23 -0700 (PDT)
Date:   Sun, 2 Apr 2023 17:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1680454881; bh=xWEfbmtnCOXUd8EpIhS1xeJTR+lNlrzoMg9XwFej/vw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ARl+vZyamskpGTOYRw3YP0O4qFCoC1Imeih/3MRhSO5RnK5+wICkAMmIpSe9irtiW
         1vnZX5tqz14xU4oa/A5rAkIpjlxFU11++2/wDRajr7WFnD+78U7GDJz5Q13I8WLmDb
         i/8Ml1yfUtNnNvgxrQ40eouwHOo+usjHzd7ftZKY=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v6 3/4] Introduction of HP-BIOSCFG driver [3]
Message-ID: <ef741af7-caf4-4f30-a02d-a939fa9cc48f@t-8ch.de>
References: <20230309201022.9502-1-jorge.lopez2@hp.com>
 <20230309201022.9502-4-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230309201022.9502-4-jorge.lopez2@hp.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge,

some more style changes. Same comments as for PATCH 1 apply.


Another larger remark, for what may be a refactoring in the future:

Currently the driver stores all its state in driver-global static data.
The kobjects are stored without any state.
Inside the kobject attribute operations is some fiddly logic that tries
to figure out the corresponding state with a fiddly mechansims.

The more correct way would be to attach the corresponding state
directly to the kobject.

Let me know if you want to give this a shot and I'll give an example.

On 2023-03-09 14:10:21-0600, Jorge Lopez wrote:
> The purpose for this patch is submit HP BIOSCFG driver to be list of
> HP Linux kernel drivers.  The driver include a total of 12 files
> broken in several patches.
> 
> HP BIOS Configuration driver purpose is to provide a driver supporting
> the latest sysfs class firmware attributes framework allowing the user
> to change BIOS settings and security solutions on HP Inc.’s commercial
> notebooks.
> 
> Many features of HP Commercial PC’s can be managed using Windows
> Management Instrumentation (WMI). WMI is an implementation of Web-Based
> Enterprise Management (WBEM) that provides a standards-based interface
> for changing and monitoring system settings.  HP BISOCFG driver provides
> a native Linux solution and the exposed features facilitates the
> migration to Linux environments.
> 
> The Linux security features to be provided in hp-bioscfg driver enables
> managing the BIOS settings and security solutions via sysfs, a virtual
> filesystem that can be used by user-mode applications.   The new
> documentation cover features such Secure Platform Management, Sure
> Admin, and Sure Start.  Each section provides security feature
> description and identifies sysfs directories and files exposed by
> the driver.
> 
> Many HP Commercial PC’s include a feature called Secure Platform
> Management (SPM), which replaces older password-based BIOS settings
> management with public key cryptography. PC secure product management
> begins when a target system is provisioned with cryptographic keys
> that are used to ensure the integrity of communications between system
> management utilities and the BIOS.
> 
> HP Commercial PC’s have several BIOS settings that control its behaviour
> and capabilities, many of which are related to security. To prevent
> unauthorized changes to these settings, the system can be configured
> to use a Sure Admin cryptographic signature-based authorization string
> that the BIOS will use to verify authorization to modify the setting.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> 
> History
> 
> Version 6
> 	Breaks down the changes into 4 patches
> 	SureAdmin-attributes was removed
> 
> Version 5
> 	Remove version 4 patch 1
> 	Address review changes proposed in Version 4
> 	Reorganize all patches number and file order
> ---
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 1017 +++++++++++++++++
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  |  654 +++++++++++
>  .../x86/hp/hp-bioscfg/enum-attributes.c       |  553 +++++++++
>  3 files changed, 2224 insertions(+)
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> new file mode 100644
> index 000000000000..ca0710cbda7d
> --- /dev/null
> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> @@ -0,0 +1,1017 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Common methods for use with hp-bioscfg driver
> + *
> + *  Copyright (c) 2022 HP Development Company, L.P.
> + */
> +
> +#include <asm-generic/errno-base.h>

Put this with the other includes.
Also <linux/errno.h> would be better.

> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/fs.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/wmi.h>
> +#include "bioscfg.h"
> +#include "../../firmware_attributes_class.h"
> +#include <linux/nls.h>
> +
> +MODULE_AUTHOR("Jorge Lopez <jorge.lopez2@hp.com>");
> +MODULE_DESCRIPTION("HP BIOS Configuration Driver");
> +MODULE_LICENSE("GPL");
> +
> +struct bioscfg_priv bioscfg_drv = {
> +	.mutex = __MUTEX_INITIALIZER(bioscfg_drv.mutex),
> +};
> +
> +static struct class *fw_attr_class;
> +
> +int get_integer_from_buffer(int **buffer, int *buffer_size, int *integer)
> +{

"buffer" seems to be used like a (u8 **).
Can "buffer_size" ever be negative? Maybe should be an unsigned type.
"integer" could be an s32/u32 to be more explicit.

> +	int *ptr = PTR_ALIGN(*buffer, 4);
> +
> +	/* Ensure there is enough space remaining to read the integer */
> +	if (*buffer_size < sizeof(int))
> +		return -EINVAL;
> +
> +	*integer = *(ptr++);

This depends on endianess. Maybe put in a le32_to_cpu().
Or use get_unaligned_le32(). Then you can also drop the PTR_ALIGN above.

> +	*buffer = ptr;
> +	*buffer_size -= sizeof(int);
> +
> +	return 0;
> +}
> +
> +
> +int get_string_from_buffer(u8 **buffer, int *buffer_size, char *dst, int dst_size)
> +{
> +	u16 *src = (u16 *)*buffer;
> +	u16 src_size;
> +
> +	u16 size;
> +	int i;
> +	int escape = 0;
> +	int conv_dst_size;
> +
> +	if (*buffer_size < sizeof(u16))
> +		return -EINVAL;
> +
> +	src_size = *(src++);
> +	/* size value in u16 chars */
> +	size = src_size / sizeof(u16);
> +
> +	/* Ensure there is enough space remaining to read and convert
> +	 * the string
> +	 */
> +	if (*buffer_size < src_size)
> +		return -EINVAL;
> +
> +	for (i = 0; i < size; i++)
> +		if (src[i] == '\\' ||
> +		    src[i] == '\r' ||
> +		    src[i] == '\n' ||
> +		    src[i] == '\t')
> +			escape++;
> +
> +	size += escape;
> +
> +	/*
> +	 * Conversion is limited to destination string max number of
> +	 * bytes.
> +	 */
> +	conv_dst_size = size;
> +	if (size > dst_size)
> +		conv_dst_size = dst_size - 1;
> +
> +	/*
> +	 * convert from UTF-16 unicode to ASCII
> +	 */
> +	utf16s_to_utf8s(src, src_size, UTF16_HOST_ENDIAN, dst, conv_dst_size);
> +	dst[conv_dst_size] = 0;
> +
> +	for (i = 0; i < size && i < conv_dst_size; i++) {
> +		if (*src == '\\' ||
> +		    *src == '\r' ||
> +		    *src == '\n' ||
> +		    *src == '\t')
> +			dst[i++] = '\\';
> +
> +		if (*src == '\r')
> +			dst[i] = 'r';
> +		else if (*src == '\n')
> +			dst[i] = 'n';
> +		else if (*src == '\t')
> +			dst[i] = 't';
> +		else if (*src == '"')
> +			dst[i] = '\'';
> +		else
> +			dst[i] = *src;
> +		src++;
> +	}
> +
> +	*buffer = (u8 *)src;
> +	*buffer_size -= size * sizeof(u16);
> +
> +	return size;
> +}
> +
> +
> +/*
> + * calculate_string_buffer() - determines size of string buffer for use with BIOS communication
> + * @str: the string to calculate based upon
> + */
> +size_t bioscfg_calculate_string_buffer(const char *str)
> +{
> +	int length = strlen(str);
> +	int size;
> +
> +	/* BIOS expects 4 bytes when an empty string is found */
> +	if (!length)
> +		length = 1;
> +
> +
> +	/* u16 length field + one UTF16 char for each input char */
> +	size = sizeof(u16) + length * sizeof(u16);
> +
> +	return size;
> +}
> +
> +static int bioscfg_wmi_error_and_message(int error_code, char *msg)
> +{
> +	char *error_msg = NULL;
> +	int ret = -EIO;
> +
> +	switch (error_code) {
> +	case SUCCESS:
> +		error_msg = "Success";
> +		ret = 0;
> +		break;
> +	case CMD_FAILED:
> +		error_msg = "Command failed";
> +		ret = -EINVAL;
> +		break;
> +	case INVALID_SIGN:
> +		error_msg = "Invalid signature";
> +		ret = -EINVAL;
> +		break;
> +	case INVALID_CMD_VALUE:
> +		error_msg = "Invalid command value/Feature not supported";
> +		ret = -EOPNOTSUPP;
> +		break;
> +	case INVALID_CMD_TYPE:
> +		error_msg = "Invalid command type";
> +		ret = -EINVAL;
> +		break;
> +	case INVALID_DATA_SIZE:
> +		error_msg = "Invalid data size";
> +		ret = -EINVAL;
> +		break;
> +	case INVALID_CMD_PARAM:
> +		error_msg = "Invalid command parameter";
> +		ret = -EINVAL;
> +		break;
> +	case ENCRYP_CMD_REQUIRED:
> +		error_msg = "Secure/encrypted command required";
> +		ret = -EACCES;
> +		break;
> +	case NO_SECURE_SESSION:
> +		error_msg = "No secure session established";
> +		ret = -EACCES;
> +		break;
> +	case SECURE_SESSION_FOUND:
> +		error_msg = "Secure session already established";
> +		ret = -EACCES;
> +		break;
> +	case SECURE_SESSION_FAILED:
> +		error_msg = "Secure session failed";
> +		ret = -EIO;
> +		break;
> +	case AUTH_FAILED:
> +		error_msg = "Other permission/Authentication failed";
> +		ret = -EACCES;
> +		break;
> +	case INVALID_BIOS_AUTH:
> +		error_msg = "Invalid BIOS administrator password";
> +		ret = -EINVAL;
> +		break;
> +	case NONCE_DID_NOT_MATCH:
> +		error_msg = "Nonce did not match";
> +		ret = -EINVAL;
> +		break;
> +	case GENERIC_ERROR:
> +		error_msg = "Generic/Other error";
> +		ret = -EIO;
> +		break;
> +	case BIOS_ADMIN_POLICY_NOT_MET:
> +		error_msg = "BIOS Admin password does not meet password policy requirements";
> +		ret = -EINVAL;
> +		break;
> +	case BIOS_ADMIN_NOT_SET:
> +		error_msg = "BIOS Setup password is not set.";
> +		ret = -EPERM;
> +		break;
> +	case P21_NO_PROVISIONED:
> +		error_msg = "P21 is not provisioned";
> +		ret = -EPERM;
> +		break;
> +	case P21_PROVISION_IN_PROGRESS:
> +		error_msg = "P21 is already provisioned or provisioning is in progress and a signing key has already been sent.";
> +		ret = -EINPROGRESS;
> +		break;
> +	case P21_IN_USE:
> +		error_msg = "P21 in use (cannot deprovision)";
> +		ret = -EPERM;
> +		break;
> +	case HEP_NOT_ACTIVE:
> +		error_msg = "HEP not activated";
> +		ret = -EPERM;
> +		break;
> +	case HEP_ALREADY_SET:
> +		error_msg = "HEP Transport already set";
> +		ret = -EINVAL;
> +		break;
> +	case HEP_CHECK_STATE:
> +		error_msg = "Check the current HEP state";
> +		ret = -EINVAL;
> +		break;
> +	default:
> +		error_msg = "Generic/Other error";
> +		ret = -EIO;
> +		break;
> +	}
> +
> +	if (msg != NULL)
> +		return sysfs_emit(msg, "%d,\"%s\"", error_code, error_msg);
> +	return error_code;
> +}
> +
> +
> +/*
> + * pending_reboot_show() - sysfs implementaton for read pending_reboot
> + * @kobj: Kernel object for this attribute
> + * @attr: Kernel object attribute
> + * @buf: The buffer to display to userspace
> + *
> + * Stores default value as 0
> + * When current_value is changed this attribute is set to 1 to notify reboot may be required
> + */
> +static ssize_t pending_reboot_show(struct kobject *kobj,
> +				   struct kobj_attribute *attr,
> +				   char *buf)
> +{
> +	return sysfs_emit(buf, "%d\n", bioscfg_drv.pending_reboot);
> +}
> +static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
> +
> +/*
> + * last_error_show() - sysfs implementaton for reporting the WMI
> + * error/success value.
> + * @kobj: Kernel object for this attribute
> + * @attr: Kernel object attribute
> + * @buf: The buffer to display to userspace
> + */
> +static ssize_t last_error_show(struct kobject *kobj,
> +			       struct kobj_attribute *attr,
> +			       char *buf)
> +{
> +	return bioscfg_wmi_error_and_message(bioscfg_drv.last_wmi_status, buf);
> +}
> +
> +static struct kobj_attribute last_error = __ATTR_RO(last_error);
> +
> +/*
> + * create_attributes_level_sysfs_files() - Creates reset_bios,
> + * pending_reboot, and last_error attributes
> + */
> +static int create_attributes_level_sysfs_files(void)
> +{
> +	int ret;
> +
> +	ret = sysfs_create_file(&bioscfg_drv.main_dir_kset->kobj, &pending_reboot.attr);
> +	if (ret)
> +		return ret;
> +
> +	ret = sysfs_create_file(&bioscfg_drv.main_dir_kset->kobj, &last_error.attr);
> +	if (ret)
> +		return ret;

You can use an attribute group to create multiple attributes at once.
This makes the logic shorter.

> +
> +	bioscfg_drv.last_wmi_status = 0;
> +	return 0;
> +}
> +
> +
> +static ssize_t bioscfg_attr_show(struct kobject *kobj, struct attribute *attr,
> +				 char *buf)
> +{
> +	struct kobj_attribute *kattr;
> +	ssize_t ret = -EIO;
> +
> +	kattr = container_of(attr, struct kobj_attribute, attr);
> +	if (kattr->show)
> +		ret = kattr->show(kobj, kattr, buf);
> +	return ret;
> +}
> +
> +static ssize_t bioscfg_attr_store(struct kobject *kobj, struct attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct kobj_attribute *kattr;
> +	ssize_t ret = -EIO;
> +
> +	kattr = container_of(attr, struct kobj_attribute, attr);
> +	if (kattr->store)
> +		ret = kattr->store(kobj, kattr, buf, count);
> +	return ret;
> +}
> +
> +static const struct sysfs_ops bioscfg_kobj_sysfs_ops = {
> +	.show	= bioscfg_attr_show,
> +	.store	= bioscfg_attr_store,
> +};

This is the same as kobj_sysfs_ops. Delete your custom implementation
and use the standard one.

> +
> +static void attr_name_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static struct kobj_type attr_name_ktype = {

can be const.

> +	.release	= attr_name_release,
> +	.sysfs_ops	= &bioscfg_kobj_sysfs_ops,
> +};
> +
> +/*
> + * get_wmiobj_pointer() - Get Content of WMI block for particular instance
> + *
> + * @instance_id: WMI instance ID
> + * @guid_string: WMI GUID (in str form)
> + *
> + * Fetches the content for WMI block (instance_id) under GUID (guid_string)
> + * Caller must kfree the return
> + */
> +union acpi_object *get_wmiobj_pointer(int instance_id, const char *guid_string)
> +{
> +	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_status status;
> +
> +	status = wmi_query_block(guid_string, instance_id, &out);
> +	return ACPI_SUCCESS(status) ? (union acpi_object *)out.pointer : NULL;
> +}
> +
> +/*
> + * get_instance_count() - Compute total number of instances under guid_string
> + *
> + * @guid_string: WMI GUID (in string form)
> + */
> +int get_instance_count(const char *guid_string)
> +{
> +	union acpi_object *wmi_obj = NULL;
> +	int i = 0;
> +
> +	do {
> +		kfree(wmi_obj);
> +		wmi_obj = get_wmiobj_pointer(i, guid_string);
> +		i++;
> +	} while (wmi_obj);

This leaks all the retrieved objects.

> +
> +	return (i-1);

No braces here.

> +}
> +
> +/*
> + * alloc_attributes_data() - Allocate attributes data for a particular type
> + *
> + * @attr_type: Attribute type to allocate
> + */
> +static int alloc_attributes_data(int attr_type)
> +{
> +	int retval = 0;
> +
> +	switch (attr_type) {
> +	case HPWMI_STRING_TYPE:
> +		retval = alloc_string_data();
> +		break;
> +	case HPWMI_INTEGER_TYPE:
> +		retval = alloc_integer_data();
> +		break;
> +	case HPWMI_ENUMERATION_TYPE:
> +		retval = alloc_enumeration_data();
> +		break;
> +	case HPWMI_ORDERED_LIST_TYPE:
> +		retval = alloc_ordered_list_data();
> +		break;
> +	case HPWMI_PASSWORD_TYPE:
> +		retval = alloc_password_data();
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return retval;
> +}
> +
> +int convert_hexstr_to_str(const char *input, int input_len, char **str, int *len)
> +{
> +	int ret = 0;
> +	int new_len = 0;
> +	char tmp[] = "0x00";
> +	char *new_str = NULL;
> +	long  ch;
> +	int i;
> +
> +	if (input_len <= 0 || input == NULL || str == NULL || len == NULL)
> +		return -EINVAL;
> +
> +	*len = 0;
> +	*str = NULL;
> +
> +	new_str = kmalloc(input_len, GFP_KERNEL);
> +	if (!new_str)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < input_len; i += 5) {
> +		strncpy(tmp, input + i, strlen(tmp));
> +		if (kstrtol(tmp, 16, &ch) == 0) {
> +			// escape char
> +			if (ch == '\\' || ch == '\r' || ch == '\n' || ch == '\t') {
> +				if (ch == '\r')
> +					ch = 'r';
> +				else if (ch == '\n')
> +					ch = 'n';
> +				else if (ch == '\t')
> +					ch = 't';
> +				new_str[new_len++] = '\\';
> +			}
> +			new_str[new_len++] = ch;
> +			if (ch == '\0')
> +				break;
> +		}
> +	}
> +
> +	if (new_len) {
> +		new_str[new_len] = '\0';
> +		*str = krealloc(new_str, (new_len + 1) * sizeof(char), GFP_KERNEL);
> +		if (*str)
> +			*len = new_len;
> +		else
> +			ret = -ENOMEM;
> +	} else {
> +		ret = -EFAULT;
> +	}
> +
> +	if (ret)
> +		kfree(new_str);
> +	return ret;
> +}
> +
> +/* map output size to the corresponding WMI method id */
> +int encode_outsize_for_pvsz(int outsize)
> +{
> +	if (outsize > 4096)
> +		return -EINVAL;
> +	if (outsize > 1024)
> +		return 5;
> +	if (outsize > 128)
> +		return 4;
> +	if (outsize > 4)
> +		return 3;
> +	if (outsize > 0)
> +		return 2;
> +	return 1;
> +}
> +
> +/*
> + * Update friendly display name for several attributes associated to
> + * 'Schedule Power-On'
> + */
> +void friendly_user_name_update(char *path, const char *attr_name,
> +			       char *attr_display, int attr_size)
> +{
> +	char *found = NULL;
> +
> +	found = strstr(path, SCHEDULE_POWER_ON);
> +	if (found)
> +		snprintf(attr_display,
> +			 attr_size,
> +			 "%s - %s",
> +			 SCHEDULE_POWER_ON,
> +			 attr_name);
> +	else
> +		strscpy(attr_display, attr_name, attr_size);
> +}
> +
> +/*
> + * update_attribute_permissions() - Update attributes permissions when
> + * isReadOnly value is 1
> + *
> + * @isReadOnly:  ReadOnly value
> + * @current_val: kobj_attribute corresponding to attribute.
> + *
> + */
> +void update_attribute_permissions(u32 isReadOnly, struct kobj_attribute *current_val)
> +{
> +	if (isReadOnly)
> +		current_val->attr.mode = (umode_t)0444;
> +	else
> +		current_val->attr.mode = (umode_t)0644;
> +}
> +
> +
> +/**
> + * destroy_attribute_objs() - Free a kset of kobjects
> + * @kset: The kset to destroy
> + *
> + * Fress kobjects created for each attribute_name under attribute type kset
> + */
> +static void destroy_attribute_objs(struct kset *kset)
> +{
> +	struct kobject *pos, *next;
> +
> +	list_for_each_entry_safe(pos, next, &kset->list, entry)
> +		kobject_put(pos);
> +}
> +
> +/**
> + * release_attributes_data() - Clean-up all sysfs directories and files created
> + */
> +static void release_attributes_data(void)
> +{
> +	mutex_lock(&bioscfg_drv.mutex);
> +
> +	exit_string_attributes();
> +	exit_integer_attributes();
> +	exit_enumeration_attributes();
> +	exit_ordered_list_attributes();
> +	exit_password_attributes();
> +	exit_sure_start_attributes();
> +	exit_secure_platform_attributes();
> +
> +	if (bioscfg_drv.authentication_dir_kset) {
> +		destroy_attribute_objs(bioscfg_drv.authentication_dir_kset);
> +		kset_unregister(bioscfg_drv.authentication_dir_kset);
> +		bioscfg_drv.authentication_dir_kset = NULL;
> +	}
> +	if (bioscfg_drv.main_dir_kset) {
> +		sysfs_remove_file(&bioscfg_drv.main_dir_kset->kobj, &pending_reboot.attr);
> +		sysfs_remove_file(&bioscfg_drv.main_dir_kset->kobj, &last_error.attr);
> +		destroy_attribute_objs(bioscfg_drv.main_dir_kset);
> +		kset_unregister(bioscfg_drv.main_dir_kset);
> +		bioscfg_drv.main_dir_kset = NULL;
> +	}
> +	mutex_unlock(&bioscfg_drv.mutex);
> +}
> +
> +
> +/*
> + * hp_add_other_attributes - Initialize HP custom attributes not reported by
> + * BIOS and required to support Secure Platform, Sure Start, and Sure
> + * Admin.
> + * @attr_type: Custom HP attribute not reported by BIOS
> + *
> + * Initialiaze all 3 types of attributes: Platform, Sure Start, and Sure
> + * Admin object.  Populates each attrbute types respective properties
> + * under sysfs files.
> + *
> + * Returns zero(0) if successful.  Otherwise, a negative value.
> + */
> +static int hp_add_other_attributes(int attr_type)
> +{
> +	struct kobject *attr_name_kobj;
> +	union acpi_object *obj = NULL;
> +	int retval = 0;
> +	u8 *attr_name;
> +
> +	mutex_lock(&bioscfg_drv.mutex);
> +
> +	attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
> +	if (!attr_name_kobj) {
> +		retval = -ENOMEM;
> +		goto err_other_attr_init;
> +	}
> +
> +	/* Check if attribute type is supported */
> +	switch (attr_type) {
> +	case HPWMI_SECURE_PLATFORM_TYPE:
> +		attr_name_kobj->kset = bioscfg_drv.authentication_dir_kset;
> +		attr_name = SPM_STR;
> +		break;
> +
> +	case HPWMI_SURE_START_TYPE:
> +		attr_name_kobj->kset = bioscfg_drv.main_dir_kset;
> +		attr_name = SURE_START_STR;
> +		break;
> +
> +	default:
> +		pr_err("Error: Unknown attr_type: %d\n", attr_type);
> +		retval = -EINVAL;
> +		goto err_other_attr_init;
> +	}
> +
> +	retval = kobject_init_and_add(attr_name_kobj, &attr_name_ktype,
> +				      NULL, "%s", attr_name);
> +	if (retval) {
> +		pr_err("Error encountered [%d]\n", retval);
> +		kobject_put(attr_name_kobj);
> +		goto err_other_attr_init;
> +	}
> +
> +	/* Populate attribute data */
> +	switch (attr_type) {
> +	case HPWMI_SECURE_PLATFORM_TYPE:
> +		retval = populate_secure_platform_data(attr_name_kobj);
> +		break;
> +
> +	case HPWMI_SURE_START_TYPE:
> +		retval = populate_sure_start_data(attr_name_kobj);
> +		break;
> +
> +	default:
> +		goto err_other_attr_init;
> +	}
> +
> +	mutex_unlock(&bioscfg_drv.mutex);
> +	return 0;
> +
> +err_other_attr_init:
> +	mutex_unlock(&bioscfg_drv.mutex);
> +	kfree(obj);
> +	return retval;
> +}
> +
> +/*
> + * hp_init_bios_attributes - Initialize all attributes for a type
> + * @attr_type: The attribute type to initialize
> + * @guid: The WMI GUID associated with this type to initialize
> + *
> + * Initialiaze all 5 types of attributes: enumeration, integer,
> + * string, password, ordered list  object.  Populates each attrbute types
> + * respective properties under sysfs files
> + */
> +static int hp_init_bios_attributes(int attr_type, const char *guid)
> +{
> +	struct kobject *attr_name_kobj;
> +	union acpi_object *obj = NULL;
> +	union acpi_object *elements;
> +	struct kset *tmp_set;
> +	int min_elements;
> +	char str[MAX_BUFF];
> +
> +	char *temp_str = NULL;
> +	char *str_value = NULL;
> +	int str_len;
> +	int ret = 0;
> +
> +	u8 *buffer_ptr = NULL;
> +	int buffer_size;
> +
> +
> +	/* instance_id needs to be reset for each type GUID
> +	 * also, instance IDs are unique within GUID but not across
> +	 */
> +	int instance_id = 0;
> +	int retval = 0;
> +
> +	retval = alloc_attributes_data(attr_type);
> +	if (retval)
> +		return retval;
> +
> +	switch (attr_type) {
> +	case HPWMI_STRING_TYPE:
> +		min_elements = 12;
> +		break;
> +	case HPWMI_INTEGER_TYPE:
> +		min_elements = 13;
> +		break;
> +	case HPWMI_ENUMERATION_TYPE:
> +		min_elements = 13;
> +		break;
> +	case HPWMI_ORDERED_LIST_TYPE:
> +		min_elements = 12;
> +		break;
> +	case HPWMI_PASSWORD_TYPE:
> +		min_elements = 15;
> +		break;
> +	default:
> +		pr_err("Error: Unknown attr_type: %d\n", attr_type);
> +		return -EINVAL;
> +	}
> +
> +	/* need to use specific instance_id and guid combination to get right data */
> +	obj = get_wmiobj_pointer(instance_id, guid);
> +	if (!obj)
> +		return -ENODEV;
> +
> +	mutex_lock(&bioscfg_drv.mutex);
> +	while (obj) {
> +		if (obj->type != ACPI_TYPE_PACKAGE && obj->type != ACPI_TYPE_BUFFER) {
> +			pr_err("Error: Expected ACPI-package or buffer type, got: %d\n", obj->type);
> +			retval = -EIO;
> +			goto err_attr_init;
> +		}
> +
> +		/* Take action appropriate to each ACPI TYPE */
> +		if (obj->type == ACPI_TYPE_PACKAGE) {
> +			if (obj->package.count < min_elements) {
> +				pr_err("ACPI-package does not have enough elements: %d < %d\n",
> +				       obj->package.count, min_elements);
> +				goto nextobj;
> +			}
> +
> +			elements = obj->package.elements;
> +
> +			/* sanity checking */
> +			if (elements[NAME].type != ACPI_TYPE_STRING) {
> +				pr_debug("incorrect element type\n");
> +				goto nextobj;
> +			}
> +			if (strlen(elements[NAME].string.pointer) == 0) {
> +				pr_debug("empty attribute found\n");
> +				goto nextobj;
> +			}
> +
> +			if (attr_type == HPWMI_PASSWORD_TYPE)
> +				tmp_set = bioscfg_drv.authentication_dir_kset;
> +			else
> +				tmp_set = bioscfg_drv.main_dir_kset;
> +
> +			/* convert attribute name to string */
> +			retval = convert_hexstr_to_str(elements[NAME].string.pointer,
> +						       elements[NAME].string.length,
> +						       &str_value, &str_len);
> +
> +			if (retval) {
> +				pr_debug("Failed to populate integer package data. Error [0%0x]\n", ret);
> +				kfree(str_value);
> +				return ret;
> +			}
> +
> +			if (kset_find_obj(tmp_set, str_value)) {
> +				pr_debug("Duplicate attribute name found - %s\n",
> +					 str_value);
> +				goto nextobj;
> +			}
> +
> +			/* build attribute */
> +			attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
> +			if (!attr_name_kobj) {
> +				retval = -ENOMEM;
> +				goto err_attr_init;
> +			}
> +
> +			attr_name_kobj->kset = tmp_set;
> +
> +			retval = kobject_init_and_add(attr_name_kobj, &attr_name_ktype,
> +						      NULL, "%s", str_value);
> +
> +			if (retval) {
> +				kobject_put(attr_name_kobj);
> +				goto err_attr_init;
> +			}
> +
> +			/* enumerate all of these attributes */
> +			switch (attr_type) {
> +			case HPWMI_STRING_TYPE:
> +				retval = populate_string_package_data(elements,
> +								      instance_id,
> +								      attr_name_kobj);
> +				break;
> +			case HPWMI_INTEGER_TYPE:
> +				retval = populate_integer_package_data(elements,
> +								       instance_id,
> +								       attr_name_kobj);
> +				break;
> +			case HPWMI_ENUMERATION_TYPE:
> +				retval = populate_enumeration_package_data(elements,
> +									   instance_id,
> +									   attr_name_kobj);
> +				break;
> +			case HPWMI_ORDERED_LIST_TYPE:
> +				retval = populate_ordered_list_package_data(elements,
> +									    instance_id,
> +									    attr_name_kobj);
> +				break;
> +			case HPWMI_PASSWORD_TYPE:
> +				retval = populate_password_package_data(elements,
> +									instance_id,
> +									attr_name_kobj);
> +				break;
> +			default:
> +				break;
> +			}
> +
> +			kfree(str_value);
> +			str_value = NULL;
> +		}
> +
> +		if (obj->type == ACPI_TYPE_BUFFER) {
> +
> +			buffer_size = obj->buffer.length;
> +			buffer_ptr = obj->buffer.pointer;
> +
> +			retval = get_string_from_buffer(&buffer_ptr, &buffer_size, str, MAX_BUFF);
> +			if (retval < 0)
> +				goto err_attr_init;
> +
> +			if (attr_type == HPWMI_PASSWORD_TYPE || attr_type == HPWMI_SECURE_PLATFORM_TYPE)
> +				tmp_set = bioscfg_drv.authentication_dir_kset;
> +			else
> +				tmp_set = bioscfg_drv.main_dir_kset;
> +
> +			if (kset_find_obj(tmp_set, str)) {
> +				pr_warn("Duplicate attribute name found - %s\n", str);
> +				goto nextobj;
> +			}
> +
> +			/* build attribute */
> +			attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
> +			if (!attr_name_kobj) {
> +				retval = -ENOMEM;
> +				goto err_attr_init;
> +			}
> +
> +			attr_name_kobj->kset = tmp_set;
> +
> +			temp_str = str;
> +			if (attr_type == HPWMI_SECURE_PLATFORM_TYPE)
> +				temp_str = "SPM";
> +
> +			retval = kobject_init_and_add(attr_name_kobj,
> +						      &attr_name_ktype, NULL, "%s",
> +						      temp_str);
> +			if (retval) {
> +				kobject_put(attr_name_kobj);
> +				goto err_attr_init;
> +			}
> +
> +			/* enumerate all of these attributes */
> +			switch (attr_type) {
> +			case HPWMI_STRING_TYPE:
> +				retval = populate_string_buffer_data(buffer_ptr,
> +								     &buffer_size,
> +								     instance_id,
> +								     attr_name_kobj);
> +				break;
> +			case HPWMI_INTEGER_TYPE:
> +				retval = populate_integer_buffer_data(buffer_ptr,
> +								      &buffer_size,
> +								      instance_id,
> +								      attr_name_kobj);
> +				break;
> +			case HPWMI_ENUMERATION_TYPE:
> +				retval = populate_enumeration_buffer_data(buffer_ptr,
> +									  &buffer_size,
> +									  instance_id,
> +									  attr_name_kobj);
> +				break;
> +			case HPWMI_ORDERED_LIST_TYPE:
> +				retval = populate_ordered_list_buffer_data(buffer_ptr,
> +									   &buffer_size,
> +									   instance_id,
> +									   attr_name_kobj);
> +				break;
> +			case HPWMI_PASSWORD_TYPE:
> +				retval = populate_password_buffer_data(buffer_ptr,
> +								       &buffer_size,
> +								       instance_id,
> +								       attr_name_kobj);
> +				break;
> +			default:
> +				break;
> +			}
> +		}
> +
> +	nextobj:
> +		kfree(str_value);
> +		kfree(obj);
> +		instance_id++;
> +		obj = get_wmiobj_pointer(instance_id, guid);
> +	}
> +	mutex_unlock(&bioscfg_drv.mutex);
> +	return 0;
> +
> +err_attr_init:
> +	mutex_unlock(&bioscfg_drv.mutex);
> +	kfree(obj);
> +	return retval;
> +}
> +
> +static int __init bioscfg_init(void)
> +{
> +	int ret = 0;
> +	int bios_capable = wmi_has_guid(HP_WMI_BIOS_GUID);
> +
> +	if (!bios_capable) {
> +		pr_err("Unable to run on non-HP system\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = init_bios_attr_set_interface();
> +	if (ret)
> +		return ret;
> +
> +	ret = init_bios_attr_pass_interface();
> +	if (ret)
> +		goto err_exit_bios_attr_set_interface;
> +
> +	if (!bioscfg_drv.bios_attr_wdev || !bioscfg_drv.password_attr_wdev) {
> +		pr_debug("Failed to find set or pass interface\n");
> +		ret = -ENODEV;
> +		goto err_exit_bios_attr_pass_interface;
> +	}
> +
> +	ret = fw_attributes_class_get(&fw_attr_class);
> +	if (ret)
> +		goto err_exit_bios_attr_pass_interface;
> +
> +	bioscfg_drv.class_dev = device_create(fw_attr_class, NULL, MKDEV(0, 0),
> +					      NULL, "%s", DRIVER_NAME);
> +	if (IS_ERR(bioscfg_drv.class_dev)) {
> +		ret = PTR_ERR(bioscfg_drv.class_dev);
> +		goto err_unregister_class;
> +	}
> +
> +	bioscfg_drv.main_dir_kset = kset_create_and_add("attributes", NULL,
> +							&bioscfg_drv.class_dev->kobj);
> +	if (!bioscfg_drv.main_dir_kset) {
> +		ret = -ENOMEM;
> +		pr_debug("Failed to create and add attributes\n");
> +		goto err_destroy_classdev;
> +	}
> +
> +	bioscfg_drv.authentication_dir_kset = kset_create_and_add("authentication", NULL,
> +								  &bioscfg_drv.class_dev->kobj);
> +	if (!bioscfg_drv.authentication_dir_kset) {
> +		ret = -ENOMEM;
> +		pr_debug("Failed to create and add authentication\n");
> +		goto err_release_attributes_data;
> +	}
> +
> +	/*
> +	 * sysfs level attributes.
> +	 * - reset_bios
> +	 * - pending_reboot
> +	 * - last_error (WMI error)
> +	 */
> +	ret = create_attributes_level_sysfs_files();
> +	if (ret)
> +		pr_debug("Failed to create sysfs level attributes\n");
> +
> +	ret = hp_init_bios_attributes(HPWMI_STRING_TYPE, HP_WMI_BIOS_STRING_GUID);
> +	if (ret)
> +		pr_debug("Failed to populate string type attributes\n");
> +
> +	ret = hp_init_bios_attributes(HPWMI_INTEGER_TYPE, HP_WMI_BIOS_INTEGER_GUID);
> +	if (ret)
> +		pr_debug("Failed to populate integer type attributes\n");
> +
> +	ret = hp_init_bios_attributes(HPWMI_ENUMERATION_TYPE, HP_WMI_BIOS_ENUMERATION_GUID);
> +	if (ret)
> +		pr_debug("Failed to populate enumeration type attributes\n");
> +
> +	ret = hp_init_bios_attributes(HPWMI_ORDERED_LIST_TYPE, HP_WMI_BIOS_ORDERED_LIST_GUID);
> +	if (ret)
> +		pr_debug("Failed to populate ordered list object type attributes\n");
> +
> +	ret = hp_init_bios_attributes(HPWMI_PASSWORD_TYPE, HP_WMI_BIOS_PASSWORD_GUID);
> +	if (ret)
> +		pr_debug("Failed to populate password object type attributes\n");
> +
> +	bioscfg_drv.spm_data.attr_name_kobj = NULL;
> +	ret = hp_add_other_attributes(HPWMI_SECURE_PLATFORM_TYPE);
> +	if (ret)
> +		pr_debug("Failed to populate secure platform object type attribute\n");
> +
> +	bioscfg_drv.sure_start_attr_kobj = NULL;
> +	ret = hp_add_other_attributes(HPWMI_SURE_START_TYPE);
> +	if (ret)
> +		pr_debug("Failed to populate sure start object type attribute\n");
> +
> +	return 0;
> +
> +err_release_attributes_data:
> +	release_attributes_data();
> +
> +err_destroy_classdev:
> +	device_destroy(fw_attr_class, MKDEV(0, 0));
> +
> +err_unregister_class:
> +	fw_attributes_class_put();
> +
> +err_exit_bios_attr_pass_interface:
> +	exit_bios_attr_pass_interface();
> +
> +err_exit_bios_attr_set_interface:
> +	exit_bios_attr_set_interface();
> +
> +	return ret;
> +}
> +
> +static void __exit bioscfg_exit(void)
> +{
> +	release_attributes_data();
> +	device_destroy(fw_attr_class, MKDEV(0, 0));
> +
> +	fw_attributes_class_put();
> +	exit_bios_attr_set_interface();
> +	exit_bios_attr_pass_interface();
> +}
> +
> +module_init(bioscfg_init);
> +module_exit(bioscfg_exit);
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
> new file mode 100644
> index 000000000000..97915b18505a
> --- /dev/null
> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
> @@ -0,0 +1,654 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Definitions for kernel modules using hp_bioscfg driver
> + *
> + *  Copyright (c) 2022 HP Development Company, L.P.
> + */
> +
> +#ifndef _HP_BIOSCFG_H_
> +#define _HP_BIOSCFG_H_
> +
> +#include <linux/wmi.h>
> +#include <linux/types.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/capability.h>
> +#include <linux/nls.h>
> +#include <linux/printk.h>
> +
> +
> +#define DRIVER_NAME	"hp-bioscfg"
> +
> +#define MAX_BUFF		512
> +#define MAX_KEY_MOD		256
> +#define MAX_PASSWD_SIZE	64
> +#define MAX_MESSAGE_SIZE	256
> +#define MAX_PREREQUISITES_SIZE	20
> +#define MAX_REQ_ELEM_SIZE	128
> +#define MAX_VALUES_SIZE	16
> +#define MAX_ENCODINGS_SIZE	16
> +#define MAX_ELEMENTS_SIZE	16
> +
> +#define SPM_STR_DESC		"Secure Platform Management"
> +#define SPM_STR		"SPM"
> +#define SURE_START_DESC	"Sure Start"
> +#define SURE_START_STR		"Sure_Start"
> +#define SETUP_PASSWD		"Setup Password"
> +#define POWER_ON_PASSWD	"Power-On Password"
> +
> +#define LANG_CODE_STR		"en_US.UTF-8"
> +#define SCHEDULE_POWER_ON	"Scheduled Power-On"
> +
> +/* Sure Admin Functions */
> +
> +#define UTF_PREFIX	((unsigned char *)"<utf-16/>")
> +#define BEAM_PREFIX	((unsigned char *)"<BEAM/>")

These casts should not be needed anymore.
All chars are now unsigned.

> +
> +/* mechanism - Authentication attribute */
> +
> +#define MAX_MECHANISM_TYPES 3
> +
> +enum mechanism_values {
> +	PASSWORD	= 0x00,
> +	NOT_PROVISION   = 0x00,
> +	SIGNING_KEY	= 0x01,
> +	ENDORSEMENT_KEY = 0x02
> +};
> +
> +static const char * const spm_mechanism_types[] = {
> +	"not provision",
> +	"signing-key",
> +	"endorsement-key"
> +};
> +
> +static const char * const passwd_mechanism_types[] = {
> +	"password",
> +};
> +
> +/* roles - Authentication attribute */
> +enum role_values {
> +	BIOS_ADMIN	= 0x00,
> +	POWER_ON	= 0x01,
> +	BIOS_SPM	= 0x02
> +};
> +
> +static const char * const role_type[] = {
> +	"bios-admin",
> +	"power-on",
> +	"enhanced-bios-auth"
> +};
> +
> +
> +#define HP_WMI_BIOS_GUID		"5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
> +
> +#define HP_WMI_BIOS_STRING_GUID		"988D08E3-68F4-4c35-AF3E-6A1B8106F83C"
> +#define HP_WMI_BIOS_INTEGER_GUID	"8232DE3D-663D-4327-A8F4-E293ADB9BF05"
> +#define HP_WMI_BIOS_ENUMERATION_GUID	"2D114B49-2DFB-4130-B8FE-4A3C09E75133"
> +#define HP_WMI_BIOS_ORDERED_LIST_GUID	"14EA9746-CE1F-4098-A0E0-7045CB4DA745"
> +#define HP_WMI_BIOS_PASSWORD_GUID	"322F2028-0F84-4901-988E-015176049E2D"
> +#define HP_WMI_SET_BIOS_SETTING_GUID	"1F4C91EB-DC5C-460b-951D-C7CB9B4B8D5E"
> +
> +enum hp_wmi_spm_commandtype {
> +	HPWMI_SECUREPLATFORM_GET_STATE  = 0x10,
> +	HPWMI_SECUREPLATFORM_SET_KEK	= 0x11,
> +	HPWMI_SECUREPLATFORM_SET_SK	= 0x12,
> +};
> +
> +enum hp_wmi_surestart_commandtype {
> +	HPWMI_SURESTART_GET_LOG_COUNT	= 0x01,
> +	HPWMI_SURESTART_GET_LOG	= 0x02,
> +};
> +
> +enum hp_wmi_command {
> +	HPWMI_READ		= 0x01,
> +	HPWMI_WRITE		= 0x02,
> +	HPWMI_ODM		= 0x03,
> +	HPWMI_SURESTART	= 0x20006,
> +	HPWMI_GM		= 0x20008,
> +	HPWMI_SECUREPLATFORM	= 0x20010,
> +};
> +
> +struct bios_return {
> +	u32 sigpass;
> +	u32 return_code;
> +};
> +
> +enum hp_return_value {
> +	HPWMI_RET_WRONG_SIGNATURE	= 0x02,
> +	HPWMI_RET_UNKNOWN_COMMAND	= 0x03,
> +	HPWMI_RET_UNKNOWN_CMDTYPE	= 0x04,
> +	HPWMI_RET_INVALID_PARAMETERS	= 0x05,
> +};
> +
> +enum wmi_error_values {
> +	SUCCESS				= 0x00,
> +	CMD_FAILED			= 0x01,
> +	INVALID_SIGN			= 0x02,
> +	INVALID_CMD_VALUE		= 0x03,
> +	INVALID_CMD_TYPE		= 0x04,
> +	INVALID_DATA_SIZE		= 0x05,
> +	INVALID_CMD_PARAM		= 0x06,
> +	ENCRYP_CMD_REQUIRED		= 0x07,
> +	NO_SECURE_SESSION		= 0x08,
> +	SECURE_SESSION_FOUND		= 0x09,
> +	SECURE_SESSION_FAILED		= 0x0A,
> +	AUTH_FAILED			= 0x0B,
> +	INVALID_BIOS_AUTH		= 0x0E,
> +	NONCE_DID_NOT_MATCH		= 0x18,
> +	GENERIC_ERROR			= 0x1C,
> +	BIOS_ADMIN_POLICY_NOT_MET	= 0x28,
> +	BIOS_ADMIN_NOT_SET		= 0x38,
> +	P21_NO_PROVISIONED		= 0x1000,
> +	P21_PROVISION_IN_PROGRESS	= 0x1001,
> +	P21_IN_USE			= 0x1002,
> +	HEP_NOT_ACTIVE			= 0x1004,
> +	HEP_ALREADY_SET		= 0x1006,
> +	HEP_CHECK_STATE		= 0x1007
> +};
> +
> +enum spm_features {
> +	HEP_ENABLED			= 0x01,
> +	PLATFORM_RECOVERY		= 0x02,
> +	ENHANCED_BIOS_AUTH_MODE	= 0x04
> +};
> +
> +
> +/*
> + * struct bios_args buffer is dynamically allocated.  New WMI command types
> + * were introduced that exceeds 128-byte data size.  Changes to handle
> + * the data size allocation scheme were kept in hp_wmi_perform_qurey function.
> + */
> +struct bios_args {
> +	u32 signature;
> +	u32 command;
> +	u32 commandtype;
> +	u32 datasize;
> +	u8 data[];
> +};
> +
> +struct secureplatform_provisioning_data {
> +	u8 state;
> +	u8 version[2];
> +	u8 reserved1;
> +	u32 features;
> +	u32 nonce;
> +	u8 reserved2[28];
> +	u8 sk_mod[MAX_KEY_MOD];
> +	u8 kek_mod[MAX_KEY_MOD];
> +};
> +
> +struct string_data {
> +	struct kobject *attr_name_kobj;
> +	u8 display_name[MAX_BUFF];
> +	u8 current_value[MAX_BUFF];
> +	u8 new_value[MAX_BUFF];
> +	u8 path[MAX_BUFF];
> +	u32 is_readonly;
> +	u32 display_in_ui;
> +	u32 requires_physical_presence;
> +	u32 sequence;
> +	u32 prerequisites_size;
> +	u8 prerequisites[MAX_PREREQUISITES_SIZE][MAX_BUFF];
> +	u32 security_level;
> +	u32 min_length;
> +	u32 max_length;
> +	u8 display_name_language_code[MAX_BUFF];
> +};

Lots of these members are duplicated between all attribute types.
Moving them to some common struct would make the code shorter.

> +struct integer_data {
> +	struct kobject *attr_name_kobj;
> +	u8 display_name[MAX_BUFF];
> +	u32 current_value;
> +	u32 new_value;
> +	u8 path[MAX_BUFF];
> +	u32 is_readonly;
> +	u32 display_in_ui;
> +	u32 requires_physical_presence;
> +	u32 sequence;
> +	u32 prerequisites_size;
> +	u8 prerequisites[MAX_PREREQUISITES_SIZE][MAX_BUFF];
> +	u32 security_level;
> +	u32 lower_bound;
> +	u32 upper_bound;
> +	u32 scalar_increment;
> +	u8 display_name_language_code[MAX_BUFF];
> +};
> +
> +struct enumeration_data {
> +	struct kobject *attr_name_kobj;
> +	u8 display_name[MAX_BUFF];
> +	u8 path[MAX_BUFF];
> +	u32 is_readonly;
> +	u32 display_in_ui;
> +	u32 requires_physical_presence;
> +	u32 sequence;
> +	u32 prerequisites_size;
> +	u8 prerequisites[MAX_PREREQUISITES_SIZE][MAX_BUFF];
> +	u32 security_level;
> +	u8 current_value[MAX_BUFF];
> +	u8 new_value[MAX_BUFF];
> +	u32 possible_values_size;
> +	u8 possible_values[MAX_VALUES_SIZE][MAX_BUFF];
> +	u8 display_name_language_code[MAX_BUFF];
> +};
> +
> +struct ordered_list_data {
> +	struct kobject *attr_name_kobj;
> +	u8 display_name[MAX_BUFF];
> +	u8 current_value[MAX_BUFF];
> +	u8 new_value[MAX_BUFF];
> +	u8 path[MAX_BUFF];
> +	u32 is_readonly;
> +	u32 display_in_ui;
> +	u32 requires_physical_presence;
> +	u32 sequence;
> +	u32 prerequisites_size;
> +	u8 prerequisites[MAX_PREREQUISITES_SIZE][MAX_BUFF];
> +	u32 security_level;
> +	u32 elements_size;
> +	u8 elements[MAX_ELEMENTS_SIZE][MAX_BUFF];;
> +	u8 display_name_language_code[MAX_BUFF];
> +};
> +
> +struct password_data {
> +	struct kobject *attr_name_kobj;
> +	u8 display_name[MAX_BUFF];
> +	u8 current_password[MAX_PASSWD_SIZE];
> +	u8 new_password[MAX_PASSWD_SIZE];
> +	u8 path[MAX_BUFF];
> +	u32 is_readonly;
> +	u32 display_in_ui;
> +	u32 requires_physical_presence;
> +	u32 sequence;
> +	u32 prerequisites_size;
> +	u8 prerequisites[MAX_PREREQUISITES_SIZE][MAX_BUFF];
> +	u32 security_level;
> +	u32 min_password_length;
> +	u32 max_password_length;
> +	u32 encodings_size;
> +	u8 encodings[MAX_ENCODINGS_SIZE][MAX_BUFF];
> +	u8 display_name_language_code[MAX_BUFF];
> +	u32 is_enabled;
> +
> +	// 'bios-admin' 'power-on'
> +	u32 role;
> +
> +	//'password'
> +	u32 mechanism;
> +};
> +
> +struct secure_platform_data {
> +	struct kobject *attr_name_kobj;
> +	u8 attribute_name[MAX_BUFF];
> +	u8 display_name[MAX_BUFF];
> +
> +	u8 *endorsement_key;
> +	u8 *signing_key;
> +	u8 *auth_token;
> +
> +	u32 is_enabled;
> +	u32 mechanism;
> +};
> +
> +struct bioscfg_priv {
> +	struct wmi_device *password_attr_wdev;
> +	struct wmi_device *bios_attr_wdev;
> +	struct kset *authentication_dir_kset;
> +	struct kset *main_dir_kset;
> +	struct device *class_dev;
> +	struct string_data *string_data;
> +	u32 string_instances_count;
> +	struct integer_data *integer_data;
> +	u32 integer_instances_count;
> +	struct enumeration_data *enumeration_data;
> +	u32 enumeration_instances_count;
> +	struct ordered_list_data *ordered_list_data;
> +	u32 ordered_list_instances_count;
> +	struct password_data *password_data;
> +	u32 password_instances_count;
> +
> +	struct kobject *sure_start_attr_kobj;
> +	struct secure_platform_data spm_data;
> +
> +	int  last_wmi_status;
> +	bool pending_reboot;
> +	struct mutex mutex;
> +};
> +
> +/* global structure used by multiple WMI interfaces */
> +extern struct bioscfg_priv bioscfg_drv;
> +
> +enum hp_wmi_data_type {
> +	HPWMI_STRING_TYPE		= 0x00,
> +	HPWMI_INTEGER_TYPE		= 0x01,
> +	HPWMI_ENUMERATION_TYPE		= 0x02,
> +	HPWMI_ORDERED_LIST_TYPE		= 0x03,
> +	HPWMI_PASSWORD_TYPE		= 0x04,
> +	HPWMI_SECURE_PLATFORM_TYPE	= 0x05,
> +	HPWMI_SURE_START_TYPE		= 0x06,
> +};
> +
> +enum hp_wmi_data_elements {
> +
> +	/* Common elements */
> +	NAME = 0,
> +	VALUE = 1,
> +	PATH = 2,
> +	IS_READONLY = 3,
> +	DISPLAY_IN_UI = 4,
> +	REQUIRES_PHYSICAL_PRESENCE = 5,
> +	SEQUENCE = 6,
> +	PREREQUISITES_SIZE = 7,
> +	PREREQUISITES = 8,
> +	SECURITY_LEVEL = 9,
> +
> +	/* String elements */
> +	STR_MIN_LENGTH = 10,
> +	STR_MAX_LENGTH = 11,
> +
> +	/* Integer elements */
> +	INT_LOWER_BOUND = 10,
> +	INT_UPPER_BOUND = 11,
> +	INT_SCALAR_INCREMENT = 12,
> +
> +	/* Enumeration elements */
> +	ENUM_CURRENT_VALUE = 10,
> +	ENUM_SIZE = 11,
> +	ENUM_POSSIBLE_VALUES = 12,
> +
> +	/* Ordered list elements */
> +	ORD_LIST_SIZE = 10,
> +	ORD_LIST_ELEMENTS = 11,
> +
> +	/* Password elements */
> +	PSWD_MIN_LENGTH = 10,
> +	PSWD_MAX_LENGTH = 11,
> +	PSWD_SIZE = 12,
> +	PSWD_ENCODINGS = 13,
> +	PSWD_IS_SET = 14
> +};
> +
> +
> +static const int hp_wmi_elements_count[] = {
> +	12,   // string
> +	13,   // integer
> +	13,   // enumeration
> +	12,   // ordered list
> +	15    // password
> +};
> +
> +#define get_instance_id(type)						\
> +	static int get_##type##_instance_id(struct kobject *kobj)	\
> +	{								\
> +		int i;							\
> +									\
> +		for (i = 0; i <= bioscfg_drv.type##_instances_count; i++) { \
> +			if (!(strcmp(kobj->name, bioscfg_drv.type##_data[i].attr_name_kobj->name))) \
> +				return i;				\
> +		}							\
> +		return -EIO;						\
> +	}
> +
> +#define get_instance_id_for_attribute(type)				\
> +	static int get_instance_id_for_##type(char *attr_name)		\
> +	{								\
> +		int i;							\
> +									\
> +		for (i = 0; i < bioscfg_drv.type##_instances_count; i++) { \
> +			if (strcmp(bioscfg_drv.type##_data[i].attr_name_kobj->name, attr_name) == 0) \
> +				return i;				\
> +		}							\
> +		return -EIO;						\
> +	}
> +
> +#define attribute_s_property_show(name, type)				\
> +	static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr, \
> +				   char *buf)				\
> +	{								\
> +		int i = get_##type##_instance_id(kobj);			\
> +		if (i >= 0)						\
> +			return sysfs_emit(buf, "%s\n", bioscfg_drv.type##_data[i].name); \
> +		return 0;						\
> +	}

Is it really successful when the id was not found?

> +/* There is no need to keep track of default and current values
> + * separately
> + */
> +#define attribute_s_default_property_show(name, type, new_name)		\
> +	static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr, \
> +				   char *buf)				\
> +	{								\
> +		int i = get_##type##_instance_id(kobj);			\
> +		if (i >= 0)						\
> +			return sysfs_emit(buf, "%s\n", bioscfg_drv.type##_data[i].new_name); \
> +		return 0;						\
> +	}
> +
> +#define attribute_n_default_property_show(name, type, new_name)		\
> +	static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr, \
> +				   char *buf)				\
> +	{								\
> +		int i = get_##type##_instance_id(kobj);			\
> +		if (i >= 0)						\
> +			return sysfs_emit(buf, "%d\n", bioscfg_drv.type##_data[i].new_name); \
> +		return 0;						\
> +	}
> +
> +#define attribute_n_property_show(name, type)				\
> +	static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr, \
> +				   char *buf)				\
> +	{								\
> +		int i = get_##type##_instance_id(kobj);			\
> +		if (i >= 0)						\
> +			return sysfs_emit(buf, "%d\n", bioscfg_drv.type##_data[i].name); \
> +		return 0;						\
> +	}
> +
> +
> +#define attribute_property_store(curr_val, type)			\
> +	static ssize_t curr_val##_store(struct kobject *kobj,		\
> +					struct kobj_attribute *attr,	\
> +					const char *buf, size_t count)	\
> +	{								\
> +		char *p = NULL;						\
> +		char *attr_value = NULL;				\
> +		int i;							\
> +		int ret = -EIO;						\
> +									\
> +		attr_value = kstrdup(buf, GFP_KERNEL);			\
> +		if (!attr_value)					\
> +			return -ENOMEM;					\
> +									\
> +		p = memchr(attr_value, '\n', count);			\
> +		if (p != NULL)						\
> +			*p = '\0';					\
> +									\
> +		i = get_##type##_instance_id(kobj);			\
> +		if (i >= 0)						\
> +			ret = validate_##type##_input(i, attr_value);	\
> +		if (!ret)						\
> +			ret = hp_set_attribute(kobj->name, attr_value);	\
> +		if (!ret)						\
> +			update_##type##_value(i, attr_value);		\
> +									\
> +		/*							\
> +		 * Prevent leaving authentication tokens and password in \
> +		 * memory.						\
> +		 */							\
> +		clear_all_credentials();				\
> +		kfree(attr_value);					\
> +									\
> +		return ret ? ret : count;				\
> +	}
> +
> +#define attribute_spm_n_property_show(name, type)			\
> +	static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
> +	{								\
> +		return sysfs_emit(buf, "%d\n", bioscfg_drv.type##_data.name); \
> +	}
> +
> +#define attribute_spm_s_property_show(name, type)			\
> +	static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
> +	{								\
> +		return sysfs_emit(buf, "%s\n", bioscfg_drv.type##_data.name); \
> +	}
> +
> +#define check_property_type(attr, prop, valuetype)	\
> +	(attr##_obj[prop].type != valuetype)
> +
> +#define HPWMI_BINATTR_RW(_group, _name, _size)				\
> +	static struct bin_attribute _group##_##_name =			\
> +		__BIN_ATTR(_name, 0444 | 0200, _group##_##_name##_read, _group##_##_name##_write, _size)
> +
> +
> +#define attribute_values_property_show(name, type)			\
> +	static ssize_t name##_show(struct kobject *kobj,		\
> +				   struct kobj_attribute *attr, char *buf) \
> +	{								\
> +		int i;							\
> +		int len = 0;						\
> +		int instance_id = get_##type##_instance_id(kobj);	\
> +									\
> +		if (instance_id < 0)					\
> +			return 0;					\
> +									\
> +		for (i = 0; i < bioscfg_drv.type##_data[instance_id].name##_size; i++) { \
> +			if (i)						\
> +				len += sysfs_emit_at(buf, len, "%s", ";"); \
> +									\
> +			len += sysfs_emit_at(buf, len, "%s",		\
> +					     bioscfg_drv.type##_data[instance_id].name[i]); \
> +		}							\
> +		len += sysfs_emit_at(buf, len, "\n");			\
> +		return len;						\
> +	}
> +
> +/*
> + * Prototypes
> + */
> +union acpi_object *get_wmiobj_pointer(int instance_id, const char *guid_string);
> +int get_instance_count(const char *guid_string);
> +void update_attribute_permissions(u32 isReadOnly, struct kobj_attribute *current_val);
> +void friendly_user_name_update(char *path, const char *attr_name,
> +			       char *attr_display, int attr_size);
> +
> +/* String attributes */
> +int populate_string_buffer_data(u8 *buffer_ptr, int *buffer_size,
> +				int instance_id,
> +				struct kobject *attr_name_kobj);
> +
> +int populate_string_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
> +					 int instance_id,
> +					 enum hp_wmi_data_type type);
> +int alloc_string_data(void);
> +void exit_string_attributes(void);
> +int populate_string_package_data(union acpi_object *str_obj,
> +				 int instance_id,
> +				 struct kobject *attr_name_kobj);
> +int populate_string_elements_from_package(union acpi_object *str_obj,
> +					  int str_obj_count,
> +					  int instance_id,
> +					  enum hp_wmi_data_type type);
> +
> +/* Integer attributes */
> +int populate_integer_buffer_data(u8 *buffer_ptr, int *buffer_size,
> +				 int instance_id,
> +				 struct kobject *attr_name_kobj);
> +int populate_integer_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
> +					  int instance_id,
> +					  enum hp_wmi_data_type type);
> +int alloc_integer_data(void);
> +void exit_integer_attributes(void);
> +int populate_integer_package_data(union acpi_object *integer_obj,
> +				  int instance_id,
> +				  struct kobject *attr_name_kobj);
> +int populate_integer_elements_from_package(union acpi_object *integer_obj,
> +					   int integer_obj_count,
> +					   int instance_id,
> +					   enum hp_wmi_data_type type);
> +
> +/* Enumeration attributes */
> +int populate_enumeration_buffer_data(u8 *buffer_ptr, int *buffer_size,
> +				     int instance_id,
> +				     struct kobject *attr_name_kobj);
> +int populate_enumeration_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
> +					      int instance_id,
> +					      enum hp_wmi_data_type type);
> +int alloc_enumeration_data(void);
> +void exit_enumeration_attributes(void);
> +int populate_enumeration_package_data(union acpi_object *enum_obj,
> +				      int instance_id,
> +				      struct kobject *attr_name_kobj);
> +int populate_enumeration_elements_from_package(union acpi_object *enum_obj,
> +					       int enum_obj_count,
> +					       int instance_id,
> +					       enum hp_wmi_data_type type);
> +
> +/* Ordered list */
> +int populate_ordered_list_buffer_data(u8 *buffer_ptr,
> +				      int *buffer_size,
> +				      int instance_id,
> +				      struct kobject *attr_name_kobj);
> +int populate_ordered_list_elements_from_buffer(u8 *buffer_ptr,
> +					       int *buffer_size,
> +					       int instance_id,
> +					       enum hp_wmi_data_type type);
> +int alloc_ordered_list_data(void);
> +void exit_ordered_list_attributes(void);
> +int populate_ordered_list_package_data(union acpi_object *order_obj,
> +				       int instance_id,
> +				       struct kobject *attr_name_kobj);
> +int populate_ordered_list_elements_from_package(union acpi_object *order_obj,
> +						int order_obj_count,
> +						int instance_id,
> +						enum hp_wmi_data_type type);
> +
> +/* Password authentication attributes */
> +int populate_password_buffer_data(u8 *buffer_ptr, int *buffer_size,
> +				  int instance_id,
> +				  struct kobject *attr_name_kobj);
> +int populate_password_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
> +					   int instance_id,
> +					   enum hp_wmi_data_type type);
> +int populate_password_package_data(union acpi_object *password_obj,
> +				   int instance_id,
> +				   struct kobject *attr_name_kobj);
> +int populate_password_elements_from_package(union acpi_object *password_obj,
> +					    int password_obj_count,
> +					    int instance_id,
> +					    enum hp_wmi_data_type type);
> +int alloc_password_data(void);
> +int alloc_secure_platform_data(void);
> +void exit_password_attributes(void);
> +void exit_secure_platform_attributes(void);
> +int populate_secure_platform_data(struct kobject *attr_name_kobj);
> +int password_is_set(const char *auth);
> +int check_spm_is_enabled(void);
> +int hp_wmi_set_bios_setting(u16 *input_buffer, u32 input_size);
> +int hp_wmi_perform_query(int query, enum hp_wmi_command command,
> +			 void *buffer, int insize, int outsize);
> +
> +/* Sure Start attributes */
> +void exit_sure_start_attributes(void);
> +int populate_sure_start_data(struct kobject *attr_name_kobj);
> +
> +int set_bios_defaults(u8 defType);
> +int get_password_instance_for_type(const char *name);
> +int clear_all_credentials(void);
> +int clear_passwords(const int instance);
> +void exit_bios_attr_set_interface(void);
> +int init_bios_attr_set_interface(void);
> +size_t bioscfg_calculate_string_buffer(const char *str);
> +size_t calculate_security_buffer(const char *authentication);
> +void populate_security_buffer(u16 *buffer, const char *authentication);
> +int set_new_password(const char *password_type, const char *new_password);
> +int init_bios_attr_pass_interface(void);
> +void exit_bios_attr_pass_interface(void);
> +void *ascii_to_utf16_unicode(u16 *p, const u8 *str);
> +int get_integer_from_buffer(int **buffer, int *buffer_size, int *integer);
> +int get_string_from_buffer(u8 **buffer, int *buffer_size, char *dst, int dst_size);
> +int convert_hexstr_to_str(const char *input, int input_len, char **str, int *len);
> +int encode_outsize_for_pvsz(int outsize);
> +int hp_set_attribute(const char *a_name, const char *a_value);
> +
> +#endif
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> new file mode 100644
> index 000000000000..0bc2c19344d5
> --- /dev/null
> +++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> @@ -0,0 +1,553 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Functions corresponding to enumeration type attributes under
> + * BIOS Enumeration GUID for use with hp-bioscfg driver.
> + *
> + *  Copyright (c) 2022 HP Development Company, L.P.
> + */
> +
> +#include "bioscfg.h"
> +
> +get_instance_id(enumeration);
> +
> +static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	int instance_id = get_enumeration_instance_id(kobj);
> +	ssize_t ret;
> +
> +	if (instance_id < 0)
> +		return -EIO;
> +
> +	ret = sysfs_emit(buf, "%s\n",
> +			 bioscfg_drv.enumeration_data[instance_id].current_value);
> +
> +	return ret;
> +}
> +
> +/*
> + * validate_enumeration_input() -
> + * Validate input of current_value against possible values
> + *
> + * @instance_id: The instance on which input is validated
> + * @buf: Input value
> + */
> +static int validate_enumeration_input(int instance_id, const char *buf)
> +{
> +	int ret = 0;
> +	int found = 0;
> +	int i;
> +	int possible_values;
> +
> +	/* Is it a read only attribute */
> +	if (bioscfg_drv.enumeration_data[instance_id].is_readonly)
> +		return -EIO;
> +
> +	possible_values = bioscfg_drv.enumeration_data[instance_id].possible_values_size;
> +	for (i = 0; i < possible_values && !found; i++)
> +		if (!strcasecmp(bioscfg_drv.enumeration_data[instance_id].possible_values[i], buf))
> +			found = 1;
> +
> +	if (!found) {
> +		ret = -EINVAL;
> +		goto exit_validate_enum_input;
> +	}
> +
> +	/*
> +	 * set pending reboot flag depending on
> +	 * "RequiresPhysicalPresence" value
> +	 */
> +	if (bioscfg_drv.enumeration_data[instance_id].requires_physical_presence)
> +		bioscfg_drv.pending_reboot = TRUE;
> +
> +exit_validate_enum_input:
> +	return ret;
> +}
> +
> +static void update_enumeration_value(int instance_id, char *attr_value)
> +{
> +	strscpy(bioscfg_drv.enumeration_data[instance_id].current_value,
> +		attr_value,
> +		sizeof(bioscfg_drv.enumeration_data[instance_id].current_value));
> +}
> +
> +attribute_s_property_show(display_name_language_code, enumeration);
> +static struct kobj_attribute enumeration_display_langcode =
> +		__ATTR_RO(display_name_language_code);
> +
> +attribute_s_property_show(display_name, enumeration);
> +static struct kobj_attribute  enumeration_display_name =
> +		__ATTR_RO(display_name);
> +
> +attribute_property_store(current_value, enumeration);
> +static struct kobj_attribute enumeration_current_val =
> +	__ATTR_RW_MODE(current_value, 0644);
> +
> +attribute_n_property_show(prerequisites_size, enumeration);
> +static struct kobj_attribute  enumeration_prerequisites_size_val =
> +		__ATTR_RO(prerequisites_size);
> +
> +attribute_values_property_show(prerequisites, enumeration);
> +static struct kobj_attribute  enumeration_prerequisites_val =
> +		__ATTR_RO(prerequisites);
> +
> +attribute_n_property_show(possible_values_size, enumeration);
> +static struct kobj_attribute  enumeration_possible_values_size_val =
> +		__ATTR_RO(possible_values_size);
> +
> +attribute_values_property_show(possible_values, enumeration);
> +static struct kobj_attribute  enumeration_poss_val =
> +		__ATTR_RO(possible_values);
> +
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	return sysfs_emit(buf, "enumeration\n");
> +}
> +static struct kobj_attribute enumeration_type =
> +		__ATTR_RO(type);
> +
> +static struct attribute *enumeration_attrs[] = {
> +	&enumeration_display_langcode.attr,
> +	&enumeration_display_name.attr,
> +	&enumeration_current_val.attr,
> +	&enumeration_prerequisites_size_val.attr,
> +	&enumeration_prerequisites_val.attr,
> +	&enumeration_possible_values_size_val.attr,
> +	&enumeration_poss_val.attr,
> +	&enumeration_type.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group enumeration_attr_group = {
> +	.attrs = enumeration_attrs,
> +};
> +
> +int alloc_enumeration_data(void)
> +{
> +	int ret = 0;
> +
> +	bioscfg_drv.enumeration_instances_count =
> +		get_instance_count(HP_WMI_BIOS_ENUMERATION_GUID);
> +
> +	bioscfg_drv.enumeration_data = kcalloc(bioscfg_drv.enumeration_instances_count,
> +					       sizeof(struct enumeration_data), GFP_KERNEL);
> +	if (!bioscfg_drv.enumeration_data) {
> +		bioscfg_drv.enumeration_instances_count = 0;
> +		ret = -ENOMEM;
> +	}
> +	return ret;
> +}
> +
> +/* Expected Values types associated with each element */
> +static acpi_object_type expected_enum_types[] = {
> +	[NAME] = ACPI_TYPE_STRING,
> +	[VALUE] = ACPI_TYPE_STRING,
> +	[PATH] = ACPI_TYPE_STRING,
> +	[IS_READONLY] = ACPI_TYPE_INTEGER,
> +	[DISPLAY_IN_UI] = ACPI_TYPE_INTEGER,
> +	[REQUIRES_PHYSICAL_PRESENCE] = ACPI_TYPE_INTEGER,
> +	[SEQUENCE] = ACPI_TYPE_INTEGER,
> +	[PREREQUISITES_SIZE] = ACPI_TYPE_INTEGER,
> +	[PREREQUISITES] = ACPI_TYPE_STRING,
> +	[SECURITY_LEVEL] = ACPI_TYPE_INTEGER,
> +	[ENUM_CURRENT_VALUE] = ACPI_TYPE_STRING,
> +	[ENUM_SIZE] = ACPI_TYPE_INTEGER,
> +	[ENUM_POSSIBLE_VALUES] = ACPI_TYPE_STRING
> +};
> +
> +/*
> + * populate_enumeration_package_data() -
> + * Populate all properties of an instance under enumeration attribute
> + *
> + * @enum_obj: ACPI object with enumeration data
> + * @instance_id: The instance to enumerate
> + * @attr_name_kobj: The parent kernel object
> + */
> +int populate_enumeration_package_data(union acpi_object *enum_obj,
> +				      int instance_id,
> +				      struct kobject *attr_name_kobj)
> +{
> +	bioscfg_drv.enumeration_data[instance_id].attr_name_kobj = attr_name_kobj;
> +
> +	populate_enumeration_elements_from_package(enum_obj,
> +						   enum_obj->package.count,
> +						   instance_id,
> +						   HPWMI_ENUMERATION_TYPE);
> +	update_attribute_permissions(bioscfg_drv.enumeration_data[instance_id].is_readonly,
> +				     &enumeration_current_val);
> +	/*
> +	 * Several attributes have names such "MONDAY".  Friendly
> +	 * user nane is generated to make the name more descriptive
> +	 */
> +	friendly_user_name_update(bioscfg_drv.enumeration_data[instance_id].path,
> +				  attr_name_kobj->name,
> +				  bioscfg_drv.enumeration_data[instance_id].display_name,
> +				  sizeof(bioscfg_drv.enumeration_data[instance_id].display_name));
> +	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
> +}
> +
> +int populate_enumeration_elements_from_package(union acpi_object *enum_obj,
> +					       int enum_obj_count,
> +					       int instance_id,
> +					       enum hp_wmi_data_type type)
> +{
> +	char *str_value = NULL;
> +	int value_len;
> +	u32 size = 0;
> +	u32 int_value;
> +	int elem = 0;
> +	int reqs;
> +	int pos_values;
> +	int ret;
> +	int eloc;
> +
> +	strscpy(bioscfg_drv.enumeration_data[instance_id].display_name_language_code,
> +		LANG_CODE_STR,
> +		sizeof(bioscfg_drv.enumeration_data[instance_id].display_name_language_code));
> +
> +	for (elem = 1, eloc = 1; elem < enum_obj_count; elem++, eloc++) {
> +
> +		/* ONLY look at the first 'hp_wmi_elements_count[type]' elements */
> +		if (eloc == hp_wmi_elements_count[type])
> +			goto exit_enumeration_package;
> +
> +		switch (enum_obj[elem].type) {
> +		case ACPI_TYPE_STRING:
> +
> +			if (PREREQUISITES != elem && ENUM_POSSIBLE_VALUES != elem) {
> +				ret = convert_hexstr_to_str(enum_obj[elem].string.pointer,
> +							    enum_obj[elem].string.length,
> +							    &str_value, &value_len);
> +				if (ret)
> +					return -EINVAL;
> +
> +			}
> +			break;
> +		case ACPI_TYPE_INTEGER:
> +			int_value = (u32)enum_obj[elem].integer.value;
> +			break;
> +		default:
> +			pr_warn("Unsupported object type [%d]\n", enum_obj[elem].type);
> +			continue;
> +		}
> +
> +		/* Check that both expected and read object type match */
> +		if (expected_enum_types[eloc] != enum_obj[elem].type) {
> +			pr_err("Error expected type %d for elem  %d, but got type %d instead\n",
> +			       expected_enum_types[eloc], elem, enum_obj[elem].type);
> +			return -EIO;
> +		}
> +
> +		/* Assign appropriate element value to corresponding field */
> +		switch (eloc) {
> +		case NAME:
> +		case VALUE:
> +			break;
> +		case PATH:
> +			strscpy(bioscfg_drv.enumeration_data[instance_id].path, str_value,
> +				sizeof(bioscfg_drv.enumeration_data[instance_id].path));
> +			break;
> +		case IS_READONLY:
> +			bioscfg_drv.enumeration_data[instance_id].is_readonly = int_value;
> +			break;
> +		case DISPLAY_IN_UI:
> +			bioscfg_drv.enumeration_data[instance_id].display_in_ui = int_value;
> +			break;
> +		case REQUIRES_PHYSICAL_PRESENCE:
> +			bioscfg_drv.enumeration_data[instance_id].requires_physical_presence = int_value;
> +			break;
> +		case SEQUENCE:
> +			bioscfg_drv.enumeration_data[instance_id].sequence = int_value;
> +			break;
> +		case PREREQUISITES_SIZE:
> +			bioscfg_drv.enumeration_data[instance_id].prerequisites_size = int_value;
> +			if (int_value > MAX_PREREQUISITES_SIZE)
> +				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
> +
> +			/*
> +			 * This HACK is needed to keep the expected
> +			 * element list pointing to the right obj[elem].type
> +			 * when the size is zero.  PREREQUISITES
> +			 * object is omitted by BIOS when the size is
> +			 * zero.
> +			 */
> +			if (int_value == 0)
> +				eloc++;
> +			break;
> +
> +		case PREREQUISITES:
> +
> +			size = bioscfg_drv.enumeration_data[instance_id].prerequisites_size;
> +
> +			for (reqs = 0; reqs < size && reqs < MAX_PREREQUISITES_SIZE; reqs++) {
> +				if (elem >= enum_obj_count) {
> +					pr_err("Error enum-objects package is too small\n");
> +					return -EINVAL;
> +				}
> +
> +				ret = convert_hexstr_to_str(enum_obj[elem + reqs].string.pointer,
> +							    enum_obj[elem + reqs].string.length,
> +							    &str_value, &value_len);
> +
> +				if (ret)
> +					return -EINVAL;
> +
> +				strlcpy(bioscfg_drv.enumeration_data[instance_id].prerequisites[reqs],
> +					str_value,
> +					sizeof(bioscfg_drv.enumeration_data[instance_id].prerequisites[reqs]));
> +
> +				kfree(str_value);
> +				str_value = NULL;
> +			}
> +			break;
> +
> +		case SECURITY_LEVEL:
> +			bioscfg_drv.enumeration_data[instance_id].security_level = int_value;
> +			break;
> +
> +		case ENUM_CURRENT_VALUE:
> +			strscpy(bioscfg_drv.enumeration_data[instance_id].current_value,
> +				str_value, sizeof(bioscfg_drv.enumeration_data[instance_id].current_value));
> +			break;
> +		case ENUM_SIZE:
> +			bioscfg_drv.enumeration_data[instance_id].possible_values_size = int_value;
> +			if (int_value > MAX_VALUES_SIZE)
> +				pr_warn("Possible number values size value exceeded the maximum number of elements supported or data may be malformed\n");
> +
> +			/*
> +			 * This HACK is needed to keep the expected
> +			 * element list pointing to the right obj[elem].type
> +			 * when the size is zero.  POSSIBLE_VALUES
> +			 * object is omitted by BIOS when the size is zero.
> +			 */
> +			if (int_value == 0)
> +				eloc++;
> +			break;
> +
> +		case ENUM_POSSIBLE_VALUES:
> +			size = bioscfg_drv.enumeration_data[instance_id].possible_values_size;
> +
> +			for (pos_values = 0; pos_values < size && pos_values < MAX_VALUES_SIZE; pos_values++) {
> +				if (elem >= enum_obj_count) {
> +					pr_err("Error enum-objects package is too small\n");
> +					return -EINVAL;
> +				}
> +
> +				ret = convert_hexstr_to_str(enum_obj[elem + pos_values].string.pointer,
> +							    enum_obj[elem  + pos_values].string.length,
> +							    &str_value, &value_len);
> +
> +				if (ret)
> +					return -EINVAL;
> +
> +				/*
> +				 * ignore strings when possible values size
> +				 * is greater than  MAX_VALUES_SIZE
> +				 */
> +				if (size < MAX_VALUES_SIZE)
> +					strlcpy(bioscfg_drv.enumeration_data[instance_id].possible_values[pos_values],
> +						str_value,
> +						sizeof(bioscfg_drv.enumeration_data[instance_id].possible_values[pos_values]));
> +
> +				kfree(str_value);
> +				str_value = NULL;
> +			}
> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in Enumeration attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +
> +		kfree(str_value);
> +		str_value = NULL;
> +	}
> +
> +exit_enumeration_package:
> +	kfree(str_value);
> +	str_value = NULL;
> +	return 0;
> +}
> +
> +/*
> + * populate_enumeration_buffer_data() -
> + * Populate all properties of an instance under enumeration attribute
> + *
> + * @buffer_ptr: Buffer pointer
> + * @buffer_size: Buffer size
> + * @enum_obj: ACPI object with enumeration data
> + * @instance_id: The instance to enumerate
> + * @attr_name_kobj: The parent kernel object
> + * @enumeration_property_count: Total properties count under enumeration type
> + */
> +int populate_enumeration_buffer_data(u8 *buffer_ptr, int *buffer_size,
> +				     int instance_id,
> +				     struct kobject *attr_name_kobj)
> +{
> +
> +	bioscfg_drv.enumeration_data[instance_id].attr_name_kobj = attr_name_kobj;
> +
> +	/* Populate enumeration elements */
> +	populate_enumeration_elements_from_buffer(buffer_ptr, buffer_size,
> +						  instance_id,
> +						  HPWMI_ENUMERATION_TYPE);
> +
> +	update_attribute_permissions(bioscfg_drv.enumeration_data[instance_id].is_readonly,
> +				     &enumeration_current_val);
> +	/*
> +	 * Several attributes have names such "MONDAY". A Friendlier
> +	 * user nane is generated to make the name more descriptive
> +	 */
> +	friendly_user_name_update(bioscfg_drv.enumeration_data[instance_id].path,
> +				  attr_name_kobj->name,
> +				  bioscfg_drv.enumeration_data[instance_id].display_name,
> +				  sizeof(bioscfg_drv.enumeration_data[instance_id].display_name));
> +
> +	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
> +}
> +
> +int populate_enumeration_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
> +					      int instance_id,
> +					      enum hp_wmi_data_type type)
> +{
> +	char *dst = NULL;
> +	int elem;
> +	int reqs;
> +	int integer;
> +	int size = 0;
> +	int values;
> +	int ret;
> +	int dst_size = *buffer_size / sizeof(u16);
> +
> +	dst = kcalloc(dst_size, sizeof(char), GFP_KERNEL);
> +	if (!dst)
> +		return -ENOMEM;
> +
> +	elem = 0;
> +
> +	strscpy(bioscfg_drv.enumeration_data[instance_id].display_name_language_code,
> +		LANG_CODE_STR,
> +		sizeof(bioscfg_drv.enumeration_data[instance_id].display_name_language_code));
> +
> +	for (elem = 1; elem < 3; elem++) {
> +
> +		ret = get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
> +		/* Ignore. Zero length string values */
> +		if (ret < 0)
> +			continue;
> +
> +		switch (elem) {
> +		case VALUE:
> +			/* Skip 'Value' since 'CurrentValue' is reported. */
> +			break;
> +		case PATH:
> +			strscpy(bioscfg_drv.enumeration_data[instance_id].path,
> +				dst, sizeof(bioscfg_drv.enumeration_data[instance_id].path));
> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in Enumeration attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +	}
> +
> +	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
> +		if (PREREQUISITES != elem && ENUM_CURRENT_VALUE != elem && ENUM_POSSIBLE_VALUES != elem) {
> +			ret = get_integer_from_buffer((int **)&buffer_ptr, buffer_size, (int *)&integer);
> +			if (ret < 0)
> +				continue;
> +		}
> +
> +		switch (elem) {
> +		case IS_READONLY:
> +			bioscfg_drv.enumeration_data[instance_id].is_readonly = integer;
> +			break;
> +		case DISPLAY_IN_UI:
> +			bioscfg_drv.enumeration_data[instance_id].display_in_ui = integer;
> +			break;
> +		case REQUIRES_PHYSICAL_PRESENCE:
> +			bioscfg_drv.enumeration_data[instance_id].requires_physical_presence = integer;
> +			break;
> +		case SEQUENCE:
> +			bioscfg_drv.enumeration_data[instance_id].sequence = integer;
> +			break;
> +		case PREREQUISITES_SIZE:
> +			bioscfg_drv.enumeration_data[instance_id].prerequisites_size = integer;
> +			if (integer > MAX_PREREQUISITES_SIZE)
> +				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
> +
> +			// PREREQUISITES:
> +			elem++;
> +
> +			size = bioscfg_drv.enumeration_data[instance_id].prerequisites_size;
> +			for (reqs = 0; reqs < size && reqs < MAX_PREREQUISITES_SIZE; reqs++) {
> +				ret = get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
> +				/* Ignore. expect zero length strings at the end of prerequisite values */
> +				if (ret < 0)
> +					continue;
> +
> +				strscpy(bioscfg_drv.enumeration_data[instance_id].prerequisites[reqs],
> +					dst,
> +					sizeof(bioscfg_drv.enumeration_data[instance_id].prerequisites[reqs]));
> +			}
> +			break;
> +		case SECURITY_LEVEL:
> +			bioscfg_drv.enumeration_data[instance_id].security_level = integer;
> +			break;
> +		case ENUM_CURRENT_VALUE:
> +			ret = get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
> +			if (ret < 0)
> +				continue;
> +
> +			strscpy(bioscfg_drv.enumeration_data[instance_id].current_value,
> +				dst,
> +				sizeof(bioscfg_drv.enumeration_data[instance_id].current_value));
> +			break;
> +		case ENUM_SIZE:
> +			bioscfg_drv.enumeration_data[instance_id].possible_values_size = integer;
> +			if (integer > MAX_VALUES_SIZE)
> +				pr_warn("Possible size value exceeded the maximum number of elements supported or data may be malformed\n");
> +
> +			// ENUM_POSSIBLE_VALUES:
> +			elem++;
> +
> +			size = bioscfg_drv.enumeration_data[instance_id].possible_values_size;
> +			for (values = 0; values < size && values < MAX_VALUES_SIZE; values++) {
> +				ret = get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
> +				/* Ignore expect zero size strings at the end of all possible values */
> +				if (ret < 0)
> +					continue;
> +
> +				strscpy(bioscfg_drv.enumeration_data[instance_id].possible_values[values],
> +					dst,
> +					sizeof(bioscfg_drv.enumeration_data[instance_id].possible_values[values]));
> +			}
> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in Enumeration attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +	}
> +
> +	kfree(dst);
> +
> +	return 0;
> +}
> +
> +/**
> + * exit_enumeration_attributes() - Clear all attribute data
> + *
> + * Clears all data allocated for this group of attributes
> + */
> +void exit_enumeration_attributes(void)
> +{
> +	int instance_id;
> +
> +	for (instance_id = 0; instance_id < bioscfg_drv.enumeration_instances_count; instance_id++) {
> +		if (bioscfg_drv.enumeration_data[instance_id].attr_name_kobj)
> +			sysfs_remove_group(bioscfg_drv.enumeration_data[instance_id].attr_name_kobj,
> +					   &enumeration_attr_group);
> +	}
> +	bioscfg_drv.enumeration_instances_count = 0;
> +
> +	kfree(bioscfg_drv.enumeration_data);
> +	bioscfg_drv.enumeration_data = NULL;
> +}
> -- 
> 2.34.1
> 
