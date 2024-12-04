Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D278217719
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 17:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733333482; cv=none; b=IBi3OswA2NNupc5dG4fwOrEmRwZY7UzjAh1YOfWnIhyEX3LMvDNeZjHfkPeJ+ZuAUHb31IyHTlsv2/j993I6kjbaM/dhcFGmkU+hdG/q6vvWysq+JjVyegtD5VSZoGqmXMKnF45WFNRsKOgfq9E+A5hrrSgGqjokDd0FIIASHM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733333482; c=relaxed/simple;
	bh=SbBK9lTLfhHcYw3iUJpTItg0ANc6Peq+/XdEcsqMW4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YqzFgDQkCIxVHOOwEU5odiXLJBBDkNWLNFMhWVBUHhz6qN+5Yk2+DSjug+ocAaNAQoQSDzObuduBeti+AfDcTEgaKOk9iH2TVBhqYUl887Kr3v18bB4knPiThOJGqB+ROFEAksmEtaGv+v0v1v+MIQdn2YoVAjlW6DRu72o9h40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gXB7OC9k; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gXB7OC9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733333479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zu4XZ9gw4bdAludK/bry0o3DHVwuD1dlaAPOxe5YkVs=;
	b=gXB7OC9kg22H8EJySc2xhHjwQwnZPWEhSXfiKgHc3bTswLrxTBPT1DCyD8iDc8cdV57DLe
	djODEBsKm/NO87pFEi1bzH6/aWC9oU8kYb4cPLZYnngVTm4rA/T++OQyuartsBTQVmSEV2
	Jrkiephhr7zlGXQMEmhXK2evkMfnax4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-HhpgNC6mNqGyN1Gus7dTag-1; Wed, 04 Dec 2024 12:31:17 -0500
X-MC-Unique: HhpgNC6mNqGyN1Gus7dTag-1
X-Mimecast-MFC-AGG-ID: HhpgNC6mNqGyN1Gus7dTag
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d0b61f9d3cso1902157a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Dec 2024 09:31:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733333476; x=1733938276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zu4XZ9gw4bdAludK/bry0o3DHVwuD1dlaAPOxe5YkVs=;
        b=bguA52GiQiYs8y7LNh80u6B/Ks3d3xu7xRGqUDX44NOi7Jc/iBCKTwSniEvQZNo0hC
         h2Y1ARZ3CmriEYKx1Sryy15bqVK2kMN/KfmId/XkCtN6qNmVk5ZOqJMG09DYPvbQ6hN8
         twZQ9rwQuARHwYeKhJjFcNucIiiK8IfER3HF6Usc0yzBHSTi1UQKeXJ3oYh8Ivk3UF2W
         BGXR8HT3YyT5488rR9b9JYreII6ts+Px0WNMbjdBYnvYe+oIcuE5d7VqQo46a0iiCghU
         rMhx2iCZNaEoYTszVak9HNWYoihncMkL9Vf/l9H1o1AYl31aRvJaI2kbdwQ5mawCgD+a
         3AWQ==
X-Gm-Message-State: AOJu0YzZTz/gmAjod30zWOuKWCLPUN4ucCMCIbKFc4KR09oXE1QhY/ZR
	no5x1kGSkcNVtR0T9hcXdWMpuGqyFcSozY8AuKBDRkw6Q4Zvc/be8heICUmfsOGhiqt+XufknqR
	wsfZz7Tdg3TfWLNukMMZDK6nrfNC1Z6T6k3S0PoKmgY1xfViqO42CdGWGEtXdv1L2apnCifc=
X-Gm-Gg: ASbGncvuorJShO00nBY6qPLYsR3bikEWMO+W+CqTgYb3cgbEKderXUboAg/UkvVWDKm
	YohWAZCTnUrI+9w4oYFOPLSgDDk8VvxbbfZShhboFdJs3Tr/zPOmZWgTEklzDCTu+hK/yz/nhyN
	mzZfqMzLMB8Yu6YG6KaX3xRS4DQ+rZuDUPFAHskkxi+bFUz1iYYWQsCAezhW1eQHx6RexKXDriT
	V+yDtZPIJlDeUvJ7wu7LWBwYSLnQ8Ee2R9C8o7x8Ubmv0gNpEjp4JWdRVRhP8Ea6jYjAF5x1/Gm
	5H2vFgFqAMdmi7DpGqJada7nlibpFMIwYmlpJ5ab4JrMY6QHHncunQyiuN3CNVZKeJOvkQmjENX
	Xd0RGD7AJLefuw0U48pi/+LEM
X-Received: by 2002:a05:6402:234a:b0:5d0:ed92:cdf6 with SMTP id 4fb4d7f45d1cf-5d10cb5c778mr9805322a12.19.1733333476401;
        Wed, 04 Dec 2024 09:31:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkvPpdXXttKVveJgEikf3rY5DeSXS09iKYIkBhdYJGPaW5eJTeUBmM1E/jdMHSqVvs4q1oDw==
X-Received: by 2002:a05:6402:234a:b0:5d0:ed92:cdf6 with SMTP id 4fb4d7f45d1cf-5d10cb5c778mr9805273a12.19.1733333476030;
        Wed, 04 Dec 2024 09:31:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa61e7b75d9sm12619166b.193.2024.12.04.09.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 09:31:15 -0800 (PST)
Message-ID: <40b82b39-3bba-4eac-8eb0-b4cee4868737@redhat.com>
Date: Wed, 4 Dec 2024 18:31:14 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Adding a new platform driver samsung-galaxybook
To: Joshua Grisham <josh@joshuagrisham.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Joshua,

On 18-Nov-24 2:51 PM, Joshua Grisham wrote:
> Hello! I have created a platform driver for Samsung Galaxy Book series
> notebooks which has now gone through several iterations and
> contributions from several other community members.

Thank you for your work on this and thank you for submitting your
driver upstream. It is always good to have support for more laptop
models in the mainline kernel.

And my apologies for being slow with responding to this.

<snip>

> 3. usage of the i8042 filter and ACPI hotkey notifications to handle a
> few of the hotkey actions within the driver itself instead of just
> emitting input events and allow userspace to handle the actions
> (namely cycling through keyboard backlight levels, performance modes,
> etc)
> 
> This last item (executing hotkey actions in kernel space) is not
> totally unprecedented either, as I have seen there seems to exist
> similar i8042 filters driving hotkey actions in msi-laptop,
> toshiba_acpi, and dell-laptop and ACPI notifications from hotkeys
> driving actions in several x86 platform drivers as well (dell-laptop,
> acer-wmi, asus-laptop, ideapad-laptop, etc; this is an even more
> common pattern than using an i8042 filter, it seems).
> 
> The problem with just emitting the "right" input events and relying on
> the userspace to handle this stuff in the right way is that 1) there
> are not really keycodes that exist for exactly the keys we want here
> (even though "Keyboard Backlight Cycle" and some kind of "Performance
> Mode" hotkeys are very common on laptops today) and 2) functionality
> for how to handle these kind of events do not really support these
> use-cases either.

I agree that for performance-mode-cycling handling the hotkey in
the kernel is the right thing to do, this is already done by
several other drivers and we even have a helper for this:
platform_profile_cycle() please make sure you use this helper and
otherwise this is fine.

For kbd-backlight-brightness cycling most laptops actually implement
this in the embedded-controller and we only get an event that
the brightness was changed (with if we are lucky also the new
brightness level inside the event).

As you say we have KEY_KBDILLUMTOGGLE/XF86KbdLightOnOff and
KEY_KBDILLUM[UP|DOWN]/XF86KbdBrightness[Up|Down] but those don't
match what we want here and if we add a new keycode for that
userspace support will also need to be added.

So I think it is best to just emulate what the laptops where
the cycling is directly done by the embedded-control do.

That is:

1. Add LED_BRIGHT_HW_CHANGED to the flags of the led_classdev
for the "xxx:kbd_backlight" led class device you expose

2. Filter out kbd-backlight-cycle keypresses and on such
a keypress:

2.1 Determine new brightness level
2.2 Apply new brightness level
2.3 Call:

led_classdev_notify_brightness_hw_changed(&kbd_backlight_led_classdev, new_brightness_level);

This last call emulates what the kernel reports to userspace
on the events we get from embedded controllers after they have
changed the brightness level based on the cycle-key getting
pressed.

With this in place you should get a nice OSD notification like
for volume up/down in at least GNOME when changing the kbd
backlight level.

Note if you rmmod + modprobe your laptop driver you need
to restart upower afterwards for this to work. IIRC gnome-shell
does not need a logout + login, just restarting upower is enough.
But I might be wrong about not needing to restart gnome-shell...

I hope this helps and I'm looking forward to you submitting
your driver upstream.

Regards,

Hans


