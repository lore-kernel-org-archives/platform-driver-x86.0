From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: toshiba_acpi.c
Date: Thu, 26 Feb 2015 09:11:57 -0700
Message-ID: <CAGdLNWHJw+_F6+ZU4vrpXNvbrq9eHpzpcrx2RrkqKMHRFq5BuA@mail.gmail.com>
References: <1424291222.2455.3.camel@gmail.com>
	<CAGdLNWFy-awfrKEDZJ2paG3-R+xbVUYJ+JfPxpMExSdG_WrLAw@mail.gmail.com>
	<002b01d0513b$94f66380$bee32a80$@gmail.com>
	<CAGdLNWG3QpDXb+4piAb6+JRwzV2SOf+TGi7MNUOXV__+pgeqWA@mail.gmail.com>
	<002f01d05197$c95b4da0$5c11e8e0$@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:42347 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754201AbbBZQL6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Feb 2015 11:11:58 -0500
Received: by wesw62 with SMTP id w62so12274901wes.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Feb 2015 08:11:57 -0800 (PST)
In-Reply-To: <002f01d05197$c95b4da0$5c11e8e0$@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Tom Mannerhagen <tom.mannerhagen@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi Tom,

2015-02-26 0:42 GMT-07:00 Tom Mannerhagen <tom.mannerhagen@gmail.com>:
> Hi Azael
>
> I see, but that concerns the alternative map, correct?

Yes

> How does the driver tell if it should use the "standard" or alternative mapping?

On the patches that I will send (hopefully later today),
a call to an HCI function is made, which tells us the hotkey
events type, so far, there are two types "normal" and "special",
where "normal" covers all the old key mappings and the
"special" covers the new one.

>
> I think I can see some checks are made in the beginning of the driver, it checks for certain ACPI ID's (TOS6200, TOS6207, TOS6028, TOS1900).
> Are they used to identify the system as a Toshiba or are they used to distinguish which Toshiba-platform it runs on?
> Perhaps both?

I'm not sure what you men by platform, but those HIDs represent the
Toshiba Configuration Interface devices (or TVAP - Toshiba Value
Added Package), and yes, they are used to identify the system
as a Toshiba laptop, at least as hotkeys, backlight and some other
system stuff concerns, as there are more IDs on the system, but they
cover Bluetooth (TOS6205) and Accelerometer (TOS620A).

>
> If used to tell which Toshiba it runs on, is this somehow used to select mapping of the function-keys?
>
> BTW - I have access to a bunch of units and will happily test as time allow.
> You may need to hand-hold me through the building of the driver and using it in a distro.

Well, as long as you have installed the kernel sources, make and gcc,
we are fine, I can provide you with a Makefile and the source to test,
and a simple:

make
sudo make install
sudo make load

Will do the trick ;-)

>
> BR Tom
>

Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
