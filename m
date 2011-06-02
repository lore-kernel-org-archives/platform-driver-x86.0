From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] dell-laptop: support synaptics touchpad led
Date: Thu, 2 Jun 2011 11:18:48 +0800
Message-ID: <BANLkTimFgFt16iHKRNk2K2gXB=LeXA4KSw@mail.gmail.com>
References: <1306917288-8531-1-git-send-email-acelan.kao@canonical.com>
	<20110601133155.GA5215@srcf.ucam.org>
	<BANLkTi=LByUkAL6WKCMYtY2dDJ8xi0xk7g@mail.gmail.com>
	<BANLkTikhqHsbb4zxo_yWbzZaqTakMx+w6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:61408 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752019Ab1FBDSu convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jun 2011 23:18:50 -0400
Received: by qyg14 with SMTP id 14so224247qyg.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jun 2011 20:18:49 -0700 (PDT)
In-Reply-To: <BANLkTikhqHsbb4zxo_yWbzZaqTakMx+w6g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chris Bagwell <chris@cnpbagwell.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Matthew,

We had two project with different touchpad chips, and confirmed with
ODM that the low level implementation are same.
So, the code could work on Synaptics and ALPS chip.

2011/6/2 Chris Bagwell <chris@cnpbagwell.com>:
> On Wed, Jun 1, 2011 at 8:30 PM, AceLan Kao <acelan.kao@canonical.com>=
 wrote:
>> Mattew,
>>
>> Dell tells us that they will use the same touchpad chip for their pr=
oducts,
>> with the same touchpad LED layout, so I place the code in the dell-l=
aptop.
>> And F22 already map to enable/disable touchpad in X, BIOS and synapt=
ics driver
>> do nothing for this event, and my code only turns on/off the touchpa=
d LED,
>> not enable/disable the touchpad.
>
> X has recently (last year or less) cleaned these key definitions up a
> little. =A0F21 is defined to toggle touchpad on/off and F22 forces
> touchpad ON and F23 forces touchpad OFF (XF86TouchpadToggle,
> XF86TouchpadOn, and XF86TouchpadOff respectively).
>
> The 2.x version of Gnome released right before 3.0 understood this
> mapping. =A0I'm trying to track down why Gnome 3 doesn't treat F21 as
> toggle though.

Yes, I noticed that F21~F23 keys changed, but F22 works for my
environment(Ubuntu Natty) now.
I'll test it again on Ubuntu Oneiric to see if the new keys take
actions of the function, then I'll do the modification.

>
>>
>> BIOS should manage this kind of action to enable/disable touchpad an=
d the LED,
>> but Dell doesn't want to modify their BIOS to do that, since the
>> touchpad driver of
>> MS Windows manages to enable/disable touchpad and the LED by themsel=
ves,
>> so Linux should do the same thing as Windows does.
>>
>> That's why we need those code and why I think dell-laptop is a good
>> place for them.
>
> If you can send F22/F23 to match LED and using matching X then I thin=
k
> you can get window's behaviour.
>
> Sorry, I don't have ready access to version of dell-laptop where it
> understands KEY_F22 to see how easy it is to make that change.


Best regards,
AceLan Kao.

--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
