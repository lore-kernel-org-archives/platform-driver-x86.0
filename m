From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 00/10] fujitsu-laptop: use device-specific data instead
 of module-wide globals
Date: Mon, 8 May 2017 09:01:02 -0700
Message-ID: <20170508160102.GE17700@fury>
References: <20170424133334.7064-1-kernel@kempniu.pl>
 <20170501130536.GA25546@marvin.atrad.com.au>
 <20170502132144.GA6808@ozzy.nask.waw.pl>
 <20170504234058.GC21562@marvin.atrad.com.au>
 <20170505161556.GC4793@fury>
 <20170506123107.GA2516@kmp-mobile.hq.kempniu.pl>
 <20170506124516.GA1075@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:56831 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750815AbdEHQBI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 May 2017 12:01:08 -0400
Content-Disposition: inline
In-Reply-To: <20170506124516.GA1075@kmp-mobile.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, May 06, 2017 at 02:45:16PM +0200, Michał Kępień wrote:
> > Just to make sure we are all on the same page here, choosing the "two
> > separate modules, each with one driver for one ACPI device" approach
> > would mean ending up with two modules:
> > 
> >   - fujitsu-laptop, binding to the FUJ02E3 ACPI device, handling
> >     everything _except_ backlight,
> > 
> >   - fujitsu-backlight, binding to the FUJ02B1 ACPI device, handling
> >     backlight and depending on fujitsu-laptop.
> > 
> > We would need to export one function from fujitsu-laptop, namely
> > fext_backlight().  I understand this would require creating a separate
> > header file which would then be included in fujitsu-backlight.
> > 
> > fext_backlight() causes the FUNC method of the FUJ02E3 ACPI device to be
> > called.  This method is marked as Serialized, which AFAIU means we do
> > not need a separate lock in kernel code because all calls to this method
> > are implicitly serialized by firmware itself.
> > 
> > I do not see anything "unnatural" in this approach, but I would love to
> > be corrected if I am wrong.
> 
> To be fair, one thing that may be "unnatural" with this approach is that
> even though fujitsu-backlight would depend on fujitsu-laptop, it would
> still have to get a handle to FUJ02E3 using:
> 
>     acpi_get_handle(NULL, "\\_SB.FEXT", ...)
>     
> because call_fext_func() - and thus fext_backlight() - needs to be
> passed a handle to FUJ02E3 and the two ACPI devices (FUJ02B1 handled by
> fujitsu-backlight and FUJ02E3 handled by fujitsu-laptop) are not related
> from the perspective of the ACPI device hierarchy.  Unless there is a
> better way of implementing this, in which case I am open to suggestions.

At a high level, I would consider the handle to be private data which should be
encapsulated in fujitsu_laptop. Or... where is FEXT in the ACPI hierarchy
relative to FUJ02E3?

Assuming FEXT is below FUJ02E3, the we appear to be making an assumption that
there is only one FUJ02E3 on the system. While I think this is perfectly
reasonable, it does contradict the argumentation from some of the other patches
in this series.

If FEXT is not below fujitsu laptop... then it is a shared function which either
one of them can own and serialize (or not if fw indeed handles that).

Either way, the owning driver should abstract away the private data and present
an interface the other can use with only the "public" information.

I suggest investigating the various mechanisms Andy pointed at and revisiting
this after that.

-- 
Darren Hart
VMware Open Source Technology Center
