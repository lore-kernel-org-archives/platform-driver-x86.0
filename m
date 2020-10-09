Return-Path: <SRS0=ZlNf=DQ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16986C433DF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Oct 2020 07:58:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8A6D22269
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Oct 2020 07:58:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XLy5sxcL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732086AbgJIH6d (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Oct 2020 03:58:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58862 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732393AbgJIH6a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Oct 2020 03:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602230308;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iVtewP7s5qyHI/1d+VGBxPQ+aBPBWOMB6+eMQ61/Xu8=;
        b=XLy5sxcLnTKvBZ4WNYUHD6s45lvrBz0soXwzc54pOMzb46uc5rXpcxRBC6teyYJxKsoPqL
        R97oILjxd3lQaL8lx71XrZIIi6kYv+z4oSPc1dn6QTp8nU+AKtohYeFmcjaj25wczFH/8e
        xmtFqzFivDAgnwl9KzC0SL5s0a2+z8Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-hsncOF8dOdW6HuOGsro-wg-1; Fri, 09 Oct 2020 03:58:25 -0400
X-MC-Unique: hsncOF8dOdW6HuOGsro-wg-1
Received: by mail-ej1-f70.google.com with SMTP id t1so3277330ejb.21
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Oct 2020 00:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iVtewP7s5qyHI/1d+VGBxPQ+aBPBWOMB6+eMQ61/Xu8=;
        b=Yzasof+tMPclnUamOKkp8gH8dmS0NerdihJkKLUcuy2mJvw2YFpuDAduB2IpCZaQr7
         ieuzR5fDLOEofkZh0VfRhN1TYMlB17Agjfia0xT3n28JRZ1FXRC3Iisjckn0OBv7BN0c
         bTovbP8tF5/Xrw6/izHK7iPaXRoVBwa+i9umzIA2MaV9QWpmQZT2pq6oLHxs5pWOLie3
         3W40PcE0Kp4ci/eA0CSaGL3JwqIG6xESfqv0Qxgie0UuQ3ZsXux0x5zAPX9OsDm8Svk9
         WhI9ihid912uFlro7OcrT65O38QnmxXADWmV5snQ1tvnFmrh6polLMHYJuEwP1AufEBg
         EGWg==
X-Gm-Message-State: AOAM530cvCIK/EsVqO39XDQsmA6pgxGkC+IwJCAG8dJpdQAwtHbyZFW2
        U3iThxHBOif2vRpmns/HKdYyB8h0+B7cBidXeIpVjGzz1RX6y6nJ5Li8jWa0GViBvvTDCiMycwH
        6l+26T4hYszscev1pMPkjT9EMmQH9bqdKuw==
X-Received: by 2002:a50:c199:: with SMTP id m25mr12731679edf.207.1602230303974;
        Fri, 09 Oct 2020 00:58:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGLLbe5PJGZf0JdhylEg7DAfHZXgLhwZN0l/qVt+kqh4CIT9fmTssJbfbdyLss4r7lfP7SGA==
X-Received: by 2002:a50:c199:: with SMTP id m25mr12731664edf.207.1602230303717;
        Fri, 09 Oct 2020 00:58:23 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id c17sm5876578ejb.15.2020.10.09.00.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 00:58:22 -0700 (PDT)
Subject: Re: [PATCH v5] Introduce support for Systems Management Driver over
 WMI for Dell Systems
To:     "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        Divya Bharathi <divya27392@gmail.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        mark gross <mgross@linux.intel.com>,
        "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        "Ksr, Prasanth" <Prasanth.Ksr@dell.com>
References: <20200929025521.59573-1-divya.bharathi@dell.com>
 <7015e6d5-3c1e-e07e-572f-d5d47a9b0191@redhat.com>
 <CY4PR19MB125486920AE0C6CA105B973A850D0@CY4PR19MB1254.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a7cc8b62-c87a-2253-de7a-7b463589ee4c@redhat.com>
Date:   Fri, 9 Oct 2020 09:58:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CY4PR19MB125486920AE0C6CA105B973A850D0@CY4PR19MB1254.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

HI,

On 10/6/20 10:46 AM, Bharathi, Divya wrote:
> Sorry for another mail on same patch. I missed to add one response on
> previous comments

No problem.

> <snip>
> 
>>> +/**
>>> + * init_bios_attributes() - Initialize all attributes for a type
>>> + * @attr_type: The attribute type to initialize
>>> + * @guid: The WMI GUID associated with this type to initialize
>>> + *
>>> + * Initialiaze all 4 types of attributes enumeration, integer, string and
>> password object.
>>> + * Populates each attrbute typ's respective properties under sysfs files
>>> + **/
>>> +static int init_bios_attributes(int attr_type, const char *guid)
>>> +{
>>> +	struct kobject *attr_name_kobj; //individual attribute names
>>> +	union acpi_object *obj = NULL;
>>> +	union acpi_object *elements;
>>> +	struct kset *tmp_set;
>>> +
>>> +	/* instance_id needs to be reset for each type GUID
>>> +	 * also, instance IDs are unique within GUID but not across
>>> +	 */
>>> +	int instance_id = 0;
>>> +	int retval = 0;
>>> +
>>> +	retval = alloc_attributes_data(attr_type);
>>> +	if (retval)
>>> +		return retval;
>>> +	/* need to use specific instance_id and guid combination to get right
>> data */
>>> +	obj = get_wmiobj_pointer(instance_id, guid);
>>> +	if (!obj)
>>> +		return -ENODEV;
>>> +	elements = obj->package.elements;
>>> +
>>> +	mutex_lock(&wmi_priv.mutex);
>>> +	while (elements) {
>>> +		/* sanity checking */
>>> +		if (strlen(elements[ATTR_NAME].string.pointer) == 0) {
>>> +			pr_debug("empty attribute found\n");
>>> +			goto nextobj;
>>> +		}
>>> +		if (attr_type == PO)
>>> +			tmp_set = wmi_priv.authentication_dir_kset;
>>> +		else
>>> +			tmp_set = wmi_priv.main_dir_kset;
>>> +
>>> +		if (kset_find_obj(tmp_set,
>> elements[ATTR_NAME].string.pointer)) {
>>> +			pr_debug("duplicate attribute name found - %s\n",
>>> +				elements[ATTR_NAME].string.pointer);
>>> +			goto nextobj;
>>> +		}
>>> +
>>> +		/* build attribute */
>>> +		attr_name_kobj = kzalloc(sizeof(*attr_name_kobj),
>> GFP_KERNEL);
>>> +		if (!attr_name_kobj)
>>> +			goto err_attr_init;
>>> +
>>> +		attr_name_kobj->kset = tmp_set;
>>> +
>>> +		retval = kobject_init_and_add(attr_name_kobj,
>> &attr_name_ktype, NULL, "%s",
>>> +
>> 	elements[ATTR_NAME].string.pointer);
>>> +		if (retval) {
>>> +			kobject_put(attr_name_kobj);
>>> +			goto err_attr_init;
>>> +		}
>>> +
>>> +		/* enumerate all of this attribute */
>>> +		switch (attr_type) {
>>> +		case ENUM:
>>> +			retval = populate_enum_data(elements, instance_id,
>> attr_name_kobj);
>>> +			break;
>>> +		case INT:
>>> +			retval = populate_int_data(elements, instance_id,
>> attr_name_kobj);
>>> +			break;
>>> +		case STR:
>>> +			retval = populate_str_data(elements, instance_id,
>> attr_name_kobj);
>>> +			break;
>>> +		case PO:
>>> +			retval = populate_po_data(elements, instance_id,
>> attr_name_kobj);
>>> +			break;
>>> +		default:
>>> +			break;
>>> +		}
>>
>> The show functions don't take the mutex and can be called as soon as
>> kobject_init_and_add() is called, so it would be better to first populate the
>> data for the current instance_id and only then call kobject_init_and_add()
>>
> 
> Populate functions called here for each type of attribute uses
> attribute_koject which helps in attribute group cleanup.

Good point, and we do allocate the data before creating the kobjects,
so if a user manages to hit the race (which almost certainly would have
to be done intentionally) then the read would just result in an empty
string (rather then say a null pointer dereference oops).

So lets just keep this as is.

Regards,

Hans

