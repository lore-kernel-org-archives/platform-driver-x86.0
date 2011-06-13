From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 4/25] sony-laptop: new SNC setup and cleanup functions
Date: Mon, 13 Jun 2011 16:10:45 +0200
Message-ID: <4DF61A65.3000804@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE8FE7B.6090602@absence.it> <20110612222123.GB31095@kamineko.org> <4DF55356.9020405@absence.it> <09bbad4b23cc0747ac2ab6dcd232c3d4.squirrel@picard.linux.it> <4DF5DABD.50505@absence.it> <20110613134251.GA6119@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa012-1msr.fastwebnet.it ([62.101.93.132]:34898 "EHLO
	aa012-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752403Ab1FMOKv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Jun 2011 10:10:51 -0400
In-Reply-To: <20110613134251.GA6119@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 13/06/2011 15:42, Mattia Dongili ha scritto:

>>>>> I'd rather not have
>>>>> this check here.
>>>>
>>>> Avoiding this check here seems a logical error to me: it's basically the
>>>> entry point (and the first thing to look at when calling the setup
>>>> method SN00), maybe revealing info about the device and the action to be
>>>> taken about this device, I can't see why we'd better skip this step,
>>>> that doesn't hurt, just because at the moment almost every notebook
>>>> won't fail.
>>>
>>> the string never changes and there seems to be no logic associated to it
>>> in the DSDT.
>>
>> Well, maybe. Or maybe not. Every year lots of new models are
>> launched, and every model comes with it... why should they bring a
>
> Apparently not. Vaio Y doesn't have that string hardcoded in the DSDT.

Interesting, may I see such DSDT file?
It seem to fall into the case "if it removed and nothing changes, well, 
we have the proof that this string is not relevant for Sony too". 
However I'm still doubtful: why to remove it on just a single model if 
it's no longer necessary? Have you ever seen other models without that 
string?

> Again, not initializing the driver because a string doesn't match
> SncSupported seems wrong. Especially given that if the string is there
> or not makes no difference to us.

This is the point that I was trying to explain: are we sure? How can we 
be sure? If we are not sure, IMHO, we should add a check, just for 
safety, but I'd investigate before deciding (I have just a few DSDTs 
though). BTW, is the sole 0x53636E53 "substring" changing among 
different models? is it 0x73636E73 ("sncs" instead of "SncS")?

> On the other hand I have nothing against fetching the string value
> and printing some debug statement if really we can't just ignore it.

Ok ok... well, it wouldn't matter anymore even though it might mostly 
act as SNC "documentation" (we know what it means but we don't need it).
