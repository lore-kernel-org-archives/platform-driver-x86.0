From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Fix radio LED detection
Date: Sun, 29 Oct 2017 22:28:06 +0100
Message-ID: <20171029212806.GA8470@kmp-mobile.hq.kempniu.pl>
References: <20171025042946.13225-1-kernel@kempniu.pl>
 <CAHp75Vc50cjeYCp9dOfRxAaRJnjN2E5aMRA_iBHXz43=m9UUtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:55448 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751374AbdJ2V2L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 29 Oct 2017 17:28:11 -0400
Received: by mail-lf0-f44.google.com with SMTP id e143so621830lfg.12
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Oct 2017 14:28:10 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAHp75Vc50cjeYCp9dOfRxAaRJnjN2E5aMRA_iBHXz43=m9UUtw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Harvey <harv@gmx.de>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> On Wed, Oct 25, 2017 at 7:29 AM, Michał Kępień <kernel@kempniu.pl> wrote:
> > Radio LED detection method implemented in commit 4f62568c1fcf
> > ("fujitsu-laptop: Support radio LED") turned out to be incorrect as it
> > causes a radio LED to be erroneously detected on a Fujitsu Lifebook E751
> > which has a slide switch (and thus no radio LED).  Use bit 17 of
> > flags_supported (the value returned by method S000 of ACPI device
> > FUJ02E3) to determine whether a radio LED is present as it seems to be a
> > more reliable indicator, based on comparing DSDT tables of four Fujitsu
> > Lifebook models (E744, E751, S7110, S8420).
> >
> 
> Pushed to my review and testing queue, thanks!

I forgot that this patch can also be tagged with:

Fixes: 4f62568c1fcf ("fujitsu-laptop: Support radio LED")

-- 
Best regards,
Michał Kępień
