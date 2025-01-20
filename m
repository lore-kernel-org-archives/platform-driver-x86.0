Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4AC1B4F02
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jan 2025 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737385734; cv=none; b=Dy0WarQZphI+h1ff/pDYht4mnB7SoiuaNxiqEYm6g8H4wV1HzYtzllG2mZFWnG8It4rNA9CQPCCyXr0h5iwuIxAkt4Yekv1AmG3NWmakVLE2bDGezB45HJmj/0sLT4P7cLWk4/eyYlS3bv3YtiuOXhFd928M016xMtOtZ2pCK1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737385734; c=relaxed/simple;
	bh=7qD7vfpvOTbyWgcjcwIUrRazVlmMDXhdk/NAPLnMdgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hqK4oLB5/+ePOUUGLdieajwf7h8bKMfq7zCggHAdueQiioSgWvfKT3tefCo2pXfhxnTB01iaegF3gMFvGAVIvUGWx+pW/uzHQ8SfH8tgpoDMamkgpXVXecP5effWJEcPs+Zze2y5Vrg+YBJScEi3ZyxM9pDOPvaBM/RL0ojiBxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uzy7ycR/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uzy7ycR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737385731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0lClY5NDKLsnarc+v1NLFiAhoDZotHxHo/PL6HP+58=;
	b=Uzy7ycR/FONj/+5vU98MV0Rw4DD+sgfxFqCmP0JMWBa92EyuGHyTJZzjhMgIwNi9N6/a2l
	IslIK5nHjz003FnYJQx3jUAwUe2kSUt8zJdHjcQmt/bzy5YFw7li2ehNjVVdYqHIaCDZvT
	DgLCkuEgzXX10UBOkjpsJe2u0KMe+rQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-OxKcS130OOSD3NvX5rfMwA-1; Mon, 20 Jan 2025 10:08:49 -0500
X-MC-Unique: OxKcS130OOSD3NvX5rfMwA-1
X-Mimecast-MFC-AGG-ID: OxKcS130OOSD3NvX5rfMwA
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d3f4cbbbbcso5053761a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jan 2025 07:08:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737385728; x=1737990528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u0lClY5NDKLsnarc+v1NLFiAhoDZotHxHo/PL6HP+58=;
        b=bfei6CLOf+/vkffK9wh2OvWqe6BAmRLJwRBOFeW0FVJQclWc+nmOTH4jGigBaU6/kF
         /ZRxteO6Kler/f54PSYp00809O2yjZ2LX76ShTYSgPt8hcebP9cJbGyzRqU4gV0GPzK1
         Ef5ObOWM6FQrMbkGuI7yozk1mLNZazkmzv+MhhviNAIpQQYJuhMYugHKE+05UrMbS3AP
         X8Oiyp/6cvj5HIAPIMv5WKldVKp1h1Vebapjx5KwGa6SxmBHZKiZqXkou+avWJu+2WCZ
         njrhpicjiSKRpmzd9+bGVoyzR4pXTmfTgbXhWcwqtPfmUSyyQ55Np6hM5SNubMPP4y+y
         oXfw==
X-Forwarded-Encrypted: i=1; AJvYcCXSxHLOZYv0kwybidiNgeKS/COGDR6T/2nEIaBLoF9+cGqcHC7OWVRRqbpZOslFBEZ2H/kiDgAHJZ8EL1Q5qB2EJqn4@vger.kernel.org
X-Gm-Message-State: AOJu0YwjHiP9iEv+cuDpDZZCID6bWIme92jKXnpNgWXphWwtaA3cm1l1
	7xS6ZK+xTsmvLbQh4N4WAhMl0BQlYzzwCWVmSEtA8rvGhFxJpK8ihIJB7d+AsrOb7kEvt4FWV0k
	IcRd6qM/teIfs8ZnzQyxA1Q/zdemSwe7/oi6ubAL6lqViAWvi6Hs9CAOA7O8wuzsKxVeMYPU=
X-Gm-Gg: ASbGncs+Ju0DF3KyEgA2qdbHRqii1Oymk9M4WysbywBSN7NJaOB1Y/D3dRj/oNRo/7Y
	rLgZq4/P3L6VK6ZlsvBjPDZ4ybtXJRszJ6klphNUrVDCxB5f/Z9pQYOdG1rkV1g3sUU3FMC5EE/
	nhapklnyiU1mYR9FbAMaOiDShVWCc1WRBrvmKcZrY1/F1h5Ky3ZswyUMI41287yq0SNcC2E95m9
	gKp44ps+ZpIDHBkMKE3Xp5y8+ST2OuwtULgd35s+xYvnHUnIexzHGfTNslZfGWXg8W0KtfQue8C
	f44xUBmjhisL/RbeqS81iFqImPx1R1pCNvKsS2cphYLaQM77i/Z0Kyxk4hEUeV/P7BGgffbqxgs
	jU6AVhLPoLl4RPBwHt/J1IQhplXpS2UsSixo2aR/c0MoW
X-Received: by 2002:a05:6402:42c4:b0:5da:1448:4407 with SMTP id 4fb4d7f45d1cf-5db7d2e85camr14022449a12.6.1737385728353;
        Mon, 20 Jan 2025 07:08:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQsiidiiECd7tdE3Y12a56mpUepWehBaFuKOM0SJKg3yXmT/L+jjWzGyR8FiRkSXsJ+gyHYw==
X-Received: by 2002:a05:6402:42c4:b0:5da:1448:4407 with SMTP id 4fb4d7f45d1cf-5db7d2e85camr14022385a12.6.1737385727744;
        Mon, 20 Jan 2025 07:08:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73eb769dsm5675552a12.50.2025.01.20.07.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 07:08:46 -0800 (PST)
Message-ID: <20dddcb7-2a5f-4af9-8169-4934aa91f55e@redhat.com>
Date: Mon, 20 Jan 2025 16:08:45 +0100
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20250120101743.149169-1-sakari.ailus@linux.intel.com>
 <06b5f424-52a5-4397-9d37-cbb628b98bb8@redhat.com>
 <Z45b03w7EV37yBeS@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z45b03w7EV37yBeS@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 20-Jan-25 3:21 PM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Jan 20, 2025 at 02:39:39PM +0100, Hans de Goede wrote:
>> Hi Sakari,
>>
>> On 20-Jan-25 11:17 AM, Sakari Ailus wrote:
>>> The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
>>> documentation) but the int3472 indiscriminately provides this as a "reset"
>>> GPIO to sensor drivers. Take this into account by assigning it as "enable"
>>> with active high polarity for INT347E devices, i.e. ov7251.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>
>> Sorry but no this won't fly. If we go this route the amount of
>> quirk code in the int3472 driver is going to get out of control.
>>
>> Since you are matching this mapping on the sensor-type, this
>> should be handled in sensor specific code, IOW in the sensor driver.
>>
>> Also see my reply on the linux-media list here:
>>
>> https://lore.kernel.org/linux-media/0a0b765e-b342-4433-9c6c-07da78f0f63b@redhat.com/
>>
>> Sorry but I have to hard nack this. There has to be some line
>> where the pdx86 glue code stops bending over backwards and
>> where some of the burden of supporting more then just devicetree
>> moves to the sensor drivers.
>>
>> *especially* since this mapping is going to be different per sensor-driver,
>> with there being *no consistency at all* in the GPIO/pin names used in
>> the sensor drivers just looking at drivers/media/i2c/ov*.c I see all of:
> 
> I beg you to reconsider as I have to disagree with your assessment, for the
> following reasons:
> 
> The "reset" naming used by the int3472 driver comes from the int3472 driver
> / Windows specific ACPI amendments, not from the ACPI standard nor sensor
> datasheets.

Yet looking at the datasheet it is a more correct name then "enable".

> Also in a proper ACPI implementation we wouldn't be dealing
> with such GPIOs at all, instead this would simply work through ACPI power
> resources.

GPIOs being handles as ACPI power-resources is not something which is
typically done.

This was actually done correct for the atomisp devices, clks and regulators
are power-resources there, but the GPIOs are listed as plain ACPI GPIO
resources under the sensor ACPI-fwnode. And ACPI GPIO resources do not
have a name/label only an index. So drivers which need GPIOs and want 
to work on ACPI platforms need an index -> label map, see for example:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/input/touchscreen/goodix.c#n811

note how this is handled in the driver, and is not expected to be
handled by some platform specific code.

> There generally isn't a single datasheet name used for such signals across
> sensor vendors (or even sensors from a single vendor). Thus the assumption
> made in the int3472 driver isn't correct, even if DT bindings were using
> the vendor-provided GPIO signal name from datasheets as-is.
> 
> We've done quite a bit of work to make the system firmware (including
> design differences or outright bugs) invisible to the drivers elsewhere, I
> don't see why we should make an exception here. To add to that, mapping the
> GPIO name / function to what the driver expects is trivially done in the
> int3472 driver, as this patch shows.

IMHO it is not so trivial done, you are assuming a 1:1 mapping for all
laptop/tablet models this is not necessarily true. E.g. on atomisp tablets
there typically is a standard camera connector with both reset and powerdown
signals and the atomisp _DSM equivalent of the INT3472 GPIO map _DSM
typically contains both signals. But on sensors with only 1 reset pin
it is unclear which of the 2 is actually used. One model camera module
with sensor X may connect the sensor's single xshutdown pin to
the powerdown signal on the standard camera connector, while another
camera module may use the reset signal on the standard connector.

There are 2 ways to handle this:

1. Make the driver deal with the fact that there may be 2 GPIOs,
treating both as optional and driving both low/high at the same time
since only 1 will actually be used. This is somewhat ugly on the driver
side, but then fixes things for all tablets/laptops out there using
this sensor model.

2. Make this the platform glue's problem and require the platform code
to have per laptop/tablet model quirks using DMI matching meaning that
instead of things just working OOTB for models not added to the quirk
table, we now need users to report an issue and then manually fix
that for every model under the sun. Which is very much sub optimal.

See e.g.:

https://github.com/jwrdegoede/linux-sunxi/commit/e43be8f19b5913a2e4bd715e7eef88fd909a2d1d

(which I have not posted upstream yet since I don't have the mt9m114
driver working on atomisp models yet)

I foresee similar problems with the INT3472 stuff. On Andy's device
we need to map reset to enable, but maybe next time it is powerdown ?

Multiply these kinda per laptop/tablet model issues by the amount
of different sensors which there are and this becomes a big 
mess of per-sensor + per-laptop-model quirks in the int3472 code,
where as these things can typically be handled reasonable well
inside the sensor driver.

> The naming used in Devicetree bindings is an ABI, we cannot change that.

Right and Andy's patch does not try to change, nor break the ABI,
Andy's patch merely adds a fallback to look for a "reset" pin if
there is no "enable" pin which is nice and simple and clean and
really not much of a burden to carry inside the sensor driver.

Drivers outside of drivers/media/i2c have much bigger kludges to
deal with interfacing with ACPI tables.

> For drivers it's an authoritative reference, even if the naming is not
> aligned with hardware datasheets. DT binding authors are within their
> rights in naming things differently form datasheets, too. I object drivers
> having to assume GPIO naming imposed by the int3472 driver when it
> conflicts with the naming (and functionality) used in DT bindings. Camera
> sensors are a bit special as they require less trivial resources (GPIOs,
> regulators and clocks) than most other devices while they are similarly
> used in both DT and ACPI based systems.
>   
>>
>> "enable"
>> "powerdown"
>> "pwdn"
>> "reset"
>> "resetb"
>> "Camera power"
>> "Camera reset"
>>
>> being used. Given this total lack of consistent pin naming this really
>> needs to be fixed in the sensor drivers.
> 
> FWIW, the int3472 driver uses "power-enable" for a GPIO that powers on a
> device. Do you expect drivers to support that as-is? Currently the int3472
> driver appears to be the only one using that string in the kernel.

Finding that pin actually results in the INT3472 code registering
an avdd regulator, not a GPIO lookup, in this case the "power-enable"
label is something purely internal to the INT3472 code.

This is all part of the INT3472 code already bending itself over
backwards to make things "invisible to the drivers" but IMHO we
need to draw the line somewhere.

For me the main reason for saying no to this is that it is
a per sensor thing and we already have a place to handle
per sensor things and that is in the sensor driver.

I've not seen any convincing arguments from you why this
sensor specific handling does not belong in the sensor
specific driver code.

Regards,

Hans



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
>>> +	const char *func;
>>> +	unsigned int polarity;
>>> +} int3472_reset_gpio_map[] = {
>>> +	{ "i2c-INT347E", "enable", GPIO_ACTIVE_HIGH },
>>> +};
>>> +
>>> +static void int3472_get_func_and_polarity(const char *sensor_name, u8 type,
>>> +					  const char **func, u32 *polarity)
>>>  {
>>>  	switch (type) {
>>> -	case INT3472_GPIO_TYPE_RESET:
>>> -		*func = "reset";
>>> -		*polarity = GPIO_ACTIVE_LOW;
>>> +	case INT3472_GPIO_TYPE_RESET: {
>>> +		const struct int3472_reset_gpio_map *map = NULL;
>>> +		unsigned int i;
>>> +
>>> +		for (i = 0; i < ARRAY_SIZE(int3472_reset_gpio_map); i++) {
>>> +			if (strncmp(sensor_name, int3472_reset_gpio_map[i].devname,
>>> +				    strlen(int3472_reset_gpio_map[i].devname)))
>>> +				continue;
>>> +
>>> +			map = &int3472_reset_gpio_map[i];
>>> +			break;
>>> +		}
>>> +
>>> +		if (map) {
>>> +			*func = map->func;
>>> +			*polarity = map->polarity;
>>> +		} else {
>>> +			*func = "reset";
>>> +			*polarity = GPIO_ACTIVE_LOW;
>>> +		}
>>>  		break;
>>> +	}
>>>  	case INT3472_GPIO_TYPE_POWERDOWN:
>>>  		*func = "powerdown";
>>>  		*polarity = GPIO_ACTIVE_LOW;
>>> @@ -217,7 +251,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>>  
>>>  	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
>>>  
>>> -	int3472_get_func_and_polarity(type, &func, &polarity);
>>> +	int3472_get_func_and_polarity(int3472->sensor_name, type, &func,
>>> +				      &polarity);
>>>  
>>>  	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
>>>  	if (pin != agpio->pin_table[0])
>>
> 

