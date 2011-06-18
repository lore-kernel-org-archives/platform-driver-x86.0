From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 4/25] sony-laptop: new SNC setup and cleanup functions
Date: Sun, 19 Jun 2011 00:50:48 +0200
Message-ID: <4DFD2BC8.6060206@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE8FE7B.6090602@absence.it> <20110612222123.GB31095@kamineko.org> <4DF55356.9020405@absence.it> <09bbad4b23cc0747ac2ab6dcd232c3d4.squirrel@picard.linux.it> <4DF5DABD.50505@absence.it> <20110613134251.GA6119@kamineko.org> <4DF61A65.3000804@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:45136 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752891Ab1FRWux (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 18 Jun 2011 18:50:53 -0400
In-Reply-To: <4DF61A65.3000804@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Il 13/06/2011 16:10, Marco Chiappero ha scritto:
> Il 13/06/2011 15:42, Mattia Dongili ha scritto:
>
>>>>>> I'd rather not have
>>>>>> this check here.
>>>>>
>>>>> Avoiding this check here seems a logical error to me: it's
>>>>> basically the
>>>>> entry point (and the first thing to look at when calling the setup
>>>>> method SN00), maybe revealing info about the device and the action
>>>>> to be
>>>>> taken about this device, I can't see why we'd better skip this step,
>>>>> that doesn't hurt, just because at the moment almost every notebook
>>>>> won't fail.
>>>>
>>>> the string never changes and there seems to be no logic associated
>>>> to it
>>>> in the DSDT.
>>>
>>> Well, maybe. Or maybe not. Every year lots of new models are
>>> launched, and every model comes with it... why should they bring a
>>
>> Apparently not. Vaio Y doesn't have that string hardcoded in the DSDT.
>
> Interesting, may I see such DSDT file?

I've seen the DSDT file, and I can say that almost surely (well, I'd say 
surely) this model comes with the same string, even though it's 
hardcoded in some hw register instead (the first bytes of CIM more 
precisely). My idea hasn't changed, I strongly suggest to maintain this 
check, if the string changes we will have the chance to immediately 
determine what changed, otherwise it won't harm.
