Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AEFC433DB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Mar 2021 07:54:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACAA661969
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Mar 2021 07:54:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbhC3Hxz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Mar 2021 03:53:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38682 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230209AbhC3Hxg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Mar 2021 03:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617090815;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E1tv3+wneNYg5LoGcysjZnkrvHFPGZfAYkqmayAbxdc=;
        b=PIRUa2QiXqybq+6Ym5iGufRZf44lEB4TVVgxg8NM6aQeN+5cw1o3PsWjIEJ3L1W3vQe9uY
        ukTvEuKUttIjVbOMayyq1yO1mVLp/Wzs+6/+OMCSqyGf4WpAjmCTVb5F+ODq4UqjJDOae2
        2TSx/wxXjjSADydWCqSglDG/zo7hMB8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-DvO2ccSUMD6_8uAFMXNY8A-1; Tue, 30 Mar 2021 03:53:34 -0400
X-MC-Unique: DvO2ccSUMD6_8uAFMXNY8A-1
Received: by mail-ed1-f69.google.com with SMTP id cq11so9775643edb.14
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Mar 2021 00:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E1tv3+wneNYg5LoGcysjZnkrvHFPGZfAYkqmayAbxdc=;
        b=f6WgfbFyJOUNWdTSfexotjYpeFa8z9rzMB/aEHskzubVc9ujy++DNqdAuHUNLk2T44
         IupHqf5oh94us20SwBU/K5OivOU9PgQDTZnKS+OXe9Wa+EQVAYOKpn4i+E63bg86/nv3
         dVSZzaMLpClojo5M6DywQYzvcvwI85p2V/k2oA136gyV8lJkDE7VxkT363/6dTOfNGdB
         dbganjmiN2uyfdwgmMinSAFoYNMaTelUdJ2kcP13x2pr2cN2cplTe0DmPj9yuitTPKLW
         ehm+viNavhfFx4sRHLOPP5RJ3U/K7M1MgtX+COMT8A0uCXnGj6ytL197JyFmNbCE3uyn
         inAw==
X-Gm-Message-State: AOAM531wnlwQ+HD6Ak8x7/AePD4/6vMN6lnjzwgyK+unTA6RLxlsF3jh
        l5f2hJHU27nG75RbWFLPQ8rV3l6mxywJY2sR9JT5GVNOwIseQBrHknQ0CGH8IHpFVC/fi4wQ0A+
        FEJk7zHYWt9g5HzGLt5nzIitENvHbUSsL6A==
X-Received: by 2002:a17:906:688:: with SMTP id u8mr31201055ejb.38.1617090812023;
        Tue, 30 Mar 2021 00:53:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU7KUscNaNh93gl+pcAHJsRjqFjgYOYcmW19Iiu0WfN5mxNgFgMGdnqYrOqeX7X0HiQ0Y+ew==
X-Received: by 2002:a17:906:688:: with SMTP id u8mr31201047ejb.38.1617090811869;
        Tue, 30 Mar 2021 00:53:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r17sm10366499edm.89.2021.03.30.00.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 00:53:31 -0700 (PDT)
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
 <69d0c17a-a24b-6cf3-9acc-e6c4398c9a9c@redhat.com>
 <DM6PR19MB3676CB7EC5181819843A75DF827E9@DM6PR19MB3676.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3af4f3ba-d444-8b43-bb6f-e0adb17ff2f3@redhat.com>
Date:   Tue, 30 Mar 2021 09:53:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB3676CB7EC5181819843A75DF827E9@DM6PR19MB3676.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/29/21 6:00 PM, Ksr, Prasanth wrote:
> Hi,
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Friday, March 26, 2021 10:14 PM
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
>> On 3/26/21 4:40 PM, Ksr, Prasanth wrote:
>>>
>>>
>>> Hi,
>>>
>>> [EXTERNAL EMAIL]
>>>
>>>> Hi,
>>>>
>>>> On 3/21/21 1:16 PM, Hans de Goede wrote:
>>>>> Make init_bios_attributes() ACPI object parsing more robust:
>>>>> 1. Always check that the type of the return ACPI object is package,
>> rather
>>>>>    then only checking this for instance_id == 0 2. Check that the
>>>>> package has the minimum amount of elements which will
>>>>>    be consumed by the populate_foo_data() for the attr_type
>>>>>
>>>>> Note/TODO: The populate_foo_data() functions should also be made
>>>>> more robust. The should check the type of each of the elements
>>>>> matches the type which they expect and in case of
>>>>> populate_enum_data()
>>>>> obj->package.count should be passed to it as an argument and it
>>>>> obj->should
>>>>> re-check this itself since it consume a variable number of elements.
>>>>>
>>>>> Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems
>>>>> Management Driver over WMI for Dell Systems")
>>>>> Cc: Divya Bharathi <Divya_Bharathi@dell.com>
>>>>> Cc: Mario Limonciello <mario.limonciello@dell.com>
>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Restore behavior of returning -ENODEV when the
>> get_wmiobj_pointer() call
>>>>>   for instance_id == 0 returns NULL. Otherwise
>>>>>   /sys/class/firmware-attributes/dell-wmi-sysman will get created with
>> an
>>>>>   empty attributes dir (empty except for pending_reboot and
>>>>> reset_bios)
>>>
>>>> So the reason for this change in v2 is that testing on a Dell Latitude E5570:
>>>> https://bugzilla.redhat.com/show_bug.cgi?id=1936171
>>>>
>>>> With v1 of this patch results in an empty attributes dir (empty except for
>> pending_reboot and reset_bios), interestingly enough there are both
>> System and Admin dirs created under Authentication, so the BIOS of this
>> device seems to have the GUIDs for both the attributes and the
>> authentication interfaces; and it >has the 2 standard authentication objects,
>> theoretically allowing changing the BIOS passwords from within Linux, but it
>> does not advertise any attributes which can be changed.
>>>>
>>>> With the new v2 patch, the driver will now simply refuse to load (and it
>> should no longer crash during cleanup because of the other patches).
>>>>
>>>> But I wonder what is actually the right thing to do here ?  Arguably being
>> able to change the BIOS passwords has some value on its own ?
>>>>
>>>> Mario, what is your take on this?
>>>
>>> Ideally we should not be hitting this code path at all. I am working with
>> perry to see the results after applying the patches on the system.
>>> If this is behavior we consistently see on older system BIOS then we will
>> patch the code to avoid code path and bail out early not loading the driver.
>>
>> With v2 of my patches (which have been merged) we do bail out as soon as it
>> is clear that there is no enum-type (*) attribute with instance_id 0. That is
>> pretty-much the earliest that we can bail and that works fine.
>>
>> What I was wondering is if that is the right thing to do though. On the E5570
>> there seem to be no enum/int/str attributes at all but what if there are enum
>> + int attributes + no str attributes for example ?
>>
> It would be right thing to do because this scenario happens because of some BIOS issue.

Right, this is the right thing to do on machines such as the Latitude E5570.

My question is more, what if, in the future some machine does not have say
string bios-attributes, but it does have enum and int attributes ?

The current code will then still refuse to bind / load, which seems wrong.

Note that on the E5570 there are no enum and no string and no int attributes,
so we could also delay the return -ENODEV until after we have enumerated all 3
types and if all 3 have a wmi_priv.foo_instances_count of 0 then return -ENODEV
that seems like the logical thing to do here to me.

Regards,

Hans

