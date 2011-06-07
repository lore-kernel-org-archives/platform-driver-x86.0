From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 23/25] sony-laptop: add ALS support
Date: Wed, 8 Jun 2011 07:39:14 +0900
Message-ID: <20110607223912.GB10612@kamineko.org>
References: <4DE93AC0.3000506@absence.it>
 <20110605053110.GA21142@kamineko.org>
 <4DEC0186.5010209@absence.it>
 <BANLkTi=szZifnDJcfkDJpxcEuL+FY2B5iA@mail.gmail.com>
 <20110606130802.GB30602@kamineko.org>
 <4DECDB72.9050909@absence.it>
 <20110606222405.GA32602@kamineko.org>
 <4DED620E.60209@absence.it>
 <20110607160738.GB4087@kamineko.org>
 <4DEE64EB.8010309@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:55354 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750899Ab1FGWjU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jun 2011 18:39:20 -0400
Received: by pvg12 with SMTP id 12so1093595pvg.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2011 15:39:19 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DEE64EB.8010309@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Javier Achirica <achirica@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Tue, Jun 07, 2011 at 07:50:35PM +0200, Marco Chiappero wrote:
> Il 07/06/2011 18:07, Mattia Dongili ha scritto:
> >How do you coordinate different policies, one trying to increase and one
> >trying to decrease brightness?
> 
> It depends on the purpose, if I just want to lower the brightness
> when I'm not in front of the notebook, I just do it, it doesn't
> conflict with the power saving options or the ambient light level.
> If I just want to write a shortcut that rises a bit the backlight
> level before calling my favorite video player I can do it, nothing
> is broken.
> 
> >Or even, say you have two sony-acpid-like applications working with
> >different policies,
> 
> This makes no sense at all.
> 
> >Do you see where I'm going?
> 
> To a perfect design it's not there, with other side effects, that is

not really. You're stripping my mails a lot...
I'm trying to demonstrate that the way you solved the multiple
brightness writers problem would not work or at least that your solution
as the same problem as the original issue.
Making the acpi_video sysfs nodes ineffective and creating an alternate
custom backlight regulation entry makes no sense and is a workaround
that is not needed.

[reshuffling the discussion a bit to bring pieces together]
> >>Right, but how can you be sure when you have a backlight device that
> >>can be accessed by anything?
> >
> >I'm not following you here. Sure about what? Also, is als_backlight only
> >accessible to a few privileged ones?
> 
> No, but what is supposed to use it?

anything can use it. The fact that for now there is only your deamon
using it doesn't mean that nothing else can use it. It's exactly the
same situation you have with the standard acpi video backlight
regulation where you say above you cannot be sure.

> >I don't see how presenting illumination data and correction factors and
> >giving a way to change lid backlight is such an unreasonable request.
> 
> This is not an unreasonable request, and sony-acpid is exactly doing that.
> Your request is to clone sony-acpid and merge it into every
> available DE (which still means that the "unification" or
> "interface" purpose is broken, because userspace have to know
> hardware/model specific details).

like what? if correction factors are provided what else is missing?
Do you also really think that DEs would not try to integrate the
function that sony-acpid is providing in their own framework?

...
> >>Please specify "interaction/integration part". There is almost
> >>nothing to be removed if you want code that makes sense and
> >>something working, if you specify a particular function I'll try to
> >>remove it, if it is feasible, otherwise be more specific, please.
> >
> >I'd just like to see just the ALS driver in one patch, all the
> >managed/backlight stuff in another.
> 
> Conceptually there are two drivers... that said, do you mean any
> attribute with "all" and "stuff"? Splitting the patch will require a
> certain amount of work and will result in a broken patch. I'll try
> to do it, but I don't have much free time at the moment and I prefer
> to work on patches that have a chance to be included soon.

actually having the two separate would make merging at least some of the
patch easier. I'm fine with the ALS driver (i.e. all the als_device_ops
and als_lux/power/kelvin) part. The whole als_backlight/managed mode I
wouldn't want to see merged as is. As I said before, I think we should
always set managed mode and intercept the GPE notifications sending an
(u?)event to userspace backlight changes and just chainging the
backlight when the user writes to
/sys/class/backlight/acpi_video/brightness.
A fine grained control is already provided with acpi_backlight=vendor,
potentially we could ask the acpi people to not take the device for
specific models or anyway a way to force the vendor driver to take over
backlight regulation without the need for a kernel parameter.

-- 
mattia
:wq!
