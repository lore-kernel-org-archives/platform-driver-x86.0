From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 1/1] platform/x86/intel_pmc_core: Convert to
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Wed, 6 Jul 2016 13:29:09 -0700
Message-ID: <20160706202909.GC66341@f23x64.localdomain>
References: <1467635988-64195-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <20160705134055.GA3400@rajaneesh-OptiPlex-9010>
 <1467731246.30123.483.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:58623 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751629AbcGFU3K (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 Jul 2016 16:29:10 -0400
Content-Disposition: inline
In-Reply-To: <1467731246.30123.483.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, platform-driver-x86@vger.kernel.org, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, linux-kernel@vger.kernel.org

On Tue, Jul 05, 2016 at 06:07:26PM +0300, Andy Shevchenko wrote:
> On Tue, 2016-07-05 at 19:10 +0530, Rajneesh Bhardwaj wrote:
> > On Mon, Jul 04, 2016 at 03:39:48PM +0300, Andy Shevchenko wrote:
> > > This patch does the following:
> > > - refactors code to use recently introduced
> > > DEFINE_DEBUGFS_ATTRIBUTE() macro
> > > - makes absence of DEBUG_FS non-fatal error
> > > 
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Reviewed-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> > 
> > Compiled & tested this on Ubuntu 16.04.
> > Kernel: 4.7.0-rc6
> > Hardware: Skylake based reference board
> 
> Thanks!
> 
> Darren, I think we may use Reviewed-and-tested-by tag.

Queued to for-next, thanks.

I reworded the commit message to be more in keeping with the subject line
format we use in this subsystem for changes to existing drivers and to include
the justification for the change. It now reads as follows, let me know if you
disagree with the change.

$ git log -1
commit df2294fb64285d2d793cf50c682ac4bfddf56c4c (HEAD -> refs/heads/for-next, refs/remotes/pdx86/for-next)
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   2016-07-04

    intel_pmc_core: Convert to DEFINE_DEBUGFS_ATTRIBUTE
    
    Refactor the code to use the recently introduced
    DEFINE_DEBUGFS_ATTRIBUTE() macro to eliminate boilerplate code.
    Make the absence of DEBUG_FS a non-fatal error.
    
    Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
    Reviewed-and-tested-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
    Signed-off-by: Darren Hart <dvhart@linux.intel.com>

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
