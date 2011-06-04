From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 19/25] sony-laptop: add touchpad enable/disable control
 file
Date: Sat, 04 Jun 2011 03:54:22 +0200
Message-ID: <4DE9904E.7050805@absence.it>
References: <4DE8FC4A.9010401@absence.it> <201106031400.36141.dmitry.torokhov@gmail.com> <4DE9563F.9010503@absence.it> <201106031512.38349.dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:43909 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752308Ab1FDBy3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 21:54:29 -0400
In-Reply-To: <201106031512.38349.dmitry.torokhov@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Il 04/06/2011 00:12, Dmitry Torokhov ha scritto:
> The quirk is that for given device there is a sysfs attribute somewhere
> that one can write something into to turn the touchpad off.

Once again, let's have a single unified interface. Are you saying that 
the GNU world is not able to do that?

>> This is false, especially for (so many) people using Windows too, where
>> the feature is clearly visible by the OEM software.
>
> Thankfully OEM software either does not exist or is not widespread on
> Linux.

But the point is not to clone the OEM software (but we need to do it 
when there is nothing else), we do want to clone the functionality only, 
people just want to make that (well, every) hardware feature available 
under linux. Saying that X offers a workaround is, IMHO, a fail. Once 
again: the feature is known, OEM software has nothing to do with it.

> No, I indeed can not speak for everybody, but it is my belief that this
> feature in the form it is implemented will not be widely used.

That's your belief... sorry, but after paying 1300 Eur for a laptop I 
don't care about your belief, I'd like to see my laptop fully supported, 
since we can do it.

> No, it's like saying railroad tracks should be unified instead of every
> country inventing their own size. We all know how helpful it was.

No, at all, that is what I was saying. Again, let's create a common 
interface.

>> It's a common and widespread feature, let's support it better instead of
>> just removing it.
>
> What is the feature again? What do users really want to do here?

Have their touchpad disabled, and have it disabled when using either 
windows or linux. That's what the user payed for.
Discussing what the user should be interested in, whether a real power 
saving is achievable or not, is a totally wrong starting point, it's not 
your own business.
