Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379ABC54E94
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Jan 2023 14:33:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjAYOdI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 09:33:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235427AbjAYOdH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 09:33:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3379CC67C
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 06:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674657146;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4UJaNEcvQJmRBoqqoKWSuzRGai5JB2e+GlnaCD7o40M=;
        b=W3w/lsk7GYc/wBeAzbPnwBMb8Wqe4o85KHPRqah9lpxFIbTAsEgON4XXj0AXNbNCXpWxhU
        xbK6F7rMg3FrJ2jmU9EvaJNCGlFpsNWRz2rhv5/mb+OWEu13TNP6/5qDwZ9g4SMsYPfcjR
        HdXSO2M0AsTmGqIT9SJxeG8/Giftl/A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-EhCx8Rw-OMCkQjo6n2IaaA-1; Wed, 25 Jan 2023 09:32:25 -0500
X-MC-Unique: EhCx8Rw-OMCkQjo6n2IaaA-1
Received: by mail-ed1-f69.google.com with SMTP id y21-20020a056402359500b0049e171c4ad0so12954080edc.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 06:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4UJaNEcvQJmRBoqqoKWSuzRGai5JB2e+GlnaCD7o40M=;
        b=uBXI79iVQFTE23vhw8qP8n/pSEmVylUKrcRaxN1oR42AQcwCL9yTyjvKUeYfjQwajZ
         WO98iIv4bBfDrbKsYPQoy59DwyyF1mn3R1pW5pd7FeGkl/DutZIuBGhpmzHIPF1l68cb
         B9YiVuapySGkjQAc1M4DBFUuV7yTx9HLk8lBTTluRlV8j6FBQpCuJgpjcW+ulWjuPyJ9
         /t7RoDjjmZ1NDBWbxpovQV4iHHTUxV0VabRI1uNWfxI9ts3Xev4Z4vwwrW2BVs20ZIeV
         NEnpz4z28tqXLTqIL3RcIx+ebtTfmADt0KkgbLi1FChOte3kiVVZckwnVcWgFwFTnfu6
         kENQ==
X-Gm-Message-State: AFqh2ko6ftBciQ1mvMa0ANHG1CmLHu+Q3QSh/4xKT8clsrveMjvdjTLs
        4ykyXAZaOVVdu+HuUiEuhPEmdTrYtmLl5VLUJBAJJtXjR47CFkaofPLj1rS0As46yiGdbdCLEK1
        aVByoaGxtBF/Yec1pWRFZPjyw0BK34o+eVA==
X-Received: by 2002:a17:906:b305:b0:86e:8b7b:adb9 with SMTP id n5-20020a170906b30500b0086e8b7badb9mr30318847ejz.34.1674657143592;
        Wed, 25 Jan 2023 06:32:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuf5MVBHLdIvcBbUQbJ8zNDVizJQEg9OBnrwlU1TIEyvO1sj4wK4kGoAeHPr0LtUi6WqhnMtA==
X-Received: by 2002:a17:906:b305:b0:86e:8b7b:adb9 with SMTP id n5-20020a170906b30500b0086e8b7badb9mr30318820ejz.34.1674657143145;
        Wed, 25 Jan 2023 06:32:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lv3-20020a170906bc8300b0087848a5daf5sm85116ejb.225.2023.01.25.06.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 06:32:22 -0800 (PST)
Message-ID: <f1cd6de8-094f-f624-5151-7c3de3b07402@redhat.com>
Date:   Wed, 25 Jan 2023 15:32:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 3/5] Introduction of HP-BIOSCFG driver (3)
Content-Language: en-US, nl
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20221202173616.180108-1-jorge.lopez2@hp.com>
 <20221202173616.180108-4-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221202173616.180108-4-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Detailed review inline.

On 12/2/22 18:36, Jorge Lopez wrote:
> The purpose for this patch is submit HP BIOSCFG driver to be list of
> HP Linux kernel drivers.  The driver include a total of 12 files
> broken in several patches.  This is set 1 of 4.
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
> Version 5
> 	Remove version 4 patch 1
> 	Address review changes proposed in Version 4
> 	Reorganize all patches number and file order
> ---
>  .../x86/hp/hp-bioscfg/enum-attributes.c       | 499 ++++++++++++++++
>  .../x86/hp/hp-bioscfg/int-attributes.c        | 450 ++++++++++++++
>  .../x86/hp/hp-bioscfg/ordered-attributes.c    | 549 ++++++++++++++++++
>  3 files changed, 1498 insertions(+)
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> new file mode 100644
> index 000000000000..5ef81daf0099
> --- /dev/null
> +++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> @@ -0,0 +1,499 @@
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
> +			    bioscfg_drv.enumeration_data[instance_id].current_value);
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
> +	char *options = NULL;
> +	char *p;
> +	int ret = 0;
> +	int found = 0;
> +
> +	/* Is it a read only attribute */
> +	if (bioscfg_drv.enumeration_data[instance_id].is_readonly)
> +		return -EIO;
> +
> +	options = kstrdup(bioscfg_drv.enumeration_data[instance_id].possible_values,
> +			  GFP_KERNEL);
> +
> +	if (!options) {
> +		ret = -ENOMEM;
> +		goto exit_validate_enum_input;
> +	}
> +
> +
> +	while ((p = strsep(&options, ";")) != NULL) {
> +		if (!*p)
> +			continue;
> +
> +		if (!strcasecmp(p, buf)) {
> +			found = 1;
> +			break;
> +		}
> +	}
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
> +	kfree(options);
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
> +attribute_s_property_show(possible_values, enumeration);
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
> +					sizeof(struct enumeration_data), GFP_KERNEL);
> +	if (!bioscfg_drv.enumeration_data) {
> +		bioscfg_drv.enumeration_instances_count = 0;
> +		ret = -ENOMEM;
> +	}
> +	return ret;
> +}
> +
> +/*
> + * populate_enumeration_package_data() -
> + * Populate all properties of an instance under enumeration attribute
> + *
> + * @enum_obj: ACPI object with enumeration data
> + * @instance_id: The instance to enumerate
> + * @attr_name_kobj: The parent kernel object
> + */
> +int populate_enumeration_package_data(union acpi_object *enum_obj, int instance_id,
> +			struct kobject *attr_name_kobj)

Please indent this so that the s of struct is aligned directly after the ( of (union.

> +{
> +	bioscfg_drv.enumeration_data[instance_id].type = HPWMI_ENUMERATION_TYPE;

The type member of struct enumeration_data is only ever set and never read,
please drop the type member of struct enumeration_data.

*And also do the same for the type member of all the other foo_data structs*

> +	bioscfg_drv.enumeration_data[instance_id].attr_name_kobj = attr_name_kobj;
> +
> +	populate_enumeration_elements_from_package(enum_obj, instance_id, HPWMI_ENUMERATION_TYPE);
> +	update_attribute_permissions(bioscfg_drv.enumeration_data[instance_id].is_readonly,
> +				     &enumeration_current_val);
> +	/*
> +	 * Several attributes have names such "MONDAY".  Friendly
> +	 * user nane is generated to make the name more descriptive
> +	 */
> +	friendly_user_name_update(bioscfg_drv.enumeration_data[instance_id].path,
> +				  attr_name_kobj->name,
> +				   bioscfg_drv.enumeration_data[instance_id].display_name,
> +				   sizeof(bioscfg_drv.enumeration_data[instance_id].display_name));
> +	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
> +}
> +
> +int populate_enumeration_elements_from_package(union acpi_object *enum_obj,

This needs to be passed the obj->package.count value from hp_init_bios_attributes()
so that it can verify that it does not go out of bounds when getting
the possible values, so this needs:

					   int enum_obj_count,

as extra parameter.


> +					   int instance_id,
> +					   enum hp_wmi_data_type type)
> +{
> +	char *str_value = NULL;
> +	int value_len;
> +	int status = 0;
> +	u32 size = 0;
> +	u32 int_value;
> +	int elem = 0;
> +	int reqs;
> +	int eloc;
> +	int pos_values;
> +
> +	strscpy(bioscfg_drv.enumeration_data[instance_id].display_name_language_code,
> +		LANG_CODE_STR,
> +		sizeof(bioscfg_drv.enumeration_data[instance_id].display_name_language_code));
> +
> +	for (elem = 1, eloc = 1; elem < hp_wmi_elements_count[type]; elem++, eloc++) {

You should use " < enum_obj_count" here.

> +
> +		switch (enum_obj[elem].type) {
> +		case ACPI_TYPE_STRING:
> +
> +			if (PREREQUISITES != elem && ENUM_POSSIBLE_VALUES != elem) {
> +				status = convert_hexstr_to_str(&enum_obj[elem].string.pointer,
> +							       enum_obj[elem].string.length,
> +							       &str_value, &value_len);
> +				if (ACPI_FAILURE(status))
> +					continue;

convert_hexstr_to_str() returns a regular errno value, e.g. -EINVAL. So:

1. The value to store the result should not be named status since this is
not an ACPI status, please use "err" or "ret" instead.

2. Since this is not an ACPI status you must NOT use ACPI_FAILURE(status),
instead use e.g.:

				if (err)
					continue;

3. Why continue? Continuing will leave some elements of enumeration_data[instance_id]
unset which will later on give problems. Why not return the error to abort the probe
(since this should never happen) ?

*And also do the same for all the other convert_hexstr_to_str() callers*

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
> +		/* stop if extra counter is greater than total number
> +		 * of elements for enumeration type
> +		 */
> +		if (eloc == hp_wmi_elements_count[type])
> +			goto exit_enumeration_package;
> +
> +		/* Assign appropriate element value to corresponding field*/
> +		switch (eloc) {
> +		case VALUE:
> +			break;
> +		case PATH:
> +			strscpy(bioscfg_drv.enumeration_data[instance_id].path, str_value,
> +				sizeof(bioscfg_drv.enumeration_data[instance_id].path));
> +			break;

Over here you are assuming that str_value is set, but there is no verification that
the type you did the switch-case on above is actually the type you are expecting for this
eloc value.

So you need to add an array with types for each eloc and then even before doing
the switch (enum_obj[elem].type) check things match.

E.g. something like this:

	acpi_object_type expected_types[] = {
		[PATH]		= ACPI_TYPE_STRING,
		[IS_READONLY]	= ACPI_TYPE_INTEGER,
		...
	};

and then in the loop, before even trying to get the string / int :

		if (enum_obj[elem].type != expected_types[eloc]) {
			pr_err("Error expected type %d for eloc %d, but got type %d instead\n",
			       expected_types[eloc], eloc, enum_obj[elem].type);
			return -EINVAL; /* or maybe -EIO ? */
		}


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
> +		case PREREQUISITE_SIZE:
> +			bioscfg_drv.enumeration_data[instance_id].prerequisitesize = int_value;
> +			if (int_value > 20)
> +				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");

I see this 20 in a bunch of places, please add a #define for this.

> +			/*
> +			 * prerequisites element is omitted when
> +			 * prerequisitesSize value is zero.
> +			 */
> +			if (int_value == 0)
> +				eloc++;
> +			break;
> +		case PREREQUISITES:
> +			size = bioscfg_drv.enumeration_data[instance_id].prerequisitesize;
> +
> +			for (reqs = 0; reqs < size; reqs++) {
> +				status = convert_hexstr_to_str(&enum_obj[elem].string.pointer,
> +							       enum_obj[elem].string.length,
> +							       &str_value, &value_len);

Looking at the use of convert_hexstr_to_str() it gives
the impression that it is intended to move the string.pointer
pointer to the start of the next string. But looking at how
ENUM_POSSIBLE_VALUES is handled I believe that instead the
[elem] used above should be [elem + reqs] and I presume
that at the end this should do elem += (reqs - 1).

Looking at this together with the:

			if (int_value == 0)
				eloc++;

Bit I believe that the right thing to do would be to completely
drop PREREQUISITES as a separate value inside enum hp_wmi_data_elements
and make the PREREQUISITES_SIZE handling look like this:

		case PREREQUISITE_SIZE:
			bioscfg_drv.enumeration_data[instance_id].prerequisitesize = int_value;
			if (int_value > 20)
				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");

			size = bioscfg_drv.enumeration_data[instance_id].prerequisitesize;
			for (reqs = 0; reqs < size; reqs++) {
				elem++;
				if (elem >= enum_obj_count) {
					pr_err("Error enum-objects package is too small\n");
					return -EINVAL;
				}

				if (enum_obj[elem].type != ACPI_TYPE_STRING) {
					
				}

				err = convert_hexstr_to_str(&enum_obj[elem].string.pointer,
							    enum_obj[elem].string.length,
							    &str_value, &value_len);
				if (err)
					return -EINVAL;

				strlcat(bioscfg_drv.enumeration_data[instance_id].prerequisites,
					str_value,
					sizeof(bioscfg_drv.enumeration_data[instance_id].prerequisites));
				if (reqs != (size - 1))
					strlcat(bioscfg_drv.enumeration_data[instance_id].prerequisites, ";",
						sizeof(bioscfg_drv.enumeration_data[instance_id].prerequisites));

				kfree(str_value);
				str_value = NULL;
			}
			break;

This handles both reading the size as well as reading the pre-reqs in one
go incrementing the elem index for each pre-req as I think should be done,
while also bound-checking elem when increasing it.

And it removes the need for the if (int_value == 0) eloc++ hack.

###

Semi related to this, please also change the prototype of
convert_hexstr_to_str() ideally replace the hex + input_len
parameters with a single "union acpi_object *" parameter
and then move the type != ACPI_TYPE_STRING error check
to inside convert_hexstr_to_str().

If that for some reason does not work (I think it should
work) then please use "const char *hex" instead of "char **hex",
as first parameter since the input pointer is not changed,
there is no need to pass it by reference and the function should
also not change its input, hence the adding of the const.


> +				if (ACPI_FAILURE(status))
> +					break;
> +
> +				strlcat(bioscfg_drv.enumeration_data[instance_id].prerequisites,
> +					str_value,
> +					sizeof(bioscfg_drv.enumeration_data[instance_id].prerequisites));
> +				if (reqs != (size - 1))
> +					strlcat(bioscfg_drv.enumeration_data[instance_id].prerequisites, ";",
> +						sizeof(bioscfg_drv.enumeration_data[instance_id].prerequisites));
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
> +			bioscfg_drv.enumeration_data[instance_id].size = int_value;
> +			break;
> +		case ENUM_POSSIBLE_VALUES:
> +			size = bioscfg_drv.enumeration_data[instance_id].size;
> +			for (pos_values = 0; pos_values < size; pos_values++) {
> +				status = convert_hexstr_to_str(&enum_obj[elem + pos_values].string.pointer,
> +							       enum_obj[elem  + pos_values].string.length,
> +							       &str_value, &value_len);

Please fold this together with ENUM_SIZE, like how it is done for the pre-requisites.


> +				if (ACPI_FAILURE(status))
> +					break;
> +
> +				strlcat(bioscfg_drv.enumeration_data[instance_id].possible_values,
> +					str_value,
> +					sizeof(bioscfg_drv.enumeration_data[instance_id].possible_values));
> +				if (pos_values < (size - 1))
> +					strlcat(bioscfg_drv.enumeration_data[instance_id].possible_values, ";",
> +						sizeof(bioscfg_drv.enumeration_data[instance_id].possible_values));
> +				kfree(str_value);
> +				str_value = NULL;

Hmm, you are storing all the possible values in a ';' separated string here;
and then later parse that string inside validate_enumeration_input() can you
please use a (fixed size, say 16 entries?) array for possible values and store
the possible values in separate array entries?

This will greatly simplify validate_enumeration_input() and then replace

attribute_s_property_show(possible_values, enumeration);

with an actual show function which prints all the entries separated by ';'
using sysfs_emit_at() (see thinkpad.c for an example of how to use
sysfs_emit_at()).

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
> +		kfree(str_value);
> +		str_value = NULL;
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
> +	bioscfg_drv.enumeration_data[instance_id].type = HPWMI_ENUMERATION_TYPE;
> +	bioscfg_drv.enumeration_data[instance_id].attr_name_kobj = attr_name_kobj;
> +
> +	/* Populate enumeration elements */
> +	populate_enumeration_elements_from_buffer(buffer_ptr, buffer_size,
> +						  instance_id,
> +						  HPWMI_ENUMERATION_TYPE);
> +
> +	update_attribute_permissions(bioscfg_drv.enumeration_data[instance_id].is_readonly,
> +				    &enumeration_current_val);
> +	/*
> +	 * Several attributes have names such "MONDAY". A Friendlier
> +	 * user nane is generated to make the name more descriptive
> +	 */
> +	friendly_user_name_update(bioscfg_drv.enumeration_data[instance_id].path,
> +				  attr_name_kobj->name,
> +				   bioscfg_drv.enumeration_data[instance_id].display_name,
> +				   sizeof(bioscfg_drv.enumeration_data[instance_id].display_name));
> +
> +	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
> +}
> +
> +int populate_enumeration_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
> +					      int instance_id,
> +					      enum hp_wmi_data_type type)
> +{
> +	int status;
> +	char *str = NULL;
> +	int elem;
> +	int reqs;
> +	int integer;
> +	int size = 0;
> +	int values;
> +
> +	elem = 0;
> +
> +	strscpy(bioscfg_drv.enumeration_data[instance_id].display_name_language_code,
> +		LANG_CODE_STR,
> +		sizeof(bioscfg_drv.enumeration_data[instance_id].display_name_language_code));
> +
> +	for (elem = 1; elem < 3; elem++) {
> +
> +		status = get_string_from_buffer((u16 **)&buffer_ptr,
> +						buffer_size, &str);
> +		if (status < 0)
> +			continue;
> +
> +		switch (elem) {
> +		case VALUE:
> +			/* Skip 'Value' since 'CurrentValue' is reported. */
> +			break;
> +		case PATH:
> +			strscpy(bioscfg_drv.enumeration_data[instance_id].path,
> +				str, sizeof(bioscfg_drv.enumeration_data[instance_id].path));
> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in Enumeration attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +
> +		kfree(str);
> +		str = NULL;
> +	}
> +
> +	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
> +		if (PREREQUISITES != elem && ENUM_CURRENT_VALUE != elem && ENUM_POSSIBLE_VALUES != elem) {
> +			status = get_integer_from_buffer((int **)&buffer_ptr, buffer_size, (int *)&integer);
> +			if (status < 0)
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
> +		case PREREQUISITE_SIZE:
> +			bioscfg_drv.enumeration_data[instance_id].prerequisitesize = integer;
> +			if (integer > 20)
> +				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
> +			break;
> +		case PREREQUISITES:

If you make the changes suggested above you will need to drop the 2:

			break;
		case PREREQUISITES:

lines here.

> +			size = bioscfg_drv.enumeration_data[instance_id].prerequisitesize;
> +			for (reqs = 0; reqs < size; reqs++) {
> +				status = get_string_from_buffer((u16 **)&buffer_ptr, buffer_size, &str);
> +				if (status < 0)
> +					continue;
> +
> +				strlcat(bioscfg_drv.enumeration_data[instance_id].prerequisites,
> +					str,
> +					sizeof(bioscfg_drv.enumeration_data[instance_id].prerequisites));
> +				if (reqs != (size - 1))
> +					strlcat(bioscfg_drv.enumeration_data[instance_id].prerequisites, ";",
> +						sizeof(bioscfg_drv.enumeration_data[instance_id].prerequisites));
> +				kfree(str);
> +				str = NULL;
> +			}
> +			break;
> +		case SECURITY_LEVEL:
> +			bioscfg_drv.enumeration_data[instance_id].security_level = integer;
> +			break;
> +		case ENUM_CURRENT_VALUE:
> +			status = get_string_from_buffer((u16 **)&buffer_ptr,
> +							buffer_size, &str);
> +			if (status < 0)
> +				continue;
> +
> +			strscpy(bioscfg_drv.enumeration_data[instance_id].current_value,
> +				str,
> +				sizeof(bioscfg_drv.enumeration_data[instance_id].current_value));
> +			break;
> +		case ENUM_SIZE:
> +			bioscfg_drv.enumeration_data[instance_id].size = integer;
> +			break;
> +		case ENUM_POSSIBLE_VALUES:

If you make the changes suggested above you will need to drop the 2:

			break;
		case ENUM_POSSIBLE_VALUES:

lines here.

> +			size = bioscfg_drv.enumeration_data[instance_id].size;
> +			for (values = 0; values < size; values++) {
> +				status = get_string_from_buffer((u16 **)&buffer_ptr, buffer_size, &str);
> +				if (status < 0)
> +					continue;
> +
> +				strlcat(bioscfg_drv.enumeration_data[instance_id].possible_values,
> +					str,
> +					sizeof(bioscfg_drv.enumeration_data[instance_id].possible_values));
> +				if (values != (size - 1))
> +					strlcat(bioscfg_drv.enumeration_data[instance_id].possible_values, ";",
> +						sizeof(bioscfg_drv.enumeration_data[instance_id].possible_values));
> +				kfree(str);
> +				str = NULL;
> +			}

Again it would be better to store the possible values in an array.

> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in Enumeration attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +		kfree(str);
> +		str = NULL;
> +	}
> +	kfree(str);
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


Please also apply all the above remarks (+ all previous remarks)
to all the other *-attributes.c files (as applicable) and then
post a v6 with these changes and the already discussed 
sureadmin / surestart changes.

Then I'll do another review of v6 once that is available. I expect
that we will still need a v7 after v6 and I hope to be able to merge
that v7 then (but no promises).

Regards,

Hans


