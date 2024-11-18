Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC658126C02
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 18:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731954883; cv=none; b=eFnEncaufqdUV2WMLAymgUtQ3PNS9oWeJOxfBmKWk8yyILelOIgZWIFgXGO/91wNoAl6hoyrWqWYk078jYHLOfdmZZMZ1tGz3+kon2S/41VbtTYr/OT+5ahXueLoEUZQqyCExOqz3Rcg7A7z8CTztXpdN9wz3fk+M3WZH5B4634=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731954883; c=relaxed/simple;
	bh=twhJTLzZWh3ulcgssDv5OwLYo5HPUpkkTimQL/6SAsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PkYFNv4erFxNFCjTPM6bUPl3BbmLVwNX/JfmMPTAKJZNjFkVZDSm5KKGEvSl/qHuCoojLGqezXSX/LlQUFmecQACOojfRXoWuswEi8BJHFxONorKy6tF9FpSy75Vpb4IhoNsS7WqJW0X/t1ChMiQvpwLl7tCMz9ZsnzbV/53sBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=TDpqC0F9; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="TDpqC0F9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1731954870; x=1732559670; i=w_armin@gmx.de;
	bh=VOhoIKMs6tBxez5wYy+6X/qePDD90h8GC47d1rO6Mho=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=TDpqC0F9Wq68Ek6LtctSJT8xwYcP7g6/rTyVdf9/pblaStaLiYSLci3qODoccaVj
	 g1T7B51ujlsfMUQQ8I553HNXC5GKgom8kTBJ1DqGkjHj93Ku7nom4cJa/jXabyk8r
	 wQw+7Ma3VPYV1jDWPx7FQuiMZDqcgFkPD3HYNYVUE3JAv5m4h7FK9mrBwV7u3n5zh
	 9tnRiWZJdywaZ4SEZwwG8Bz/Q3m8P/q7MZT19EWz8ltHjifBRIywTghrBpiFQFlZY
	 mgQd720l2sedgYg8J96ZK0tk9R6qWb4OQzhQK87rnwW+1P5d/9r7e3hQM+VAqq+Ox
	 iBxvQdcp3uz8NMdgkg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([141.30.226.119]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAfYw-1t28DO0CnQ-007KfN; Mon, 18
 Nov 2024 19:34:30 +0100
Message-ID: <92f567cc-5aa7-4bb2-8700-6284758c4bff@gmx.de>
Date: Mon, 18 Nov 2024 19:34:28 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Lenovo WMI camera driver, switching to SW_CAMERA_LENS_COVER ?
To: Hans de Goede <hdegoede@redhat.com>, Ai Chao <aichao@kylinos.cn>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <5666914c-e8c2-481d-8fdf-aff82865c228@redhat.com>
 <388bc9f3-3d0a-47f4-8cc6-beb7e2d4a4d9@gmx.de>
 <2aa14a34-b8cc-421b-b697-d4e9113b9030@redhat.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <2aa14a34-b8cc-421b-b697-d4e9113b9030@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JttoCMRjO/K+BFRc/xJiOLPsPt9W3Nx9yuoXvQohDZuZZQd+WET
 FGX7WobnxrHNj5hQGZM2/4RQTtfAwqYqkhmrxawz1NLtsGSvzhyQVoHUgSIR5kNybL0zn7A
 hxWjqETf5sZd8zKJS5IcJXTdygUqmHUZVesb3yWWnZvv0AkHSbnoIIXvonSsYi1Eh/BMAc2
 xfwIPoPWIML2MTznP7LWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TuREb/pjNAk=;o98I+WpgyJeap2isDmlIvyaf/+p
 WYTbkCQeHKTe/XwUmHxwIdlqu1HmUz/pkDbi05Jcg/wkIjWP3/YuHd+N1/B26hwEWCBBw52fl
 FpsrvSvguZ8yBMeoh3hi9XGSA8KqGvTuV/WdwAi7eVdL8Q4zIF7ZnRZipppJXQHM0qfS2xPFN
 y1CUCGJG/Pi/iOalmUUfBJ5gozRNUTiLxqMOq7pgXiwQVfkjdqCQ0fTI16HuBvuqpaQizWxMg
 UUsiqsc87G3NJV34hjNxhff94geaV27fiIQXmxMd8DGFvr0PACznrOMoIiAiYREdN1jAPCy5e
 lLhZwjaYNsiNqoS231y3NjJYBWxuwq36fvtWsBtFjtSxQscdZz4Yo+pWITmn5mvyayV3Qme9Y
 uZdY8r/57sXdPdoDanP7zrmJc7j61XZQw7ssgvCwahTR9a6+p3nnzuXmmC/S3t/sHg7oEzo+3
 X5YQU5LQA0me2EqyuyEbIKb2TQ+6MiVOW3RhWm1uSGC7NSvAIKgZDSIulDb+FvlZTK7teno+c
 0SFNGfnO9ciuQjxcBVqUoeL/JLjy7TDCNWSOjHcGzrMGzoqsvEonX4pTJhtbycyamWNFwqFPV
 2GplfUM/Pi4ZTw3i+H4Udd2NYAvf569fLnw8kmh9KV6uqCz8/XjjG+kFrZjXzgp0ObFzFVbHN
 Cz5s7/FiyGQwWBrNNlyew4Akt5D0vR6+vpcmtNuXaVIglZsVqX9JHSmcQsAqWrPEtYiHjF722
 m2+SUympYNwXKL4Bmmr7t3KXuNRyQlg7Si0VqQ3pPB8MVmrHcSKCQmKmwo5156W94TiPsQ+fV
 AKOixPH+0vIipvjb1tGqQbDDwElRRwCzKYvqONWQm++wLycMU+XZkEatatYPH2Lv0db+8oLns
 A0saXrQY7hoYskiHXT0/nIV1FfrvYhQdSa1vmGbAukxJhsaBuKsEr1zze

Am 18.11.24 um 16:02 schrieb Hans de Goede:

> Hi Armin, ai,
>
> I'm answering to both your replies in one go here since they
> are related. This also re-adds the list for Ai's reply which
> dropped the list from the Cc.
>
> On 12-Nov-24 4:16 AM, =E8=89=BE=E8=B6=85 wrote:
>> We have discussed this question(initial state of the camera) with the
>>
>> hardware enginner about SW_CAMERA_LENS_COVER.
>>
>> Driver need a WMI events to report current  camera state to desktop-env=
ironment,
>>
>> and no need to get the old camera state. Whether the camera lens cover =
on/off ,  the camera
>> streaming is normal.
> Ok, so this means that if lenovo-wmi switch gets moved to use SW_CAMERA_=
LENS_COVER
> it will need to do the same thing as which hp-wmi is doing and delay reg=
istering
> the input device with the SW_CAMERA_LENS_COVER capability until the firs=
t idea.
>
> Do I understand correctly that the GPIO triggering the WMI events is att=
ached to
> the mechanical lens cover and basically reports the location of the cove=
r ?
>
> In that case switching to SW_CAMERA_LENS_COVER would definitely be the r=
ight
> thing to do.

I believe that the GPIO is connected to a general "Enable/Disable cameras"=
 button, but if the GPIO
is indeed connected to some sort of lens cover then i agree with sending "=
SW_CAMERA_LENS_COVER".

> On 11-Nov-24 7:37 PM, Armin Wolf wrote:
>> Am 11.11.24 um 15:33 schrieb Hans de Goede:
>>
>>> Hi Ai,
>>>
>>> I have been looking into all the different way the kernel is
>>> currently communicating to userspace that a camera is disabled
>>> by some form of on/off switch / privacy control, see:
>>>
>>> https://lore.kernel.org/linuxa-media/a644fed4-aff5-4514-8e35-d6cab642d=
3dd@redhat.com/
>>>
>>> As I mention there my proposal is to standardize on
>>> SW_CAMERA_LENS_COVER. This assumes that the button
>>> which generates the WMI events actually enables /
>>> disables the camera the hardware level.
>> Hi,
>>
>> i think SW_CAMERA_LENS_COVER is misleading here, since AFAIK the camera=
 completely disappears
>> from the USB bus. With a proper lens cover however, the camera would st=
ill be accessible for
>> querying things like supported resolutions, etc.
> As Ai mentions above the camera keeps streaming normally looking ay
> the original commit message for the driver which says:
>
> """
> Add lenovo WMI camera button driver to support camera button.
> The Camera button is a GPIO device. This driver receives ACPI notificati=
ons
> when the camera button is switched on/off. This driver is used in
> Lenovo A70, it is a Computer integrated machine.
> """
>
> We are talking about a GPIO attached to some sort of on/off contact
> here not normal keypresses. And this is for a so called All-In-One
> device (a monitor with a PC builtin) e.g. something like this:
>
> https://c1.neweggimages.com/ProductImageCompressAll1280/83-265-019-01.jp=
g
>
> Notice how there is a camera-cover which the user can slide over the cam=
,
> I presume the GPIO reports the position of the camera.\
>
> Ai can you confirm this?
>
> Also note that these AIO devices use normal keyboards which typically do
> not have any camera on/off key. So I really believe that this WMI driver
> is for a physical switch co-located with the camera itself and thus
> reporting SW_CAMERA_LENS_COVER is the right thing to do.
>
> Armin, You are right that there are cases where the camera completely
> drops of the USB bus when some laptop camera hotkey gets pressed on
> laptop keyboards. But I do not believe that that is the case here.
>
>> Also i believe that the intent of the buttons handled by this driver is=
 to disable access to
>> all cameras connected to the system, so KEY_CAMERA_ACCESS_ENABLE / KEY_=
CAMERA_ACCESS_DISABLE
>> is necessary here if external USB cameras are connected.
> As you say on laptops these keys sometimes drop the camera completely
> from the USB bus, so the key clearly works on the internal camera
> not all cameras.
>
> What to do in those cases is a bit offtopic here, but even there
> I would like to see us move to SW_CAMERA_LENS_COVER especially
> since sometimes there is no info when we get the key press event
> if the camera was added or removed. So what I would like to do
> there is have some in kernel helper to look for an internal USB
> camera and if there is none report SW_CAMERA_LENS_COVER=3D1 and
> then when the camera comes back report SW_CAMERA_LENS_COVER=3D0
> at the moment on these laptops we just report "KEY_CAMERA" which
> really is not helpful for userspace.
>
> Userspace could do the look for internal camera thing itself
> but I would rather solve this once in the kernel and use
> SW_CAMERA_LENS_COVER consistently everywhere. I know dropping
> the camera from the bus is not technically a lens-cover but
> the important thing is to let userspace camera using apps
> know that they need to ask the user to enable the camera.
>
> ATM this is a bit of a mess mixing SW_CAMERA_LENS_COVER +
> KEY_CAMERA + KEY_CAMERA_ACCESS_[DIS|EN]ABLE and I would like
> to try fixing this before userspace starts relying on the
> current broken status quo.
>
> Regards,
>
> Hans

I agree with you here regarding the "dropping the camera of the bus" type =
of devices.

However we might need to differentiate between buttons which are designed =
to:

- disable all cameras (like some sort of configuration shortcut)

- notify that the camera was disabled (and possible dropped of the bus)

In the first case i would continue to use KEY_CAMERA_ACCESS_[DIS|EN]ABLE, =
while in the second
case we could indeed use SW_CAMERA_LENS_COVER. The point is that we need t=
o know the purpose of the
button/event.

Thanks,
Armin Wolf

