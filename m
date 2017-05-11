From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 00/10] fujitsu-laptop: use device-specific data instead
 of module-wide globals
Date: Thu, 11 May 2017 15:40:28 +0200
Message-ID: <20170511134028.GA1166@ozzy.nask.waw.pl>
References: <20170424133334.7064-1-kernel@kempniu.pl>
 <20170501130536.GA25546@marvin.atrad.com.au>
 <20170502132144.GA6808@ozzy.nask.waw.pl>
 <20170504234058.GC21562@marvin.atrad.com.au>
 <20170505161556.GC4793@fury>
 <20170506123107.GA2516@kmp-mobile.hq.kempniu.pl>
 <20170506124516.GA1075@kmp-mobile.hq.kempniu.pl>
 <20170508160102.GE17700@fury>
 <20170509093524.GA19713@ozzy.nask.waw.pl>
 <20170509164734.GB17858@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:37532 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755504AbdEKNkc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 May 2017 09:40:32 -0400
Received: by mail-wm0-f47.google.com with SMTP id m123so36549896wma.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 May 2017 06:40:31 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170509164734.GB17858@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Jonathan Woithe <jwoithe@just42.net>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> Perhaps so (overly zealous). Regarding the globals, let's be clear on the
> motivation. We want to follow good sw engineering practice, use data
> encapsulation, etc. However, using an explicit path to an ACPI device to avoid
> having a static file-level global doesn't really improve encapsulation in any
> way - it just shifts the blame :-)

Indeed, thanks for a clear-headed opinion.  I got a bit carried away :)

> Another reason to eliminate globals is to allow one driver to handle multiple
> devices - all device-specific data must be bound to the device, not the driver.
> In our case, there literally cannot be more than one _SB.FEXT. While there could
> theoretically be more than one FUJ02E3, I think we all agree that is highly
> improbable - and if it did happen, the explicit ACPI path approach would also be
> broken.

Good point.

> The motivation to divide the drivers was to provide functional encapsulation,
> accurately represent the system in the device tree, and to improve readability
> and maintainability of the driver code. So long as we can keep coupling to a
> minimum, I still think this makes sense.
> 
> So - static global variable for a driver with exactly one device that needs
> offer services to another driver... not really all that horrible.
> 
> You could accomplish this by making call_fext_func() not static and calling it
> from fujitsu-backlight. Or, you could further restrict it by exporting a
> fujitsu_backlight_power() function which wraps call_fext_func() providing a
> specific interface for fujitsu-backlight. This makes the ownership very explicit
> and ensures the usage doesn't grow without explicit changes to fujitsu-laptop.

I like the latter option more.  Exporting call_fext_func() as it is
would mean enabling other modules to reimplement fujitsu-laptop's
features and we do not want that.

> That is probably the most practical solution IFF we still feel it is worth
> splitting the driver into two separate modules. We need to develop a more robust
> and objective decision making process on module granularity (when to split, when
> to keep together). Will continue to give this more thought.

In light of the above, I still feel the split is worth going through
with.  The question is whether Jonathan feels the same :)

Jonathan, assuming the objective of splitting the module in two, allow
me to pick your brain a bit:

 1. Would you be okay with leaving "priv" as the variable name for
    device-specific data in both drivers?  If they are to be separated,
    "priv" would soon become unambiguous.  I do not have any strong
    feelings about this, though.

 2. Would you be okay with renaming "acpi_handle" to "handle"?  Darren
    seems to like this idea and in light of the above we would not have
    another ACPI handle inside struct fujitsu_bl any more.

 3. You mentioned earlier that you were not really fond of the fext_*()
    helper functions.  Would you like me to drop them and simply use
    call_fext_func() with five arguments everywhere?  Or should I keep
    the helper functions in v2?

Thanks,

-- 
Best regards,
Michał Kępień
