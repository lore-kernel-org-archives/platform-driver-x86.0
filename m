From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH V8 1/2] intel_pmc_ipc: update acpi resource structure for
 Punit
Date: Tue, 8 Dec 2015 15:28:10 -0800
Message-ID: <20151208232810.GA11972@malice.jf.intel.com>
References: <1449507305-51709-1-git-send-email-qipeng.zha@intel.com>
 <20151207234514.GA12897@malice.jf.intel.com>
 <1449580757.30729.52.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:34759 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751132AbbLHX2L (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Dec 2015 18:28:11 -0500
Content-Disposition: inline
In-Reply-To: <1449580757.30729.52.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Qipeng Zha <qipeng.zha@intel.com>, platform-driver-x86@vger.kernel.org

On Tue, Dec 08, 2015 at 03:19:17PM +0200, Andy Shevchenko wrote:
> On Mon, 2015-12-07 at 15:45 -0800, Darren Hart wrote:
> > On Tue, Dec 08, 2015 at 12:55:04AM +0800, Qipeng Zha wrote:
> > > BIOS restructure exported memory resources for Punit
> > > in acpi table, So update resources for Punit.
> > > 
> > > Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> > 
> > Thank you for the update Qipeng. I will review shortly.
> > 
> > +Andriy who originally raised the concern over the ACPI resource
> > assumptions in
> > the previous version. Andriy, this resource allocation looks to be a
> > substantial
> > improvement to me. Do you have any further concerns?
> 
> So, regarding to the second patch
> 
> 1. In excerpts like following
> 
> if (IS_ERR(addr)) {
> 		dev_err(&pdev->dev, "Failed to map resouce for BIOS
> DATA\n");
> 		return PTR_ERR(addr);
> 	}
> 
> No need to have an error message. Core already has something to print
> at that point.

Ah, so neither the DATA nor the INTER messages are necessary. I suppose this
means you can ignore my response on better wording.

-- 
Darren Hart
Intel Open Source Technology Center
