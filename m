From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Wed, 25 Oct 2017 06:51:31 +0200
Message-ID: <20171025045131.GB13202@kmp-mobile.hq.kempniu.pl>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
 <20170923000048.GC20327@fury>
 <20170926044908.GA9170@kmp-mobile.hq.kempniu.pl>
 <20171018151058.GL10981@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:50634 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750822AbdJYEvf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Oct 2017 00:51:35 -0400
Received: by mail-lf0-f42.google.com with SMTP id a132so26343746lfa.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Oct 2017 21:51:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20171018151058.GL10981@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org

> > Finally, it seems the S6120 also has a row of "application panel"
> > hotkeys above the keyboard, but lacks the FUJ02E3 ACPI device, so I am
> > wondering whether these hotkeys work in Linux.  Ville, do they?
> 
> They work via the apanel driver.

Oops, then it looks like we have two drivers which poke the same
hardware at the same time using different methods: apanel uses SMBus,
fujitsu-laptop uses ACPI (the former is inferior as it resorts to
polling, which causes key presses to be reported with a delay).  I just
loaded both drivers on my Fujitsu Lifebook S7020 and it results in
duplicate events being passed to userspace.  We should probably prevent
this, but I am not quite sure how to achieve that.

Darren, Andy, do you have any thoughts on this?

> Well, there's buttons 1-4 and Enter.
> Buttons 1-4 work but the Enter doesn't, but that could be just an
> oversight in the apanel driver.

No, this is the way it is supposed to work.  Or at least fujitsu-laptop
does not react to the Enter key being pressed either.

> That's at least how the S6010 works.
> I'll have to retest the S6120 to make sure it behaves the same way.
> At least it has the same set of buttons on it.
> 
> > In
> > fact, it would be super helpful if you could post acpidumps from all
> > three models you have access to (you mentioned S6120, S6010 and S7110).
> > IMHO the biggest issue we have had while refactoring fujitsu-laptop is a
> > narrow set of known/tested models.
> 
> I've attached acpidumps and dmidecode outputs for all three machines.

Thank you!  This helps a lot and will definitely help preventing similar
issues in the future.

-- 
Best regards,
Michał Kępień
