Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACADC224D6
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Dec 2025 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765195457; cv=none; b=gKv0yApFRJdE9SFNZha3lt47ye5Lwp/WDMvBfw6ohGEXynIuhEYgq0rUmDGhXT/AoLM0132FyeApMLoEUCWCbXoLQjJ84Qm77TH0b0J14UKiUl7Cv0Hj2YcsECFVc6ee2N/N0Vc4Eh8KmVSFRa9/XrFPxsBC83iRmKeKo+DGl3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765195457; c=relaxed/simple;
	bh=C+JsAi32G1v6U7fBTDqR49ZLq/sjZ/2NzEB7ad7/rmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQILfsdb/AJK3r4ycQxlfNLwWBOAnd3zzyOKRnSBv3e3ak1Xey9ZBRw3hXvckLhyHIWFb4k034vE7+/8ZeJ3Knum9gQSh8ik5HixChDvlc003d5Xxg72nMr+oJL8fqiCihbaizLQuHnQKr7ttOL15Wpz4l4YvSyfeLSVBD7gc40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcDXY8sb; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcDXY8sb"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-297e264528aso42898655ad.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Dec 2025 04:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765195455; x=1765800255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hXEES4EbmXLwEXUQPw7Bc3fDPvxFGB+jv6Di8Lr2AMw=;
        b=LcDXY8sbTjoCDcQp0onoJgHb3IKJlMfZnPcT26RbD9/t8geQ2XWokw2/yMxo/s2sY8
         +g8X57RuBnnnBfyW0G+9sN2/NtNsSopmPzJiPPj8HpSg2Lv2PNyPL51/QOzK4ZRDUm5W
         rQ/eSEhwize/toCogHGE0OSw0v43OQpwm/OYLbqYZb3eWklVYDUVftcESaome8/o4Rsb
         oNCcAQxMa5f6YHO1aLf54iz0WAMi2oZL4YRyxFN4tNdBTItEr8KNhKUp7ekE09XiN+am
         D7EvCCs7shGCAQMrhy2Nm2lsY8QurvOS4GMQH55kbz7VKL2YB/gKgxhJw2e+1oB13dRB
         DXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765195455; x=1765800255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXEES4EbmXLwEXUQPw7Bc3fDPvxFGB+jv6Di8Lr2AMw=;
        b=VdN6jUc2VvyO1vei+Hc870MDNvEH3cVZJkT+c03tNJoy55HkfK0x/vWiL0mpNYGiiN
         XOOiPSwktyIBFUP45Rk/SOQxBq4gYODeTHox2JIaWDzRmmCbVUT9KK+qNKk9KhWpiUh4
         GHRaOFKcU3Ey+lDqEpWVq7qIaaLoPi+2ihaADDsBmXdCR75pOtPrOGG5JW6hg2AOeuro
         LJbU+4r2FG39PIeuhdnvnAv56X91qfWftjykZnzjxW+KfbZA68AuCi3x1oeByzNhBQqk
         leioo5BytloxTGKn0l/UZw1dfTcEKzHtMNIPmKg+mdLNQsWkC3hMRLc/jtxnu3nl8ad5
         1l3A==
X-Gm-Message-State: AOJu0YwhDyUTR97bLqbSaY/Uo40spz9pSR4R6C+9KSOJuiuytEbtLY2g
	mJjcAUIfL/8tQGNvEykG8erdWrKnnDj/j25p4Eldqd0k8ELWOa4dLEPh
X-Gm-Gg: ASbGncuxACvjl6rFIUHVQQFeRhn25qRX5sr9MdEhNSr/Uy8KJdEYhLCnTirF9a5Z7ZK
	gXOpbMNMq9KlUGcrX1jPbS9KlU6mxytf8TtFFG3vx4ZLEa9XgBkQbb/lOjoi7W93WKjVyIoQgBT
	Sm2ITRngPJjOUgPbZM+p15snBLUH8MIZiKq8Cs5diqptwkQavZjgNzklaezrZiFtCdXd1QHj/Ss
	DNaQVPlyOkP2RXsinC9jI++gL+WyKVhDRRRs93Dl2alhwZNaZnienepV0XS442IFAcLpupgZmhJ
	9xUUJ6GuW5VPJfM1Yn60aGjZ4dKmQ61YaA6VWh0CG8+omBBSJIZsdY3GmBFZQHGxJgEUKGLU7BT
	RucDaJQDI8sNsB6evMO6BucxhIUGpO9lVHMxNuoriqFP97DuwhJEiOYaZqgTfzj+L3xACQiF/p5
	W+LJ2nWjlflxVjfxLiqtmJK4FtuTmE6MPImUXMeBTdEsxetwk=
X-Google-Smtp-Source: AGHT+IF/O8mF0/IuoJYDiOqoUNfiuBm+aPK4fAMX902VMEHTJfkskImWgjnS5U6x+NlINa61/DcYPQ==
X-Received: by 2002:a17:902:ef46:b0:298:45b1:89a1 with SMTP id d9443c01a7336-29df579ea75mr62096305ad.12.1765195454772;
        Mon, 08 Dec 2025 04:04:14 -0800 (PST)
Received: from ?IPV6:240f:102:8600:1:969e:10ef:cd38:6a6? ([240f:102:8600:1:969e:10ef:cd38:6a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaac16fsm122555245ad.87.2025.12.08.04.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 04:04:14 -0800 (PST)
Message-ID: <ac48f060-b1c1-45cb-ba3b-ed6fc838b2f2@gmail.com>
Date: Mon, 8 Dec 2025 21:04:11 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
To: Hans de Goede <hansg@kernel.org>, Mark Pearson
 <mpearson-lenovo@squebb.ca>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org,
 Nitin Joshi1 <njoshi1@lenovo.com>
References: <20251203034032.6018-1-nitjoshi@gmail.com>
 <c8e4a0d2-0641-4e4b-b62a-9c92ec43b3cf@kernel.org>
 <5f295577-ab67-4164-a718-f6fbc8911e67@gmail.com>
 <e259642d-e9f3-4d17-a9a5-68eb2fb34948@app.fastmail.com>
 <3b785a80-73e6-4def-ae4b-39ccb30dd1b7@gmail.com>
 <9b0c402f-0cc7-43ae-899c-2e98ffa96721@kernel.org>
Content-Language: en-US
From: Nitin <nitjoshi@gmail.com>
In-Reply-To: <9b0c402f-0cc7-43ae-899c-2e98ffa96721@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 12/8/25 18:32, Hans de Goede wrote:
> Hi,
>
> On 8-Dec-25 8:19 AM, Nitin wrote:
>> On 12/3/25 22:16, Mark Pearson wrote:
>>> On Wed, Dec 3, 2025, at 5:18 AM, Nitin wrote:
>>>> Hi Hans,
>>>>
>>>> Thank you for reviewing this patch.
>>>>
>>>> On 12/3/25 16:52, Hans de Goede wrote:
>>>>> Hi,
>>>>>
>>>>> Interesting new feature. A few small remarks on the proposed
>>>>> sysfs API below.
>>>>>
>>>>> On 3-Dec-25 4:40 AM, Nitin Joshi wrote:
>>>>>> Thinkpads are adding the ability to detect and report hardware damage
>>>>>> status. Add new sysfs interface to identify the impacted component
>>>>>> with status.
>>>>>> Initial support is available for the USB-C replaceable connector.
>>>>>>
>>>>>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>>>>> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
>>>>>> ---
>>>>>>     .../admin-guide/laptops/thinkpad-acpi.rst     |  26 +++
>>>>>>     drivers/platform/x86/lenovo/thinkpad_acpi.c   | 179 ++++++++++++++++++
>>>>>>     2 files changed, 205 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>>>> index 4ab0fef7d440..4a3220529489 100644
>>>>>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>>>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>>>> @@ -54,6 +54,7 @@ detailed description):
>>>>>>         - Setting keyboard language
>>>>>>         - WWAN Antenna type
>>>>>>         - Auxmac
>>>>>> +    - Hardware damage detection capability
>>>>>>        A compatibility table by model and feature is maintained on the web
>>>>>>     site, http://ibm-acpi.sf.net/. I appreciate any success or failure
>>>>>> @@ -1576,6 +1577,31 @@ percentage level, above which charging will stop.
>>>>>>     The exact semantics of the attributes may be found in
>>>>>>     Documentation/ABI/testing/sysfs-class-power.
>>>>>>     +Hardware damage detection capability
>>>>>> +-----------------
>>>>>> +
>>>>>> +sysfs attributes: hwdd_status
>>>>>> +
>>>>>> +Thinkpads are adding the ability to detect and report hardware damage.
>>>>>> +Add new sysfs interface to identify the impacted component.
>>>>>> +Initial support is available for the USB-C replaceable connector.
>>>>>> +
>>>>>> +The available commands are::
>>>>>> +
>>>>>> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_status
>>>>>> +
>>>>>> +This value displays device type and location of device with damage status.
>>>>>> +For example:
>>>>>> +if no damage is detected:
>>>>>> +  No damage detected
>>>>>> +if damage detected:
>>>>>> +  Damage detected:
>>>>>> +  Device: TYPE-C
>>>>>> +  Location: Base, Right side, Center port
>>>>>> +
>>>>>> +The property is read-only. If feature is not supported then sysfs
>>>>>> +class is not created.
>>>>> Nitpick: s/class/attribute/ classes are standardized sysfs
>>>>> interfaces living under /sys/class/ which this is not.
>>>> Ack, I will modify it.
>>>>> Besides the nitpick I'm wondering if we do not want to make
>>>>> this a little bit more friendly / easy for software to parse ?
>>>>>
>>>>> ATM this seems focused on a human directly reading
>>>>> the output but what if we want some sort of automation,
>>>>> like e.g. a Linux version of the Lenovo Vantage sw parsing
>>>>> this in the future?
>>>>>
>>>>> Note I've no specific suggestions for how to make this
>>>>> easier to parse, this is just an observation.
>>>> Thank you for pointing this out.  I am open for suggestions and will
>>>> re-check regarding its use case in lenovo vantage in future.
>>>>
>>> I'd not considered it from this perspective.
>>>
>>> One concern is that it could be multiple devices in multiple location - so breaking it up into too many pieces becomes difficult.
>>>
>>> What if we did:
>>>     hwdd_status - 1 or 0 if damage detected
>>>     hwdd_detail - list of damaged items with their location (could be multiple). e.g.
>>>       TYPE-C: Base, Right side, Center port
> So I assume this would then output one line per damaged "item", it would
> be good to document this (1 line per damaged item) in the sysfs ABI docs.

yes, we will have one line per damaged "item".  I will update ABI docs 
accordingly.

Thanks

>
>>> If hwdd_status is 0 then hwdd_detail would display "No damage detected"
>> Thank you, Mark ! I am OK with this suggestion.
>>
>> Hans / Ilpo - Any comment on this ? Thanks
> Yes this sounds good to me.
>
> Regards,
>
> Hans

Thanks & Regards,

Nitin

>
>
