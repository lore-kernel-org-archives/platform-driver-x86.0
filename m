Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F9F1F4287;
	Tue,  7 Jan 2025 18:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736276223; cv=none; b=TxgWh7IgiLZQhXhmc2u/LC/gV69YZapvbcaJLXRJDdtIM1U9WXp5yhog3l7JLfufXBtg78mRq7a+GFEdSg5R09feXAWhDBJtosT23M4A4Fj6q5tp4vCxjfv5/yPtww4rhR3Yt+Zl1d8XaaKoYqEUt6MGXBbwIjfY9lYLf63SmHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736276223; c=relaxed/simple;
	bh=hlrOoQuZ2iOvRVptBMLNGrdlDrff3FPyP6z9Pyt9gTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DEn0DjqNDWK0MDA7FJ0XaUX5yH7VPfASmJA9E/Um9WSxTrpUqwu/TlRE3zQIKADc3s7pNrmntIT00lrn1TyqES+0OXXmnKkzfadaOPWEc1pYmMr4lBT2eyiVgkDsCMWC65Fxc7uD41ACc7l5h/EZmtYrVleEmMC1iNUoNdKGbSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hH+zkEjF; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hH+zkEjF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736276202; x=1736881002; i=w_armin@gmx.de;
	bh=es+knW+B9Mbo8Dn3N1YWwT6eze0M2d/eVwtnlGRt90o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hH+zkEjFVhQUstr8nCo9uhLAUv6d4RYdyltCLN3xfVbyKapcePyh2RX2/Blp0rNe
	 E9SZLnGkWP12GDRYbgUS6cZa2oAlo7vzRNx4jpACPvet8DoqDsweUrCUkFX+j6cOU
	 covgqnXwPnxcmFR12HdiYcZyoUbfEPISDwAguKpX2tsu+WqSMwSsumaunVBxiZB9e
	 apN3/lXhgENhc7Ocgx9yL7uXNSYSrrksrihM40Y12si9EAC+96PewzmqeKsaIKCYZ
	 ocNkOIcMLtU0f5nO5JovnRywWOmfRNHqB6Br/T0Id53ltDNWIMTg0sT/jjwtcVlpB
	 +djwV3B/fxocVvZK+Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7i8O-1taCmR2TVC-00vakc; Tue, 07
 Jan 2025 19:56:41 +0100
Message-ID: <9f257ca1-946d-416f-8741-247592b3866c@gmx.de>
Date: Tue, 7 Jan 2025 19:56:37 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 platform-driver-x86@vger.kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241226153031.49457-1-josh@joshuagrisham.com>
 <0fbe58a9-ecca-437f-aa30-9d3a17c2bd43@gmx.de>
 <CAMF+KeYdshNex2h4kLJari=kXVxgcOZw7GDutJrV6vKC0PTe6A@mail.gmail.com>
 <a8011f0f-1d44-42ec-9089-2da31f3852e2@gmx.de>
 <CAMF+KeZm8LCGsCZ9bosNYRCbv847CcZr+0mWeZtDQsk5QFRuyg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAMF+KeZm8LCGsCZ9bosNYRCbv847CcZr+0mWeZtDQsk5QFRuyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:he9uU9U71eOgpgIkljNqj5gg05s50CcpCZjudalxGJVDtQbiZd3
 zppbyWn8qJJ6GGMB6yZ4zFJAApxIBej5UhXpG8GaL6maFFNxRFPMjJOemPkyDS/IS9uGEI/
 d+gzoPSH0IfGoBVS01k630YxIllSSu2ZwHS0dnKzbwIRa+AxfJUI1NoI4dZ7f55IljV0oMx
 eOoYVYIWgfOKjByLjCDxg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:t2I+83FXs6U=;Im2GY95dw5m6MtzmshhN/fLX0fW
 Z/cwxtqhfyiYkuxazJ1jMgePx2R3WWyIJsTZrKupyVFOqY3nl3U0qzwD1fyNPP5OX/+WEXGtr
 ea788KvInoViBvxFC1jVwivt/gHvogCQnN/vHiwEB4CWskXiMJYGiD022hQ9+gth4ZZFgpR//
 NfwGzhW+W4omPc2O+7v4iffQPaJihkfNu+KusFFUaFC1lTczz0hpA8Y2Wy4YI+n8iemyGp/iy
 Hrd9G6E09Ijp4TvkAyOzxcQ/TiFk568Pw5BScgVkyyA1DsWi3ubYR4/uHoqVwntQC85Hvsy/L
 IaWLJF8xJkj2ZXIo2YEODv1M4SrrwIUcHFqjZkadsXgLyAttQ4J5UeoyyTyA4rPj7CK/RJdqS
 PPUVbBXa4NXccqSUlZ2bylhxGwee2B9mNI/iRKhVqt6MlgT7VKgJ/ghha74ghb8bPclhIRKGS
 c8rqvf/pJnmepC93czrt7YKZCXKH+c4KMZLYqW652zr+Fvtm5qlNTNxTQJ6zByZSGZeDxgV+c
 RozBgZVvU06TsmedCCir/gQKQdfmwMmMt0zqbJi0sCknEXizAbYXND191fQUs/mXErbajqhNp
 V0mKdx0aKRNl0P/IbU6p2q3ZQtgm1EcupWz3ofPdNamEorFbwzUVbe/9NlV18ws2Wm8QmcNvq
 EdVBoFK+C65qyoh3DY5qLtXCcL9Cj3OIS52VaFdJgfVYu4V3ls1uJjLPZzaQB92oShaLFJ3yE
 DGwiI4aNP4JbeKB4kcJWr/hCI15j9Zia3toX1uHHQ5imqkW47uz10OyTBXCljEiWY2kf8zf1/
 sMoQJS0IsCYrMWQWqekGcIoqIAnw7iLb9+4jmTc4Af4Y6slq9sn7s7OjolKMzXZSoD8VzO0x2
 TI7DAgNmf3zhOljIBK2RcchvD6H3iPJRDVpsT+tru+fdspz4d2K495sLsVPx8g27qPFYN4k7I
 L4OEiMgjCtB6g4H5bgsTSaPoonuEDSf4V8l4kcyozdsykBMd+tnQ66GIdta41AbQxJnP3HQzF
 W919MRuBSK7MMMe7bNJVg1J7Cia7LHSB1OnalYnMcHzTDOELhMpLnbE1jH0JREOpnDvWF1jRU
 sE3Qh7GBQIQKzVKwPHKtGjgSuaO7iE

Am 07.01.25 um 16:09 schrieb Joshua Grisham:

> Hi again Armin! I think I am finally with you on most of this, I think
> jet lag and general craziness made me a little extra dense for a week
> or two :)
>
> Den l=C3=B6r 4 jan. 2025 kl 07:28 skrev Armin Wolf <W_Armin@gmx.de>:
>> The reason for the firmware-attribute class original was that driver co=
uld export BIOS settings
>> to userspace applications, together with some metadata (min/max values,=
 etc).
>>
>> Because of this the exact meaning of each firmware attribute is usually=
 only known to the user
>> changing those firmware attributes.
>>
>> Your driver is a bit special in that it knows the meaning of each firmw=
are attribute. However
>> you still have to follow the firmware-attribute class ABI since userspa=
ce applications do not
>> know this.
>>
> Yes ok, as said, I am with you all now on this I think :)
>
> As a prototype for v5 I have created a new struct for each "firmware
> attribute" that helps me keep everything linked together with all of
> the different sub attributes for each different "fw attribute"
> including allowing a link back to my samsung_galaxybook instance
> without using the global pointer. At the end of the day, if I wanted
> to avoid using a global pointer, I needed a way to grab the private
> data based on either the kobj or the attr parameters to the show/store
> method of these individual sub attributes within each "firmware
> attribute", so what I have done is added the kobj_attribute as a
> struct member and then manually init+filled this kobj_attributes
> during probe, so I can now grab the parent struct instance using
> container_of() within the show/store functions which then gets me to
> my pointer. I thought about using the kset or something else for this
> but it seemed like kobj_attribute supported being a struct member
> better and gave the least amount of headaches from what I could tell.

Sounds reasonable to me.

> After trying to fight my way through this problem, I have an idea of
> what a better "dream scenario" would for me as a user/consumer of the
> firmware attributes interface -- namely that there is some kind of way
> to register and unregister by "type" (e.g. "I want a new enumeration
> fw attr; here is its parent, its name, and all of the functions for
> show/store of the required attributes, plus a data pointer that I can
> pack together with my attribute/somehow reach within the show/store
> functions"). I have handled a bit of this myself now in the working v5
> of samsung-galaxybook (just a minimal version of what it requires) but
> as said it currently relies on creating the kobj_attributes (at least
> those where I need the pointer) as struct members that I can later use
> with container_of() instead of creating static ones using the various
> __ATTR.. macros.
>
> Please feel free to say if any of this sounds totally (or partially?)
> off, otherwise I will try to test a bit more, clean up, and work
> through any checkpatch exceptions and get this sent as a v5.

I think your current plan sounds good. Thomas already submitted a patch se=
ries which
provides a more abstract API for registering firmware attributes.

>>>>> +static void galaxybook_fw_attr_class_remove(void *data)
>>>>> +{
>>>>> +     device_destroy(fw_attr_class, MKDEV(0, 0));
>>>> Please use device_unregister() instead since multiple devices might s=
hare the same devt of MKDEV(0, 0).
>>>> This would also allow you to remove the global variable "fw_attr_clas=
s".
>>>>
>>> Here I am a bit confused on exactly how this would/should look; all
>>> existing usages of fw_attr_class I can see use exactly this same
>>> pattern: device_create() and then device_destroy() with MKDEV(0, 0).
>>> Taking a look at the latest proposed changes from Thomas and it stil
>>> seems the intention is the same, just that it is slightly simplified
>>> and use pointer to the firmware_attributes_class directly instead of
>>> fetching it using fw_attributes_class_get(). Or is there a better way
>>> to do this (including usage of device_unregister() and/or something
>>> different with the devt) that will help solve some other problem(s)?
>> This is the code of device_destroy():
>>
>> void device_destroy(const struct class *class, dev_t devt)
>> {
>>          struct device *dev;
>>
>>          dev =3D class_find_device_by_devt(class, devt);
>>          if (dev) {
>>                  put_device(dev);
>>                  device_unregister(dev);
>>          }
>> }
>>
>> if multiple devices of a given class are using the same devt (like MKDE=
V(0, 0)) then
>> class_find_device_by_devt() might pick the wrong device.
>>
>> The fact that the other drivers are using this function is actually an =
error. The only
>> reason why this error was not noticed until now seems to be that curren=
tly only a single
>> driver using the firmware-attribute class is typically active at the sa=
me time.
>>
> Yes again sorry for being dense -- now with a little sleep and time to
> marinate this makes total sense, and it is a lot easier to just use
> device_unregister() like you say. This will be included in v5.

I partly blame the comment of device_destroy(), at first glance it looks l=
ike the
natural complement of device_create(), even if its not.

I will see if i can create a patch series to fix this.

>>> Also there are several other platform drivers that implement a very
>>> similar device attribute as ones that I have added here as a firmware
>>> attribute (namely I am thinking of "USB Charging" which exists in
>>> several other pdx86 drivers but a few other devices should/would
>>> probably support this kind of "Power on Lid Open" attribute as well);
>>> in the event that maintainers of those drivers should and eventually
>>> do migrate over to use the same or similar firmware attribute for this
>>> same kind of setting, should it include all of these attributes in the
>>> standard "enumeration" type attribute group or is it possible / would
>>> it make sense to have some sort of boolean-based fw attr type that is
>>> a bit more simple and a bit more self-explanatory?
>> Introducing a new "boolean" type would indeed be nice. This would allow=
 userspace application to use a simple
>> on/off slider instead of a dropdown menu when displaying such firmware =
attributes.
>>
>> In this case you could drop the "possible_values" attribute.
>>
>> What is the opinion of the pdx86 maintainers on this proposal?
>>
> Now that I have finally taken a better understanding of this, I see
> your point. Yes, nice with a boolean that could give a slider in a GUI
> or similar, but does not really change a whole lot in the driver
> implementation. I will go with enumeration type for now as mentioned
> and it can always be changed later if this new type comes.

Ok.

>
>>> I am quite certain that the code can be cleaned up and/or refactored a
>>> bit, but I would hope that the result of the logic should stay the
>>> same (per what I described above); having said all of that, does it
>>> still make sense to try and simplify this somehow and/or any tips or
>>> recommendation how to achieve the desired result in a better way?
>> I am OK with you preferring the non-legacy modes over the legacy ones. =
However trying to limit yourself
>> to the profiles currently supported by gnome (AFAIK uses platform-profi=
les-daemon) is not a good idea.
>>
>> I would like to see a more static mapping be implemented:
>>
>> PERFORMANCE_MODE_ULTRA -> performance
>> PERFORMANCE_MODE_PERFORMANCE -> balanced-performance (can also be legac=
y if non-legacy is not available)
>> PERFORMANCE_MODE_OPTIMIZED -> balanced (can also be legacy is non-legac=
y is not available)
>> PERFORMANCE_MODE_QUIET -> quiet
>> PERFORMANCE_MODE_SILENT -> low-power
>>
>> In this case the platform-profiles-daemon would have a similar job as t=
he Samsung service, which is to
>> determine a suitable mapping for the supported modes to {performance, b=
alanced, powersave}.
>>
>> Looking at the code of the daemon it seems something similar is already=
 being done, but only for the profiles
>> "quiet" and "low-power" (one of which is getting mapped to the "powersa=
ve" mode).
>>
>> I am confident that the daemon could be extended be a bit more intellig=
ent when it comes to determine the
>> mapping of the other modes.
>>
> I understand the thought here but my only problem and what sort of
> "itches" at me is that most of these devices are not "Ultra" models
> and they will never have an "Ultra" mode. For the non-Ultra models,
> "Performance mode" *is* "Performance mode" (meaning, it is the mode
> which prioritizes performance over anything else) so for me it feels
> best if these non-Ultra models (again majority of these devices) can
> have the Performance mode that they should have. And you can maybe
> argue that "Ultra" is in fact its own mode entirely -- when you use
> this mode on these devices, they really scream (the fans, mostly, that
> is) and they get super hot haha :)

Is this non-ultra performance mode any different than the ultra performanc=
e mode
in terms of performance gains, fan speed, etc?

> Other than this Ultra vs Performance question, I do agree with you and
> think it makes sense. My first thought if we want to actually
> "simplify" this in this way is if there could actually exist a
> platform profile called "ultra" then it would be just a perfect 1:1
> mapping (other than taking legacy modes into account).
>
> This "perfect fit" for samsung-galaxybook would be to create a new
> platform profile called something like PLATFORM_PROFILE_ULTRA, but
> that seems like a bit of a tall order... Would it make more sense to
> implement this "ultra" mode using the new PLATFORM_PROFILE_CUSTOM and
> then map them like this?
>
> PERFORMANCE_MODE_ULTRA -> custom (named "ultra" if that is possible?)
> PERFORMANCE_MODE_PERFORMANCE (or PERFORMANCE_MODE_PERFORMANCE_LEGACY)
> -> performance
> PERFORMANCE_MODE_OPTIMIZED (or PERFORMANCE_MODE_OPTIMIZED_LEGACY) -> bal=
anced
> PERFORMANCE_MODE_QUIET -> quiet
> PERFORMANCE_MODE_SILENT -> low-power
>
> Thought admittedly I am not 100% familiar with how
> PLATFORM_PROFILE_CUSTOM is implemented to work; I have a vague memory
> that I read somewhere that this was roughly the intention? But I am
> not sure if it is actually implemented to work this way. But if it
> will in fact work "out of the box" including with
> platform_profile_cycle() for the hotkey then it seems like the
> cleanest and easiest approach.

PLATFORM_PROFILE_CUSTOM is meant to signal that the platform is not in a w=
ell-defined
profile state, usually due to manual tuning. So please do not use it for U=
LTRA.

>
> If this is possible, then my best guess for the logic for this mapping
> in samsung-galaxybook could be changed to loop the "supported modes"
> forwards instead of backwards, and just let the "legacy" modes be
> written first (as they seem to always come first in the list), and
> then in case the non-legacy mode exists later in the array, it will
> just replace the already-mapped legacy value with the new non-legacy
> value, and thus skip any kind of condition-based checking/mapping
> entirely. Is that sort of more like what you had in mind?

Can you be sure that legacy performance modes are always placed before non=
-legacy
performance modes?

If no then i suggest that you iterate over all supported modes and if you =
encounter
a legacy performance mode you check if the associated platform profile slo=
t was already
taken by a non-legacy performance mode. If that is the case you ignore tha=
t legacy performance
mode.

If you are sure that the order is always the same then you can of course s=
implify this by
iterating forward. I will leave it to you to choose which one to implement=
, as you seem
to have more knowledge about the underlying hardware than me.

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
>>
> Thanks again!
>
> Joshua
>
>> [...]
