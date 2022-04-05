Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766F3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Apr 2022 14:44:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235030AbiDEOp5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Apr 2022 10:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381295AbiDEMy3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Apr 2022 08:54:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 18BC51D2
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Apr 2022 04:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649159681;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0V4EfQCl+5w5/PkDJUVgRQBEx5Wb6g6yMRdogTRTrZM=;
        b=IKvNX6Hzr0SUziHygNj9x7QBbP8uF8OqnNpSpzWK/TUqEMjPNmRF+aMSaLY8ZRZ6plwBVQ
        be8+Bljk5FsKagc0GLD0gj8qes/q4wgL/qIrJGBr01XBvBUbaCQsDtxwgFTai3dA4TTGno
        UzITPINuU6dTXjoEQryCwvUrcKfm6GI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-KHHbB0TXPuyq7m-S4AzHyw-1; Tue, 05 Apr 2022 07:54:40 -0400
X-MC-Unique: KHHbB0TXPuyq7m-S4AzHyw-1
Received: by mail-ej1-f72.google.com with SMTP id gn11-20020a1709070d0b00b006e6e59438f8so3805286ejc.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Apr 2022 04:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0V4EfQCl+5w5/PkDJUVgRQBEx5Wb6g6yMRdogTRTrZM=;
        b=678xjY3ZH0ZpnuKyt4/QNdEnDw1DnBrbVaBQ6/a4n+e60H4EtI0zMCedW56XtuGkgD
         yQmEK95O/ds+5Iq4gESqlbA6A5XymneipO0IZraibNyla2ATKpf6lcEyiasw9WX2Ig7/
         sjjpMyivgjVtV2HJMBxvHSWOrJvIGt2zNzMCp4uQiwK6SFRcliqyQy7sjiko0uQ4iqs8
         On0PerQqy9iUhJtm+/VdouMtf679SK0alYdHV8n4IzjwzrW3R3QH1t1A3kD5myrIk53q
         ywqSIyL5ikC023MQtO1CEKcJnkkFxZ06ECPoMFZ1JKU5GWkOAfgrZIL/ThlmTh4rnxI7
         OIUg==
X-Gm-Message-State: AOAM533ww6ghTSUWwrIUcxt8YnjOxj0pQFjkBaY9YBosyCFBcdyXR4NJ
        PFZweqmTEZ6rsOBmsFYfylKgJExXra6MsO2a92cFg6SBfSOEWLUg0/DlCa4mG4ohHG+8xVmP9wt
        ONXE3GZVdsL9BhHp+jdJWNDoWPDpCqHljAQ==
X-Received: by 2002:aa7:cfda:0:b0:41c:bd28:a7da with SMTP id r26-20020aa7cfda000000b0041cbd28a7damr3155671edy.129.1649159678707;
        Tue, 05 Apr 2022 04:54:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpreNyb4MchJrcX5K5z2fcUeiHIdqvSo0aS1SJZ9yrUgyFMS4nP6basfR4Rkd2CgRMbnAQsA==
X-Received: by 2002:aa7:cfda:0:b0:41c:bd28:a7da with SMTP id r26-20020aa7cfda000000b0041cbd28a7damr3155646edy.129.1649159678370;
        Tue, 05 Apr 2022 04:54:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id gl2-20020a170906e0c200b006a767d52373sm5361955ejb.182.2022.04.05.04.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 04:54:37 -0700 (PDT)
Message-ID: <f346c8c9-d932-cfee-ad6c-0671461e78c1@redhat.com>
Date:   Tue, 5 Apr 2022 13:54:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 5/6] Sure Admin Security Feature
Content-Language: en-US
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        Jorge Lopez <jorgealtxwork@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20220404203626.4311-1-jorge.lopez2@hp.com>
 <20220404203626.4311-6-jorge.lopez2@hp.com>
 <BL1PR12MB5157263F33A534E144618223E2E59@BL1PR12MB5157.namprd12.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <BL1PR12MB5157263F33A534E144618223E2E59@BL1PR12MB5157.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/4/22 23:59, Limonciello, Mario wrote:
> [Public]
> 
> 
> 
>> -----Original Message-----
>> From: Jorge Lopez <jorgealtxwork@gmail.com>
>> Sent: Monday, April 4, 2022 15:36
>> To: platform-driver-x86@vger.kernel.org
>> Subject: [PATCH v1 5/6] Sure Admin Security Feature
>>
>> HP Commercial PC’s have several BIOS settings that control its
>> behaviour and capabilities, many of which are related to security.  To
>> prevent unauthorized changes to these settings, the system can be
>> configured to use a Sure Admin cryptographic signature-based
>> authorization string that the BIOS will use to verify authorization to
>> modify the setting. Behind the scenes, Sure Admin uses Secure Platform
>> Management (SPM) and WMI
>>
>> 'settings' is a file associated with Sure Admin. BIOS settings can be
>> read or written through the Sure Admin settings file in sysfs
>>
>> 	/sys/devices/platform/hp-wmi/sure_admin/settings
>>
>> Expected data format to update BIOS setting
>>
>> 	[BIOS setting],[new value],[auth token]
>>
>> Sample settings reported data
>>
>> 	{
>> 		"Class": "HPBIOS_BIOSEnumeration",
>> 		"Name": "USB Storage Boot",
>> 		"Path": "\\Advanced\\Boot Options",
>> 		"IsReadOnly": 0,
>> 		...
>> 		"Value": "Enable",
>> 		"Size": 2,
>> 		"PossibleValues": [
>> 			"Disable",
>> 			"Enable"
>> 		]
>> 	}
>>
> 
> This sounds like it has re-invented /sys/class/firmware-attributes.
> 
> Shouldn't you adopt that API?

I fully agree. Jorge as I already indicated in our off-list
conversation when you initially started working on this
feature, we already have a standardized API for querying/changing
BIOS settings from within Linux:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-class-firmware-attributes

and any new code (such as this patch) which implements BIOS
setting changing MUST follow this standardized API (extending
it where necessary).

I'm sorry but this patch is not acceptable in its current form,
it needs to be *completely rewritten* to implement:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-class-firmware-attributes

See:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/dell/dell-wmi-sysman
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/think-lmi.c

for example code / for 2 drivers from other vendors already
implementing this.

The same applies to the:

"[PATCH v1 3/6] Secure Platform Management Security Feature"

this needs to be implemented as
a /sys/class/firmware-attributes/*/authentication/
authentication method, see for example these Lenovo specific
addition to the /sys/class/firmware-attributes/*/authentication/
userspace API for similar functionality on Lenovo Think* devices:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=06384573a3e8335ac6797577e545c33dbf91b490

I'll merge patches 1-2 sometime this week since those are
fine and it will be good to have those "out of the way",
but the rest of the series will need to be rewritten
taken the above comments into account.

Regards,

Hans










> 
>> This feature requires "Update hp_wmi_group to simplify feature
>> addition" patch.
>>
>> All changes were validated on a HP ZBook Workstation,
>> HP EliteBook x360, and HP EliteBook 850 G8 notebooks.
>>
>> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
>>
>> ---
>> Based on the latest platform-drivers-x86.git/for-next
>> ---
>>  drivers/platform/x86/hp-wmi.c | 977
>> ++++++++++++++++++++++++++++++++++
>>  1 file changed, 977 insertions(+)
>>
>> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
>> index 918e3eaf1b67..b72ca18b77a6 100644
>> --- a/drivers/platform/x86/hp-wmi.c
>> +++ b/drivers/platform/x86/hp-wmi.c
>> @@ -27,6 +27,7 @@
>>  #include <linux/rfkill.h>
>>  #include <linux/string.h>
>>  #include <linux/dmi.h>
>> +#include <linux/nls.h>
>>
>>  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
>>  MODULE_DESCRIPTION("HP laptop WMI hotkeys driver");
>> @@ -37,8 +38,16 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-
>> 3D44E2C707E4");
>>
>>  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
>>  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
>> +
>>  #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
>>
>> +#define HPWMI_STRING_GUID "988D08E3-68F4-4c35-AF3E-6A1B8106F83C"
>> +#define HPWMI_INTEGER_GUID "8232DE3D-663D-4327-A8F4-
>> E293ADB9BF05"
>> +#define HPWMI_ENUMERATION_GUID "2D114B49-2DFB-4130-B8FE-
>> 4A3C09E75133"
>> +#define HPWMI_ORDEREDLIST_GUID "14EA9746-CE1F-4098-A0E0-
>> 7045CB4DA745"
>> +#define HPWMI_PASSWORD_GUID "322F2028-0F84-4901-988E-
>> 015176049E2D"
>> +#define HPWMI_SETBIOSSETTING_GUID "1F4C91EB-DC5C-460b-951D-
>> C7CB9B4B8D5E"
>> +
>>  /* DMI board names of devices that should use the omen specific path for
>>   * thermal profiles.
>>   * This was obtained by taking a look in the windows omen command center
>> @@ -1025,6 +1034,973 @@ static const struct attribute_group
>> sure_start_group = {
>>  	.attrs = sure_start_attrs,
>>  };
>>
>> +
>> +static int convert_hexstr_to_str(char **hex, int input_len, char **str, int
>> *len)
>> +{
>> +	int ret = 0;
>> +	int new_len = 0;
>> +	char tmp[] = "0x00";
>> +	char *input = *hex;
>> +	char *new_str = NULL;
>> +	int  ch;
>> +	int i;
>> +
>> +	if (input_len <= 0 || hex == NULL || str == NULL || len == NULL)
>> +		return -EINVAL;
>> +
>> +	*len = 0;
>> +	*str = NULL;
>> +
>> +	new_str = kmalloc(input_len, GFP_KERNEL);
>> +	if (!new_str)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < input_len; i += 5) {
>> +		strncpy(tmp, input + i, strlen(tmp));
>> +		ret = kstrtoint(tmp, 16, &ch);
>> +		if (ret) {
>> +			new_len = 0;
>> +			break;
>> +		}
>> +
>> +		if (ch == '\\')
>> +			new_str[new_len++] = '\\';
>> +
>> +		new_str[new_len++] = ch;
>> +		if (ch == '\0')
>> +			break;
>> +	}
>> +
>> +	if (new_len) {
>> +		new_str[new_len] = '\0';
>> +		*str = krealloc(new_str, (new_len + 1) * sizeof(char),
>> GFP_KERNEL);
>> +		if (*str)
>> +			*len = new_len;
>> +		else
>> +			ret = -ENOMEM;
>> +	}
>> +
>> +	if (ret)
>> +		kfree(new_str);
>> +	return ret;
>> +}
>> +
>> +/*
>> + * hp_wmi_get_setting_object() - Get an ACPI object by GUID and instance
>> + *
>> + * @guid:	GUID associated with the ACPI list of managed objects
>> + * @instance:	Instance index to query on the ACPI list
>> + * @obj:	The output ACPI object of type ACPI_TYPE_PACKAGE
>> + *		or ACPI_TYPE_BUFFER (freed by the callee)
>> + *
>> + * Returns	zero on success.  Otherwise,an error inherited from
>> + *		wmi_query_block(). It returns a obj by parameter if
>> + *		the query returned object of type buffer or package,
>> + *		otherwise, a null obj is returned.
>> + *
>> + * Note: obj should be freed by the callee once it is finished working with it
>> + */
>> +static int hp_wmi_get_setting_object(char *guid, int instance,
>> +				union acpi_object **obj)
>> +{
>> +	struct acpi_buffer output = { ACPI_ALLOCATE_LOCAL_BUFFER, NULL
>> };
>> +	union acpi_object *tmp = NULL;
>> +	int ret;
>> +
>> +	ret = wmi_query_block(guid, instance, &output);
>> +	if (ACPI_SUCCESS(ret) && output.pointer != NULL) {
>> +		tmp = output.pointer;
>> +		if (tmp->type == ACPI_TYPE_BUFFER || tmp->type ==
>> ACPI_TYPE_PACKAGE)
>> +			*obj = output.pointer;
>> +		else {
>> +			kfree(tmp);
>> +			*obj = NULL;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +
>> +static int get_string_from_buffer(u16 **buffer, char **str)
>> +{
>> +	u16 *ptr = *buffer;
>> +	u16 ptrlen;
>> +
>> +	u16 size;
>> +	int i;
>> +	char *output = NULL;
>> +	int escape = 0;
>> +
>> +	ptrlen = *(ptr++);
>> +	size = ptrlen / 2;
>> +
>> +	if (size == 0)
>> +		goto cleanup_exit;
>> +
>> +	for (i = 0; i < size; i++)
>> +		if (ptr[i] == '\\')
>> +			escape++;
>> +
>> +	size += escape;
>> +	*str = kcalloc(size + 1, sizeof(char), GFP_KERNEL);
>> +	if (!*str)
>> +		return -ENOMEM;
>> +
>> +	output = *str;
>> +
>> +	/*
>> +	 * convert from UTF-16 unicode to ASCII
>> +	 */
>> +	utf16s_to_utf8s(ptr, ptrlen, UTF16_HOST_ENDIAN, output, size);
>> +
>> +	if (escape == 0) {
>> +		ptr += (ptrlen / 2);
>> +		goto cleanup_exit;
>> +	}
>> +	/*
>> +	 * Convert escape characters only when found
>> +	 */
>> +	for (i = 0; i < size; i++) {
>> +		if (*ptr == '\\')
>> +			output[i++] = '\\';
>> +		output[i] = *ptr;
>> +		ptr++;
>> +	}
>> +
>> +cleanup_exit:
>> +	*buffer = ptr;
>> +	return 0;
>> +}
>> +
>> +static int get_integer_from_buffer(int **buffer, int *integer)
>> +{
>> +	int *ptr = PTR_ALIGN(*buffer, 4);
>> +	*integer = *(ptr++);
>> +	*buffer = ptr;
>> +	return 0;
>> +}
>> +
>> +
>> +// Sure Admin functions
>> +enum hp_wmi_data_type {
>> +	HPWMI_STRING_TYPE,
>> +	HPWMI_INTEGER_TYPE,
>> +	HPWMI_ENUMERATION_TYPE,
>> +	HPWMI_ORDEREDLIST_TYPE,
>> +	HPWMI_PASSWORD_TYPE,
>> +};
>> +
>> +#define HP_WMI_COMMON_ELEMENTS	\
>> +	"Name",	\
>> +	"Value",	\
>> +	"Path",	\
>> +	"IsReadOnly",	\
>> +	"DisplayInUI",	\
>> +	"RequiresPhysicalPresence",	\
>> +	"Sequence",	\
>> +	"PrerequisiteSize",	\
>> +	"SecurityLevel"
>> +
>> +const char *hp_wmi_string_elements[] = {
>> +	HP_WMI_COMMON_ELEMENTS,
>> +	"MinLength",
>> +	"MaxLength"
>> +};
>> +
>> +const char *hp_wmi_integer_elements[] = {
>> +	HP_WMI_COMMON_ELEMENTS,
>> +	"LowerBound",
>> +	"UpperBound",
>> +	"IntValue"
>> +};
>> +
>> +const char *hp_wmi_enumeration_elements[] = {
>> +	HP_WMI_COMMON_ELEMENTS,
>> +	"CurrentValue",
>> +	"Size"
>> +};
>> +
>> +const char *hp_wmi_orderedlist_elements[] = {
>> +	HP_WMI_COMMON_ELEMENTS,
>> +	"Size"
>> +};
>> +
>> +const char *hp_wmi_password_elements[] = {
>> +	HP_WMI_COMMON_ELEMENTS,
>> +	"MinLength",
>> +	"MaxLength",
>> +	"Size",
>> +	"SupportedEncoding",
>> +	"IsSet"
>> +};
>> +
>> +const char **hp_wmi_elements[] = {
>> +	hp_wmi_string_elements,
>> +	hp_wmi_integer_elements,
>> +	hp_wmi_enumeration_elements,
>> +	hp_wmi_orderedlist_elements,
>> +	hp_wmi_password_elements
>> +};
>> +
>> +const int hp_wmi_elements_count[] = {
>> +	ARRAY_SIZE(hp_wmi_string_elements),
>> +	ARRAY_SIZE(hp_wmi_integer_elements),
>> +	ARRAY_SIZE(hp_wmi_enumeration_elements),
>> +	ARRAY_SIZE(hp_wmi_orderedlist_elements),
>> +	ARRAY_SIZE(hp_wmi_password_elements)
>> +};
>> +
>> +const char *hp_wmi_classes[] = {
>> +	"HPBIOS_BIOSString",
>> +	"HPBIOS_BIOSInteger",
>> +	"HPBIOS_BIOSEnumeration",
>> +	"HPBIOS_BIOSOrderedList",
>> +	"HPBIOS_BIOSPassword"
>> +};
>> +
>> +static DEFINE_MUTEX(buf_mutex);
>> +static int settings_buffer_size;
>> +static int buf_alloc_size;
>> +static char *hp_bios_settings_buffer;
>> +
>> +
>> +static int append_package_elements_to_buffer(union acpi_object *obj,
>> +					     char *buf, int alloc_size, enum
>> hp_wmi_data_type type)
>> +{
>> +	int i;
>> +	union acpi_object *pobj = NULL;
>> +	char *value = NULL;
>> +	int value_len;
>> +	char *tmpstr = NULL;
>> +	char *part_tmp = NULL;
>> +	int tmp_len = 0;
>> +	char *part = NULL;
>> +	int status = 0;
>> +	int size = 0;
>> +	int buf_size;
>> +
>> +	if (type >= ARRAY_SIZE(hp_wmi_classes) || !buf || !obj)
>> +		return -EINVAL;
>> +
>> +	if (obj->type != ACPI_TYPE_PACKAGE)
>> +		return -EINVAL;
>> +
>> +	buf_size = snprintf(buf, alloc_size, "%s{\n", buf);
>> +	buf_size = snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\",\n", buf,
>> hp_wmi_classes[type]);
>> +
>> +	for (i = 0; i < 3; i++) {
>> +		pobj = &(obj->package.elements[i]);
>> +		if (pobj->type == ACPI_TYPE_STRING) {
>> +			status = convert_hexstr_to_str(&pobj-
>>> string.pointer,
>> +						       pobj->string.length,
>> &value, &value_len);
>> +			if (ACPI_FAILURE(status))
>> +				continue;
>> +			/*
>> +			 * Skip 'Value' (HP_WMI_COMMON_ELEMENTS)
>> since
>> +			 * 'CurrentValue' is reported.
>> +			 */
>> +			if (type != HPWMI_ENUMERATION_TYPE || i != 1)
>> +				buf_size = snprintf(buf, alloc_size,
>> +						    "%s\t\"%s\": \"%s\",\n",
>> +						    buf,
>> +
>> hp_wmi_elements[type][i], value);
>> +
>> +		}
>> +		kfree(value);
>> +		value = NULL;
>> +	}
>> +
>> +	for (i = 3; i < hp_wmi_elements_count[type]; i++) {
>> +		pobj = &(obj->package.elements[i]);
>> +
>> +		if (type == HPWMI_ENUMERATION_TYPE &&
>> +		    i == 9 &&
>> +		    pobj->type == ACPI_TYPE_STRING) {
>> +			/*
>> +			 * Report "CurrentValue" as "Value"
>> +			 */
>> +			status = convert_hexstr_to_str(&pobj-
>>> string.pointer,
>> +						       pobj->string.length,
>> +						       &value, &value_len);
>> +			if (ACPI_FAILURE(status))
>> +				continue;
>> +
>> +			buf_size = snprintf(buf, alloc_size,
>> +					    "%s\t\"Value\": \"%s\",\n",
>> +					    buf, value);
>> +			kfree(value);
>> +			value = NULL;
>> +
>> +		} else if (type == HPWMI_PASSWORD_TYPE &&
>> +			   i == 12 &&
>> +			   pobj->type == ACPI_TYPE_STRING) {
>> +			/*
>> +			 * Report list of "SupportEncoding"
>> +			 *
>> +			 *	"SupportedEncoding": [
>> +			 *		"utf-16"
>> +			 *	],
>> +			 *
>> +			 */
>> +
>> +			buf_size = snprintf(buf, alloc_size, "%s\t\"%s\": [\n",
>> +					    buf, hp_wmi_elements[type][i]);
>> +			while (size--) {
>> +				pobj = &(obj->package.elements[i]);
>> +				status = convert_hexstr_to_str(&pobj-
>>> string.pointer,
>> +							       pobj-
>>> string.length,
>> +							       &value,
>> &value_len);
>> +				if (ACPI_FAILURE(status))
>> +					continue;
>> +
>> +				if (size) {
>> +					buf_size = snprintf(buf, alloc_size,
>> +							    "%s\t\t\"%s\",\n",
>> buf, value);
>> +					i++;
>> +				} else
>> +					buf_size = snprintf(buf, alloc_size,
>> +							    "%s\t\t\"%s\"\n",
>> buf, value);
>> +
>> +				kfree(value);
>> +				value = NULL;
>> +
>> +			}
>> +			buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
>> +			continue;
>> +
>> +		} else if (pobj->type == ACPI_TYPE_INTEGER) {
>> +			/*
>> +			 * Report "PrerequisiteSize" and "Size" values
>> +			 *	...
>> +			 *	"PrerequisiteSize": 1,
>> +			 *	...
>> +			 *	"Size": 2,
>> +			 *	...
>> +			 */
>> +			if (i == 7)
>> +				size = pobj->integer.value;
>> +			else if (type == HPWMI_ORDEREDLIST_TYPE && i ==
>> 9)
>> +				size = pobj->integer.value;
>> +			else if (type == HPWMI_ENUMERATION_TYPE && i
>> == 10)
>> +				size = pobj->integer.value;
>> +			else if (type == HPWMI_PASSWORD_TYPE && i ==
>> 11)
>> +				size = pobj->integer.value;
>> +
>> +			buf_size = snprintf(buf, alloc_size, "%s\t\"%s\":
>> %lld,\n", buf,
>> +					    hp_wmi_elements[type][i], pobj-
>>> integer.value);
>> +		}
>> +	}
>> +
>> +	if (type == HPWMI_ENUMERATION_TYPE) {
>> +		buf_size = snprintf(buf, alloc_size, "%s\t\"PossibleValues\":
>> [\n", buf);
>> +		for (i = 0; i < size; i++) {
>> +			pobj = &(obj->package.elements[i +
>> hp_wmi_elements_count[type]]);
>> +
>> +			status = convert_hexstr_to_str(&pobj-
>>> string.pointer,
>> +						       pobj->string.length,
>> +						       &value, &value_len);
>> +			if (ACPI_FAILURE(status))
>> +				break;
>> +
>> +			/*
>> +			 * Report list of "PossibleValues" of size
>> +			 * "Size"
>> +			 *	...
>> +			 *	"Size": 2,
>> +			 *	"PossibleValues": [
>> +			 *			"Disable",
>> +			 *			"Enable"]
>> +			 */
>> +			if (i == (size - 1))
>> +				buf_size = snprintf(buf, alloc_size,
>> +						    "%s\t\t\"%s\"\n", buf,
>> value);
>> +			else
>> +				buf_size = snprintf(buf, alloc_size,
>> +						    "%s\t\t\"%s\",\n", buf,
>> value);
>> +			kfree(value);
>> +			value = NULL;
>> +		}
>> +		buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
>> +	}
>> +
>> +	if (type == HPWMI_ORDEREDLIST_TYPE) {
>> +		buf_size = snprintf(buf, alloc_size, "%s\t\"Elements\": [\n",
>> buf);
>> +		if (size <= 0)
>> +			goto finish_ordered_list;
>> +
>> +		pobj = &(obj-
>>> package.elements[hp_wmi_elements_count[type]]);
>> +		status = convert_hexstr_to_str(&pobj->string.pointer,
>> +					       pobj->string.length, &value,
>> &value_len);
>> +		if (ACPI_FAILURE(status))
>> +			goto finish_ordered_list;
>> +
>> +		/*
>> +		 * Ordered list data is stored in hex and comma separated
>> format
>> +		 * Convert the data and split it to show each element
>> +		 */
>> +		status = convert_hexstr_to_str(&value, value_len, &tmpstr,
>> &tmp_len);
>> +		if (ACPI_FAILURE(status))
>> +			goto finish_ordered_list;
>> +
>> +		part_tmp = tmpstr;
>> +		part = strsep(&part_tmp, ",");
>> +		while (part) {
>> +			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"",
>> buf, part);
>> +			part = strsep(&part_tmp, ",");
>> +			if (part)
>> +				buf_size = snprintf(buf, alloc_size, "%s,\n",
>> buf);
>> +			else
>> +				buf_size = snprintf(buf, alloc_size, "%s\n",
>> buf);
>> +		}
>> +	}
>> +
>> +finish_ordered_list:
>> +	if (type == HPWMI_ORDEREDLIST_TYPE)
>> +		buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
>> +
>> +	/*
>> +	 * remove trailing comma
>> +	 */
>> +	if (buf_size > 3)
>> +		buf[buf_size - 2] = ' ';
>> +
>> +	kfree(tmpstr);
>> +	kfree(value);
>> +	return snprintf(buf, alloc_size, "%s},\n", buf);
>> +}
>> +
>> +static int append_buffer_elements_to_buffer(union acpi_object *obj,
>> +					    char *buf, int alloc_size, enum
>> hp_wmi_data_type type)
>> +{
>> +	int buf_size;
>> +	int status;
>> +	char *str = NULL;
>> +	int i;
>> +	int j;
>> +	int integer;
>> +	int size = 0;
>> +
>> +	if (type >= ARRAY_SIZE(hp_wmi_classes) || !buf || !obj)
>> +		return -EINVAL;
>> +
>> +	if (obj->type != ACPI_TYPE_BUFFER)
>> +		return -EINVAL;
>> +
>> +	buf_size = snprintf(buf, alloc_size, "%s{\n", buf);
>> +	buf_size = snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\",\n", buf,
>> hp_wmi_classes[type]);
>> +
>> +	for (i = 0; i < 3; i++) {
>> +		status = get_string_from_buffer((u16 **)&obj-
>>> buffer.pointer, &str);
>> +		if (ACPI_SUCCESS(status)) {
>> +			/*
>> +			 * Skip 'Value' (HP_WMI_COMMON_ELEMENTS)
>> since
>> +			 * 'CurrentValue' is reported.
>> +			 */
>> +			if (type != HPWMI_ENUMERATION_TYPE || i != 1)
>> +				buf_size = snprintf(buf, alloc_size,
>> +						    "%s\t\"%s\": \"%s\",\n",
>> +						    buf,
>> +
>> hp_wmi_elements[type][i], str);
>> +		}
>> +		kfree(str);
>> +		str = NULL;
>> +
>> +	}
>> +
>> +	for (i = 3; i < hp_wmi_elements_count[type]; i++) {
>> +		if (type == HPWMI_ENUMERATION_TYPE && i == 9) {
>> +			status = get_string_from_buffer((u16 **)&obj-
>>> buffer.pointer, &str);
>> +			if (ACPI_SUCCESS(status)) {
>> +				/*
>> +				 * Report "CurrentValue" as "Value"
>> +				 */
>> +				buf_size = snprintf(buf, alloc_size,
>> +						    "%s\t\"Value\": \"%s\",\n",
>> buf, str);
>> +			}
>> +			kfree(str);
>> +			str = NULL;
>> +			continue;
>> +
>> +		} else if (type == HPWMI_PASSWORD_TYPE && i == 12) {
>> +			/*
>> +			 * Report list of "SupportEncoding"
>> +			 *
>> +			 *	"SupportedEncoding": [
>> +			 *		"utf-16"
>> +			 *	],
>> +			 *
>> +			 */
>> +
>> +			buf_size = snprintf(buf, alloc_size, "%s\t\"%s\": [\n",
>> +					    buf, hp_wmi_elements[type][i]);
>> +			for (j = 0; j < size; j++) {
>> +				status = get_string_from_buffer((u16
>> **)&obj->buffer.pointer, &str);
>> +				if (ACPI_SUCCESS(status)) {
>> +					if (j == size - 1)
>> +						buf_size = snprintf(buf,
>> alloc_size,
>> +
>> "%s\t\t\"%s\"\n", buf, str);
>> +					else
>> +						buf_size = snprintf(buf,
>> alloc_size,
>> +
>> "%s\t\t\"%s\",\n", buf, str);
>> +				}
>> +				kfree(str);
>> +				str = NULL;
>> +			}
>> +			buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
>> +			continue;
>> +		}
>> +
>> +		size = 0;
>> +		status = get_integer_from_buffer((int **)&obj-
>>> buffer.pointer, &integer);
>> +		if (ACPI_SUCCESS(status)) {
>> +			/*
>> +			 * Report "PrerequisiteSize" and "Size" values
>> +			 *	...
>> +			 *	"PrerequisiteSize": 1,
>> +			 *	...
>> +			 *	"Size": 2,
>> +			 *	...
>> +			 */
>> +			if (i == 7)
>> +				size = integer;
>> +			else if (type == HPWMI_ENUMERATION_TYPE && i
>> == 10)
>> +				size = integer;
>> +			else if (type == HPWMI_ORDEREDLIST_TYPE && i ==
>> 9)
>> +				size = integer;
>> +			else if (type == HPWMI_PASSWORD_TYPE && i ==
>> 11)
>> +				size = integer;
>> +
>> +			buf_size = snprintf(buf, alloc_size, "%s\t\"%s\":
>> %d,\n", buf,
>> +					    hp_wmi_elements[type][i],
>> integer);
>> +		}
>> +
>> +		if (size > 20)
>> +			pr_warn("%s exceeded the maximum number of
>> elements supported or data may be malformed\n",
>> +				hp_wmi_elements[type][i]);
>> +
>> +		if (ACPI_SUCCESS(status) && i == 7) {
>> +			buf_size = snprintf(buf, alloc_size,
>> "%s\t\"Prerequisites\": [\n", buf);
>> +			for (j = 0; j < size; j++) {
>> +				status = get_string_from_buffer((u16
>> **)&obj->buffer.pointer, &str);
>> +				if (ACPI_SUCCESS(status)) {
>> +					buf_size = snprintf(buf, alloc_size,
>> "%s\t\t\"%s\"", buf, str);
>> +
>> +					if (j == size - 1)
>> +						buf_size = snprintf(buf,
>> alloc_size, "%s\n", buf);
>> +					else
>> +						buf_size = snprintf(buf,
>> alloc_size, "%s,\n", buf);
>> +
>> +				}
>> +				kfree(str);
>> +				str = NULL;
>> +			}
>> +			buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
>> +		}
>> +	}
>> +
>> +	if (type == HPWMI_ENUMERATION_TYPE || type ==
>> HPWMI_ORDEREDLIST_TYPE) {
>> +		if (type == HPWMI_ENUMERATION_TYPE)
>> +			buf_size = snprintf(buf, alloc_size,
>> "%s\t\"PossibleValues\": [\n", buf);
>> +		else
>> +			buf_size = snprintf(buf, alloc_size,
>> "%s\t\"Elements\": [\n", buf);
>> +
>> +		for (i = 0; i < size; i++) {
>> +			status = get_string_from_buffer((u16 **)&obj-
>>> buffer.pointer, &str);
>> +			if (ACPI_SUCCESS(status)) {
>> +				buf_size = snprintf(buf, alloc_size,
>> "%s\t\t\"%s\"", buf, str);
>> +
>> +				if (i == size - 1)
>> +					buf_size = snprintf(buf, alloc_size,
>> "%s\n", buf);
>> +				else
>> +					buf_size = snprintf(buf, alloc_size,
>> "%s,\n", buf);
>> +
>> +			}
>> +			kfree(str);
>> +			str = NULL;
>> +		}
>> +		buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
>> +	}
>> +
>> +	/*
>> +	 * remove trailing comma
>> +	 */
>> +	if (buf_size > 3)
>> +		buf[buf_size - 2] = ' ';
>> +
>> +	return snprintf(buf, alloc_size, "%s},\n", buf);
>> +}
>> +
>> +static int hp_bios_settings_free_buffer(void)
>> +{
>> +	mutex_lock(&buf_mutex);
>> +	kfree(hp_bios_settings_buffer);
>> +	settings_buffer_size = 0;
>> +	buf_alloc_size = 0;
>> +	mutex_unlock(&buf_mutex);
>> +
>> +	return 0;
>> +}
>> +
>> +static int hp_bios_settings_realloc_buffer(char **buf, int *buf_size,
>> +					   int *alloc_size,
>> +					   struct mutex *buf_mutex)
>> +{
>> +	int new_buffer_size;
>> +	char *new_buf = NULL;
>> +	int ret = 0;
>> +
>> +	if (*buf_size + PAGE_SIZE >= *alloc_size) {
>> +		new_buffer_size = buf_alloc_size + 2 * PAGE_SIZE;
>> +
>> +		mutex_lock(buf_mutex);
>> +		new_buf = krealloc(*buf, new_buffer_size, GFP_KERNEL);
>> +		mutex_unlock(buf_mutex);
>> +		if (new_buf) {
>> +			mutex_lock(buf_mutex);
>> +			*buf = new_buf;
>> +			*alloc_size = ksize(new_buf);
>> +			mutex_unlock(buf_mutex);
>> +		} else {
>> +			hp_bios_settings_free_buffer();
>> +			ret = -ENOMEM;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int append_settings_to_buffer(char *guid, int type, char **buf,
>> +				     int *buf_size, int *alloc_size,
>> +				     struct mutex *buf_mutex)
>> +{
>> +	union acpi_object *obj = NULL;
>> +	int ret = 0;
>> +	int status = 0;
>> +	int instance = 0;
>> +
>> +	/*
>> +	 * Query all the instances until to receive a AE_BAD_PARAMETER
>> +	 */
>> +	do {
>> +		ret = hp_wmi_get_setting_object(guid, instance++, &obj);
>> +		if (ACPI_SUCCESS(ret) && obj != NULL) {
>> +			status = 0;
>> +			if (obj->type == ACPI_TYPE_PACKAGE) {
>> +				mutex_lock(buf_mutex);
>> +				status =
>> append_package_elements_to_buffer(obj,
>> +							*buf, *alloc_size,
>> type);
>> +				if (status > 0)
>> +					*buf_size = status;
>> +				mutex_unlock(buf_mutex);
>> +
>> +			} else if (obj->type == ACPI_TYPE_BUFFER) {
>> +				mutex_lock(buf_mutex);
>> +				status =
>> append_buffer_elements_to_buffer(obj,
>> +							*buf, *alloc_size,
>> type);
>> +				if (status > 0)
>> +					*buf_size = status;
>> +				mutex_unlock(buf_mutex);
>> +
>> +			} else
>> +				pr_warn("The retrieved object type(%d) is
>> not supported yet\n",
>> +					obj->type);
>> +
>> +			ret = hp_bios_settings_realloc_buffer(buf, buf_size,
>> alloc_size, buf_mutex);
>> +		}
>> +
>> +		kfree(obj);
>> +		obj = NULL;
>> +
>> +	} while (ACPI_SUCCESS(ret));
>> +
>> +	/*
>> +	 * AE_BAD_PARAMETER means the loop ended by exhaustion
>> +	 */
>> +	if (ret == AE_BAD_PARAMETER)
>> +		ret = 0;
>> +
>> +	return ret;
>> +}
>> +
>> +static int hp_bios_settings_fill_buffer(void)
>> +{
>> +	int status = 0;
>> +	int initial_buffer_size = 20 * PAGE_SIZE;
>> +
>> +	mutex_lock(&buf_mutex);
>> +	hp_bios_settings_buffer = kmalloc(initial_buffer_size, GFP_KERNEL);
>> +	mutex_unlock(&buf_mutex);
>> +	if (!hp_bios_settings_buffer)
>> +		return -ENOMEM;
>> +
>> +	mutex_lock(&buf_mutex);
>> +	buf_alloc_size = ksize(hp_bios_settings_buffer);
>> +	settings_buffer_size = snprintf(hp_bios_settings_buffer,
>> +					buf_alloc_size, "[\n");
>> +	mutex_unlock(&buf_mutex);
>> +
>> +	status = append_settings_to_buffer(HPWMI_STRING_GUID,
>> +		HPWMI_STRING_TYPE, &hp_bios_settings_buffer,
>> +		&settings_buffer_size, &buf_alloc_size, &buf_mutex);
>> +	if (ACPI_FAILURE(status))
>> +		pr_err("error 0x%x occurred retrieving string instances\n",
>> status);
>> +
>> +	status = append_settings_to_buffer(HPWMI_INTEGER_GUID,
>> +		HPWMI_INTEGER_TYPE, &hp_bios_settings_buffer,
>> +		&settings_buffer_size, &buf_alloc_size, &buf_mutex);
>> +	if (ACPI_FAILURE(status))
>> +		pr_err("error 0x%x occurred retrieving integer instances\n",
>> status);
>> +
>> +	status = append_settings_to_buffer(HPWMI_ENUMERATION_GUID,
>> +		HPWMI_ENUMERATION_TYPE, &hp_bios_settings_buffer,
>> +		&settings_buffer_size, &buf_alloc_size, &buf_mutex);
>> +	if (ACPI_FAILURE(status))
>> +		pr_err("error 0x%x occurred retrieving enumeration
>> instances\n", status);
>> +
>> +	status = append_settings_to_buffer(HPWMI_ORDEREDLIST_GUID,
>> +		HPWMI_ORDEREDLIST_TYPE, &hp_bios_settings_buffer,
>> +		&settings_buffer_size, &buf_alloc_size, &buf_mutex);
>> +	if (ACPI_FAILURE(status))
>> +		pr_err("error 0x%x occurred retrieving ordered list
>> instances\n", status);
>> +
>> +	status = append_settings_to_buffer(HPWMI_PASSWORD_GUID,
>> +		HPWMI_PASSWORD_TYPE, &hp_bios_settings_buffer,
>> +		&settings_buffer_size, &buf_alloc_size, &buf_mutex);
>> +	if (ACPI_FAILURE(status))
>> +		pr_err("error 0x%x occurred retrieving password list
>> instances\n", status);
>> +
>> +	mutex_lock(&buf_mutex);
>> +	/*
>> +	 * remove trailing comma
>> +	 */
>> +	if (settings_buffer_size >= 3) {
>> +		if (hp_bios_settings_buffer[settings_buffer_size - 2] == ',')
>> +			hp_bios_settings_buffer[settings_buffer_size - 2] = '
>> ';
>> +	}
>> +	settings_buffer_size = snprintf(hp_bios_settings_buffer,
>> +					buf_alloc_size, "%s]\n",
>> +					hp_bios_settings_buffer);
>> +	mutex_unlock(&buf_mutex);
>> +
>> +	return settings_buffer_size;
>> +}
>> +
>> +/*
>> + * sure_admin_settings_read - Return a formatted file with settings
>> + *                              and possible options read from BIOS
>> + *
>> + * @filp:  Pointer to file of settings read from BIOS
>> + * @kobj:  Pointer to a kernel object of things that show up as directory in
>> the sysfs filesystem.
>> + * @attr:  Pointer to list of read attributes
>> + * @buf:   Pointer to buffer
>> + * @off:   File current offset
>> + * @count: Buffer size
>> + *
>> + * Returns the count of unicode chars read if successful, otherwise
>> + *		-ENOMEM unable to allocate memory
>> + *		-EINVAL buffer not allocated or too small
>> + *
>> + */
>> +static ssize_t sure_admin_settings_read(struct file *filp, struct kobject
>> *kobj,
>> +					struct bin_attribute *attr, char *buf,
>> loff_t off, size_t count)
>> +{
>> +	ssize_t ret;
>> +
>> +	/* clear the buffer when offset is pointing to the last position */
>> +	if (off >= settings_buffer_size && settings_buffer_size > 0) {
>> +		hp_bios_settings_free_buffer();
>> +		return 0;
>> +	}
>> +
>> +	/* clear the buffer whenever the read starts from the first position
>> */
>> +	if (off == 0 && settings_buffer_size > 0)
>> +		hp_bios_settings_free_buffer();
>> +
>> +	if (settings_buffer_size == 0)
>> +		hp_bios_settings_fill_buffer();
>> +
>> +	mutex_lock(&buf_mutex);
>> +	ret = memory_read_from_buffer(buf, count, &off,
>> hp_bios_settings_buffer,
>> +				      settings_buffer_size);
>> +	mutex_unlock(&buf_mutex);
>> +
>> +	return ret;
>> +}
>> +
>> +
>> +/*
>> + * ascii_to_utf16_unicode -  Convert ascii string to UTF-16 unicode
>> + *
>> + * @p:   Unicode buffer address
>> + * @str: string to convert to unicode
>> + *
>> + * Returns a void pointer to the buffer containing unicode string
>> + */
>> +static void *ascii_to_utf16_unicode(u16 *p, const u8 *str)
>> +{
>> +	int len = strlen(str);
>> +
>> +	/*
>> +	 * Add null character when reading an empty string
>> +	 */
>> +	if (len == 0) {
>> +		*p++ = 2;
>> +		*p++ = (u8)0x00;
>> +		return p;
>> +	}
>> +	*p++ = len * 2;
>> +	utf8s_to_utf16s(str, strlen(str), UTF16_HOST_ENDIAN, p, len);
>> +	p += len;
>> +
>> +	return p;
>> +}
>> +
>> +/*
>> + * hp_wmi_set_bios_setting - Set setting's value in BIOS
>> + *
>> + * @input_buffer: Input buffer address
>> + * @input_size:   Input buffer size
>> + *
>> + * Returns: Count of unicode characters written to BIOS if successful,
>> otherwise
>> + *		-ENOMEM unable to allocate memory
>> + *		-EINVAL buffer not allocated or too small
>> + */
>> +static int hp_wmi_set_bios_setting(u16 *input_buffer, u32 input_size)
>> +{
>> +	union acpi_object *obj;
>> +	struct acpi_buffer input = {input_size, input_buffer};
>> +	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
>> +	int ret = 0;
>> +
>> +	ret = wmi_evaluate_method(HPWMI_SETBIOSSETTING_GUID, 0, 1,
>> &input, &output);
>> +
>> +	obj = output.pointer;
>> +	if (!obj)
>> +		return -EINVAL;
>> +
>> +	if (obj->type != ACPI_TYPE_INTEGER)
>> +		ret = -EINVAL;
>> +
>> +	ret = obj->integer.value;
>> +	kfree(obj);
>> +	return ret;
>> +}
>> +
>> +/* Sure Admin Functions */
>> +
>> +#define UTF_PREFIX			((unsigned char *)"<utf-16/>")
>> +#define BEAM_PREFIX			((unsigned char
>> *)"<BEAM/>")
>> +
>> +/*
>> + * sure_admin_settings_write - Write the contents of a formatted file
>> + *                               with settings and performs the logic
>> + *                               to change any settings in BIOS.
>> + *
>> + * @filp:  Pointer to file of settings to be written to BIOS
>> + * @kobj:  Pointer to a kernel object of things that show up as directory in
>> the sysfs filesystem.
>> + * @attr:  Pointer to list of attributes for the write operation
>> + * @buf:   Pointer to buffer
>> + * @off:   File current offset
>> + * @count: Buffer size
>> + *
>> + *
>> + * Returns the count of unicode characters written to BIOS if successful,
>> otherwise
>> + *		-ENOMEM unable to allocate memory
>> + *		-EINVAL buffer not allocated or too small
>> + *
>> + */
>> +static ssize_t sure_admin_settings_write(struct file *filp, struct kobject
>> *kobj,
>> +			struct bin_attribute *attr, char *buf, loff_t off, size_t
>> count)
>> +{
>> +	int status = 0;
>> +	char *part = NULL;
>> +	int part_len = 0;
>> +	unsigned short *buffer = NULL;
>> +	unsigned short *tmpstr = NULL;
>> +	int buffer_size = (count + strlen(UTF_PREFIX)) * sizeof(unsigned
>> short);
>> +
>> +	buffer = kmalloc(buffer_size, GFP_KERNEL);
>> +	if (!buffer)
>> +		return -ENOMEM;
>> +
>> +	tmpstr = buffer;
>> +	part = strsep(&buf, ",");
>> +	if (!part) {
>> +		status = -EINVAL;
>> +		goto out_free;
>> +	}
>> +	tmpstr = ascii_to_utf16_unicode(tmpstr, part);
>> +	part = strsep(&buf, ",");
>> +	if (!part) {
>> +		status = -EINVAL;
>> +		goto out_free;
>> +	}
>> +
>> +	/* Add extra buffer space when encountering an empty string */
>> +	if (!strlen(part))
>> +		buffer_size += sizeof(unsigned short);
>> +	tmpstr = ascii_to_utf16_unicode(tmpstr, part);
>> +	part = strsep(&buf, ",");
>> +	if (!part) {
>> +		status = -EINVAL;
>> +		goto out_free;
>> +	}
>> +	part_len = strlen(part) - 1;
>> +	part[part_len] = '\0';
>> +
>> +	if (strncmp(part, BEAM_PREFIX, strlen(BEAM_PREFIX)) == 0) {
>> +	       /*
>> +		* BEAM_PREFIX is append to buffer when a signature
>> +		* is provided and Sure Admin is enabled in BIOS
>> +		*/
>> +		// BEAM_PREFIX found, convert part to unicode
>> +		tmpstr = ascii_to_utf16_unicode(tmpstr, part);
>> +		// decrease buffer size allocated initially for UTF_PREFIX
>> +		buffer_size -= strlen(UTF_PREFIX) * sizeof(unsigned short);
>> +	} else {
>> +		/*
>> +		 * UTF-16 prefix is append to the * buffer when a BIOS
>> +		 * admin password is configured in BIOS
>> +		 */
>> +
>> +		// append UTF_PREFIX to part and then convert it to unicode
>> +		part = kasprintf(GFP_KERNEL, "%s%s", UTF_PREFIX, part);
>> +		if (!part)
>> +			goto out_free;
>> +
>> +		tmpstr = ascii_to_utf16_unicode(tmpstr, part);
>> +		kfree(part);
>> +	}
>> +
>> +	part = strsep(&buf, ",");
>> +	if (part) {
>> +		status = -EINVAL;
>> +		goto out_free;
>> +	}
>> +	status = hp_wmi_set_bios_setting(buffer, buffer_size);
>> +	if (ACPI_FAILURE(status))
>> +		status = -EINVAL;
>> +
>> +out_free:
>> +	kfree(buffer);
>> +	if (ACPI_SUCCESS(status))
>> +		return count;
>> +	return status;
>> +}
>> +
>> +HPWMI_BINATTR_RW(sure_admin, settings, 0);
>> +
>> +static struct bin_attribute *sure_admin_binattrs[] = {
>> +	&sure_admin_settings,
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group sure_admin_group = {
>> +	.name = "sure_admin",
>> +	.bin_attrs = sure_admin_binattrs,
>> +};
>> +
>>  static DEVICE_ATTR_RO(display);
>>  static DEVICE_ATTR_RO(hddtemp);
>>  static DEVICE_ATTR_RW(als);
>> @@ -1050,6 +2026,7 @@ static const struct attribute_group
>> *hp_wmi_groups[] = {
>>  	&hp_wmi_group,
>>  	&spm_group,
>>  	&sure_start_group,
>> +	&sure_admin_group,
>>  	NULL,
>>  };
>>
>> --
>> 2.25.1

