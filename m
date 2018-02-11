From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH][RfC] Some buttons on the Fujitsu u7[25]7 laptops are not
 working
Date: Sun, 11 Feb 2018 21:48:22 +0100
Message-ID: <20180211204822.GB1124@kmp-mobile.hq.kempniu.pl>
References: <69f33335-962b-f3be-da8e-2eeff1ae2a49@fbihome.de>
 <20180119234547.GB24590@marvin.atrad.com.au>
 <84b872ec-ba48-6423-cb7b-48f2c3ef30d2@fbihome.de>
 <e69cad3d-067b-5a22-0f4d-0c29691037c7@fbihome.de>
 <20180209113144.GC23589@marvin.atrad.com.au>
 <20180210212330.GD2070@larwa.localdomain>
 <20180211040814.GB12203@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:40885 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753667AbeBKUs0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Feb 2018 15:48:26 -0500
Received: by mail-lf0-f52.google.com with SMTP id i24so14738316lfc.7
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Feb 2018 12:48:25 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20180211040814.GB12203@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org

> > For me, adding support for the new systems in an elegant way would mean:
> > 
> >   - detecting models without dedicated hotkeys and forcing an immediate
> >     release event when a "press" is detected on such models; we can take
> >     a shot at bit 29 being the indicator, the worst that is going to
> >     happen is that we will get double release events on some machines,
> 
> The effect of a double release depends on the way the key events go on to be
> handled.  If they trigger on key-down there will be no issue.  If they go on
> key-up then each key will get pressed twice for each physical action.  I
> guess time will tell.
> 
> >   - keeping GIRB and S000 keymaps separate as these two hotkey handling
> >     methods are completely different: the former utilizes a ring buffer,
> >     the latter relies on setting bits in the return value of a function
> >     and clearing them after they have been "retrieved"; the two keymaps
> >     would then have to be merged into a single sparse keymap upon device
> >     instantiation.
> > 
> > However, it is Jonathan who is the module maintainer and Jan-Marek's
> > patch does not break stuff.  I am thus happy to present my vision after
> > this patch gets merged.
> 
> In the interests of making things work for owners of the newer systems in
> the short term I am inclined to say we merge the patch from Jan-Marek, on
> the understanding that the more extensive infrastructure changes will be
> needed in order to handle this in a sane way into the future.  I don't think
> the proposed patch will make it any harder to effect the changes you have in
> mind, will it?

No worries, it will not.  There are, however, a couple of "procedural"
issues with Jan-Marek's patch which I listed below.

Jan-Marek, first, please ensure "checkpatch.pl --strict" run on your
patch does not report any issues (e.g. there is a typo in your SOB).

Once that is dealt with, please ensure that you:

  - Send your patch as a separate email, not as part of another message.
    Obviously this is okay to do for draft patches, like the ones you
    sent earlier in this thread, but not really for stuff you would
    actually like to see merged.  "git send-email" is your friend.

  - Make sure your subject line includes the "<subsystem>: <driver>:"
    prefix, i.e. "platform/x86: fujitsu-laptop:".

  - Rename "funcret" to "ret".  I know fujitsu-laptop is not yet
    consistent in naming such variables, but it soon will be, so please
    change it.

  - Not a technical issue, but rather one style-related (just my two
    cents): I would rephrase the subject and the commit log message to:

        platform/x86: fujitsu-laptop: Support Lifebook U7x7 hotkeys

	Generate input events for hotkeys present in Fujitsu Lifebook
	U727 and U757 laptops: Fn+F1 (KEY_MICMUTE) and Fn+F5
	(KEY_RFKILL).

    This is basically what the patch does.  The rest of what you wrote
    in the log message of your draft patch seems redundant to me.

> I'm all for elegant solutions, so I would welcome patches working towards
> the broader ideas you outlined above.  Keeping both handling methods
> separate does seem to be a good idea.

Okay, I will try to prepare something in this regard.

-- 
Best regards,
Michał Kępień
