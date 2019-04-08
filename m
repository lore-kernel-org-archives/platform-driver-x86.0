From: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v3 1/3] platform/x86: intel_pmc_core: Convert to a platform_driver
Date: Mon, 8 Apr 2019 11:47:17 -0700
Message-ID: <CACK8Z6ESTpukVLCoX56CvKuCrecj0gnb7RzB_xjOgiW=+WSBvg@mail.gmail.com>
References: <20190313222124.229371-1-rajatja@google.com> <20190405203558.19160-1-rajatja@google.com>
 <CAHp75Vd+_aFxomzPP_-8y5D1p0crbYo6R+=7fGGOKW86D2+=CQ@mail.gmail.com>
 <CACK8Z6HcqsRxRNGhN9sTRGp5kx=kVCTgqL_cVGy_Tznu=gL6jQ@mail.gmail.com> <CAHp75VfdE0upv1=HbNs35fcozTY6kXGpLt4tTAMVRDQZ90GHtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfdE0upv1=HbNs35fcozTY6kXGpLt4tTAMVRDQZ90GHtw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tomasz Wysocki <Wysocki@google.com>, Rafael J <rafael.j.wysocki@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Furquan Shaikh <furquan@google.com>, Evan Green <evgreen@google.com>, Rajat Jain <rajatxjain@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 8, 2019 at 11:44 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Apr 8, 2019 at 9:43 PM Rajat Jain <rajatja@google.com> wrote:
> > On Mon, Apr 8, 2019 at 9:51 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Fri, Apr 5, 2019 at 11:36 PM Rajat Jain <rajatja@google.com> wrote:
>
> > > > +       switch (boot_cpu_data.x86_model) {
> > >
> > > I didn't get why this should be boot CPU?
> > > Otherwise, leave the structure and leave the x86_match_cpu() call.
> >
> > I didn't quite understand the concern. The x86_match_cpu() also uses
> > the same boot_cpu_data that I've used, am I missing something?
>
> It's a detail of implementation, and instead of continue using nice
> helpers, you open coded the similar.
> Why?

OK, sure. I will put back the intel_pmc_core_ids structure and the
x86_match_cpu().

Thanks,

Rajat

>
> --
> With Best Regards,
> Andy Shevchenko
