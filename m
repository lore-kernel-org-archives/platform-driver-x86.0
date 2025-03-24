Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199EE25E475
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Mar 2025 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742818230; cv=none; b=FHADmGnBpzySWoegFvqjgru1C0AF1F7I9Mj4RFmw94BE4xevUx/M5SIgB4h1GJdY9oNtW5GtzY7yHy7rzQ52JBFRKOMYOZMixCqjMgra2FUrIYLbevJM5/R8/DF9+JDIfL0fad39MRYOE9VPVMbgVgmd6v4PRoPV38GVjF1heJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742818230; c=relaxed/simple;
	bh=sX6WYXci9m5NJKMn7fA1u3SQ8tQ0O96LPbAPnaiXcHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jph8IWzg0NOae1A0vepQaXDevDwSX1Clv63Ar8HCr2IARdw7hwml2T53YiYowTTgrn5j3KIz2pqsLZHo24p2nEVLhnBFa18YOnuaQLlb20fJjl9WO20SZBb+4pehtstk8IZmln/Wi4wmz+baLyCegui7iB1DgSrC7OPxqOFDGgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QLs294LX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QLs294LX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742818228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6nqBOVDIhTBnh8jh/rMnl7yfv2kJ/jYX8Kgsibw8Kxc=;
	b=QLs294LXDh+r1HobgxEcYXpFVLhB29FR24pvJLj75WxshPke52yqJxlUR28KaqrhVXuHHr
	CedDfyd8gU3XBJ4o1KrcbDIb8QuzwCc47/jeYWtIR6X2GYO6ycON50Ja9YPuB+QTWpyf+O
	tHMxZL5rap42KZDZGsU+vStXxBcHBbM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-vooVUrdLOWiC3Ukm8n4VnA-1; Mon, 24 Mar 2025 08:10:14 -0400
X-MC-Unique: vooVUrdLOWiC3Ukm8n4VnA-1
X-Mimecast-MFC-AGG-ID: vooVUrdLOWiC3Ukm8n4VnA_1742818213
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac3a9c3a8f7so432799766b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Mar 2025 05:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742818213; x=1743423013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6nqBOVDIhTBnh8jh/rMnl7yfv2kJ/jYX8Kgsibw8Kxc=;
        b=C1Nq0Mo1L8Fwwr5PMUpByaVWxi6eHwdUWHlE2hTuVMA0gOtEI2RiuyZLezxwXCvEgI
         ZAwYcwaEX4taTfDaqwmon0exkXlq3G2PNt8cuxsuE7ZXIXiMV6G2xua3CAPDh7x1S5ag
         ZnaYUVkeh0AHAwmv7AMoN0S3f4DoNdias/RsnEqsNDoEBi0HVMxK07CTiOEPiBjB5nI/
         aV4EjMRkFiOTvpAO9UmyZVfMksO0XdZ+Mjb2Iqauu/lAExiwCHBzUKme0y9Vgj6b1mOG
         dp7mES+ukjK0nAassCvwnnxLDSoKkYpyBZ3Dy2BUggHsjQxVZU8U+1kFRIFNDmJTHZi3
         X/Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXlo4hKkA+X6IyTeKDRN2wsTkHGHnXzT7HU8KqSdbIy9PH19ZaZzsACi7Z1V5Ver5eGZTHIDJJ9PlnVGjAnLBMQfbpi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7CVax1c1AOqVFW6BZz3arGjaSy1maG4cpLGX9Bgwc6tVKpUO1
	EPFF1rYu09CuaD5nAK4GMGghgL1f5oJxo+rEvj8sXD/gI28dJg4G9SYX9p1UrgD2KD4FD6fxu5M
	jEgv3bvJ5YfN1WaYvjFd2JpoHZMFgem314c5/IC55boC5y0s4mQbB4ip7hv5uwsPTYRnLwW0=
X-Gm-Gg: ASbGncs8HG56YBSgxijJGYhWbOT6jo3nYnqOFhtPyMTwstitbaz9BZFGjQGmXQoS+uL
	7jo75A39m7tLZ+rwstHKsuiZIVTIjpzUCM2NJnavWcHhTSk45y1RqrYuUoqHCvL+pRxmS6B/1Ab
	0Ih3HxkrEvt0H8HcAsFpVPL7Nf18QYL3amcbbdBwCFjIK+Wh7PEkbQjSDy149VHpp0MW9zwcjpa
	oncywnZqikRW6MZUH3u/9XuDcmMI5JYu3BSre0zA+4wghospP7kq4+cXZcwU3Y0As88aplabe7o
	bLuBVXf+OeHdKEyMvMc=
X-Received: by 2002:a17:907:9694:b0:ac4:5ff:cef6 with SMTP id a640c23a62f3a-ac405ffd0f5mr717526466b.31.1742818213254;
        Mon, 24 Mar 2025 05:10:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgz3PLqoJVIqA3YdGTCcfWS8RjV46kIfynQphC2N1ZVOQL/wploYLzgDJQ24oF86+2An1DfQ==
X-Received: by 2002:a17:907:9694:b0:ac4:5ff:cef6 with SMTP id a640c23a62f3a-ac405ffd0f5mr717521266b.31.1742818212663;
        Mon, 24 Mar 2025 05:10:12 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb64911sm675847266b.93.2025.03.24.05.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 05:10:12 -0700 (PDT)
Message-ID: <dac78c3d-9ba2-4721-9fb2-06dd2589bc72@redhat.com>
Date: Mon, 24 Mar 2025 13:10:11 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] HID: asus: hid-asus and asus-wmi backlight
 unification, Z13 QOL improvements
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
References: <20250319191320.10092-1-lkml@antheas.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250319191320.10092-1-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Antheas,

On 19-Mar-25 20:13, Antheas Kapenekakis wrote:
> This is a three part series that does the following: first, it cleans up
> the hid-asus driver initialization, preventing excess renames and dmesg
> errors on ROG devices. Then, it adds support for the Z13 2025 keyboard,
> by fixing its keyboard to not be stuck in BIOS mode and enabling its fan
> key. Finally, the bigger piece of this series is the unification of the
> backlight controls between hid-asus and asus-wmi.

Thank you for your work on this.

> This requires some context. First, some ROG devices expose both WMI and
> HID controls for RGB. In addition, some ROG devices (such as the Z13)
> have two AURA devices where both have backlight controls (lightbar and
> keyboard). Under Windows, Armoury Crate exposes a single brightness control
> for all Aura devices.
> 
> However, currently in the linux kernel this is not the case, with asus-wmi
> and hid-asus relying on a quirk system to figure out which should control
> the backlight. But what about the other one? There might be silent
> regressions such as part of the RGB of the device not responding properly.
> 
> In the Z13, this is the case, with a race condition causing the lightbar
> to control the asus::kbd_backlight device most of the time, with the
> keyboard being renamed to asus::kbd_backlight_1 and not doing anything
> under KDE controls.
> 
> Here, we should note that most backlight handlers are hardcoded to check
> for backlight once, and for one backlight, during boot, so any other
> solution would require a large rewrite of userspace.

Note that work is actually ongoing to add support for multiple kbd
backlights to upower:

https://gitlab.freedesktop.org/upower/upower/-/merge_requests/258

But that is intended for when there are 2 kbds with a controllable backlight,
e.g. a docked laptop with a gaming kbd with RGB backlight connected to the dock.

Where as here we seem to have 2 controls which ideally should be set to
the same value if I understand things correctly ?

> Even when brightness controls are fixed, we still have the problem of the
> backlight key being on/off when controlled by KDE and 0/33/66/100 when
> the device has a WMI keyboard. Ideally, we would like the 0/33/66/100 to
> be done under hid as well, regardless of whether the backlight of the
> device is controlled by WMI or HID.

Hmm, ideally we want this sort of policy to be in userspace, this sounds
more like it is a keycode problem and we maybe need KEY_KBDILLUMCYCLE next
to the existing KEY_KBDILLUMTOGGLE. For the existing toggle doing on/off
obviously is the correct userspace behavior.

Anyways I can see how Asus is special here and on laptops the cycling is
typically handled by the EC and we have chosen to emulate EC behavior in
the kernel before to keep things consistent amongst models.

Still generally speaking we do prefer to just send keypresses when possible
and let userspace set the policy, but I guess we can make an exception here.

> Therefore, this is what the third part of this series does. It sets up
> asus-wmi to expose accepting listeners for the asus::kbd_backlight device
> and being the one that sets it up. Then, it makes hid-asus devices
> register a listener there, so that all of them are controlled by
> asus::kbd_backlight. Finally, it adds an event handler for keyboard keys,
> so that HID led controls are handled by the kernel instead of userspace.
> This way, even when userspace is not active the key works, and we get the
> desired behavior of 0/33/66/100 across all Aura devices (currently, that
> is keyboards, and embedded devices such as lightbars). This results
> removing the quirk system as well, eliminating a point of failure.

I've taken a quick look at the new API between asus-wmi and asus-hid and
this looks good to me, thank you for your work on this.

Regards,

Hans


