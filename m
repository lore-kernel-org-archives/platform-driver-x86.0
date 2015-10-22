From: Darren Hart <dvhart@infradead.org>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Thu, 22 Oct 2015 10:35:59 +0200
Message-ID: <20151022083559.GA23490@malice.jf.intel.com>
References: <bug-106031-5380@https.bugzilla.kernel.org/>
 <bug-106031-5380-zVXKHiyrZU@https.bugzilla.kernel.org/>
 <20151021085724.GA87951@vmdeb7>
 <20151021091954.GD15219@pali>
 <20151021110059.GF15219@pali>
 <20151021111243.GB87951@vmdeb7>
 <20151022081725.GC2581@malice.jf.intel.com>
 <CABFtUbQi-x8DCwm1gSC6ifAZec-n==xh_dTM79PhQSEsxNJ9CA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:36261 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755915AbbJVIgE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Oct 2015 04:36:04 -0400
Content-Disposition: inline
In-Reply-To: <CABFtUbQi-x8DCwm1gSC6ifAZec-n==xh_dTM79PhQSEsxNJ9CA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Thu, Oct 22, 2015 at 10:28:21AM +0200, Gabriele Mazzotta wrote:
> 2015-10-22 10:17 GMT+02:00 Darren Hart <dvhart@infradead.org>:
> > On Wed, Oct 21, 2015 at 01:12:43PM +0200, Darren Hart wrote:
> >> From what I can tell, the XPS 13 has a TOGGLE type rfkill button (Fn-PrtScrn):
> >>
> >> http://www.trustedreviews.com/dell-xps-13-2015-photos-11
> >
> > The reporter states his radio toggle is on F2, so it is not the above machine,
> > probably this one:
> >
> > http://www.ibtimes.co.uk/dell-xps-13-review-ultrabook-341773
> >
> > In any case, his logs confirm we are seeing a TOGGLE type which is using the
> > input mechanism.
> 
> According to the dmesg it's an XPS13 9333, which is the one I own.

Oh excellent! That should help considerably!

-- 
Darren Hart
Intel Open Source Technology Center
