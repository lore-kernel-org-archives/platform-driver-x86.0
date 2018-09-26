From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/6] platform/x86: acerhdf: new BIOS string, better
 modparam handling
Date: Wed, 26 Sep 2018 14:13:47 +0300
Message-ID: <CAHp75VecQvirM=XXFCHQ7qn_hh+ix2u2HFq9u+JOOzcmjeRrdQ@mail.gmail.com>
References: <20180921014421.30804-1-paul.gortmaker@windriver.com>
 <f401b6fed813afb86f5442c7707bf9fb@piie.net> <CAHp75Vd3L2BQX02NQVM=ZTMkv4WpM=AXXVMyG0Cyc0SjjUU55g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vd3L2BQX02NQVM=ZTMkv4WpM=AXXVMyG0Cyc0SjjUU55g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: peter@piie.net
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 26, 2018 at 2:09 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Sep 21, 2018 at 9:20 AM Peter Feuerer <peter@piie.net> wrote:
> >
> > Hi,
> >
> > 21. September 2018 03:45, "Paul Gortmaker" <paul.gortmaker@windriver.com> schrieb:
> >
> > > I came across this older netbook over the xmas holidays, and noticed the
> > > acerhdf driver wouldn't load. Turns out the BIOS string was too new,
> > > and not listed in the driver. There were module params for overrides,
> > > but I found their use isn't quite clear without reading the source.
> > >
> > > Here I clarify some of the module parameter usage, and then add the new
> > > BIOS string, so they won't be needed for this particular platform. Some
> > > probe code is also shifted out to be __init to reduce the driver size a
> > > bit. Further details can be found in the respective commit logs.
> > >
> > > Since it was months ago when I created these patches, I retested on top
> > > of tree to ensure things still work, as can be seen below.
> >
> > Thanks a lot for your work and this set of changes.  This improves quality.
> > I reviewed all 6 patches.
> >
> > Reviewed-by: Peter Feuerer <peter@piie.net>
> >
> > Please also add CC: Boris Petkov <bp@suse.de> for review.
>
> Shall I wait for Boris'  tags?

Anyway, all suggested changes look good to me, I go ahead and push
them to my review and testing queue.
If nothing happens during let's say a week, I will move them forward.

Thanks!

-- 
With Best Regards,
Andy Shevchenko
