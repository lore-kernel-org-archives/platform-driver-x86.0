From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 07/12] platform/x86: intel_cht_int33fe: Provide software
 node for all components
Date: Mon, 18 Mar 2019 11:10:10 +0200
Message-ID: <20190318091010.GN7752@kuha.fi.intel.com>
References: <20190315165800.5058-1-heikki.krogerus@linux.intel.com>
 <20190315165800.5058-8-heikki.krogerus@linux.intel.com>
 <CAHp75VfMyyPEPg8VkmrbF6CeL0_+pPw+KrT5e+aGLsx0rwm=5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VfMyyPEPg8VkmrbF6CeL0_+pPw+KrT5e+aGLsx0rwm=5g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB <linux-usb@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Mar 17, 2019 at 10:36:03PM +0200, Andy Shevchenko wrote:
> On Fri, Mar 15, 2019 at 6:58 PM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > Software nodes provide two features that we will need later.
> > 1) Software nodes can have references to other software nodes.
> > 2) Software nodes can exist before a device entry is created.
> >
> 
> I don't see any problems with code (*), though I hope Hans will have
> chance to test this.
> One nit below.
> 
> (*) Means all patches touching PDx86 in this series
> 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  drivers/platform/x86/intel_cht_int33fe.c | 122 +++++++++++++++++------
> >  1 file changed, 92 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/platform/x86/intel_cht_int33fe.c b/drivers/platform/x86/intel_cht_int33fe.c
> > index 6fa3cced6f8e..26444d31945b 100644
> > --- a/drivers/platform/x86/intel_cht_int33fe.c
> > +++ b/drivers/platform/x86/intel_cht_int33fe.c
> > @@ -24,15 +24,25 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/slab.h>
> 
> > +#include <linux/pci.h>
> 
> Preserve the ordering, please.

OK.

thanks,

-- 
heikki
