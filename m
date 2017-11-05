From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 0/3] Sony-laptop: Adjustments for sony_nc_setup_rfkill()
Date: Sun, 5 Nov 2017 15:24:19 +0200
Message-ID: <CAHp75VeyLnKG43g0LiDqirkehH4bLK7x216NV1+C8Oktp7D5UQ@mail.gmail.com>
References: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
 <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
 <17ee534c-9fe6-19c4-0522-76cd3cbe5f88@users.sourceforge.net>
 <CAHp75VfaWLSwzLpnWHj0sD9ZVVbSCi+ya_+PESXjU2FbHefE0Q@mail.gmail.com> <340e5426-a9ba-2193-2735-85e918773785@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <340e5426-a9ba-2193-2735-85e918773785@users.sourceforge.net>
Sender: kernel-janitors-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Marco Chiappero <marco@absence.it>, Matthew Garrett <mjg@redhat.com>, Mattia Dongili <malattia@linux.it>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 3, 2017 at 3:23 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>> I have applied first two,
>
> Thanks for another change acceptance.
>
>
>> the last one is subject to discuss a necessity of it.
>
> I can offer another bit of information for this software development disc=
ussion.
>
> The following build settings were active in my =E2=80=9CMakefile=E2=80=9D=
 for this Linux test case.
>
> =E2=80=A6
> HOSTCFLAGS   =3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O0 -fomi=
t-frame-pointer -std=3Dgnu89
> =E2=80=A6
>
>
> The affected source file can be compiled for the processor architecture =
=E2=80=9Cx86_64=E2=80=9D
> by a tool like =E2=80=9CGCC 6.4.1+r251631-1.3=E2=80=9D from the software =
distribution
> =E2=80=9CopenSUSE Tumbleweed=E2=80=9D with the following command example.
>
> my_cc=3D/usr/bin/gcc-6 \
> && my_module=3Ddrivers/platform/x86/sony-laptop.ko \
> && git checkout ':/^Sony-laptop: Delete an unnecessary variable initialis=
ation in sony_nc_setup_rfkill' \
> && make -j4 CC=3D"${my_cc}" HOSTCC=3D"${my_cc}" allmodconfig "${my_module=
}" \
> && size "${my_module}" \
> && git checkout ':/^Sony-laptop: Use common error handling code in sony_n=
c_setup_rfkill' \
> && make -j4 CC=3D"${my_cc}" HOSTCC=3D"${my_cc}" allmodconfig "${my_module=
}" \
> && size "${my_module}"
>
>
> Do you find the following details useful for further clarification?
>
> text: -32
> data: 0
> bss:  0

...but kernel is compiled with -O2 which, I suppose, will eliminate
these repeats.

So, the main question is "WHY" you are doing this change.

I didn't find any convinced explanation (yet?).

As an example, I would understand it if the consequent patch will
bring locking to the function.

--=20
With Best Regards,
Andy Shevchenko
