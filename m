From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 2/3] platform/x86: wmi: add WMI support to MODULE_DEVICE_TABLE()
Date: Tue, 5 Feb 2019 17:45:25 +0200
Message-ID: <CAHp75Vdtggmg7POfcdvd8RykPW+wZ5wGKBWE8_Y_5qWY_MGL0g@mail.gmail.com>
References: <cover.1548860212.git.2pi@mok.nu> <ae59210f24d66516a0af38c03fd0da923dd0e7da.1548860212.git.2pi@mok.nu>
 <CAHp75VcLizx+jtMrbc3Ev-HcJVEjH2naFC0sj=7fX5nZSCGc8Q@mail.gmail.com> <20190203190423.lmsix5la6ioyawwi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190203190423.lmsix5la6ioyawwi@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: Mattias Jacobsson <2pi@mok.nu>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, michal.lkml@markovi.net, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Feb 3, 2019 at 9:04 PM Mattias Jacobsson <2pi@mok.nu> wrote:
> On 2019-01-30, Andy Shevchenko wrote:
> > On Wed, Jan 30, 2019 at 5:15 PM Mattias Jacobsson <2pi@mok.nu> wrote:

> > > +       if (len < 0 || len >= 500) {
> >
> > Would it even possible to get a negative number here?
> > Same for any other number than slightly bigger than 36.
>
> snprintf returns a negative number on error. BTW AFAIU the code from
> file2alias.c gets dynamically linked against a libc.

OK.

> > So, what about simple
> >
> > {
> >  DEF_FIELD_ADDR(...);
> >  size_t len;
> >
> >  len = strlen(*guid_string);
> >  if (len != ...) {
> >   ...
> >  }
> > sprintf(...);
> > return 1;
> > }
> >
> > ?
>
> Then we are missing the check that we are within the bounds of alias

I don't see how. By checking a length of string we be sure, that the
result would have a non-arbitrary length.

> as well as the negative code from s*printf(). snprintf() does this nicely
> for us.

This one I agree with, means in the above example we may do

return sprintf(...);

if callers recognize just a sign, or

len = sprintf(...);
if (len < 0)
 return len; // -1? 0?

return 1;

otherwise.

-- 
With Best Regards,
Andy Shevchenko
