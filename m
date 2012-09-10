From: Alexander Holler <holler@ahsoftware.de>
Subject: Re: samsung-laptop: light sensor?
Date: Mon, 10 Sep 2012 13:09:52 +0200
Message-ID: <504DCA80.7040305@ahsoftware.de>
References: <504CEE8B.9070905@ahsoftware.de> <CAHR064iz1BTP71FMVb_3vYpx0+Jg9v56oZqMfJnu7K__mFO4Ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from h1446028.stratoserver.net ([85.214.92.142]:51960 "EHLO
	mail.ahsoftware.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757174Ab2IJLKH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 10 Sep 2012 07:10:07 -0400
Received: from eiche.ahsoftware (p57B20CDD.dip0.t-ipconnect.de [87.178.12.221])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.ahsoftware.de (Postfix) with ESMTPSA id 021AF8880EE
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Sep 2012 13:10:04 +0200 (CEST)
In-Reply-To: <CAHR064iz1BTP71FMVb_3vYpx0+Jg9v56oZqMfJnu7K__mFO4Ng@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>

Am 10.09.2012 11:27, schrieb Corentin Chary:
> On Sun, Sep 9, 2012 at 8:31 PM, Alexander Holler <holler@ahsoftware.de> wrote:
>> Hello,
>>
>> I'm searching some information about how to read the values from the
>> light sensor found on some Samsung laptops.
>>
>> Does anyone have any information about how to access the light sensor?
>> If I would find such information, I would (try) to write a driver (or
>> enhance samsung-laptop), at least to read the values and maybe something
>> to adjust the keyboard- and/or the lcd-backlight (on startup and maybe
>> dynamically at runtime).
>>
>> Regards,
>>
>> Alexander
> 
> Hello Alexander,
> The light sensor can be used (on mine at least), but nobody had the
> time to write (rebase) the driver for it.
> Check these discussions:
> http://search.gmane.org/?query=ACPI+light+sensor&group=gmane.linux.acpi.devel
> 
> Basically, it's a standard ACPI light sensor, there was a driver for
> it, but it should use another subsystem, and nobody did the work so

Thanks a lot for that hint. I've just booted an 3.5.3:
----
laptopah ~ # cat /sys/class/als/acpi_als0/illuminance
3230
----

Only a few modifications on the 2 patches from Zhang Rui were necessary
to build the driver for the als-acpi-device.

> far :). I'll happy to review if you have the time to do that.

I will have a look at the threads for those 2 patches and will check if
I can modify those patches for a next try for inclusion into the
mainline kernel (in the next weeks, as I will find time, I'm new to the
acpi-stuff in the kernel).

Regards,

Alexander
