From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: NULL pointer dereference in call_fext_func [fujitsu_laptop]
Date: Tue, 19 Sep 2017 17:42:41 +0930
Message-ID: <20170919081241.GF10399@marvin.atrad.com.au>
References: <541b9a7a-2224-9b81-aef3-3f06491f91e3@suse.cz>
 <CAHp75Vd=FnWaYg-gKoQO4p8UP3VVhOT9cQ-B-3b20u2KJBRDWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:39608 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751283AbdISINW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Sep 2017 04:13:22 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75Vd=FnWaYg-gKoQO4p8UP3VVhOT9cQ-B-3b20u2KJBRDWQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jiri Slaby <jslaby@suse.cz>, Micha?? K??pie?? <kernel@kempniu.pl>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux kernel mailing list <linux-kernel@vger.kernel.org>

On Tue, Sep 19, 2017 at 11:07:29AM +0300, Andy Shevchenko wrote:
> On Tue, Sep 19, 2017 at 10:56 AM, Jiri Slaby <jslaby@suse.cz> wrote:
> > we have this report from 4.13.1:
> > BUG: unable to handle kernel NULL pointer dereference at 00000004
> > IP: call_fext_func.isra.3+0x82/0xf0 [fujitsu_laptop]
> > *pdpt = 0000000035e79001 *pde = 0000000000000000
> 
> Thanks for report.
> 
> Isn't it a duplicate of [1]? If so, perhaps you may continue that thread.
> [1]: https://www.spinics.net/lists/platform-driver-x86/msg12834.html

Yes, it is a duplicate of [1].  I agree that discussion should continue in
that earlier thread.

Regards
  jonathan
