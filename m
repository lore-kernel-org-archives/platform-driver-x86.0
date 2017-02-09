From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_ipc: read s0ix residency API
Date: Thu, 9 Feb 2017 17:32:59 +0530
Message-ID: <20170209120259.GA25065@rajaneesh-OptiPlex-9010>
References: <1486386591-5739-1-git-send-email-shanth.murthy@intel.com>
 <20170209064717.GA24247@rajaneesh-OptiPlex-9010>
 <1486639986.2133.425.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:60489 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752643AbdBIOoq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Feb 2017 09:44:46 -0500
Content-Disposition: inline
In-Reply-To: <1486639986.2133.425.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Shanth Murthy <shanth.murthy@intel.com>, platform-driver-x86@vger.kernel.org, dvhart@infradead.org, qipeng.zha@intel.com, linux-kernel@vger.kernel.org

On Thu, Feb 09, 2017 at 01:33:06PM +0200, Andy Shevchenko wrote:
> On Thu, 2017-02-09 at 12:17 +0530, Rajneesh Bhardwaj wrote:
> > On Mon, Feb 06, 2017 at 05:09:51AM -0800, Shanth Murthy wrote:
> 
> > > Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
>  
> > > +static int intel_pmc_s0ix_counter_read(u64 *data)
> > > +{
> > > +	return -EINVAL;
> > > +}
> > > +
> > 
> > How about making it static inline and return -ENOSYS instead of
> > -EINVAL?
> 
> I'm not sure what's going on.
> Your SoB is in this patch and now it feels like you are reviewing this
> patch.
> 
> What should I do?

Sorry about the confusion. We will respin the patch and send V2.

> 
> -- 
> Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Intel Finland Oy

-- 
Best Regards,
Rajneesh
