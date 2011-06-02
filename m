From: Chris Bagwell <chris@cnpbagwell.com>
Subject: Re: [PATCH] dell-laptop: support synaptics touchpad led
Date: Wed, 1 Jun 2011 21:05:23 -0500
Message-ID: <BANLkTikhqHsbb4zxo_yWbzZaqTakMx+w6g@mail.gmail.com>
References: <1306917288-8531-1-git-send-email-acelan.kao@canonical.com>
	<20110601133155.GA5215@srcf.ucam.org>
	<BANLkTi=LByUkAL6WKCMYtY2dDJ8xi0xk7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:42793 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752492Ab1FBCFY convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jun 2011 22:05:24 -0400
Received: by iwn34 with SMTP id 34so317507iwn.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jun 2011 19:05:24 -0700 (PDT)
In-Reply-To: <BANLkTi=LByUkAL6WKCMYtY2dDJ8xi0xk7g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Wed, Jun 1, 2011 at 8:30 PM, AceLan Kao <acelan.kao@canonical.com> w=
rote:
> Mattew,
>
> Dell tells us that they will use the same touchpad chip for their pro=
ducts,
> with the same touchpad LED layout, so I place the code in the dell-la=
ptop.
> And F22 already map to enable/disable touchpad in X, BIOS and synapti=
cs driver
> do nothing for this event, and my code only turns on/off the touchpad=
 LED,
> not enable/disable the touchpad.

X has recently (last year or less) cleaned these key definitions up a
little.  F21 is defined to toggle touchpad on/off and F22 forces
touchpad ON and F23 forces touchpad OFF (XF86TouchpadToggle,
XF86TouchpadOn, and XF86TouchpadOff respectively).

The 2.x version of Gnome released right before 3.0 understood this
mapping.  I'm trying to track down why Gnome 3 doesn't treat F21 as
toggle though.

>
> BIOS should manage this kind of action to enable/disable touchpad and=
 the LED,
> but Dell doesn't want to modify their BIOS to do that, since the
> touchpad driver of
> MS Windows manages to enable/disable touchpad and the LED by themselv=
es,
> so Linux should do the same thing as Windows does.
>
> That's why we need those code and why I think dell-laptop is a good
> place for them.

If you can send F22/F23 to match LED and using matching X then I think
you can get window's behaviour.

Sorry, I don't have ready access to version of dell-laptop where it
understands KEY_F22 to see how easy it is to make that change.

Chris

>
> Best regards,
> AceLan Kao.
>
> 2011/6/1 Matthew Garrett <mjg59@srcf.ucam.org>:
>> On Wed, Jun 01, 2011 at 04:34:48PM +0800, AceLan Kao wrote:
>>> The TP-LOCK-LED would bright while TP-disablement.
>>> You can implement 97 command services routing of P/S2 device.
>>> Code like below:
>>> out 0x64,0x97 ;set 0x97 to command port;0x64 is command port
>>> out 0x60,0x01 ;set 0x01 to data port then make LED bright;0x60 is d=
ata port
>>> out 0x60,0x02 ;set 0x02 to data port then make LED dark
>>>
>>> Before you send the action to the port, you must make sure the Inpu=
t buffer
>>> is empty (port 0x64).
>>
>> NAK - you're sending commands to the touchpad. The code for that nee=
ds
>> to live in the touchpad driver, not dell-laptop (what happens if the=
se
>> commands are sent to different types of touchpad?). The scancode nee=
ds
>> to be mapped to an appropriate keycode and userspace needs to tie th=
em
>> together.
>>
>> --
>> Matthew Garrett | mjg59@srcf.ucam.org
>>
>
>
>
> --
> Chia-Lin Kao(AceLan)
> http://blog.acelan.idv.tw/
> E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
