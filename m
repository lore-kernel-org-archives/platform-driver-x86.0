Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE50194A7C
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731928848; cv=none; b=d2thv+sv5IzFDqPDCps1KwCkHVcjrWEWS3amjvvE1bAT2Iy6Cy/0wNjTe3tctYcd6XhzJKv0sPSqxQCUuBkA2Dm6P4DXr35DbbF7bJO8lrJIuxEaetTOk7hRXrKY6DU24YSC6rCHm/exGaCO5O3/bJKoQW93r9qDuttjZMmWemA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731928848; c=relaxed/simple;
	bh=aC83cweagX2HoLqGyzEUG1nFhz/pXR4WDg94e6lCyUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ACdW+GbTpF1SmqpaMrtVBolcLfmkbYAy6BCBO9N1WYvdHdxZPUD1l/3DoZOBm8I3wTmc/9Af6mb+ir0/rh7xx9u2+byJCb39Zoy8qdxTqmfYCbHLn7nB4KZEPL/Bu/ki/xre2eZxjwRwtsvxyAlwlFHjlbrF3Eugs6KcaJPIXL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OBAj8lhf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OBAj8lhf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731928845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WcTDHDW2FWqrgGnUthnbxloFJZKDxf9EvQc/CcPikAU=;
	b=OBAj8lhf/TNZzrSz3jgkAJfngpORGhC70M/8egAyoyaomTijVh4SIKqM5Kt9mgqGbIYCrc
	h0lUbYx9/VOyabWFAhd6WQZKO4by8sohOigmIEei+c+/IjnWNJ+KUovmPvLVJWUYq71H6C
	zPapwPb5J68k3Ev7YsOPOpD8AejP/wk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-2uZA-uxUPbueI09lhpMCKg-1; Mon, 18 Nov 2024 06:20:43 -0500
X-MC-Unique: 2uZA-uxUPbueI09lhpMCKg-1
X-Mimecast-MFC-AGG-ID: 2uZA-uxUPbueI09lhpMCKg
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a99efe7369dso414470966b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 03:20:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731928842; x=1732533642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WcTDHDW2FWqrgGnUthnbxloFJZKDxf9EvQc/CcPikAU=;
        b=jtxh7fzxHqxvVseNJHTVbhcAjXZ3M5uWObSw7aVFX8zRG46ALsEAdC1YTDjwcQ4nAa
         2yneBYebPn6hecPKafAQtJThQuXohVkCvHIIOzv87u2ILVafm4f/EWkBMnUbgZmcminR
         A4mbFE8Lx/eu8BDmxgKGCAz2BWQ0etH8KaoWQPY7RMfUbJQoc2QFgeZ3FGYjg+opMWxq
         WoTMlenH7K1p7U8i32YQ/nJDBEKho3q9qRDcd+GV2H6eV7RQdPTaO2abf9kZysstqzj5
         CpA87u5OoJCzeFFHNQ79iI/c+6/iloXbweEtzNxw6YE/6FmZrVyBMBtIYhVuJiut0b+X
         8OCg==
X-Forwarded-Encrypted: i=1; AJvYcCX95p/mUIIo8tn1lcFjifWb4RpYgDBU7UG+a43YplY/IL1l1InFHEuTfjUbFlv6ZLP5gYDnxd/jL6P69X6U5Exle9yC@vger.kernel.org
X-Gm-Message-State: AOJu0YzC8N+pghX4mw9/N9wtYCzKfdWWJatTSzUJXMQr8gWNRYF68/19
	mzo6C5KkQHyCoe4c/evH/9/pgSdAEPxaktLVa87q52yRbsg2pU90w6Rtq7w7s0Xj+EZvlJtjyol
	jPoe7SGMy/ZhRWwJfipSMYbfrOpEaUpgNRu01MM3HO9kRbIzDjDUJSWIq3wOTQRy4yHn5ZvY=
X-Received: by 2002:a17:907:d29:b0:a99:fcbe:c96b with SMTP id a640c23a62f3a-aa2078169ccmr1226321266b.25.1731928842347;
        Mon, 18 Nov 2024 03:20:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJBM3EPi5v8MXY/x1mt3vLVDENNNhOpQCIb+4kcnj6aktTY88qG4E3FiXBpwjUQZybsF7ujA==
X-Received: by 2002:a17:907:d29:b0:a99:fcbe:c96b with SMTP id a640c23a62f3a-aa2078169ccmr1226319366b.25.1731928841899;
        Mon, 18 Nov 2024 03:20:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cfbc9f2e4dsm1675498a12.30.2024.11.18.03.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 03:20:41 -0800 (PST)
Message-ID: <45ef4d66-f13b-4e6f-9611-ab0e38b5edbd@redhat.com>
Date: Mon, 18 Nov 2024 12:20:40 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Why is wmi_bus_type not exported?
To: Werner Sembach <wse@tuxedocomputers.com>, Armin Wolf <W_Armin@gmx.de>,
 platform-driver-x86@vger.kernel.org
Cc: Christoffer Sandberg <cs@tuxedo.de>
References: <8847423c-22ec-4775-9119-de3e0ddb5204@tuxedocomputers.com>
 <c4315d31-7bc6-4bd9-a7eb-3e53356d55e9@gmx.de>
 <bf3dae8b-7f1f-4438-9cbe-525825d70752@tuxedocomputers.com>
 <aa129cb8-2b1d-4912-b731-74e959b99da6@gmx.de>
 <cc1721a1-bb2f-4dde-a8a5-3d4928439520@tuxedocomputers.com>
 <b2c8616e-7097-4e27-b5e4-b1fb1790857e@gmx.de>
 <39c094d1-ddd5-4b3c-b6f1-9ea92d8d5e2e@redhat.com>
 <6ae74151-c7b9-4754-bc3c-7a6d5fe5d628@tuxedocomputers.com>
 <3cdfaf44-c546-4034-91e8-a5e62ca6c7ca@redhat.com>
 <69172d66-1f6b-4650-92da-7ebd23649759@tuxedocomputers.com>
 <14a67d7a-3d4e-4a90-93c6-6a30d89434e3@redhat.com>
 <84f89dd6-65b6-40fb-8e67-9daa4ed98e38@gmx.de>
 <9d13c491-c212-4067-93c0-9b9e4537bcfd@redhat.com>
 <9b520ef2-250f-4e9e-b476-0e20073f9c63@tuxedocomputers.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9b520ef2-250f-4e9e-b476-0e20073f9c63@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 18-Nov-24 12:16 PM, Werner Sembach wrote:
> Hi,
> 
> Am 18.11.24 um 12:09 schrieb Hans de Goede:
>> Hi,
>>
>> On 13-Nov-24 11:04 PM, Armin Wolf wrote:
>>> Am 13.11.24 um 13:12 schrieb Hans de Goede:
>>>
>>>> Hi,
>>>>
>>>> On 13-Nov-24 12:47 PM, Werner Sembach wrote:
>>>>> Am 13.11.24 um 12:19 schrieb Hans de Goede:
>>>>>> Hi,
>>>>>>
>>>>>> On 13-Nov-24 12:11 PM, Werner Sembach wrote:
>>>>>>> Am 13.11.24 um 12:05 schrieb Hans de Goede:
>>>>>>>> Hi All,
>>>>>>>>
>>>>>>>> On 12-Nov-24 5:31 PM, Armin Wolf wrote:
>>>>>>>>> Am 12.11.24 um 16:10 schrieb Werner Sembach:
>>>>>>>>>
>>>>>>>>>> Am 12.11.24 um 13:51 schrieb Armin Wolf:
>>>>>>>>>>> Am 12.11.24 um 13:42 schrieb Werner Sembach:
>>>>>>>>>>>
>>>>>>>>>>>> Hi,
>>>>>>>>>>>>
>>>>>>>>>>>> Am 12.11.24 um 13:01 schrieb Armin Wolf:
>>>>>>>>>>>>> Am 12.11.24 um 12:52 schrieb Werner Sembach:
>>>>>>>>>>>>>
>>>>>>>>>>>>>> Hi,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> quick learning question: Why is wmi_bus_type not exported unlike, for
>>>>>>>>>>>>>> example, acpi_bus_type, and platform_bus_type?
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Wanted to use bus_find_device_by_name in an acpi driver that might
>>>>>>>>>>>>>> need additional infos from a wmi interface that might or might not be
>>>>>>>>>>>>>> present.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Kind regards,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Werner Sembach
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>> What kind of information do you have in mind? wmi_bus_type is not
>>>>>>>>>>>>> being exported for historic reasons, i can change that if necessary.
>>>>>>>>>>>> It's for the tuxedo-drivers part for the Sirius 16 Gen 1 & 2 which has
>>>>>>>>>>>> a slow wmi and a quick acpi interface, however the quick acpi
>>>>>>>>>>>> interface can not get the max rpm of the cooling fans, but the wmi
>>>>>>>>>>>> interface can.
>>>>>>>>>>>>
>>>>>>>>>>>> Thing is for the acpi driver we might plan an earlier upstream date
>>>>>>>>>>>> and it might get multi-odm support, while the wmi interface is and
>>>>>>>>>>>> stays odm specific. So my idea was to only couple both drivers in a
>>>>>>>>>>>> dynamic way using bus_find_device_by_name.
>>>>>>>>>>>>
>>>>>>>>>>> Interesting, how is the ACPI interface not ODM specific? Can you
>>>>>>>>>>> elaborate a bit on how the ACPI and the WMI interfaces work?
>>>>>>>>>> We have an ODM that was willing to include ACPI code by us in their
>>>>>>>>>> BIOS blob and we hope that in the future we can carry that API over to
>>>>>>>>>> other ODMs for future TUXEDO devices.
>>>>>>>>>>
>>>>>>>>>> In pseudocode that API looks like this:
>>>>>>>>>>
>>>>>>>>>> v1:
>>>>>>>>>>
>>>>>>>>>> void SMOD(bool mode): Toggle firmware controlled fans vs manually (aka
>>>>>>>>>> via the commands below) controlled fans
>>>>>>>>>> bool GMOD(): Get current SMOD setting
>>>>>>>>>> int GCNT(): Get number of fans
>>>>>>>>>> enum GTYP(int index): Returns "CPU-fan" or "GPU-fan"
>>>>>>>>>> void SSPD(int index, int value): Set fan speed target as a fraction of
>>>>>>>>>> max speed
>>>>>>>>>> int GSPD(int index): Get current fan speed target as a fraction of max
>>>>>>>>>> speed
>>>>>>>>>>
>>>>>>>>>> v2 same as v1 but with added:
>>>>>>>>>>
>>>>>>>>>> int GRPM(int index): Get current actual fan speed in revolutions per
>>>>>>>>>> minute
>>>>>>>>>> int GTMP(int index): Get temperature of thing fan with respective
>>>>>>>>>> index is pointed at (CPU or GPU die, see GTYP)
>>>>>>>>>>
>>>>>>>>>> Like I said, what is missing is a "Get Max RPM" function even in v2,
>>>>>>>>>> which we might add a future iteration, but, well this bios is now out
>>>>>>>>>> in the wild. However these released devices have a "get info" function
>>>>>>>>>> in the wmi code which returns the v2 infos and the max rpm.
>>>>>>>>>>
>>>>>>>>>> I want to write the code in a way that it probes the acpi interface
>>>>>>>>>> for function existence and wherever something is missing tries to fall
>>>>>>>>>> back to infos gathered from the wmi interface, but that one is
>>>>>>>>>> implemented in a stand alone module (the tuxedo_nb04_* stuff in
>>>>>>>>>> tuxedo-drivers) and I would like to keep it that way in honor of KISS.
>>>>>>>>>>
>>>>>>>>>> My plan is that the first time max rpm is pulled the acpi driver uses
>>>>>>>>>> bus_find_device_* to get the wmi device, if present, and pulls max rpm
>>>>>>>>>> from the driver data there and copies it over to it's own driver data.
>>>>>>>>>> If not possible it returns a dummy value or falls back to another
>>>>>>>>>> method. Maybe a hard coded list of max rpm values, currently only 2
>>>>>>>>>> devices have the new interface, so it wouldn't be a long list.
>>>>>>>>>> Directly going to the hard coded list is our current fallback plan,
>>>>>>>>>> but it is not an elegant solution as the info is actually there, if
>>>>>>>>>> you know what i mean?
>>>>>>>>>>
>>>>>>>>>> Kind regards,
>>>>>>>>>>
>>>>>>>>>> Werner
>>>>>>>>>>
>>>>>>>>> I see, we once had a similar case with the dell-wmi driver, see commit f97e058cfe80 ("platform/x86: wmi: Don't allow drivers to get each other's GUIDs"):
>>>>>>>>>
>>>>>>>>>         The only driver using this was dell-wmi, and it really was a hack.
>>>>>>>>>             The driver was getting a data attribute from another driver and this
>>>>>>>>>             type of action should not be encouraged.
>>>>>>>>>
>>>>>>>>>             Rather drivers that need to interact with one another should pass
>>>>>>>>>             data back and forth via exported functions.
>>>>>>>>>
>>>>>>>>> I would be quite unhappy with drivers interacting with WMI devices without a proper WMI driver, but i can see your point here.
>>>>>>>> Agreed on that 1 driver should not be poking the [wmi_]dev of another
>>>>>>>> driver. This usually works until it doesn't for some reason so it
>>>>>>>> should just be avoided.
>>>>>>>>
>>>>>>>>> Maybe we can keep the retrieval of the fanX_max values out of the kernel? I propose the following:
>>>>>>>>>
>>>>>>>>> - have a driver for your generic ACPI interface
>>>>>>>>> - have a driver for the WMI interface (with fanX_max hwmon attributes)
>>>>>>>>>
>>>>>>>>> The driver for the generic ACPI interface exposes the fan speed controls as pwmX attributes if the interface does not support
>>>>>>>>> the "Get Max RPM" function. The userspace application in this case searches for the hwmon chip exposed by the WMI driver and
>>>>>>>>> reads the fanX_max attributes there. Then the application can convert the target fan speed into values for the pwmX attributes
>>>>>>>>> itself.
>>>>>>>>> If the ACPI interface however supports the "Get Max RPM" function, then it exposes fanX_max and fanX_target hwmon attributes
>>>>>>>>> themself and the userspace application uses them directly.
>>>>>>>>>
>>>>>>>>> This would keep the kernel drivers simple.
>>>>>>>> That would indeed keep the kernel drivers simple, but at the cost of
>>>>>>>> providing a non standard hwmon interface.
>>>>>>>>
>>>>>>>> Whatever implementation is written it really MUST follow the standard
>>>>>>>> hwmon API so that any hwmon tools like the lm_sensors fancontrol script
>>>>>>>> will work properly.
>>>>>>>>
>>>>>>>> So NACK from me for exposing fanX_max on a separate hwmon device.
>>> I think there is a misunderstanding here: the hwmon device exported by the WMI interface
>>> will also contain temperature and fan speed sensors (provided by the WMI interface), so
>>> this would be a standard hwmon device.
>>>
>>> The only difference between this hwmon device and the hwmon device exposed by the ACPI interface
>>> would be that:
>>>
>>> - the hwmon interface exposed by the ACPI interface also allows for manual fan control
>>> - the hwmon interface exposed by the ACPI interface does not support the fanx_max attribute
>>>
>>> So i think there should be no problem with having two hwmon devices on some models, since both are
>>> usable independently from each other.
>> Ah I see I thought the suggestion was to have the WMI hwmon interface only export
>> the fanx_max attribute attribute and then require userspace to treat the 2 hwmon
>> interfaces as one.
>>
>> If you duplicate all the functionality of the ACPI hwmon device on the WMI hwmon device,
>> then the question becomes why have the ACPI hwmon interface there at all ? If it is less
>> functional and duplicate IMHO we should just leave it out ?
> 
> Without knowing the details because a collegue write the wmi code: The WMI fucntions are signigifanctly less performant then the acpi ones where it has measurable performance impact to the whole system when you continuously poll them.
> 
> Luckily the only wmi exclusive information (max rpm) doesn't change and only needs to be polled once during initialization).

Right, but both offer the same information / functionality right (except for the missing max rpm).

So unless I am missing something if both drivers are loaded then there will be 2 hwmon devices registered with duplicate functionality?

If I have understood that correctly then the WMI interface really should be hidden (the WMI drivers' probe() can simply return -ENODEV without doing anything) when the ACPI interface is there.

We do NOT want 2 hwmon devices with duplicate functionality.

Regards,

Hans

