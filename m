From: Rajat Jain <rajatja@google.com>
Subject: Re: linux-next: Tree for May 8 (drivers/platform/x86/intel_pmc_core_plat_drv.c)
Date: Thu, 27 Jun 2019 20:37:33 -0700
Message-ID: <CACK8Z6FN62e041-dwri6S+-34wSOxSsTAPjRmSw44uVJhtRz-A@mail.gmail.com>
References: <20190508173403.6088d0db@canb.auug.org.au> <fa0e68b2-b839-b187-150c-13391c197b99@infradead.org>
 <CAHp75Veq2=XA124rG8urt3eVE3pcaUm0VdsV7Mxr9zjMpa7mjg@mail.gmail.com>
 <CACK8Z6F2v8nyUYcnOrkp81WfK2D2NEmK=pcWybn1annrtqRwew@mail.gmail.com> <CAHp75Ver=TNKxh8rdJs1xQYSLNsRLfEoFtcGG6hViug=cF6s_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Ver=TNKxh8rdJs1xQYSLNsRLfEoFtcGG6hViug=cF6s_g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy,

On Tue, Jun 11, 2019 at 12:06 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, May 9, 2019 at 2:15 AM Rajat Jain <rajatja@google.com> wrote:
>
> > OK, NP. Just to be sure I understand,
> >
> > 1) Please let me know if I should send in a fix (it would be
> > #include/linux/module.h and also add MODULE_LICENSE() I believe)?
> > 2) Would this be lined up for next version though?
>
> Resend a complete series based on the latest stuff we have in our
> for-next branch.

My apologies for the delay in resending. I just sent a v7 of the patch
that was dropped:
https://lkml.org/lkml/2019/6/27/1264

Only 2 changes from the v6:

#include <linux/module.h>

and

MODULE_LICENSE()

Thanks & Best Regards,

Rajat

>
> --
> With Best Regards,
> Andy Shevchenko
