Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2BA1E0DFC
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 18:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731954345; cv=none; b=sQNFqXn8WnQbwtKFjlZXJuHnaKZ5z3xqO2is0H7ytbVBTFquRNWfJcUvcvr5zkF8VKd+d5Bi7zuzS2NB64oUzmoAt7xI227vt9RA5A0+ezDOdR8QZB1HWpWF6Gr6Cty6XRqWUW9FrDTJEOpk41xtdrQPS+CdYId17hKThpSlgTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731954345; c=relaxed/simple;
	bh=1YxpM1irQRJRa09dLuNU6qZXg8GEEJ9rTQB6+5MwwUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hDD6Cy8fTuFnG1h+AB2kFzzYfy6xsLICCTchXIEwgQLPyjMsASztR6RYUCyUAG8RV3YZZtqATHLVrj6zU0ZGyWnGuUvKx4V5FGn4ZHL69reyFqliMonARZ+ExZQvaHSUbJ3jFnxiNETkhrMj9pBdGVQlDyKXDZ7JUyQPrwvqwB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=P0rT7vGN; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="P0rT7vGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1731954337; x=1732559137; i=w_armin@gmx.de;
	bh=1YxpM1irQRJRa09dLuNU6qZXg8GEEJ9rTQB6+5MwwUI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=P0rT7vGNT04MiVrPIM5QTLWJ9Vi39KaLq0KwxQpD7aE9Y6ike6IpwUXmqoounykk
	 h4A7UyMHS5uauvoNWhXU5uACZDV822aYQ5/8tvn1JtQ0TNPr/TDQzGKpmIoFjSMWe
	 W1iUk8LPvkWl/dB0z82+Ll0yw5PPt9ekUQs7BKtlhw8Ui3eS/UDFaaGehfrKkWgUk
	 QqzOyNwMyi7FQgGQu3nIvnBNMaCM/rHFC0XCxng4dGf7p5qQiJxhOAZRgt4S5XrTh
	 936J9piIeh+prXqlHTf1Om2ENL+jjgevOCRzxaQTWduPO12LPemca1+8v8ZhYcmKV
	 nroXrnxu8CL3vHR5Dg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([141.30.226.119]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAwXr-1t1s9w2Suv-007bsu; Mon, 18
 Nov 2024 19:25:37 +0100
Message-ID: <b671f3f7-5d48-4534-831b-3b357bcd7f6a@gmx.de>
Date: Mon, 18 Nov 2024 19:25:35 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Why is wmi_bus_type not exported?
To: Werner Sembach <wse@tuxedocomputers.com>,
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
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
 <45ef4d66-f13b-4e6f-9611-ab0e38b5edbd@redhat.com>
 <46d70afa-4d9a-4b03-8457-9ed090612531@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <46d70afa-4d9a-4b03-8457-9ed090612531@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wCgi0OQrN6/9IiKqJ03ZHQnlVVRbe8NGVJ9KTGSoHkTI2xGbnor
 d4ZPnMFFhWzpVe3s1GzgZVxCOPlyg25kWPbxsrfxdmYM0mGdpdo7LBrCDwe2vbvGsEhJsA9
 us2nxK9tMjkjf+ing2JwVrf+u9JuwlEeu8MtOQEDq59AyDfUoFA4f8n0iBNMGK0kviDYGVE
 E7+xyfPF5rMb7WTGz+Feg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:G+WVniFSrLI=;3vezdJo+j4RZ4S+T1trzD4N1hiX
 8aGI2Wpb4qno2vlaX3mdOzQ56GgQVJs9AvlOm/6fOnBPhF88NKC+ig4zXMBVSqfgqcZuUeHMa
 2/5hJMDgfOIddvrJQePYWmST04Y1uoe7NHly9E97g9hBh/CYiaBoH7uKgc2Sl3Jodoz8Oz2+a
 M+vB9u+8/OZpyHNaZ2EucaxH0rZ7o565lKMh9fVSiA+moP5/poZ4YULYC6pHIrjJiLueZDq8X
 Y4kdvwF44dOLcUeO0Wc84VBOZAEfUb/DowrJrfSU4EIYbKaAFKhqaj6J1UAsWFzna/0TsQ1x3
 JhwcPx85NeKXlSqdZYbrN6qzQxBpvUB3TtgBejnaJ5IAhSMGSweLihFtS3KKp0joMA6DK+gag
 X059kjxeguQpItKZ3IYpTWaYEIj4g/OD7ZMSET5dCyTDFxjnJ34NOxsBaXVl/nGpf7Ubf2Lu6
 dOivunqSDoB27MoQtlVb8KY6EX9KPPCelySYUXFhDYRRMOOsBjhVfZBH6pujks6xFpOjZPCul
 /wa/EwH61uYfwsaLwt2aWaGLP58j9qya8N0x3dvsFbyuxvLs2Z8qEHZzxmiLANrX920X5vhrM
 CU1gHeNZoIdhTAQY3oKT2l2ftB6qi78OJ0gqM65CxOgXrWxC55y+jd4erbsW2iC5vrIPt0x1B
 nX+8eszSS6f8WTLeDB0jjfLnuAbZWhcHGSI3dwgjELfXN5IlU2PptxBS4g3pNBLyyZGBNm2kJ
 8XlAWLOYmxLhAdExB960AKNbrysu4pffpuBnz20/Mf2m2p2f18QMXA107CkI2kB3yym6pI9wb
 TvRc40c6ALYOGAZ/BYVBef0mslSZ+g7xIf/HD4SPV+QCdgDGxBD2gujtaljwguokBnOlGbCVT
 IU77K3AusMkD26K5GM66OlXp1Pn7P5VBjLeJ9ExOA9C4HK6RL0sEjKCz0

Am 18.11.24 um 14:11 schrieb Werner Sembach:

>
> Am 18.11.24 um 12:20 schrieb Hans de Goede:
>> Hi,
>>
>> On 18-Nov-24 12:16 PM, Werner Sembach wrote:
>>> Hi,
>>>
>>> Am 18.11.24 um 12:09 schrieb Hans de Goede:
>>>> Hi,
>>>>
>>>> On 13-Nov-24 11:04 PM, Armin Wolf wrote:
>>>>> Am 13.11.24 um 13:12 schrieb Hans de Goede:
>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 13-Nov-24 12:47 PM, Werner Sembach wrote:
>>>>>>> Am 13.11.24 um 12:19 schrieb Hans de Goede:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 13-Nov-24 12:11 PM, Werner Sembach wrote:
>>>>>>>>> Am 13.11.24 um 12:05 schrieb Hans de Goede:
>>>>>>>>>> Hi All,
>>>>>>>>>>
>>>>>>>>>> On 12-Nov-24 5:31 PM, Armin Wolf wrote:
>>>>>>>>>>> Am 12.11.24 um 16:10 schrieb Werner Sembach:
>>>>>>>>>>>
>>>>>>>>>>>> Am 12.11.24 um 13:51 schrieb Armin Wolf:
>>>>>>>>>>>>> Am 12.11.24 um 13:42 schrieb Werner Sembach:
>>>>>>>>>>>>>
>>>>>>>>>>>>>> Hi,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Am 12.11.24 um 13:01 schrieb Armin Wolf:
>>>>>>>>>>>>>>> Am 12.11.24 um 12:52 schrieb Werner Sembach:
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Hi,
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> quick learning question: Why is wmi_bus_type not
>>>>>>>>>>>>>>>> exported unlike, for
>>>>>>>>>>>>>>>> example, acpi_bus_type, and platform_bus_type?
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Wanted to use bus_find_device_by_name in an acpi driver
>>>>>>>>>>>>>>>> that might
>>>>>>>>>>>>>>>> need additional infos from a wmi interface that might
>>>>>>>>>>>>>>>> or might not be
>>>>>>>>>>>>>>>> present.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Kind regards,
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Werner Sembach
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> What kind of information do you have in mind?
>>>>>>>>>>>>>>> wmi_bus_type is not
>>>>>>>>>>>>>>> being exported for historic reasons, i can change that
>>>>>>>>>>>>>>> if necessary.
>>>>>>>>>>>>>> It's for the tuxedo-drivers part for the Sirius 16 Gen 1
>>>>>>>>>>>>>> & 2 which has
>>>>>>>>>>>>>> a slow wmi and a quick acpi interface, however the quick
>>>>>>>>>>>>>> acpi
>>>>>>>>>>>>>> interface can not get the max rpm of the cooling fans,
>>>>>>>>>>>>>> but the wmi
>>>>>>>>>>>>>> interface can.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Thing is for the acpi driver we might plan an earlier
>>>>>>>>>>>>>> upstream date
>>>>>>>>>>>>>> and it might get multi-odm support, while the wmi
>>>>>>>>>>>>>> interface is and
>>>>>>>>>>>>>> stays odm specific. So my idea was to only couple both
>>>>>>>>>>>>>> drivers in a
>>>>>>>>>>>>>> dynamic way using bus_find_device_by_name.
>>>>>>>>>>>>>>
>>>>>>>>>>>>> Interesting, how is the ACPI interface not ODM specific?
>>>>>>>>>>>>> Can you
>>>>>>>>>>>>> elaborate a bit on how the ACPI and the WMI interfaces work?
>>>>>>>>>>>> We have an ODM that was willing to include ACPI code by us
>>>>>>>>>>>> in their
>>>>>>>>>>>> BIOS blob and we hope that in the future we can carry that
>>>>>>>>>>>> API over to
>>>>>>>>>>>> other ODMs for future TUXEDO devices.
>>>>>>>>>>>>
>>>>>>>>>>>> In pseudocode that API looks like this:
>>>>>>>>>>>>
>>>>>>>>>>>> v1:
>>>>>>>>>>>>
>>>>>>>>>>>> void SMOD(bool mode): Toggle firmware controlled fans vs
>>>>>>>>>>>> manually (aka
>>>>>>>>>>>> via the commands below) controlled fans
>>>>>>>>>>>> bool GMOD(): Get current SMOD setting
>>>>>>>>>>>> int GCNT(): Get number of fans
>>>>>>>>>>>> enum GTYP(int index): Returns "CPU-fan" or "GPU-fan"
>>>>>>>>>>>> void SSPD(int index, int value): Set fan speed target as a
>>>>>>>>>>>> fraction of
>>>>>>>>>>>> max speed
>>>>>>>>>>>> int GSPD(int index): Get current fan speed target as a
>>>>>>>>>>>> fraction of max
>>>>>>>>>>>> speed
>>>>>>>>>>>>
>>>>>>>>>>>> v2 same as v1 but with added:
>>>>>>>>>>>>
>>>>>>>>>>>> int GRPM(int index): Get current actual fan speed in
>>>>>>>>>>>> revolutions per
>>>>>>>>>>>> minute
>>>>>>>>>>>> int GTMP(int index): Get temperature of thing fan with
>>>>>>>>>>>> respective
>>>>>>>>>>>> index is pointed at (CPU or GPU die, see GTYP)
>>>>>>>>>>>>
>>>>>>>>>>>> Like I said, what is missing is a "Get Max RPM" function
>>>>>>>>>>>> even in v2,
>>>>>>>>>>>> which we might add a future iteration, but, well this bios
>>>>>>>>>>>> is now out
>>>>>>>>>>>> in the wild. However these released devices have a "get
>>>>>>>>>>>> info" function
>>>>>>>>>>>> in the wmi code which returns the v2 infos and the max rpm.
>>>>>>>>>>>>
>>>>>>>>>>>> I want to write the code in a way that it probes the acpi
>>>>>>>>>>>> interface
>>>>>>>>>>>> for function existence and wherever something is missing
>>>>>>>>>>>> tries to fall
>>>>>>>>>>>> back to infos gathered from the wmi interface, but that one i=
s
>>>>>>>>>>>> implemented in a stand alone module (the tuxedo_nb04_*
>>>>>>>>>>>> stuff in
>>>>>>>>>>>> tuxedo-drivers) and I would like to keep it that way in
>>>>>>>>>>>> honor of KISS.
>>>>>>>>>>>>
>>>>>>>>>>>> My plan is that the first time max rpm is pulled the acpi
>>>>>>>>>>>> driver uses
>>>>>>>>>>>> bus_find_device_* to get the wmi device, if present, and
>>>>>>>>>>>> pulls max rpm
>>>>>>>>>>>> from the driver data there and copies it over to it's own
>>>>>>>>>>>> driver data.
>>>>>>>>>>>> If not possible it returns a dummy value or falls back to
>>>>>>>>>>>> another
>>>>>>>>>>>> method. Maybe a hard coded list of max rpm values,
>>>>>>>>>>>> currently only 2
>>>>>>>>>>>> devices have the new interface, so it wouldn't be a long list=
.
>>>>>>>>>>>> Directly going to the hard coded list is our current
>>>>>>>>>>>> fallback plan,
>>>>>>>>>>>> but it is not an elegant solution as the info is actually
>>>>>>>>>>>> there, if
>>>>>>>>>>>> you know what i mean?
>>>>>>>>>>>>
>>>>>>>>>>>> Kind regards,
>>>>>>>>>>>>
>>>>>>>>>>>> Werner
>>>>>>>>>>>>
>>>>>>>>>>> I see, we once had a similar case with the dell-wmi driver,
>>>>>>>>>>> see commit f97e058cfe80 ("platform/x86: wmi: Don't allow
>>>>>>>>>>> drivers to get each other's GUIDs"):
>>>>>>>>>>>
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0The only=
 driver using this was dell-wmi, and it
>>>>>>>>>>> really was a hack.
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 The driver was getting a data attribute from
>>>>>>>>>>> another driver and this
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 type of action should not be encouraged.
>>>>>>>>>>>
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Rather drivers that need to interact with one
>>>>>>>>>>> another should pass
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 data back and forth via exported functions.
>>>>>>>>>>>
>>>>>>>>>>> I would be quite unhappy with drivers interacting with WMI
>>>>>>>>>>> devices without a proper WMI driver, but i can see your
>>>>>>>>>>> point here.
>>>>>>>>>> Agreed on that 1 driver should not be poking the [wmi_]dev of
>>>>>>>>>> another
>>>>>>>>>> driver. This usually works until it doesn't for some reason
>>>>>>>>>> so it
>>>>>>>>>> should just be avoided.
>>>>>>>>>>
>>>>>>>>>>> Maybe we can keep the retrieval of the fanX_max values out
>>>>>>>>>>> of the kernel? I propose the following:
>>>>>>>>>>>
>>>>>>>>>>> - have a driver for your generic ACPI interface
>>>>>>>>>>> - have a driver for the WMI interface (with fanX_max hwmon
>>>>>>>>>>> attributes)
>>>>>>>>>>>
>>>>>>>>>>> The driver for the generic ACPI interface exposes the fan
>>>>>>>>>>> speed controls as pwmX attributes if the interface does not
>>>>>>>>>>> support
>>>>>>>>>>> the "Get Max RPM" function. The userspace application in
>>>>>>>>>>> this case searches for the hwmon chip exposed by the WMI
>>>>>>>>>>> driver and
>>>>>>>>>>> reads the fanX_max attributes there. Then the application
>>>>>>>>>>> can convert the target fan speed into values for the pwmX
>>>>>>>>>>> attributes
>>>>>>>>>>> itself.
>>>>>>>>>>> If the ACPI interface however supports the "Get Max RPM"
>>>>>>>>>>> function, then it exposes fanX_max and fanX_target hwmon
>>>>>>>>>>> attributes
>>>>>>>>>>> themself and the userspace application uses them directly.
>>>>>>>>>>>
>>>>>>>>>>> This would keep the kernel drivers simple.
>>>>>>>>>> That would indeed keep the kernel drivers simple, but at the
>>>>>>>>>> cost of
>>>>>>>>>> providing a non standard hwmon interface.
>>>>>>>>>>
>>>>>>>>>> Whatever implementation is written it really MUST follow the
>>>>>>>>>> standard
>>>>>>>>>> hwmon API so that any hwmon tools like the lm_sensors
>>>>>>>>>> fancontrol script
>>>>>>>>>> will work properly.
>>>>>>>>>>
>>>>>>>>>> So NACK from me for exposing fanX_max on a separate hwmon
>>>>>>>>>> device.
>>>>> I think there is a misunderstanding here: the hwmon device
>>>>> exported by the WMI interface
>>>>> will also contain temperature and fan speed sensors (provided by
>>>>> the WMI interface), so
>>>>> this would be a standard hwmon device.
>>>>>
>>>>> The only difference between this hwmon device and the hwmon device
>>>>> exposed by the ACPI interface
>>>>> would be that:
>>>>>
>>>>> - the hwmon interface exposed by the ACPI interface also allows
>>>>> for manual fan control
>>>>> - the hwmon interface exposed by the ACPI interface does not
>>>>> support the fanx_max attribute
>>>>>
>>>>> So i think there should be no problem with having two hwmon
>>>>> devices on some models, since both are
>>>>> usable independently from each other.
>>>> Ah I see I thought the suggestion was to have the WMI hwmon
>>>> interface only export
>>>> the fanx_max attribute attribute and then require userspace to
>>>> treat the 2 hwmon
>>>> interfaces as one.
>>>>
>>>> If you duplicate all the functionality of the ACPI hwmon device on
>>>> the WMI hwmon device,
>>>> then the question becomes why have the ACPI hwmon interface there
>>>> at all ? If it is less
>>>> functional and duplicate IMHO we should just leave it out ?
>>> Without knowing the details because a collegue write the wmi code:
>>> The WMI fucntions are signigifanctly less performant then the acpi
>>> ones where it has measurable performance impact to the whole system
>>> when you continuously poll them.
>>>
>>> Luckily the only wmi exclusive information (max rpm) doesn't change
>>> and only needs to be polled once during initialization).
>> Right, but both offer the same information / functionality right
>> (except for the missing max rpm).
>>
The ACPI interface allows for manual fan control, something the WMI interf=
ace does not support.

>> So unless I am missing something if both drivers are loaded then
>> there will be 2 hwmon devices registered with duplicate functionality?
>>
>> If I have understood that correctly then the WMI interface really
>> should be hidden (the WMI drivers' probe() can simply return -ENODEV
>> without doing anything) when the ACPI interface is there.
>>
>> We do NOT want 2 hwmon devices with duplicate functionality.

AFAIK i think this should normally be done at the BIOS level, but if only =
a limited number of devices are affected then this should be fine.

Thanks,
Armin Wolf

> ack
>>
>> Regards,
>>
>> Hans
>>
>>
>
