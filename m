Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D10323CF08
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Mar 2025 13:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742218282; cv=none; b=dvNHuuInZDRnXnGsjOxKYne+9mL+j0mr1bfARex7WyExOTIpSQaqDKXO5h0Om1TRTHxEZSooyUfS0Fwtr4qB7+87Jxv0XyMWjzP3rvOVM2ohc5vVtWi6YgrilC+JqnP7ICgN+kwcK5Jj1IR0sYIFiOV3U95fpfvbUHBLMQ4AJis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742218282; c=relaxed/simple;
	bh=GYJVMbQZ7uiqaYWMnpndV0P0ZAxM8Qmrf0bBSZB8jWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sv907YsB3ZbU3H7pBg0wyyfqbrBPlCqKD32znfRAmyCwZx0c0JvRaETNb+c8ulUQZlGIjXV6CaxaxfkWdsUgz4Sztv5b2/Xfqk5nYcP2zT8UETB7f6Q9m98NIvymwKrAU0itKymucngXBCyPIhtkTpFS1xcvhpxfBy9W1oUAdjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KBlVch1d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KBlVch1d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742218279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XicbyQCxRSNC4G7MmnFYTtssAxXR5/Ky4MMYhuVTNrE=;
	b=KBlVch1dpCvYPPQ4h5VOb6Il7uv5bc5c0o6oGMfDBo0wh7Kb6nwKLW8PBLRvoX/6RZ2LQ2
	+TIoe6tvT8ZOA9OUq1QqkCANy/MBD7DXLC+bLabjAIDv+kE0bsWSQ7uWOmtYXgzMBt00sv
	y/x26Oa1kbE6v3zJ0cbGXMf+01p0RB8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-wVcr3DPbPcKt0-0k8VpNnw-1; Mon, 17 Mar 2025 09:31:18 -0400
X-MC-Unique: wVcr3DPbPcKt0-0k8VpNnw-1
X-Mimecast-MFC-AGG-ID: wVcr3DPbPcKt0-0k8VpNnw_1742218277
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-abb9b2831b7so580240766b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Mar 2025 06:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742218277; x=1742823077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XicbyQCxRSNC4G7MmnFYTtssAxXR5/Ky4MMYhuVTNrE=;
        b=b4mcTHNA4UzHNEhqgvetYZIMxpczhJF7BsZ9zXkvnr93mw3MIyyw6w2tkPAnK1gSN+
         SGGrCbwahQlD2cZQgg/rsiECzl2RU7d6OoYXLlqGsCh0m6ItHLpQOc8k6Fu9s3MlcPoD
         H70WxRTELVVo/iCvEIeshv2qWvBGf7uxVd1Sn7ePuLaT3z2F+YBdQiSu4LezkTmxPdXI
         Hv7Yj9Ohli5awX5FJoR9F+6hO7ZQ+/S2EGacX+deBO8wZHo4RaHr4GbaGntBifQ7Ofhy
         isAEl6mh6CiS6nuDKhUXppJE2D/Wul3MSbTJKwx3JHbhy+cDQfdPXYPZcIOaf2x2NLh3
         y3cA==
X-Gm-Message-State: AOJu0YygdVcrr3G6ZFwa+hecXATl7BlAwOgYkmRDqIAHOIn4LiBZFx79
	qcro+B0Xb9KSazh9l1crUSahymb/v7ztac7C9SCxaPDCK2U2V4KnkZziakEKNVF3jSPwL0KpENE
	e7T7UQwMAhzu5mMGYGVo/j1iQ0IW1A2MQjjjEdA+l05l2xTlsdHDHgmzFePd6gPY7DS6oqeQ=
X-Gm-Gg: ASbGncvKeayUDC9ZVZ5JuGCUZER31YaEhwKPvPGPaCKkCYYhHZOQh39GzwiaXzwOXl7
	eJZvXxrNULebB5tUKYBvERMILT7vuR+EPKp0Xeg6oOxYkDRpfcnK2FggJ3a9f8y09WAclVO+jbu
	EhcAqxjBQFZC1aNZOAHhlh6BNRAv4EE/PuXIIYVfka8QTpxLvdq131+TboouMtoaETylLRi0/OW
	FA5EhIREqka/r4QjKoc7Gl1RKsdCXXlQ0oTKJy/xJJsTdqa2Oj6MLRPUnQh0J869T0h2eWWwVm+
	plL4iM2uX/NdbkVa7Uo=
X-Received: by 2002:a05:6402:13c7:b0:5db:e88c:914f with SMTP id 4fb4d7f45d1cf-5e8b02242c4mr11890271a12.4.1742218277322;
        Mon, 17 Mar 2025 06:31:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhZiaJYx30uK3+q9vUUtAFQDkx1k1IDJZJR9UYxtCzYRPH7G5wkGZMkjI62F2gMmOFEuwo9g==
X-Received: by 2002:a05:6402:13c7:b0:5db:e88c:914f with SMTP id 4fb4d7f45d1cf-5e8b02242c4mr11890206a12.4.1742218276779;
        Mon, 17 Mar 2025 06:31:16 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b1602sm6056505a12.42.2025.03.17.06.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 06:31:16 -0700 (PDT)
Message-ID: <82e27f38-f951-4e6f-babd-81890d590a04@redhat.com>
Date: Mon, 17 Mar 2025 14:31:15 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/13] power: supply: add inhibit-charge-s0 to
 charge_behaviour
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Joaquin Ignacio Aramendia <samsagax@gmail.com>,
 Derek J Clark <derekjohn.clark@gmail.com>,
 Kevin Greenberg <kdgreenberg234@protonmail.com>,
 Joshua Tam <csinaction@pm.me>, Parth Menon <parthasarathymenon@gmail.com>,
 Eileen <eileen@one-netbook.com>
References: <20250311165406.331046-1-lkml@antheas.dev>
 <20250311165406.331046-6-lkml@antheas.dev>
 <b1ac8a33-06ed-482a-b5f6-ca88eb3802a1@redhat.com>
 <CAGwozwGESTw2DJsqr3uAhEymXxH4O5EXDw6O91i8CzCT0=yC1Q@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAGwozwGESTw2DJsqr3uAhEymXxH4O5EXDw6O91i8CzCT0=yC1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Mar-25 13:38, Antheas Kapenekakis wrote:
> On Mon, 17 Mar 2025 at 13:27, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Antheas,
>>
>> On 11-Mar-25 17:53, Antheas Kapenekakis wrote:
>>> OneXPlayer devices have a charge bypass
>>
>> The term "charge bypass" is typically used for the case where the
>> external charger gets directly connected to the battery cells,
>> bypassing the charge-IC inside the device, in making
>> the external charger directly responsible for battery/charge
>> management.
>>
>> Yet you name the feature inhibit charge, so I guess it simply
>> disables charging of the battery rather then doing an actual
>> chaerger-IC bypass ?
>>
>> Assuming I have this correct, please stop using the term
>> charge-bypass as that has a specific (different) meaning.
> 
> Unfortunately, this is how the feature is called in Windows. On both
> OneXPlayer and Ayaneo. Manufacturers are centralizing around that
> term.

Ok, so I just did a quick duckduckgo for this and it looks like
you are right.

> Under the hood, it should be bypassing the charger circuitry, but it
> is not obvious during use.

Ack reading up on this it seems the idea is not to connect the external
charger directly to the battery to allow fast-charging without
the charge-IC inside the device adding heat, which is the traditional
bypass mode.

Instead the whole battery + charging-IC are cut out of the circuit
(so bypassed) and the charger is now directly powering the device
without the battery acting as a buffer if the power-draw superseeds
what the external charger can deliver.

> The user behavior mirrors `inhibit-charge`,
> as the battery just stops charging, so the endpoint is appropriate.

Hmm this new bypass mode indeed does seem to mirror inhibit charge
from a user pov, but it does more. It reminds me of the battery disconnect
option which some charge-ICs have which just puts the battery FET in
high impedance mode effectively disconnecting the battery. Now that
feature is intended for long term storage of devices with a builtin
battery and it typically also immediately powers off the device ...

Still I wonder if it would make sense to add a new "disconnect"
charge_behaviour or charge_types enum value for this ?




<snip>

>>> diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
>>> index 2a5c1a09a28f..4a187ca11f92 100644
>>> --- a/Documentation/ABI/testing/sysfs-class-power
>>> +++ b/Documentation/ABI/testing/sysfs-class-power
>>> @@ -508,11 +508,12 @@ Description:
>>>               Access: Read, Write
>>>
>>>               Valid values:
>>> -                     ================ ====================================
>>> -                     auto:            Charge normally, respect thresholds
>>> -                     inhibit-charge:  Do not charge while AC is attached
>>> -                     force-discharge: Force discharge while AC is attached
>>> -                     ================ ====================================
>>> +                     ================== =====================================
>>> +                     auto:              Charge normally, respect thresholds
>>> +                     inhibit-charge:    Do not charge while AC is attached
>>> +                     inhibit-charge-s0: same as inhibit-charge but only in S0
>>
>> Only in S0 suggests that charging gets disabled when the device is on / in-use,
>> I guess this is intended to avoid generating extra heat while the device is on?
>>
>> What about when the device is suspended, should the battery charge then ?
>>
>> On x86 we've 2 sorts of suspends S3, and the current name suggests that the
>> device will charge (no inhibit) then. But modern hw almost always uses
>> s0i3 / suspend to idle suspend and the name suggests charging would then
>> still be inhibited?
>>
>> Also s0 is an ACPI specific term, so basically 2 remarks here:
>>
>> 1. The name should probably be "inhibit-charge-when-on" since the power_supply
>>    calls is platform agnositic and "S0" is not.
> 
> I tried to be minimal. If we want to make the name longer, I vote for
> "inhibit-charge-awake". I can spin a v5 with that.
> 
> The device does not charge while asleep. Only when it is off.

Is suspend awake though ? 

>> 2. We need to clearly define what happens when the device is suspended and then
>>    make sure that the driver matches this (e.g. if we want to *not* inhibit during
>>    suspend we may need to turn this feature off during suspend).
> 
> This is handled by the device when it comes to OneXPlayer. No driver
> changes are needed.

Well you say no charging is done when suspended, the question also is what
behavior do we want here?  I'm fine with the default behaviour, but a case
could be made that charging while suspended might be desirable (dependent on
the use case) in which case we would need to disable the inhibit when
suspending to get the desired behavior.

Also what if other firmware interfaces with a bypass^W inhibit option work
differently and do charge during suspend ?

It is important that we clearly define the expected behavior now so that
future devices can be made to behave the same.

Regards,

Hans


