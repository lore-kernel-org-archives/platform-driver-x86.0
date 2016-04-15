From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] fujitsu-laptop: Support radio LED
Date: Fri, 15 Apr 2016 15:30:15 +0930
Message-ID: <20160415060015.GQ12741@marvin.atrad.com.au>
References: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
 <20160318120418.GA29889@marvin.atrad.com.au>
 <20160322133051.GA3379@eudyptula.hq.kempniu.pl>
 <20160324113513.GA5129@marvin.atrad.com.au>
 <20160410023020.GA27081@dvhart-mobl5.amr.corp.intel.com>
 <20160410105258.GA2922@marvin.atrad.com.au>
 <20160412123634.GA8195@marvin.atrad.com.au>
 <20160415044255.GE3232@f23x64.localdomain>
 <20160415053333.GP12741@marvin.atrad.com.au>
 <20160415054417.GA127188@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:38563 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751448AbcDOGAt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 15 Apr 2016 02:00:49 -0400
Content-Disposition: inline
In-Reply-To: <20160415054417.GA127188@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Darren

On Thu, Apr 14, 2016 at 10:44:52PM -0700, Darren Hart wrote:
> On Fri, Apr 15, 2016 at 03:03:33PM +0930, Jonathan Woithe wrote:
> > > I've made a couple cosmetic changes and queued to for-next. Please review
> > > and let me know if you have any concerns.
> > 
> > Sure.  Pardon my ignorance of such things, but what is the most
> > straight-forward way to review the queued commit (preferrably without
> > cloning an entire kernel git repo)?
> 
> You can see the tree in the MAINTAINERS file, but I suppose that doesn't
> make it obvious how to browse it.  You can do that via the git web
> interface on infradead.

Oh, there is a git-web interface on that server.  I should have just
followed my instinct.  Apologies for the noise.

> The direct link to this patch is here:
> 
> http://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git/commit/34b5199d2b69f9be731233af2425c53cc7ff995b

The commit looks fine to me.  My only question is whether Michal should be
credited explicitly as the author since the patch originated from him (I
essentially just added some comments).  You know the process better than me
though so I'll leave it up to you.

Regards
  jonathan
