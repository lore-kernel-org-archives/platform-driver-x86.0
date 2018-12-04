From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: convert to DEFINE_SHOW_ATTRIBUTE
Date: Tue, 4 Dec 2018 18:18:43 +0200
Message-ID: <CAHp75Vc7Xfqnid9WLvQMPPWcFnRG0T4ZoHweA6Q-1ypWn29J2Q@mail.gmail.com>
References: <20181201155229.8532-1-tiny.windzz@gmail.com> <CAHp75VdEbr9YfaCgHXNqScZC-KMobF2fU8rZb29nhZPBJvm2gg@mail.gmail.com>
 <CAEExFWvRFrS-ZTSkrS5Npe7g-rxtxfCfk+AyTz00Lx4oAWhQ_g@mail.gmail.com>
 <CAHp75VcSVEakAK4MeoG8zA7MaCWNoL2fOr48iFmxTsjbBpa5XA@mail.gmail.com> <CAEExFWtE7Yi8D+Dr=J7B3zqBRet0AX=ABHnUrJkZ2LO3aHdNeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEExFWtE7Yi8D+Dr=J7B3zqBRet0AX=ABHnUrJkZ2LO3aHdNeg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tiny.windzz@gmail.com
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, David Box <david.e.box@linux.intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Dec 4, 2018 at 5:30 PM Frank Lee <tiny.windzz@gmail.com> wrote:
> On Tue, Dec 4, 2018 at 8:40 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Dec 4, 2018 at 5:59 AM Frank Lee <tiny.windzz@gmail.com> wrote:
> > > On Tue, Dec 4, 2018 at 3:09 AM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Sat, Dec 1, 2018 at 5:52 PM Yangtao Li <tiny.windzz@gmail.com> wrote:
> > > > > Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

> > I like your patch, but...
> >
> > > > By some reason it's not applicable.
> > > > Please, rebase on top of our for-next branch, thanks!
> >
> > > For what reason?
> >
> > ...because I can't apply it, it fails with conflicts.
> >
> > >  I thought that for-next branch has not changed much.
> >
> > That's correct, it's updated only by approved patch series which is
> > not many _this_ cycle.
> I am confused about what you said.
> Because I pulled your .git down, there is no conflicts when apply it.......

linux(for-next)
$ git pw patch apply 10707735 -s
error: patch failed: drivers/platform/x86/intel_pmc_core.c:602
error: drivers/platform/x86/intel_pmc_core.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: platform/x86: convert to DEFINE_SHOW_ATTRIBUTE
Patch failed at 0001 platform/x86: convert to DEFINE_SHOW_ATTRIBUTE
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

-- 
With Best Regards,
Andy Shevchenko
