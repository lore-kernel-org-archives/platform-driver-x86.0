From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 23/25] sony-laptop: add ALS support
Date: Tue, 07 Jun 2011 01:26:06 +0200
Message-ID: <4DED620E.60209@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE93AC0.3000506@absence.it> <20110605053110.GA21142@kamineko.org> <4DEC0186.5010209@absence.it> <BANLkTi=szZifnDJcfkDJpxcEuL+FY2B5iA@mail.gmail.com> <20110606130802.GB30602@kamineko.org> <4DECDB72.9050909@absence.it> <20110606222405.GA32602@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:36350 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751780Ab1FFX0M (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 6 Jun 2011 19:26:12 -0400
In-Reply-To: <20110606222405.GA32602@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Javier Achirica <achirica@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 07/06/2011 00:24, Mattia Dongili ha scritto:
>> sony-acpid is already doing this without listening for key events
>> (we can do that but we miss any other different backlight correction
>> otherwise).
>
> how many sources of backlight changes do you have?

Potentially many, user keys, power saving options, proximity sensors, 
als, etc. and any other user defined (eg. low backlight setting when 
compiling software).

> A system should have
> only one application trying to control the backlight, having more than
> one is asking for trouble in the first place.

But it is not when using sony-acpid.

> Also, if I echo a number to /sys/... directly I would expect that to be
> applied no matter what and without any magic correction going on.

Again another wrong assumption, IMO: if the user enables the autodimming 
feature everything should follow this rule. You are saying is that if 
you echo to sysfs, you really want to mess things up... really hard to 
believe.

>> The small big issue is that not every notebook use the same LCD
>> panel, so, in theory, different calculations are required (and this
>> also the reason why a model specific parameter list is also provided
>> by every Vaio notebook too). A single suboptimal formula for
>> everybody is not likely to provide satisfactory results.
>
> this is something else that should be thought of presenting in a unified
> way to userspace.

Frankly, I cannot see how, especially right now... We have some hardware 
designed in a certain way that allows to be used only in that way, small 
changes are possible, but I really doubt that what you are asking for is 
possible.

> The entire idea of platform drivers is to enable and
> unify how platform specific features are handled.

Sure, whenever possible.

> Having each one of
> them diverge to its own custom interface defeats the whole purpose.

I know, it depends on whether the "hardware support" purpose come first 
or not. If it doesn't, the patch have to be rejected, but I think that a 
poor hardware support will take users away from linux on these devices.

> the backlight change request is initiated in userspace already,

Right, but how can you be sure when you have a backlight device that can 
be accessed by anything?

> So again, can you split the patch in two so that we have the driver in
> one patch and the interaction/integration part in another?

Please specify "interaction/integration part". There is almost nothing 
to be removed if you want code that makes sense and something working, 
if you specify a particular function I'll try to remove it, if it is 
feasible, otherwise be more specific, please.
