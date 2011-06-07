From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 12/25] sony-laptop: input core improvements improvements
Date: Tue, 7 Jun 2011 23:23:33 +0900
Message-ID: <20110607142332.GA4087@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE9012E.5040207@absence.it>
 <20110604080717.GC7194@kamineko.org>
 <4DEA4D67.8000009@absence.it>
 <20110604164021.GA12552@kamineko.org>
 <4DEA644D.3030109@absence.it>
 <20110605222401.GA26835@kamineko.org>
 <4DECD592.6000707@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.212.179]:56116 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753696Ab1FGOXj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jun 2011 10:23:39 -0400
Received: by pxi2 with SMTP id 2so3716958pxi.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2011 07:23:39 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4DECD592.6000707@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>

On Mon, Jun 06, 2011 at 03:26:42PM +0200, Marco Chiappero wrote:
> Il 06/06/2011 00:24, Mattia Dongili ha scritto:
> >>Sure and I consider to be a good alternative, but it looks to me
> >>like being another workaround, it is fine for particular exceptions
> >>that need a few remappings, but it should not be the rule, the
> >>driver extension. That's why I was asking about this change.
> >
> >what is a better solution? having keymaps for every different layout
> >that Sony implemented throught the years
> 
> This is a wrong assumption: the layout never really changed
> "recently" (I mean, at least 4-5 years, or even more), is still the
> same since a long time (and it's very likely to stay the same), Sony

hmmm this is true only in part, mainly for SNC hotkeys.
All the S1/S2, speed/stamina and friends keys vary from model to model
and sometimes send the same event for different keys.
SPIC hotkeys are a lot more messy and there still are a number of (not
so) old models using SPIC to send hotkey events.

...
> models where the Fn-F1 key (Touchpad toggle) is now present. The
> hotkeys layout is now stable enough to be used as the default one
> for every model, causing no problems at all (very old models will

lovely, does it make any difference if udev maps those keys and the
driver instead just sends FN_F* making old and new models send the same
keycodes and scancodes?

> continue to work through the udev keymaps already in place - well,
> just one, because module-sony would no longer be necessary -).
> To answer your question: to me, it looks much better having a single
> real input driver mapping the right keys for everybody instead of
> having a fake layout plus a userspace keymap (because just a single
> keymap is needed).

you're a bit too optimistic here but well...
-- 
mattia
:wq!
