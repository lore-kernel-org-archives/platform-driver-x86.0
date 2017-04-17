From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/6] fujitsu-laptop: LED cleanup
Date: Mon, 17 Apr 2017 19:18:42 +0930
Message-ID: <20170417094842.GA2394@marvin.atrad.com.au>
References: <20170407130713.8417-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:44670 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753742AbdDQJtc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Apr 2017 05:49:32 -0400
Content-Disposition: inline
In-Reply-To: <20170407130713.8417-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 07, 2017 at 03:07:07PM +0200, Micha?? K??pie?? wrote:
> This patch series cleans up parts of fujitsu-laptop responsible for
> handling LED class devices.  It was tested on a Lifebook E744.  It
> depends on the previous patch series I submitted for fujitsu-laptop and
> should be applied on top of the backlight cleanup series.

I have completed my review.  The changes in this patch series are reasonably
extensive but should not result in any observable changes in behaviour. 
They represent a significant modernisation of the code, taking advantage of
the current approach to module architecture.  Unfortunately I do not have
hardware which includes the LEDs which these changes affect, so I cannot
confirm the absence of regressions.  I note however that it has been tested
on a Lifebook E744.

My only question about this patch set relates to patch 5/6 ("fujitsu-laptop:
do not log LED registration failures").  While it is true that driver core
will log an error due to the error flagged by the return value from
acpi_fujitsu_laptop_add() (as explained in the commit message), the
elimination of the pr_err() statements means that we loose the ability to
see which LED caused the problem.  All we know is that there has been an
error flagged by something within (or called by) acpi_fujitsu_laptop_add(). 
This may be related to LEDs or anything else initialised by
acpi_fujitsu_laptop_add().

Is the resulting simplification of code worth the loss of this finer grained
information in the event of a LED registration error?

Regards
  jonathan
