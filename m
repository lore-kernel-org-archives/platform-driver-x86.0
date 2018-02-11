From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Sun, 11 Feb 2018 22:33:54 +0100
Message-ID: <20180211213354.GC1124@kmp-mobile.hq.kempniu.pl>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
 <20170923000048.GC20327@fury>
 <20170926044908.GA9170@kmp-mobile.hq.kempniu.pl>
 <20171018151058.GL10981@intel.com>
 <20171025045131.GB13202@kmp-mobile.hq.kempniu.pl>
 <20171029225659.GF27493@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:41727 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753752AbeBKVd6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Feb 2018 16:33:58 -0500
Received: by mail-lf0-f46.google.com with SMTP id f136so17952369lff.8
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Feb 2018 13:33:57 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171029225659.GF27493@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org

> > > > Finally, it seems the S6120 also has a row of "application panel"
> > > > hotkeys above the keyboard, but lacks the FUJ02E3 ACPI device, so I am
> > > > wondering whether these hotkeys work in Linux.  Ville, do they?
> > > 
> > > They work via the apanel driver.
> > 
> > Oops, then it looks like we have two drivers which poke the same
> > hardware at the same time using different methods: apanel uses SMBus,
> > fujitsu-laptop uses ACPI (the former is inferior as it resorts to
> > polling, which causes key presses to be reported with a delay).  I just
> > loaded both drivers on my Fujitsu Lifebook S7020 and it results in
> > duplicate events being passed to userspace.  We should probably prevent
> > this, but I am not quite sure how to achieve that.
> 
> That's a bit tricky.  Evidently some models need the SMBus approach because
> they lack the FUJ02E3 device.  However, on systems with the FUJ02E3 the
> ACPI method is clearly desirable.  Should apanel disable itself on systems
> where an FUJ02E3 is present (although I'm not sure how precisely to arrange
> for this to happen)?  Then again, this would only be feasible if the ACPI
> method can handle all application panel variations which are seen across the
> various models.

Darren, Andy,

This is still an outstanding issue that I do not quite know how to deal
with properly (if there is a proper way at all).  How do you think this
should be handled?

There are two drivers in different subsystems that are stepping on each
other's toes: input/misc/apanel.c and platform/x86/fujitsu-laptop.c.
Testing confirmed that:

  - duplicate input events are generated when both drivers are loaded
    (or statically compiled in) and a hotkey is pressed,

  - when both drivers are compiled as modules, they are both
    automatically loaded upon boot.

One driver should be preferred over the other (fujitsu-laptop over
apanel), but using the preferred driver is only possible when a specific
ACPI device is present.

Any thoughts and/or hints how to handle this would be appreciated.

-- 
Best regards,
Michał Kępień
