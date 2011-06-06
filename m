From: Marco Chiappero <marco@absence.it>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Mon, 06 Jun 2011 15:26:42 +0200
Message-ID: <4DECD592.6000707@absence.it>
References: <4DE8FC4A.9010401@absence.it> <4DE9012E.5040207@absence.it> <20110604080717.GC7194@kamineko.org> <4DEA4D67.8000009@absence.it> <20110604164021.GA12552@kamineko.org> <4DEA644D.3030109@absence.it> <20110605222401.GA26835@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa012-1msr.fastwebnet.it ([62.101.93.132]:41207 "EHLO
	aa012-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757187Ab1FFN0q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 6 Jun 2011 09:26:46 -0400
In-Reply-To: <20110605222401.GA26835@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>

Il 06/06/2011 00:24, Mattia Dongili ha scritto:
>> Sure and I consider to be a good alternative, but it looks to me
>> like being another workaround, it is fine for particular exceptions
>> that need a few remappings, but it should not be the rule, the
>> driver extension. That's why I was asking about this change.
>
> what is a better solution? having keymaps for every different layout
> that Sony implemented throught the years

This is a wrong assumption: the layout never really changed "recently" 
(I mean, at least 4-5 years, or even more), is still the same since a 
long time (and it's very likely to stay the same), Sony is just adding 
keys. For example, there are models with the Zoom In key (Fn-F10), but 
no Zoom Out (Fn-F9), but on those models Fn-F9 do not generate 
"scancodes". The same goes, for example, for newer models where the 
Fn-F1 key (Touchpad toggle) is now present. The hotkeys layout is now 
stable enough to be used as the default one for every model, causing no 
problems at all (very old models will continue to work through the udev 
keymaps already in place - well, just one, because module-sony would no 
longer be necessary -).
To answer your question: to me, it looks much better having a single 
real input driver mapping the right keys for everybody instead of having 
a fake layout plus a userspace keymap (because just a single keymap is 
needed).
