Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2360978F43
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Mar 2025 14:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742220244; cv=none; b=ZNQ8cskJ7TXc4v3as8a46YlHQUIKaoWUJKx7t7/7KWpMK0hf94B1RQRl0feogIcTxi+qTpqbFBD9dFRu5q2LB/gz7xFDjSAZyW8W/6RF61PVnUsGXdtiyOb5dKFeLPIS2nQ0DHYj8V2WqrJAbjIl0UeGNbpnz2sxb85jah7FfqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742220244; c=relaxed/simple;
	bh=iBF0gJlnP188yvkLa6tZpOjI1ZaFED9P9+keeH/VW0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WWoing2l6eN6F0/mx9rNGWoMnQSYqSfP6g0sjcvZMkei5b9QIvoLT0XIatqfwJF9JeVE/zciR60k4zy8bZGR7J2FO5zvPskf4Af2u1wu0Rqfce4hoiC3N6o5dNEWxCCtgIpfQtMTy4ZC0JKz2r09sA2TTWx2cqo4jksYAaevMvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MOYR3PFI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MOYR3PFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742220241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=219eUn+jdPFzVfDH/DzPCIrl9FP/mjzb8qSFJuWYfr8=;
	b=MOYR3PFIdnGQpsz7o06+6o9i6OE1AoNyiICYIQWi031vsxeeNwDogJi1zJ8n+rJkaQApTf
	bwwzcOOPMCaHUK7zMWOHLuYuVd6q2z5efQVbeDeHZ8f6VV9WJb9t50MiXFQFeZU26PhyJj
	WBLbmOx0yT0a1oaVwCsF9bDErqVPT4Q=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-Spj6vqsMNeWxzknqnuY8gQ-1; Mon, 17 Mar 2025 10:04:00 -0400
X-MC-Unique: Spj6vqsMNeWxzknqnuY8gQ-1
X-Mimecast-MFC-AGG-ID: Spj6vqsMNeWxzknqnuY8gQ_1742220239
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac287f284f8so320457566b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Mar 2025 07:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742220239; x=1742825039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=219eUn+jdPFzVfDH/DzPCIrl9FP/mjzb8qSFJuWYfr8=;
        b=Br5NjmcYiEHWtSXRFhb3eWwGDwgXL99HgvmiOZQmMJTbpcTIXtSvnY2GyBkJmcnMzr
         AkyoxrN5ve1Fm+9+SXmB7ANTgeyZ9KRvCtaPjApzNZ4ZfoKW5iFCZMAp24I/1HoY4fWn
         jx4i3u+Kgcf6guwGn1z8xZb9VTmuMlJusG84/dvRCw5mTwzjYkRfrMVqWffdmVCwQpXF
         NTyN9leKglyDVqxnh5ehC3o5dIQ6jOa9g3fBTb59q1We0G7qjitRxzdEEIpYXh8wfqIf
         WnTj1QRmtHGzKZCTQkiypel622mZlHTTRkKh/PS+zM6sEHAehgyj4+FLoi9ZyKXnq/TK
         YOqQ==
X-Gm-Message-State: AOJu0YxPU+yN4EfN10kHbQZZClhS+kNHycD0M+G5dfbSIMkeL2/Xb4mX
	KC+RKivfXjUzjR+UEUyln/QHtA/VM+RbCoYem0vtB1IxTVoW4V1rSgxckdGDng9FLWyUwiFfzg+
	G/RRneVBxEVVHtn1wrCnuEa9lNrBNGqVsnGg/EU7ugb6pJ/rs8p8UU89QfZK0BFxyX8MIqA4=
X-Gm-Gg: ASbGnctbwC39MhFHSmJAb7I6kyMLnluEqUR5JVw1oL0+MJrg5uh6TjB0LC+yq7iJfvo
	ElU2B4lRW5ml/1pF3qHWeSN0bRMgK03LO3bdeT3kVyEWu/l/QsCEb22XFGp8H7wjLRG8IzLF03B
	Iv7mrCo6qJzGbsUV0lUA7QHt416i17pcWjygJjdsp3iML5FoGv5+Fhup4JJZ4Cvb6VgLVymMM3L
	ndQG9rpwG1tM71STvgsRbITOZSSbDDXANY0ghUN2xBQVNqE99jXohhy51wyFr8hA0SXMg2HqaDe
	2EUm9QCKQOVTJh8zhIk=
X-Received: by 2002:a17:907:2d11:b0:ac3:5d65:1a51 with SMTP id a640c23a62f3a-ac35d652194mr612734166b.51.1742220238795;
        Mon, 17 Mar 2025 07:03:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVQzV/ejrIoUV6KC1aN0EHkZFXEcDCo3O9h3d+ggUaCT5M+U2JvVwpN2tUakc2NOqiW5ihEg==
X-Received: by 2002:a17:907:2d11:b0:ac3:5d65:1a51 with SMTP id a640c23a62f3a-ac35d652194mr612726466b.51.1742220238243;
        Mon, 17 Mar 2025 07:03:58 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149d0df9sm682160066b.99.2025.03.17.07.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 07:03:57 -0700 (PDT)
Message-ID: <1291b9af-28f0-4727-b913-67827c1861c3@redhat.com>
Date: Mon, 17 Mar 2025 15:03:56 +0100
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
 <82e27f38-f951-4e6f-babd-81890d590a04@redhat.com>
 <CAGwozwFCOqhyNTZPfq2nmDoAYwzrUGoDGWzvqmJf8zK2_5Hk6A@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAGwozwFCOqhyNTZPfq2nmDoAYwzrUGoDGWzvqmJf8zK2_5Hk6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Mar-25 14:50, Antheas Kapenekakis wrote:
> On Mon, 17 Mar 2025 at 14:31, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 17-Mar-25 13:38, Antheas Kapenekakis wrote:
>>> On Mon, 17 Mar 2025 at 13:27, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi Antheas,
>>>>
>>>> On 11-Mar-25 17:53, Antheas Kapenekakis wrote:
>>>>> OneXPlayer devices have a charge bypass
>>>>
>>>> The term "charge bypass" is typically used for the case where the
>>>> external charger gets directly connected to the battery cells,
>>>> bypassing the charge-IC inside the device, in making
>>>> the external charger directly responsible for battery/charge
>>>> management.
>>>>
>>>> Yet you name the feature inhibit charge, so I guess it simply
>>>> disables charging of the battery rather then doing an actual
>>>> chaerger-IC bypass ?
>>>>
>>>> Assuming I have this correct, please stop using the term
>>>> charge-bypass as that has a specific (different) meaning.
>>>
>>> Unfortunately, this is how the feature is called in Windows. On both
>>> OneXPlayer and Ayaneo. Manufacturers are centralizing around that
>>> term.
>>
>> Ok, so I just did a quick duckduckgo for this and it looks like
>> you are right.
>>
>>> Under the hood, it should be bypassing the charger circuitry, but it
>>> is not obvious during use.
>>
>> Ack reading up on this it seems the idea is not to connect the external
>> charger directly to the battery to allow fast-charging without
>> the charge-IC inside the device adding heat, which is the traditional
>> bypass mode.
>>
>> Instead the whole battery + charging-IC are cut out of the circuit
>> (so bypassed) and the charger is now directly powering the device
>> without the battery acting as a buffer if the power-draw superseeds
>> what the external charger can deliver.
>>
>>> The user behavior mirrors `inhibit-charge`,
>>> as the battery just stops charging, so the endpoint is appropriate.
>>
>> Hmm this new bypass mode indeed does seem to mirror inhibit charge
>> from a user pov, but it does more. It reminds me of the battery disconnect
>> option which some charge-ICs have which just puts the battery FET in
>> high impedance mode effectively disconnecting the battery. Now that
>> feature is intended for long term storage of devices with a builtin
>> battery and it typically also immediately powers off the device ...
>>
>> Still I wonder if it would make sense to add a new "disconnect"
>> charge_behaviour or charge_types enum value for this ?
>>
> 
> The battery is not disconnected. It still provides backup. Unplugging
> the charger does not turn off the device. So it is more murky.
> 
> From a userspace perspective it is inhibit-charge 1-1.

Ok, lets go with inhibit then.

>> <snip>
>>
>>>>> diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
>>>>> index 2a5c1a09a28f..4a187ca11f92 100644
>>>>> --- a/Documentation/ABI/testing/sysfs-class-power
>>>>> +++ b/Documentation/ABI/testing/sysfs-class-power
>>>>> @@ -508,11 +508,12 @@ Description:
>>>>>               Access: Read, Write
>>>>>
>>>>>               Valid values:
>>>>> -                     ================ ====================================
>>>>> -                     auto:            Charge normally, respect thresholds
>>>>> -                     inhibit-charge:  Do not charge while AC is attached
>>>>> -                     force-discharge: Force discharge while AC is attached
>>>>> -                     ================ ====================================
>>>>> +                     ================== =====================================
>>>>> +                     auto:              Charge normally, respect thresholds
>>>>> +                     inhibit-charge:    Do not charge while AC is attached
>>>>> +                     inhibit-charge-s0: same as inhibit-charge but only in S0
>>>>
>>>> Only in S0 suggests that charging gets disabled when the device is on / in-use,
>>>> I guess this is intended to avoid generating extra heat while the device is on?
>>>>
>>>> What about when the device is suspended, should the battery charge then ?
>>>>
>>>> On x86 we've 2 sorts of suspends S3, and the current name suggests that the
>>>> device will charge (no inhibit) then. But modern hw almost always uses
>>>> s0i3 / suspend to idle suspend and the name suggests charging would then
>>>> still be inhibited?
>>>>
>>>> Also s0 is an ACPI specific term, so basically 2 remarks here:
>>>>
>>>> 1. The name should probably be "inhibit-charge-when-on" since the power_supply
>>>>    calls is platform agnositic and "S0" is not.
>>>
>>> I tried to be minimal. If we want to make the name longer, I vote for
>>> "inhibit-charge-awake". I can spin a v5 with that.
>>>
>>> The device does not charge while asleep. Only when it is off.
>>
>> Is suspend awake though ?
> 
> Sorry I mispoke. When inhibit-charge-awake, the device only charges
> while in s0i0. When inhibit-charge, it never charges. This includes
> s0i3, S4, and S5. The devices that support this only support modern
> standby.
> 
> I just verified this.

Ok that sounds good / sane, it likely just disables charging while in s0i0
to avoid generating extra heat while in s0i0, so inhibit-charge-awake sounds
good to me.


> 
>>>> 2. We need to clearly define what happens when the device is suspended and then
>>>>    make sure that the driver matches this (e.g. if we want to *not* inhibit during
>>>>    suspend we may need to turn this feature off during suspend).
>>>
>>> This is handled by the device when it comes to OneXPlayer. No driver
>>> changes are needed.
>>
>> Well you say no charging is done when suspended, the question also is what
>> behavior do we want here?  I'm fine with the default behaviour, but a case
>> could be made that charging while suspended might be desirable (dependent on
>> the use case) in which case we would need to disable the inhibit when
>> suspending to get the desired behavior.
>>
>> Also what if other firmware interfaces with a bypass^W inhibit option work
>> differently and do charge during suspend ?
>>
>> It is important that we clearly define the expected behavior now so that
>> future devices can be made to behave the same.
> 
> Sorry I mispoke. Charging happens under modern standby under -awake.
> 
> So -awake would mean awake (s0i0) here.
> 
> If other devices charge during sleep and awake, another option could be added.

ack, as mentioned above inhibit-charge-awake sounds good to me,
thank you for clarifying.

Regards,

Hans


