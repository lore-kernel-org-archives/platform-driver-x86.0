From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_ipc: read s0ix residency API
Date: Thu, 09 Feb 2017 13:33:06 +0200
Message-ID: <1486639986.2133.425.camel@linux.intel.com>
References: <1486386591-5739-1-git-send-email-shanth.murthy@intel.com>
         <20170209064717.GA24247@rajaneesh-OptiPlex-9010>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170209064717.GA24247@rajaneesh-OptiPlex-9010>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Shanth Murthy <shanth.murthy@intel.com>
Cc: platform-driver-x86@vger.kernel.org, dvhart@infradead.org, qipeng.zha@intel.com, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 2017-02-09 at 12:17 +0530, Rajneesh Bhardwaj wrote:
> On Mon, Feb 06, 2017 at 05:09:51AM -0800, Shanth Murthy wrote:

> > Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
 
> > +static int intel_pmc_s0ix_counter_read(u64 *data)
> > +{
> > +	return -EINVAL;
> > +}
> > +
> 
> How about making it static inline and return -ENOSYS instead of
> -EINVAL?

I'm not sure what's going on.
Your SoB is in this patch and now it feels like you are reviewing this
patch.

What should I do?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
