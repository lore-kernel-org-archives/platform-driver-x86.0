From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 00/10] fujitsu-laptop: use device-specific data instead of
 module-wide globals
Date: Sat, 6 May 2017 17:21:43 +0300
Message-ID: <CAHp75VdPd_5tBCggknRFkirGN1Z5h0LLoq-DazuHwxcY-=AjHQ@mail.gmail.com>
References: <20170424133334.7064-1-kernel@kempniu.pl> <20170501130536.GA25546@marvin.atrad.com.au>
 <20170502132144.GA6808@ozzy.nask.waw.pl> <20170504234058.GC21562@marvin.atrad.com.au>
 <20170505161556.GC4793@fury> <20170506123107.GA2516@kmp-mobile.hq.kempniu.pl> <20170506124516.GA1075@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f181.google.com ([209.85.220.181]:33461 "EHLO
        mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750995AbdEFOVo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 6 May 2017 10:21:44 -0400
In-Reply-To: <20170506124516.GA1075@kmp-mobile.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Jonathan Woithe <jwoithe@just42.net>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, May 6, 2017 at 3:45 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempni=
u.pl> wrote:

> To be fair, one thing that may be "unnatural" with this approach is that
> even though fujitsu-backlight would depend on fujitsu-laptop, it would
> still have to get a handle to FUJ02E3 using:
>
>     acpi_get_handle(NULL, "\\_SB.FEXT", ...)
>
> because call_fext_func() - and thus fext_backlight() - needs to be
> passed a handle to FUJ02E3 and the two ACPI devices (FUJ02B1 handled by
> fujitsu-backlight and FUJ02E3 handled by fujitsu-laptop) are not related
> from the perspective of the ACPI device hierarchy.  Unless there is a
> better way of implementing this, in which case I am open to suggestions.

There are two areas to check with:
1. Remote graph node
https://lwn.net/Articles/718184/
2. Component framework (only works in case when all devices are
mandatory to have).

--=20
With Best Regards,
Andy Shevchenko
