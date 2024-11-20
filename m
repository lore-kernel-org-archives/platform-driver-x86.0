Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E99848C
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732100154; cv=none; b=r20KAJFwyVkxn0rCtwAOQ1+MMMhML56+maX15OvXX+tFNfN4xIDIiuKVge+hXtxK5iJMsvxsLaXDDXxWfpqGcGGHuYHa8Tn43YvYJKA4Lwl3RjOuan7EnqHPA017Vk86jEkNx9pvZ3fAF4AfCK2pRKhlMceoAdbXS304fvwL+a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732100154; c=relaxed/simple;
	bh=jW9Mo6/191zYPZ405GDBYRrPmL4YMPCCnjKfXC0XBTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XEeDxMemK6hLPmLkQvD2lqgYAg5wqMoUNy60cwBE0hlXR+wJoaDb5PjigeFTug+sVQYPjVFIBV81Kurtvi2qbuaUKy5XEte7dbSjPheSsO9H6Q188f+fR+x9jdm/DySeb3A/f/m+mGctHxhO0ImuDJiHlb7doVoUgDzqGrhwuSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hQv5uYvg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hQv5uYvg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732100151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E6JF4adHk1VEMmZ8sCSOJ6Hc7DDBXmc8WOGn2jGfFlc=;
	b=hQv5uYvghJzMqcKErVqe+8KLl6h52E+wNACntpOSQk0bypemrtqesDJ7FSir7itU0As/Sq
	bbJxyMoiSwKExlypPUqF1zBotAqa00mk0k0aoOljNy9h/Olsf08M0XQBFLmuUd+ZTwabzo
	S5NjXzOYYgr6/c4qbsTnvVyhBmKm9mI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-ODPAK_1uN968RcaZKn8ewQ-1; Wed, 20 Nov 2024 05:55:49 -0500
X-MC-Unique: ODPAK_1uN968RcaZKn8ewQ-1
X-Mimecast-MFC-AGG-ID: ODPAK_1uN968RcaZKn8ewQ
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5cfc26d02e6so821510a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 02:55:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732100148; x=1732704948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6JF4adHk1VEMmZ8sCSOJ6Hc7DDBXmc8WOGn2jGfFlc=;
        b=O+Ct2J8vTJh7MoguQVcM6FbifQqTy9S+1ABkwsiMvZMD+mLkl2I05hPW24QAV+ukxR
         Pqg2Q5UXUzSZqmV3FAVHr2v8LV7q9Qy8Hq/Txgdu0x51eHXr5gLrfFzJ5RBMVwT0agAN
         rnXcHW57auHdzVcOoyd9vQu8w8fCsxWU4AGAGtQRNmNtwDH37GHJPoSGvnPgZT/P2tpw
         VDnrD4lZvY+4rTf2eB3OarKcCPugKmhYx3o6j+Q/sjRTB8cl7BxlzpKkV+ACpdBWyp3B
         eqVVqGA/BdpJX3cktpFrBe3FzGfemyB1fUEs9SklslPEBPoh+Cs6pehgPs7oMUrJeSb9
         JnDg==
X-Gm-Message-State: AOJu0Yy9nq+DDmvW19s/uk5W9mtBWaEzckTemwcQzq61ZhFt9WEQXK3K
	ph/kcVTY0CrZDyIk5M1zSoEAKe3hbwHEsa55g9EhdAXCHNXE/WdJXy6hWW/K0U3I2T8Nt1GY0Hd
	PzoYCDm53MnzacpdI2naznwXNRED0WhhomnG3WOyOZhANfUIiznsH6jVnLka6hluTO+kq3Po=
X-Received: by 2002:a05:6402:350b:b0:5cf:c198:e510 with SMTP id 4fb4d7f45d1cf-5cff39d7a3fmr2456648a12.1.1732100148293;
        Wed, 20 Nov 2024 02:55:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGe35gyA3ezEshO0M4jangQZwVHZdWlBBCTp5W3pAaJg52UAVR2wRACNpXptiKgUAeUXbe6nQ==
X-Received: by 2002:a05:6402:350b:b0:5cf:c198:e510 with SMTP id 4fb4d7f45d1cf-5cff39d7a3fmr2456630a12.1.1732100147775;
        Wed, 20 Nov 2024 02:55:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cff44ef8desm672034a12.24.2024.11.20.02.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 02:55:47 -0800 (PST)
Message-ID: <f19cca44-cb57-4f15-bde2-c2e884d06d06@redhat.com>
Date: Wed, 20 Nov 2024 11:55:46 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Lenovo WMI camera driver, switching to SW_CAMERA_LENS_COVER ?
To: Armin Wolf <W_Armin@gmx.de>, Ai Chao <aichao@kylinos.cn>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <5666914c-e8c2-481d-8fdf-aff82865c228@redhat.com>
 <388bc9f3-3d0a-47f4-8cc6-beb7e2d4a4d9@gmx.de>
 <2aa14a34-b8cc-421b-b697-d4e9113b9030@redhat.com>
 <92f567cc-5aa7-4bb2-8700-6284758c4bff@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <92f567cc-5aa7-4bb2-8700-6284758c4bff@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Armin,

On 18-Nov-24 7:34 PM, Armin Wolf wrote:
> Am 18.11.24 um 16:02 schrieb Hans de Goede:
> 
>> Hi Armin, ai,
>>
>> I'm answering to both your replies in one go here since they
>> are related. This also re-adds the list for Ai's reply which
>> dropped the list from the Cc.
>>
>> On 12-Nov-24 4:16 AM, 艾超 wrote:
>>> We have discussed this question(initial state of the camera) with the
>>>
>>> hardware enginner about SW_CAMERA_LENS_COVER.
>>>
>>> Driver need a WMI events to report current  camera state to desktop-environment,
>>>
>>> and no need to get the old camera state. Whether the camera lens cover on/off ,  the camera
>>> streaming is normal.
>> Ok, so this means that if lenovo-wmi switch gets moved to use SW_CAMERA_LENS_COVER
>> it will need to do the same thing as which hp-wmi is doing and delay registering
>> the input device with the SW_CAMERA_LENS_COVER capability until the first idea.
>>
>> Do I understand correctly that the GPIO triggering the WMI events is attached to
>> the mechanical lens cover and basically reports the location of the cover ?
>>
>> In that case switching to SW_CAMERA_LENS_COVER would definitely be the right
>> thing to do.
> 
> I believe that the GPIO is connected to a general "Enable/Disable cameras" button, but if the GPIO
> is indeed connected to some sort of lens cover then i agree with sending "SW_CAMERA_LENS_COVER".
> 
>> On 11-Nov-24 7:37 PM, Armin Wolf wrote:
>>> Am 11.11.24 um 15:33 schrieb Hans de Goede:
>>>
>>>> Hi Ai,
>>>>
>>>> I have been looking into all the different way the kernel is
>>>> currently communicating to userspace that a camera is disabled
>>>> by some form of on/off switch / privacy control, see:
>>>>
>>>> https://lore.kernel.org/linuxa-media/a644fed4-aff5-4514-8e35-d6cab642d3dd@redhat.com/
>>>>
>>>> As I mention there my proposal is to standardize on
>>>> SW_CAMERA_LENS_COVER. This assumes that the button
>>>> which generates the WMI events actually enables /
>>>> disables the camera the hardware level.
>>> Hi,
>>>
>>> i think SW_CAMERA_LENS_COVER is misleading here, since AFAIK the camera completely disappears
>>> from the USB bus. With a proper lens cover however, the camera would still be accessible for
>>> querying things like supported resolutions, etc.
>> As Ai mentions above the camera keeps streaming normally looking ay
>> the original commit message for the driver which says:
>>
>> """
>> Add lenovo WMI camera button driver to support camera button.
>> The Camera button is a GPIO device. This driver receives ACPI notifications
>> when the camera button is switched on/off. This driver is used in
>> Lenovo A70, it is a Computer integrated machine.
>> """
>>
>> We are talking about a GPIO attached to some sort of on/off contact
>> here not normal keypresses. And this is for a so called All-In-One
>> device (a monitor with a PC builtin) e.g. something like this:
>>
>> https://c1.neweggimages.com/ProductImageCompressAll1280/83-265-019-01.jpg
>>
>> Notice how there is a camera-cover which the user can slide over the cam,
>> I presume the GPIO reports the position of the camera.\
>>
>> Ai can you confirm this?
>>
>> Also note that these AIO devices use normal keyboards which typically do
>> not have any camera on/off key. So I really believe that this WMI driver
>> is for a physical switch co-located with the camera itself and thus
>> reporting SW_CAMERA_LENS_COVER is the right thing to do.
>>
>> Armin, You are right that there are cases where the camera completely
>> drops of the USB bus when some laptop camera hotkey gets pressed on
>> laptop keyboards. But I do not believe that that is the case here.
>>
>>> Also i believe that the intent of the buttons handled by this driver is to disable access to
>>> all cameras connected to the system, so KEY_CAMERA_ACCESS_ENABLE / KEY_CAMERA_ACCESS_DISABLE
>>> is necessary here if external USB cameras are connected.
>> As you say on laptops these keys sometimes drop the camera completely
>> from the USB bus, so the key clearly works on the internal camera
>> not all cameras.
>>
>> What to do in those cases is a bit offtopic here, but even there
>> I would like to see us move to SW_CAMERA_LENS_COVER especially
>> since sometimes there is no info when we get the key press event
>> if the camera was added or removed. So what I would like to do
>> there is have some in kernel helper to look for an internal USB
>> camera and if there is none report SW_CAMERA_LENS_COVER=1 and
>> then when the camera comes back report SW_CAMERA_LENS_COVER=0
>> at the moment on these laptops we just report "KEY_CAMERA" which
>> really is not helpful for userspace.
>>
>> Userspace could do the look for internal camera thing itself
>> but I would rather solve this once in the kernel and use
>> SW_CAMERA_LENS_COVER consistently everywhere. I know dropping
>> the camera from the bus is not technically a lens-cover but
>> the important thing is to let userspace camera using apps
>> know that they need to ask the user to enable the camera.
>>
>> ATM this is a bit of a mess mixing SW_CAMERA_LENS_COVER +
>> KEY_CAMERA + KEY_CAMERA_ACCESS_[DIS|EN]ABLE and I would like
>> to try fixing this before userspace starts relying on the
>> current broken status quo.
>>
>> Regards,
>>
>> Hans
> 
> I agree with you here regarding the "dropping the camera of the bus" type of devices.
> 
> However we might need to differentiate between buttons which are designed to:
> 
> - disable all cameras (like some sort of configuration shortcut)
> 
> - notify that the camera was disabled (and possible dropped of the bus)
> 
> In the first case i would continue to use KEY_CAMERA_ACCESS_[DIS|EN]ABLE, while in the second
> case we could indeed use SW_CAMERA_LENS_COVER.

I agree.

> The point is that we need to know the purpose of the
> button/event.

For ACPI / WMI / EC drivers it will pretty much always be about the device's
internal camera.

I would only expect "disable all cameras (like some sort of configuration
shortcut)" to be seen on some external keyboards, not on laptop builtin
keyboards.

On some of the laptops they camera on/off hotkey even has a little LED in
there to indicate when the camera is turned off just like the mute LED
sometimes found in mic / speaker mute hotkeys.

Regards,

Hans




