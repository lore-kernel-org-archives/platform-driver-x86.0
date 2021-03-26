Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD1EC433E1
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Mar 2021 16:44:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBE8861A43
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Mar 2021 16:44:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbhCZQoH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Mar 2021 12:44:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46996 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230114AbhCZQoA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Mar 2021 12:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616777039;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f0x02R0fb6d4/akijA22i8EZv6wplmRRZJUVSUqb220=;
        b=BoV26slmagmJjODsZjkV2VX0C/bA+41ucZjNsdMTzfXWNWyLcsQIZ3IoAf215gMLNZsGXR
        4LsBul+vKapVV7glPprKJ3QWteDEhaS0/skESy3IUTZRYiiF4Bk6JbrlWVUZQFsDhwVk2D
        Wi+ZbLJss+BFlcaqeXreJLcix8cjXrk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-HhsdUTc-OgmHk_g2ys0qQg-1; Fri, 26 Mar 2021 12:43:57 -0400
X-MC-Unique: HhsdUTc-OgmHk_g2ys0qQg-1
Received: by mail-ej1-f72.google.com with SMTP id di5so4338049ejc.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Mar 2021 09:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f0x02R0fb6d4/akijA22i8EZv6wplmRRZJUVSUqb220=;
        b=CaM+lTbA2W8huakmEKWrPJq91/uanYXeFT/j/wTctWhhcxAU55GtHQxzyXgBbS9jH2
         2yesF5kozpYH58BDK7d74f4QIRW6ndoD+oL9Wq6swSTghIOejXgPKGZB89gx5LOYBcnk
         Z5prsXXsCqelrLV9O93hN+2jxMDs7SnIyBvuAwEIMzfnI3JIsWISEyESmmUNkZVtF91U
         4Th1CtIn2FP6jSCDCeheRgaUgSJmS9dgqj3K2UGdiI1kX2I+89dcUCZECNBHMSxvp71e
         dzVnUr5dMjqQcEHMRAv220/YpN5ehDM7SJMr2Xsq65MFNetg78HvDm/9iJQ7AQG6ffYB
         7Zxw==
X-Gm-Message-State: AOAM530DEBinCetNDUGDJ/mMT7IlSPgSkXtyD3uzheGW6YlPnS5FQK9W
        u074Zr20A/s2eGH/Da8Mld7EjD1siHpqreci0YV1uGcV/LjA1sp8pFrcVwVKKJHXyEGjNAzLa1u
        DV7bpq5Wi0XZm73PMuHgRob5DYNPlr9f3iA==
X-Received: by 2002:a05:6402:30b9:: with SMTP id df25mr16705286edb.136.1616777036389;
        Fri, 26 Mar 2021 09:43:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxC8B4MsJdBABmLs1xyOQ3k9U9LlLpXsfxZTtIRJDeGudN83HlZ+PB3WuZs2QwFYdm6VWdZFA==
X-Received: by 2002:a05:6402:30b9:: with SMTP id df25mr16705261edb.136.1616777036153;
        Fri, 26 Mar 2021 09:43:56 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w24sm4454948edt.44.2021.03.26.09.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Mar 2021 09:43:55 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: dell-wmi-sysman: Make
 init_bios_attributes() ACPI object parsing more robust
To:     "Ksr, Prasanth" <Prasanth.Ksr@dell.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Yuan, Perry" <Perry.Yuan@dell.com>
References: <20210321121607.35717-1-hdegoede@redhat.com>
 <bdbbe7e6-7a6b-fa9d-426a-e88135e3c7f5@redhat.com>
 <DM6PR19MB3676F7901C6D1A778396E6DF82619@DM6PR19MB3676.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <69d0c17a-a24b-6cf3-9acc-e6c4398c9a9c@redhat.com>
Date:   Fri, 26 Mar 2021 17:43:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB3676F7901C6D1A778396E6DF82619@DM6PR19MB3676.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/26/21 4:40 PM, Ksr, Prasanth wrote:
> 
> 
> Hi,
> 
> [EXTERNAL EMAIL] 
> 
>> Hi,
>>
>> On 3/21/21 1:16 PM, Hans de Goede wrote:
>>> Make init_bios_attributes() ACPI object parsing more robust:
>>> 1. Always check that the type of the return ACPI object is package, rather
>>>    then only checking this for instance_id == 0 2. Check that the 
>>> package has the minimum amount of elements which will
>>>    be consumed by the populate_foo_data() for the attr_type
>>>
>>> Note/TODO: The populate_foo_data() functions should also be made more 
>>> robust. The should check the type of each of the elements matches the 
>>> type which they expect and in case of populate_enum_data()
>>> obj->package.count should be passed to it as an argument and it should
>>> re-check this itself since it consume a variable number of elements.
>>>
>>> Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems 
>>> Management Driver over WMI for Dell Systems")
>>> Cc: Divya Bharathi <Divya_Bharathi@dell.com>
>>> Cc: Mario Limonciello <mario.limonciello@dell.com>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>> Changes in v2:
>>> - Restore behavior of returning -ENODEV when the get_wmiobj_pointer() call
>>>   for instance_id == 0 returns NULL. Otherwise
>>>   /sys/class/firmware-attributes/dell-wmi-sysman will get created with an
>>>   empty attributes dir (empty except for pending_reboot and 
>>> reset_bios)
> 
>> So the reason for this change in v2 is that testing on a Dell Latitude E5570:
>> https://bugzilla.redhat.com/show_bug.cgi?id=1936171
>>
>> With v1 of this patch results in an empty attributes dir (empty except for pending_reboot and reset_bios), interestingly enough there are both System and Admin dirs created under Authentication, so the BIOS of this device seems to have the GUIDs for both the attributes and the authentication interfaces; and it >has the 2 standard authentication objects, theoretically allowing changing the BIOS passwords from within Linux, but it does not advertise any attributes which can be changed.
>>
>> With the new v2 patch, the driver will now simply refuse to load (and it should no longer crash during cleanup because of the other patches).
>>
>> But I wonder what is actually the right thing to do here ?  Arguably being able to change the BIOS passwords has some value on its own ?
>>
>> Mario, what is your take on this?
> 
> Ideally we should not be hitting this code path at all. I am working with perry to see the results after applying the patches on the system.
> If this is behavior we consistently see on older system BIOS then we will patch the code to avoid code path and bail out early not loading the driver.

With v2 of my patches (which have been merged) we do bail out as soon as it is clear that there is no enum-type (*) attribute
with instance_id 0. That is pretty-much the earliest that we can bail and that works fine.

What I was wondering is if that is the right thing to do though. On the E5570 there seem to be no enum/int/str attributes at all but what if there are enum + int attributes + no str attributes for example ?

Also maybe the BIOS password interface on its own, without having any attributes at all has some value by itself ?

*) enums are the first type we check for

> Also I was not cc'ed on the mail threads where the bugs were discussed so going further please add me and Divya for reporting any issues on the driver

Yes that was my mistake, sorry about that. I'll make sure to Cc Divya and you on future emails about the dell-wmi-sysman driver.

Regards,

Hans




>>> ---
>>>  .../x86/dell/dell-wmi-sysman/sysman.c         | 32 ++++++++++++++++---
>>>  1 file changed, 28 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c 
>>> b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
>>> index 7410ccae650c..a90ae6ba4a73 100644
>>> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
>>> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
>>> @@ -399,6 +399,7 @@ static int init_bios_attributes(int attr_type, const char *guid)
>>>  	union acpi_object *obj = NULL;
>>>  	union acpi_object *elements;
>>> 	struct kset *tmp_set;
>>> +	int min_elements;
>>>
>>>  	/* instance_id needs to be reset for each type GUID
>>>  	 * also, instance IDs are unique within GUID but not across @@ 
>>> -409,14 +410,38 @@ static int init_bios_attributes(int attr_type, const char *guid)
>>>  	retval = alloc_attributes_data(attr_type);
>>>  	if (retval)
>>>  		return retval;
>>> +
>>> +	switch (attr_type) {
>>> +	case ENUM:	min_elements = 8;	break;
>>> +	case INT:	min_elements = 9;	break;
>>> +	case STR:	min_elements = 8;	break;
>>> +	case PO:	min_elements = 4;	break;
>>> +	default:
>>> +		pr_err("Error: Unknown attr_type: %d\n", attr_type);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>>  	/* need to use specific instance_id and guid combination to get right data */
>>>  	obj = get_wmiobj_pointer(instance_id, guid);
>>> -	if (!obj || obj->type != ACPI_TYPE_PACKAGE)
>>> +	if (!obj)
>>>  		return -ENODEV;
>>> -	elements = obj->package.elements;
>>>  
>>>  	mutex_lock(&wmi_priv.mutex);
>>> -	while (elements) {
>>> +	while (obj) {
>>> +		if (obj->type != ACPI_TYPE_PACKAGE) {
>>> +			pr_err("Error: Expected ACPI-package type, got: %d\n", obj->type);
>>> +			retval = -EIO;
>>> +			goto err_attr_init;
>>> +		}
>>> +
>>> +		if (obj->package.count < min_elements) {
>>> +			pr_err("Error: ACPI-package does not have enough elements: %d < %d\n",
>>> +			       obj->package.count, min_elements);
>>> +			goto nextobj;
>>> +		}
>>> +
>>> +		elements = obj->package.elements;
>>> +
>>>  		/* sanity checking */
>>>  		if (elements[ATTR_NAME].type != ACPI_TYPE_STRING) {
>>>  			pr_debug("incorrect element type\n"); @@ -481,7 +506,6 @@ static 
>>> int init_bios_attributes(int attr_type, const char *guid)
>>> 		kfree(obj);
>>>  		instance_id++;
>>>  		obj = get_wmiobj_pointer(instance_id, guid);
>>> -		elements = obj ? obj->package.elements : NULL;
>>> 	}
>>>  
>>>  	mutex_unlock(&wmi_priv.mutex);
>>>
> 

