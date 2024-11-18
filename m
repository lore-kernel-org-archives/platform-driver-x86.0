Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F6453A7
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731937893; cv=none; b=CFayBslWcqqUssGT9x4zbl5FkkCb+i+MlXnOu5wqfLagkLc7ady0vl5rLwUObgMruU5Z98k4zz4+3jlKGLx6VbdwYwYQ40y6RuVmscOBF83jurxEzj33LkR/XOTa6O2x9sh3bBS3ulcgwjhLNmv1RUyna30d8d18UpLlkvX1nzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731937893; c=relaxed/simple;
	bh=FlifaX/gKJARnrExplsmsFeW5zAhWHwmQ+h3CVitSxY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hdppIOMcGNSGpMnLvvdB4VnqjEO25UJV1nxql1G6Ct8SdsxdWYFZpDkQgL0E3nf0C570sIJr6sJpmy35BpqqfdK033WBho+KWGFgylqhachxk0S1hjQ5KLVmZg/YYvBlxBT3NoSBEiAvCx9geWhnGoEnZc7KrRn5J91K29dDgHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a761c7c4fbso5726215ab.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 05:51:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731937890; x=1732542690;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FlifaX/gKJARnrExplsmsFeW5zAhWHwmQ+h3CVitSxY=;
        b=eG38e6IKHFAfPflM7L6TxTxwbpT4523mr32LTi6nopk6U4fzWdOJdZDxyG28UIHWW3
         ZLGc/R7glRZOrdfOCwcxMi/P6RV+7G1Df+rxKhVUEbm/N09hSRwYbqaHiH8lUsCwKssI
         smcVB4nBhAM+2cMbbdICQln3HLvWTP4TG+6k4oVEnGZ0++VHqTuArK0Hw/k7WnJjAudC
         fqfHD3zwB1BVoI2HINkB/bC1qbpJ4W4MqGEUfK9gB57EVTWOdMaofgL1qt0vJeKlopjl
         58SI94EBLydK12BuTpnnCvOZAEFlPIQfEA3bzEbwCunGV+n3yI2GySRsigB/OKdwQPzx
         WJ2g==
X-Gm-Message-State: AOJu0YzV/sePp+ZWYRiuMRmy7b3zyy4/X7BZtzz3rAjb5nHIR1pKtgMe
	/5qfTKM/qjW/1ZIPZrlMB1xgVVjnNEC9joeojH79m0JcmdrVMejwqg7EAA==
X-Google-Smtp-Source: AGHT+IEoQ6uUtUuVfkD7GX6k8SiQ5jps5I5WjgAglZtw1T4ag6aGhcXxvE4wpFFqTShQT8ED20RuFA==
X-Received: by 2002:a05:6e02:1caa:b0:3a7:6d14:cc18 with SMTP id e9e14a558f8ab-3a76d14e0e1mr22718105ab.23.1731937888637;
        Mon, 18 Nov 2024 05:51:28 -0800 (PST)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a748115b79sm20404015ab.53.2024.11.18.05.51.28
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 05:51:28 -0800 (PST)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-83aba65556cso81714039f.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 05:51:28 -0800 (PST)
X-Received: by 2002:a05:6602:6014:b0:82c:f8fb:2c23 with SMTP id
 ca18e2360f4ac-83e6c182ed1mr954797339f.15.1731937887863; Mon, 18 Nov 2024
 05:51:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Mon, 18 Nov 2024 14:51:16 +0100
X-Gmail-Original-Message-ID: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
Message-ID: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
Subject: Adding a new platform driver samsung-galaxybook
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello! I have created a platform driver for Samsung Galaxy Book series
notebooks which has now gone through several iterations and
contributions from several other community members. Based on stars and
community involvement I would guess that the usage of the driver is
more than at least 100 users (if not more?) across multiple different
generations of devices and many different distributions, so hopefully
we have ironed out a lot of issues by now!

The existing driver samsung-laptop is of course somewhat
famous/notorious for how it works, but on newer devices (primarily
Samsung Galaxy Book series devices but does include a few others),
Samsung is using a new ACPI device called "SCAI" which is what this
new driver is built on, and the functionality is totally different.
There are only a few ACPI methods on this device that then actually
control a lot of different features; the "magic" is in building
various payloads to steer all of these different functionalities even
though it is often using the same ACPI method.

It is my opinion that, as we now have achieved some level of stability
with this driver, it would be good to try and get it added to mainline
as having it in mainline will add a lot of benefits (even larger
number of users who will gain benefit from this, better quality and
standardization with involvement from maintainers and the larger
community, etc).

I have myself tried to adhere to many of the existing patterns that
exist within other pdx86 drivers and the community has helped to find
and ensure (and in some cases even directly contributed to that)
various features are using standard interfaces such as with the
battery extension, platform profile, etc, in a way that seems to be
unified with existing platform drivers as well.

The driver code is currently located here:
https://github.com/joshuagrisham/samsung-galaxybook-extras/blob/main/samsung-galaxybook.c

As there are a few variants of what features are supported on
different devices (even devices with the same ACPI device id) then one
of the key principles that I have tried to now follow with the driver
is that each feature tries to check that it works or not (receives an
error code in the payload from the ACPI method) before "enabling" the
feature (creating a sysfs attribute or registering a new device etc)
when the module is probed and loaded.

Instead of just sending the code as-is in a new patch then I thought
to ask you all as the PDX86 maintainers if there is anything glaring
that you would prefer should be changed or re-designed before we try
to push this in as a patch and add this driver to the kernel?

You can see more background and what features are supported in the
README file here:
https://github.com/joshuagrisham/samsung-galaxybook-extras/blob/main/README.md

A few potentially "controversial" bits that I can highlight already now:

1. various failure messages or "unsupported features" write a warning
that directs users to create an issue in my own Github repository
instead of in Bugzilla -- maybe this is ok at the beginning but assume
it would be better to just remove some of this info from the message
and/or direct users to create a new bug in Bugzilla under the right
component there ?

2. some features where Kernel version are checked for handling some
things different for older versions of the kernel, but all of this I
would take away before submitting a patch

3. usage of the i8042 filter and ACPI hotkey notifications to handle a
few of the hotkey actions within the driver itself instead of just
emitting input events and allow userspace to handle the actions
(namely cycling through keyboard backlight levels, performance modes,
etc)

This last item (executing hotkey actions in kernel space) is not
totally unprecedented either, as I have seen there seems to exist
similar i8042 filters driving hotkey actions in msi-laptop,
toshiba_acpi, and dell-laptop and ACPI notifications from hotkeys
driving actions in several x86 platform drivers as well (dell-laptop,
acer-wmi, asus-laptop, ideapad-laptop, etc; this is an even more
common pattern than using an i8042 filter, it seems).

The problem with just emitting the "right" input events and relying on
the userspace to handle this stuff in the right way is that 1) there
are not really keycodes that exist for exactly the keys we want here
(even though "Keyboard Backlight Cycle" and some kind of "Performance
Mode" hotkeys are very common on laptops today) and 2) functionality
for how to handle these kind of events do not really support these
use-cases either (an example if you read through the discussion here:
https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/issues/41 and
especially several of the comments from Benjamin Berg, that
implementation of "Keyboard Backlight Toggle" is just on vs off and
does not cycle, and there should either be special handling of this or
a new key is created specifically for this purpose... this was from
5-6 years ago and the state of this has not changed since then from
what I can tell). It is because of these same problems that I assume
the existing PDX86 drivers do in fact implement some of this hotkey
action logic in the kernel space, in a similar way that I have tried
to do in this new samsung-galaxybook driver. I am not sure the
appetite for having even more of this pattern exist and/or if there
are any details of the implementation that you all would wish that I
should tweak a bit? I am very open to any kind of feedback on this.

Any other discussion or questions are of course welcome! Otherwise
and/or once things are to a point that is looking good then I can
create and submit a patch for this new driver.

Thank you!

Best regards,
Joshua Grisham
