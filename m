Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1E11531E8
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 20:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733344406; cv=none; b=i84q5Q3jHdYx+F3XNE5gqBD4tO3eyk2wTYFLiyI4FxhILCN8K9njOoO/JsM90Wgp3niUb+z+STiyYR/Q/zQXE8owlOUw6Hz5MXjTDK8kAbzpWcoWhfB/guG9itm/8eO2jHg6KO55WeymjoCsVG9Wk+6X7lldMO7pAzJ0WFaAr4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733344406; c=relaxed/simple;
	bh=n4DkBmr2ruHZSlgIIYtBx4iEuBjLq78dWJawlIgW+vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPWvrV6LcrdXoZpp2LneOO3dV5thHA7x1KGo6wbC6tFy8ziPqYoMRoavxGdgCROxmiOZYl8Mbuk3ncqa73r4+WgI7JzNddDOtlNSKcnaQJrQjM4DkZ1+mw1eYSeoAcXBG1hNu34GWn7W1ljuqcoW6k/Y7BdWputK3+cb7SfD//w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a777fd574bso436475ab.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Dec 2024 12:33:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344404; x=1733949204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOZHAeOihCCF3n24yoUvKwBdq0TTbHh5X1pp5iE1H1o=;
        b=Ot/up0cWsGStQ05vRXiYvKxJ42dqt0Rc/yisJb3+1hSVCnbMPoY3+ZqbN0a5PASrVo
         SFEW0ZXSCM5jGFGkNqgcFO4wIe0HTLeTCAZ3ZodMsXgRlbsVg+2H4LvvCfkKRR0XeZg6
         H5pfHtBE4W4kj3yzIMsz1JrkD9BN98H/9G+RtbN8HcKwSMV9FtrjtM85d8R02hRHvZh2
         M/4K1T53Wg0iBi+pG6nLJstMols99A+0guolgQ7fl7sO533uuRTFeV3FNVvAMshvtLse
         dVMHVHx/9l825Bo+0t9KNrgFWF8zTqQeUOFQ887lVdw+BpENg0v07/lQ9/VTxyT2LAMH
         4Ukg==
X-Forwarded-Encrypted: i=1; AJvYcCUqGTlwo86P4t/g/UBBiwOur+8pSE5g7Ci5TCoXKT2lSBc50L70DdGuMya4MmLs7fzE7NYzNimM6XQTVLzGIny5ZBQD@vger.kernel.org
X-Gm-Message-State: AOJu0YwhCCJ48g4/1O9gg5YzL5+gGghK1VCTDBeYfXztz+omZTBsBCxz
	zljzMXQcfGtrYA63gX9alyQR/C0Fh3I/YZPvJDL+8ZMD894MGFQyW1HZeTgv
X-Gm-Gg: ASbGncunk/h4P0tKWER1Q4F0I6l5+9X75PvtdmSAwqEz2kUAyAxceO6GNtKUBMVN1+B
	YEGnQPA5kranIXxQgpqFimlOfvndj18DF8ItfA+1+soInSGtRfpQ/xZspO6NaoLteP522zv2UYY
	+WXTtrenK1N4xV4wTF1kY9GlUZhpWZxrfsJVEbi8aHf9OAq3HHGm/v+wfRZ1EW1HUWYx3eU9Tr6
	LHbmHJkZyHZSHQKKcT7gY8X7YgryTu2y99a7e769o5WG+pgbSS0WboQtuixn4U4KqGXrpcFMdLO
	GUqt5EGZiC+UJbg=
X-Google-Smtp-Source: AGHT+IFBw8J5bA/MZIYlvgvBKfz7cXC2kT5q/z8i3ZJlZ/wsoD8plDo4hLm6J7YPhhvP0dJC0TowLA==
X-Received: by 2002:a05:6e02:3d88:b0:3a7:e86a:e812 with SMTP id e9e14a558f8ab-3a7f9a8c510mr104632545ab.17.1733344404277;
        Wed, 04 Dec 2024 12:33:24 -0800 (PST)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e230e5eb7dsm3250205173.94.2024.12.04.12.33.23
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 12:33:23 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-843df3c4390so4605139f.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Dec 2024 12:33:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPlITqwdGQMRGNNVNp/7xDNrcnzJKjRK8wAIdTCqm0JzrUBX/BiwSWAEALN8YX7rt6v+FR9k9457Tb5kt/WEaKZdKg@vger.kernel.org
X-Received: by 2002:a05:6602:29c8:b0:807:f0fb:1192 with SMTP id
 ca18e2360f4ac-8445b5477f8mr991740039f.1.1733344403205; Wed, 04 Dec 2024
 12:33:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
 <40b82b39-3bba-4eac-8eb0-b4cee4868737@redhat.com>
In-Reply-To: <40b82b39-3bba-4eac-8eb0-b4cee4868737@redhat.com>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Wed, 4 Dec 2024 21:33:12 +0100
X-Gmail-Original-Message-ID: <CAMF+KeYKxiG0h4K39Fzbeoa30VZsvN68XMcQ5382YdfRDgeUdQ@mail.gmail.com>
Message-ID: <CAMF+KeYKxiG0h4K39Fzbeoa30VZsvN68XMcQ5382YdfRDgeUdQ@mail.gmail.com>
Subject: Re: Adding a new platform driver samsung-galaxybook
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>, 
	Kurt Borja <kuurtb@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Hans, thank you so much for taking the time to read through the
questions and get back to me!

Den ons 4 dec. 2024 kl 18:31 skrev Hans de Goede <hdegoede@redhat.com>:
>
> So I think it is best to just emulate what the laptops where
> the cycling is directly done by the embedded-control do.
>
> That is:
>
> 1. Add LED_BRIGHT_HW_CHANGED to the flags of the led_classdev
> for the "xxx:kbd_backlight" led class device you expose
>
> 2. Filter out kbd-backlight-cycle keypresses and on such
> a keypress:
>
> 2.1 Determine new brightness level
> 2.2 Apply new brightness level
> 2.3 Call:
>
> led_classdev_notify_brightness_hw_changed(&kbd_backlight_led_classdev, new_brightness_level);
>

This is actually exactly what I have already implemented with the one
exception: I am executing exactly the same kind of logic you mentioned
(via schedule_work()) but I have NOT filtered out the keypress;
instead, it is just scheduling this logic to run in a workqueue and
then going ahead and passing along the keypress as well, just in case
anyone wanted to trigger any other kind of event from this hotkey.

I have actually submitted a patch to the keyboard hwdb which was
merged in to systemd that maps this particular key to "unknown" with
the idea that someone who has this model would also likely have this
platform driver module loaded, so by default the kernel-space action
to actually change the brightness level would be executed (the
"EC-like" behavior as you mentioned that they could not change), but
the user would also have the option of remapping the key and
triggering additional actions on top of this if they wanted.  Does
that sound appropriate or is it better to just filter out the keypress
entirely once the above actions are scheduled/executed?

Also as an aside, I have had a few users who have mentioned that if
they have compiled and loaded i8042 as a module (which is then marked
as "used by" samsung_galaxybook due to the i8042 filter), if they
execute a modprobe -r then it also removes i8042 and their keyboard
stops working. Is this known/expected behavior and/or is there
anything that can be done in this driver itself to try and help
prevent this from happening? Otherwise I guess a "fix" for this would
be if users compile their kernel with CONFIG_SERIO_I8042=y then they
would not have this problem?

Thank you again!

Best regards,
Joshua

> [...]
