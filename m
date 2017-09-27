From: Darren Hart <dvhart@infradead.org>
Subject: Re: NULL pointer dereference in call_fext_func [fujitsu_laptop]
Date: Wed, 27 Sep 2017 00:07:54 -0700
Message-ID: <20170927070754.GA12485@fury>
References: <541b9a7a-2224-9b81-aef3-3f06491f91e3@suse.cz>
 <CAHp75Vd=FnWaYg-gKoQO4p8UP3VVhOT9cQ-B-3b20u2KJBRDWQ@mail.gmail.com>
 <20170919081241.GF10399@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:33953 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751021AbdI0HIA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 03:08:00 -0400
Content-Disposition: inline
In-Reply-To: <20170919081241.GF10399@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Jiri Slaby <jslaby@suse.cz>, Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux kernel mailing list <linux-kernel@vger.kernel.org>

On Tue, Sep 19, 2017 at 05:42:41PM +0930, Jonathan Woithe wrote:
> On Tue, Sep 19, 2017 at 11:07:29AM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 19, 2017 at 10:56 AM, Jiri Slaby <jslaby@suse.cz> wrote:
> > > we have this report from 4.13.1:
> > > BUG: unable to handle kernel NULL pointer dereference at 00000004
> > > IP: call_fext_func.isra.3+0x82/0xf0 [fujitsu_laptop]
> > > *pdpt = 0000000035e79001 *pde = 0000000000000000
> > 
> > Thanks for report.
> > 
> > Isn't it a duplicate of [1]? If so, perhaps you may continue that thread.
> > [1]: https://www.spinics.net/lists/platform-driver-x86/msg12834.html
> 
> Yes, it is a duplicate of [1].  I agree that discussion should continue in
> that earlier thread.

A fix is queued to the fixes branch, tagged for stable 4.13.x

-- 
Darren Hart
VMware Open Source Technology Center
