Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DF21F03F2
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jan 2025 12:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737462957; cv=none; b=IlJqnGbbf9MZIy8ZdMmJJZwlLanBw/cCYFkvDzWlVIhHr6t95uhpVMQEiUc8R1aflKif7HSmwwUen0PBFbPMR+CJ3BfQLtvDrL4qNJrbWhT7eF0tbdM04U96SlAOKNg6C5TRC4we3mBD2Rs7b6HdYfuuVa9mDpzAwYcxNuRLq5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737462957; c=relaxed/simple;
	bh=WA1IukVoWiqRhVXSRLAJFuXY7Q6I4H6I9sRFCSx6JnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGKJ8vt+0+l5RuqfDtIdVFH2fxi0ikMtESp8mYXxJrVZyZH87vqAa9U8kre7mdtfywWv/U3Iw2+LGPGWD0VzbXBUdmppdkouGVCHP8x4SUpxlQ+OOYojf7G2Hwtwy0vxacEJC0ZAbApaQLuj3aeR7Z+Ej495n81RT/NQruneBEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QqSnq6pS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QqSnq6pS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737462953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8uBLxoErB8j163EcVDulfkpnPPGmH3xmZOWuFxgAzVs=;
	b=QqSnq6pSAlTgmOQy1Hf/EXkuVihyxO36LvfrXU0JMss9C36mgMt8sF+lLEI58g3admhFNx
	PaZ86iYLjYLTdmcjsZbb/LfnGY8aZTYh5CMk9IJOhXAyum1hotCSnlUh/VRo1QJ4o8/gQ4
	8xzsoIwF3pChrUcVMCkPYWu8b2wMN8U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-29axyBayMeO9DAWp8cgwSA-1; Tue, 21 Jan 2025 07:35:52 -0500
X-MC-Unique: 29axyBayMeO9DAWp8cgwSA-1
X-Mimecast-MFC-AGG-ID: 29axyBayMeO9DAWp8cgwSA
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d821f9730aso7579206a12.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jan 2025 04:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737462951; x=1738067751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8uBLxoErB8j163EcVDulfkpnPPGmH3xmZOWuFxgAzVs=;
        b=kju4xMY6NFwZge4Q2ahmU4pko06etooZrGdkVxEpy+j502h+8CQos3tePgW8Wdq014
         6FRntGP2RKkMdHpiwav4lvbhCUbIKgzpA0xTFBPJ212mwVhsmKDaVdNzfFzW0yBkY704
         tZY2grfq+J1km4TO6Aj5VzwEM8XrzqsnRE69jwDbwuSZIU0+OYUc3sXeqF6vpvq/5pJi
         tbY2l3UMJ+hVgU1aBEroRSfgMm8hW95RhdmLO7q2Pak5j/0ZQtSP+zIm6ibh/FvhL8xe
         X0qmrwtQiCD9T3/hxarIOra4URPM4f6xQwgV8SttbCBuYurSpKbhOCt8I/UoaCXDt7IE
         8m+A==
X-Forwarded-Encrypted: i=1; AJvYcCWV+e39Y1PQSSgiO6ZU+/yARid4KoV5oBxfEZTfnJyVLT8Y2Y6bFXXisIx2hVxfD3svGYMLBMgL0lIoH0olIz+NMPJ7@vger.kernel.org
X-Gm-Message-State: AOJu0YyXBbw4ifYIyWQOeEx+zirq+FwLpCdqzeKeSovGLRK/TFsGtQlk
	XtUPjiMSzfGWa1xlZp6w7Emr9oi/QhNnPYDq6AouzV4xVao3LoDhlpROphkDjjOCPxtaJo7l03e
	hz8Zs0Jqw4hrMwuYxuDf5Dtsb0qT2ynRMhbKLsbC2qOflygBLakKg5GtXzqjuhlwIo8f5+3M=
X-Gm-Gg: ASbGncvKChc7uYl9QBS6OSKU8RLvMyc7RtrQUI9wWX0DcRUp7Vm9lvaN8JyFZEFmdVr
	aJv++1uDp2vHADlQ9Goh+8OrPkjBT0MvphK71t64wjmzZPwASiuwJvejlgXLXUokZ1ngzMyTxx9
	IyySjJEfBfbIR9MqoE+TWoTVFDtKmQ4xLN5JVlTJQFX/MqvnarKHA6JLXi7M9Hc7O6q40MLF37z
	nRpRynRvObAls27XgzLbCctkQZE/61jWq12X8y96caA6TZ6W1657OXR3qt9AIXS8UT/M07U4r/u
	WLqPlmdzepofHEsuFBR7rJfdYnyjopsF1Lo4EKOXv/ojuVkYf68TMZ9sK+RRCXpy8NXXT/59R8j
	8tD24+afE6JN0VohK9PeU4Vh26wF4Hicx2bN29Wey8xaN
X-Received: by 2002:a05:6402:1d50:b0:5d3:f1f7:c232 with SMTP id 4fb4d7f45d1cf-5da0c32c288mr22165849a12.11.1737462951293;
        Tue, 21 Jan 2025 04:35:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH06/dsdOT1KTjEZ6n2IFXvZWwNdjH24Q5rlj4qODc51QNRlwHbLMBscgMKqTNsGBzrYUbYVw==
X-Received: by 2002:a05:6402:1d50:b0:5d3:f1f7:c232 with SMTP id 4fb4d7f45d1cf-5da0c32c288mr22165842a12.11.1737462950902;
        Tue, 21 Jan 2025 04:35:50 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73670d39sm7236409a12.22.2025.01.21.04.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 04:35:49 -0800 (PST)
Message-ID: <5e786433-326d-4f81-a93c-2c1819a4b6db@redhat.com>
Date: Tue, 21 Jan 2025 13:35:49 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
 linux-media@vger.kernel.org
References: <20250120101743.149169-1-sakari.ailus@linux.intel.com>
 <94978806-e077-4f45-a1a1-f4dd0cf07fad@redhat.com>
 <Z4-A3znM3sNMA9Li@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z4-A3znM3sNMA9Li@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 21-Jan-25 12:11 PM, Sakari Ailus wrote:
> Hi Hans,
> 
> Thanks for the review.
> 
> On Tue, Jan 21, 2025 at 10:42:41AM +0100, Hans de Goede wrote:
>> Hi Sakari,
>>
>> On 20-Jan-25 11:17 AM, Sakari Ailus wrote:
>>> The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
>>> documentation) but the int3472 indiscriminately provides this as a "reset"
>>> GPIO to sensor drivers. Take this into account by assigning it as "enable"
>>> with active high polarity for INT347E devices, i.e. ov7251.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>> since v1:
>>>
>>> - Fixed device name string.
>>>
>>>  drivers/platform/x86/intel/int3472/discrete.c | 45 ++++++++++++++++---
>>>  1 file changed, 40 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>>> index d881b2cfcdfc..6404ef1eb4a7 100644
>>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>>> @@ -122,13 +122,47 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
>>>  	return desc;
>>>  }
>>>  
>>> -static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
>>> +/**
>>> + * struct int3472_reset_gpio_map - Map "reset" GPIO to whatever is expected by
>>> + * the sensor driver (as in DT bindings)
>>> + * @devname: The name of the device without the instance number e.g. i2c-INT347E
>>> + * @func: The function, e.g. "enable"
>>> + * @polarity: GPIO_ACTIVE_{HIGH,LOW}
>>> + */
>>> +static const struct int3472_reset_gpio_map {
>>> +	const char *devname;
>>
>> Instead of using a devname match this should be changed to using
>> proper ACPI HID matching.
>>
>> Instead of passing int3472->sensor_name as extra argument to
>> int3472_get_func_and_polarity(), pass int3472->sensor which
>> is a "struct acpi_device *" and then use e.g. :
>>
>> 	acpi_dev_hid_uid_match(int3472->sensor, "INT347E", NULL)
>>
>> but then with the new sensor function argument
>>
>>> +	const char *func;
>>> +	unsigned int polarity;
>>> +} int3472_reset_gpio_map[] = {
>>> +	{ "i2c-INT347E", "enable", GPIO_ACTIVE_HIGH },
>>> +};
>>
>> Rather then having a mechanism for just the reset pin, I would prefer
>> to be able to remap any type to any type.
>>
>> So I would like to see this struct changed to e.g. :
>>
>> static struct int3472_gpio_map {
>> 	const char *hid;
>> 	u8 type_from;
>> 	u8 type_to;
>> 	const char *func;
> 
> I'll place func before the u8 fields for fewer holes.

Hmm, by itself that is a good idea, but ...
 
>> 	unsigned int polarity;
>> };
>>
>> static const struct int3472_gpio_map[] = {
>> 	{ "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, "enable", GPIO_ACTIVE_HIGH },

... that changes this line from the above to:

 	{ "INT347E", "enable", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, GPIO_ACTIVE_HIGH },

which IMHO is slightly less logical/readable. I would like to keep
the ACPI-hid and the type_from next to each other. So I have a slight
preference for keeping things as I suggested.

>> };
>>
>>> +
>>> +static void int3472_get_func_and_polarity(const char *sensor_name, u8 type,
>>
>> And change type to a * here ("u8 *type) so that its contents can be
>> overwritten by the mapping code
>>
>>> +					  const char **func, u32 *polarity)
>>
>> So the new function prototype would become:
>>
>> static void int3472_get_func_and_polarity(struct acpi_device *sensor, u8 *type,
>> 					  const char **func, u32 *polarity)
>>
>>
>>>  {
>>
>> and do the for loop here before the (now) "switch (*type)":
>>
>> 	for (i = 0; i < ARRAY_SIZE(int3472_gpio_map); i++) {
>> 		if (*type != int3472_reset_gpio_map[i].type_from ||
>> 		    !acpi_dev_hid_uid_match(sensor, int3472_reset_gpio_map[i].hid, NULL))
>> 			continue;
>>
>> 		*type = int3472_reset_gpio_map[i].type_to;
>> 		*func = int3472_reset_gpio_map[i].func;
>> 		*polarity = int3472_reset_gpio_map[i].polarity;
>> 		return;
>> 	}
>>
>> This should give us a lot more flexibility for future mappings.
> 
> I'll address these in v3 along with Ilpo's comments.

Great, thank you.

Regards,

Hans



