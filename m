Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3F11FE0EE
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 11:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731496791; cv=none; b=Kw9hhNLnpfVhotMI58CuFeuUlPQDXlk4Q7OQtgKmi9N3Q5cPkUHZSFp/m/ocKOGGVz3ITZMMglFFRB40UwoRO5lhsFFX8fKPijwiaOIIfUvwLhU145aD+iktFOEUqg9IPyJRxLqpxZxMrMD+8qHgWvWo9cSyyZeYmaJIzMH0ZMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731496791; c=relaxed/simple;
	bh=yUHqAxZEGnkuJRcsSSdneM9qeGjwJAyv6PcCOADV/GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Vo654Qu1Llm5rMab6A/Vw6aau4Sq67C4r08plgrV4vfVN4YFDj6JpyUZSPhqhhrQKkfg6CC9n10Lft8WMdY8uF7chZZEAlY1KA5oD5GqDXu13IABHnir0NTWbtKWr3JseF6IRwRCENO8JPXOQejKsbMfSOnLWlCqZbnuRMPhCJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HdfETdMN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HdfETdMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731496788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PVmeaNbzn1+FLgMkJHbffu2Uz30SMCYGqdsFRH2zxoo=;
	b=HdfETdMNvY+vZSwB4smlAmJtM0pjmZpyE+UgvTG1rQp8az4Vxm6A8QAlbLvH59fQ1VIwpl
	qIcSiIW3/BYIRtJok8mKLkR/Vjv0N5hX15q13Dt5KwZNNIi0mo3I1khHItvxszY5Q/gyLi
	OFZeWK9ktiMMcJ2O+X/4ygLMIpygFbk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-UW8mtE2PMzStf1kDeyoETg-1; Wed, 13 Nov 2024 06:19:47 -0500
X-MC-Unique: UW8mtE2PMzStf1kDeyoETg-1
X-Mimecast-MFC-AGG-ID: UW8mtE2PMzStf1kDeyoETg
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a9a1be34c61so252026566b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 03:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731496786; x=1732101586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PVmeaNbzn1+FLgMkJHbffu2Uz30SMCYGqdsFRH2zxoo=;
        b=quGSYjrCxxAPCuwcO3yzHqqoPBODFkO8Cl9k5ea3ihT5zH1hwKeYkRwTTJAKwVHyge
         R6aGeMR1Ha19eszeBP3YIegyIWMM5PDRdOAFb4N5Lzx5uq4QMC7rQrUrDy2E0QAb3Qrg
         N5TdWLAacZNIVSaqX6+HNiGYc2jpDlSn37Q4KfrUXBzZfe5pjbrhMvwpWZCbVX8VhCPX
         K3gQz5twKvXcBT67yxkKeN4m/v3WyZEstmXJ5qVxEpsH6OR8f3/H2d4/sskTWZJJd831
         kNRw7+2AfvaDPtaNmf1VaQx5qyNJykL8mxjAVO3HoSj8HTLKruc+k2UffW9B9gmHk+cg
         JZIA==
X-Forwarded-Encrypted: i=1; AJvYcCUmSpCW7AgqH9DPg6ZdvP6cc9r0htR9CwSr3O8U5pxFYUCzCKN2mSPY6OFFv2N7lIx5cT4l2bKs9ZGAW+ljnneCWRZr@vger.kernel.org
X-Gm-Message-State: AOJu0YxRxHRzAQdyt927lKznLFcevRg40pZcX/HD+IISbChpFTWIcP/S
	yazZg+26vG8YSUEZdSSAybJ6MRJbmHQN5QNxv5n1Cksn6VMyq0IU7cprM6lWlJiR5ImBbJ+6WXG
	QXKD3LDecIWRHZppdh0lqIiWhlj1IF75IvE44pUKrnse1osoTOAcBCIOZGimu667mm23DT1Vk97
	WWDCw=
X-Received: by 2002:a05:6402:2803:b0:5cb:adc5:de15 with SMTP id 4fb4d7f45d1cf-5cf0a44658dmr23926338a12.31.1731496785895;
        Wed, 13 Nov 2024 03:19:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEcqq4A49roEOFi2TaARPpmi1Nv4aM4UC+bK2fKMvrDqJPgHCwJgygiJqC4rxILTilxWEBqA==
X-Received: by 2002:a05:6402:2803:b0:5cb:adc5:de15 with SMTP id 4fb4d7f45d1cf-5cf0a44658dmr23926324a12.31.1731496785515;
        Wed, 13 Nov 2024 03:19:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b7e91esm7066487a12.25.2024.11.13.03.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 03:19:45 -0800 (PST)
Message-ID: <3cdfaf44-c546-4034-91e8-a5e62ca6c7ca@redhat.com>
Date: Wed, 13 Nov 2024 12:19:44 +0100
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
References: <8847423c-22ec-4775-9119-de3e0ddb5204@tuxedocomputers.com>
 <c4315d31-7bc6-4bd9-a7eb-3e53356d55e9@gmx.de>
 <bf3dae8b-7f1f-4438-9cbe-525825d70752@tuxedocomputers.com>
 <aa129cb8-2b1d-4912-b731-74e959b99da6@gmx.de>
 <cc1721a1-bb2f-4dde-a8a5-3d4928439520@tuxedocomputers.com>
 <b2c8616e-7097-4e27-b5e4-b1fb1790857e@gmx.de>
 <39c094d1-ddd5-4b3c-b6f1-9ea92d8d5e2e@redhat.com>
 <6ae74151-c7b9-4754-bc3c-7a6d5fe5d628@tuxedocomputers.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6ae74151-c7b9-4754-bc3c-7a6d5fe5d628@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 13-Nov-24 12:11 PM, Werner Sembach wrote:
> 
> Am 13.11.24 um 12:05 schrieb Hans de Goede:
>> Hi All,
>>
>> On 12-Nov-24 5:31 PM, Armin Wolf wrote:
>>> Am 12.11.24 um 16:10 schrieb Werner Sembach:
>>>
>>>> Am 12.11.24 um 13:51 schrieb Armin Wolf:
>>>>> Am 12.11.24 um 13:42 schrieb Werner Sembach:
>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> Am 12.11.24 um 13:01 schrieb Armin Wolf:
>>>>>>> Am 12.11.24 um 12:52 schrieb Werner Sembach:
>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> quick learning question: Why is wmi_bus_type not exported unlike, for
>>>>>>>> example, acpi_bus_type, and platform_bus_type?
>>>>>>>>
>>>>>>>> Wanted to use bus_find_device_by_name in an acpi driver that might
>>>>>>>> need additional infos from a wmi interface that might or might not be
>>>>>>>> present.
>>>>>>>>
>>>>>>>> Kind regards,
>>>>>>>>
>>>>>>>> Werner Sembach
>>>>>>>>
>>>>>>>>
>>>>>>> What kind of information do you have in mind? wmi_bus_type is not
>>>>>>> being exported for historic reasons, i can change that if necessary.
>>>>>> It's for the tuxedo-drivers part for the Sirius 16 Gen 1 & 2 which has
>>>>>> a slow wmi and a quick acpi interface, however the quick acpi
>>>>>> interface can not get the max rpm of the cooling fans, but the wmi
>>>>>> interface can.
>>>>>>
>>>>>> Thing is for the acpi driver we might plan an earlier upstream date
>>>>>> and it might get multi-odm support, while the wmi interface is and
>>>>>> stays odm specific. So my idea was to only couple both drivers in a
>>>>>> dynamic way using bus_find_device_by_name.
>>>>>>
>>>>> Interesting, how is the ACPI interface not ODM specific? Can you
>>>>> elaborate a bit on how the ACPI and the WMI interfaces work?
>>>> We have an ODM that was willing to include ACPI code by us in their
>>>> BIOS blob and we hope that in the future we can carry that API over to
>>>> other ODMs for future TUXEDO devices.
>>>>
>>>> In pseudocode that API looks like this:
>>>>
>>>> v1:
>>>>
>>>> void SMOD(bool mode): Toggle firmware controlled fans vs manually (aka
>>>> via the commands below) controlled fans
>>>> bool GMOD(): Get current SMOD setting
>>>> int GCNT(): Get number of fans
>>>> enum GTYP(int index): Returns "CPU-fan" or "GPU-fan"
>>>> void SSPD(int index, int value): Set fan speed target as a fraction of
>>>> max speed
>>>> int GSPD(int index): Get current fan speed target as a fraction of max
>>>> speed
>>>>
>>>> v2 same as v1 but with added:
>>>>
>>>> int GRPM(int index): Get current actual fan speed in revolutions per
>>>> minute
>>>> int GTMP(int index): Get temperature of thing fan with respective
>>>> index is pointed at (CPU or GPU die, see GTYP)
>>>>
>>>> Like I said, what is missing is a "Get Max RPM" function even in v2,
>>>> which we might add a future iteration, but, well this bios is now out
>>>> in the wild. However these released devices have a "get info" function
>>>> in the wmi code which returns the v2 infos and the max rpm.
>>>>
>>>> I want to write the code in a way that it probes the acpi interface
>>>> for function existence and wherever something is missing tries to fall
>>>> back to infos gathered from the wmi interface, but that one is
>>>> implemented in a stand alone module (the tuxedo_nb04_* stuff in
>>>> tuxedo-drivers) and I would like to keep it that way in honor of KISS.
>>>>
>>>> My plan is that the first time max rpm is pulled the acpi driver uses
>>>> bus_find_device_* to get the wmi device, if present, and pulls max rpm
>>>> from the driver data there and copies it over to it's own driver data.
>>>> If not possible it returns a dummy value or falls back to another
>>>> method. Maybe a hard coded list of max rpm values, currently only 2
>>>> devices have the new interface, so it wouldn't be a long list.
>>>> Directly going to the hard coded list is our current fallback plan,
>>>> but it is not an elegant solution as the info is actually there, if
>>>> you know what i mean?
>>>>
>>>> Kind regards,
>>>>
>>>> Werner
>>>>
>>> I see, we once had a similar case with the dell-wmi driver, see commit f97e058cfe80 ("platform/x86: wmi: Don't allow drivers to get each other's GUIDs"):
>>>
>>>      The only driver using this was dell-wmi, and it really was a hack.
>>>          The driver was getting a data attribute from another driver and this
>>>          type of action should not be encouraged.
>>>
>>>          Rather drivers that need to interact with one another should pass
>>>          data back and forth via exported functions.
>>>
>>> I would be quite unhappy with drivers interacting with WMI devices without a proper WMI driver, but i can see your point here.
>> Agreed on that 1 driver should not be poking the [wmi_]dev of another
>> driver. This usually works until it doesn't for some reason so it
>> should just be avoided.
>>
>>> Maybe we can keep the retrieval of the fanX_max values out of the kernel? I propose the following:
>>>
>>> - have a driver for your generic ACPI interface
>>> - have a driver for the WMI interface (with fanX_max hwmon attributes)
>>>
>>> The driver for the generic ACPI interface exposes the fan speed controls as pwmX attributes if the interface does not support
>>> the "Get Max RPM" function. The userspace application in this case searches for the hwmon chip exposed by the WMI driver and
>>> reads the fanX_max attributes there. Then the application can convert the target fan speed into values for the pwmX attributes
>>> itself.
>>> If the ACPI interface however supports the "Get Max RPM" function, then it exposes fanX_max and fanX_target hwmon attributes
>>> themself and the userspace application uses them directly.
>>>
>>> This would keep the kernel drivers simple.
>> That would indeed keep the kernel drivers simple, but at the cost of
>> providing a non standard hwmon interface.
>>
>> Whatever implementation is written it really MUST follow the standard
>> hwmon API so that any hwmon tools like the lm_sensors fancontrol script
>> will work properly.
>>
>> So NACK from me for exposing fanX_max on a separate hwmon device.
>>
>> What I think works best in cases like this is to have the wmi-driver
>> expose a function to retrieve the fan max value.
>>
>> This function can use a static global array of fan max values +
>> a global fan_max_values_initialized bool and it can return -EPROBE_DEFER
>> when the bool is not set yet.
>>
>> This will also require the ACPI driver to have a Kconfig "depends on"
>> the WMI driver but that should be fine.
>>
>> And then the ACPI driver can simply call the exported helper function
>> to get the max fan values.
>>
>> This sort of cross driver function calling is not ideal, but it is
>> better then poking at a struct device owned by another driver.
>
> Problem is that when we really bring over the ACPI interface to other
> ODMs the WMI driver will no longer be there, that's why I wanted to
> avoid a static dependency on the WMI module to be able to reuse
> the code.

I see. But won't we still need the WMI module for older models then ?

>> Or maybe just hardcode the max fan values in the ACPI driver if
>> it is only 2 models and the next version of the ACPI interface
>> is supposed to fix this shortcoming ?
>
> Well, at least I hope so.

Ok, so I think it would be best to just go with hardcoding the fan max
value for the 2 models now. We can always switch over to somehow
querying this over WMI later if maintaining the hardcoded table does
turn out to be more work then expected.

Regards,

Hans


