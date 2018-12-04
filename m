From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH] platform/x86: convert to DEFINE_SHOW_ATTRIBUTE
Date: Tue, 4 Dec 2018 23:30:08 +0800
Message-ID: <CAEExFWtE7Yi8D+Dr=J7B3zqBRet0AX=ABHnUrJkZ2LO3aHdNeg@mail.gmail.com>
References: <20181201155229.8532-1-tiny.windzz@gmail.com> <CAHp75VdEbr9YfaCgHXNqScZC-KMobF2fU8rZb29nhZPBJvm2gg@mail.gmail.com>
 <CAEExFWvRFrS-ZTSkrS5Npe7g-rxtxfCfk+AyTz00Lx4oAWhQ_g@mail.gmail.com> <CAHp75VcSVEakAK4MeoG8zA7MaCWNoL2fOr48iFmxTsjbBpa5XA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcSVEakAK4MeoG8zA7MaCWNoL2fOr48iFmxTsjbBpa5XA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: rajneesh.bhardwaj@intel.com, vishwanath.somayaji@intel.com, dvhart@infradead.org, andy@infradead.org, David Box <david.e.box@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Dec 4, 2018 at 8:40 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Dec 4, 2018 at 5:59 AM Frank Lee <tiny.windzz@gmail.com> wrote:
> >
> > On Tue, Dec 4, 2018 at 3:09 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Sat, Dec 1, 2018 at 5:52 PM Yangtao Li <tiny.windzz@gmail.com> wrote:
> > > >
> > > > Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> > >
>
> I like your patch, but...
>
> > > By some reason it's not applicable.
> > > Please, rebase on top of our for-next branch, thanks!
>
> > For what reason?
>
> ...because I can't apply it, it fails with conflicts.
>
> >  I thought that for-next branch has not changed much.
>
> That's correct, it's updated only by approved patch series which is
> not many _this_ cycle.
I am confused about what you said.
Because I pulled your .git down, there is no conflicts when apply it.......

MBR,
Yangtao
>
> --
> With Best Regards,
> Andy Shevchenko
