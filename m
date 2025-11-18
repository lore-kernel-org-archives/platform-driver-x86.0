Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DD530F52A;
	Tue, 18 Nov 2025 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763471588; cv=none; b=Ghtj+aSaeP2SdVkCzvjCt0Z4OJbGpYrmNcD+Vv8GslE76l0As4I+tf7Wb0BTZSHhvcPSfZ26GKuFL4kCejY6B09uReasz+1oLhLTzu6N2910SlDfMLafh6W48sKJxdmkRGgbBk0aKhrdcXBz8WmTpdzYvAov3pxLXahR5IJF0a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763471588; c=relaxed/simple;
	bh=g1rc8tgK/B87nUUgdyqyldXBy6F+4l3eUVhHRAGDkXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U/Eg1q7N22eiRouTo2AgY+AIXaVUMQQ653L3VhWG6WrFdkARCO8ghULGGL/NKcI9ceRs/r8hLf+cfUC37AthEdRuhevOdMu5cWECVEXr4QNby5fRfjh2NJ0rEpbdvxN1dZQwsEKJ19gSqCDhoTYi10NrVOOdw6OtZ927MpVicoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=LX+3WA83; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="LX+3WA83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763471562; x=1764076362; i=w_armin@gmx.de;
	bh=g1rc8tgK/B87nUUgdyqyldXBy6F+4l3eUVhHRAGDkXw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LX+3WA83WM3a1oJFsjye13lN7+lQB8xmrupVKWsUogMnW+yam+bEmr5a408qM2xd
	 eeWJUxEYYmLldGE300uLX0Bd6WvcamhyfXb95yIQ7rqFpGoHKhMwpSdWi4cArocFP
	 FX8QvRoXSMNUHi2RTCEgWhLnP1yhCkVkWG+90tfauF4RNREetoqs0qm1Jezh1nWAX
	 ISo+N34b09ig1JSG1VmwUw2bV/Q2h36rOsdAyVjHt04Msstp2nU9kAnfRlm4aX/Ba
	 nZE9X+6X4QB6j4zuPqv9zlXlK3s0fEtfd+lubGjcF9pa4mextYGXUaDiTNlkp4iZs
	 WSitJsutAKOzmZcQQg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.23.146] ([141.76.8.146]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPokD-1vZHrd0v5v-00IxvF; Tue, 18
 Nov 2025 14:12:42 +0100
Message-ID: <7cd7081f-b138-4548-a9fb-5c4d5165b036@gmx.de>
Date: Tue, 18 Nov 2025 14:12:40 +0100
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <29b24831-92d4-47c6-8daf-7d1879951d43@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xm3B/4YsCDX/eX9eYv+aQ7hbeMYAnmQJ2mHa4OwixQ3Tcfp5wyS
 RkQuCPzU4W8AAKh1NvoGEhCKssDiJBM4FRyUhM5vhMJQvaWFkSL1pUdjqH2DAPQeJwDxQ7N
 bnGvLejpKj+3hBM+cF81oU4iigoDGF77bQwOhRnjqvskFyEMwB2c4BBDndO+qwe2Pq8mTcN
 gHGwzge81xOdV8i1troeQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/TOTImZXH9w=;M+iQ0QRLLL1mpFVsisxxhpu9cGR
 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

Am 18.11.25 um 13:45 schrieb Werner Sembach:

>
> Am 18.11.25 um 12:08 schrieb Armin Wolf:
>> Am 17.11.25 um 14:23 schrieb Werner Sembach:
>>
>>> Handle some more WMI events that are triggered on TUXEDO devices.
>>>
>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>> ---
>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 19 ++++++++++++++=
++++-
>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-wmi.h=C2=A0 |=C2=A0 2 ++
>>> =C2=A0 2 files changed, 20 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> index 29bb3709bfcc8..0cb86a701b2e1 100644
>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> @@ -371,9 +371,11 @@ static const struct key_entry uniwill_keymap[] =
=3D {
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported in manual mode when =
toggling the airplane mode=20
>>> status */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 UNIWILL_OSD_RFKILL, { KEY_RFKILL }},
>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_RADIOON=
,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>>> KEY_UNKNOWN }},
>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_RADIOOF=
F,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>>> KEY_UNKNOWN }},
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when user wants to c=
ycle the platform profile */
>>> -=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_PERFORM=
ANCE_MODE_TOGGLE,=C2=A0=C2=A0=C2=A0 {=20
>>> KEY_UNKNOWN }},
>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIW=
ILL_OSD_PERFORMANCE_MODE_TOGGLE,=C2=A0=C2=A0=C2=A0 {=20
>>> KEY_F14 }},
>>
>> I am currently working a patch adding platform profile support, so=20
>> this event would
>> be handled inside the kernel on models with platform profile support.
>
> For tuxedo devices we have profiles managed in userspace that do=20
> additional things. So we need a way to handle this in userspace.
>
Do these things have something to do with the uniwill EC? If so then we sh=
ould implement those inside the driver
itself. The control center can then poll the platform profile sysfs file t=
o get notified when platform_profile_cycle()
is executed to perform additional actions.

> The 2 things I can spontaneously think of would be a sysfs toggle or 2=
=20
> different UNIWILL_FEATURE_* defines.
>
TPH i would love to have an ordinary keycode allocated for that if the abo=
ve does not work for you. There already
exists KEY_PERFORMANCE, so adding something like KEY_PERFORMANCE_CYCLE sho=
uld be possible.

>>
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wants =
to adjust the brightness of=20
>>> the keyboard */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 UNIWILL_OSD_KBDILLUMDOWN, { KEY_KBDILLUMDOWN }},
>>> @@ -382,11 +384,19 @@ static const struct key_entry uniwill_keymap[]=
=20
>>> =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to togg=
le the microphone mute=20
>>> status */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 UNIWILL_OSD_MIC_MUTE, { KEY_MICMUTE }},
>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to toggle t=
he mute status */
>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_MUTE,=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>>> KEY_MUTE }},
>>
>> Why is this event being ignored?
> Because the UNIWILL_OSD_MUTE event is sent in addition to the mute key=
=20
> event, so not ignoring it here would result in a double trigger.

I understand.

>>
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user locks/unlocks=
 the Fn key */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_=
OSD_FN_LOCK, { KEY_FN_ESC }},
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wants =
to toggle the brightness of=20
>>> the keyboard */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 UNIWILL_OSD_KBDILLUMTOGGLE, {=20
>>> KEY_KBDILLUMTOGGLE }},
>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIW=
ILL_OSD_KB_LED_LEVEL0,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>>> KEY_KBDILLUMTOGGLE }},
>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIW=
ILL_OSD_KB_LED_LEVEL1,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>>> KEY_KBDILLUMTOGGLE }},
>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIW=
ILL_OSD_KB_LED_LEVEL2,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>>> KEY_KBDILLUMTOGGLE }},
>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIW=
ILL_OSD_KB_LED_LEVEL3,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>>> KEY_KBDILLUMTOGGLE }},
>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIW=
ILL_OSD_KB_LED_LEVEL4,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>>> KEY_KBDILLUMTOGGLE }},
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* FIXME: find out the exact mea=
ning of those events */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_=
OSD_BAT_CHARGE_FULL_24_H, {=20
>>> KEY_UNKNOWN }},
>>> @@ -395,6 +405,9 @@ static const struct key_entry uniwill_keymap[] =3D=
 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to togg=
le the benchmark mode=20
>>> status */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_=
OSD_BENCHMARK_MODE_TOGGLE, {=20
>>> KEY_UNKNOWN }},
>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to toggle t=
he webcam */
>>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_WEBCAM_=
TOGGLE,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 {=20
>>> KEY_UNKNOWN }},
>>
>> Same as above.
>
> Same as above ;)
>
> At least iirc, would have to double check
>
Ok.

Thanks,
Armin Wolf

>>
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_END }
>>> =C2=A0 };
>>> =C2=A0 @@ -1247,6 +1260,10 @@ static int uniwill_notifier_call(struct=
=20
>>> notifier_block *nb, unsigned long action
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&d=
ata->battery_lock);
>>> =C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY_OK;
>>> +=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_DC_ADAPTER_CHANGED:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // noop for the time being
>>
>> Wrong comment style, please use /* */.
> ack
>>
>> Thanks,
>> Armin Wolf
>>
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY_O=
K;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&dat=
a->input_lock);
>>> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h=20
>>> b/drivers/platform/x86/uniwill/uniwill-wmi.h
>>> index 2bf69f2d80381..48783b2e9ffb9 100644
>>> --- a/drivers/platform/x86/uniwill/uniwill-wmi.h
>>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
>>> @@ -113,6 +113,8 @@
>>> =C2=A0 =C2=A0 #define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE=C2=A0=C2=A0=C2=
=A0 0xC0
>>> =C2=A0 +#define UNIWILL_OSD_WEBCAM_TOGGLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0xCF
>>> +
>>> =C2=A0 #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED=C2=A0=C2=A0=C2=A0 0xF=
0
>>> =C2=A0 =C2=A0 struct device;
>
