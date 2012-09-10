From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: samsung-laptop: light sensor?
Date: Mon, 10 Sep 2012 13:49:13 +0100
Message-ID: <CAHR064i-MCRDZ9y6FqTkR=j4kFZPVCyqf8BugV1KBPo1PMbyDQ@mail.gmail.com>
References: <504CEE8B.9070905@ahsoftware.de>
	<CAHR064iz1BTP71FMVb_3vYpx0+Jg9v56oZqMfJnu7K__mFO4Ng@mail.gmail.com>
	<504DCA80.7040305@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:63203 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757856Ab2IJMtO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 10 Sep 2012 08:49:14 -0400
Received: by qaas11 with SMTP id s11so842263qaa.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Sep 2012 05:49:14 -0700 (PDT)
In-Reply-To: <504DCA80.7040305@ahsoftware.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alexander Holler <holler@ahsoftware.de>
Cc: platform-driver-x86@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>

On Mon, Sep 10, 2012 at 12:09 PM, Alexander Holler <holler@ahsoftware.de> wrote:
> Am 10.09.2012 11:27, schrieb Corentin Chary:
>> On Sun, Sep 9, 2012 at 8:31 PM, Alexander Holler <holler@ahsoftware.de> wrote:
>>> Hello,
>>>
>>> I'm searching some information about how to read the values from the
>>> light sensor found on some Samsung laptops.
>>>
>>> Does anyone have any information about how to access the light sensor?
>>> If I would find such information, I would (try) to write a driver (or
>>> enhance samsung-laptop), at least to read the values and maybe something
>>> to adjust the keyboard- and/or the lcd-backlight (on startup and maybe
>>> dynamically at runtime).
>>>
>>> Regards,
>>>
>>> Alexander
>>
>> Hello Alexander,
>> The light sensor can be used (on mine at least), but nobody had the
>> time to write (rebase) the driver for it.
>> Check these discussions:
>> http://search.gmane.org/?query=ACPI+light+sensor&group=gmane.linux.acpi.devel
>>
>> Basically, it's a standard ACPI light sensor, there was a driver for
>> it, but it should use another subsystem, and nobody did the work so
>
> Thanks a lot for that hint. I've just booted an 3.5.3:
> ----
> laptopah ~ # cat /sys/class/als/acpi_als0/illuminance
> 3230
> ----

Even better, in the last versions of the patches (v6 or something)
there was something (don't remember the name of the file) that could
be directly wirtten to backlight brightness file.

> Only a few modifications on the 2 patches from Zhang Rui were necessary
> to build the driver for the als-acpi-device.
>
>> far :). I'll happy to review if you have the time to do that.
>
> I will have a look at the threads for those 2 patches and will check if
> I can modify those patches for a next try for inclusion into the
> mainline kernel (in the next weeks, as I will find time, I'm new to the
> acpi-stuff in the kernel).

Take a look at "acpi als iio" on the mailing list to know what have to be done !




-- 
Corentin Chary
http://xf.iksaif.net
