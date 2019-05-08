From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: linux-next: Tree for May 8 (drivers/platform/x86/intel_pmc_core_plat_drv.c)
Date: Thu, 9 May 2019 00:21:54 +0300
Message-ID: <CAHp75Veq2=XA124rG8urt3eVE3pcaUm0VdsV7Mxr9zjMpa7mjg@mail.gmail.com>
References: <20190508173403.6088d0db@canb.auug.org.au> <fa0e68b2-b839-b187-150c-13391c197b99@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fa0e68b2-b839-b187-150c-13391c197b99@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajat Jain <rajatja@google.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, May 8, 2019 at 11:45 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 5/8/19 12:34 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20190507:
> >
> > The ubifs tree gained a conflict against Linus' tree.
> >
>
> on i386 or x86_64:

Thank you for report. Can you provide what is the config option for
this module? I suppose it's built-in.
Rajat, I will drop this from the repo, because I don't see it would
have a chance to be tested in time.

>
>
>   CC      drivers/platform/x86/intel_pmc_core_plat_drv.o
> ../drivers/platform/x86/intel_pmc_core_plat_drv.c:40:1: warning: data def=
inition has no type or storage class [enabled by default]
>  MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_platform_ids);
>  ^
> ../drivers/platform/x86/intel_pmc_core_plat_drv.c:40:1: error: type defau=
lts to =E2=80=98int=E2=80=99 in declaration of =E2=80=98MODULE_DEVICE_TABLE=
=E2=80=99 [-Werror=3Dimplicit-int]
> ../drivers/platform/x86/intel_pmc_core_plat_drv.c:40:1: warning: paramete=
r names (without types) in function declaration [enabled by default]
> ../drivers/platform/x86/intel_pmc_core_plat_drv.c:59:1: warning: data def=
inition has no type or storage class [enabled by default]
>  module_init(pmc_core_platform_init);
>  ^
> ../drivers/platform/x86/intel_pmc_core_plat_drv.c:59:1: error: type defau=
lts to =E2=80=98int=E2=80=99 in declaration of =E2=80=98module_init=E2=80=
=99 [-Werror=3Dimplicit-int]
> ../drivers/platform/x86/intel_pmc_core_plat_drv.c:59:1: warning: paramete=
r names (without types) in function declaration [enabled by default]
> ../drivers/platform/x86/intel_pmc_core_plat_drv.c:60:1: warning: data def=
inition has no type or storage class [enabled by default]
>  module_exit(pmc_core_platform_exit);
>  ^
> ../drivers/platform/x86/intel_pmc_core_plat_drv.c:60:1: error: type defau=
lts to =E2=80=98int=E2=80=99 in declaration of =E2=80=98module_exit=E2=80=
=99 [-Werror=3Dimplicit-int]
> ../drivers/platform/x86/intel_pmc_core_plat_drv.c:60:1: warning: paramete=
r names (without types) in function declaration [enabled by default]
> ../drivers/platform/x86/intel_pmc_core_plat_drv.c:42:19: warning: =E2=80=
=98pmc_core_platform_init=E2=80=99 defined but not used [-Wunused-function]
>  static int __init pmc_core_platform_init(void)
>                    ^
>
> and
> WARNING: modpost: missing MODULE_LICENSE() in drivers/platform/x86/intel_=
pmc_core_plat_drv.o
>
> --
> ~Randy



--=20
With Best Regards,
Andy Shevchenko
