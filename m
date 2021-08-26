Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BE6C432BE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Aug 2021 14:13:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 346CC60F5C
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Aug 2021 14:13:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbhHZOOc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 Aug 2021 10:14:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35699 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230157AbhHZOOc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Aug 2021 10:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629987224;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e3uC2EY1LceT6qW2aK6miw6pPA/JGb/zIDNGbteB/2Y=;
        b=iUQBz6t83iQBbrqIkdfePkRWlyMqAECuKs8DrGqkoIONsXFACk7EAiOJMaVR36h58nft9c
        k98z6irzKmLGfZPEcSgxEcBCagekFFyY+vZYPkjPbTdt9+yH/ChJtV2fS1xMm9EZYsT5mr
        pHD/NqQbsPHIMomZsxB7Di9hC1Fh8Yg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-sYp2F0_eN1OripNm7ghAvA-1; Thu, 26 Aug 2021 10:13:43 -0400
X-MC-Unique: sYp2F0_eN1OripNm7ghAvA-1
Received: by mail-ed1-f70.google.com with SMTP id e6-20020a056402088600b003c73100e376so1545768edy.17
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2021 07:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e3uC2EY1LceT6qW2aK6miw6pPA/JGb/zIDNGbteB/2Y=;
        b=tQaD7iG6Ofm1jeBBZiaDwCBYn8O/BKvEKreSSVPBPyD1OuGXQStLuHhnaia2K6dA25
         1r6T6deQubJfFCSjyVVfAwCc5Oy6s+N0fSP/FeEFubcnzFuek33UhUwYBj2BU/jQqaXm
         GvUSmlCKG5No2BcV/hBrY1roKwgMMuYM35KjlVJDwuFjb13BAsV/VV6orjZTnDxAxOjd
         XIXMwKtrSVHMytaoQQLC1kFU3Eb2zp2PV6FBV4XK1XbKLdN4c4sqnGFgJB9uteIu0+ni
         DT9Kyjug3bfloV7DrVtA6mEalJvrRo3M5mDQRmNzlSl+DS54Migxa+z1gqvOmg0Za2r2
         +5mg==
X-Gm-Message-State: AOAM532WyLqx9sEGgBgnemojzLT1Rg04/vYel1qjxCk7Ki4S5J9nQOeJ
        JJ8qaJerjrr87vZaJVMu840BamT2vHqPp7C++RQeFsIHh/0dvDbjfvjUezSUA1vlJNvU6CPaRIj
        8h5WEDValci12ztIeADLtczznq1Fu0l8p8g==
X-Received: by 2002:aa7:d1d3:: with SMTP id g19mr4407388edp.373.1629987222215;
        Thu, 26 Aug 2021 07:13:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytHQC8D2kcGsC1Rn47qA9Q+EHGZleoUlGt5F8nqQJ9Q0znQ7lAOtMhZF++LpN5nhC92m/Eqw==
X-Received: by 2002:aa7:d1d3:: with SMTP id g19mr4407359edp.373.1629987221947;
        Thu, 26 Aug 2021 07:13:41 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r27sm1895335edb.66.2021.08.26.07.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 07:13:41 -0700 (PDT)
Subject: Re: [PATCH v3] platform/x86: hp-wmi: add support for omen laptops
To:     Guenter Roeck <linux@roeck-us.net>,
        Enver Balalic <balalic.enver@gmail.com>
Cc:     mgross@linux.intel.com, jdelvare@suse.com,
        platform-driver-x86@vger.kernel.org, pobrn@protonmail.com
References: <20210823185407.i7tk5bgofedqxfxf@omen.localdomain>
 <20210824173501.GA3402937@roeck-us.net>
 <20210824191132.o2eym6rq7pjgsxqy@omen.localdomain>
 <20210824193241.GA3414880@roeck-us.net>
 <20210825165852.ga5r6arfow7xv4dl@omen.localdomain>
 <20210825203112.GH432917@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <fe0690da-459e-03af-995f-40d4005d6280@redhat.com>
Date:   Thu, 26 Aug 2021 16:13:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825203112.GH432917@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/25/21 10:31 PM, Guenter Roeck wrote:
> On Wed, Aug 25, 2021 at 06:58:52PM +0200, Enver Balalic wrote:
>> Hi, 
>>
>> before I go out and send out a V4 of this, I wanted to check
>> if you agree with the changes I plan on making
>>
> [ ... ]
> 
>>>>>>  static int thermal_profile_get(void)
>>>>>>  {
>>>>>>  	return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
>>>>>> @@ -946,19 +1092,34 @@ static int thermal_profile_setup(void)
>>>>>>  	int err, tp;
>>>>>>  
>>>>>>  	tp = thermal_profile_get();
>>>>>> -	if (tp < 0)
>>>>>> -		return tp;
>>>>>> +	if (tp >= 0) {
>>>>>> +		/*
>>>>>> +		* call thermal profile write command to ensure that the firmware correctly
>>>>>> +		* sets the OEM variables for the DPTF
>>>>>> +		*/
>>>>>> +		err = thermal_profile_set(tp);
>>>>>> +		if (err)
>>>>>> +			return err;
>>>>>>  
>>>>>> -	/*
>>>>>> -	 * call thermal profile write command to ensure that the firmware correctly
>>>>>> -	 * sets the OEM variables for the DPTF
>>>>>> -	 */
>>>>>> -	err = thermal_profile_set(tp);
>>>>>> -	if (err)
>>>>>> -		return err;
>>>>>> +		platform_profile_handler.profile_get = platform_profile_get;
>>>>>> +		platform_profile_handler.profile_set = platform_profile_set;
>>>>>> +	}
>>>>>
>>>>> I don't really understand the above logic change. Why is
>>>>> the error from thermal_profile_get() now ignored ?
>>>>>
>>>>>>  
>>>>>> -	platform_profile_handler.profile_get = platform_profile_get,
>>>>>> -	platform_profile_handler.profile_set = platform_profile_set,
>>>>>> +	tp = omen_thermal_profile_get();
>>>>>> +	if (tp >= 0) {
>>>>>> +		/*
>>>>>> +		* call thermal profile write command to ensure that the firmware correctly
>>>>>> +		* sets the OEM variables
>>>>>> +		*/
>>>>>> +		err = omen_thermal_profile_set(tp);
>>>>>> +		if (err < 0)
>>>>>> +			return err;
>>>>>> +
>>>>>> +		platform_profile_handler.profile_get = platform_profile_omen_get;
>>>>>> +		platform_profile_handler.profile_set = platform_profile_omen_set;
>>>>>
>>>>> It looks like omen_thermal_profile_get() has priority over
>>>>> thermal_profile_get(). If so, it might make more sense to execute it first
>>>>> and only call thermal_profile_get() if omen_thermal_profile_get() returned
>>>>> an error. If ignoring the result from thermal_profile_get() is on purpose,
>>>>> it might make sense to drop that code entirely.
>>>>>
>>>>> I am not entirely sure I understand what this code is supposed to be doing,
>>>>> though. Some comments might be useful.
>>>> Looking at it again, as it stands this is wrong, the omen code should only
>>>> run if the regular thermal_profile_get() returns an error, and not how it
>>>> is now.
>>>>
>>>> Background to this is that the thermal_profile_get() code doesn't work on
>>>> the Omen, so the omen specific path is needed, but only in the case that
>>>> the regular, non-omen code fails.
>>>>
>>>> As for ignoring the errors, I guess that in the case that both the regular
>>>> thermal_profile_get, and omen_thermal_profile_get fail, this function
>>>> should just return -EOPNOTSUPP instead of returning the error code of the
>>>> last function that ran (omen one) like it does now ?
>>>
>>> I can't really say since I am not that involved in the driver.
>>> All I noticed is that the code is odd and difficult to understand.
>>> There should be a better means to determine if the system is an
>>> "Omen" than trial and error, possibly from its DMI data or maybe
>>> from its WMI GUIDs.
>> I took a look at how the Windows Omen Command Center program detects what machine
>> is an Omen, and I found they match the DMI Board Name against a list of Omen
>> board names. I should do the same in this case.
> 
> I would think so, but that is really a decision to be made by the driver
> maintainer.

If the Windows driver uses DMI matching to only use the Omen WMI API
on certain devices, then yes please do the same in the Linux code.




>>>>>> +	} else {
>>>>>> +		return tp;
>>>>>> +	}
>>>>>
>>>>> 	if (tp < 0)
>>>>> 		return tp;
>>>>>
>>>>> followed by non-error code would be more common.
>>>>>
>>>>>>  
>>>>>>  	set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
>>>>>>  	set_bit(PLATFORM_PROFILE_BALANCED, platform_profile_handler.choices);
>>>>>> @@ -973,6 +1134,8 @@ static int thermal_profile_setup(void)
>>>>>>  	return 0;
>>>>>>  }
>>>>>>  
>>>>>> +static int hp_wmi_hwmon_init(void);
>>>>>> +
>>>>>>  static int __init hp_wmi_bios_setup(struct platform_device *device)
>>>>>>  {
>>>>>>  	/* clear detected rfkill devices */
>>>>>> @@ -984,6 +1147,8 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>>>>>>  	if (hp_wmi_rfkill_setup(device))
>>>>>>  		hp_wmi_rfkill2_setup(device);
>>>>>>  
>>>>>> +	hp_wmi_hwmon_init();
>>>>>> +
>>>>> This doesn't really make sense. If it is critical, it should abort here.
>>>>> If it isn't, the function should not return an error only for it to be
>>>>> ignored.
>>>>>
>>>>> Also, if hwmon functionality isn't critical, the driver should not depend
>>>>> on HWMON since it performs perfectly fine without it.
>>>> Here if it's running on an omen and HWMON isn't there, there is no reporting
>>>> of fan speeds and the max/auto toggle won't work. So I don't know if that is
>>>> considered `critical`. I would guess not ?
>>>
>>> The point I am trying to make is
>>>
>>> 1) If the return value from hp_wmi_hwmon_init() is ignored,
>>>    hp_wmi_hwmon_init() should not return a value.
>>>
>>> 2) If the return value from hp_wmi_hwmon_init() is ignored, the hwmon
>>>    functionality is not critical, and the driver should not depend on HWMON.
>>>
>>> "critical", in the sense I meant, means critical to system operation.
>>> The meaning depends on the driver author, of course. I can not really say
>>> if the driver should depend on HWMON or not. All I can say is that it is
>>> inconsistent to make the driver depend on HWMON and then to ignore that
>>> hwmon device instantiation failed.
>> I took a look at how other vendor's WMI drivers handle this, and a couple of
>> them depend on HWMON (asus, gigabyte), while the thinkpad and eeepc ones
>> select HWMON instead of depending on it. Here I think I should just handle
>> this error properly, and leave the HWMON dependency in this driver ?
> 
> Ok with me but, again, the maintainer should have an opinion about this.

I would prefer just selecting HWMON in Kconfig and keeping the code clean from
any special handling which may be necessary when HWMON is unset.

Regards,

Hans

