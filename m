From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH] platform/x86: convert to DEFINE_SHOW_ATTRIBUTE
Date: Wed, 5 Dec 2018 00:58:14 +0800
Message-ID: <CAEExFWso=uBKj4geVTr2zWOd74V1p5EWq=7r6AATSPh63MQ=mg@mail.gmail.com>
References: <20181201155229.8532-1-tiny.windzz@gmail.com> <CAHp75VdEbr9YfaCgHXNqScZC-KMobF2fU8rZb29nhZPBJvm2gg@mail.gmail.com>
 <CAEExFWvRFrS-ZTSkrS5Npe7g-rxtxfCfk+AyTz00Lx4oAWhQ_g@mail.gmail.com>
 <CAHp75VcSVEakAK4MeoG8zA7MaCWNoL2fOr48iFmxTsjbBpa5XA@mail.gmail.com>
 <CAEExFWtE7Yi8D+Dr=J7B3zqBRet0AX=ABHnUrJkZ2LO3aHdNeg@mail.gmail.com> <CAHp75Vc7Xfqnid9WLvQMPPWcFnRG0T4ZoHweA6Q-1ypWn29J2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vc7Xfqnid9WLvQMPPWcFnRG0T4ZoHweA6Q-1ypWn29J2Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: rajneesh.bhardwaj@intel.com, vishwanath.somayaji@intel.com, dvhart@infradead.org, andy@infradead.org, David Box <david.e.box@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Dec 5, 2018 at 12:18 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Dec 4, 2018 at 5:30 PM Frank Lee <tiny.windzz@gmail.com> wrote:
> > On Tue, Dec 4, 2018 at 8:40 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Dec 4, 2018 at 5:59 AM Frank Lee <tiny.windzz@gmail.com> wrote:
> > > > On Tue, Dec 4, 2018 at 3:09 AM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> > > > > On Sat, Dec 1, 2018 at 5:52 PM Yangtao Li <tiny.windzz@gmail.com> wrote:
> > > > > > Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
>
> > > I like your patch, but...
> > >
> > > > > By some reason it's not applicable.
> > > > > Please, rebase on top of our for-next branch, thanks!
> > >
> > > > For what reason?
> > >
> > > ...because I can't apply it, it fails with conflicts.
> > >
> > > >  I thought that for-next branch has not changed much.
> > >
> > > That's correct, it's updated only by approved patch series which is
> > > not many _this_ cycle.
> > I am confused about what you said.
> > Because I pulled your .git down, there is no conflicts when apply it.......
>
> linux(for-next)
> $ git pw patch apply 10707735 -s
> error: patch failed: drivers/platform/x86/intel_pmc_core.c:602
> error: drivers/platform/x86/intel_pmc_core.c: patch does not apply
> hint: Use 'git am --show-current-patch' to see the failed patch
> Applying: platform/x86: convert to DEFINE_SHOW_ATTRIBUTE
> Patch failed at 0001 platform/x86: convert to DEFINE_SHOW_ATTRIBUTE
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
$ git br -r
  origin/HEAD -> origin/master
  origin/fixes
  origin/for-next
  origin/master
  origin/review-andy
$ git remote set-branches --add origin for-next
$ git br -vv
* for-next 651022382c7f [origin/for-next] Linux 4.20-rc1
$ git apply ../../0001-platform-x86-convert-to-DEFINE_SHOW_ATTRIBUTE.patch
$ git st
On branch for-next
Your branch is up to date with 'origin/for-next'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   drivers/platform/x86/intel_pmc_core.c
        modified:   drivers/platform/x86/intel_telemetry_debugfs.c

no changes added to commit (use "git add" and/or "git commit -a")

Andy,I don't know why.
Is there a problem with my operation?

Thanks,
Yangtao
>
> --
> With Best Regards,
> Andy Shevchenko
