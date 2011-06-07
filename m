From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Tue, 07 Jun 2011 17:15:32 +0200
Message-ID: <4DEE4094.8040300@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE9012E.5040207@absence.it> <20110604080717.GC7194@kamineko.org> <4DEA4D67.8000009@absence.it> <20110604164021.GA12552@kamineko.org> <4DEA644D.3030109@absence.it> <20110605222401.GA26835@kamineko.org> <4DECD592.6000707@absence.it> <20110607142332.GA4087@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:57320 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753534Ab1FGPPg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jun 2011 11:15:36 -0400
In-Reply-To: <20110607142332.GA4087@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>

Il 07/06/2011 16:23, Mattia Dongili ha scritto:
>> This is a wrong assumption: the layout never really changed
>> "recently" (I mean, at least 4-5 years, or even more), is still the
>> same since a long time (and it's very likely to stay the same), Sony
>
> hmmm this is true only in part, mainly for SNC hotkeys.

I was indeed referring to recent models ("the layout never really 
changed "recently"") using the SNC device for the hotkeys.

> All the S1/S2, speed/stamina and friends keys vary from model to model
> and sometimes send the same event for different keys.

So why are those keys are already fine in sony_100_events and never 
remapped by udev? I'm just talking about keys from SONYPI_EVENT_FNKEY_F1 
to SONYPI_EVENT_FNKEY_F12 though.

> lovely, does it make any difference if udev maps those keys and the
> driver instead just sends FN_F* making old and new models send the same
> keycodes and scancodes?

Models equipped with the SNC device are already using the same 
scancodes, there is no need to translate them twice.

 > you're a bit too optimistic here but well...

Maybe, but I don't think that Sony wants to deal with model specific 
layouts under Windows as well (in fact it seems to me that is shipping 
the same base software on every model).
