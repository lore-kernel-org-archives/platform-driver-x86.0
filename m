From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 00/10] fujitsu-laptop: renames and cleanups
Date: Thu, 16 Feb 2017 21:23:07 -0800
Message-ID: <20170217052307.GA28530@wisp>
References: <20170208134633.5152-1-kernel@kempniu.pl>
 <20170210001616.GH1950@marvin.atrad.com.au>
 <CAHp75VeedmO7yyFjfp3VwrqZa6BmE06Xq1oxdugaYn=YEP2Aww@mail.gmail.com>
 <20170217025708.GH6814@wisp>
 <20170217030804.GT30026@marvin.atrad.com.au>
 <20170217035319.GC25241@wisp>
 <20170217041756.GW30026@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:37307 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750772AbdBQFXN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2017 00:23:13 -0500
Content-Disposition: inline
In-Reply-To: <20170217041756.GW30026@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Feb 17, 2017 at 02:47:56PM +1030, Jonathan Woithe wrote:
> On Thu, Feb 16, 2017 at 07:53:19PM -0800, Darren Hart wrote:
> > On Fri, Feb 17, 2017 at 01:38:04PM +1030, Jonathan Woithe wrote:
> > > Do you want me to continue to use Acked-by, or should I switch to
> > > Reviewed-by?
> > 
> > These tags do have different meanings, and have come up at Kernel Summit the
> > last couple of years. My interpretation of those discussions is:
> > 
> > Acked-by: I have no objection to this patch, but I didn't really give it a
> > thorough review. I trust your judgement. e.g. minor change to your driver to
> > support a subsystem API change. These are of very little value.
> > 
> > Reviewed-by: I have carefully reviewed this patch and would like it to be
> > applied. This should usually come with some sort of commentary describing the
> > level of review or an area you focused on. This is what we would like to see
> > from all of our driver maintainers. These are high value.
> > 
> > Linus *really* dislikes one line acked by's, and only *slightly* more so than
> > one line reviewed by's. :-)
> 
> Got it, thanks, this is very helpful.
> 
> In light of this I give you the following.
> 
> Reviewed-by: Jonathan Woithe <jwoithe@just42.net>
> 
> This patch series applies a much delayed patch series which implements a
> very useful clean up to the fujitsu-laptop driver.  Among other things it
> tidies up naming conventions within the driver to better reflect the
> functionality and to be more consistent with the rest of the kernel.  This
> will make future maintenance and feature additions much easier for all
> concerned.
> 
> As per subsequent discussion we have agreed to drop patch 8/10 from the
> series: it creates problems on newer hardware and the issue it is addressing
> will be more completely dealt with in a subsequent patch series.

Absolutely awesome :-) Thanks!

> 
> Regards
>   jonathan
> 

-- 
Darren Hart
Intel Open Source Technology Center
