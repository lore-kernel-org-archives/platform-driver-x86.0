Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AC11AA7B9
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731445235; cv=none; b=ttWxsmmWqAHdQzmxxjiakWpi22Jj/LQTzhRXmaYmv3cUWQeEYOVXE8J+ytXQqg1RCa6QpI92a1olb26jsemhcZvhn61M6+m4grwXVEZAkYh8uQatNBUjlnAjsnJ1RLnnk1hA6yfmyLymi+fxkrZDgSf+OxR60zgnYsOq1mEHM+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731445235; c=relaxed/simple;
	bh=F9tiDBSdCzBNJ47CrHwgjClGpQehf7V/4BSNPz+kJYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwjR9dWdlMGzKEbSHHo3jtvbquKWMcinLVkG5JK8Ry82nG+RtKeEDjUsQZVtL3ksBmJVTEL5gZJEMj8jpO8pzNN/Ac07KdV2vz8+yAqmMOAFaAeSHNtOmPhBUXKbxE+/A/u5SqbsXSEJLHx/Ng08xG/rc3Sutie+h2so8TpXWI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=cKnS/9t1; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="cKnS/9t1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1731445227; x=1732050027; i=w_armin@gmx.de;
	bh=F9tiDBSdCzBNJ47CrHwgjClGpQehf7V/4BSNPz+kJYY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cKnS/9t1+leLsJBKoTd8nR+t52ML5sdMet9QJ/Po0QtW7iQco9uOwRRPd5TN6yFA
	 abdmzKxkDl6QTS3vZa1MVD7qEPnji4yPXD48F9QoicrnYZxRDKPnj4Z24pMI6UZ9d
	 0q/NPEdM498tlPQ3b/kJp2vamf22dm7dEqqU2fG6xcMhg/sT8wHbSpYWxZDs5nTHg
	 k6R64R7SPi20nQ8J5UUfdmSMhzmJZwCKG1I5ObwK/ZzR58ZnYbp3agRAc/Xz6DZ3E
	 tI5TkEWXpmOAblLMFYk7itfVDVCPovRsmgyMYowv22307zd8hSQbNnj8kgsB5iHO3
	 OHNvM6RtaZ3lR/Rf8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mel7v-1tkr314Btd-00pcBc; Tue, 12
 Nov 2024 22:00:27 +0100
Message-ID: <07295ec3-f785-475b-b16a-972558ad6e2c@gmx.de>
Date: Tue, 12 Nov 2024 22:00:26 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Why is wmi_bus_type not exported?
To: Mario Limonciello <mario.limonciello@amd.com>,
 Werner Sembach <wse@tuxedocomputers.com>, platform-driver-x86@vger.kernel.org
Cc: Christoffer Sandberg <cs@tuxedo.de>
References: <8847423c-22ec-4775-9119-de3e0ddb5204@tuxedocomputers.com>
 <c4315d31-7bc6-4bd9-a7eb-3e53356d55e9@gmx.de>
 <bf3dae8b-7f1f-4438-9cbe-525825d70752@tuxedocomputers.com>
 <aa129cb8-2b1d-4912-b731-74e959b99da6@gmx.de>
 <cc1721a1-bb2f-4dde-a8a5-3d4928439520@tuxedocomputers.com>
 <b2c8616e-7097-4e27-b5e4-b1fb1790857e@gmx.de>
 <663b2c15-d03e-4ff3-b0f3-54ae8403c133@tuxedocomputers.com>
 <faa64967-fc02-4a36-9e3f-c1c53c31ab90@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <faa64967-fc02-4a36-9e3f-c1c53c31ab90@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0itqWZJ+bCwsSnXnuEX641T5f8zwGBqHaPtRrxQK0kMYWb2wRQj
 wUnBP/3yQfWSUskPJhVC4RKBbuYZ2MMIwtAqz4e1GMvoMp6OyH45YKTenNq77W00n+1Ynmv
 UdgtN1bMTgy5kkQukShzs7wc+gjI8RP+0YkGFqtAEJ7kfRRDRN6L7OUJ8/5O0fN+MMFwQ14
 7HAo+xrhpElyaB7bUHsxg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sSZRPeOzOTE=;CA6Yw3KwlLd97xGmD5v27a+5XqZ
 vq4eAuBeTlSEMOfYrILzcwMBGTZovnecG+JH+HlMTERaCJwyfQfwgcOkCumbnGcjf9B/RxC5a
 NpasBzJnN4pOQO6q/gClFVngYWDOpPSZQqPbjhTSgmjqQBjrwLT58kmLN7i/PxzEQZVHjIVHG
 aQuSTw8Amx0C3Wh1LM7ys3HZIdgqDutud2hoJx4yyZg6mw0p85azKAecdOhmvX+rnDAIPSTzC
 XJ6zTK0isKqBH3JkWFzsagSOQBvgi7GnKegf3t9BojyG8fSejWsD7gXIqZBCy1dcikfsLnJ4I
 0uuQNuu/b8B3yn08/411wLdm9RxFMpOVJULVj9YdgLMbWn3uhwMF8OHALz/spOcB+C+S1Wh5W
 enBAyWky8XSc7VWjeT//2PcWHPN1X6604Y3xYhUxjHIC4GYUMfYKwSjB/cRF7pn+NBcAuCbfM
 nrs3vlUMfnkE83VwpTKnwxtD5l0X2kKxnwgumqPkUWlYVEVSsNYGGH/oi3/dhYcxv/WowjhIy
 AMkMkZ1KGqul4UiLAqWIhLaCF+g8kHpMX4kssO2RRat9NIdSBPVX6ZwCYoCHef5+IXHoDMvg8
 2pn3bD6Ou0HCxGhgABjKIfQkzULweRpn4iTIKFmcg/cTC3C0KJUOt1bfbjYWdY+RnxnTYCpc/
 N9TMW4NwfchGRv2p3Q5U2ptmlQRanM7tp00qGC80vaYa9a4pu7kXi80T0TFxtK1ooNeWssq1X
 pHrWUgWa1qWMD69u26oXZiqsZrm8cVt+wBK9dmc6tlW6cssjnXR/7Z5ZUlUNexOIQEQx7pUvk
 S/+gSg8z1ptsenWkTtaqY2hAxcdPbAr35+xocWpDRezRA4/QqjQjX1MWcvjGegGox+77EJEL4
 3y9HnGkKD0RVNjcaWN8kG2qK7emCl/3be3pIMsx/Ky4+2IqQS/wROmyiC

Am 12.11.24 um 18:46 schrieb Mario Limonciello:

> On 11/12/2024 10:43, Werner Sembach wrote:
>> Am 12.11.24 um 17:31 schrieb Armin Wolf:
>>> Am 12.11.24 um 16:10 schrieb Werner Sembach:
>>>
>>>>
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
>>>>>>>> quick learning question: Why is wmi_bus_type not exported
>>>>>>>> unlike, for
>>>>>>>> example, acpi_bus_type, and platform_bus_type?
>>>>>>>>
>>>>>>>> Wanted to use bus_find_device_by_name in an acpi driver that migh=
t
>>>>>>>> need additional infos from a wmi interface that might or might
>>>>>>>> not be
>>>>>>>> present.
>>>>>>>>
>>>>>>>> Kind regards,
>>>>>>>>
>>>>>>>> Werner Sembach
>>>>>>>>
>>>>>>>>
>>>>>>> What kind of information do you have in mind? wmi_bus_type is not
>>>>>>> being exported for historic reasons, i can change that if
>>>>>>> necessary.
>>>>>>
>>>>>> It's for the tuxedo-drivers part for the Sirius 16 Gen 1 & 2
>>>>>> which has
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
>>>>
>>>> We have an ODM that was willing to include ACPI code by us in their
>>>> BIOS blob and we hope that in the future we can carry that API over t=
o
>>>> other ODMs for future TUXEDO devices.
>>>>
>>>> In pseudocode that API looks like this:
>>>>
>>>> v1:
>>>>
>>>> void SMOD(bool mode): Toggle firmware controlled fans vs manually (ak=
a
>>>> via the commands below) controlled fans
>>>> bool GMOD(): Get current SMOD setting
>>>> int GCNT(): Get number of fans
>>>> enum GTYP(int index): Returns "CPU-fan" or "GPU-fan"
>>>> void SSPD(int index, int value): Set fan speed target as a fraction o=
f
>>>> max speed
>>>> int GSPD(int index): Get current fan speed target as a fraction of ma=
x
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
>>>> in the wild. However these released devices have a "get info" functio=
n
>>>> in the wmi code which returns the v2 infos and the max rpm.
>>>>
>>>> I want to write the code in a way that it probes the acpi interface
>>>> for function existence and wherever something is missing tries to fal=
l
>>>> back to infos gathered from the wmi interface, but that one is
>>>> implemented in a stand alone module (the tuxedo_nb04_* stuff in
>>>> tuxedo-drivers) and I would like to keep it that way in honor of KISS=
.
>>>>
>>>> My plan is that the first time max rpm is pulled the acpi driver uses
>>>> bus_find_device_* to get the wmi device, if present, and pulls max rp=
m
>>>> from the driver data there and copies it over to it's own driver data=
.
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
>>> I see, we once had a similar case with the dell-wmi driver, see
>>> commit f97e058cfe80 ("platform/x86: wmi: Don't allow drivers to get
>>> each other's GUIDs"):
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0The only driver using this was dell-wmi, and i=
t really was a hack.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The driver was getting a da=
ta attribute from another driver
>>> and this
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type of action should not b=
e encouraged.
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Rather drivers that need to=
 interact with one another should
>>> pass
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data back and forth via exp=
orted functions.
>>>
>>> I would be quite unhappy with drivers interacting with WMI devices
>>> without a proper WMI driver, but i can see your point here.
>>>
>>> Maybe we can keep the retrieval of the fanX_max values out of the
>>> kernel? I propose the following:
>>>
>>> - have a driver for your generic ACPI interface
>>> - have a driver for the WMI interface (with fanX_max hwmon attributes)
>>>
>>> The driver for the generic ACPI interface exposes the fan speed
>>> controls as pwmX attributes if the interface does not support
>>> the "Get Max RPM" function. The userspace application in this case
>>> searches for the hwmon chip exposed by the WMI driver and
>>> reads the fanX_max attributes there. Then the application can
>>> convert the target fan speed into values for the pwmX attributes
>>> itself.
>>> If the ACPI interface however supports the "Get Max RPM" function,
>>> then it exposes fanX_max and fanX_target hwmon attributes
>>> themself and the userspace application uses them directly.
>>>
>>> This would keep the kernel drivers simple.
>>>
>>> I suppose you provide some sort of OEM application for fan control?
>>
>> Yes we do.
>>
>> It would be a little bit harder for 3rd parties wanting to implement
>> the hwmon interface then and i'm also thinking of implementing it in
>> the thermal subsystem (albeit i did not do a proper readup on that
>> system yet so maybe it wont work).
>>
>>> In this case having the fanX_max handling here also gives
>>> you full control and allows you to stay independent from the kernel
>>> development in that regard. For example you might decide
>>> independently to hardcode the max. RPM values on some machines (like
>>> the two new machines) or use a different hwmon chip on
>>> some other machine.
>>>
>>> Aside from that, i really like your approach with having a generic
>>> ACPI interface, it can potentially save you a lot of work
>>> once you have the initial driver.
>> Knock on wood that the generic acpi interface works out ^^.
>>>
>
> If you're comfortable sharing - is the "ACPI interface" just a wrapper
> for an EC interface?=C2=A0 Is that EC interface stable?=C2=A0 As you're
> developing directly for Linux, there is also the "possibility" to just
> interact with the EC directly.

Using a ACPI device is still beneficial since it allows autoloading based =
on the _HID value.

>
> That being said if there is an ACPI abstraction already it is nice
> that you can tell about it's presence using the ACPI ID reserved for
> this device interface.
