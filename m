From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Fix radio LED detection
Date: Tue, 31 Oct 2017 05:20:02 +0100
Message-ID: <20171031042002.GA9788@larwa.localdomain>
References: <20171025042946.13225-1-kernel@kempniu.pl>
 <CAHp75Vc50cjeYCp9dOfRxAaRJnjN2E5aMRA_iBHXz43=m9UUtw@mail.gmail.com>
 <20171029212806.GA8470@kmp-mobile.hq.kempniu.pl>
 <CAHp75VdJqWTgFhM8dcxkQzUfE7kEvTXQgaz04FVqgXayu8tLkg@mail.gmail.com>
 <20171030121257.GA28737@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:43941 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750733AbdJaEUG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2017 00:20:06 -0400
Received: by mail-wm0-f53.google.com with SMTP id m72so12674342wmc.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Oct 2017 21:20:05 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20171030121257.GA28737@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Harvey <harv@gmx.de>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> > Do you consider this an important fix? We are at -rc7 now, I'm not
> > sure it's so critical. Tell me if you consider otherwise.
> 
> I agree - from my perspective I wouldn't have thought it so critical as to
> push it out this late in the development cycle.  It's not a regression as
> such and is largely cosmetic.  Others may argue differently though.

I agree as well.  The erroneous log messages will only be generated when
any rfkill device in the system is enabled or disabled, so IMHO this is
mostly a nuisance thus can be handled when convenient.

-- 
Best regards,
Michał Kępień
