From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Tue, 26 Sep 2017 06:49:08 +0200
Message-ID: <20170926044908.GA9170@kmp-mobile.hq.kempniu.pl>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
 <20170923000048.GC20327@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f170.google.com ([209.85.128.170]:54042 "EHLO
        mail-wr0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935426AbdIZEtM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Sep 2017 00:49:12 -0400
Received: by mail-wr0-f170.google.com with SMTP id l22so11389056wrc.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Sep 2017 21:49:11 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170923000048.GC20327@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Jonathan Woithe <jwoithe@just42.net>, Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org

> > call call_fext_func() with a NULL device. Let's just skip those
> > function calls when the FUJ02E3 device is not present.
> > 
> 
> Interesting. We call call_fext_func from many locations using the
> "device" argument, or the driver static "fext".
> 
> This looks to me that we should be a bit more consistent here.

This is intentional.  The plan was to extract the backlight part of
fujitsu-laptop into a separate module, fujitsu-backlight, which would
use a simple two-function API exposed by fujitsu-laptop to control LCD
backlight power.  Those functions would have to somehow access the
FUJ02E3 ACPI device while not being ACPI callbacks.  Thus, fext is
storing a pointer to the last (and most likely only) instantiated
FUJ02E3 ACPI device so that it can be used for setting LCD backlight
power from fujitsu-backlight.  See commit ca0d9eab0fb5 for a brief
discussion of why this solution was chosen.

> Finally, it seems a proper fix would be to either not register the
> backlight device if !fext or to check for !fext inside call_fext_func.

My draft patch series which splits off fujitsu-backlight includes the
NULL check for fext inside the functions exposed by fujitsu-laptop.
Sadly, I have not got round to submitting it yet.

Just to make sure we are all on the same page here, please note that
access to FUJ02E3 is only needed for controlling LCD backlight _power_,
not LCD backlight _brightness_.

Speaking of which, I just noticed that my S7020 can control its LCD
brightness just fine without fujitsu-laptop being loaded.  Heck, it even
works when booted with "noacpi".  It seems to me that on this model, LCD
brightness control works at the firmware level and an ACPI-based driver
is just another possible way of getting/setting LCD brightness level.
Jonathan, IIRC you have an S7020 as well, could you please test that?
You know better than me why this driver was needed in the first place.

Ville, could you please test your S6120 for the above as well?  Please
try unloading/blacklisting fujitsu-laptop and see whether LCD backlight
control still works.

Finally, it seems the S6120 also has a row of "application panel"
hotkeys above the keyboard, but lacks the FUJ02E3 ACPI device, so I am
wondering whether these hotkeys work in Linux.  Ville, do they?  In
fact, it would be super helpful if you could post acpidumps from all
three models you have access to (you mentioned S6120, S6010 and S7110).
IMHO the biggest issue we have had while refactoring fujitsu-laptop is a
narrow set of known/tested models.

-- 
Best regards,
Michał Kępień
