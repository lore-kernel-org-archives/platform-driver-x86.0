Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ADA262FED;
	Tue, 18 Nov 2025 13:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763473711; cv=none; b=AumDg80Q2GGzJPLMH255VO71HdcHRfW5xQq7gnhUVftKqQs+9K7Tw6yqVf8PVhQYhxcW5QcUb87BIfd6nJqHDht2GbpT7TSKosp7enq9FI0/glcwGo2tqnzJOgC3wKeSbDUU4PDlPkJ/ZKS/41msLI9OAUr/PmzJ5//hUlZ7IyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763473711; c=relaxed/simple;
	bh=VMUpRyHUOTjCuF5qFfq5xGcxjjl5XhYuial2lAX6myM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cljcDOe8g8UoeOSieV5fSiRywbgsiUGbLlaaMYl3hxy/RmWxsvWBoFU0yb/vtbped20lapa2Zab6inaZm3iRoCd5R1FDm+EQeqhYqNuMXmqhki8BtrDCPFx6NlwyFSdBi6OF0YsvAuVWMsl8hJO+ROBAGHF00jpDpRe1kaiZyx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=V7YY9AL2; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="V7YY9AL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763473685; x=1764078485; i=w_armin@gmx.de;
	bh=VMUpRyHUOTjCuF5qFfq5xGcxjjl5XhYuial2lAX6myM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=V7YY9AL2hLuVOp7T+rauRgsnEdR5h5daJCEqcHNuwVJR5GJsWP059POeM5BDz+KT
	 DtAn9KecN2lTMNCY/6w5n6MkahpUJckBP43k1mz5noiPRzDFomBl6VtDoxUrpDWP3
	 R/PvntrswumXa3BH+ykz6TsZD1Fpekbx6dnhOJngpC1CKr/pHVTx+sdyvjb9eDOMP
	 dQ+kEgF9eP0rqcJ5geqQbjXqNnf3mxx2ReqBcWD2HM2XyxALXY84QXJU6vrXLiLpn
	 m830O/m5ek32jAoTazgRjQQLn0vwOcKcBctd81F664kuHbwq6PAHgQYr5W5WAplON
	 kQDd7Ii0j5K/vuL0bA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.23.146] ([141.76.8.178]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQ5vW-1vYT5x2ETY-00Xzgu; Tue, 18
 Nov 2025 14:48:05 +0100
Message-ID: <5b554128-7466-4b34-9020-c0c39572f100@gmx.de>
Date: Tue, 18 Nov 2025 14:48:04 +0100
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <7276b961-8649-4bc0-87f7-a1f06cd4f3ad@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qorI9acQRm/g9wzqjFtVj2Zodb5vzTABeHtajqlZ5F76wwta+4O
 yMloaWX90PwQOGJnG6vRm0VfpmhFNqLw2S8WxtlGZAqmdjebQKZo8eCPIGTnIhfcwu98HSj
 X585hvhPMf8uZXMGq7usJ7AoODpR1I8y3xryL3cIEnntWDZVCUIzsrFsjuUet24qxxrk+KZ
 IJu0S1lDtFGSzR9Q49xbA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:X+A5T8ZfYqE=;uo9Uo697DEAPRYWmggWRQ5s7zYD
 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

Am 18.11.25 um 14:29 schrieb Werner Sembach:

>
> Am 18.11.25 um 14:12 schrieb Armin Wolf:
>> Am 18.11.25 um 13:45 schrieb Werner Sembach:
>>
>>>
>>> Am 18.11.25 um 12:08 schrieb Armin Wolf:
>>>> Am 17.11.25 um 14:23 schrieb Werner Sembach:
>>>>
>>>>> Handle some more WMI events that are triggered on TUXEDO devices.
>>>>>
>>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>>> ---
>>>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 19=20
>>>>> ++++++++++++++++++-
>>>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-wmi.h=C2=A0 |=C2=A0 2 ++
>>>>> =C2=A0 2 files changed, 20 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>>>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>> index 29bb3709bfcc8..0cb86a701b2e1 100644
>>>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>> @@ -371,9 +371,11 @@ static const struct key_entry=20
>>>>> uniwill_keymap[] =3D {
>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported in manual mode whe=
n toggling the airplane mode=20
>>>>> status */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_OSD_RFKILL, { KEY_RFKILL }},
>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_RADIO=
ON, { KEY_UNKNOWN }},
>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_RADIO=
OFF, { KEY_UNKNOWN }},
>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when user wants to=
 cycle the platform profile */
>>>>> -=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_PERFO=
RMANCE_MODE_TOGGLE, {=20
>>>>> KEY_UNKNOWN }},
>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UN=
IWILL_OSD_PERFORMANCE_MODE_TOGGLE, {=20
>>>>> KEY_F14 }},
>>>>
>>>> I am currently working a patch adding platform profile support, so=20
>>>> this event would
>>>> be handled inside the kernel on models with platform profile support.
>>>
>>> For tuxedo devices we have profiles managed in userspace that do=20
>>> additional things. So we need a way to handle this in userspace.
>>>
>> Do these things have something to do with the uniwill EC? If so then=20
>> we should implement those inside the driver
>> itself. The control center can then poll the platform profile sysfs=20
>> file to get notified when platform_profile_cycle()
>> is executed to perform additional actions.
> Not exclusively, e.g. one thing is display brightness.

And you cannot poll the sysfs interface?

>>
>>> The 2 things I can spontaneously think of would be a sysfs toggle or=
=20
>>> 2 different UNIWILL_FEATURE_* defines.
>>>
>> TPH i would love to have an ordinary keycode allocated for that if=20
>> the above does not work for you. There already
>> exists KEY_PERFORMANCE, so adding something like=20
>> KEY_PERFORMANCE_CYCLE should be possible.
>
> New keycodes won't work on X11, I don't know the reason, but X11 only=20
> supports a max of 248 keycodes
>
> That's why for example touchpad toggle is bound to F21 e.g. here=20
> https://elixir.bootlin.com/linux/v6.17.8/source/drivers/platform/x86/lg-=
laptop.c#L106=20
> .
>
Oh no. In this case using F14 is fine.


Thanks,
Armin Wolf

>>
>>>>
>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user want=
s to adjust the brightness=20
>>>>> of the keyboard */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_OSD_KBDILLUMDOWN, { KEY_KBDILLUMDOWN=20
>>>>> }},
>>>>> @@ -382,11 +384,19 @@ static const struct key_entry=20
>>>>> uniwill_keymap[] =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to to=
ggle the microphone=20
>>>>> mute status */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_OSD_MIC_MUTE, { KEY_MICMUTE }},
>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to toggle=
 the mute status */
>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_MUTE,=
 { KEY_MUTE }},
>>>>
>>>> Why is this event being ignored?
>>> Because the UNIWILL_OSD_MUTE event is sent in addition to the mute=20
>>> key event, so not ignoring it here would result in a double trigger.
>>
>> I understand.
>>
>>>>
>>>>> +
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user locks/unloc=
ks the Fn key */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWIL=
L_OSD_FN_LOCK, { KEY_FN_ESC }},
>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user want=
s to toggle the brightness=20
>>>>> of the keyboard */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_OSD_KBDILLUMTOGGLE, {=20
>>>>> KEY_KBDILLUMTOGGLE }},
>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UN=
IWILL_OSD_KB_LED_LEVEL0, {=20
>>>>> KEY_KBDILLUMTOGGLE }},
>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UN=
IWILL_OSD_KB_LED_LEVEL1, {=20
>>>>> KEY_KBDILLUMTOGGLE }},
>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UN=
IWILL_OSD_KB_LED_LEVEL2, {=20
>>>>> KEY_KBDILLUMTOGGLE }},
>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UN=
IWILL_OSD_KB_LED_LEVEL3, {=20
>>>>> KEY_KBDILLUMTOGGLE }},
>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UN=
IWILL_OSD_KB_LED_LEVEL4, {=20
>>>>> KEY_KBDILLUMTOGGLE }},
>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* FIXME: find out the exact m=
eaning of those events */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWIL=
L_OSD_BAT_CHARGE_FULL_24_H, {=20
>>>>> KEY_UNKNOWN }},
>>>>> @@ -395,6 +405,9 @@ static const struct key_entry uniwill_keymap[]=
=20
>>>>> =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to to=
ggle the benchmark mode=20
>>>>> status */
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWIL=
L_OSD_BENCHMARK_MODE_TOGGLE, {=20
>>>>> KEY_UNKNOWN }},
>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to toggle=
 the webcam */
>>>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_WEBCA=
M_TOGGLE, { KEY_UNKNOWN }},
>>>>
>>>> Same as above.
>>>
>>> Same as above ;)
>>>
>>> At least iirc, would have to double check
>>>
>> Ok.
>>
>> Thanks,
>> Armin Wolf
>>
>>>>
>>>>> +
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_END }
>>>>> =C2=A0 };
>>>>> =C2=A0 @@ -1247,6 +1260,10 @@ static int uniwill_notifier_call(struc=
t=20
>>>>> notifier_block *nb, unsigned long action
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(=
&data->battery_lock);
>>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY_OK;
>>>>> +=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_DC_ADAPTER_CHANGED:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // noop for the time bei=
ng
>>>>
>>>> Wrong comment style, please use /* */.
>>> ack
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>>>> +
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY=
_OK;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&d=
ata->input_lock);
>>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h=20
>>>>> b/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>> index 2bf69f2d80381..48783b2e9ffb9 100644
>>>>> --- a/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>> @@ -113,6 +113,8 @@
>>>>> =C2=A0 =C2=A0 #define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE=C2=A0=C2=A0=
=C2=A0 0xC0
>>>>> =C2=A0 +#define UNIWILL_OSD_WEBCAM_TOGGLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0xCF
>>>>> +
>>>>> =C2=A0 #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED=C2=A0=C2=A0=C2=A0 0=
xF0
>>>>> =C2=A0 =C2=A0 struct device;
>>>
