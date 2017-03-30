From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/8] fujitsu-laptop: use sparse keymaps for input event
 handling
Date: Wed, 29 Mar 2017 20:36:50 -0700
Message-ID: <20170330033650.GF15472@localhost.localdomain>
References: <20170320093224.18541-1-kernel@kempniu.pl>
 <20170324104959.GA31520@marvin.atrad.com.au>
 <20170327235719.GE23486@marvin.atrad.com.au>
 <20170328061618.GA3694@ozzy.nask.waw.pl>
 <20170328230029.GA29146@marvin.atrad.com.au>
 <20170329071926.GA1070@ozzy.nask.waw.pl>
 <CAHp75Ve2ToZW+Mp=HexjzhV82ZS38QkfK2bMxeRwuX3vu1bCsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:47786 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752742AbdC3Dgz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Mar 2017 23:36:55 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75Ve2ToZW+Mp=HexjzhV82ZS38QkfK2bMxeRwuX3vu1bCsw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Mar 29, 2017 at 07:35:50PM +0300, Andy Shevchenko wrote:
> On Wed, Mar 29, 2017 at 10:19 AM, Michał Kępień <kernel@kempniu.pl> wrote:
> 
> > Darren, Andy, in light of the above I will be awaiting your review of
> > this series.  I will submit v2 afterwards, with all remarks from both
> > you and Jonathan taken into account.
> 
> Darren marked this series under his name to review, so, I let him to
> speak for us.

The series looks good to me. Nice work Michał. They are logically divided and
address issues in a procedural way (so I stopped commenting until I read the
full series through as a couple of times you addressed a concern from a move in
a cleanup to follow).

I've applied the noted change to 7/8 and will run this through my tests, but
don't anticipate any problems. Jonathan, if you don't have any additional
concerns, let me know if I can add your Reviewed-by.

Thanks,

-- 
Darren Hart
VMware Open Source Technology Center
