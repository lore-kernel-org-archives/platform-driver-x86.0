Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2623C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 11:32:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8512861130
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 11:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233309AbhDGLcV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 07:32:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20330 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343678AbhDGLcT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 07:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617795129;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6DNqELqEPoC18vTA2faXSwqpYg0ZHv77aCEMwoUaR0c=;
        b=aySWvH4I0tKyJgHzk4uCusPtanfqxXiZSoCeqeMOhh40QDuOaMSlYnb+D/gJHUe9BvthXp
        5sn0hViN90O4s9ZS2vm79jIx/50cxPaeV+g/VdMfhslexXRipS/0UDbtROrKJ7RLo1wdKD
        4AvFveT9Y/cqea/H1M4y8GJp4vylNeE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-9xP4oaBDMuCG1NM0C0-TPg-1; Wed, 07 Apr 2021 07:32:08 -0400
X-MC-Unique: 9xP4oaBDMuCG1NM0C0-TPg-1
Received: by mail-ed1-f71.google.com with SMTP id h9so4975931edb.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 04:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6DNqELqEPoC18vTA2faXSwqpYg0ZHv77aCEMwoUaR0c=;
        b=sHvOxDZQKjMsEVMiQa7CSF1v0Wl1Rpe2iqkApaFQVA3nKjxetRHF9+JmEJ3Zzhdevg
         05LC0dLe0E/im/7RST64b/VsPes13adD+pgRaj0Ts6tIiSssQCODWA1yfpikGuNI0xNp
         tY1zehWZG0H4ucQBTnMBUpColsI7QT1FZTHZtlhquikLq7PuVXWbt3dkJaiybP7/eCW7
         NXd6sOufE+CgX2nMge85pxseZ7WqlA3PKVZ05h1D8XqX83J+bFaVY7RjyJ/QrybPOvxz
         hjbKstQRhWwKNbfLp+2cqsAKlFICqjY2JUXOEDCSlLG2HxZvTVGatRY8vELqoKu/saM6
         6IlQ==
X-Gm-Message-State: AOAM530TTb58GJtb8fp9/ugjRfDZA4CLTxHocZjdP6+yxNnjZrE/1Rco
        xidP1EmgWwly3YtOrPsnnnVHO+Tvk8crUi7JD7MboYQKCgpfP1toVf02gmaG1NTFUxhbcrpjH0v
        mvvaUGMGgy6cw07FISIZDXICsHCjyO8HlmQ==
X-Received: by 2002:a17:906:18a1:: with SMTP id c1mr3092843ejf.62.1617795126771;
        Wed, 07 Apr 2021 04:32:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0pSPNONzeAkk30DPKgXInRRhLmJ4bYTYB/FU4oE9Vp4KJK+Er8jtd9Z9B9a65oItoeJFIoA==
X-Received: by 2002:a17:906:18a1:: with SMTP id c1mr3092820ejf.62.1617795126539;
        Wed, 07 Apr 2021 04:32:06 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q16sm15675425edv.61.2021.04.07.04.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 04:32:05 -0700 (PDT)
Subject: Re: RE: [PATCH v2] platform/x86: dell-wmi-sysman: Make
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
 <69d0c17a-a24b-6cf3-9acc-e6c4398c9a9c@redhat.com>
 <DM6PR19MB3676CB7EC5181819843A75DF827E9@DM6PR19MB3676.namprd19.prod.outlook.com>
 <3af4f3ba-d444-8b43-bb6f-e0adb17ff2f3@redhat.com>
 <DM6PR19MB36768A7F5E58CAF6562DE6A5827B9@DM6PR19MB3676.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3c2c2b73-54ad-9597-f647-83f260284a0c@redhat.com>
Date:   Wed, 7 Apr 2021 13:32:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB36768A7F5E58CAF6562DE6A5827B9@DM6PR19MB3676.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/1/21 6:45 PM, Ksr, Prasanth wrote:
> Hi,
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Tuesday, March 30, 2021 1:24 PM
>> To: Ksr, Prasanth; Mark Gross; Andy Shevchenko
>> Cc: Limonciello, Mario; Bharathi, Divya; Alexander Naumann; platform-driver-
>> x86@vger.kernel.org; Yuan, Perry
>> Subject: Re: [PATCH v2] platform/x86: dell-wmi-sysman: Make
>> init_bios_attributes() ACPI object parsing more robust
>>
>>
>> [EXTERNAL EMAIL]
>>
>> Hi,
>>
>> On 3/29/21 6:00 PM, Ksr, Prasanth wrote:
>>> Hi,
>>>
>>>> -----Original Message-----
>>>> From: Hans de Goede <hdegoede@redhat.com>
>>>> Sent: Friday, March 26, 2021 10:14 PM
>>>> To: Ksr, Prasanth; Mark Gross; Andy Shevchenko
>>>> Cc: Limonciello, Mario; Bharathi, Divya; Alexander Naumann;
>>>> platform-driver- x86@vger.kernel.org; Yuan, Perry
>>>> Subject: Re: [PATCH v2] platform/x86: dell-wmi-sysman: Make
>>>> init_bios_attributes() ACPI object parsing more robust
>>>>
>>>>
>>>> [EXTERNAL EMAIL]
>>>>
>>>> Hi,
>>>>
>>>> On 3/26/21 4:40 PM, Ksr, Prasanth wrote:
>>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>> [EXTERNAL EMAIL]
>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 3/21/21 1:16 PM, Hans de Goede wrote:
>>>>>>> Make init_bios_attributes() ACPI object parsing more robust:
>>>>>>> 1. Always check that the type of the return ACPI object is
>>>>>>> package,
>>>> rather
>>>>>>>    then only checking this for instance_id == 0 2. Check that the
>>>>>>> package has the minimum amount of elements which will
>>>>>>>    be consumed by the populate_foo_data() for the attr_type
>>>>>>>
>>>>>>> Note/TODO: The populate_foo_data() functions should also be made
>>>>>>> more robust. The should check the type of each of the elements
>>>>>>> matches the type which they expect and in case of
>>>>>>> populate_enum_data()
>>>>>>> obj->package.count should be passed to it as an argument and it
>>>>>>> obj->should
>>>>>>> re-check this itself since it consume a variable number of elements.
>>>>>>>
>>>>>>> Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems
>>>>>>> Management Driver over WMI for Dell Systems")
>>>>>>> Cc: Divya Bharathi <Divya_Bharathi@dell.com>
>>>>>>> Cc: Mario Limonciello <mario.limonciello@dell.com>
>>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>>> ---
>>>>>>> Changes in v2:
>>>>>>> - Restore behavior of returning -ENODEV when the
>>>> get_wmiobj_pointer() call
>>>>>>>   for instance_id == 0 returns NULL. Otherwise
>>>>>>>   /sys/class/firmware-attributes/dell-wmi-sysman will get created
>>>>>>> with
>>>> an
>>>>>>>   empty attributes dir (empty except for pending_reboot and
>>>>>>> reset_bios)
>>>>>
>>>>>> So the reason for this change in v2 is that testing on a Dell Latitude
>> E5570:
>>>>>> https://bugzilla.redhat.com/show_bug.cgi?id=1936171
>>>>>>
>>>>>> With v1 of this patch results in an empty attributes dir (empty
>>>>>> except for
>>>> pending_reboot and reset_bios), interestingly enough there are both
>>>> System and Admin dirs created under Authentication, so the BIOS of
>>>> this device seems to have the GUIDs for both the attributes and the
>>>> authentication interfaces; and it >has the 2 standard authentication
>>>> objects, theoretically allowing changing the BIOS passwords from
>>>> within Linux, but it does not advertise any attributes which can be
>> changed.
>>>>>>
>>>>>> With the new v2 patch, the driver will now simply refuse to load
>>>>>> (and it
>>>> should no longer crash during cleanup because of the other patches).
>>>>>>
>>>>>> But I wonder what is actually the right thing to do here ?
>>>>>> Arguably being
>>>> able to change the BIOS passwords has some value on its own ?
>>>>>>
>>>>>> Mario, what is your take on this?
>>>>>
>>>>> Ideally we should not be hitting this code path at all. I am working
>>>>> with
>>>> perry to see the results after applying the patches on the system.
>>>>> If this is behavior we consistently see on older system BIOS then we
>>>>> will
>>>> patch the code to avoid code path and bail out early not loading the
>> driver.
>>>>
>>>> With v2 of my patches (which have been merged) we do bail out as soon
>>>> as it is clear that there is no enum-type (*) attribute with
>>>> instance_id 0. That is pretty-much the earliest that we can bail and that
>> works fine.
>>>>
>>>> What I was wondering is if that is the right thing to do though. On
>>>> the E5570 there seem to be no enum/int/str attributes at all but what
>>>> if there are enum
>>>> + int attributes + no str attributes for example ?
>>>>
>>> It would be right thing to do because this scenario happens because of
>> some BIOS issue.
>>
>> Right, this is the right thing to do on machines such as the Latitude E5570.
>>
>> My question is more, what if, in the future some machine does not have say
>> string bios-attributes, but it does have enum and int attributes ?
>>
>> The current code will then still refuse to bind / load, which seems wrong.
>>
>> Note that on the E5570 there are no enum and no string and no int
>> attributes, so we could also delay the return -ENODEV until after we have
>> enumerated all 3 types and if all 3 have a wmi_priv.foo_instances_count of 0
>> then return -ENODEV that seems like the logical thing to do here to me.
> 
> It is not only with Latitude E5570 and this device is an example of one such case which we are mentioning
> We expect all 3 categories to be present always for supported platforms. Even a system with minimal BIOS attributes will have at least few mandatory attributes in each of the three categories.
> If BIOS don't have any one category GUID exposed then it will be faulty BIOS and our driver must refuse to bind/load. Hence, we believe that current code has right logic.

Ok, so that means that this v2 is doing the right thing, as this version returns -ENODEV if any of the types are missing, just as before.

Since this adds a couple of useful robustness checks I'm going to merge this now.

As mentioned before, can you (Prasanth and/or Divya) please take care of the TODO from the commit message:

TODO: The populate_foo_data() functions should also be made more
robust. The should check the type of each of the elements matches the
type which they expect and in case of populate_enum_data()
obj->package.count should be passed to it as an argument and it should
re-check this itself since it consume a variable number of elements.

Regards,

Hans

