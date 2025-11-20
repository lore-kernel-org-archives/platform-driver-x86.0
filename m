Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2236633F380;
	Thu, 20 Nov 2025 13:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646059; cv=none; b=SbMa9xiQerL0RZUhoby9/jXHtCp9UfloAcwf+WPh8J1D2kZ7DgotLqtiVFk9eY0kIIV5lmerMce5n5qzg7wZ12vHBRV9pXb/2wUABL/Iw+QD1OfyyDooiUF8k0c/3Etamylohse/+CxD/b0hLuZe/7ZBvauWt2EYD7Dk38n+lnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646059; c=relaxed/simple;
	bh=eavknlgNKfHrP4DZliXYcSB3sukFz2ofn03ReMQMgPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=raoXpNfZi83bsfjxcX0/9lU9FnbT14k6bF8/3RNHAACTxYTzg3Gyog+TQY0OTzheaZbyWHN3J4CBWCYRyY1pM/PIaUtv6860mvhTErHS+d2P4JHObCqYizUmZ9/OP3NbiL2KF4mL/pZIEUqkLMofRUFw0GpXPG76FRwvcDYlfq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=S8ghEXp+; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="S8ghEXp+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763646052; x=1764250852; i=w_armin@gmx.de;
	bh=eavknlgNKfHrP4DZliXYcSB3sukFz2ofn03ReMQMgPE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=S8ghEXp+rHoEu8Pptrq9hBxnGnD6HO/AZnF3Lj7vvJocdnJy+8SpcbDiuuULy8d5
	 L1lY2t+6zcLWeyiXJ5Njo0fM6934ASusc+0DaZFsACminLj5x4R8GDklCxsxp3wZR
	 veiSplGCgoLVp1k4gVLndX+jExH8RxBxT1IhWbu1o1Uz5b1n5S7itqmnEb2c2tjr3
	 TZomxUPf+uJVehbr2rrkn/6mIUM8MD2tSISE5U67p6iBOVS2MohTGcyA3f55nyNOt
	 p+fCZvqcmOJcHCjd1LXlP0lHokHM4wUTvoKEAdGnOxUJuzURC7qZqXsfZ8k3xDiv5
	 1pTOhzxtvsJ6uKOggw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.70.236] ([141.76.8.172]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXp9i-1verGx3Dci-00SOEY; Thu, 20
 Nov 2025 14:40:51 +0100
Message-ID: <aa69ac42-8578-4fbb-a35c-d0a556aa394d@gmx.de>
Date: Thu, 20 Nov 2025 14:40:49 +0100
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <59b75eb5-59f8-472f-ad98-5d333eebebe5@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3VmafSc5bxAG7NV9rrzQwE7Gsctx4o8QLFv80xVzF+j7wsV/ni0
 n/+2qZuFi7heI0Avp3OnOuzGOeOcec42aSVxuqqt3KYtksRAivhNJO/saI/3WgdATM/gDet
 IyZT3PE3q9iGQfxjgHaP+ESD4F2JikvH46VUXNXGnpNN02jgeGZz3s30+ZjO0jQFLTsnc3f
 Uxs6J7dpFgyw4YkgAN0yA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cTUG7N/IqSk=;06K/vwjwI2MjXDYXnM6FJMj94TX
 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

Am 20.11.25 um 11:42 schrieb Werner Sembach:

>
> Am 20.11.25 um 01:53 schrieb Armin Wolf:
>> Am 18.11.25 um 16:05 schrieb Werner Sembach:
>>
>>>
>>> Am 18.11.25 um 15:41 schrieb Armin Wolf:
>>>> Am 18.11.25 um 15:27 schrieb Werner Sembach:
>>>>
>>>>>
>>>>> Am 18.11.25 um 14:48 schrieb Armin Wolf:
>>>>>> Am 18.11.25 um 14:29 schrieb Werner Sembach:
>>>>>>
>>>>>>>
>>>>>>> Am 18.11.25 um 14:12 schrieb Armin Wolf:
>>>>>>>> Am 18.11.25 um 13:45 schrieb Werner Sembach:
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Am 18.11.25 um 12:08 schrieb Armin Wolf:
>>>>>>>>>> Am 17.11.25 um 14:23 schrieb Werner Sembach:
>>>>>>>>>>
>>>>>>>>>>> Handle some more WMI events that are triggered on TUXEDO=20
>>>>>>>>>>> devices.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>>>>>>>>> ---
>>>>>>>>>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 19=20
>>>>>>>>>>> ++++++++++++++++++-
>>>>>>>>>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-wmi.h | 2 ++
>>>>>>>>>>> =C2=A0 2 files changed, 20 insertions(+), 1 deletion(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>>>>>>>>>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>>>>>>>> index 29bb3709bfcc8..0cb86a701b2e1 100644
>>>>>>>>>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>>>>>>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>>>>>>>> @@ -371,9 +371,11 @@ static const struct key_entry=20
>>>>>>>>>>> uniwill_keymap[] =3D {
>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported in manual mo=
de when toggling the=20
>>>>>>>>>>> airplane mode status */
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 UNIWILL_OSD_RFKILL, { KEY_RFKILL }},
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD=
_RADIOON, { KEY_UNKNOWN }},
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD=
_RADIOOFF, { KEY_UNKNOWN }},
>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when user wa=
nts to cycle the platform=20
>>>>>>>>>>> profile */
>>>>>>>>>>> -=C2=A0=C2=A0=C2=A0 { KE_IGNORE, UNIWILL_OSD_PERFORMANCE_MODE_=
TOGGLE, {=20
>>>>>>>>>>> KEY_UNKNOWN }},
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_PERFORMANCE_MODE_TOG=
GLE, {=20
>>>>>>>>>>> KEY_F14 }},
>>>>>>>>>>
>>>>>>>>>> I am currently working a patch adding platform profile=20
>>>>>>>>>> support, so this event would
>>>>>>>>>> be handled inside the kernel on models with platform profile=20
>>>>>>>>>> support.
>>>>>>>>>
>>>>>>>>> For tuxedo devices we have profiles managed in userspace that=20
>>>>>>>>> do additional things. So we need a way to handle this in=20
>>>>>>>>> userspace.
>>>>>>>>>
>>>>>>>> Do these things have something to do with the uniwill EC? If so=
=20
>>>>>>>> then we should implement those inside the driver
>>>>>>>> itself. The control center can then poll the platform profile=20
>>>>>>>> sysfs file to get notified when platform_profile_cycle()
>>>>>>>> is executed to perform additional actions.
>>>>>>> Not exclusively, e.g. one thing is display brightness.
>>>>>>
>>>>>> And you cannot poll the sysfs interface?
>>>>> I can't follow you atm?
>>>>
>>>> I meant to ask whether or not your application could poll the=20
>>>> platform profile sysfs interface for changes instead of
>>>> listing for the F14 key.
>>> But the platform profiles are a fixed number? TCC currently allows=20
>>> an arbitrary amount of profiles being created.
>>
>> With "poll the platform profile sysfs interface" i meant that you=20
>> could use poll() (https://linux.die.net/man/2/poll)
>> or epoll() on the sysfs file containing the current platform profile.
> Sorry i think i still don't completely get what you mean with platform=
=20
> profile. I assume you have a poc on github? If not can you give me a=20
> short overview?

Example code, might not work:

from select import poll, POLLPRI

fd =3D open("|/sys/firmware/acpi/platform_profile", "r") p =3D poll()=20
p.register(fd.fileno(), POLLPRI) # Wait till platform profile changes=20
p.poll() print("Platform profile changed") This however comes with the=20
drawback that you cannot prevent the platform profile from cycling. If=20
you want to do that manually depending on the settings inside your=20
custom profiles, then maybe we can keep the F14 hack for now. I will=20
then add a module option when adding platform profile support to select=20
between platform_profile_cycle() and the F14 keycode. Does this sound OK?|

>>
>> Anyway, i attached the patch with the device descriptor=20
>> infrastructure. The callback called during probe cannot modify
>> the feature bitmap anymore, but i suggest that you simply set the=20
>> limit for cTGP to zero. The code responsible for
>> initializing cTGP support can then check if the cTGP limit is zero=20
>> and return early.
>
> I wonder if we should directly put that into a formal quirk list.=20
> Opinions?
>
> Best regards,
>
> Werner
>
The problem is that the quirk list will become RO before the driver can ac=
cess the EC, so we have to use uniwill_data
for storing this information.

Thanks,
Armin Wolf

>>
>> Thanks,
>> Armin Wolf
>>
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>>>>>
>>>>>>>>
>>>>>>>>> The 2 things I can spontaneously think of would be a sysfs=20
>>>>>>>>> toggle or 2 different UNIWILL_FEATURE_* defines.
>>>>>>>>>
>>>>>>>> TPH i would love to have an ordinary keycode allocated for that=
=20
>>>>>>>> if the above does not work for you. There already
>>>>>>>> exists KEY_PERFORMANCE, so adding something like=20
>>>>>>>> KEY_PERFORMANCE_CYCLE should be possible.
>>>>>>>
>>>>>>> New keycodes won't work on X11, I don't know the reason, but X11=
=20
>>>>>>> only supports a max of 248 keycodes
>>>>>>>
>>>>>>> That's why for example touchpad toggle is bound to F21 e.g. here=
=20
>>>>>>> https://elixir.bootlin.com/linux/v6.17.8/source/drivers/platform/x=
86/lg-laptop.c#L106=20
>>>>>>> .
>>>>>>>
>>>>>> Oh no. In this case using F14 is fine.
>>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Armin Wolf
>>>>>>
>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the use=
r wants to adjust the=20
>>>>>>>>>>> brightness of the keyboard */
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_KBDILLUMD=
OWN, { KEY_KBDILLUMDOWN=20
>>>>>>>>>>> }},
>>>>>>>>>>> @@ -382,11 +384,19 @@ static const struct key_entry=20
>>>>>>>>>>> uniwill_keymap[] =3D {
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wants=
 to toggle the=20
>>>>>>>>>>> microphone mute status */
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 UNIWILL_OSD_MIC_MUTE, { KEY_MICMUTE }},
>>>>>>>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to =
toggle the mute=20
>>>>>>>>>>> status */
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD=
_MUTE, { KEY_MUTE }},
>>>>>>>>>>
>>>>>>>>>> Why is this event being ignored?
>>>>>>>>> Because the UNIWILL_OSD_MUTE event is sent in addition to the=20
>>>>>>>>> mute key event, so not ignoring it here would result in a=20
>>>>>>>>> double trigger.
>>>>>>>>
>>>>>>>> I understand.
>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> +
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user locks=
/unlocks the Fn key */
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 =
UNIWILL_OSD_FN_LOCK, { KEY_FN_ESC }},
>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the use=
r wants to toggle the=20
>>>>>>>>>>> brightness of the keyboard */
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_KBDILLUMT=
OGGLE, {=20
>>>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_KB_LED_LEVEL0, {=20
>>>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_KB_LED_LEVEL1, {=20
>>>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_KB_LED_LEVEL2, {=20
>>>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_KB_LED_LEVEL3, {=20
>>>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_KB_LED_LEVEL4, {=20
>>>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* FIXME: find out the e=
xact meaning of those events */
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE, UNIWILL_OSD_BAT_CH=
ARGE_FULL_24_H, {=20
>>>>>>>>>>> KEY_UNKNOWN }},
>>>>>>>>>>> @@ -395,6 +405,9 @@ static const struct key_entry=20
>>>>>>>>>>> uniwill_keymap[] =3D {
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wants=
 to toggle the=20
>>>>>>>>>>> benchmark mode status */
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE, UNIWILL_OSD_BENCHM=
ARK_MODE_TOGGLE, {=20
>>>>>>>>>>> KEY_UNKNOWN }},
>>>>>>>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to =
toggle the webcam */
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE, UNIWILL_OSD_WEBCAM_TOGGLE, { =
KEY_UNKNOWN }},
>>>>>>>>>>
>>>>>>>>>> Same as above.
>>>>>>>>>
>>>>>>>>> Same as above ;)
>>>>>>>>>
>>>>>>>>> At least iirc, would have to double check
>>>>>>>>>
>>>>>>>> Ok.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Armin Wolf
>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> +
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_END }
>>>>>>>>>>> =C2=A0 };
>>>>>>>>>>> =C2=A0 @@ -1247,6 +1260,10 @@ static int=20
>>>>>>>>>>> uniwill_notifier_call(struct notifier_block *nb, unsigned=20
>>>>>>>>>>> long action
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>> mutex_unlock(&data->battery_lock);
>>>>>>>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTI=
FY_OK;
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_DC_ADAPTER_CHANGED:
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // noop for the ti=
me being
>>>>>>>>>>
>>>>>>>>>> Wrong comment style, please use /* */.
>>>>>>>>> ack
>>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>> Armin Wolf
>>>>>>>>>>
>>>>>>>>>>> +
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return =
NOTIFY_OK;
>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>>>>>>>>>> mutex_lock(&data->input_lock);
>>>>>>>>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h=20
>>>>>>>>>>> b/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>>>>>>>> index 2bf69f2d80381..48783b2e9ffb9 100644
>>>>>>>>>>> --- a/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>>>>>>>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>>>>>>>> @@ -113,6 +113,8 @@
>>>>>>>>>>> =C2=A0 =C2=A0 #define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE 0xC0
>>>>>>>>>>> =C2=A0 +#define UNIWILL_OSD_WEBCAM_TOGGLE 0xCF
>>>>>>>>>>> +
>>>>>>>>>>> =C2=A0 #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED 0xF0
>>>>>>>>>>> =C2=A0 =C2=A0 struct device;
>>>>>>>>>
>>>>>
>>>
>
