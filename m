Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E5E3570A4;
	Tue, 18 Nov 2025 14:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476881; cv=none; b=QjlxG4u4u/R25+q524u22I1ENNcTQnF5xpx0qzUPXZ6J3p6Hm5BoJ0Gbf+gy8nFp9RKs1Wvq0dww804SdrVjFGYcoNyzhQyOGRTUTtQiusVRB+tncKweKY2eBhGOPXq+OscZnLoqAbAXQKRAZN8QdHIHpADVXl6+8RtR/T/f7oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476881; c=relaxed/simple;
	bh=tnpmmVfDQbJ5XIlIZ+TnTS4uzL3Fj6i8VIbT1dJda2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9CfheirqBGpVcUE0iUjwumSGKXNX+34uiK3GSnVqrpcNZZEuuvOFVQqYSbweRowNEMvZ8DKTHIUJ9r1zWtScGsx2RSxN+k2hkh7WULs6C2PKhjf2Dbx2yiYcKpYHvqUlT7T0sp+AuIrkmproLIaeZchJmb3J0Qehs2WS1Vrwd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=mYF8qxnX; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="mYF8qxnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763476875; x=1764081675; i=w_armin@gmx.de;
	bh=tnpmmVfDQbJ5XIlIZ+TnTS4uzL3Fj6i8VIbT1dJda2w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mYF8qxnXsC3d8+Nu3ZRg3FCetU1iINOFPJxBRt/A/vYe5xexB6V93KJmoEQrVJn+
	 eWPqDIawK133+8z0EzxR/OEg+bF7bShABcQ00KGi24htsuNbzJmDyj1POHmGEC5aD
	 NUpvsS33ujPFus/TsrweRikLkAPdyG43dOAU3R01eDuq/VmpDExCtnFZXykH9p6jC
	 INxHsdjGcL9J6VCmxLi9NzX1mLZa5xOuvdr+ErdDeR4vou6TfzC7A0TjnZ5FHN1HC
	 Yjw1x1JGfKTx7HRoVUgM5YTpT4Kiw95WG5MWzB49sPNw+j23UmbD/yHt9uPOo0vlg
	 QufcgJuproosZFwo3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.23.146] ([141.76.8.178]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MO9z7-1vWji73IPR-00XYE3; Tue, 18
 Nov 2025 15:41:15 +0100
Message-ID: <2d5d88fe-cd54-4311-b5cd-b1c435ff973d@gmx.de>
Date: Tue, 18 Nov 2025 15:41:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] platform/x86/uniwill: Handle more WMI events required
 for TUXEDO devices
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
 <20251117132530.32460-3-wse@tuxedocomputers.com>
 <fc1b75ce-113d-4de1-ac98-7616b17f915c@gmx.de>
 <29b24831-92d4-47c6-8daf-7d1879951d43@tuxedocomputers.com>
 <7cd7081f-b138-4548-a9fb-5c4d5165b036@gmx.de>
 <7276b961-8649-4bc0-87f7-a1f06cd4f3ad@tuxedocomputers.com>
 <5b554128-7466-4b34-9020-c0c39572f100@gmx.de>
 <3c075220-79f3-4dff-a760-6fe065147793@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <3c075220-79f3-4dff-a760-6fe065147793@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:b/ZA5idBAgEi78nxgCK9e/NbDZp4Ga+KCDy4YFt44wjXOhhEz9S
 +YV6luagbpiVJIcqrahP8M3TaNx4taIJdE8W8D2GyED1nta2Y/PFgQRgnEt63uxC7hhjS48
 VOTeXFdDAG2NHttAxZ+ZCLNn3p+WvX7r3VBY1yvXyifnXqGxmIwaRckQEIEnwOoWyl/dY9A
 7PWyYiAKZdk0Th3hhGKPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BW1qbgP6++g=;OVDFLfGFRfRAuRChM7DHslvqBJP
 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

Am 18.11.25 um 15:27 schrieb Werner Sembach:

>
> Am 18.11.25 um 14:48 schrieb Armin Wolf:
>> Am 18.11.25 um 14:29 schrieb Werner Sembach:
>>
>>>
>>> Am 18.11.25 um 14:12 schrieb Armin Wolf:
>>>> Am 18.11.25 um 13:45 schrieb Werner Sembach:
>>>>
>>>>>
>>>>> Am 18.11.25 um 12:08 schrieb Armin Wolf:
>>>>>> Am 17.11.25 um 14:23 schrieb Werner Sembach:
>>>>>>
>>>>>>> Handle some more WMI events that are triggered on TUXEDO devices.
>>>>>>>
>>>>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>>>>> ---
>>>>>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 19=20
>>>>>>> ++++++++++++++++++-
>>>>>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-wmi.h=C2=A0 |=C2=A0 2 =
++
>>>>>>> =C2=A0 2 files changed, 20 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>>>>>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>>>> index 29bb3709bfcc8..0cb86a701b2e1 100644
>>>>>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>>>> @@ -371,9 +371,11 @@ static const struct key_entry=20
>>>>>>> uniwill_keymap[] =3D {
>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported in manual mode w=
hen toggling the airplane=20
>>>>>>> mode status */
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 UNIWILL_OSD_RFKILL, { KEY_RFKILL }},
>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_RAD=
IOON, { KEY_UNKNOWN }},
>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_RAD=
IOOFF, { KEY_UNKNOWN }},
>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when user wants =
to cycle the platform=20
>>>>>>> profile */
>>>>>>> -=C2=A0=C2=A0=C2=A0 { KE_IGNORE, UNIWILL_OSD_PERFORMANCE_MODE_TOGG=
LE, {=20
>>>>>>> KEY_UNKNOWN }},
>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,=
 { KEY_F14 }},
>>>>>>
>>>>>> I am currently working a patch adding platform profile support,=20
>>>>>> so this event would
>>>>>> be handled inside the kernel on models with platform profile=20
>>>>>> support.
>>>>>
>>>>> For tuxedo devices we have profiles managed in userspace that do=20
>>>>> additional things. So we need a way to handle this in userspace.
>>>>>
>>>> Do these things have something to do with the uniwill EC? If so=20
>>>> then we should implement those inside the driver
>>>> itself. The control center can then poll the platform profile sysfs=
=20
>>>> file to get notified when platform_profile_cycle()
>>>> is executed to perform additional actions.
>>> Not exclusively, e.g. one thing is display brightness.
>>
>> And you cannot poll the sysfs interface?
> I can't follow you atm?

I meant to ask whether or not your application could poll the platform pro=
file sysfs interface for changes instead of
listing for the F14 key.

Thanks,
Armin Wolf

>>
>>>>
>>>>> The 2 things I can spontaneously think of would be a sysfs toggle=20
>>>>> or 2 different UNIWILL_FEATURE_* defines.
>>>>>
>>>> TPH i would love to have an ordinary keycode allocated for that if=20
>>>> the above does not work for you. There already
>>>> exists KEY_PERFORMANCE, so adding something like=20
>>>> KEY_PERFORMANCE_CYCLE should be possible.
>>>
>>> New keycodes won't work on X11, I don't know the reason, but X11=20
>>> only supports a max of 248 keycodes
>>>
>>> That's why for example touchpad toggle is bound to F21 e.g. here=20
>>> https://elixir.bootlin.com/linux/v6.17.8/source/drivers/platform/x86/l=
g-laptop.c#L106=20
>>> .
>>>
>> Oh no. In this case using F14 is fine.
>>
>>
>> Thanks,
>> Armin Wolf
>>
>>>>
>>>>>>
>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wa=
nts to adjust the brightness=20
>>>>>>> of the keyboard */
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 UNIWILL_OSD_KBDILLUMDOWN, {=20
>>>>>>> KEY_KBDILLUMDOWN }},
>>>>>>> @@ -382,11 +384,19 @@ static const struct key_entry=20
>>>>>>> uniwill_keymap[] =3D {
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to =
toggle the microphone=20
>>>>>>> mute status */
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 UNIWILL_OSD_MIC_MUTE, { KEY_MICMUTE }},
>>>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to togg=
le the mute status */
>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_MUT=
E, { KEY_MUTE }},
>>>>>>
>>>>>> Why is this event being ignored?
>>>>> Because the UNIWILL_OSD_MUTE event is sent in addition to the mute=
=20
>>>>> key event, so not ignoring it here would result in a double trigger.
>>>>
>>>> I understand.
>>>>
>>>>>>
>>>>>>> +
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user locks/unl=
ocks the Fn key */
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIW=
ILL_OSD_FN_LOCK, { KEY_FN_ESC }},
>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wa=
nts to toggle the brightness=20
>>>>>>> of the keyboard */
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 UNIWILL_OSD_KBDILLUMTOGGLE, {=20
>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
UNIWILL_OSD_KB_LED_LEVEL0, {=20
>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
UNIWILL_OSD_KB_LED_LEVEL1, {=20
>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
UNIWILL_OSD_KB_LED_LEVEL2, {=20
>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
UNIWILL_OSD_KB_LED_LEVEL3, {=20
>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
UNIWILL_OSD_KB_LED_LEVEL4, {=20
>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* FIXME: find out the exact=
 meaning of those events */
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE, UNIWILL_OSD_BAT_CHARGE=
_FULL_24_H, {=20
>>>>>>> KEY_UNKNOWN }},
>>>>>>> @@ -395,6 +405,9 @@ static const struct key_entry=20
>>>>>>> uniwill_keymap[] =3D {
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to =
toggle the benchmark=20
>>>>>>> mode status */
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE, UNIWILL_OSD_BENCHMARK_=
MODE_TOGGLE, {=20
>>>>>>> KEY_UNKNOWN }},
>>>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to togg=
le the webcam */
>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_WEB=
CAM_TOGGLE, { KEY_UNKNOWN }},
>>>>>>
>>>>>> Same as above.
>>>>>
>>>>> Same as above ;)
>>>>>
>>>>> At least iirc, would have to double check
>>>>>
>>>> Ok.
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>>>>>
>>>>>>> +
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_END }
>>>>>>> =C2=A0 };
>>>>>>> =C2=A0 @@ -1247,6 +1260,10 @@ static int uniwill_notifier_call(str=
uct=20
>>>>>>> notifier_block *nb, unsigned long action
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unloc=
k(&data->battery_lock);
>>>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY_O=
K;
>>>>>>> +=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_DC_ADAPTER_CHANGED:
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // noop for the time b=
eing
>>>>>>
>>>>>> Wrong comment style, please use /* */.
>>>>> ack
>>>>>>
>>>>>> Thanks,
>>>>>> Armin Wolf
>>>>>>
>>>>>>> +
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTI=
FY_OK;
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(=
&data->input_lock);
>>>>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h=20
>>>>>>> b/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>>>> index 2bf69f2d80381..48783b2e9ffb9 100644
>>>>>>> --- a/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>>>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>>>> @@ -113,6 +113,8 @@
>>>>>>> =C2=A0 =C2=A0 #define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE=C2=A0=C2=
=A0=C2=A0 0xC0
>>>>>>> =C2=A0 +#define UNIWILL_OSD_WEBCAM_TOGGLE=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0xCF
>>>>>>> +
>>>>>>> =C2=A0 #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED=C2=A0=C2=A0=C2=A0=
 0xF0
>>>>>>> =C2=A0 =C2=A0 struct device;
>>>>>
>
