From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 01/14] ACPI / Video: blacklist some samsung laptops
Date: Tue, 20 Mar 2012 17:28:06 +0100
Message-ID: <CAHR064gLwW32y511tAEf4x59QEaWQzy-i=K7jF8YYC3GS4JHow@mail.gmail.com>
References: <1332233594-13099-1-git-send-email-corentin.chary@gmail.com>
	<1332233594-13099-2-git-send-email-corentin.chary@gmail.com>
	<20120320160537.GB6192@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:40452 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030677Ab2CTQ2I (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 20 Mar 2012 12:28:08 -0400
In-Reply-To: <20120320160537.GB6192@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 20, 2012 at 5:05 PM, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> On Tue, Mar 20, 2012 at 09:53:01AM +0100, Corentin Chary wrote:
>> From: Corentin Chary <corentincj@iksaif.net>
>>
>> On these laptops, the ACPI video is not functional, and very unlikely
>> to be fixed by the vendor. Note that intel_backlight works for some
>> of these laptops, and the backlight from samsung-laptop always work.
>>
>> The good news is that newer laptops have functional ACPI video device
>> and won't end up growing this list.
>
> Are the hotkeys delivered via ACPI or via the Samsung device? If the
> latter, you can just do unregister_acpi_video() instead in the samsung
> driver and avoid having more machine-specific quirks in the ACPi code.

I wasn't aware of acpi_video_unregister(). The issue with that
solution is that it makes it harder to respect acpi_video= parameter.

On these machines, the ACPI Video device is broken (I don't know how,
I don't have the hardware, I just know it doesn't work at all), and I
want the default to be acpi_backlight=vendor, but it is still a good
idea to let users force acpi_backlight=video.

But if the policy is to use acpi_video_unregister() when the video
module is known to be broken, let's do that.

-- 
Corentin Chary
http://xf.iksaif.net
