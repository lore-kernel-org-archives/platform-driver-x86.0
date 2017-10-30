From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Fix radio LED detection
Date: Mon, 30 Oct 2017 13:21:50 +0200
Message-ID: <CAHp75VdJqWTgFhM8dcxkQzUfE7kEvTXQgaz04FVqgXayu8tLkg@mail.gmail.com>
References: <20171025042946.13225-1-kernel@kempniu.pl> <CAHp75Vc50cjeYCp9dOfRxAaRJnjN2E5aMRA_iBHXz43=m9UUtw@mail.gmail.com>
 <20171029212806.GA8470@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171029212806.GA8470@kmp-mobile.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Harvey <harv@gmx.de>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Oct 29, 2017 at 11:28 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kemp=
niu.pl> wrote:
>> On Wed, Oct 25, 2017 at 7:29 AM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@ke=
mpniu.pl> wrote:
>> > Radio LED detection method implemented in commit 4f62568c1fcf
>> > ("fujitsu-laptop: Support radio LED") turned out to be incorrect as it
>> > causes a radio LED to be erroneously detected on a Fujitsu Lifebook E7=
51
>> > which has a slide switch (and thus no radio LED).  Use bit 17 of
>> > flags_supported (the value returned by method S000 of ACPI device
>> > FUJ02E3) to determine whether a radio LED is present as it seems to be=
 a
>> > more reliable indicator, based on comparing DSDT tables of four Fujits=
u
>> > Lifebook models (E744, E751, S7110, S8420).
>> >
>>
>> Pushed to my review and testing queue, thanks!
>
> I forgot that this patch can also be tagged with:
>
> Fixes: 4f62568c1fcf ("fujitsu-laptop: Support radio LED")

Added.

Do you consider this an important fix? We are at -rc7 now, I'm not
sure it's so critical. Tell me if you consider otherwise.

--=20
With Best Regards,
Andy Shevchenko
