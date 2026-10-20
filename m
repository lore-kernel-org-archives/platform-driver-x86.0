Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495679;
	b=NkjS/sCqPNic9/hbB9ge4JVcRp+Egz91N8v+1BUvXzMmIlf4DSM7wOMXdKwBLhimSoiv
	 i7ttrRxJfFXPOWydoTBUtEVE3vkVnUgeqfO4aEpIaDcPZPMK06T22sJoNl5HxqBCGd1DM
	 /nZP+KN8HzxGnHv8gCY/cp61q3qKly0YUI8ESMtQ0cRRQ0Ae/0TYLbwgkdDXS0u1TPprm
	 uHFnq8i58bkRzHT1KF/qMOiWBrXMH+4HCpUGfXY+EJh6QJqFa/KNRS+ZpmE10BSE6yXdA
	 38G96cdZ9jDt9F88skG8Rl0sAn1fFo69so8/BELIQ4exOL3syFo0g4TrrR0VK8YYHsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495679;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Message-ID:In-Reply-To:
	 References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Correlation-ID;
	bh=q/pA8PUtXZwr2X+UH+/LJ8Lrnbo3qJI4B/PwqU97WHM=;
	b=aOc2OqpNrHaG3Jn0onx/Hj/xrkTtxhAs1AvLMzCT0rDUQ7iRg//lKqMQBeUsulxVAkrY
	 K0Ua5i/ojtX34a/hCJkVF9QPPYfdLbaaZFgwGeXg8a1ov7gpmrk2b4fB/38+9xuR63q5Q
	 f3pKcdHFxNd9FEiuMeK0yTu0EDV2K3Ul4/rR7sT3Fpa90MDgZNt9r/SZbexDGw3xnBcID
	 N/nIVvIb196BXhZllVydzotsyUdbDDTp+HxfcACPU+Kngw5Ybri/zUMunxmz+0A4wApIj
	 smylcj8/OP6z26aOwWBC0XhPq1eUfNvDVBadceuQrHRdDiRVVOtsNnkeS9yD6McNwMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HfBJUsoa;
	arc=none smtp.remote-ip=91.218.175.228
Received: from mta0.migadu.com (out-228.mta0.migadu.com [91.218.175.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53726606A31D
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 11:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53726606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HfBJUsoa
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=q/pA8PUtXZwr2X+UH+/LJ8Lrnbo3qJI4B/PwqU97WHM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792495676; v=1; x=1793100476;
 b=HfBJUsoavb74XZSdMMdfULFyI6mZ6WovR1SjfD4eWOH9Pet5/NH1VhAuGn1GrSjTG3YLJF7s
 ckM0PJy5c8UIyRMNLQjkRKwwI2GnVrY1sNFiHQABO/2OVx0IzetrFjnhTr3in/N+aU3ax7FvYmz
 FFWTVgvTu7Mty2WAwtXlrB0U=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8f223801e6954fda;
	Tue, 20 Oct 2026 11:27:56 +0000
X-Mizu-Trace-ID: 8f223801e6954fda
X-Migadu-Flow: FLOW_OUT
Date: Tue, 20 Oct 2026 13:27:51 +0200
From: Denis Benato <denis.benato@linux.dev>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Evgeny Volferts <eugene.wolferz@gmail.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Message-ID: <4469ae07-92eb-40af-b81a-a43591f38329@linux.dev>
In-Reply-To: <4304018d-8d92-bec8-d560-897813811a92@linux.intel.com>
References: <20261015163029.107250-1-eugene.wolferz@gmail.com> <d27c2b12-8968-4eec-b925-d5345ba1821e@linux.dev> <4304018d-8d92-bec8-d560-897813811a92@linux.intel.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Ignore spurious 0xe5 events
 on GU605MY
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <4469ae07-92eb-40af-b81a-a43591f38329@linux.dev>

20 ott 2026 13:12:11 Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>:

> On Tue, 20 Oct 2026, Denis Benato wrote:
>
>>
>> On 10/15/26 18:30, Evgeny Volferts wrote:
>>> The ASUS ROG Zephyrus G16 GU605MY periodically emits an
>>> unrecognized WMI event (0xe5), approximately every 12 seconds.
>>>
>>> The event is reported as KEY_UNKNOWN through the Asus WMI hotkeys
>>> input device. When the session is locked, it causes both the
>>> internal display and an external monitor connected through a
>>> Thunderbolt dock to wake up repeatedly.
>>>
>>> Add a DMI-specific quirk to suppress this event on the GU605MY
>>> without affecting other ASUS notebook models.
>>>
>>> Ignoring the event was first verified on a 7.2.7-based OGC kernel.
>>> The DMI-specific quirk was subsequently built against 7.2.8-ogc5
>>> and tested on 7.2.9-ogc2 and 7.2.9-ogc4. On both 7.2.9 variants,
>>> the DMI match was confirmed and the unknown 0xe5 event messages
>>> disappeared.
>>
>> Hi Evgeny,
>>
>> Thank you for your work!
>>
>> I am thinking that a quirk with e5 in the name is a bit overly specific.=
..
>>
>> That code has never been handled and is just the EC repeating some setti=
ngs.
>>
>> I am thinking that perhaps the best thing to do is just create a case 0x=
E5 that
>> simply does the ignore with no quirks check and a nice comment outlining
>> why it is done.
>>
>> I don't see asus repurposing that for something else honestly so it shou=
ld
>> be future-proof enough and will potentially avoid this to other models a=
s
>> well.
>>
>> On the other end it would be cool to know what that really is telling us=
...
>>
>> If you don't come up with an answer I would defer to Ilpo whether prefer=
ring
>> reducing quirks or keeping the symmetry within that key_filter function.
>>
>> I am fine either way.
>
> Don't we need to touch the code anyway if the code is repurposed, so
> having this behind a quirk doesn't really win us anything over just
> ignoring it for any model.
>

Yeah, I expressed myself poorly: my reasoning was more like dev-oriented: i=
f a feature doesn't work at all but a dmesg error appears then it's super e=
asy to spot it... While if nothing happens that complicates things... And I=
 like when the driver tells me "ehi, fill this TODO" / "complete this part"=
.

> --
> i.
>
>> Best regards,
>> Denis Benato
>>
>>> Signed-off-by: Evgeny Volferts <eugene.wolferz@gmail.com>
>>> ---
>>> drivers/platform/x86/asus-nb-wmi.c | 17 +++++++++++++++++
>>> drivers/platform/x86/asus-wmi.h=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>> 2 files changed, 18 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/=
asus-nb-wmi.c
>>> index aeb461b1644d..8d69231d25a0 100644
>>> --- a/drivers/platform/x86/asus-nb-wmi.c
>>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>>> @@ -150,6 +150,10 @@ static struct quirk_entry quirk_asus_zenbook_duo_k=
bd =3D {
>>> =C2=A0=C2=A0=C2=A0 .key_wlan_event =3D ASUS_WMI_KEY_IGNORE,
>>> };
>>>
>>> +static struct quirk_entry quirk_asus_gu605my =3D {
>>> +=C2=A0=C2=A0 .ignore_e5_wmi_event =3D true,
>>> +};
>>> +
>>> static struct quirk_entry quirk_asus_z13 =3D {
>>> =C2=A0=C2=A0=C2=A0 .key_wlan_event =3D ASUS_WMI_KEY_ARMOURY,
>>> =C2=A0=C2=A0=C2=A0 .tablet_switch_mode =3D asus_wmi_kbd_dock_devid,
>>> @@ -562,6 +566,15 @@ static const struct dmi_system_id asus_quirks[] =
=3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D &quirk_asus=
_z13,
>>> =C2=A0=C2=A0=C2=A0 },
>>> +=C2=A0=C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .callback =3D dmi_matched,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "ASUS ROG Zephyrus G16=
 GU605MY",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI_MATCH=
(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI_MATCH=
(DMI_PRODUCT_NAME, "ROG Zephyrus G16 GU605MY_GU605MY"),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D &quirk_asus_gu60=
5my,
>>> +=C2=A0=C2=A0 },
>>> =C2=A0=C2=A0=C2=A0 {},
>>> };
>>>
>>> @@ -690,6 +703,10 @@ static void asus_nb_wmi_key_filter(struct asus_wmi=
_driver *asus_wmi, int *code,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (quirks->key_wlan_event)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *cod=
e =3D quirks->key_wlan_event;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> +=C2=A0=C2=A0 case 0xE5:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (quirks->ignore_e5_wmi_event)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *code =3D=
 ASUS_WMI_KEY_IGNORE;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> =C2=A0=C2=A0=C2=A0 }
>>> }
>>>
>>> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asu=
s-wmi.h
>>> index 5cd4392b964e..e7772397cd10 100644
>>> --- a/drivers/platform/x86/asus-wmi.h
>>> +++ b/drivers/platform/x86/asus-wmi.h
>>> @@ -41,6 +41,7 @@ struct quirk_entry {
>>> =C2=A0=C2=A0=C2=A0 bool wmi_force_als_set;
>>> =C2=A0=C2=A0=C2=A0 bool wmi_ignore_fan;
>>> =C2=A0=C2=A0=C2=A0 bool filter_i8042_e1_extended_codes;
>>> +=C2=A0=C2=A0 bool ignore_e5_wmi_event;
>>> =C2=A0=C2=A0=C2=A0 int key_wlan_event;
>>> =C2=A0=C2=A0=C2=A0 enum asus_wmi_tablet_switch_mode tablet_switch_mode;
>>> =C2=A0=C2=A0=C2=A0 int wapf;
>>

