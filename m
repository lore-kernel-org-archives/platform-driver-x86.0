From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/3] fujitsu-laptop: call_fext_func() cleanup
Date: Tue, 4 Apr 2017 09:13:50 +0930
Message-ID: <20170403234350.GA14026@marvin.atrad.com.au>
References: <20170403093859.6685-1-kernel@kempniu.pl>
 <20170403221311.GA17322@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:33564 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751734AbdDCXor (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Apr 2017 19:44:47 -0400
Content-Disposition: inline
In-Reply-To: <20170403221311.GA17322@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 03, 2017 at 03:13:11PM -0700, Darren Hart wrote:
> On Mon, Apr 03, 2017 at 11:38:56AM +0200, Micha?? K??pie?? wrote:
> > This series contains a few cleanups for the call_fext_func() function.
> > It does not depend on the previous series I submitted for
> > fujitsu-laptop, which is why I am sending it in parallel with the
> > backlight cleanup series.
> > 
> > While patches 1 and 2 are tangible improvements, I will understand if
> > you deem patch 3 to be unnecessary churn.  I decided to submit it anyway
> > as I think it might bring some benefit to a casual reader of the
> > module's code, but it is basically just a suggestion and as it is the
> > last patch, it can simply be omitted when the series is applied.
> > 
> >  drivers/platform/x86/fujitsu-laptop.c | 39 +++++++++++------------------------
> >  1 file changed, 12 insertions(+), 27 deletions(-)
> 
> These all look like worthwhile changes to me. Jonathan, are you aware of
> any usage of the arguments in 3/3 that would argue against changing their
> names to the more specific ones?

Certainly not at this stage and realistically I don't expect this to change.
The suggested renaming of fields does add a degree of clarity to the code so
I have no problem with it.

> Pushed to the temporary fujitsu branch for testing, awaiting ack from
> Jonathan.

Even though these are small changes I agree that all three patches contain
worthwhile improvements.  I'm happy for all three of them to be merged.

Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

FYI I am still working through the more extensive backlight cleanup series.
This is a particularly busy week for me so my review comments might only
come through towards the end of the week or during the weekend.

Regards
  jonathan
