From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/5] intel_scu_ipc: fix error path by turning to devm_*
 / pcim_*
Date: Mon, 12 Oct 2015 11:00:42 +0300
Message-ID: <1444636842.8361.555.camel@linux.intel.com>
References: <1444399896-78599-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <20151011042136.GC2958@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:29542 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751895AbbJLIAq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Oct 2015 04:00:46 -0400
In-Reply-To: <20151011042136.GC2958@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org

On Sat, 2015-10-10 at 21:21 -0700, Darren Hart wrote:
> On Fri, Oct 09, 2015 at 05:11:32PM +0300, Andy Shevchenko wrote:
> > The error handling is broken right now since it leaves resources 
> > unfreed.
> > Convert the code to use managed resources to fix the error 
> > handling.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks Andriy,
> 
> Please always explicitly Cc LKML.
> 
> Is this hardware you able to test explicitly?

Yes, the patch series has been tested on Intel Medfield and Intel
Edison  (Merrifield) boards.

> 
> > ---
> >  drivers/platform/x86/intel_scu_ipc.c | 26 ++++++++----------------
> > --
> >  1 file changed, 8 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel_scu_ipc.c 
> > b/drivers/platform/x86/intel_scu_ipc.c
> > index 187d108..7148535 100644
> > --- a/drivers/platform/x86/intel_scu_ipc.c
> > +++ b/drivers/platform/x86/intel_scu_ipc.c
> 
> ...
> 
> > -	err = pci_request_regions(dev, "intel_scu_ipc");
> > +	err = pcim_iomap_regions(dev, 1 << 0, pci_name(dev));
> >  	if (err)
> >  		return err;
> >  
> > -	base = pci_resource_start(dev, 0);
> > -	if (!base)
> > -		return -ENOMEM;
> > -
> >  	init_completion(&ipcdev.cmd_complete);
> >  
> > -	if (request_irq(dev->irq, ioc, 0, "intel_scu_ipc", 
> > &ipcdev))
> > -		return -EBUSY;
> > +	err = devm_request_irq(&dev->dev, dev->irq, ioc, 0, 
> > "intel_scu_ipc",
> 
> You switched to using pci_name(dev) above, seems to me the same 
> rationale should
> apply here. Any reason not to use pci_name(dev) here instead of 
> "intel_scu_ipc"?
> 
> Thanks,
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
