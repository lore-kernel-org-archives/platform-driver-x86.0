From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Sat, 10 Feb 2018 22:33:22 +0100
Message-ID: <20180210213322.GE2070@larwa.localdomain>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
 <20170919040648.GA8426@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:42390 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752185AbeBJVd0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Feb 2018 16:33:26 -0500
Received: by mail-lf0-f44.google.com with SMTP id w10so2973050lfc.9
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Feb 2018 13:33:26 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170919040648.GA8426@kmp-mobile.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

> > My Fujitsu-Siemens Lifebook S6120 doesn't have the FUJ02E3 device,
> > but it does have FUJ02B1. That means we do register the backlight
> > device (and it even seems to work), but the code will oops as soon
> > as we try to set the backlight brightness because it's trying to
> > call call_fext_func() with a NULL device. Let's just skip those
> > function calls when the FUJ02E3 device is not present.
> 
> Oh, the irony...  I have literally just sat down to dust off the patch
> series I have had queued for the past couple of months which makes the
> driver for FUJ02B1 a separate module depending on the FUJ02E3 driver.
> Then I saw your email and it is now clear that such a dependency is
> bogus.  AFAIR, until now everyone involved was expecting the FUJ02E3
> ACPI device to be present on all Fujitsu laptops.
> 
> I need to refresh my memory a bit and think about next steps. 

This comment of mine seems a bit too hotheaded in retrospect.  The fact
that we cannot assume that FUJ02E3 always exists when FUJ02B1 exists
does not prevent us from exposing a function from a module centered
around the former to the module centered around the latter.  That
function would just need to correctly handle a missing FUJ02E3 ACPI
device.  Thus, I am still supportive of splitting the module into two.

> I still
> have one more cleanup series queued that is worth posting and I also
> need to fix radio LED detection.  My spare time is still very limited,
> but I will do my best to post something soon.

The aforementioned patch series is still queued on my disk, but needs a
bit more polishing before I can post it.  This is just a "keepalive"
message that I have not given up on it.

-- 
Best regards,
Michał Kępień
