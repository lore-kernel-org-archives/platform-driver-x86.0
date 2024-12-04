Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABC7192D61
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 22:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733349650; cv=none; b=mSa0bENxr399PXKwYnMLwJz/avgRkcjIZrJ8km3KmHnVGpbNPaBU/2JZf7Okx6OQ9L///2LrE1BY9h+cZYr8eFNPfVJPZ4i6MLLmR9ggqVpWPxqv8xcV/GPPGr0ZTvuvi+ArAEslUBbotD9UrUdwRHYxG8niRas3BJ/UOMZ3+zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733349650; c=relaxed/simple;
	bh=kzathd4J/7ZmJ8qOWt0eeQg0zJLGovx1GTzweyJgXwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtOJkD+2ZoKUZArnCaGELIXWdgoHL1DBpuwhq/czYybjgrzkxUjPOg1g0tnhX29FSbe/IQCl/vU6AyuuTjKCmeBwKsrmCB+0xqTj9el4zmAilkYrhvt7+36uFPIHgE7bt/7x4ioogFFYbtdZYOVVakJj/Zcftm4oz12jq/io/W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U+LFtl1I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U+LFtl1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733349647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xr82Rs10ckU6q/QZm2bVPtqgmiudSz00dQoOD/XLp6k=;
	b=U+LFtl1IaPSioaefL21yZFPplGK6BZpJ7O9PBvCVvqCNslFDwFAeSp1aHFXv3SoipO6o8k
	ktZQxSsUUk7Ao5seYQpGDqPAmhYdjjTfg9Oabj/bVxHOEBKaRle90CQse86sLMeHXpAlxt
	U712rejd17sTHwcn+FPIawXZkNXrp20=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-FVAXVPwSOAa3S_Say5Uh3A-1; Wed, 04 Dec 2024 17:00:44 -0500
X-MC-Unique: FVAXVPwSOAa3S_Say5Uh3A-1
X-Mimecast-MFC-AGG-ID: FVAXVPwSOAa3S_Say5Uh3A
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa53b6e1e51so30260166b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Dec 2024 14:00:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733349643; x=1733954443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xr82Rs10ckU6q/QZm2bVPtqgmiudSz00dQoOD/XLp6k=;
        b=m0lShPMcW+x1N/YfAV3m6mOeyy8+ZckS3jZMHjHGj0YT+nZ6E+03w5t82QWMu4vRmo
         POXh+S3cH3W28Ggq3cVOibfVHQoSqMefv5mTmXmdQTRFjtjp6tvEDdMYLGXCeG6OsoG+
         E8qfKjP6Ghe0fwi2JSd15AE1l51qK60p7ehY5t9IbIp7vYRRTO0qbCJvDCFTryItKdm9
         jDiGbc99/Du+fF0d+ow5BGfWafhRnsgDgfcA7W4gjDGqoywL6Gg/UFDIQIOBNHtm+v9+
         psdAFqMIlN0+arh79eW+90I7vWKVyN9K94SjEeGkSB5rzwMHWBUx6Q8YbXI0dWJb+i6j
         gO9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmXJpIjDuY57Ayt40Tjo/kQmYTUZL42VLEjwVGODPMIUYhf/rEKljGL7dE+VzboAe4OGGZJi3MnRn14X/7ehtnuo/K@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz6SvIEKnhVgRWpw1K5J0Cqra03A90fk3A1x3KZu/CFvWez7FW
	TTls4RxXJ6gOcWaXwG/jR7Qkuetn0rr/bAfv3uyD1H4WVCRZWobVbnKtgi/2QVKYg1NLfzMCpdT
	4/EHFtOvM91+J6qD39UkWHwBYfVd7rM7YJ+vWVQXtTcPjNs6jW9IQCvsEXjclfO6CQtiIQCcLq2
	Cne04=
X-Gm-Gg: ASbGncs0r4M9b7LWyhaonFmlXsBdGuKWOOBgp/AclM7vlHiwRX8aQXSk1UBSuaBfSsS
	KN/JMicC581wUWgK0MBGRzSV0K6u/X1TW8hXkmB2sknrWpKnIZVV6AtKc8963H9uv2ljeaiqdV+
	EId03lIf5DHSsY4SMF0zYobdZr8SkD6iTQAsjwz7bVWB83fhVcFJ+3XdTgbA8z+7dwBWcpvJGc0
	bG3/+lGu8iAfClrk7vQusnlLEqlvRmOgJSY4IY0hsmpWRB0Mz6PcdDOriKHcTKrYbKycEXNvf8l
	Jbu2Vv//Zp8lCX9JyDDYlQCDSZRbUDMY9rYMpyB3k6tjlyKwIFL3/KDDd4CbhuM3Nx1EL98JbBq
	4tfCi8OwTp6bE4Lrof8B8lNQY
X-Received: by 2002:a17:906:218a:b0:aa6:1aaf:87ce with SMTP id a640c23a62f3a-aa62033a8c4mr95120766b.8.1733349643385;
        Wed, 04 Dec 2024 14:00:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbb+pNWPaBwGL3seJwR8m5BlIcrr6LXWlGaucvh4+foo4l7AquF+WbFMe9671ZfIs4v+9sVw==
X-Received: by 2002:a17:906:218a:b0:aa6:1aaf:87ce with SMTP id a640c23a62f3a-aa62033a8c4mr95118066b.8.1733349642999;
        Wed, 04 Dec 2024 14:00:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e96aebsm6862666b.65.2024.12.04.14.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 14:00:42 -0800 (PST)
Message-ID: <d84a8908-543e-4537-86d0-ce3089ba481f@redhat.com>
Date: Wed, 4 Dec 2024 23:00:41 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Adding a new platform driver samsung-galaxybook
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
 Kurt Borja <kuurtb@gmail.com>
References: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
 <40b82b39-3bba-4eac-8eb0-b4cee4868737@redhat.com>
 <CAMF+KeYKxiG0h4K39Fzbeoa30VZsvN68XMcQ5382YdfRDgeUdQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMF+KeYKxiG0h4K39Fzbeoa30VZsvN68XMcQ5382YdfRDgeUdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Joshua,

On 4-Dec-24 9:33 PM, Joshua Grisham wrote:
> Hi Hans, thank you so much for taking the time to read through the
> questions and get back to me!
> 
> Den ons 4 dec. 2024 kl 18:31 skrev Hans de Goede <hdegoede@redhat.com>:
>>
>> So I think it is best to just emulate what the laptops where
>> the cycling is directly done by the embedded-control do.
>>
>> That is:
>>
>> 1. Add LED_BRIGHT_HW_CHANGED to the flags of the led_classdev
>> for the "xxx:kbd_backlight" led class device you expose
>>
>> 2. Filter out kbd-backlight-cycle keypresses and on such
>> a keypress:
>>
>> 2.1 Determine new brightness level
>> 2.2 Apply new brightness level
>> 2.3 Call:
>>
>> led_classdev_notify_brightness_hw_changed(&kbd_backlight_led_classdev, new_brightness_level);
>>
> 
> This is actually exactly what I have already implemented with the one
> exception: I am executing exactly the same kind of logic you mentioned
> (via schedule_work()) but I have NOT filtered out the keypress;
> instead, it is just scheduling this logic to run in a workqueue and
> then going ahead and passing along the keypress as well, just in case
> anyone wanted to trigger any other kind of event from this hotkey.
> 
> I have actually submitted a patch to the keyboard hwdb which was
> merged in to systemd that maps this particular key to "unknown" with
> the idea that someone who has this model would also likely have this
> platform driver module loaded, so by default the kernel-space action
> to actually change the brightness level would be executed (the
> "EC-like" behavior as you mentioned that they could not change), but
> the user would also have the option of remapping the key and
> triggering additional actions on top of this if they wanted.  Does
> that sound appropriate or is it better to just filter out the keypress
> entirely once the above actions are scheduled/executed?

In my experience it is best to pick one approach of

1. Deliver event to userspace and let userspace handle everything
2. Handle everything in kernel and stick with that

We actually have what you are suggesting for display brightness
up/down presses in the drivers/acpi/acpi_video.c driver
which exposes both a /sys/class/backlight device and an evdev
device delivering key-press events and which automatically
increases the brightness of the /sys/class/backlight device on
brightness up/down hotkey presses.

And that combination is a hot mess. GNOME/KDE see the keypress
and then race with the kernel increasing the brightness. Typically
they loose the race reading the new brigthness increasing the
brightness by 2 steps on one keypress. And some older laptops
have only 8 steps, so that is a problem.

I disabled the in kernel handling of the brightness up/down
keypresses in the ACPI video bus driver because of this, but
some users complained about this breaking old X11 setups using
e.g. Window Maker of fvwm. Linus Torvalds ended up "fixing"
this by instead of having the kernel immediately react giving
userspace like 0.25 seconds or something to respond and if
it does not, then handle it in the kernel. Which of course
is racy so sometimes users still hit the 2 steps for one
keypress issue if the laptop is under load.

Note this is meant as an example of what NOT to do.

As for the hwdb mapping of they keypress to unknown I predict
that at some point a well intending user is going to notice
this, map it to KEY_KBDILLUMTOGGLE and submit a PR to systemd
upstream.  Then the systemd upstream maintainers will trust
this user, who actually has such a laptop which they don't to
be doing the right thing and merge it.

And then if GNOME/KDE/xxxx grow support for actually acting
on KEY_KBDILLUMTOGGLE (if they do not do so already) we have
the kernel hotkey and userspace hotkey handling fighting
each other just like the example above.

So based on this I would strongly advice you to filter out
the key event completely at the kernel level.

If someone ever really needs / wants that event then my
suggestion would be to add a module option which *completely*
disables all in kernel handling for the key in kernelspace
and instead delivers the events to userspace.

TL;DR: IMHO mixing in kernel handling with keypress reporting
is a bad idea. Please chose one model and stick with it.

> Also as an aside, I have had a few users who have mentioned that if
> they have compiled and loaded i8042 as a module (which is then marked
> as "used by" samsung_galaxybook due to the i8042 filter), if they
> execute a modprobe -r then it also removes i8042 and their keyboard
> stops working. Is this known/expected behavior and/or is there
> anything that can be done in this driver itself to try and help
> prevent this from happening? Otherwise I guess a "fix" for this would
> be if users compile their kernel with CONFIG_SERIO_I8042=y then they
> would not have this problem?

IMHO, the best way to solve this issue is to tell users to do
"rmmod samsung_galaxybook" instead of modprobe -r. And you can do
the same in any Makefiles / scripts you may have.

Regards,

Hans


