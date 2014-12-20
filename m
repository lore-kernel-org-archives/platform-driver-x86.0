From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/3] dell-wmi: Don't send unneeded keypresses
Date: Sat, 20 Dec 2014 08:58:32 -0800
Message-ID: <833BBFBF-227B-43AE-9976-FEDB55226249@infradead.org>
References: <1417648583-9336-1-git-send-email-gabriele.mzt@gmail.com> <201412052207.35676@pali> <20141203180329.GB20370@vmdeb7> <201412201010.18151@pali> <20141220151108.GA11752@amd> <20141220162804.GA7872@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:52974 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752448AbaLTRAJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 20 Dec 2014 12:00:09 -0500
In-Reply-To: <20141220162804.GA7872@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Pavel Machek <pavel@ucw.cz>
Cc: =?ISO-8859-1?Q?Pali_Roh=E1r?= <pali.rohar@gmail.com>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org



On December 20, 2014 8:28:04 AM PST, Henrique de Moraes Holschuh <hmh@hmh.eng.br> wrote:
>On Sat, 20 Dec 2014, Pavel Machek wrote:
>> > > > Ok, I agree that it is subjective how serious it is...
>> > > > Just to remind that patch fixing problem described in
>> > > > 
>> > > > http://www.spinics.net/lists/platform-driver-x86/msg05922.ht
>> > > > ml
>> > > > http://www.spinics.net/lists/platform-driver-x86/msg05924.h
>> > > > tml
>> > > 
>> > > I don't have any objection to sending this back to stable.
>> > > Stable is for fixing REAL bugs, as opposed to theorhetical
>> > > races, etc. This is a "real" bug.
>> > > 
>> > > As to not chaning behavior, if it's OK for mainline, it's OK
>> > > for stable. At least that is my understanding of it. Folks
>> > > are free to verify with Greg if they disagree.
>> > 
>> > Darren, so how you decided? Now when patches are in linus tree, 
>> > are you going to send them to stable tree?
>> 
>> Please don't. -stable is for serious mainline bugs people are
>actually
>> hitting. Null pointer dereference counts, if people actually hit
>> it. This is more behaviour change, and yes, the new behaviour is
>> better, but it is really different class.
>
>Sometimes the old behavior is something that is a major pain for users
>and
>userspace.  In that case, where the new behavior fixes really annoying
>usecase bugs, the fix belongs in -stable IMHO.
>
>Broken behavior hits, by definition, every user of the feature after
>all.

How is this behavior affecting users with this hardware today? How does it manifest? Does it make for a bad or non-functional user experience? Again, I should have pressed for more complete commit messages, apologies for that.

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
