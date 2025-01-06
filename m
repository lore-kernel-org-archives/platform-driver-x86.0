Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0EA1DC05F
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jan 2025 11:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736164215; cv=none; b=fL1M7FnK+N2k8FyhvpWNZ2uFfyqYbZw8qTQEPkZ4gdhTPqRGGdfEiSyApTtvyq/73vrVAkdiZ2httrTijPs2rjhCxVc+zZAN/Xmzr1YT69NqTWAq1BrTdTHP8bas3B3zu0QN72kvguMXeEZu/+2BnL/lULmJ/dmqcRJPbPUfE/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736164215; c=relaxed/simple;
	bh=Irbw3ZOJ/7hvNqrlKM1Lzzx/wcqzc9FmVv78MxdhJyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PgmweHlUR38J36nTx1oj9O2W+eLR/yXv2HHctoovnOGYHhiCmPGHfqEEWvEhB6+i6sPaLsiS9iY+68fo250jIkMlBxLVMEv8AWcZOrYXAQZqap2GEeu1slI/qOT1jH+Xbkvc0tVq6oLSqFtChzeN3cDIsT8PL1Fz/JiOlJNswAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eVl19NdA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eVl19NdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736164211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpq33UCeXg21WZu8P3zwO8Ss4G+vMkNm9yeh35pyurE=;
	b=eVl19NdADlKbjYuH/5ZGfLsqRYDg9TuqBVUNcfICtizryzQEla68hpe21VF7YPxz3lLfL3
	WNKDw0arekJRgW9x1+vxwpYVwwjSpr6Zo8qvybRfQ6zVhRjViU+CflhCqMjdCeDHmKFvPq
	Jmc9QrZb8sMp1nPlus+G61gLuicBo8s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-9umdOSgyPUuvBMB7yVeonQ-1; Mon, 06 Jan 2025 06:50:10 -0500
X-MC-Unique: 9umdOSgyPUuvBMB7yVeonQ-1
X-Mimecast-MFC-AGG-ID: 9umdOSgyPUuvBMB7yVeonQ
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aabf8e856e2so196805566b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jan 2025 03:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736164209; x=1736769009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cpq33UCeXg21WZu8P3zwO8Ss4G+vMkNm9yeh35pyurE=;
        b=r03fOW9To/nvK+DJc1SSI1aHJkLfPlgf/nToS0xhXLP1rLAy8tlz5v8D4RztH33uAo
         i4g8RxwnPAep3r4juD8wgc4RkblWtlFKGGk+LGIc7mPmYRD/Ah82VRqtn+btZszNggIi
         kHGmZNhcwo/kvhMm5pCjOLXRHmDy7DKxf5ML6hhBKPecjj2kB5FN+QaZvZviZtYUes20
         hhnLu0cAj5IGs94dvEEIfOni2RNEY4RCWWxcEJGs7D9ehwi2IFBnqo43z9cvDHDp+5qQ
         E5I5NxYukWCLiEIBuN+Ra/hOhuqVtJkSMcxHn7iCIeuBirXGSL+T2G0tVrYsMIEjNbo2
         JgNA==
X-Forwarded-Encrypted: i=1; AJvYcCXKM4nWnZXEi+XgCKVTZnXzuedokpbYfMbjdV8lMUoAzpfV3TF/IE6hCk6LBKa8Y3UR7AaiKuM+QXf7TaBF45jWQNvd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8GqYQb66vqolcN+m/MAwQi7kSHCsbMP1xxetbo1lt6lNTlqGm
	zphoTezm8+Nn057AaDuWhnUlag6eOpZCH1NQFPHhV/e8M7HsIFDeqkMX4SNy46b7/L9Azc+lVGl
	L8Z+voe/rVSh1XgjIjwus619VnGG4YktZwrox3bq+o1a+roTQzlk60BVzHRvTkaPgVcpj+iY=
X-Gm-Gg: ASbGncvagNu4jcWPzXJT1MTOOkwCxX7PJTCthvrSz7/D8ur5I/cGjtYRIPqVwQL6dsJ
	bXf/8O7oQ5tYEH7Ulw1UKmczI/hWBv/PHR8lJkApOvqijzzbODWFiFVtXdYgHPJHijoLlbUMxzM
	FcYby2pPkzsT+B4TaMbDOmUb8R5cNq5lJcDEXHjGmoehW890JzH/NhBs8MqCNBM5giE6R3UDz8Q
	euwItpRE/YaD/5sci2SMZBlD+DH878HipFi2JbufkgeAs9Yd0whwNcIqhVV
X-Received: by 2002:a17:907:3eaa:b0:aa6:6e10:61f6 with SMTP id a640c23a62f3a-aac34217a79mr4101540466b.52.1736164209005;
        Mon, 06 Jan 2025 03:50:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMp5wSDcCs5L+heJdCQakWpQLJTgR8yN6TypH1xRJO6ECiGXowA4x9M+MnmabS5RTqnj+KNQ==
X-Received: by 2002:a17:907:3eaa:b0:aa6:6e10:61f6 with SMTP id a640c23a62f3a-aac34217a79mr4101538166b.52.1736164208479;
        Mon, 06 Jan 2025 03:50:08 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0653bbsm2272058266b.184.2025.01.06.03.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 03:50:08 -0800 (PST)
Message-ID: <bfd9b7a4-ebef-49ff-8b86-bd61b1a06d38@redhat.com>
Date: Mon, 6 Jan 2025 12:50:07 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de,
 platform-driver-x86@vger.kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241216103855.18457-1-josh@joshuagrisham.com>
 <13184052-baf2-4e7d-b8ef-9ba3f34d475a@t-8ch.de>
 <66897a27-5f81-46fc-898d-682456d7f37f@redhat.com>
 <CAMF+KeZ3uAWZuuPJcrrvTJS-TgyxkqXOY_w=wNw7eZQiUkV5YA@mail.gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMF+KeZ3uAWZuuPJcrrvTJS-TgyxkqXOY_w=wNw7eZQiUkV5YA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Sorry for the very slow reply.

On 19-Dec-24 6:31 PM, Joshua Grisham wrote:
> Thank you both Thomas and Hans for your review and comments! I am
> working on a v4 of the patch but had a few questions which I wanted to
> clarify (they can also come after in a v5 etc in case I managed to get
> this ready to go before anyone has the time to confirm and/or clarify
> some things!).
> 
> Den tis 17 dec. 2024 kl 15:23 skrev Hans de Goede <hdegoede@redhat.com>:
>>
>> On 16-Dec-24 5:46 PM, Thomas Weißschuh wrote:
>>>> +Various hardware settings can be controlled by the following sysfs attributes:
>>>> +
>>>> +- ``allow_recording`` (allows or blocks usage of built-in camera and microphone)
>>>> +- ``start_on_lid_open`` (power on automatically when opening the lid)
>>>> +- ``usb_charge`` (allows USB ports to provide power even when device is off)
>>>
>>> Non-standard sysfs attributes should be avoided where possible.
>>> Userspace will need bespoke code to handle them.
>>> This looks like it could be handled by the standard firmware_attributes
>>> interface.
>>> This would standardize discovery and usage.
>>
>> Ack this really feels like firmware-attributes. I would not be surprised
>> if there are matching BIOS settings and if changing those also changes
>> the sysfs files and likewise if the sysfs settings persist over reboot.
>>
> 
> Yes 2 of these (not this "allow_recording" I think) are available via
> BIOS and all 3 of them persist over restarts.

Ok, then firmware-attributes definitely is a good match for these
and I see you have already moved this functionality to
the firmware-attributes class API for v4, good :)

> Just so I am 100% clear what you mean here -- these type of attributes
> should be created using the utilities available in
> drivers/platform/x86/firmware_attributes_class.h so that they are
> created under the path /sys/class/firmware-attributes/*/attributes/*/
> ?

Yes.

> What exactly should they be named (any preference?)

No preference for the naming, the firmware-attributes API just
specifies how userspace can find out if something is
an int/string/enumand valid values / range. Not naming of
the attributes.

> and should I also
> add some documentation for them in
> Documentation/ABI/testing/sysfs-class-firmware-attributes ?

No unless you add new functionality like a new type to
the firmware attributes API then these should not be
documented there. It would be good to document them in
driver specific documentation.

> I am fairly sure I understand the concept and can agree that it kind
> of makes a lot of sense to be able to standardize the userspace
> interface, especially for attributes which do the exact same thing
> across different vendors/devices (unless it just as easily possible to
> go based on some pattern matching e.g. like is done in udev and upower
> with "*kbd_backlight*" etc) but as of now it looks like the only
> examples implemented are for thinklmi, dell-wmi, and hp-bioscfg that I
> can see so far?

Right, note the existing examples all actually read a list of
firmware-attributes directly from the BIOS using a generic interface,
which is somewhat different from how you plan to use this.

Using the firmware-attributes class to control settings where each
attribute needs to be manually added to the driver is new, but is
e.g. also planned for asus-wmi and some other upcoming drivers.

>> The allow-recording setting toggle is new to me. So this is changeable
>> at runtime, interesting.
>>
>> Joshua above you write this toggle both the microphone mute and
>> disables the camera?
>>
>> It would be good to report the camera state to userspace using
>> a separate input/evdev device which reports SW_CAMERA_LENS_COVER
>> as discussed here:
>>
>> https://lore.kernel.org/linux-media/CANiDSCtjpPG3XzaEOEeczZWO5gL-V_sj_Fv5=w82D6zKC9hnpw@mail.gmail.com/
>>
>> the plan is to make that the canonical API to reported "muted"
>> cameras.
>>
>> What happens with the camera when recording is disallowed,
>> dus it drop of the USB bus or does it only produce black
>> frames ?
>>
>> It is a bit unexpected that this one button controls both
>> microphone and camera mute. But given that unique behavior
>> I guess that handling this in the kernel is probably best.
>>
>> The alsamixer should send some events for the mic mute/unmute
>> I hope and we can use SW_CAMERA_LENS_COVER to report the camera
>> state.
>>
> 
> Yes this is kind of an interesting one, also... In the user manuals
> for these Samsung devices, they actually call this feature "Block
> Recording." See the second link here with the same title:
> 
> https://www.samsung.com/ca/support/computing/samsung-laptop-disable-the-webcam/
> 
> There is this software control in their "Samsung Settings" and/or
> "Samsung Security" application plus the hotkey, but they both function
> exactly the same (executing this ACPI method with the right payload).
> The reason I called it "allow recording" is because I was trying to
> take a simple approach in the beginning, and let the device value and
> userspace value have a 1:1 mapping (you send 0x1 if you want the
> webcam and mic to NOT block recording, i.e. be "allowed" and 0x0 if
> you them to be blocked). I thought that echo 1 > block_recording to
> turn OFF "blocking" felt backwards so I just reversed the name instead
> ;) But in theory it could as easily be called "block_recording" and
> the kernel driver could handle the flip (0x1 from userspace becomes
> 0x0 to/from the device and vice-versa).
> 
> When you press the hotkey in Windows then there is an OSD popup from
> their own background software, but nothing actually happens to the
> devices themselves. Even in Linux via this driver or if you just
> directly execute the ACPI method with the right values in the buffer,
> what happens is that the image feed from the camera just becomes solid
> black and the mic input is just completely silent. The USB camera
> device is not removed or seemingly touched in anyway, and there does
> not seem to be any kind of sound device event at all from what I can
> tell (I tried to check using "amixer events" and a few other methods
> but never saw anything, and the mixer control in alsa is always
> un-muted like normal when toggling the feature on and off even though
> it stops the sound from being able to be recorded).
> 
> It is as this switch name SW_CAMERA_LENS_COVER indicates, almost like
> a physical (virtual?) cover has been drawn over the camera and the
> microphone but they are still seen as operational and completely
> unchanged from a device perspective.

Right, so for the camera side of this, intercepting the key making
the ACPI call and then reporting SW_CAMERA_LENS_COVER definitely
is the right thing to do.

The microphone also getting muted not at the mixer level but at
some other hw level as a side-effect is something unique to
samsung, I guess we can just ignore this wrt reporting it to
userspace. Once GNOME/KDE get support for showing an OSD on
SW_CAMERA_LENS_COVER changes (1) we will have a nice notification
to the user and the mic also getting muted as a side-effect will
then just be a Samsung peculiarity we will have to live with.

1) now that more drivers are starting to actually report this
I hope that at least GNOME will get OSD support for this soon.

> What I have started with for now based on this thread, is that as it
> seems like KE_SW key entries should have a "sw" struct with code and
> value, that I am assuming I should send .code = SW_CAMERA_LENS_COVER,
> .value = 0 for "cover is removed/off/not blocking", and .code =
> SW_CAMERA_LENS_COVER, .value = 1 for "cover is placed/on/blocking",

That is correct.

> also it looks like I should send this event as part of init for the
> current state at init time (the input device seems to have a "state"
> associated to this switch) -- is this correct?

That is also correct.

> And then is there any events or functions that should be called to
> notify of a mic mute switch (not actually to send the event to toggle
> mic mute to userspace, but to just report to userspace somehow that
> the mic has been muted by hardware, similar to this
> SW_CAMERA_LENS_COVER or led_classdev_notify_brightness_hw_changed()
> etc ?

No, normally the EC controls the hw-mixer in the sound/codec chip
and that sends an event. But that appears to not be happening here?

We could add a SW_INTERNAL_MIC_MUTED event I guess. Although with this
being a Samsung only thing I doubt userspace will ever get support
for that and if it does then we end up with one OSD replacing the
other quite quickly since typicalluy only 1 OSD will be shown at
a time. So as I mentioned above, I would just go with only reporting
SW_CAMERA_LENS_COVER and then consider the mic also getting muted
a Smasung specific side-effect of this.

Some UVC cameras also have an electronic "cover" switch rather then
an actual cover, I guess those might also mute the builtin mic
for UVc cams with a builtin mic, so having this is a side-effect
is not that far fetched.

> At the same time I am still not convinced what exactly the name of
> this attribute should be ("allow_recording" vs "block_recording" vs
> "camera_mic_privacy" etc ??)

camera_mic_privacy or block_recording are both fine I think.

> 
> Other notifications that I am wondering what the "right" way to handle
> / using the right interface:
> 
> - Are there better events to use for these which these devices are
> reporting for "ACPI_NOTIFY_DEVICE_ON_TABLE" and
> "ACPI_NOTIFY_DEVICE_OFF_TABLE" , i.e. some kind of standard
> "switch"-like notification that the motion sensor in the device has
> detected that it has been placed or lifted from a flat surface?

The thinkpad_apci driver has /sys/bus/platform/devices/thinkpad_acpi/dytc_lapmode
which will read 1 when the laptop thinks it is not on a table (and thus will
limit max temperatures a bit to avoid someone getting a hot lap when
actually having the laptop on their lap.

I'm not aware of any other drivers having something similar. I do think
that power-profiles-daemon checks the dytc_lapmode thing, so it might
be good to have some standard interface for this, but that would need
to be designed / decided upon .

For v1 of your patch I would just dev_dbg() log these events and
otherwise do nothing.

> 
> - When the battery charge control end threshold is reached, there is
> an ACPI notification on this device as well that is the one I have
> marked "ACPI_NOTIFY_BATTERY_STATE_CHANGED" -- the Samsung background
> apps pop up a custom OSD that basically says something to the effect
> that their "Battery saver is protecting the battery by stopping
> charging" (can't remember the exact verbiage) and they change the
> battery icon, but without doing anything else in my driver currently
> the battery still reports state of "charging" even though it just sits
> constantly at the percentage (and has the charging icon in GNOME etc).
> I have seen the event come and go occasionally when I did not expect
> it, but my working theory is that maybe it is if/when the battery
> starts charging again if it dips too far below the target "end
> threshold" and then notifies again when the threshold has been
> reached. Armin also mentioned this before in a different mail; I guess
> I would hope/expect there is an event or a function I could call to
> have the state reflected correctly but I would not want that it
> negatively impacts the normal behavior of charging the battery itself
> (just that the state/icon would change would be ideal! as it functions
> perfectly, it is just that the state and icon are not accurate).

ATM there is no userspace API to communicate e.g. "charging stopped
due to charge end threshold" and this is the first time I hear about
us getting events from the hw for this.

So for this one too I would say just dev_dbg() log the event and
otherwise do nothing.

We can always add an API later if we have an idea how userspace
could / will use this.

Regard,

Hans


