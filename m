From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/5] Update and move Dell drivers dell_rbu and dcdbas
Date: Wed, 26 Sep 2018 14:05:14 +0300
Message-ID: <CAHp75VcMDXsJWTzrEo+L7aQzaj1oRoUb_Cpc91J22p0wcybOjQ@mail.gmail.com>
References: <20180925193418.28493-1-stuart.hayes@dell.com> <CAHp75Ve=ZnkBbdG3Myu1qzubr6+q74Q0u9pR7+nHXG=yAO-0rA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Ve=ZnkBbdG3Myu1qzubr6+q74Q0u9pR7+nHXG=yAO-0rA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 26, 2018 at 2:04 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Sep 25, 2018 at 10:34 PM Stuart Hayes <stuart.w.hayes@gmail.com> wrote:
> >
> > From: Stuart Hayes <stuart.w.hayes@gmail.com>
> >
> > The dell_rbu and dcdbas drivers need some changes, and should be moved to
> > drivers/platform/x86.  Additionally, dell_rbu needs a maintainer, and the
> > listed maintainer for dcdbas is inactive and needs to be changed.
>
> I pushed this series to my review and testing queue to allow bots play with.
>
> But.
> Please, add commit messages to patches 4 and 5 (I can't take w/o them).
> Collect Doug's tag that proves he is okay with the change (I remember
> he answered something to the old thread, though I don't remember the
> details except annoying footer which should not be up in open source
> mailing lists).

Applying: MAINTAINERS: Update maintainer for dcdbas and dell_rbu
.git/rebase-apply/patch:14: trailing whitespace.
M:      Stuart Hayes <stuart.w.hayes@gmail.com>
warning: 1 line adds whitespace errors.

Fix the above as well.

>
> So, while bots are playing with the code I'm waiting for v2 of this
> with above addressed.
> Thanks!
>
> >
> > Stuart Hayes (5):
> >   firmware: dell_rbu: Make payload memory uncachable
> >   firmware: dcdbas: Add support for WSMT ACPI table
> >   firmware: dell_rbu: Move dell_rbu to drivers/platform/x86
> >   firmware: dcdbas: Move dcdbas to drivers/platform/x86
> >   MAINTAINERS: Update maintainer for dcdbas and dell_rbu
> >
> >  MAINTAINERS                                   |  11 +-
> >  drivers/firmware/Kconfig                      |  28 ----
> >  drivers/firmware/Makefile                     |   2 -
> >  drivers/platform/x86/Kconfig                  |  28 ++++
> >  drivers/platform/x86/Makefile                 |   2 +
> >  drivers/{firmware => platform/x86}/dcdbas.c   | 123 +++++++++++++++++-
> >  drivers/{firmware => platform/x86}/dcdbas.h   |  10 ++
> >  drivers/platform/x86/dell-smbios-smm.c        |   2 +-
> >  drivers/{firmware => platform/x86}/dell_rbu.c |   8 ++
> >  9 files changed, 175 insertions(+), 39 deletions(-)
> >  rename drivers/{firmware => platform/x86}/dcdbas.c (82%)
> >  rename drivers/{firmware => platform/x86}/dcdbas.h (93%)
> >  rename drivers/{firmware => platform/x86}/dell_rbu.c (98%)
> >
> > --
> > 2.19.0.221.g150f307af
> >
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
