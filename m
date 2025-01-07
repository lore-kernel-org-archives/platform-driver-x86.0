Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E3B1E3DE5
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jan 2025 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736243142; cv=none; b=llLdVJSWQDTmguWYj6B+mWZHGP44jzFc9a9SU6c64fnbG9Sn46VsLLx77kToj1MxYyVYMkOkZnX5auX1WKaLdW7Dv9FdH1fpEjoek2mBbc+LyE7uSXKhRZsLZFxxq6Z7hd0rmeJXqH1KzYww+69TtbKEzjxIOXCTcs3hRuOYs9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736243142; c=relaxed/simple;
	bh=PyGSC/nvK3nQK71yLpySVsSuP3mUaqabWplO2GnFNxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DEMyXaWytufMxdL7Ub4eK/Wig8KVqXeqkzu+Wym28UYOlFWgV9WhnjzpR5Ns/+3f9TcrcMdBUHIjXwMlobG/fgdJp2NV24HHZgJLISSt+p8fNeOoyOxL7sGaa6RDss4LtaSe4d2qG3bb0sPznEb1X0iLj2cSEThT/ibzMbe0t/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aOnERSHL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aOnERSHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736243137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YhR/ZOK9SZQ+6T2Ti17Cz00EC8QCY8mGCAg/B8K2shs=;
	b=aOnERSHLuvDX6/sIw8IzxrqnKwVxwVnQNP+5enyYTYBKGUALwj0RY5lYIpyEwCcaK6EB3C
	Niw0Uid87ug5NqIIxAjfxx4VgU4p+WR9uQwvR9qcIbJ/yRu+m2HiGLm1wK2dj9S4El2jP6
	wEtYD60gjVYGrStfQnZfKWgeh+oQ9Hc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-S8LlkQ3HPve6y5bgpvJFYQ-1; Tue, 07 Jan 2025 04:45:36 -0500
X-MC-Unique: S8LlkQ3HPve6y5bgpvJFYQ-1
X-Mimecast-MFC-AGG-ID: S8LlkQ3HPve6y5bgpvJFYQ
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aabf8e856e2so284974866b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jan 2025 01:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736243135; x=1736847935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YhR/ZOK9SZQ+6T2Ti17Cz00EC8QCY8mGCAg/B8K2shs=;
        b=fJcv0txhgbdLV+/EFx60u6vWMZzAx76bsRRqrOk0aNCqAXsZhku/eg6qb4Q9xYZQiU
         H3mQhYPgF/mH1pCuZKF+KRf8cuPRmSCHwG6AdYSR5pftCc/Ziv+/2bfWumuZDpBVrgaa
         IzxIh1YmjyjHEhbTRXtEb6ZRUwh9kY9JBcxZCrNk0FZRWAJw0TyGrENDHviOMwakMn8t
         ENwbcVh6WPISqBmpmw3tE1jwMzUQoSD77WPS+nSBVmbH7xZ1SfuwJuHYm4ILZSX4O0/l
         O5Vd7mFxj6NhaRkIw1Xu5mJ5ouImOy+Y7JuEa25a1zXnezspllyBB0DBymLHmebzl8+u
         kl3Q==
X-Gm-Message-State: AOJu0Ywd45ysU4zX1xwirbtZw4ohc+W9Y1f5s32924eiMDDGwOJZ/XHn
	J00qP/CLJsahawLMqOckzBZgbMxnHB3uQj0ynak7jhvA3jy8aYQAH6B+Ib5wjyf2jE97u77Q7GI
	GIVdZ8Dld2p7Q1JcYscTOEv00W0gdI/C0yzZPm1W9VzIu388gyiftJCBg9C7/6/zxAA70xmA=
X-Gm-Gg: ASbGnctcotecSIG7vZrnG4jS04jSNEIbsD2xVMoxaXS9953jRtKRY7wsEKG1/w+OlJB
	W/1+9/hIow2lHSsns32ByTnSQM2HUG9uCf62PLpXBGe3NonLHUb3/AirpmGTlowtV2QyycWVPx8
	zQ8lfUfzpfNHcGKEJW/jqAVLhF0TRUN5QIfDh5R/hLh7iYwlCXZcsjkhTlpEgP1T9gtWDewA2SL
	3U6WHLDPJchjCR8IJfkAcF0Gtca+kvUMr85itzSsjsLsAm16DEUN/WoJdznoyHXgx6swrN6mCAe
	ZpNE+pNPKhyxAgqc4V7geS9+kU2YdklmQk5IXRTIqZk/nqZnYpryAm+2mzSoOWPfjz+WwPmOn8s
	M6lfxGcRN4gHwuOPvAW9oSpQHaw21PqE=
X-Received: by 2002:a17:907:980d:b0:aac:439:fc0 with SMTP id a640c23a62f3a-aac33e42730mr6188988166b.51.1736243134881;
        Tue, 07 Jan 2025 01:45:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVjnvzLV0XCRoKjf2NrAXeE6jJcImD6zGKBdsHokBkSRe40MJmqJfXfcWJUEktuCLbaxWa2A==
X-Received: by 2002:a17:907:980d:b0:aac:439:fc0 with SMTP id a640c23a62f3a-aac33e42730mr6188985866b.51.1736243134413;
        Tue, 07 Jan 2025 01:45:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e89617bsm2335226766b.76.2025.01.07.01.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 01:45:33 -0800 (PST)
Message-ID: <06dee33e-28c0-41a0-b246-b755fc7b0872@redhat.com>
Date: Tue, 7 Jan 2025 10:45:33 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Armin Wolf <W_Armin@gmx.de>, Hridesh MG <hridesh699@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
 <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de>
 <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
 <9c625119-e46e-464b-933d-9c836577f454@gmx.de>
 <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
 <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de>
 <CALiyAon+5H_g1V-iNbjdLmjgYDJng+ePH0XeoYxijYurHj+uTg@mail.gmail.com>
 <31c28ea2-881c-42e3-b754-8b52ca7f63fd@gmx.de>
 <CALiyAo=_vGu50RoAPwFMv9J=mkaQWojAQxmB2qmwcEZ5Y8kfSg@mail.gmail.com>
 <583bbdfe-5c5a-4541-b30a-97eb89f2e4c3@gmx.de>
 <CALiyAo=Y1rh=OpTete0N=q2DrFh8CL449xAfSxfJuju+5tc_mQ@mail.gmail.com>
 <ceb159f1-2900-4946-a9c9-088ba99d2d67@gmx.de>
 <5d2ee19b-eb78-4c67-9a5f-82859d8ae8bc@redhat.com>
 <c96e313e-9be2-485b-929b-4eedb9509417@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c96e313e-9be2-485b-929b-4eedb9509417@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Armin,

On 6-Jan-25 11:29 PM, Armin Wolf wrote:
> Am 06.01.25 um 19:33 schrieb Hans de Goede:
> 
>> Hi all,
>>
>> On 6-Jan-25 5:59 PM, Armin Wolf wrote:
>>> Am 02.01.25 um 07:18 schrieb Hridesh MG:
>>>
>>>> On Thu, Jan 2, 2025 at 1:51 AM Armin Wolf <W_Armin@gmx.de> wrote:
>>>>> Am 01.01.25 um 20:53 schrieb Hridesh MG:
>>>>>
>>>>>>> This ACPI method should trigger the turbo mode button (found inside the DSDT table):
>>>>>>>
>>>>>>>            Method (_Q58, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
>>>>>>>             {
>>>>>>>                    Debug = "=====PROJECT_QUERY_58====="
>>>>>>>                     ^^^WMID.FEBC [Zero] = 0x07
>>>>>>>                     ^^^WMID.FEBC [One] = 0x04
>>>>>>>                     ^^^WMID.FEBC [0x02] = One
>>>>>>>                     Notify (WMID, 0xBC) // Device-Specific
>>>>>>>            }
>>>>>>>
>>>>>> I feel like an idiot right now but I just realized something: So far
>>>>>> I've been assuming that the button I've been calling the "Turbo
>>>>>> Button" worked the same way on both Nitro and Predator laptops, but
>>>>>> that's not the case.
>>>>>>
>>>>>> On Predator laptops, the button directly enables Turbo mode but on the
>>>>>> Nitro it only opens the Nitro Sense app. I had assumed that both
>>>>>> buttons simply opened the app and that directly enabling Turbo mode
>>>>>> was a feature provided by the Linux driver.
>>>>>>
>>>>>> Given this, the ACPI code that you linked earlier is probably for the
>>>>>> Predator's "Turbo Button". Could it be that the button on my laptop
>>>>>> doesn’t use that ACPI code at all, considering its functionality is
>>>>>> completely different? (Though i doubt Acer would leave it in if it
>>>>>> wasn't being used)
>>>>> It is quite common for manufactures to just copy and paste ACPI code snippets, so it is not
>>>>> unusual to have some unused code inside the ACPI tables.
>>>>>
>>>>> Did you receive any input events or dmesg messages when pressing that button?
>>>>>
>>>>> If no then it could also be that this button depends on the Intel THC touch controller to work,
>>>>> take a look at https://lore.kernel.org/all/20241216014127.3722172-1-even.xu@intel.com for details
>>>>> about the Intel THC controller.
>>>>>
>>>>> Thanks,
>>>>> Armin Wolf
>>>>>
>>>> I do receive input events, it shows up with the keycode 433 and symbol
>>>> XF86Presentation. I think you mentioned something regarding an i8042
>>>> filter, can we use that to call the function to cycle between the
>>>> profiles?
>>> Since this is a valid keycode i advise against filtering it out. Instead it would make more
>>> sense to allow userspace to control the turbo state for example trough a sysfs attribute.
>>>
>>> Then you can use a userspace program to react to this key press.
>> Since some laptops handle this completely in the EC, so far drivers
>> which get an event for this have been reacting to this event
>> themselves and calling the platform_profile_cycle() helper to cycle
>> through the various performance profiles.
>>
>> I think it would be best to do this here too.
>>
>> Regards,
>>
>> Hans
> 
> This keycode event is different from the WMI notification used to toggle the turbo status.
> 
> As mentioned above, the turbo button on the Predator series is meant to toggle the turbo mode,
> while the special button found on the Nitro series is meant to only open the OEM application.
> 
> Toggling the turbo mode in response to this special button will confuse users should Acer
> mark the button with a small application icon.
> 
> I rather let applications change the turbo mode from userspace. This would also benifit machines
> which do not have any special buttons for this.

Ah I see.

I agree if the button does not cycle performance-profiles under Windows then it
should just send some KEY_FOO evdev event. 

Regards,

Hans


