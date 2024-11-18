Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038BD1B21A0
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 15:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731942148; cv=none; b=dxMEvupikzTzIIVPHwYOZRNyPSx0uJxxJ+qehBILslYy4M4x1LoL0qvxgEMRgsptYcveNb2iG+I0LTzEqrHMJW8DAWz07tkb63RnxVFEW6PpRWsTAkowa9UkAOkvT/3p4B+HYBBb3eFXt7OG1FVHpu48A+VcHgYv1abBKTuhOjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731942148; c=relaxed/simple;
	bh=/yFLj6LFMe0QYmGe1XuNGU/hZy26p3bfk3hcCx4lR7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TF/dRyGV1r/GQDG9swG1aRVCsJWNem3dvOBR/+UHSfEmn7QaFLr6kzfwEJhdwN3onsoWxB557kmLBbaVBfoHfv2LTGwU9Z9dJ9gWKVtfE3D5ccVOM0uPmUcMrYr7OLi2y55KCYgrpVQVtJ00JkbI2WpHNumCD8yBrRUWUlk6agQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SmuFDr2S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SmuFDr2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731942144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dx6X/0YGxm0pZlof6BYKQBt9G8sQkw5O71WYO9Vc5mw=;
	b=SmuFDr2SeLMYG6rdWl4Zcr6rRTeS5uPv/GNcK7k5zJL1kxGAHaD4KJXzW9Yci/g/Y+dlCu
	81LF0RnPsEPmz3bWf/r5zJYbj+Z77eSAfxW6l38khCmIvs3hgYjo4HvvKT4xhHpGy2jBOt
	M4T6uVKypxpN32+BKvXmCpJDUEDgd2Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-4Eo2FhfHOq6sNQrVR3h9sA-1; Mon, 18 Nov 2024 10:02:23 -0500
X-MC-Unique: 4Eo2FhfHOq6sNQrVR3h9sA-1
X-Mimecast-MFC-AGG-ID: 4Eo2FhfHOq6sNQrVR3h9sA
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a99efe7369dso435337666b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 07:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731942141; x=1732546941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dx6X/0YGxm0pZlof6BYKQBt9G8sQkw5O71WYO9Vc5mw=;
        b=PILupCAjTTf07SBYdxweGXvPstyhP7VbICtk7Lz9CZWZqbMTDfEV2eQzH8wfWITDNs
         7C3MzRW63e8fPgz75oWNvVtJoW6hrrUoFFJZiOm8wUpwjM7/3i/PPstTLpouqdop+uoK
         Uklvt7l8jiSqmdHSlALODj5UZcdy52pJ85a1p2XxJxj+gRh70YjJ3VIvuBgAqW5nZTUb
         QiZ3eXB58cHYdew9GyO8p5xM/EvVUvwqGgruL3Z7T1gtQ4ZEDC/g1APTIvDK3zuHfNqf
         hZyurxa5wdF3kCJ+TrkKay4arJRYtpmKxYs1HIgvolpNM0P7M56awsVmWl7M6XkT1Qdc
         cXJA==
X-Gm-Message-State: AOJu0YwvONTeKQaqgYDxxbscocmzRk7Bkzbr/79ZLpXYGycemuUlGW1h
	6Ny7Xtt8AlGnKjXrfvc9eUP+RGfX3TK6grIYrIJxvSSIaxC/XSfQnAhlr9V1YRUqCfI6RIXXTUz
	3LqJXpnagQO4CoVdsq5qHPpfxOwPR/CIHJs1Z+SQpxNi3zaeawqYawvnl//GCK3sbaS9BjP+TLm
	XPI6A=
X-Received: by 2002:a17:907:36ca:b0:a91:1699:f8eb with SMTP id a640c23a62f3a-aa481a60008mr1153426466b.28.1731942139063;
        Mon, 18 Nov 2024 07:02:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwXyfPEFSL+ncCoOCwenW8p3xQutfwWxLXUlAWpTOzorGvyWtkEq3wmZ/7DOmcKe8STuohqQ==
X-Received: by 2002:a17:907:36ca:b0:a91:1699:f8eb with SMTP id a640c23a62f3a-aa481a60008mr1153397766b.28.1731942136470;
        Mon, 18 Nov 2024 07:02:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df268casm548254066b.1.2024.11.18.07.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 07:02:16 -0800 (PST)
Message-ID: <2aa14a34-b8cc-421b-b697-d4e9113b9030@redhat.com>
Date: Mon, 18 Nov 2024 16:02:15 +0100
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
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <388bc9f3-3d0a-47f4-8cc6-beb7e2d4a4d9@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Armin, ai,

I'm answering to both your replies in one go here since they
are related. This also re-adds the list for Ai's reply which
dropped the list from the Cc.

On 12-Nov-24 4:16 AM, 艾超 wrote:
> We have discussed this question(initial state of the camera) with the
> 
> hardware enginner about SW_CAMERA_LENS_COVER.
> 
> Driver need a WMI events to report current  camera state to desktop-environment,
> 
> and no need to get the old camera state. Whether the camera lens cover on/off ,  the camera
> streaming is normal.

Ok, so this means that if lenovo-wmi switch gets moved to use SW_CAMERA_LENS_COVER
it will need to do the same thing as which hp-wmi is doing and delay registering
the input device with the SW_CAMERA_LENS_COVER capability until the first idea.

Do I understand correctly that the GPIO triggering the WMI events is attached to
the mechanical lens cover and basically reports the location of the cover ?

In that case switching to SW_CAMERA_LENS_COVER would definitely be the right
thing to do.

On 11-Nov-24 7:37 PM, Armin Wolf wrote:
> Am 11.11.24 um 15:33 schrieb Hans de Goede:
> 
>> Hi Ai,
>>
>> I have been looking into all the different way the kernel is
>> currently communicating to userspace that a camera is disabled
>> by some form of on/off switch / privacy control, see:
>>
>> https://lore.kernel.org/linuxa-media/a644fed4-aff5-4514-8e35-d6cab642d3dd@redhat.com/
>>
>> As I mention there my proposal is to standardize on
>> SW_CAMERA_LENS_COVER. This assumes that the button
>> which generates the WMI events actually enables /
>> disables the camera the hardware level.
> 
> Hi,
> 
> i think SW_CAMERA_LENS_COVER is misleading here, since AFAIK the camera completely disappears
> from the USB bus. With a proper lens cover however, the camera would still be accessible for
> querying things like supported resolutions, etc.

As Ai mentions above the camera keeps streaming normally looking ay
the original commit message for the driver which says:

"""
Add lenovo WMI camera button driver to support camera button.
The Camera button is a GPIO device. This driver receives ACPI notifications
when the camera button is switched on/off. This driver is used in
Lenovo A70, it is a Computer integrated machine.
"""

We are talking about a GPIO attached to some sort of on/off contact
here not normal keypresses. And this is for a so called All-In-One
device (a monitor with a PC builtin) e.g. something like this:

https://c1.neweggimages.com/ProductImageCompressAll1280/83-265-019-01.jpg

Notice how there is a camera-cover which the user can slide over the cam,
I presume the GPIO reports the position of the camera.\

Ai can you confirm this?

Also note that these AIO devices use normal keyboards which typically do
not have any camera on/off key. So I really believe that this WMI driver
is for a physical switch co-located with the camera itself and thus
reporting SW_CAMERA_LENS_COVER is the right thing to do.

Armin, You are right that there are cases where the camera completely
drops of the USB bus when some laptop camera hotkey gets pressed on
laptop keyboards. But I do not believe that that is the case here.

> Also i believe that the intent of the buttons handled by this driver is to disable access to
> all cameras connected to the system, so KEY_CAMERA_ACCESS_ENABLE / KEY_CAMERA_ACCESS_DISABLE
> is necessary here if external USB cameras are connected.

As you say on laptops these keys sometimes drop the camera completely
from the USB bus, so the key clearly works on the internal camera
not all cameras.

What to do in those cases is a bit offtopic here, but even there
I would like to see us move to SW_CAMERA_LENS_COVER especially
since sometimes there is no info when we get the key press event
if the camera was added or removed. So what I would like to do
there is have some in kernel helper to look for an internal USB
camera and if there is none report SW_CAMERA_LENS_COVER=1 and
then when the camera comes back report SW_CAMERA_LENS_COVER=0
at the moment on these laptops we just report "KEY_CAMERA" which
really is not helpful for userspace.

Userspace could do the look for internal camera thing itself
but I would rather solve this once in the kernel and use
SW_CAMERA_LENS_COVER consistently everywhere. I know dropping
the camera from the bus is not technically a lens-cover but
the important thing is to let userspace camera using apps 
know that they need to ask the user to enable the camera.

ATM this is a bit of a mess mixing SW_CAMERA_LENS_COVER +
KEY_CAMERA + KEY_CAMERA_ACCESS_[DIS|EN]ABLE and I would like
to try fixing this before userspace starts relying on the
current broken status quo.

Regards,

Hans



