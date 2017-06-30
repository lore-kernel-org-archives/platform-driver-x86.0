From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: sony-laptop: revert 'const' on keymap
Date: Fri, 30 Jun 2017 11:21:02 -0700
Message-ID: <20170630182102.GE26257@fury>
References: <20170630154524.3611399-1-arnd@arndb.de>
 <CAHp75VfU8Pa+xoCP=ybCr067TbcOn+OU4VR=YJpXN__P-swJxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:35750 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752455AbdF3SVJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Jun 2017 14:21:09 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75VfU8Pa+xoCP=ybCr067TbcOn+OU4VR=YJpXN__P-swJxw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy@infradead.org>, Mattia Dongili <malattia@linux.it>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 30, 2017 at 06:58:24PM +0300, Andy Shevchenko wrote:
> On Fri, Jun 30, 2017 at 6:45 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > Marking sony_laptop_input_keycode_map 'const' sounds like a good
> > idea in principle, but unfortunately causes a compiler warning:
> >
> > drivers/platform/x86/sony-laptop.c: In function 'sony_laptop_setup_input':
> > drivers/platform/x86/sony-laptop.c:494:19: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-array-qualifiers]
> >
> > This reverts that part of the previous cleanup patch.
> 
> Thanks, pushed directly to for-next.
> 

Thanks Andy,

> I didn't get a clear result from our 0day kbuild bot, so it was in
> testing previously.
> 
> Darren, it looks like we need more clear coordination on what is going
> to be applied for-next from testing.

Indeed - and my CI build should have caught this warning. I will look into what
it's missing so this would be called out as an error.

And for this patch, I would prefer to roll this into the original. There is no
point in introducing warnings into Linus' kernel. We try not to rebase for-next,
but it happens everyday, so it isn't a huge deal for Stephen to deal with.

Will you squash it, or shall I?

-- 
Darren Hart
VMware Open Source Technology Center
