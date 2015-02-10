From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH resend 3/6] toshiba_acpi: Add support for Keyboard
 functions mode
Date: Mon, 9 Feb 2015 21:38:51 -0700
Message-ID: <CAGdLNWEW38QPnTmKYA2zHXkOA5xTT28S6ngH1Tq5CBR9dtgfBw@mail.gmail.com>
References: <1423539294-2941-1-git-send-email-coproscefalo@gmail.com>
	<1423539294-2941-4-git-send-email-coproscefalo@gmail.com>
	<20150210040809.GB37927@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:36496 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755083AbbBJEiw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Feb 2015 23:38:52 -0500
In-Reply-To: <20150210040809.GB37927@fury.dvhart.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Darren,

2015-02-09 21:08 GMT-07:00 Darren Hart <dvhart@infradead.org>:
> On Mon, Feb 09, 2015 at 08:34:51PM -0700, Azael Avalos wrote:
>> Recent Toshiba laptops that come with the new keyboard layout have
>> the Special Functions (hotkeys) enabled by default, which, in order to
>> access the F{1-12} keys, you need to press the FN-F{1-12} key to
>> access such key.
>>
>> This patch adds support to toggle the Keyboard Functions operation
>> mode by creating the sysfs entry "kbd_functions_keys", accepting only
>> two parameters, 0 to set the "Normal Operation" mode and 1 to set the
>> "Special Functions" mode, however, everytime the mode is toggled, a
>> restart is needed.
>
> Erm... that's kinda horrible :-/
>
> A couple of questions then.
>
> 1) Does the system BIOS offer a way to select one mode or the other? If so, no
> point in adding it here if a reboot is required.

Yes, I just wanted to make the driver on Linux on par with its Windows
counterpart.

>
> 2) Where Toshiba supports this (Windows?) is a reboot required?

Windows 7 and up, and yes, a reboot is required on Windows too.

>
> Rather than having to reboot, would a userspace mapping possibly be preferable?
> Could be done without a reboot.

Nope, it sets some value into a BIOS variable (register?), not even
unloading/loading
the module helps.

>
> Finally, if we keep this, we need to print something to the system log
> indicating success - and that a reboot is required to take effect.

Sure, that's no problem, its your call to keep it or drop it, just let me know
as to send an updated version.

>
> --
> Darren Hart
> Intel Open Source Technology Center

Cheers
Azael



-- 
-- El mundo apesta y vosotros apestais tambien --
