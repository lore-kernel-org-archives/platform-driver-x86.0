From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/4] fujitsu_init() cleanup
Date: Sat, 4 Feb 2017 01:44:25 +0100
Message-ID: <20170204004425.GB38511@f23x64.localdomain>
References: <20170113110240.622-1-kernel@kempniu.pl>
 <20170113121758.GA9036@marvin.atrad.com.au>
 <20170113131915.GA745@ozzy.nask.waw.pl>
 <20170203140507.GB11947@ozzy.nask.waw.pl>
 <CAHp75VehOapj3kBCEVH+ad2XzghU6v6nLGkQDntdj-E2Ue-dTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:33296 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752858AbdBDAoa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Feb 2017 19:44:30 -0500
Content-Disposition: inline
In-Reply-To: <CAHp75VehOapj3kBCEVH+ad2XzghU6v6nLGkQDntdj-E2Ue-dTA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Jonathan Woithe <jwoithe@just42.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Feb 03, 2017 at 04:13:40PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 3, 2017 at 4:06 PM, Michał Kępień <kernel@kempniu.pl> wrote:
> > Darren, Andy,
> >
> > Please drop this patch series for now.  I will send a rebased v2 after a
> > long overdue patch series from Alan Jenkins gets applied in a reworked
> > form.
> 
> Noted.
> 
> Just for you information. Our repo now consists three branches: fixes,
> for-next, and testing. testing is kinda for internal use, it might be
> broken or be in a wrong state.
> Better to use for-next as a base. For this cycle (which is my first as

In general, you should be able to use Linus' master as the base. Only if you
require patches already in for-next, should you use for-next.


-- 
Darren Hart
Intel Open Source Technology Center
