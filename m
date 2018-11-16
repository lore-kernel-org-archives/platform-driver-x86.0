From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 01/23] x86/sgx: Update MAINTAINERS
Date: Fri, 16 Nov 2018 17:07:14 +0200
Message-ID: <20181116150714.GA4244@linux.intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-2-jarkko.sakkinen@linux.intel.com>
 <20181116142248.GH20313@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181116142248.GH20313@zn.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org, dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 16, 2018 at 03:22:48PM +0100, Borislav Petkov wrote:
> On Fri, Nov 16, 2018 at 03:01:08AM +0200, Jarkko Sakkinen wrote:
> > Add the maintainer information for the SGX subsystem.
> > 
> > Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > ---
> >  MAINTAINERS | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0abecc528dac..aaf56b544858 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7676,6 +7676,13 @@ L:	linux-gpio@vger.kernel.org
> >  S:	Maintained
> >  F:	drivers/gpio/gpio-intel-mid.c
> >  
> > +INTEL SGX
> > +M:	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > +L:	linux-sgx@vger.kernel.org
> > +Q:	https://patchwork.kernel.org/project/intel-sgx/list/
> > +F:	drivers/platform/x86/intel_sgx/
> 
> Looking at your diffstat, this doesn't cover it all.
> 
> One example: arch/x86/kernel/cpu/intel_sgx.c
> 
> Also, was there any particular reasoning for calling the file
> intel_sgx.c instead of simply sgx.c ?

Ouch. There has been so much work in other patches that I've forgot
to update it :-( Sorry.

Yes, I think it could be renamed as sgx.c. Should the driver part be
also called as sgx.ko?

/Jarkko
