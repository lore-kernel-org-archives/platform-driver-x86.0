Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E347EC433B4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 May 2021 13:17:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0A53610CD
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 May 2021 13:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349503AbhERNSb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 May 2021 09:18:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28736 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230447AbhERNS3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 May 2021 09:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621343831;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v8NjlyrKV50zbfeIzXmgAi8yre8+l4srwtF6Os1rMu8=;
        b=R0q8h7qLK/L3OnZExc/rltpxRQk04yXjVbojziawimbmOc+OHgmzVC+6S/FvMyiLRQRwog
        qiTWXf0n9Mu62nmCogY5+zC/p8VT4YJ5lcAmHLkjMz/HlKKRdKT9mUjBE+28chzKvE9Ev4
        RgXV+p1gffNryUxCvDiu1U76xqc4p+8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-Wy6MC_EiMF6IlRRsVuNWtg-1; Tue, 18 May 2021 09:17:02 -0400
X-MC-Unique: Wy6MC_EiMF6IlRRsVuNWtg-1
Received: by mail-ed1-f71.google.com with SMTP id w22-20020a05640234d6b029038d04376b6aso5710586edc.21
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 May 2021 06:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v8NjlyrKV50zbfeIzXmgAi8yre8+l4srwtF6Os1rMu8=;
        b=lKdOMLVlKTJL1wAZ2D1b0OR93WS192KDYZhuObkNTaznYK9ehCgrafHvQ+f3d7bMMG
         Gtcpus3g8RYBXYViQ5tzZ0DvShkFjvKcwtyuLHqv/TAiskvdE2RDmfKp4ugU89UxAVWm
         BTZ7TPpDIrB6pma+ltZHyb62xIbd1+iK10QAaWWYgy4zYozY0uGoZzoTNqrC8Z9Grp2f
         yZSozlUuUvwfKKxiDNhp+Nj32Y3HmgAn9zo/NWwL5qub3ODiu43fVMRGnjqcawY2t96w
         eOP8bGRK0dU9m7DttPkU3lYAcexaZ38lnaSxs3a1V43aSDWrA8yvGc8VZjKGnL/5XMf7
         zQzA==
X-Gm-Message-State: AOAM532oEOLKUbIsjRwsvX2Y42XIBtoXlrhc5wdyvCuArD/KeU6CgAq7
        aZIgpfA4Pm8TPwc8BubdOfs97tiCCGUq+6Scakq/7IHBuJY0iKZskbK2lJ4gBjzhqLvT8uZqiJM
        wRnSNxANcGveiqviNCHrPQFTWqPkm43B/WA==
X-Received: by 2002:a17:907:b09:: with SMTP id h9mr5787918ejl.430.1621343820815;
        Tue, 18 May 2021 06:17:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSvtaYg5lGg8SEyHtfZNz1MLdBJ0ebwHZ0iCe33IWB8ix1peA1rBD7Yy7kbrMny2/zjCExLQ==
X-Received: by 2002:a17:907:b09:: with SMTP id h9mr5787895ejl.430.1621343820641;
        Tue, 18 May 2021 06:17:00 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id di7sm13148220edb.34.2021.05.18.06.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 May 2021 06:16:59 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: dell-wmi-sysman: Make populate_foo_data
 functions more robust
To:     Prasanth KSR <kosigiprasanth@gmail.com>, dvhart@infradead.org
Cc:     LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Prasanth KSR <prasanth.ksr@dell.com>,
        Divya Bharathi <divya.bharathi@dell.com>
References: <20210512102530.9704-1-prasanth.ksr@dell.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b271e9f4-0d47-4a77-e16d-4ba871cdbe1b@redhat.com>
Date:   Tue, 18 May 2021 15:16:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210512102530.9704-1-prasanth.ksr@dell.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/12/21 12:25 PM, Prasanth KSR wrote:
> 1. Check acpi type before assignment of each property value
> 
> 2. Add boundary check for properties count
> 
> Co-developed-by: Divya Bharathi <divya.bharathi@dell.com>
> Signed-off-by: Divya Bharathi <divya.bharathi@dell.com>
> Signed-off-by: Prasanth KSR <prasanth.ksr@dell.com>
> 
> Changes from v1 to v2:
>  - added a missed boundary check for enum next object
>  - removed the fix for errors reported by checkpatch as it is unrelated to this patch

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
>  .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  5 ++-
>  .../dell/dell-wmi-sysman/enum-attributes.c    | 39 ++++++++++++++++---
>  .../x86/dell/dell-wmi-sysman/int-attributes.c | 16 ++++++++
>  .../dell/dell-wmi-sysman/passobj-attributes.c |  6 +++
>  .../dell/dell-wmi-sysman/string-attributes.c  | 16 +++++++-
>  .../x86/dell/dell-wmi-sysman/sysman.c         |  3 +-
>  6 files changed, 77 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> index b80f2a62ea3f..3ad33a094588 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> @@ -152,12 +152,15 @@ static ssize_t curr_val##_store(struct kobject *kobj,				\
>  	return ret ? ret : count;						\
>  }
>  
> +#define check_property_type(attr, prop, valuetype)				\
> +	(attr##_obj[prop].type != valuetype)
> +
>  union acpi_object *get_wmiobj_pointer(int instance_id, const char *guid_string);
>  int get_instance_count(const char *guid_string);
>  void strlcpy_attr(char *dest, char *src);
>  
>  int populate_enum_data(union acpi_object *enumeration_obj, int instance_id,
> -			struct kobject *attr_name_kobj);
> +			struct kobject *attr_name_kobj, u32 enum_property_count);
>  int alloc_enum_data(void);
>  void exit_enum_attributes(void);
>  
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
> index 091e48c217ed..8cc212c85266 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
> @@ -132,39 +132,68 @@ int alloc_enum_data(void)
>   * @enumeration_obj: ACPI object with enumeration data
>   * @instance_id: The instance to enumerate
>   * @attr_name_kobj: The parent kernel object
> + * @enum_property_count: Total properties count under enumeration type
>   */
>  int populate_enum_data(union acpi_object *enumeration_obj, int instance_id,
> -			struct kobject *attr_name_kobj)
> +			struct kobject *attr_name_kobj, u32 enum_property_count)
>  {
>  	int i, next_obj, value_modifier_count, possible_values_count;
>  
>  	wmi_priv.enumeration_data[instance_id].attr_name_kobj = attr_name_kobj;
> +	if (check_property_type(enumeration, ATTR_NAME, ACPI_TYPE_STRING))
> +		return -EINVAL;
>  	strlcpy_attr(wmi_priv.enumeration_data[instance_id].attribute_name,
>  		enumeration_obj[ATTR_NAME].string.pointer);
> +	if (check_property_type(enumeration, DISPL_NAME_LANG_CODE, ACPI_TYPE_STRING))
> +		return -EINVAL;
>  	strlcpy_attr(wmi_priv.enumeration_data[instance_id].display_name_language_code,
>  		enumeration_obj[DISPL_NAME_LANG_CODE].string.pointer);
> +	if (check_property_type(enumeration, DISPLAY_NAME, ACPI_TYPE_STRING))
> +		return -EINVAL;
>  	strlcpy_attr(wmi_priv.enumeration_data[instance_id].display_name,
>  		enumeration_obj[DISPLAY_NAME].string.pointer);
> +	if (check_property_type(enumeration, DEFAULT_VAL, ACPI_TYPE_STRING))
> +		return -EINVAL;
>  	strlcpy_attr(wmi_priv.enumeration_data[instance_id].default_value,
>  		enumeration_obj[DEFAULT_VAL].string.pointer);
> +	if (check_property_type(enumeration, MODIFIER, ACPI_TYPE_STRING))
> +		return -EINVAL;
>  	strlcpy_attr(wmi_priv.enumeration_data[instance_id].dell_modifier,
>  		enumeration_obj[MODIFIER].string.pointer);
>  
>  	next_obj = MODIFIER + 1;
>  
> -	value_modifier_count = (uintptr_t)enumeration_obj[next_obj].string.pointer;
> +	if (next_obj >= enum_property_count)
> +		return -EINVAL;
> +
> +	if (check_property_type(enumeration, next_obj, ACPI_TYPE_INTEGER))
> +		return -EINVAL;
> +	value_modifier_count = (uintptr_t)enumeration_obj[next_obj++].string.pointer;
>  
>  	for (i = 0; i < value_modifier_count; i++) {
> +		if (next_obj >= enum_property_count)
> +			return -EINVAL;
> +		if (check_property_type(enumeration, next_obj, ACPI_TYPE_STRING))
> +			return -EINVAL;
>  		strcat(wmi_priv.enumeration_data[instance_id].dell_value_modifier,
> -			enumeration_obj[++next_obj].string.pointer);
> +			enumeration_obj[next_obj++].string.pointer);
>  		strcat(wmi_priv.enumeration_data[instance_id].dell_value_modifier, ";");
>  	}
>  
> -	possible_values_count = (uintptr_t) enumeration_obj[++next_obj].string.pointer;
> +	if (next_obj >= enum_property_count)
> +		return -EINVAL;
> +
> +	if (check_property_type(enumeration, next_obj, ACPI_TYPE_INTEGER))
> +		return -EINVAL;
> +	possible_values_count = (uintptr_t) enumeration_obj[next_obj++].string.pointer;
>  
>  	for (i = 0; i < possible_values_count; i++) {
> +		if (next_obj >= enum_property_count)
> +			return -EINVAL;
> +		if (check_property_type(enumeration, next_obj, ACPI_TYPE_STRING))
> +			return -EINVAL;
>  		strcat(wmi_priv.enumeration_data[instance_id].possible_values,
> -			enumeration_obj[++next_obj].string.pointer);
> +			enumeration_obj[next_obj++].string.pointer);
>  		strcat(wmi_priv.enumeration_data[instance_id].possible_values, ";");
>  	}
>  
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
> index 8a49ba6e44f9..951e75b538fa 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
> @@ -141,20 +141,36 @@ int populate_int_data(union acpi_object *integer_obj, int instance_id,
>  			struct kobject *attr_name_kobj)
>  {
>  	wmi_priv.integer_data[instance_id].attr_name_kobj = attr_name_kobj;
> +	if (check_property_type(integer, ATTR_NAME, ACPI_TYPE_STRING))
> +		return -EINVAL;
>  	strlcpy_attr(wmi_priv.integer_data[instance_id].attribute_name,
>  		integer_obj[ATTR_NAME].string.pointer);
> +	if (check_property_type(integer, DISPL_NAME_LANG_CODE, ACPI_TYPE_STRING))
> +		return -EINVAL;
>  	strlcpy_attr(wmi_priv.integer_data[instance_id].display_name_language_code,
>  		integer_obj[DISPL_NAME_LANG_CODE].string.pointer);
> +	if (check_property_type(integer, DISPLAY_NAME, ACPI_TYPE_STRING))
> +		return -EINVAL;
>  	strlcpy_attr(wmi_priv.integer_data[instance_id].display_name,
>  		integer_obj[DISPLAY_NAME].string.pointer);
> +	if (check_property_type(integer, DEFAULT_VAL, ACPI_TYPE_INTEGER))
> +		return -EINVAL;
>  	wmi_priv.integer_data[instance_id].default_value =
>  		(uintptr_t)integer_obj[DEFAULT_VAL].string.pointer;
> +	if (check_property_type(integer, MODIFIER, ACPI_TYPE_STRING))
> +		return -EINVAL;
>  	strlcpy_attr(wmi_priv.integer_data[instance_id].dell_modifier,
>  		integer_obj[MODIFIER].string.pointer);
> +	if (check_property_type(integer, MIN_VALUE, ACPI_TYPE_INTEGER))
> +		return -EINVAL;
>  	wmi_priv.integer_data[instance_id].min_value =
>  		(uintptr_t)integer_obj[MIN_VALUE].string.pointer;
> +	if (check_property_type(integer, MAX_VALUE, ACPI_TYPE_INTEGER))
> +		return -EINVAL;
>  	wmi_priv.integer_data[instance_id].max_value =
>  		(uintptr_t)integer_obj[MAX_VALUE].string.pointer;
> +	if (check_property_type(integer, SCALAR_INCR, ACPI_TYPE_INTEGER))
> +		return -EINVAL;
>  	wmi_priv.integer_data[instance_id].scalar_increment =
>  		(uintptr_t)integer_obj[SCALAR_INCR].string.pointer;
>  
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
> index 834b3e82ad9f..230e6ee96636 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
> @@ -159,10 +159,16 @@ int alloc_po_data(void)
>  int populate_po_data(union acpi_object *po_obj, int instance_id, struct kobject *attr_name_kobj)
>  {
>  	wmi_priv.po_data[instance_id].attr_name_kobj = attr_name_kobj;
> +	if (check_property_type(po, ATTR_NAME, ACPI_TYPE_STRING))
> +		return -EINVAL;
>  	strlcpy_attr(wmi_priv.po_data[instance_id].attribute_name,
>  		     po_obj[ATTR_NAME].string.pointer);
> +	if (check_property_type(po, MIN_PASS_LEN, ACPI_TYPE_INTEGER))
> +		return -EINVAL;
>  	wmi_priv.po_data[instance_id].min_password_length =
>  		(uintptr_t)po_obj[MIN_PASS_LEN].string.pointer;
> +	if (check_property_type(po, MAX_PASS_LEN, ACPI_TYPE_INTEGER))
> +		return -EINVAL;
>  	wmi_priv.po_data[instance_id].max_password_length =
>  		(uintptr_t) po_obj[MAX_PASS_LEN].string.pointer;
>  
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c b/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
> index 552537852459..c392f0ecf8b5 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
> @@ -118,24 +118,38 @@ int alloc_str_data(void)
>  
>  /**
>   * populate_str_data() - Populate all properties of an instance under string attribute
> - * @str_obj: ACPI object with integer data
> + * @str_obj: ACPI object with string data
>   * @instance_id: The instance to enumerate
>   * @attr_name_kobj: The parent kernel object
>   */
>  int populate_str_data(union acpi_object *str_obj, int instance_id, struct kobject *attr_name_kobj)
>  {
>  	wmi_priv.str_data[instance_id].attr_name_kobj = attr_name_kobj;
> +	if (check_property_type(str, ATTR_NAME, ACPI_TYPE_STRING))
> +		return -EINVAL;
>  	strlcpy_attr(wmi_priv.str_data[instance_id].attribute_name,
>  		     str_obj[ATTR_NAME].string.pointer);
> +	if (check_property_type(str, DISPL_NAME_LANG_CODE, ACPI_TYPE_STRING))
> +		return -EINVAL;
>  	strlcpy_attr(wmi_priv.str_data[instance_id].display_name_language_code,
>  		     str_obj[DISPL_NAME_LANG_CODE].string.pointer);
> +	if (check_property_type(str, DISPLAY_NAME, ACPI_TYPE_STRING))
> +		return -EINVAL;
>  	strlcpy_attr(wmi_priv.str_data[instance_id].display_name,
>  		     str_obj[DISPLAY_NAME].string.pointer);
> +	if (check_property_type(str, DEFAULT_VAL, ACPI_TYPE_STRING))
> +		return -EINVAL;
>  	strlcpy_attr(wmi_priv.str_data[instance_id].default_value,
>  		     str_obj[DEFAULT_VAL].string.pointer);
> +	if (check_property_type(str, MODIFIER, ACPI_TYPE_STRING))
> +		return -EINVAL;
>  	strlcpy_attr(wmi_priv.str_data[instance_id].dell_modifier,
>  		     str_obj[MODIFIER].string.pointer);
> +	if (check_property_type(str, MIN_LEN, ACPI_TYPE_INTEGER))
> +		return -EINVAL;
>  	wmi_priv.str_data[instance_id].min_length = (uintptr_t)str_obj[MIN_LEN].string.pointer;
> +	if (check_property_type(str, MAX_LEN, ACPI_TYPE_INTEGER))
> +		return -EINVAL;
>  	wmi_priv.str_data[instance_id].max_length = (uintptr_t) str_obj[MAX_LEN].string.pointer;
>  
>  	return sysfs_create_group(attr_name_kobj, &str_attr_group);
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> index c8d276d78e92..d21e84c7a694 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -481,7 +481,8 @@ static int init_bios_attributes(int attr_type, const char *guid)
>  		/* enumerate all of this attribute */
>  		switch (attr_type) {
>  		case ENUM:
> -			retval = populate_enum_data(elements, instance_id, attr_name_kobj);
> +			retval = populate_enum_data(elements, instance_id, attr_name_kobj,
> +					obj->package.count);
>  			break;
>  		case INT:
>  			retval = populate_int_data(elements, instance_id, attr_name_kobj);
> 

