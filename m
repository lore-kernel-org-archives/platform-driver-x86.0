Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350C81B532F;
	Sat, 22 Nov 2025 23:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763855660; cv=none; b=lvU824wb72tCBUzse3yUF6caU3O9Syqqcb01BR+09nOSaGXN2jRwGnU3IT1vAZwMNWJefZtRRhT6hGHvw/syT9llYz941/7PxeZTRWZ9ZL+urRSoG+wFPi8lUW1i7QOcsxAdTOGMt+GpbvtbJDmgy/bWfhAO9cHKI5ftgiOtho4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763855660; c=relaxed/simple;
	bh=DPeptKW4cRU8S/dKbMXuosHpIGxO2+kMWCw/TCeAS9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HdOfX4BRezNGsqCrWrjC7d1Tar2D8DfFnpWt/N7n/BCU7Osm3IMSrRKNdNbsdnSll/hZarmTe9Oim00TnKihmTJoYrbuUkP1T33W37rsP6S/0prbzN4AkJXN891r96pHT8k45PiJDGKRyGE6g7ji9G9qfRyg2Ubx7FScmTqgqts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pkOmQPYl; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pkOmQPYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763855655; x=1764460455; i=w_armin@gmx.de;
	bh=DPeptKW4cRU8S/dKbMXuosHpIGxO2+kMWCw/TCeAS9Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pkOmQPYl7k76vadOMFLvsyjGH5RSoJTeYxgMBcvKZIHw7BfmTB98xYE7wv2fAvn4
	 09E5iV8ihcJk0v5ppU3Ra62esJGgYFWG401EUPb619xX3zlUYlJuF0H8WrpYtRYJe
	 gIX65IQcyMo7lYzfWhtMer+fJwQbQAlYarOPpVNncd5p1CWLdr/0qcN/VaXdNH7/x
	 s1lymX9ddGoYOtBWslWmJ9nSvIYUOd3oYj10yuHvREodzAfm2X/SkD8XlDKQ92U2o
	 4DeTnqJFAarRbtag6K7SvneNG4FcfIL7AScf6jItNqhCM0QpArxs2q1ZXqFGYA0HA
	 lWRcfRHHRagjGmxKFg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIMbO-1vJhlj09XI-009lhs; Sun, 23
 Nov 2025 00:54:15 +0100
Message-ID: <bed687c1-a07b-412d-9547-d2369f89ccd8@gmx.de>
Date: Sun, 23 Nov 2025 00:54:13 +0100
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
 <2d5d88fe-cd54-4311-b5cd-b1c435ff973d@gmx.de>
 <d4c7b31b-1335-47d5-992a-beace78614e5@tuxedocomputers.com>
 <f0161676-fde7-4c6f-8774-25d176265716@gmx.de>
 <59b75eb5-59f8-472f-ad98-5d333eebebe5@tuxedocomputers.com>
 <aa69ac42-8578-4fbb-a35c-d0a556aa394d@gmx.de>
 <7dcf2e21-209d-42ad-8541-52eac5c77049@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <7dcf2e21-209d-42ad-8541-52eac5c77049@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hfwQXaIuaeiRhOSUbxH9fEf/Va2c/uzB4chbcOaqLaNpelleFK3
 FE1HP271A8DX4IuZSxerJGEkolW7zXuYbhPKIiyQlqbLEkHUNcr8gIrmNpQCBW6Bn5H4Jes
 mo7OAYqtNfWtQYJvQF6p0TaUBQVpGECiXpFyzQHHWC4Eub9Cm7ztrWRWX57W8WAOijKMl8Y
 GPike2y4zsSwR0tHNjtNw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kgW1HJtTvUw=;tUwIGnEPYVWHe4UXGSD9Nz9SSN6
 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
 f82rIeqR2d1r/fH3d5CeVi9NPdOgC

Am 20.11.25 um 23:06 schrieb Werner Sembach:

>
> Am 20.11.25 um 14:40 schrieb Armin Wolf:
>> Am 20.11.25 um 11:42 schrieb Werner Sembach:
>>
>>>
>>> Am 20.11.25 um 01:53 schrieb Armin Wolf:
>>>> Am 18.11.25 um 16:05 schrieb Werner Sembach:
>>>>
>>>>>
>>>>> Am 18.11.25 um 15:41 schrieb Armin Wolf:
>>>>>> Am 18.11.25 um 15:27 schrieb Werner Sembach:
>>>>>>
>>>>>>>
>>>>>>> Am 18.11.25 um 14:48 schrieb Armin Wolf:
>>>>>>>> Am 18.11.25 um 14:29 schrieb Werner Sembach:
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Am 18.11.25 um 14:12 schrieb Armin Wolf:
>>>>>>>>>> Am 18.11.25 um 13:45 schrieb Werner Sembach:
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Am 18.11.25 um 12:08 schrieb Armin Wolf:
>>>>>>>>>>>> Am 17.11.25 um 14:23 schrieb Werner Sembach:
>>>>>>>>>>>>
>>>>>>>>>>>>> Handle some more WMI events that are triggered on TUXEDO=20
>>>>>>>>>>>>> devices.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>> drivers/platform/x86/uniwill/uniwill-acpi.c | 19=20
>>>>>>>>>>>>> ++++++++++++++++++-
>>>>>>>>>>>>> drivers/platform/x86/uniwill/uniwill-wmi.h | 2 ++
>>>>>>>>>>>>> =C2=A0 2 files changed, 20 insertions(+), 1 deletion(-)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>>>>>>>>>>>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>>>>>>>>>> index 29bb3709bfcc8..0cb86a701b2e1 100644
>>>>>>>>>>>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>>>>>>>>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>>>>>>>>>> @@ -371,9 +371,11 @@ static const struct key_entry=20
>>>>>>>>>>>>> uniwill_keymap[] =3D {
>>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported in manual =
mode when toggling the=20
>>>>>>>>>>>>> airplane mode status */
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_RFKILL, { KEY_RFKILL }},
>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_O=
SD_RADIOON, { KEY_UNKNOWN }},
>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_O=
SD_RADIOOFF, { KEY_UNKNOWN }},
>>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when user =
wants to cycle the platform=20
>>>>>>>>>>>>> profile */
>>>>>>>>>>>>> -=C2=A0=C2=A0=C2=A0 { KE_IGNORE, UNIWILL_OSD_PERFORMANCE_MOD=
E_TOGGLE, {=20
>>>>>>>>>>>>> KEY_UNKNOWN }},
>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_PERFORMANCE_MODE_T=
OGGLE, {=20
>>>>>>>>>>>>> KEY_F14 }},
>>>>>>>>>>>>
>>>>>>>>>>>> I am currently working a patch adding platform profile=20
>>>>>>>>>>>> support, so this event would
>>>>>>>>>>>> be handled inside the kernel on models with platform=20
>>>>>>>>>>>> profile support.
>>>>>>>>>>>
>>>>>>>>>>> For tuxedo devices we have profiles managed in userspace=20
>>>>>>>>>>> that do additional things. So we need a way to handle this=20
>>>>>>>>>>> in userspace.
>>>>>>>>>>>
>>>>>>>>>> Do these things have something to do with the uniwill EC? If=20
>>>>>>>>>> so then we should implement those inside the driver
>>>>>>>>>> itself. The control center can then poll the platform profile=
=20
>>>>>>>>>> sysfs file to get notified when platform_profile_cycle()
>>>>>>>>>> is executed to perform additional actions.
>>>>>>>>> Not exclusively, e.g. one thing is display brightness.
>>>>>>>>
>>>>>>>> And you cannot poll the sysfs interface?
>>>>>>> I can't follow you atm?
>>>>>>
>>>>>> I meant to ask whether or not your application could poll the=20
>>>>>> platform profile sysfs interface for changes instead of
>>>>>> listing for the F14 key.
>>>>> But the platform profiles are a fixed number? TCC currently allows=
=20
>>>>> an arbitrary amount of profiles being created.
>>>>
>>>> With "poll the platform profile sysfs interface" i meant that you=20
>>>> could use poll() (https://linux.die.net/man/2/poll)
>>>> or epoll() on the sysfs file containing the current platform profile.
>>> Sorry i think i still don't completely get what you mean with=20
>>> platform profile. I assume you have a poc on github? If not can you=20
>>> give me a short overview?
>>
>> Example code, might not work:
>>
>> from select import poll, POLLPRI
>>
>> fd =3D open("|/sys/firmware/acpi/platform_profile", "r") p =3D poll()=
=20
>> p.register(fd.fileno(), POLLPRI) # Wait till platform profile changes=
=20
>> p.poll() print("Platform profile changed") This however comes with=20
>> the drawback that you cannot prevent the platform profile from=20
>> cycling. If you want to do that manually depending on the settings=20
>> inside your custom profiles, then maybe we can keep the F14 hack for=20
>> now. I will then add a module option when adding platform profile=20
>> support to select between platform_profile_cycle() and the F14=20
>> keycode. Does this sound OK?|
>
> a sorry i was imprecise, i wanted to know the kernelspace implementation=
.
>
Take a look at https://github.com/Wer-Wolf/uniwill-laptop/tree/platform_pr=
ofile for the prototype.

The function platform_profile_cycle() is defined inside drivers/acpi/platf=
orm_profile.

> But let me sum up what i think you mean:
>
> Platform profiles are in driver predefined profiles like: Power Save,=20
> Balanced, Performance, and Custom.
>
> When you press the button you want to cycle through the profiles=20
> (except custom I guess?).
>
> Only in Custom things like cTGP can be directly controlled by=20
> userspace via sysfs (otherwise the sysfs value is ignored?)
>
Correct.

> Maybe an elegant solution would be that upon boot for example=20
> "Balanced" is selected and when being in one of the predefined=20
> profiles the button cycles them. But once=C2=A0Custom get selected via=
=20
> sysfs the button starts sending a button press as the driver now=20
> expects everything to be handled by userspace. Bonus points if=20
> userspace can read out what the predefined profiles actually set to,=20
> for example, use that as initialization for custom profiles.
>
Agreed, i will implement this behavior once my testers give me feedback.

Thanks,
Armin Wolf

>>
>>>>
>>>> Anyway, i attached the patch with the device descriptor=20
>>>> infrastructure. The callback called during probe cannot modify
>>>> the feature bitmap anymore, but i suggest that you simply set the=20
>>>> limit for cTGP to zero. The code responsible for
>>>> initializing cTGP support can then check if the cTGP limit is zero=20
>>>> and return early.
>>>
>>> I wonder if we should directly put that into a formal quirk list.=20
>>> Opinions?
>>>
>>> Best regards,
>>>
>>> Werner
>>>
>> The problem is that the quirk list will become RO before the driver=20
>> can access the EC, so we have to use uniwill_data
>> for storing this information.
>>
>> Thanks,
>> Armin Wolf
>>
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Armin Wolf
>>>>>>
>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> The 2 things I can spontaneously think of would be a sysfs=20
>>>>>>>>>>> toggle or 2 different UNIWILL_FEATURE_* defines.
>>>>>>>>>>>
>>>>>>>>>> TPH i would love to have an ordinary keycode allocated for=20
>>>>>>>>>> that if the above does not work for you. There already
>>>>>>>>>> exists KEY_PERFORMANCE, so adding something like=20
>>>>>>>>>> KEY_PERFORMANCE_CYCLE should be possible.
>>>>>>>>>
>>>>>>>>> New keycodes won't work on X11, I don't know the reason, but=20
>>>>>>>>> X11 only supports a max of 248 keycodes
>>>>>>>>>
>>>>>>>>> That's why for example touchpad toggle is bound to F21 e.g.=20
>>>>>>>>> here=20
>>>>>>>>> https://elixir.bootlin.com/linux/v6.17.8/source/drivers/platform=
/x86/lg-laptop.c#L106=20
>>>>>>>>> .
>>>>>>>>>
>>>>>>>> Oh no. In this case using F14 is fine.
>>>>>>>>
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Armin Wolf
>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the u=
ser wants to adjust the=20
>>>>>>>>>>>>> brightness of the keyboard */
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_KBDILLU=
MDOWN, {=20
>>>>>>>>>>>>> KEY_KBDILLUMDOWN }},
>>>>>>>>>>>>> @@ -382,11 +384,19 @@ static const struct key_entry=20
>>>>>>>>>>>>> uniwill_keymap[] =3D {
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wan=
ts to toggle the=20
>>>>>>>>>>>>> microphone mute status */
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_MIC_MUT=
E, { KEY_MICMUTE }},
>>>>>>>>>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants t=
o toggle the mute=20
>>>>>>>>>>>>> status */
>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_O=
SD_MUTE, { KEY_MUTE }},
>>>>>>>>>>>>
>>>>>>>>>>>> Why is this event being ignored?
>>>>>>>>>>> Because the UNIWILL_OSD_MUTE event is sent in addition to=20
>>>>>>>>>>> the mute key event, so not ignoring it here would result in=20
>>>>>>>>>>> a double trigger.
>>>>>>>>>>
>>>>>>>>>> I understand.
>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>> +
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user loc=
ks/unlocks the Fn key */
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=
=A0 UNIWILL_OSD_FN_LOCK, { KEY_FN_ESC }},
>>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the u=
ser wants to toggle the=20
>>>>>>>>>>>>> brightness of the keyboard */
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_KBDILLU=
MTOGGLE, {=20
>>>>>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_KB_LED_LEVEL0, {=
=20
>>>>>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_KB_LED_LEVEL1, {=
=20
>>>>>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_KB_LED_LEVEL2, {=
=20
>>>>>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_KB_LED_LEVEL3, {=
=20
>>>>>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_KB_LED_LEVEL4, {=
=20
>>>>>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* FIXME: find out the=
 exact meaning of those=20
>>>>>>>>>>>>> events */
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE, UNIWILL_OSD_BAT_=
CHARGE_FULL_24_H, {=20
>>>>>>>>>>>>> KEY_UNKNOWN }},
>>>>>>>>>>>>> @@ -395,6 +405,9 @@ static const struct key_entry=20
>>>>>>>>>>>>> uniwill_keymap[] =3D {
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wan=
ts to toggle the=20
>>>>>>>>>>>>> benchmark mode status */
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE, UNIWILL_OSD_BENC=
HMARK_MODE_TOGGLE, {=20
>>>>>>>>>>>>> KEY_UNKNOWN }},
>>>>>>>>>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants t=
o toggle the=20
>>>>>>>>>>>>> webcam */
>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE, UNIWILL_OSD_WEBCAM_TOGGLE, =
{ KEY_UNKNOWN=20
>>>>>>>>>>>>> }},
>>>>>>>>>>>>
>>>>>>>>>>>> Same as above.
>>>>>>>>>>>
>>>>>>>>>>> Same as above ;)
>>>>>>>>>>>
>>>>>>>>>>> At least iirc, would have to double check
>>>>>>>>>>>
>>>>>>>>>> Ok.
>>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>> Armin Wolf
>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>> +
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_END }
>>>>>>>>>>>>> =C2=A0 };
>>>>>>>>>>>>> =C2=A0 @@ -1247,6 +1260,10 @@ static int=20
>>>>>>>>>>>>> uniwill_notifier_call(struct notifier_block *nb, unsigned=20
>>>>>>>>>>>>> long action
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>>>> mutex_unlock(&data->battery_lock);
>>>>>>>>>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NO=
TIFY_OK;
>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_DC_ADAPTER_CHANGED:
>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // noop for the =
time being
>>>>>>>>>>>>
>>>>>>>>>>>> Wrong comment style, please use /* */.
>>>>>>>>>>> ack
>>>>>>>>>>>>
>>>>>>>>>>>> Thanks,
>>>>>>>>>>>> Armin Wolf
>>>>>>>>>>>>
>>>>>>>>>>>>> +
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n NOTIFY_OK;
>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>>>>>>>>>>>> mutex_lock(&data->input_lock);
>>>>>>>>>>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h=20
>>>>>>>>>>>>> b/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>>>>>>>>>> index 2bf69f2d80381..48783b2e9ffb9 100644
>>>>>>>>>>>>> --- a/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>>>>>>>>>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>>>>>>>>>> @@ -113,6 +113,8 @@
>>>>>>>>>>>>> =C2=A0 =C2=A0 #define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE 0xC0
>>>>>>>>>>>>> =C2=A0 +#define UNIWILL_OSD_WEBCAM_TOGGLE 0xCF
>>>>>>>>>>>>> +
>>>>>>>>>>>>> =C2=A0 #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED 0xF0
>>>>>>>>>>>>> =C2=A0 =C2=A0 struct device;
>>>>>>>>>>>
>>>>>>>
>>>>>
>>>
>
