From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 00/10] fujitsu-laptop: renames and cleanups
Date: Sun, 26 Feb 2017 12:30:06 +0100
Message-ID: <20170226113006.GA1249@kmp-mobile.hq.kempniu.pl>
References: <20170208134633.5152-1-kernel@kempniu.pl>
 <20170210001616.GH1950@marvin.atrad.com.au>
 <CAHp75VeedmO7yyFjfp3VwrqZa6BmE06Xq1oxdugaYn=YEP2Aww@mail.gmail.com>
 <20170217025708.GH6814@wisp>
 <20170217030804.GT30026@marvin.atrad.com.au>
 <20170217035319.GC25241@wisp>
 <20170217041756.GW30026@marvin.atrad.com.au>
 <CAHp75Vd1ghHKuh6KJPpuzZjKCuGFfrLsXn8XkRCA+H88J4k+yg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35570 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752066AbdBZLh4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Feb 2017 06:37:56 -0500
Received: by mail-lf0-f68.google.com with SMTP id z127so4312533lfa.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Feb 2017 03:37:55 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAHp75Vd1ghHKuh6KJPpuzZjKCuGFfrLsXn8XkRCA+H88J4k+yg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> On Fri, Feb 17, 2017 at 6:17 AM, Jonathan Woithe <jwoithe@just42.net> wrote:
> > On Thu, Feb 16, 2017 at 07:53:19PM -0800, Darren Hart wrote:
> >> On Fri, Feb 17, 2017 at 01:38:04PM +1030, Jonathan Woithe wrote:
> >> > Do you want me to continue to use Acked-by, or should I switch to
> >> > Reviewed-by?
> >>
> >> These tags do have different meanings, and have come up at Kernel Summit the
> >> last couple of years. My interpretation of those discussions is:
> >>
> >> Acked-by: I have no objection to this patch, but I didn't really give it a
> >> thorough review. I trust your judgement. e.g. minor change to your driver to
> >> support a subsystem API change. These are of very little value.
> >>
> >> Reviewed-by: I have carefully reviewed this patch and would like it to be
> >> applied. This should usually come with some sort of commentary describing the
> >> level of review or an area you focused on. This is what we would like to see
> >> from all of our driver maintainers. These are high value.
> >>
> >> Linus *really* dislikes one line acked by's, and only *slightly* more so than
> >> one line reviewed by's. :-)
> >
> > Got it, thanks, this is very helpful.
> >
> > In light of this I give you the following.
> >
> > Reviewed-by: Jonathan Woithe <jwoithe@just42.net>
> 
> Thanks, applied for testing with above tag.

Andy,

It looks like you missed this part of Jonathan's message:

> As per subsequent discussion we have agreed to drop patch 8/10 from the
> series: it creates problems on newer hardware and the issue it is addressing
> will be more completely dealt with in a subsequent patch series.

I see that patch 8/10 was applied to testing as well.  Could you please
drop that single patch?

Thanks,

-- 
Best regards,
Michał Kępień
