Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB14D1F668C
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734445410; cv=none; b=CKhN9dmGuploSZN4IbgA4m67VqLOJZUzX4F7MW4196353tPM09+CYN9BQkEYWp17dqxiTWOv1R1AIRdIVESXTaxYonHTho4xr8bA+6mPl+CpNMkJS5B+zliqELPvJQeWus/fJcge6O8zbvjsRRQue924kkwGq+pQeyLAuwLhgKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734445410; c=relaxed/simple;
	bh=GEHzuAOCJgvRm9cIDs5L/dZJjYXM+Gu7fX5nDRW9toY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QUBErzdsVaiY8ZGR7AFAabVKW8Arxal/dqWt2uB3sEv4wXHyBTjnI2lgONPM02wH58r9UM0OB4PrCKiMT4kZck1n9qewdyJopw7h+1SQQy5DDxr1cb20bAmH+7f2E1ZGLBP0Sg12udHuqoeZN11mJjvPuJryJYZtly0sRr55K9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GoHVla35; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GoHVla35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734445407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FSgN4wlXGgdplGkFID7oReLMbww8771UXwgGNzlG4Pg=;
	b=GoHVla35XXFI68rp1vNFewOro1zymFD5STbYLBxMxNY8cIzGgrIWTt2gl3pPPXrSCmpGTf
	EKPTcxVFcEGEfshZ21jIfDDI2+Rb7YTbl3IoAF7qLjOqKGERSOokvvdDZYHUtEVxf5nEIA
	4uSpD45sZXEcmH/4kO9NyZe/jy3VTqg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-z29YgNZCObKYkzLjhYJxGQ-1; Tue, 17 Dec 2024 09:23:26 -0500
X-MC-Unique: z29YgNZCObKYkzLjhYJxGQ-1
X-Mimecast-MFC-AGG-ID: z29YgNZCObKYkzLjhYJxGQ
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa6a1bf7a82so66619066b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 06:23:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734445405; x=1735050205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSgN4wlXGgdplGkFID7oReLMbww8771UXwgGNzlG4Pg=;
        b=lfjNOsnmZYQAhbNWb5fxfdijmTIPCDrR/VbgvuulfyluSIfeymrLZz7HkM9tWGx0kV
         4aWjv/wIr2SJC8zYyEEvsX0cDoXaiipDqCmD8Z37y4nN03Trdw6iiihtNaJes7aH7rJS
         wwwCn/y0DXGJZ+4sGU7xMKTknxi4sQQB5IEvbmEABMQSnuNDFRopXRqdewLSnf4fAivI
         ug0Y1AZBvY4w3r17pkaFOIauQM1fm2PMCGwQ0baJfFvqGjwGkVsToOvcIFnQvvMx2waC
         TIB2pBJFDedaCCJxzNDE73UIpdNXMoJ50k0EfWn9C2G++KDBNqGGmP8tmEmIrQPQCKhO
         Gl+A==
X-Forwarded-Encrypted: i=1; AJvYcCUQUi+pS+mswQDZn7FYmmZ7jjJiXj8iy2JIO4ylJCFJaOnJg+98ZFH/BBfQB+JSDDaIHzdpS+nFKcyWGZUFErSjNG4Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwDD1KnM899eQFg9q5xVoc7/Gt1/2MOSYb7gRxw8MSMBObpCAvQ
	5C71GUKkfYpIwn7kAltZCTAFIG4DF1il9NuuN6uJ+oyaE6ILQV74uXyZ9HnuLZZXqP3fmYsRd/4
	btEgbMrgPGnVQ8CBclllqiSr9E2N++usZUkGr9Swgvse3OEW+oIMkeUrNkjdyeZFUi9eYyCw=
X-Gm-Gg: ASbGncvLoJgT+2NPFDkgkyLRU+D8Y0MRJ2eA4PJqXkZrD4eTB6kqJIVfWkiOUrDmt1c
	gifphFdXDd/Gup5dT7wMGgf5dRv7Ck3Fz1+UT4cWRFXPsLasyE6uwXJEi3wZKzX6MHW9X3LrKVl
	5IegfLP4wXFMWLMkTLi/kZhQEw+DGTYZqXzeJz2+XetrzgpKQMic1pwtKb/rGs7giQpEud83qrN
	VpDK5w/qtGeoNNdaK66tFvw9PIK3hOqJd5BbJBUkRZdKDfm3gN/o/vm/Ms=
X-Received: by 2002:a17:907:7707:b0:aa6:87e8:1d12 with SMTP id a640c23a62f3a-aab77e7fb68mr1268001766b.45.1734445404881;
        Tue, 17 Dec 2024 06:23:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8DGKreIgpjW49AEyXqJ0Ih9IIz3vMgcLPmJgEDXCPmvjEcUOf41BnTnq2KWFedarryER+QQ==
X-Received: by 2002:a17:907:7707:b0:aa6:87e8:1d12 with SMTP id a640c23a62f3a-aab77e7fb68mr1267998666b.45.1734445404457;
        Tue, 17 Dec 2024 06:23:24 -0800 (PST)
Received: from [10.87.1.157] ([145.15.244.207])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963598c2sm449222966b.96.2024.12.17.06.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 06:23:24 -0800 (PST)
Message-ID: <66897a27-5f81-46fc-898d-682456d7f37f@redhat.com>
Date: Tue, 17 Dec 2024 15:23:22 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Joshua Grisham <josh@joshuagrisham.com>
Cc: ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de,
 platform-driver-x86@vger.kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241216103855.18457-1-josh@joshuagrisham.com>
 <13184052-baf2-4e7d-b8ef-9ba3f34d475a@t-8ch.de>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <13184052-baf2-4e7d-b8ef-9ba3f34d475a@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 16-Dec-24 5:46 PM, Thomas Weißschuh wrote:
> Hi Joshua!
> 
> (disclaimer: I didn't read all the previous reviews)
> 

Disclaimer: I also did not read all of the previous reviews.

<snip>

>> +Parameters
>> +==========
>> +
>> +The driver includes a list of boolean parameters that allow for manually
>> +enabling or disabling various features:
> 
> Can you explain *why* these are configurable? In general the addition of
> kernel parameters is frowned upon.

Ack, Joshua if posssible just remove the kernel module parameters.

We can always add them back later if there is a good reason for them.
removing them later OTOH can be more tricky.

<snip>


>> +.. _settings-attributes:
>> +
>> +Settings Attributes
>> +===================
>> +
>> +Various hardware settings can be controlled by the following sysfs attributes:
>> +
>> +- ``allow_recording`` (allows or blocks usage of built-in camera and microphone)
>> +- ``start_on_lid_open`` (power on automatically when opening the lid)
>> +- ``usb_charge`` (allows USB ports to provide power even when device is off)
> 
> Non-standard sysfs attributes should be avoided where possible.
> Userspace will need bespoke code to handle them.
> This looks like it could be handled by the standard firmware_attributes
> interface.
> This would standardize discovery and usage.

Ack this really feels like firmware-attributes. I would not be surprised
if there are matching BIOS settings and if changing those also changes
the sysfs files and likewise if the sysfs settings persist over reboot.

<snip>

>> +Keyboard hotkey actions (i8042 filter)
>> +======================================
>> +
>> +Controlled by parameter: ``i8042_filter``
>> +
>> +The i8042 filter will swallow the keyboard events for the Fn+F9 hotkey (Multi-
>> +level keyboard backlight toggle) and Fn+F10 hotkey (Allow/block recording
>> +toggle) and instead execute their actions within the driver itself.
>> +
>> +Fn+F9 will cycle through the brightness levels of the keyboard backlight. A
>> +notification will be sent using ``led_classdev_notify_brightness_hw_changed``
>> +so that the userspace can be aware of the change. This mimics the behavior of
>> +other existing devices where the brightness level is cycled internally by the
>> +embedded controller and then reported via a notification.
>> +
>> +Fn+F10 will toggle the value of the "Allow recording" setting.
> 
> Personally I'm not a big fan to implement policy this way in the kernel.
> But others may disagree.

The keyboard backlight cycling ws already discussed and handling this in
the driver is ok.

The allow-recording setting toggle is new to me. So this is changeable
at runtime, interesting.

Joshua above you write this toggle both the microphone mute and
disables the camera?

It would be good to report the camera state to userspace using
a separate input/evdev device which reports SW_CAMERA_LENS_COVER
as discussed here:

https://lore.kernel.org/linux-media/CANiDSCtjpPG3XzaEOEeczZWO5gL-V_sj_Fv5=w82D6zKC9hnpw@mail.gmail.com/

the plan is to make that the canonical API to reported "muted"
cameras.

What happens with the camera when recording is disallowed,
dus it drop of the USB bus or does it only produce black
frames ?

It is a bit unexpected that this one button controls both
microphone and camera mute. But given that unique behavior
I guess that handling this in the kernel is probably best.

The alsamixer should send some events for the mic mute/unmute
I hope and we can use SW_CAMERA_LENS_COVER to report the camera
state.

<snip>

>> +static struct platform_driver galaxybook_platform_driver = {
> 
> Could this be a 'struct acpi_driver'?

The use of acpi_driver is deprecated. AFAIK the plan it to
move the remaining ones to platform-drivers and eventually
remove the whole ACPI bus concept turning ACPI companion
nodes into "normal" fwnodes like the current software and
openfirmware fwnodes.

Regards,

Hans




