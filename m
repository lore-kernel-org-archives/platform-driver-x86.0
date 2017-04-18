From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 5/6] platform/x86: fujitsu-laptop: do not log LED
 registration failures
Date: Tue, 18 Apr 2017 09:01:12 -0700
Message-ID: <20170418160112.GA25405@fury>
References: <20170407130713.8417-1-kernel@kempniu.pl>
 <20170407130713.8417-6-kernel@kempniu.pl>
 <20170417160952.GA27550@fury>
 <20170418081001.GA2411@ozzy.nask.waw.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:39169 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751783AbdDRQBP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Apr 2017 12:01:15 -0400
Content-Disposition: inline
In-Reply-To: <20170418081001.GA2411@ozzy.nask.waw.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 18, 2017 at 10:10:01AM +0200, Michał Kępień wrote:
> Jonathan, I hope this response to Darren's message also addresses your
> concerns.  Feel free to let me know if it does not.
> 
> > On Fri, Apr 07, 2017 at 03:07:12PM +0200, Michał Kępień wrote:
> > > If acpi_fujitsu_laptop_leds_register() returns an error, the latter will
> > > become the return value of acpi_fujitsu_laptop_add(), which in turn will
> > > be reported by driver core.  Simplify code by replacing pr_err() calls
> > > with return statements.  Return 0 instead of result when no errors occur
> > > in order to make the code easier to read.
> > 
> > Hi Michał,
> > 
> > Jonathan's comment regarding the information loss of removing the pr_err
> > statements seems valid to me. Based on the outer if block, I take it each
> > registration only fails in true error scenarios and not because some laptop
> > might have one but not another LED in the list.
> 
> Correct.
> 
> > If so, then the pr_err messages
> > would only appear when there was a legitimate problem. I think they're worth
> 
> I am not hell-bent on removing these pr_err() calls, but allow me to
> briefly walk you through my thought process.
> 
> devm_led_classdev_register() is basically a managed wrapper for
> led_classdev_register(), so let's see under what circumstances the
> latter may fail.  While it does quite a bit, its return value can only
> be different than zero for one of two reasons:
> 
>   - there is already a LED with the same name present in the system, so
>     the kernel automatically renames the one we are registering and the
>     length of the generated name exceeds LED_MAX_NAME_SIZE,
> 
>   - device_create_with_groups() fails, either because we are out of
>     memory or the device hierarchy is screwed up.
> 
> The first case will never happen, given that the longest LED name that
> fujitsu-laptop tries to register is 18 bytes long, the counter used for
> auto-incrementation is an unsigned int and LED_MAX_NAME_SIZE is 64.
> 
> In the second case, we are likely to be notified by driver core about
> the exact nature of the failure, but more importantly, logging which LED
> "caused" the failure makes us none the wiser.  Actions taken by the
> kernel in response to each of the devm_led_classdev_register() calls are
> virtually identical and if any of these fails, we are more than likely
> to have problems way more severe than non-functioning LEDs.
> 
> Have I missed anything or perhaps assumed something I should have not?
> 
> > This seems to introduce a behavior change as well. Previously only the last
> > LED registered would determine the result - which is wrong of course and I
> > believe you noted a related bug in an early patch. Previously, however, if
> > LOGOLAMP_POWERON failed, for example, the KEYBOARD_LAMPS would still be attempted.
> > 
> > So the question really comes down to this: Is there a legitimate situation in
> > which one LEDs registration fails and another succeeds? If so, then this would
> > constitute a regression for such systems.
> 
> The behavior change you mentioned is intentional.  As pointed out above,
> if any devm_led_classdev_register() call fails, it means we have reached
> some inconsistent state which is really unlikely to be improved by
> further attempts to register even more devices.
> 
> What do you guys think?

Excellent rationale, I withdraw the concern.

Jonathan?

-- 
Darren Hart
VMware Open Source Technology Center
