From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: add NULL check on
 devm_kzalloc() return value
Date: Fri, 7 Jul 2017 10:02:08 -0700
Message-ID: <20170707170208.GB30284@fury>
References: <20170706221902.GA29514@embeddedgus>
 <20170707001900.GE6573@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:41783 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750938AbdGGRCT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Jul 2017 13:02:19 -0400
Content-Disposition: inline
In-Reply-To: <20170707001900.GE6573@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jul 07, 2017 at 09:49:00AM +0930, Jonathan Woithe wrote:
> On Thu, Jul 06, 2017 at 05:19:02PM -0500, Gustavo A. R. Silva wrote:
> > Check return value from call to devm_kzalloc()
> > in order to prevent a NULL pointer dereference.
> > 
> > This issue was detected using Coccinelle and the following semantic patch:
> > 
> > @@
> > expression x;
> > identifier fld;
> > @@
> > 
> > * x = devm_kzalloc(...);
> >   ... when != x == NULL
> >   x->fld
> > 
> > Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
> 
> These checks should be added in the interest of code correctness. 
> devm_kzalloc() can fail (even if it's extremely unlikely in practice) so we
> should check for this.
> 
> Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Thanks Gustavo and Jonathan,

Queued to testing.

-- 
Darren Hart
VMware Open Source Technology Center
