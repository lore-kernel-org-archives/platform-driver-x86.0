From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/8] fujitsu-laptop: use sparse keymaps for input event
 handling
Date: Wed, 29 Mar 2017 22:04:30 -0700
Message-ID: <20170330050430.GA3179@localhost.localdomain>
References: <20170320093224.18541-1-kernel@kempniu.pl>
 <20170324104959.GA31520@marvin.atrad.com.au>
 <20170327235719.GE23486@marvin.atrad.com.au>
 <20170328061618.GA3694@ozzy.nask.waw.pl>
 <20170328230029.GA29146@marvin.atrad.com.au>
 <20170329071926.GA1070@ozzy.nask.waw.pl>
 <CAHp75Ve2ToZW+Mp=HexjzhV82ZS38QkfK2bMxeRwuX3vu1bCsw@mail.gmail.com>
 <20170330033650.GF15472@localhost.localdomain>
 <20170330035626.GK19787@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:56210 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754586AbdC3FEe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 30 Mar 2017 01:04:34 -0400
Content-Disposition: inline
In-Reply-To: <20170330035626.GK19787@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 30, 2017 at 02:26:26PM +1030, Jonathan Woithe wrote:
> On Wed, Mar 29, 2017 at 08:36:50PM -0700, Darren Hart wrote:
> > On Wed, Mar 29, 2017 at 07:35:50PM +0300, Andy Shevchenko wrote:
> > > On Wed, Mar 29, 2017 at 10:19 AM, Micha?? K??pie?? <kernel@kempniu.pl> wrote:
> > > 
> > > > Darren, Andy, in light of the above I will be awaiting your review of
> > > > this series.  I will submit v2 afterwards, with all remarks from both
> > > > you and Jonathan taken into account.
> > > 
> > > Darren marked this series under his name to review, so, I let him to
> > > speak for us.
> > 
> > The series looks good to me. Nice work Micha??. They are logically divided and
> > address issues in a procedural way (so I stopped commenting until I read the
> > full series through as a couple of times you addressed a concern from a move in
> > a cleanup to follow).
> > 
> > I've applied the noted change to 7/8 and will run this through my tests, but
> > don't anticipate any problems. Jonathan, if you don't have any additional
> > concerns, let me know if I can add your Reviewed-by.
> 
> With the noted change to 7/8 applied I'm happy with the resulting series. 
> As you noted, there is still some scope for making things more consistent,
> especially with regard to error handling.  However, that is really a
> separate task which can be addressed in a later series.  This present series
> doesn't impact on this issue in any significant way so it makes sense that
> be applied.
> 
> Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Merged, thanks!

-- 
Darren Hart
VMware Open Source Technology Center
