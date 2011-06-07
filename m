From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 23/25] sony-laptop: add ALS support
Date: Tue, 07 Jun 2011 19:50:35 +0200
Message-ID: <4DEE64EB.8010309@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE93AC0.3000506@absence.it> <20110605053110.GA21142@kamineko.org> <4DEC0186.5010209@absence.it> <BANLkTi=szZifnDJcfkDJpxcEuL+FY2B5iA@mail.gmail.com> <20110606130802.GB30602@kamineko.org> <4DECDB72.9050909@absence.it> <20110606222405.GA32602@kamineko.org> <4DED620E.60209@absence.it> <20110607160738.GB4087@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:51172 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754349Ab1FGRul (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jun 2011 13:50:41 -0400
In-Reply-To: <20110607160738.GB4087@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Javier Achirica <achirica@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 07/06/2011 18:07, Mattia Dongili ha scritto:
> How do you coordinate different policies, one trying to increase and one
> trying to decrease brightness?

It depends on the purpose, if I just want to lower the brightness when 
I'm not in front of the notebook, I just do it, it doesn't conflict with 
the power saving options or the ambient light level. If I just want to 
write a shortcut that rises a bit the backlight level before calling my 
favorite video player I can do it, nothing is broken.

> Or even, say you have two sony-acpid-like applications working with
> different policies,

This makes no sense at all.

> Do you see where I'm going?

To a perfect design it's not there, with other side effects, that is 
likely to behave worse and arrive too late? I comprehend that the 
"unification" purpose is totally broken here and so on, but if you don't 
like this design, just drop this patch. I have nothing to say against 
better designs that works as good as this solution (yes, it works very 
good), but everything else is lacking and I doubt it to be possible, at 
least with certain models... maybe with some other models in the future, 
especially if an ACPI compliant sensor will be exposed. When everything 
will be ready and any issue solved...

>> Again another wrong assumption, IMO: if the user enables the
>> autodimming feature everything should follow this rule. You are
>> saying is that if you echo to sysfs, you really want to mess things
>> up... really hard to believe.
>
> possibly,

No way. Just an example: you set the backlight level to the minimum, 
then 2 seconds later there is an ambient light change and your setting 
is overwritten. It makes no sense to write directly to the "raw" 
backlight device when a potentially continuous regulation is present, 
you'll never want. You'd disable the autodimming feature, instead.

>>>> The small big issue is that not every notebook use the same LCD
>>>> panel, so, in theory, different calculations are required (and this
>>>> also the reason why a model specific parameter list is also provided
>>>> by every Vaio notebook too). A single suboptimal formula for
>>>> everybody is not likely to provide satisfactory results.
>>>
>>> this is something else that should be thought of presenting in a unified
>>> way to userspace.
>>
>> Frankly, I cannot see how, especially right now... We have some
>> hardware designed in a certain way that allows to be used only in
>> that way, small changes are possible, but I really doubt that what
>> you are asking for is possible.
>
> I don't see how presenting illumination data and correction factors and
> giving a way to change lid backlight is such an unreasonable request.

This is not an unreasonable request, and sony-acpid is exactly doing that.
Your request is to clone sony-acpid and merge it into every available DE 
(which still means that the "unification" or "interface" purpose is 
broken, because userspace have to know hardware/model specific details).

>> Right, but how can you be sure when you have a backlight device that
>> can be accessed by anything?
>
> I'm not following you here. Sure about what? Also, is als_backlight only
> accessible to a few privileged ones?

No, but what is supposed to use it?

>> Please specify "interaction/integration part". There is almost
>> nothing to be removed if you want code that makes sense and
>> something working, if you specify a particular function I'll try to
>> remove it, if it is feasible, otherwise be more specific, please.
>
> I'd just like to see just the ALS driver in one patch, all the
> managed/backlight stuff in another.

Conceptually there are two drivers... that said, do you mean any 
attribute with "all" and "stuff"? Splitting the patch will require a 
certain amount of work and will result in a broken patch. I'll try to do 
it, but I don't have much free time at the moment and I prefer to work 
on patches that have a chance to be included soon.

> PS: to tell you the truth, I think the way Sony implemented all this
> autodimming idea is just a clever workaround with limitations and
> constraints they find in Windows where I guess they couldn't strip off
> some of the standard acpi components.

To tell you the truth, I already thought of that... it might be true, 
but it's not that relevant since we cannot change the DSDT code.

> It has nothing to do with
> hardware.

Well, I do consider both a physical connection between the ALS and the 
EC and the BIOS code part of the hardware. I've never said that 
different hardware designs are not possible, I just said that "We have 
some hardware designed in a certain way that allows to be used only in 
that way".
