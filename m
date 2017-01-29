From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH 1/3] intel_sgx: do not use BUG() in sgx_free_page()
Date: Sun, 29 Jan 2017 17:11:08 +0200
Message-ID: <20170129151108.kpyyf3oksfrxqqhs@intel.com>
References: <20170126212038.12809-1-jarkko.sakkinen@linux.intel.com>
 <20170126212038.12809-2-jarkko.sakkinen@linux.intel.com>
 <CAHp75Vf6ptzeEKXJdvBvE-3LFxRcmb6UL8r-9-XRsJE5UcM0fA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Vf6ptzeEKXJdvBvE-3LFxRcmb6UL8r-9-XRsJE5UcM0fA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: intel-sgx-kernel-dev@lists.01.org, Darren Hart <dvhart@infradead.org>, "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jan 27, 2017 at 05:45:03PM +0200, Andy Shevchenko wrote:
> On Thu, Jan 26, 2017 at 11:20 PM, Jarkko Sakkinen
> <jarkko.sakkinen@linux.intel.com> wrote:
> > EREMOVE fails on non-EPC page or when a SECS page with children is to be
> > removed. These do not happen if the driver is working correctly. Log the
> > error but do not crash the driver.
> >
> > Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > ---
> >  drivers/platform/x86/intel_sgx_page_cache.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/platform/x86/intel_sgx_page_cache.c b/drivers/platform/x86/intel_sgx_page_cache.c
> > index d073057..7f73ac7 100644
> > --- a/drivers/platform/x86/intel_sgx_page_cache.c
> > +++ b/drivers/platform/x86/intel_sgx_page_cache.c
> > @@ -551,10 +551,8 @@ void sgx_free_page(struct sgx_epc_page *entry,
> >                 ret = __eremove(epc);
> >                 sgx_put_epc_page(epc);
> >
> > -               if (ret) {
> > -                       pr_err("EREMOVE returned %d\n", ret);
> > -                       BUG();
> > -               }
> > +               if (ret)
> > +                       sgx_err(encl, "EREMOVE returned %d\n", ret);
> 
> Do you have something like critical level? For me seems reasonable to
> increase the level of message if BUG() was somehow related to actual
> situation.

Hmm... I think that would make sense. This could only happen when
the driver implementation is working incorrectly.

/Jarkko
