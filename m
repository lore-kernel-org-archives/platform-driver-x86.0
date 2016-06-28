From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/2] fujitsu-laptop: Debugging cleanup
Date: Tue, 28 Jun 2016 10:49:48 -0700
Message-ID: <20160628174948.GE3837@f23x64.localdomain>
References: <20160616234630.GB4764@marvin.atrad.com.au>
 <1466676168-4199-1-git-send-email-kernel@kempniu.pl>
 <20160623103535.GA18242@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56289 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752071AbcF1Ru2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2016 13:50:28 -0400
Content-Disposition: inline
In-Reply-To: <20160623103535.GA18242@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 23, 2016 at 08:05:35PM +0930, Jonathan Woithe wrote:
> On Thu, Jun 23, 2016 at 12:02:46PM +0200, Micha?? K??pie?? wrote:
> > vdbg_printk() was introduced by 20b9373, which is the same commit that
> > adds FUJ02E3 support, so it has been the way it is now from the start.
> > This patch series attempts to tidy things up a bit.
> > 
> >  drivers/platform/x86/fujitsu-laptop.c |   12 +-----------
> >  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> Yes, good idea.  Both patches look good to me.  I would like to note in
> passing that the removal of the unused defines in the second patch was in
> fact suggested as part of a broader cleanup series by Alan Jenkins an
> embarassingly long time ago.  For various reasons I didn't get a chance to
> review and apply his patch series at the time.  It is my aim to rectify this
> soon, but in the meantime this two patch series is good to go in.  Thanks
> for the submission.
> 
> Acked-by: Jonathan Woithe <jwoithe@just42.net>

Queued to testing for 4.8.

> 
> Regards
>   jonathan
> 

-- 
Darren Hart
Intel Open Source Technology Center
