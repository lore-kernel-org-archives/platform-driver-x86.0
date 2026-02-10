Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5036C2D73B5;
	Tue, 10 Feb 2026 10:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770719490; cv=none; b=SCM7imPkOnU5w/1ndvP1udDqRwj3KQb7IbjlXa5FF9iGfOvOrHoiHSgGTh+/O2FYRJPcoR8mnui0EmQ9hIv3aO/LIfIrlL9UJy0h841REvz4hJY6BEC3sCNglemEdDYrqPizrdVqPzNvss+JjxWo/bZHKyrpZ/Tm3SdHMSlUd1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770719490; c=relaxed/simple;
	bh=M7gSINSpppY65ZcXYIAMbQK8frccHZN0/G250ZDyri8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTliIAy/YVLBw0mgoUoHoU8kJd8+MSd71pSYGpfSKRoAMTM9oizvpCYHoc6Fuw8ENvy2Xply6Z0w84Yd+YjNFp+xKORxqKcpe7PGf6lIK8sAhsBj5dq2BMveq3DP3Wmu6X+D56cz1w20QRehQhjggfap8bYXSpDVSnt19DX2e2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZLCKKoR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZLCKKoR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF44CC116C6;
	Tue, 10 Feb 2026 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770719489;
	bh=M7gSINSpppY65ZcXYIAMbQK8frccHZN0/G250ZDyri8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mZLCKKoRG4LA3HK9qjTqynpb8brTMxC5gH6UYhzAnX+NIE0BG704YQSLo48ACEiNG
	 bOh8maHUMseDqkbpCWTawX4r8HBkhuphmgzcgnTvmvPcRTi1/AfUUvhagWXR98LuMA
	 raud01TdvGskNR9wg+mk/xtvaw/sPwQ65tb5+MkqBLbAs3pgJkuL1ZZY4YLV+9aZ3c
	 AOAn7eMDtp3YCYfoz+DlslbqhdA32nDaJQkcfcNxlxyDJtjguxHym3kXGfrjbMXQ8U
	 /pT5E4UTcGsJ3u7tJJllreq7irEBnyEbpe6jp9wh29jnRLEf7shKpaMHbRoo7ERZZ+
	 IOOCfF0CdY/Cg==
Message-ID: <79e768d8-5c09-4d77-8172-3f43fe5ba0fa@kernel.org>
Date: Tue, 10 Feb 2026 11:31:26 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thinkpad_acpi: Add Auto mode support with dynamic
 max_brightness
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Rong Zhang <i@rong.moe>,
 Vishnu Sankar <vishnuocv@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Vishnu Sankar <vsankar@lenovo.com>
References: <20260203232219.11683-1-vishnuocv@gmail.com>
 <30354f74-91c0-4fd6-82b1-15f79ae7a60f@kernel.org>
 <1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.camel@rong.moe>
 <255c1844-4992-4a7d-9519-39071a208a98@app.fastmail.com>
 <69b9a9df97f4d10e2d11d6b0eb81bbf41fb4cbde.camel@rong.moe>
 <1acdc04a-e692-4ea6-8580-13f0b6d24f44@app.fastmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <1acdc04a-e692-4ea6-8580-13f0b6d24f44@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 9-Feb-26 19:44, Mark Pearson wrote:

...

> Yeah - that's fair. You're right - we shouldn't change the brightness field.
> 
> So, how about adding two sysfs nodes to the LED class?
>  - auto_brightness_capable - indicates the LED brightness can go into an auto control mode

There is no need for this, the mere presence of
the "auto_brightness_enabled" sysfs attribute (which can
be in a sysfs-attr-group with an is_visible callback)
is enough to indicate that the backlight is auto
brightness capable.

>  - auto_brightness_enabled - indicates if the LED is in the auto_brightness controlled state or not.

This is for auto-brightness based on an ambient light sensor
(ALS), right ?

My vote would go to use "als_enabled", just like is already done in:

Documentation/ABI/testing/sysfs-platform-dell-laptop

adding new sysfs attributes to a LED class device although
possible is a bit frowned upon though.

In that sense using a trigger is better because it more
closely matches how the LED class API is supposed to be
used would maybe be better.

So I've gone and re-read Rong's trigger proposal:

https://lore.kernel.org/all/a90584179f4c90cd58c03051280a6dda63f6cc1d.camel@rong.moe/

Rong, previously you also went a bit further with implementing this
already which you described here:

https://lore.kernel.org/all/8a132e7473655ca0119af10339c63beb4df7c201.camel@rong.moe/

One of the problems you encountered there is what to do if
the user actually set a trigger themselves and the EC moves
between fixed-brightness-value <-> ALS .

My first idea was to just always override the trigger with
the special ALS trigger or none.

But thinking more about this this is wrong. E.g. there
are triggers which turn the backlight on when user input
is detected and then off after a while, which would be
a perfect reasonable thing to use together with a kbd-backlight.

Thinking more about this triggers are typically for deciding
when to turn the LED on/off not for controlling brightness
many of them actually allow still writing the brightness
sysfs attr and then when the LED should be on according to
that trigger, the trigger use the last written brightness.

Looking at things this way ALS is not really a trigger, it
is more of a brightness control mechanism.

So I think the best and also KISS solution here would be
to go with adding a "als_enabled" sysfs attr to the
LED class device, which is only visible when support,
just like is already done in:

Documentation/ABI/testing/sysfs-platform-dell-laptop

I would also call led_classdev_notify_brightness_hw_changed() 
when the EC moves between fixed-brightness-value <-> ALS.

Userspace will likely already have a poll() going on on
the brightness_hw_changed sysfs attr, so this way userspace
which is aware of the als_enabled sysfs attr can also check
that.

You can then report brightness_max as the new value when calling
led_classdev_notify_brightness_hw_changed() since the ALS can go
up to brightness_max, likewise you could also always return
brightness_max when reading the brightness value while in ALS mode.

The only real question left then is what to do on brightness
writes. I would do the same as what triggers do here, ignore
writing non 0 values and turn off the backlight (and thus also
ALS) when 0 is written.

Note as for actually allowing "auto" for the brightness value
(read/write) that would break userspace assumptions that that
file always contains an integer, so that is not an option IMHO.

Regards,

Hans


