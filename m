From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/7] platform/x86: fujitsu-laptop: Define constants for
 FUNC operations
Date: Wed, 28 Feb 2018 18:08:52 +0200
Message-ID: <CAHp75VdDQ1xAYcXEN04kSug2sgi-G8+7PBEOC8MJSBw7gSCyRQ@mail.gmail.com>
References: <20180227211539.5708-1-kernel@kempniu.pl> <20180227211539.5708-2-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180227211539.5708-2-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 27, 2018 at 11:15 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kemp=
niu.pl> wrote:
> Various functions exposed by the firmware through the FUNC interface
> tend to use a consistent set of integers for denoting the type of
> operation to be performed for a specified feature.  Use named constants
> instead of integers in each call_fext_func() invocation in order to more
> clearly convey the intent of each call.
>
> Note that FUNC_FLAGS is a bit peculiar:

> +/* FUNC interface - operations */
> +#define OP_GET                         BIT(1)
> +#define OP_GET_CAPS                    0
> +#define OP_GET_EVENTS                  BIT(0)
> +#define OP_GET_EXT                     BIT(2)
> +#define OP_SET                         BIT(0)
> +#define OP_SET_EXT                     (BIT(2) | BIT(0))

Hmm... this looks unordered a bit.
And plain 0 doesn't look right in this concept (something like (0 <<
0) would probably do it).

--=20
With Best Regards,
Andy Shevchenko
