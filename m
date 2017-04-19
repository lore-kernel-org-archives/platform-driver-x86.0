From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 5/6] platform/x86: fujitsu-laptop: do not log LED
 registration failures
Date: Wed, 19 Apr 2017 17:00:00 +0930
Message-ID: <20170419073000.GK14031@marvin.atrad.com.au>
References: <20170407130713.8417-1-kernel@kempniu.pl>
 <20170407130713.8417-6-kernel@kempniu.pl>
 <20170417160952.GA27550@fury>
 <20170418081001.GA2411@ozzy.nask.waw.pl>
 <20170418160112.GA25405@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:46920 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933374AbdDSHbA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Apr 2017 03:31:00 -0400
Content-Disposition: inline
In-Reply-To: <20170418160112.GA25405@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 18, 2017 at 09:01:12AM -0700, Darren Hart wrote:
> On Tue, Apr 18, 2017 at 10:10:01AM +0200, Micha?? K??pie?? wrote:
> > Jonathan, I hope this response to Darren's message also addresses your
> > concerns.  Feel free to let me know if it does not.
> > 
> > > On Fri, Apr 07, 2017 at 03:07:12PM +0200, Micha?? K??pie?? wrote:
> > > > If acpi_fujitsu_laptop_leds_register() returns an error, the latter will
> > > > become the return value of acpi_fujitsu_laptop_add(), which in turn will
> > > > be reported by driver core.  Simplify code by replacing pr_err() calls
> > > > with return statements.  Return 0 instead of result when no errors occur
> > > > in order to make the code easier to read.
> > > 
> > > Hi Micha??,
> > > 
> > > Jonathan's comment regarding the information loss of removing the pr_err
> > > statements seems valid to me. Based on the outer if block, I take it each
> > > registration only fails in true error scenarios and not because some laptop
> > > might have one but not another LED in the list.
> > 
> > Correct.
> > 
> > > If so, then the pr_err messages
> > > would only appear when there was a legitimate problem. I think they're worth
> > 
> > I am not hell-bent on removing these pr_err() calls, but allow me to
> > briefly walk you through my thought process.
> > :

Thanks Michael for your detailed explanation of your rationale and the
background to these changes.

> > > This seems to introduce a behavior change as well. Previously only the last
> > > LED registered would determine the result - which is wrong of course and I
> > > believe you noted a related bug in an early patch. Previously, however, if
> > > LOGOLAMP_POWERON failed, for example, the KEYBOARD_LAMPS would still be attempted.
> > > 
> > > So the question really comes down to this: Is there a legitimate situation in
> > > which one LEDs registration fails and another succeeds? If so, then this would
> > > constitute a regression for such systems.
> > 
> > The behavior change you mentioned is intentional.  As pointed out above,
> > if any devm_led_classdev_register() call fails, it means we have reached
> > some inconsistent state which is really unlikely to be improved by
> > further attempts to register even more devices.
> > 
> > What do you guys think?
> 
> Excellent rationale, I withdraw the concern.
> Jonathan?

I am happy to proceed based on Michael's subsequent explanation.

The changes in this patch series are reasonably extensive but should not
result in any observable changes in behaviour.  They represent a significant
modernisation of the code, taking advantage of the current approach to
module architecture.  Unfortunately I do not have hardware which includes
the LEDs which these changes affect, so I cannot confirm the absence of
regressions.  I note however that it has been tested on a Lifebook E744 and
I am therefore happy to see the patch series merged on this basis.

Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Regards
  jonathan
