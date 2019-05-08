From: Rajat Jain <rajatja@google.com>
Subject: Re: linux-next: Tree for May 8 (drivers/platform/x86/intel_pmc_core_plat_drv.c)
Date: Wed, 8 May 2019 16:15:21 -0700
Message-ID: <CACK8Z6F2v8nyUYcnOrkp81WfK2D2NEmK=pcWybn1annrtqRwew@mail.gmail.com>
References: <20190508173403.6088d0db@canb.auug.org.au> <fa0e68b2-b839-b187-150c-13391c197b99@infradead.org>
 <CAHp75Veq2=XA124rG8urt3eVE3pcaUm0VdsV7Mxr9zjMpa7mjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Veq2=XA124rG8urt3eVE3pcaUm0VdsV7Mxr9zjMpa7mjg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, May 8, 2019 at 2:22 PM
To: Randy Dunlap
Cc: Stephen Rothwell, Linux Next Mailing List, Linux Kernel Mailing
List, Rajat Jain, Platform Driver, Rajneesh Bhardwaj, Vishwanath
Somayaji

> On Wed, May 8, 2019 at 11:45 PM Randy Dunlap <rdunlap@infradead.org> wrot=
e:
> >
> > On 5/8/19 12:34 AM, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Changes since 20190507:
> > >
> > > The ubifs tree gained a conflict against Linus' tree.
> > >
> >
> > on i386 or x86_64:
>
> Thank you for report. Can you provide what is the config option for
> this module? I suppose it's built-in.
> Rajat, I will drop this from the repo, because I don't see it would
> have a chance to be tested in time.


OK, NP. Just to be sure I understand,

1) Please let me know if I should send in a fix (it would be
#include/linux/module.h and also add MODULE_LICENSE() I believe)?
2) Would this be lined up for next version though?

Thanks,
Rajat


>
>
> >
> >
> >   CC      drivers/platform/x86/intel_pmc_core_plat_drv.o
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:40:1: warning: data d=
efinition has no type or storage class [enabled by default]
> >  MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_platform_ids);
> >  ^
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:40:1: error: type def=
aults to =E2=80=98int=E2=80=99 in declaration of =E2=80=98MODULE_DEVICE_TAB=
LE=E2=80=99 [-Werror=3Dimplicit-int]
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:40:1: warning: parame=
ter names (without types) in function declaration [enabled by default]
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:59:1: warning: data d=
efinition has no type or storage class [enabled by default]
> >  module_init(pmc_core_platform_init);
> >  ^
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:59:1: error: type def=
aults to =E2=80=98int=E2=80=99 in declaration of =E2=80=98module_init=E2=80=
=99 [-Werror=3Dimplicit-int]
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:59:1: warning: parame=
ter names (without types) in function declaration [enabled by default]
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:60:1: warning: data d=
efinition has no type or storage class [enabled by default]
> >  module_exit(pmc_core_platform_exit);
> >  ^
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:60:1: error: type def=
aults to =E2=80=98int=E2=80=99 in declaration of =E2=80=98module_exit=E2=80=
=99 [-Werror=3Dimplicit-int]
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:60:1: warning: parame=
ter names (without types) in function declaration [enabled by default]
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:42:19: warning: =E2=
=80=98pmc_core_platform_init=E2=80=99 defined but not used [-Wunused-functi=
on]
> >  static int __init pmc_core_platform_init(void)
> >                    ^
> >
> > and
> > WARNING: modpost: missing MODULE_LICENSE() in drivers/platform/x86/inte=
l_pmc_core_plat_drv.o
> >
> > --
> > ~Randy
>
>
>
> --
> With Best Regards,
> Andy Shevchenko
