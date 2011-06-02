From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] dell-laptop: support synaptics touchpad led
Date: Thu, 2 Jun 2011 09:30:56 +0800
Message-ID: <BANLkTi=LByUkAL6WKCMYtY2dDJ8xi0xk7g@mail.gmail.com>
References: <1306917288-8531-1-git-send-email-acelan.kao@canonical.com>
	<20110601133155.GA5215@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:64312 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753328Ab1FBBa5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jun 2011 21:30:57 -0400
Received: by qwk3 with SMTP id 3so173540qwk.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jun 2011 18:30:56 -0700 (PDT)
In-Reply-To: <20110601133155.GA5215@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

Mattew,

Dell tells us that they will use the same touchpad chip for their products,
with the same touchpad LED layout, so I place the code in the dell-laptop.
And F22 already map to enable/disable touchpad in X, BIOS and synaptics driver
do nothing for this event, and my code only turns on/off the touchpad LED,
not enable/disable the touchpad.

BIOS should manage this kind of action to enable/disable touchpad and the LED,
but Dell doesn't want to modify their BIOS to do that, since the
touchpad driver of
MS Windows manages to enable/disable touchpad and the LED by themselves,
so Linux should do the same thing as Windows does.

That's why we need those code and why I think dell-laptop is a good
place for them.

Best regards,
AceLan Kao.

2011/6/1 Matthew Garrett <mjg59@srcf.ucam.org>:
> On Wed, Jun 01, 2011 at 04:34:48PM +0800, AceLan Kao wrote:
>> The TP-LOCK-LED would bright while TP-disablement.
>> You can implement 97 command services routing of P/S2 device.
>> Code like below:
>> out 0x64,0x97 ;set 0x97 to command port;0x64 is command port
>> out 0x60,0x01 ;set 0x01 to data port then make LED bright;0x60 is data port
>> out 0x60,0x02 ;set 0x02 to data port then make LED dark
>>
>> Before you send the action to the port, you must make sure the Input buffer
>> is empty (port 0x64).
>
> NAK - you're sending commands to the touchpad. The code for that needs
> to live in the touchpad driver, not dell-laptop (what happens if these
> commands are sent to different types of touchpad?). The scancode needs
> to be mapped to an appropriate keycode and userspace needs to tie them
> together.
>
> --
> Matthew Garrett | mjg59@srcf.ucam.org
>



-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
