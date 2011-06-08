From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 23/25] sony-laptop: add ALS support
Date: Wed, 08 Jun 2011 11:52:43 +0200
Message-ID: <4DEF466B.4010304@absence.it>
References: <4DE93AC0.3000506@absence.it> <20110605053110.GA21142@kamineko.org> <4DEC0186.5010209@absence.it> <BANLkTi=szZifnDJcfkDJpxcEuL+FY2B5iA@mail.gmail.com> <20110606130802.GB30602@kamineko.org> <4DECDB72.9050909@absence.it> <20110606222405.GA32602@kamineko.org> <4DED620E.60209@absence.it> <20110607160738.GB4087@kamineko.org> <4DEE64EB.8010309@absence.it> <20110607223912.GB10612@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa012-1msr.fastwebnet.it ([62.101.93.132]:50778 "EHLO
	aa012-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751289Ab1FHJwu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jun 2011 05:52:50 -0400
In-Reply-To: <20110607223912.GB10612@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Javier Achirica <achirica@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 08/06/2011 00:39, Mattia Dongili ha scritto:
>>> Do you see where I'm going?
>>
>> To a perfect design it's not there, with other side effects, that is
>
> not really.

Yeah, because it's not perfect at all...

> You're stripping my mails a lot...

Because there is no need to have tons of useless words in every mail. 
But if it's important for you, because you're unable to tell exactly 
where what's working and what's not, just cut and paste the "relevant" 
parts.

> I'm trying to demonstrate

absolutely nothing, apart being annoying.

> that the way you solved the multiple
> brightness writers problem would not work or at least that your solution
> as the same problem as the original issue.

I have my notebook here demonstrating that you are wrong, so, please, 
stop insisting. Once again, if you don't like the patch (for whatever 
reason), drop it and everything will be just fine. But stop insisting 
with wrong argumentations.

> Making the acpi_video sysfs nodes ineffective and creating an alternate
> custom backlight regulation entry makes no sense and is a workaround
> that is not needed.

Not quite right: those nodes will be always working while the 
autodimming feature is disabled, while when the feature is enabled they 
will work with the help of the daemon (they will always be effective).
That said, it makes a lot of sense (if you can't understand it, I'm 
sorry for you), I agree that it would be better not to have it (but it's 
the only downside and it's not that bad - but this doesn't seem to be 
relevant to you -), but has a lot of sense, and will make everything 
working in a much cleaner way than the one you're proposing, which comes 
with other drawbacks.

> [reshuffling the discussion a bit to bring pieces together]
>>>> Right, but how can you be sure when you have a backlight device that
>>>> can be accessed by anything?
>>>
>>> I'm not following you here. Sure about what? Also, is als_backlight only
>>> accessible to a few privileged ones?
>>
>> No, but what is supposed to use it?
>
> anything can use it. The fact that for now there is only your deamon
> using it doesn't mean that nothing else can use it. It's exactly the
> same situation you have with the standard acpi video backlight
> regulation where you say above you cannot be sure.

Not at all, because a backlight device is a standar interface known to 
everybody, while als_backlight is not (yes, it is relevant). Please, 
tell me, does, for example, gnome-power-manager use 
/sys/class/backlight/ or /sys/devices/platform/sony-laptop? No. So, 
again, please stop insisting with your pointless objections. The only 
thing you're demonstrating is that you had a different idea (that would 
be fine on different hardware, but not this one), no matter if it has 
downsides, no matter if this requires everything else to change, you had 
that idea and you refuse any other idea because it's not your idea. And 
you can't accept that someone else does not agree with your idea, 
otherwise you would not continue to try to demonstrate absolutely 
nothing, to tell that I don't see the problem and other pointless stuff 
about the top and the bottom. Nonetheless, it is fine, just say you 
don't like the patch and reject it. Stop.
I won't reply anymore about this, I've already explained a lot, I have 
no time to waste.

>>> I don't see how presenting illumination data and correction factors and
>>> giving a way to change lid backlight is such an unreasonable request.
>>
>> This is not an unreasonable request, and sony-acpid is exactly doing that.
>> Your request is to clone sony-acpid and merge it into every
>> available DE (which still means that the "unification" or
>> "interface" purpose is broken, because userspace have to know
>> hardware/model specific details).
>
> like what? if correction factors are provided what else is missing?
> Do you also really think that DEs would not try to integrate the
> function that sony-acpid is providing in their own framework?

DEs don't even have generic als support and are model agnostic, why 
should they all add and maintain (very) model specific code [1] in their 
programs? Are you sure they will? It makes no sense, we can have this 
code in a single place, with a really small daemon that will make the 
autodimming working even with no DE at all, and that will be installed 
only on machines that really need it. Far better than your "solution".

>>>> Please specify "interaction/integration part". There is almost
>>>> nothing to be removed if you want code that makes sense and
>>>> something working, if you specify a particular function I'll try to
>>>> remove it, if it is feasible, otherwise be more specific, please.
>>>
>>> I'd just like to see just the ALS driver in one patch, all the
>>> managed/backlight stuff in another.
>>
>> Conceptually there are two drivers... that said, do you mean any
>> attribute with "all" and "stuff"? Splitting the patch will require a
>> certain amount of work and will result in a broken patch. I'll try
>> to do it, but I don't have much free time at the moment and I prefer
>> to work on patches that have a chance to be included soon.
>
> actually having the two separate would make merging at least some of the
> patch easier.

As you like, but it makes no sense to merge something that will be useless.

> I'm fine with the ALS driver (i.e. all the als_device_ops
> and als_lux/power/kelvin) part. The whole als_backlight/managed mode I
> wouldn't want to see merged as is. As I said before, I think we should
> always set managed mode and intercept the GPE notifications sending an
> (u?)event to userspace backlight changes and just chainging the
> backlight when the user writes to
> /sys/class/backlight/acpi_video/brightness.
> A fine grained control is already provided with acpi_backlight=vendor,
> potentially we could ask the acpi people to not take the device for
> specific models or anyway a way to force the vendor driver to take over
> backlight regulation without the need for a kernel parameter.

To sum up your idea: quirks everywhere. Quirks for the backlight device 
(with a long list of models to be specified, that is likely to grow over 
the time), quirks everywhere in userspace with duplicated and hard to 
maintain code, ALS events always generated (I guess ignored when the 
user do not want the autodimming feature, which is very clean...). No, 
it does seem no way better to me. Everything else should change 
(worsening) just to let you have your design realized and make 
sony-laptop look good. We have a much smaller, cleaner and less invasive 
solution, that only partially affects sony-laptop and sony-laptop only. 
And we can have it now while now (we will see in the future if changes 
are possible) there is no other better solution.
In the end, take your decision, there is nothing more to say.


[1] they should detect the model type and use a specific parameter set 
with a specific formula.
