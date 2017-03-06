From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v2 0/4] fujitsu_init() cleanup
Date: Mon, 6 Mar 2017 18:40:30 +1030
Message-ID: <20170306081030.GA30975@marvin.atrad.com.au>
References: <20170301081044.12141-1-kernel@kempniu.pl>
 <20170304014723.GA7944@marvin.atrad.com.au>
 <20170305234854.GG28473@marvin.atrad.com.au>
 <20170306044905.GA3845@kmp-mobile.hq.kempniu.pl>
 <20170306050104.GT28473@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:35382 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752685AbdCFIzX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Mar 2017 03:55:23 -0500
Content-Disposition: inline
In-Reply-To: <20170306050104.GT28473@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Michael

Some quick feedback.

On Mon, Mar 06, 2017 at 03:31:04PM +1030, Jonathan Woithe wrote:
> > > I can add that immediately after loading the driver the value returned by a
> > > read of bl_power is 0.  As noted above, setting to 1 makes no difference to
> > > the backlight, neither does returning it to 0.
> > 
> > Have you tried setting bl_power to 4?  Because that is the value of
> > FB_BLANK_POWERDOWN, which is the value the patch is supposed to handle.
> 
> Oh no, I didn't try 4.  I should have.  I will try to squeeze in a test of
> this tonight (time is short but the test won't take a lot of time).

With an unpatched 4.5 kernel, writing 4 (as opposed to 1, which I stupidly
tried earlier) to bl_power caused the backlight to turn off.  Writing 0
turned it back on again.

With patches 1-4/4 applied, writing 4 to bl_power did *NOT* turn the
backlight off.

With patch 2 reverted, writing 4 to bl_power turned the backlight off. 
Writing 0 to bl_power turned it back on again.

This means that patch 2/4 seems to prevent bl_power from operating as
expected on the S7020 hardware.  Without this patch (but with all the others
in place) bl_power works.

I am unlikely to have any more time to investigate this further tonight. 

In light of the above findings, what would you like to do?

Regards
  jonathan
