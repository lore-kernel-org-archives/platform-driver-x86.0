From: Mattias Jacobsson <2pi@mok.nu>
Subject: Re: [PATCH v3 2/3] platform/x86: wmi: add WMI support to
 MODULE_DEVICE_TABLE()
Date: Thu, 7 Feb 2019 13:39:13 +0100
Message-ID: <20190207123912.wjniyxjgagc3hfo2@mok.nu>
References: <cover.1548860212.git.2pi@mok.nu>
 <ae59210f24d66516a0af38c03fd0da923dd0e7da.1548860212.git.2pi@mok.nu>
 <CAHp75VcLizx+jtMrbc3Ev-HcJVEjH2naFC0sj=7fX5nZSCGc8Q@mail.gmail.com>
 <20190203190423.lmsix5la6ioyawwi@mok.nu>
 <CAHp75Vdtggmg7POfcdvd8RykPW+wZ5wGKBWE8_Y_5qWY_MGL0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Vdtggmg7POfcdvd8RykPW+wZ5wGKBWE8_Y_5qWY_MGL0g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, michal.lkml@markovi.net, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 2pi@mok.nu
List-Id: platform-driver-x86.vger.kernel.org

On 2019-02-05, Andy Shevchenko wrote:
> On Sun, Feb 3, 2019 at 9:04 PM Mattias Jacobsson <2pi@mok.nu> wrote:
> > On 2019-01-30, Andy Shevchenko wrote:
> > > On Wed, Jan 30, 2019 at 5:15 PM Mattias Jacobsson <2pi@mok.nu> wrote:
> 
> > > > +       if (len < 0 || len >= 500) {
> > >
> > > Would it even possible to get a negative number here?
> > > Same for any other number than slightly bigger than 36.
> >
> > snprintf returns a negative number on error. BTW AFAIU the code from
> > file2alias.c gets dynamically linked against a libc.
> 
> OK.
> 
> > > So, what about simple
> > >
> > > {
> > >  DEF_FIELD_ADDR(...);
> > >  size_t len;
> > >
> > >  len = strlen(*guid_string);
> > >  if (len != ...) {
> > >   ...
> > >  }
> > > sprintf(...);
> > > return 1;
> > > }
> > >
> > > ?
> >
> > Then we are missing the check that we are within the bounds of alias
> 
> I don't see how. By checking a length of string we be sure, that the
> result would have a non-arbitrary length.

If you do s/500/ALIAS_SIZE/ on the patch? My code is written with that
in mind, I guess that wasn't totally clear.

BTW I've posted [1] to introduce the ALIAS_SIZE macro.

[1]: https://lore.kernel.org/lkml/20190207123022.7961-1-2pi@mok.nu/

> 
> > as well as the negative code from s*printf(). snprintf() does this nicely
> > for us.
> 
> This one I agree with, means in the above example we may do
> 
> return sprintf(...);
> 
> if callers recognize just a sign, or
> 
> len = sprintf(...);
> if (len < 0)
>  return len; // -1? 0?
> 
> return 1;
> 
> otherwise.

Great

> 
> -- 
> With Best Regards,
> Andy Shevchenko

Thanks,
Mattias
