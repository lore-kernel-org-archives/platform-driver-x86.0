From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH] platform/x86: intel_turbo_max_3: Remove restriction for
 HWP platforms
Date: Wed, 14 Feb 2018 15:47:49 -0800
Message-ID: <1518652069.3239.4.camel@linux.intel.com>
References: <20180212195047.23671-1-srinivas.pandruvada@linux.intel.com>
         <CAHp75VdUnw0NjcNDKzFp-hZWho4A8RV=9Xthz-foZ6wTaT+Ftg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdUnw0NjcNDKzFp-hZWho4A8RV=9Xthz-foZ6wTaT+Ftg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, arjan@linux.intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2018-02-14 at 21:29 +0200, Andy Shevchenko wrote:
> On Mon, Feb 12, 2018 at 9:50 PM, Srinivas Pandruvada
> <srinivas.pandruvada@linux.intel.com> wrote:
> > On systems supporting HWP (Hardware P-States) mode, we expected to
> > enumerate core priority via ACPI-CPPC tables. Unfortunately
> > deployment of
> > TURBO 3.0 didn't use this method to show core priority. So users
> > are not
> > able to utilize this feature in HWP mode.
> > 
> > So remove the loading restriction of this driver for HWP enabled
> > systems.
> > Even if there are some systems, which are providing the core
> > priority via
> > ACPI CPPC, this shouldn't cause any conflict as the source of
> > priority
> > definition is same.
> > 
> 
> Pushed to my review and testing queue, thanks!
> 
> P.S. Should it go to stable?
I want to avoid stable kernel for now.

Thanks,
Srinivas

> 
> > Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel
> > .com>
> > Reported-and-tested-and-reviewed-by: Arjan van de Ven <arjan@linux.
> > intel.com>
> > ---
> >  drivers/platform/x86/intel_turbo_max_3.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel_turbo_max_3.c
> > b/drivers/platform/x86/intel_turbo_max_3.c
> > index d4ea01805879..a6d5aa0c3c47 100644
> > --- a/drivers/platform/x86/intel_turbo_max_3.c
> > +++ b/drivers/platform/x86/intel_turbo_max_3.c
> > @@ -138,9 +138,6 @@ static int __init itmt_legacy_init(void)
> >         if (!id)
> >                 return -ENODEV;
> > 
> > -       if (boot_cpu_has(X86_FEATURE_HWP))
> > -               return -ENODEV;
> > -
> >         ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> >                                 "platform/x86/turbo_max_3:online",
> >                                 itmt_legacy_cpu_online, NULL);
> > --
> > 2.13.6
> > 
> 
> 
> 
