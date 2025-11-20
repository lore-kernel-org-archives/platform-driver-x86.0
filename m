Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3707217704;
	Thu, 20 Nov 2025 00:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763600023; cv=none; b=uHa2J9633eh15TKlifZR2+vOTDUrWjBcnZ+nwHeeSG/F9VqBqrCiSt35x/1jb6de+gwR0sy5w5wKmDoNUQ8/hqHD0QlY84V9Cxy+WJpr4ORs/Px5hUo2JKLbY7CCYogHBBACKfcffEt8qM5HitOm1c2PaSioyn+X8ZGveIfi/M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763600023; c=relaxed/simple;
	bh=HVufDhk0Tp5LqlbtWsNsoV+a2LcTzTaMkRhI7SsdpRY=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=gayZsT48232Qrt3aKyWmz6JaI8k1Emdlp/ukLt2546T/L5WvIxltGYwUX5k06IoOYNCe0uDBWgoatIVM1DiStnfJgwpyMa1oDoYs3deYqAu8QTmtM7vooxMYLLEvsjkbjnNMG9tZcyPsQo5dx1VcT1wiBnITOO5WXqjeXFqeDSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=EbEPzOlt; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="EbEPzOlt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763600006; x=1764204806; i=w_armin@gmx.de;
	bh=HVufDhk0Tp5LqlbtWsNsoV+a2LcTzTaMkRhI7SsdpRY=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:From:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EbEPzOlt1MuGEAv/kHl8JGYiqmrbZ/9OvKSPgNFlSK81oY2PP3KCKzEzn13OUU32
	 WEt0RFfYa9CiKViomdN3lb7JfKseIgZ+hUsYGVK29AGkNnnbR5JOsaVLvWb65iXM3
	 4w1L4ZSO8lsnKfJYOdFx7jMZx73n5ZCUtXrxRZIlMDyEzlwkDUcnevZYpmOTIIK3v
	 nD548G3/B+tRjVQGMPvXuobJfKa2dnBE4AbRUQRxMbY3Gjv1uBv8j24ZlO6japxAs
	 BToMgRrYOvBaPdst06fOnk6bQKRz4EOPvs3Ow+ONytk0DyYeg1ehGPuMCeBYCznAD
	 VinX34G9hHf5HtvdiA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8hV5-1vHmKN0fUf-00GC4T; Thu, 20
 Nov 2025 01:53:26 +0100
Content-Type: multipart/mixed; boundary="------------JpqZcm9b0Rtpyc7YhD122KoG"
Message-ID: <f0161676-fde7-4c6f-8774-25d176265716@gmx.de>
Date: Thu, 20 Nov 2025 01:53:24 +0100
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <d4c7b31b-1335-47d5-992a-beace78614e5@tuxedocomputers.com>
X-Provags-ID: V03:K1:1oPh98XBgB0HRhE/oBETuhmTWGUF2f70Z3o46WKJIGDKShMns9C
 /+nfR2Pbe695xXUYWCorTbfLpec/qgJrek9gn0M0Jki73fEmy4O4mnD+kFBEV0JUFJWCwq6
 errNExbDkgk372C4FhYMNPNxIN0tH/ULEvdlYkeA56LblIIG9yUk7Vh1kxA3ZirPw6hGXIX
 BK9qr7CqDMXCtamN2fd3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uhcEJQIE0ik=;UXaEtOXjbt8Voi52SISKlBZP3yA
 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

This is a multi-part message in MIME format.
--------------JpqZcm9b0Rtpyc7YhD122KoG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 18.11.25 um 16:05 schrieb Werner Sembach:

>
> Am 18.11.25 um 15:41 schrieb Armin Wolf:
>> Am 18.11.25 um 15:27 schrieb Werner Sembach:
>>
>>>
>>> Am 18.11.25 um 14:48 schrieb Armin Wolf:
>>>> Am 18.11.25 um 14:29 schrieb Werner Sembach:
>>>>
>>>>>
>>>>> Am 18.11.25 um 14:12 schrieb Armin Wolf:
>>>>>> Am 18.11.25 um 13:45 schrieb Werner Sembach:
>>>>>>
>>>>>>>
>>>>>>> Am 18.11.25 um 12:08 schrieb Armin Wolf:
>>>>>>>> Am 17.11.25 um 14:23 schrieb Werner Sembach:
>>>>>>>>
>>>>>>>>> Handle some more WMI events that are triggered on TUXEDO devices=
.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>>>>>>> ---
>>>>>>>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 19=20
>>>>>>>>> ++++++++++++++++++-
>>>>>>>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-wmi.h=C2=A0 |=C2=A0 =
2 ++
>>>>>>>>> =C2=A0 2 files changed, 20 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>>>>>>>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>>>>>> index 29bb3709bfcc8..0cb86a701b2e1 100644
>>>>>>>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>>>>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>>>>>> @@ -371,9 +371,11 @@ static const struct key_entry=20
>>>>>>>>> uniwill_keymap[] =3D {
>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported in manual mode=
 when toggling the airplane=20
>>>>>>>>> mode status */
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 UNIWILL_OSD_RFKILL, { KEY_RFKILL }},
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_R=
ADIOON, { KEY_UNKNOWN }},
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_R=
ADIOOFF, { KEY_UNKNOWN }},
>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when user want=
s to cycle the platform=20
>>>>>>>>> profile */
>>>>>>>>> -=C2=A0=C2=A0=C2=A0 { KE_IGNORE, UNIWILL_OSD_PERFORMANCE_MODE_TO=
GGLE, {=20
>>>>>>>>> KEY_UNKNOWN }},
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY, UNIWILL_OSD_PERFORMANCE_MODE_TOGGL=
E, { KEY_F14 }},
>>>>>>>>
>>>>>>>> I am currently working a patch adding platform profile support,=
=20
>>>>>>>> so this event would
>>>>>>>> be handled inside the kernel on models with platform profile=20
>>>>>>>> support.
>>>>>>>
>>>>>>> For tuxedo devices we have profiles managed in userspace that do=
=20
>>>>>>> additional things. So we need a way to handle this in userspace.
>>>>>>>
>>>>>> Do these things have something to do with the uniwill EC? If so=20
>>>>>> then we should implement those inside the driver
>>>>>> itself. The control center can then poll the platform profile=20
>>>>>> sysfs file to get notified when platform_profile_cycle()
>>>>>> is executed to perform additional actions.
>>>>> Not exclusively, e.g. one thing is display brightness.
>>>>
>>>> And you cannot poll the sysfs interface?
>>> I can't follow you atm?
>>
>> I meant to ask whether or not your application could poll the=20
>> platform profile sysfs interface for changes instead of
>> listing for the F14 key.
> But the platform profiles are a fixed number? TCC currently allows an=20
> arbitrary amount of profiles being created.

With "poll the platform profile sysfs interface" i meant that you could us=
e poll() (https://linux.die.net/man/2/poll)
or epoll() on the sysfs file containing the current platform profile.

Anyway, i attached the patch with the device descriptor infrastructure. Th=
e callback called during probe cannot modify
the feature bitmap anymore, but i suggest that you simply set the limit fo=
r cTGP to zero. The code responsible for
initializing cTGP support can then check if the cTGP limit is zero and ret=
urn early.

Thanks,
Armin Wolf

>>
>> Thanks,
>> Armin Wolf
>>
>>>>
>>>>>>
>>>>>>> The 2 things I can spontaneously think of would be a sysfs=20
>>>>>>> toggle or 2 different UNIWILL_FEATURE_* defines.
>>>>>>>
>>>>>> TPH i would love to have an ordinary keycode allocated for that=20
>>>>>> if the above does not work for you. There already
>>>>>> exists KEY_PERFORMANCE, so adding something like=20
>>>>>> KEY_PERFORMANCE_CYCLE should be possible.
>>>>>
>>>>> New keycodes won't work on X11, I don't know the reason, but X11=20
>>>>> only supports a max of 248 keycodes
>>>>>
>>>>> That's why for example touchpad toggle is bound to F21 e.g. here=20
>>>>> https://elixir.bootlin.com/linux/v6.17.8/source/drivers/platform/x86=
/lg-laptop.c#L106=20
>>>>> .
>>>>>
>>>> Oh no. In this case using F14 is fine.
>>>>
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>>>>>
>>>>>>>>
>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user =
wants to adjust the=20
>>>>>>>>> brightness of the keyboard */
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 UNIWILL_OSD_KBDILLUMDOWN, {=20
>>>>>>>>> KEY_KBDILLUMDOWN }},
>>>>>>>>> @@ -382,11 +384,19 @@ static const struct key_entry=20
>>>>>>>>> uniwill_keymap[] =3D {
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wants t=
o toggle the microphone=20
>>>>>>>>> mute status */
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 UNIWILL_OSD_MIC_MUTE, { KEY_MICMUTE }},
>>>>>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to to=
ggle the mute=20
>>>>>>>>> status */
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_M=
UTE, { KEY_MUTE }},
>>>>>>>>
>>>>>>>> Why is this event being ignored?
>>>>>>> Because the UNIWILL_OSD_MUTE event is sent in addition to the=20
>>>>>>> mute key event, so not ignoring it here would result in a double=
=20
>>>>>>> trigger.
>>>>>>
>>>>>> I understand.
>>>>>>
>>>>>>>>
>>>>>>>>> +
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user locks/u=
nlocks the Fn key */
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UN=
IWILL_OSD_FN_LOCK, { KEY_FN_ESC }},
>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user =
wants to toggle the=20
>>>>>>>>> brightness of the keyboard */
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 UNIWILL_OSD_KBDILLUMTOGGLE, {=20
>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 UNIWILL_OSD_KB_LED_LEVEL0, {=20
>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 UNIWILL_OSD_KB_LED_LEVEL1, {=20
>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 UNIWILL_OSD_KB_LED_LEVEL2, {=20
>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 UNIWILL_OSD_KB_LED_LEVEL3, {=20
>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 UNIWILL_OSD_KB_LED_LEVEL4, {=20
>>>>>>>>> KEY_KBDILLUMTOGGLE }},
>>>>>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* FIXME: find out the exa=
ct meaning of those events */
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE, UNIWILL_OSD_BAT_CHAR=
GE_FULL_24_H, {=20
>>>>>>>>> KEY_UNKNOWN }},
>>>>>>>>> @@ -395,6 +405,9 @@ static const struct key_entry=20
>>>>>>>>> uniwill_keymap[] =3D {
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wants t=
o toggle the benchmark=20
>>>>>>>>> mode status */
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE, UNIWILL_OSD_BENCHMAR=
K_MODE_TOGGLE, {=20
>>>>>>>>> KEY_UNKNOWN }},
>>>>>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to to=
ggle the webcam */
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_W=
EBCAM_TOGGLE, { KEY_UNKNOWN }},
>>>>>>>>
>>>>>>>> Same as above.
>>>>>>>
>>>>>>> Same as above ;)
>>>>>>>
>>>>>>> At least iirc, would have to double check
>>>>>>>
>>>>>> Ok.
>>>>>>
>>>>>> Thanks,
>>>>>> Armin Wolf
>>>>>>
>>>>>>>>
>>>>>>>>> +
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_END }
>>>>>>>>> =C2=A0 };
>>>>>>>>> =C2=A0 @@ -1247,6 +1260,10 @@ static int=20
>>>>>>>>> uniwill_notifier_call(struct notifier_block *nb, unsigned long=
=20
>>>>>>>>> action
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>> mutex_unlock(&data->battery_lock);
>>>>>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY=
_OK;
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_DC_ADAPTER_CHANGED:
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // noop for the time=
 being
>>>>>>>>
>>>>>>>> Wrong comment style, please use /* */.
>>>>>>> ack
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Armin Wolf
>>>>>>>>
>>>>>>>>> +
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NO=
TIFY_OK;
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_loc=
k(&data->input_lock);
>>>>>>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h=20
>>>>>>>>> b/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>>>>>> index 2bf69f2d80381..48783b2e9ffb9 100644
>>>>>>>>> --- a/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>>>>>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>>>>>> @@ -113,6 +113,8 @@
>>>>>>>>> =C2=A0 =C2=A0 #define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE 0xC0
>>>>>>>>> =C2=A0 +#define UNIWILL_OSD_WEBCAM_TOGGLE=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0xCF
>>>>>>>>> +
>>>>>>>>> =C2=A0 #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED 0xF0
>>>>>>>>> =C2=A0 =C2=A0 struct device;
>>>>>>>
>>>
>

--------------JpqZcm9b0Rtpyc7YhD122KoG
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-uniwill-laptop-Introduce-device-descrip.patch"
Content-Disposition: attachment;
 filename*0="0001-platform-x86-uniwill-laptop-Introduce-device-descrip.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA5YzYzODVkMmYyZWI0ZDAzZmFhOTIyYzM5YWIxZGViMDEwNzJlNTNhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBcm1pbiBXb2xmIDxXX0FybWluQGdteC5kZT4KRGF0
ZTogTW9uLCAxNyBOb3YgMjAyNSAwNjo0MjoxNCArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIHBs
YXRmb3JtL3g4NjogdW5pd2lsbC1sYXB0b3A6IEludHJvZHVjZSBkZXZpY2UgZGVzY3JpcHRv
cgogc3lzdGVtCgpGdXR1cmUgYWRkaXRpb25zIHRvIHRoZSBkcml2ZXIgd2lsbCBkZXBlbmQg
b24gZGV2aWNlLXNwZWNpZmljCmluaXRpYWxpemF0aW9uIHN0ZXBzLiBFeHRlbmQgdGhlIERN
SS1iYXNlZCBmZWF0dXJlIGRldGVjdGlvbiBzeXN0ZW0KdG8gaW5jbHVkZSBkZXZpY2UgZGVz
Y3JpcHRvcnMuIEVhY2ggZGVzY3JpcHRvciBjb250YWlucyBhIGJpdG1hcCBvZgpzdXBwb3J0
ZWQgZmVhdHVyZXMgYW5kIGEgc2V0IG9mIGNhbGxiYWNrIGZvciBwZXJmb3JtaW5nCmRldmlj
ZS1zcGVjaWZpYyBpbml0aWFsaXphdGlvbi4KClNpZ25lZC1vZmYtYnk6IEFybWluIFdvbGYg
PFdfQXJtaW5AZ214LmRlPgotLS0KIGRyaXZlcnMvcGxhdGZvcm0veDg2L3VuaXdpbGwvdW5p
d2lsbC1hY3BpLmMgfCA5OCArKysrKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA3MiBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3BsYXRmb3JtL3g4Ni91bml3aWxsL3VuaXdpbGwtYWNwaS5jIGIvZHJpdmVycy9wbGF0
Zm9ybS94ODYvdW5pd2lsbC91bml3aWxsLWFjcGkuYwppbmRleCAwMTQ5NjBkMTYyMTEuLjhj
NWY4YzJhMWM1ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvdW5pd2lsbC91
bml3aWxsLWFjcGkuYworKysgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni91bml3aWxsL3VuaXdp
bGwtYWNwaS5jCkBAIC0zNDEsMTIgKzM0MSwyMSBAQCBzdHJ1Y3QgdW5pd2lsbF9iYXR0ZXJ5
X2VudHJ5IHsKIAlzdHJ1Y3QgcG93ZXJfc3VwcGx5ICpiYXR0ZXJ5OwogfTsKIAorc3RydWN0
IHVuaXdpbGxfZGV2aWNlX2Rlc2NyaXB0b3IgeworCXVuc2lnbmVkIGludCBmZWF0dXJlczsK
KwkvKiBFeGVjdXRlZCBkdXJpbmcgZHJpdmVyIHByb2JpbmcgKi8KKwlpbnQgKCpwcm9iZSko
c3RydWN0IHVuaXdpbGxfZGF0YSAqZGF0YSk7Cit9OworCiBzdGF0aWMgYm9vbCBmb3JjZTsK
IG1vZHVsZV9wYXJhbV91bnNhZmUoZm9yY2UsIGJvb2wsIDApOwogTU9EVUxFX1BBUk1fREVT
Qyhmb3JjZSwgIkZvcmNlIGxvYWRpbmcgd2l0aG91dCBjaGVja2luZyBmb3Igc3VwcG9ydGVk
IGRldmljZXNcbiIpOwogCi0vKiBGZWF0dXJlIGJpdG1hc2sgc2luY2UgdGhlIGFzc29jaWF0
ZWQgcmVnaXN0ZXJzIGFyZSBub3QgcmVsaWFibGUgKi8KLXN0YXRpYyB1bnNpZ25lZCBpbnQg
c3VwcG9ydGVkX2ZlYXR1cmVzOworLyoKKyAqIENvbnRhaW5zIGRldmljZSBzcGVjaWZpYyBk
YXRhIGxpa2UgdGhlIGZlYXR1cmUgYml0bWFwIHNpbmNlCisgKiB0aGUgYXNzb2NpYXRlZCBy
ZWdpc3RlcnMgYXJlIG5vdCBhbHdheXMgcmVsaWFibGUuCisgKi8KK3N0YXRpYyBzdHJ1Y3Qg
dW5pd2lsbF9kZXZpY2VfZGVzY3JpcHRvciBkZXZpY2VfZGVzY3JpcHRvciBfX3JvX2FmdGVy
X2luaXQ7CiAKIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgdW5pd2lsbF90ZW1wX2xhYmVs
c1tdID0gewogCSJDUFUiLApAQCAtMzk4LDYgKzQwNywxMSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGtleV9lbnRyeSB1bml3aWxsX2tleW1hcFtdID0gewogCXsgS0VfRU5EIH0KIH07CiAK
K3N0YXRpYyBpbmxpbmUgYm9vbCB1bml3aWxsX2RldmljZV9zdXBwb3J0cyh1bnNpZ25lZCBs
b25nIGZlYXR1cmVfbWFzaykKK3sKKwlyZXR1cm4gZGV2aWNlX2Rlc2NyaXB0b3IuZmVhdHVy
ZXMgJiBmZWF0dXJlX21hc2s7Cit9CisKIHN0YXRpYyBpbnQgdW5pd2lsbF9lY19yZWdfd3Jp
dGUodm9pZCAqY29udGV4dCwgdW5zaWduZWQgaW50IHJlZywgdW5zaWduZWQgaW50IHZhbCkK
IHsKIAl1bmlvbiBhY3BpX29iamVjdCBwYXJhbXNbMl0gPSB7CkBAIC03ODcsMjMgKzgwMSwy
MyBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqdW5pd2lsbF9hdHRyc1tdID0gewogc3Rh
dGljIHVtb2RlX3QgdW5pd2lsbF9hdHRyX2lzX3Zpc2libGUoc3RydWN0IGtvYmplY3QgKmtv
YmosIHN0cnVjdCBhdHRyaWJ1dGUgKmF0dHIsIGludCBuKQogewogCWlmIChhdHRyID09ICZk
ZXZfYXR0cl9mbl9sb2NrX3RvZ2dsZV9lbmFibGUuYXR0cikgewotCQlpZiAoc3VwcG9ydGVk
X2ZlYXR1cmVzICYgVU5JV0lMTF9GRUFUVVJFX0ZOX0xPQ0tfVE9HR0xFKQorCQlpZiAodW5p
d2lsbF9kZXZpY2Vfc3VwcG9ydHMoVU5JV0lMTF9GRUFUVVJFX0ZOX0xPQ0tfVE9HR0xFKSkK
IAkJCXJldHVybiBhdHRyLT5tb2RlOwogCX0KIAogCWlmIChhdHRyID09ICZkZXZfYXR0cl9z
dXBlcl9rZXlfdG9nZ2xlX2VuYWJsZS5hdHRyKSB7Ci0JCWlmIChzdXBwb3J0ZWRfZmVhdHVy
ZXMgJiBVTklXSUxMX0ZFQVRVUkVfU1VQRVJfS0VZX1RPR0dMRSkKKwkJaWYgKHVuaXdpbGxf
ZGV2aWNlX3N1cHBvcnRzKFVOSVdJTExfRkVBVFVSRV9TVVBFUl9LRVlfVE9HR0xFKSkKIAkJ
CXJldHVybiBhdHRyLT5tb2RlOwogCX0KIAogCWlmIChhdHRyID09ICZkZXZfYXR0cl90b3Vj
aHBhZF90b2dnbGVfZW5hYmxlLmF0dHIpIHsKLQkJaWYgKHN1cHBvcnRlZF9mZWF0dXJlcyAm
IFVOSVdJTExfRkVBVFVSRV9UT1VDSFBBRF9UT0dHTEUpCisJCWlmICh1bml3aWxsX2Rldmlj
ZV9zdXBwb3J0cyhVTklXSUxMX0ZFQVRVUkVfVE9VQ0hQQURfVE9HR0xFKSkKIAkJCXJldHVy
biBhdHRyLT5tb2RlOwogCX0KIAogCWlmIChhdHRyID09ICZkZXZfYXR0cl9yYWluYm93X2Fu
aW1hdGlvbi5hdHRyIHx8CiAJICAgIGF0dHIgPT0gJmRldl9hdHRyX2JyZWF0aGluZ19pbl9z
dXNwZW5kLmF0dHIpIHsKLQkJaWYgKHN1cHBvcnRlZF9mZWF0dXJlcyAmIFVOSVdJTExfRkVB
VFVSRV9MSUdIVEJBUikKKwkJaWYgKHVuaXdpbGxfZGV2aWNlX3N1cHBvcnRzKFVOSVdJTExf
RkVBVFVSRV9MSUdIVEJBUikpCiAJCQlyZXR1cm4gYXR0ci0+bW9kZTsKIAl9CiAKQEAgLTkz
MSw3ICs5NDUsNyBAQCBzdGF0aWMgaW50IHVuaXdpbGxfaHdtb25faW5pdChzdHJ1Y3QgdW5p
d2lsbF9kYXRhICpkYXRhKQogewogCXN0cnVjdCBkZXZpY2UgKmhkZXY7CiAKLQlpZiAoIShz
dXBwb3J0ZWRfZmVhdHVyZXMgJiBVTklXSUxMX0ZFQVRVUkVfSFdNT04pKQorCWlmICghdW5p
d2lsbF9kZXZpY2Vfc3VwcG9ydHMoVU5JV0lMTF9GRUFUVVJFX0hXTU9OKSkKIAkJcmV0dXJu
IDA7CiAKIAloZGV2ID0gZGV2bV9od21vbl9kZXZpY2VfcmVnaXN0ZXJfd2l0aF9pbmZvKGRh
dGEtPmRldiwgInVuaXdpbGwiLCBkYXRhLApAQCAtMTAwNiw3ICsxMDIwLDcgQEAgc3RhdGlj
IGludCB1bml3aWxsX2xlZF9pbml0KHN0cnVjdCB1bml3aWxsX2RhdGEgKmRhdGEpCiAJdW5z
aWduZWQgaW50IHZhbHVlOwogCWludCByZXQ7CiAKLQlpZiAoIShzdXBwb3J0ZWRfZmVhdHVy
ZXMgJiBVTklXSUxMX0ZFQVRVUkVfTElHSFRCQVIpKQorCWlmICghdW5pd2lsbF9kZXZpY2Vf
c3VwcG9ydHMoVU5JV0lMTF9GRUFUVVJFX0xJR0hUQkFSKSkKIAkJcmV0dXJuIDA7CiAKIAly
ZXQgPSBkZXZtX211dGV4X2luaXQoZGF0YS0+ZGV2LCAmZGF0YS0+bGVkX2xvY2spOwpAQCAt
MTIxOSw3ICsxMjMzLDcgQEAgc3RhdGljIGludCB1bml3aWxsX2JhdHRlcnlfaW5pdChzdHJ1
Y3QgdW5pd2lsbF9kYXRhICpkYXRhKQogewogCWludCByZXQ7CiAKLQlpZiAoIShzdXBwb3J0
ZWRfZmVhdHVyZXMgJiBVTklXSUxMX0ZFQVRVUkVfQkFUVEVSWSkpCisJaWYgKCF1bml3aWxs
X2RldmljZV9zdXBwb3J0cyhVTklXSUxMX0ZFQVRVUkVfQkFUVEVSWSkpCiAJCXJldHVybiAw
OwogCiAJcmV0ID0gZGV2bV9tdXRleF9pbml0KGRhdGEtPmRldiwgJmRhdGEtPmJhdHRlcnlf
bG9jayk7CkBAIC0xMzQyLDYgKzEzNTYsMTcgQEAgc3RhdGljIGludCB1bml3aWxsX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKHJldCA8IDApCiAJCXJldHVy
biByZXQ7CiAKKwkvKgorCSAqIFNvbWUgZGV2aWNlcyBtaWdodCBuZWVkIHRvIHBlcmZvcm0g
c29tZSBkZXZpY2Utc3BlY2lmaWMgaW5pdGlhbGl6YXRpb24gc3RlcHMKKwkgKiBiZWZvcmUg
dGhlIHN1cHBvcnRlZCBmZWF0dXJlcyBhcmUgaW5pdGlhbGl6ZWQuIEJlY2F1c2Ugb2YgdGhp
cyB3ZSBoYXZlIHRvIGNhbGwKKwkgKiB0aGlzIGNhbGxiYWNrIGp1c3QgYWZ0ZXIgdGhlIEVD
IGl0c2VsZiB3YXMgaW5pdGlhbGl6ZWQuCisJICovCisJaWYgKGRldmljZV9kZXNjcmlwdG9y
LnByb2JlKSB7CisJCXJldCA9IGRldmljZV9kZXNjcmlwdG9yLnByb2JlKGRhdGEpOworCQlp
ZiAocmV0IDwgMCkKKwkJCXJldHVybiByZXQ7CisJfQorCiAJcmV0ID0gdW5pd2lsbF9iYXR0
ZXJ5X2luaXQoZGF0YSk7CiAJaWYgKHJldCA8IDApCiAJCXJldHVybiByZXQ7CkBAIC0xMzY2
LDcgKzEzOTEsNyBAQCBzdGF0aWMgdm9pZCB1bml3aWxsX3NodXRkb3duKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIHN0YXRpYyBpbnQgdW5pd2lsbF9zdXNwZW5kX2tleWJv
YXJkKHN0cnVjdCB1bml3aWxsX2RhdGEgKmRhdGEpCiB7Ci0JaWYgKCEoc3VwcG9ydGVkX2Zl
YXR1cmVzICYgVU5JV0lMTF9GRUFUVVJFX1NVUEVSX0tFWV9UT0dHTEUpKQorCWlmICghdW5p
d2lsbF9kZXZpY2Vfc3VwcG9ydHMoVU5JV0lMTF9GRUFUVVJFX1NVUEVSX0tFWV9UT0dHTEUp
KQogCQlyZXR1cm4gMDsKIAogCS8qCkBAIC0xMzc4LDcgKzE0MDMsNyBAQCBzdGF0aWMgaW50
IHVuaXdpbGxfc3VzcGVuZF9rZXlib2FyZChzdHJ1Y3QgdW5pd2lsbF9kYXRhICpkYXRhKQog
CiBzdGF0aWMgaW50IHVuaXdpbGxfc3VzcGVuZF9iYXR0ZXJ5KHN0cnVjdCB1bml3aWxsX2Rh
dGEgKmRhdGEpCiB7Ci0JaWYgKCEoc3VwcG9ydGVkX2ZlYXR1cmVzICYgVU5JV0lMTF9GRUFU
VVJFX0JBVFRFUlkpKQorCWlmICghdW5pd2lsbF9kZXZpY2Vfc3VwcG9ydHMoVU5JV0lMTF9G
RUFUVVJFX0JBVFRFUlkpKQogCQlyZXR1cm4gMDsKIAogCS8qCkBAIC0xNDEzLDcgKzE0Mzgs
NyBAQCBzdGF0aWMgaW50IHVuaXdpbGxfcmVzdW1lX2tleWJvYXJkKHN0cnVjdCB1bml3aWxs
X2RhdGEgKmRhdGEpCiAJdW5zaWduZWQgaW50IHZhbHVlOwogCWludCByZXQ7CiAKLQlpZiAo
IShzdXBwb3J0ZWRfZmVhdHVyZXMgJiBVTklXSUxMX0ZFQVRVUkVfU1VQRVJfS0VZX1RPR0dM
RSkpCisJaWYgKCF1bml3aWxsX2RldmljZV9zdXBwb3J0cyhVTklXSUxMX0ZFQVRVUkVfU1VQ
RVJfS0VZX1RPR0dMRSkpCiAJCXJldHVybiAwOwogCiAJcmV0ID0gcmVnbWFwX3JlYWQoZGF0
YS0+cmVnbWFwLCBFQ19BRERSX1NXSVRDSF9TVEFUVVMsICZ2YWx1ZSk7CkBAIC0xNDI5LDcg
KzE0NTQsNyBAQCBzdGF0aWMgaW50IHVuaXdpbGxfcmVzdW1lX2tleWJvYXJkKHN0cnVjdCB1
bml3aWxsX2RhdGEgKmRhdGEpCiAKIHN0YXRpYyBpbnQgdW5pd2lsbF9yZXN1bWVfYmF0dGVy
eShzdHJ1Y3QgdW5pd2lsbF9kYXRhICpkYXRhKQogewotCWlmICghKHN1cHBvcnRlZF9mZWF0
dXJlcyAmIFVOSVdJTExfRkVBVFVSRV9CQVRURVJZKSkKKwlpZiAoIXVuaXdpbGxfZGV2aWNl
X3N1cHBvcnRzKFVOSVdJTExfRkVBVFVSRV9CQVRURVJZKSkKIAkJcmV0dXJuIDA7CiAKIAly
ZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwgRUNfQUREUl9DSEFSR0Vf
Q1RSTCwgQ0hBUkdFX0NUUkxfTUFTSywKQEAgLTE0NzcsNiArMTUwMiwyMyBAQCBzdGF0aWMg
c3RydWN0IHBsYXRmb3JtX2RyaXZlciB1bml3aWxsX2RyaXZlciA9IHsKIAkuc2h1dGRvd24g
PSB1bml3aWxsX3NodXRkb3duLAogfTsKIAorc3RydWN0IHVuaXdpbGxfZGV2aWNlX2Rlc2Ny
aXB0b3IgbGFwYWM3MWhfZGVzY3JpcHRvciBfX2luaXRkYXRhID0geworCS5mZWF0dXJlcyA9
IFVOSVdJTExfRkVBVFVSRV9GTl9MT0NLX1RPR0dMRSB8CisJCSAgICBVTklXSUxMX0ZFQVRV
UkVfU1VQRVJfS0VZX1RPR0dMRSB8CisJCSAgICBVTklXSUxMX0ZFQVRVUkVfVE9VQ0hQQURf
VE9HR0xFIHwKKwkJICAgIFVOSVdJTExfRkVBVFVSRV9CQVRURVJZIHwKKwkJICAgIFVOSVdJ
TExfRkVBVFVSRV9IV01PTgorfTsKKworc3RydWN0IHVuaXdpbGxfZGV2aWNlX2Rlc2NyaXB0
b3IgbGFwa2M3MWZfZGVzY3JpcHRvciBfX2luaXRkYXRhID0geworCS5mZWF0dXJlcyA9IFVO
SVdJTExfRkVBVFVSRV9GTl9MT0NLX1RPR0dMRSB8CisJCSAgICBVTklXSUxMX0ZFQVRVUkVf
U1VQRVJfS0VZX1RPR0dMRSB8CisJCSAgICBVTklXSUxMX0ZFQVRVUkVfVE9VQ0hQQURfVE9H
R0xFIHwKKwkJICAgIFVOSVdJTExfRkVBVFVSRV9MSUdIVEJBUiB8CisJCSAgICBVTklXSUxM
X0ZFQVRVUkVfQkFUVEVSWSB8CisJCSAgICBVTklXSUxMX0ZFQVRVUkVfSFdNT04KK307CisK
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCB1bml3aWxsX2RtaV90YWJsZVtd
IF9faW5pdGNvbnN0ID0gewogCXsKIAkJLmlkZW50ID0gIkludGVsIE5VQyB4MTUiLApAQCAt
MTQ4NCwxMSArMTUyNiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCB1
bml3aWxsX2RtaV90YWJsZVtdIF9faW5pdGNvbnN0ID0gewogCQkJRE1JX0VYQUNUX01BVENI
KERNSV9TWVNfVkVORE9SLCAiSW50ZWwoUikgQ2xpZW50IFN5c3RlbXMiKSwKIAkJCURNSV9F
WEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiTEFQQUM3MUgiKSwKIAkJfSwKLQkJLmRy
aXZlcl9kYXRhID0gKHZvaWQgKikoVU5JV0lMTF9GRUFUVVJFX0ZOX0xPQ0tfVE9HR0xFIHwK
LQkJCQkJVU5JV0lMTF9GRUFUVVJFX1NVUEVSX0tFWV9UT0dHTEUgfAotCQkJCQlVTklXSUxM
X0ZFQVRVUkVfVE9VQ0hQQURfVE9HR0xFIHwKLQkJCQkJVU5JV0lMTF9GRUFUVVJFX0JBVFRF
UlkgfAotCQkJCQlVTklXSUxMX0ZFQVRVUkVfSFdNT04pLAorCQkuZHJpdmVyX2RhdGEgPSAm
bGFwYWM3MWhfZGVzY3JpcHRvciwKIAl9LAogCXsKIAkJLmlkZW50ID0gIkludGVsIE5VQyB4
MTUiLApAQCAtMTQ5NiwxMiArMTUzNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5
c3RlbV9pZCB1bml3aWxsX2RtaV90YWJsZVtdIF9faW5pdGNvbnN0ID0gewogCQkJRE1JX0VY
QUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAiSW50ZWwoUikgQ2xpZW50IFN5c3RlbXMiKSwK
IAkJCURNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiTEFQS0M3MUYiKSwKIAkJ
fSwKLQkJLmRyaXZlcl9kYXRhID0gKHZvaWQgKikoVU5JV0lMTF9GRUFUVVJFX0ZOX0xPQ0tf
VE9HR0xFIHwKLQkJCQkJVU5JV0lMTF9GRUFUVVJFX1NVUEVSX0tFWV9UT0dHTEUgfAotCQkJ
CQlVTklXSUxMX0ZFQVRVUkVfVE9VQ0hQQURfVE9HR0xFIHwKLQkJCQkJVU5JV0lMTF9GRUFU
VVJFX0xJR0hUQkFSIHwKLQkJCQkJVU5JV0lMTF9GRUFUVVJFX0JBVFRFUlkgfAotCQkJCQlV
TklXSUxMX0ZFQVRVUkVfSFdNT04pLAorCQkuZHJpdmVyX2RhdGEgPSAmbGFwa2M3MWZfZGVz
Y3JpcHRvciwKIAl9LAogCXsgfQogfTsKQEAgLTE1MDksNiArMTU0Miw3IEBAIE1PRFVMRV9E
RVZJQ0VfVEFCTEUoZG1pLCB1bml3aWxsX2RtaV90YWJsZSk7CiAKIHN0YXRpYyBpbnQgX19p
bml0IHVuaXdpbGxfaW5pdCh2b2lkKQogeworCWNvbnN0IHN0cnVjdCB1bml3aWxsX2Rldmlj
ZV9kZXNjcmlwdG9yICpkZXNjcmlwdG9yOwogCWNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lk
ICppZDsKIAlpbnQgcmV0OwogCkBAIC0xNTE4LDEwICsxNTUyLDIyIEBAIHN0YXRpYyBpbnQg
X19pbml0IHVuaXdpbGxfaW5pdCh2b2lkKQogCQkJcmV0dXJuIC1FTk9ERVY7CiAKIAkJLyog
QXNzdW1lIHRoYXQgdGhlIGRldmljZSBzdXBwb3J0cyBhbGwgZmVhdHVyZXMgKi8KLQkJc3Vw
cG9ydGVkX2ZlYXR1cmVzID0gVUlOVF9NQVg7CisJCWRldmljZV9kZXNjcmlwdG9yLmZlYXR1
cmVzID0gVUlOVF9NQVg7CiAJCXByX3dhcm4oIkxvYWRpbmcgb24gYSBwb3RlbnRpYWxseSB1
bnN1cHBvcnRlZCBkZXZpY2VcbiIpOwogCX0gZWxzZSB7Ci0JCXN1cHBvcnRlZF9mZWF0dXJl
cyA9ICh1aW50cHRyX3QpaWQtPmRyaXZlcl9kYXRhOworCQkvKgorCQkgKiBTb21lIGRldmlj
ZXMgbWlnaHQgc3VwcG9ydCBhZGRpdGlvbmFsIGZlYXR1cmVzIGRlcGVuZGluZyBvbgorCQkg
KiB0aGUgQklPUyB2ZXJzaW9uL2RhdGUsIHNvIHdlIGNhbGwgdGhpcyBjYWxsYmFjayB0byBs
ZXQgdGhlbQorCQkgKiBtb2RpZnkgdGhlaXIgZGV2aWNlIGRlc2NyaXB0b3IgYWNjb3JkaW5n
bHkuCisJCSAqLworCQlpZiAoaWQtPmNhbGxiYWNrKSB7CisJCQlyZXQgPSBpZC0+Y2FsbGJh
Y2soaWQpOworCQkJaWYgKHJldCA8IDApCisJCQkJcmV0dXJuIHJldDsKKwkJfQorCisJCWRl
c2NyaXB0b3IgPSBpZC0+ZHJpdmVyX2RhdGE7CisJCWRldmljZV9kZXNjcmlwdG9yID0gKmRl
c2NyaXB0b3I7CiAJfQogCiAJcmV0ID0gcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCZ1bml3
aWxsX2RyaXZlcik7Ci0tIAoyLjM5LjUKCg==

--------------JpqZcm9b0Rtpyc7YhD122KoG--
