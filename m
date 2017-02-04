From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/4] fujitsu_init() cleanup
Date: Sat, 4 Feb 2017 16:11:50 +0200
Message-ID: <CAHp75Vdn7kuvw6GYgoQ3Z=m8tWjmNvWXoSdGvyVxFkRoqptRuw@mail.gmail.com>
References: <20170113110240.622-1-kernel@kempniu.pl> <20170113121758.GA9036@marvin.atrad.com.au>
 <20170113131915.GA745@ozzy.nask.waw.pl> <20170203140507.GB11947@ozzy.nask.waw.pl>
 <CAHp75VehOapj3kBCEVH+ad2XzghU6v6nLGkQDntdj-E2Ue-dTA@mail.gmail.com>
 <20170204004425.GB38511@f23x64.localdomain> <20170204062151.GA2058@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:33053 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750851AbdBDOLv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Feb 2017 09:11:51 -0500
In-Reply-To: <20170204062151.GA2058@kmp-mobile.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Jonathan Woithe <jwoithe@just42.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Feb 4, 2017 at 8:21 AM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempni=
u.pl> wrote:
>> On Fri, Feb 03, 2017 at 04:13:40PM +0200, Andy Shevchenko wrote:
>> > On Fri, Feb 3, 2017 at 4:06 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@k=
empniu.pl> wrote:
>> > > Darren, Andy,
>> > >
>> > > Please drop this patch series for now.  I will send a rebased v2 aft=
er a
>> > > long overdue patch series from Alan Jenkins gets applied in a rework=
ed
>> > > form.
>> >
>> > Noted.
>> >
>> > Just for you information. Our repo now consists three branches: fixes,
>> > for-next, and testing. testing is kinda for internal use, it might be
>> > broken or be in a wrong state.
>> > Better to use for-next as a base. For this cycle (which is my first as
>>
>> In general, you should be able to use Linus' master as the base. Only if=
 you
>> require patches already in for-next, should you use for-next.
>
> Thanks, guys, this is all helpful information.  I have always assumed
> testing was the correct base branch because my patches got pushed there
> once they got accepted.

Consider testing as a purgatory of the stuff.

P.S. Darren fixed your name in previous patches and thus one more
rebase happened in for-next.

--=20
With Best Regards,
Andy Shevchenko
