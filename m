From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 23/25] sony-laptop: add ALS support
Date: Wed, 8 Jun 2011 01:07:39 +0900
Message-ID: <20110607160738.GB4087@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE93AC0.3000506@absence.it>
 <20110605053110.GA21142@kamineko.org>
 <4DEC0186.5010209@absence.it>
 <BANLkTi=szZifnDJcfkDJpxcEuL+FY2B5iA@mail.gmail.com>
 <20110606130802.GB30602@kamineko.org>
 <4DECDB72.9050909@absence.it>
 <20110606222405.GA32602@kamineko.org>
 <4DED620E.60209@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:42476 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751164Ab1FGQHu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jun 2011 12:07:50 -0400
Received: by ewy4 with SMTP id 4so1787265ewy.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2011 09:07:48 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DED620E.60209@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Javier Achirica <achirica@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Tue, Jun 07, 2011 at 01:26:06AM +0200, Marco Chiappero wrote:
> Il 07/06/2011 00:24, Mattia Dongili ha scritto:
> >>sony-acpid is already doing this without listening for key events
> >>(we can do that but we miss any other different backlight correction
> >>otherwise).
> >
> >how many sources of backlight changes do you have?
> 
> Potentially many, user keys, power saving options, proximity
> sensors, als, etc. and any other user defined (eg. low backlight
> setting when compiling software).
> 
> >A system should have
> >only one application trying to control the backlight, having more than
> >one is asking for trouble in the first place.
> 
> But it is not when using sony-acpid.

How do you coordinate different policies, one trying to increase and one
trying to decrease brightness?
Or even, say you have two sony-acpid-like applications working with
different policies, how do you solve that? Create another backlight
sysfs file that overrules the other two?
Do you see where I'm going? I think you're trying to slove a problem at
the bottom of the stack when it should be solved at the top.

> >Also, if I echo a number to /sys/... directly I would expect that to be
> >applied no matter what and without any magic correction going on.
> 
> Again another wrong assumption, IMO: if the user enables the
> autodimming feature everything should follow this rule. You are
> saying is that if you echo to sysfs, you really want to mess things
> up... really hard to believe.

possibly, I guess I just can't make my mind up about the fact that you
could set a backlight value via /sys/class/backlight/ that is not what
is going to applied.

> >>The small big issue is that not every notebook use the same LCD
> >>panel, so, in theory, different calculations are required (and this
> >>also the reason why a model specific parameter list is also provided
> >>by every Vaio notebook too). A single suboptimal formula for
> >>everybody is not likely to provide satisfactory results.
> >
> >this is something else that should be thought of presenting in a unified
> >way to userspace.
> 
> Frankly, I cannot see how, especially right now... We have some
> hardware designed in a certain way that allows to be used only in
> that way, small changes are possible, but I really doubt that what
> you are asking for is possible.

I don't see how presenting illumination data and correction factors and
giving a way to change lid backlight is such an unreasonable request.
Why do you think is not possible with als chips you find on vaios?

...
> >the backlight change request is initiated in userspace already,
> 
> Right, but how can you be sure when you have a backlight device that
> can be accessed by anything?

I'm not following you here. Sure about what? Also, is als_backlight only
accessible to a few privileged ones?

> >So again, can you split the patch in two so that we have the driver in
> >one patch and the interaction/integration part in another?
> 
> Please specify "interaction/integration part". There is almost
> nothing to be removed if you want code that makes sense and
> something working, if you specify a particular function I'll try to
> remove it, if it is feasible, otherwise be more specific, please.

I'd just like to see just the ALS driver in one patch, all the
managed/backlight stuff in another.

PS: to tell you the truth, I think the way Sony implemented all this
autodimming idea is just a clever workaround with limitations and
constraints they find in Windows where I guess they couldn't strip off
some of the standard acpi components. It has nothing to do with
hardware.
-- 
mattia
:wq!
