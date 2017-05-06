From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 00/10] fujitsu-laptop: use device-specific data instead
 of module-wide globals
Date: Sat, 6 May 2017 14:45:16 +0200
Message-ID: <20170506124516.GA1075@kmp-mobile.hq.kempniu.pl>
References: <20170424133334.7064-1-kernel@kempniu.pl>
 <20170501130536.GA25546@marvin.atrad.com.au>
 <20170502132144.GA6808@ozzy.nask.waw.pl>
 <20170504234058.GC21562@marvin.atrad.com.au>
 <20170505161556.GC4793@fury>
 <20170506123107.GA2516@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170506123107.GA2516@kmp-mobile.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Jonathan Woithe <jwoithe@just42.net>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> Just to make sure we are all on the same page here, choosing the "two
> separate modules, each with one driver for one ACPI device" approach
> would mean ending up with two modules:
> 
>   - fujitsu-laptop, binding to the FUJ02E3 ACPI device, handling
>     everything _except_ backlight,
> 
>   - fujitsu-backlight, binding to the FUJ02B1 ACPI device, handling
>     backlight and depending on fujitsu-laptop.
> 
> We would need to export one function from fujitsu-laptop, namely
> fext_backlight().  I understand this would require creating a separate
> header file which would then be included in fujitsu-backlight.
> 
> fext_backlight() causes the FUNC method of the FUJ02E3 ACPI device to be
> called.  This method is marked as Serialized, which AFAIU means we do
> not need a separate lock in kernel code because all calls to this method
> are implicitly serialized by firmware itself.
> 
> I do not see anything "unnatural" in this approach, but I would love to
> be corrected if I am wrong.

To be fair, one thing that may be "unnatural" with this approach is that
even though fujitsu-backlight would depend on fujitsu-laptop, it would
still have to get a handle to FUJ02E3 using:

    acpi_get_handle(NULL, "\\_SB.FEXT", ...)
    
because call_fext_func() - and thus fext_backlight() - needs to be
passed a handle to FUJ02E3 and the two ACPI devices (FUJ02B1 handled by
fujitsu-backlight and FUJ02E3 handled by fujitsu-laptop) are not related
from the perspective of the ACPI device hierarchy.  Unless there is a
better way of implementing this, in which case I am open to suggestions.

-- 
Best regards,
Michał Kępień
