From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 4/25] sony-laptop: new SNC setup and cleanup functions
Date: Mon, 13 Jun 2011 22:42:52 +0900
Message-ID: <20110613134251.GA6119@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE8FE7B.6090602@absence.it>
 <20110612222123.GB31095@kamineko.org>
 <4DF55356.9020405@absence.it>
 <09bbad4b23cc0747ac2ab6dcd232c3d4.squirrel@picard.linux.it>
 <4DF5DABD.50505@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:47435 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753008Ab1FMNmc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Jun 2011 09:42:32 -0400
Received: by pvg12 with SMTP id 12so2115818pvg.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jun 2011 06:42:32 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DF5DABD.50505@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Mon, Jun 13, 2011 at 11:39:09AM +0200, Marco Chiappero wrote:
> Il 13/06/2011 03:28, Mattia Dongili ha scritto:
> >On Mon, June 13, 2011 2:01 am, Marco Chiappero wrote:
> >>Il 13/06/2011 00:21, Mattia Dongili ha scritto:
...
> This way of writing is for me annoying, I don't care who you think

Let's try to lower the tone of emails. Maybe I missed a couple of
smilies here and there but hostility doesn't help anyone. :)

...
> >>>I'd rather not have
> >>>this check here.
> >>
> >>Avoiding this check here seems a logical error to me: it's basically the
> >>entry point (and the first thing to look at when calling the setup
> >>method SN00), maybe revealing info about the device and the action to be
> >>taken about this device, I can't see why we'd better skip this step,
> >>that doesn't hurt, just because at the moment almost every notebook
> >>won't fail.
> >
> >the string never changes and there seems to be no logic associated to it
> >in the DSDT.
> 
> Well, maybe. Or maybe not. Every year lots of new models are
> launched, and every model comes with it... why should they bring a

Apparently not. Vaio Y doesn't have that string hardcoded in the DSDT.

Again, not initializing the driver because a string doesn't match
SncSupported seems wrong. Especially given that if the string is there
or not makes no difference to us.
On the other hand I have nothing against fetching the string value
and printing some debug statement if really we can't just ignore it.

> useless information? The fact that at the moment we have basically
> only one string it doesn't assure that there is no logic.
> 
> >If the string is changed in some bios revision or gets removed you have to
> >change the driver.
> 
> Yes, it's surely the right thing to do:
> - if it removed and nothing changes, well, we have the proof that
> this string is not relevant for Sony too, so it's likely to be
> useless (at least, today, maybe it was the past). As far as I can
> say every model I've seen do have this string, so it doesn't seem
> the case.
> - if it changes we will immediately have the chance to find out if
> something else has changed too. But again, this change is likely to
> have a meaning that we should try to discover.

The net result is that a large part of the SNC driver doesn't
initialize, how is that the right thing to do?
Again, we know how to discover and use handles, that's enough for now as
far as we know.
-- 
mattia
:wq!
